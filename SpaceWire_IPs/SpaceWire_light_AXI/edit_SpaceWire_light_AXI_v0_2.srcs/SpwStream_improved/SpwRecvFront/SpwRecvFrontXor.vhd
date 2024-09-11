--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRecvFrontXor.vhd
--!
--! \brief        SpaceWire receiver front-end with clock recovery (only XOR gate).
--!               Based on spwrecvfront_fast.vhd of SpaceWire light IP.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 24.01.2017
--! \date         Updated: 03.04.2019
--! \version      V 1.02
--
-- Unit         : SpwRecvFront (RTL|STR) (entity, architecture)
-- File version : $Revision: 112 $
--
-- Limitations  :
--
-- Related to RXCHUNK:
-- The module works for RXCHUNK = 1,2 4 and 6. 3 and 5 are not feasible because
-- with the clock recovery method the incoming bits are received in pairs.
--
-- Related to lost bits at the beginning of input stream :
-- There is one lost bit when the RXRSTLOGIC(SpwReset) unit is set to 1 clk delay (min value).
-- In the received buffer data (resrx_seq.bufdata), it is added one '0' bit
-- at the beginning of the stream. So, if the following stream is sent:
--
-- first bit  -> 01|11|01|00|01|11|01
--
-- The following bits are forwarded to the SpwRecv unit:
-- first bit  -> 00|01|11|01|00|01|11|01|0
--    extra bits-^^ ^--bit lost (always 0)
--
-- Errors       : None known
--
-- Copyright 2009-2013 Joris van Rantwijk
-- Copyright 2021 IWF
-- 
-- This file is part of SpaceWire Light.
--
-- SpaceWire Light is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- SpaceWire Light is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with SpaceWire Light.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------
-- History
--
-- $Log$
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
--! standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;
--! IEEE standard numeric package
use ieee.numeric_std.all;

--! work library
library SPWIP;
--! SPWIP SpwXmit_fast implementation.
use SPWIP.SpwXmit_fast_pkg.all;
--! SPWIP SpwStream implementation.
use SPWIP.SpwStream_pkg.all;
--! SPWIP mapped module definitions.
use SPWIP.ModuleMap_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwRecvFront
--! \brief        SpwRecvFront - SpaceWire receiver front-end with clock
--!               recovery.
--! \details      This unit receives bits from the Spw data and strobe signals
--!               using the recovered clock from these signals. 
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.08
-- Updates      :
--------------------------------------------------------------------------------
entity SpwRecvFront is 
   generic ( 
      RXCHUNK : integer range 1 to 6  --! maximum number of bits received per system clock.
   );
   port ( 
      SPW_SI   : in std_logic;                              --! Strobe In SpaceWire signal.
      SPW_DI   : in std_logic;                              --! Data In SpaceWire signal.
      CLK      : in std_logic;                              --! unit clock.
      RXCLK_IN : in std_logic;                              --! Recovered clock in (after clock buffer).
      RST_N    : in std_logic;                              --! unit reset (active-low).
      RXEN     : in std_logic;                              --! High to enable receiver; low to disable and reset receiver.
      INACT    : out std_logic;                             --! High if there has been recent activity on the input lines.
      INBVALID : out std_logic;                             --! High if inbits contains a valid group of received bits.
      INBITS   : out std_logic_vector (RXCHUNK-1 downto 0)  --! Received bits.
   );
end entity SpwRecvFront;

--------------------------------------------------------------------------------
-- Architecture SpwRecvFront_rtl
--! \brief  SpaceWire receiver front-end with clock recovery RTL implementation.
--!
--! \cdc resrx_seq.headptr_gray -> syncsys.headptr_gray synchronize header (write) pointer to system clock (25 MHz).
--! \cdc rxcnt_ddr_gray -> syncsys.rxcnt_ddr_gray synchronize bit counter to system clock (25 MHz).
--! \cdc resrx_seq.bufdata -> s_bufdout synchronize received data to system clock (25 MHz).
--------------------------------------------------------------------------------
architecture SpwRecvFront_rtl of SpwRecvFront is 
   -----------------------------------------------------------------------------
   -- SpwRecvFront_definitions - It contains the constants, types and subtypes used in the SpwRecvFront unit.
   -----------------------------------------------------------------------------
   --! MEMWIDTH array type is the width of bit groups in cyclic buffer.
   type memwidth_array_type is array(1 to 6) of integer;
   --! chunk to memwidth mapper.
   constant CHUNK_TO_MEMWIDTH : memwidth_array_type := ( 2, 2, 3, 4, 5, 6 );
   --! memwidth for fifo.
   constant MEMWIDTH : integer := CHUNK_TO_MEMWIDTH(RXCHUNK);
   -----------------------------------------------------------------------------
   -- Type spwrecvfront_regs_type
   --! \brief        Registers in the system clock domain.
   --! \details      The type contains the registers in the system clock domain.
   -----------------------------------------------------------------------------
   type spwrecvfront_regs_type is record 
      -- Data path from buffer to output
      tailptr      : std_logic_vector (2 downto 0); --! Tail pointer (addr) for read FIFO.
      tailptr_gray : std_logic_vector (2 downto 0); --! Gray representation of tail pointer.
      inbvalid     : std_ulogic; --! High if INBITS contains valid bits.
      bufdout      : std_logic_vector (MEMWIDTH-1 downto 0); --! registered data from cyclic buffer.
      -- Split 2-bit groups if RXCHUNK=1
      splitbit     : std_ulogic; --! Split bit of data from FIFO.
      splitinx     : std_ulogic; --! Split signal to increment tail pointer.
      splitvalid   : std_ulogic; --! Split valid signal.
      -- activity detection
      bitcntp_gray : std_logic_vector (3 downto 0); --! bit counter in sysclk domain.
      inact        : std_ulogic; --! High if there has been recent activity on the input lines.
   end record spwrecvfront_regs_type;
   -----------------------------------------------------------------------------
   -- Type rxregs_type
   --! \brief        Registers in the RXCLK_IN domain.
   --! \details      The type contains the registers in the RXCLK_IN domain.
   -----------------------------------------------------------------------------
   type rxregs_type is record 
      -- Cyclic buffer access
      bufdata      : std_logic_vector (MEMWIDTH-1 downto 0); --! data for FIFO grouped in chunks.
      bufwrite     : std_ulogic; --! write enable for FIFO.
      wr_cnt       : std_logic_vector (1 downto 0); --! FIFO write enable counter.
      headptr      : std_logic_vector (2 downto 0); --! Head pointer (addr) for write FIFO.
      headptr_gray : std_logic_vector (2 downto 0); --! Gray representation of head pointer.
   end record rxregs_type;
   -----------------------------------------------------------------------------
   -- Type spwrecvfront_syncsys_type
   --! \brief        Registers synchronized to the system clock domain.
   --! \details      The type contains the registers synchronized to the system 
   --!               clock domain.
   -----------------------------------------------------------------------------
   type spwrecvfront_syncsys_type is record 
      headptr_gray   : std_logic_vector (2 downto 0); --! head pointer in FIFO.
      rxcnt_ddr_gray : std_logic_vector (3 downto 0); --! activity detection counter.
   end record spwrecvfront_syncsys_type;
   -----------------------------------------------------------------------------
   -- SpwRecvFront_regs_reset - reset value for record type registers.
   -----------------------------------------------------------------------------
   --! reset value for rxclk domain registers.
   constant RXREGS_RESET : rxregs_type := ( bufdata => (others => '0'), bufwrite => '0',
       wr_cnt => (others => '0'), headptr => (others => '0'),
       headptr_gray => (others => '0') );
   --! reset value for system clock registers.
   constant REGS_RESET : spwrecvfront_regs_type := ( tailptr => (others => '0'),
       tailptr_gray => (others => '0'), inbvalid => '0', bufdout => (others => '0'),
       splitbit => '0', splitinx => '0', splitvalid => '0', bitcntp_gray => "0001",
       inact => '0' );
   -----------------------------------------------------------------------------
   signal rx_rst_n       : std_logic;                              --! synchronized reset signal for the RXCLK_IN domain of RXEN.
   -- Registers in RXCLK_IN domain ---------------------------------------------
   signal ff_spw_di          : std_ulogic;                             --!!! buffer for the SPW_DI signal itself.
   signal ff_r_di1       : std_ulogic;                             --! first FF for SPW_DI (rising edge).
   signal ff_r_di2r      : std_ulogic;                             --! 2nd FF for SPW_DI (rising-rising). This bit is received last.
   signal ff_f_di1       : std_ulogic;                             --! first FF for SPW_DI (falling edge).
   signal ff_r_di2f      : std_ulogic;                             --! 2nd FF for SPW_DI (falling-rising). This bit is received first.
   signal resrx_seq      : rxregs_type;                            --! rxclk registers result sequential.
   signal resrx_com      : rxregs_type;                            --! txclk registers result combinatorial.
   -- Registers in system clock domain ----------------------------------------
   signal res_seq        : spwrecvfront_regs_type;                 --! system clock registers result sequential.
   signal res_com        : spwrecvfront_regs_type;                 --! system clock registers result combinatorial.
   signal syncsys        : spwrecvfront_syncsys_type;              --! synchronized registers to system clock domain.
   signal s_bufdout      : std_logic_vector (MEMWIDTH-1 downto 0); --! Output data from cyclic buffer.
   -----------------------------------------------------------------------------
   -- signals for input bit counter
   -----------------------------------------------------------------------------
   signal rxcnt_r        : std_logic_vector (3 downto 0);          --! bit counter register on rx_clk rising edge.
   signal rxcnt_f        : std_logic_vector (3 downto 0);          --! bit counter register on rx_clk falling edge.
   signal rxcnt_rbuf     : std_logic_vector (3 downto 0);          --! buffered bit counter register on rx_clk rising edge.
   signal rxcnt_fbuf     : std_logic_vector (3 downto 0);          --! buffered bit counter register on rx_clk falling edge.
   signal rxcnt_ddr      : std_logic_vector (3 downto 0);          --! bit counter double data rate.
   signal rxcnt_ddr_gray : std_logic_vector (3 downto 0);          --! bit counter double data rate (in gray coding).
   -----------------------------------------------------------------------------
   -- TODO: define PLACEMENT CONSTRAINTS TO PLACE THE FIRST CAPTURE FFS NEAR TO THE IO PINS
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   -- Function BinToGray
   --! \brief        BinToGray  - Convert binary to gray coding.
   --! \details      Given a binary vector, the function converts it to gray 
   --!               coding.
   --! \param        BINVECT     The input binary vector.
   --! \return       The converted gray vector.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   function BinToGray (BINVECT : std_logic_vector)
   return std_logic_vector is
      variable grayvalue : std_logic_vector(BINVECT'range);
   begin
      grayvalue(BINVECT'high) := BINVECT(BINVECT'high);
      gray_loop : for i in BINVECT'high-1 downto BINVECT'low  loop
         grayvalue(i) := BINVECT(i) xor BINVECT(i+1);
      end loop;
      return grayvalue;
   end function BinToGray;
begin
   -----------------------------------------------------------------------------
   -- DELAY BUFFERS
   BUF: for i in 0 to rxcnt_r'LENGTH-1 generate       -- buffers in counter output
      DriverR: Driver port map (rxcnt_r(i), rxcnt_rbuf(i));
      DriverF: Driver port map (rxcnt_f(i), rxcnt_fbuf(i));
   end generate BUF;
   --!!! buffer the SPW_DI signal
   --SPW_DI delay
   SPW_DI_BUF: Driver
   port map(SPW_DI, ff_spw_di);
   --ff_spw_di <= SPW_DI;
   -----------------------------------------------------------------------------
   -- COUNTER MUX
   rxcnt_ddr <= rxcnt_fbuf when RXCLK_IN = '1' else rxcnt_rbuf;
   rxcnt_ddr_gray <= BinToGray(rxcnt_ddr);
   -- STRUCTURE
   SYNCSYSHEADPTR0: SyncDff
   port map(resrx_seq.headptr_gray(0), clk, RST_N, syncsys.headptr_gray(0));

   SYNCSYSHEADPTR1: SyncDff
   port map(resrx_seq.headptr_gray(1), clk, RST_N, syncsys.headptr_gray(1));

   SYNCSYSHEADPTR2: SyncDff
   port map(resrx_seq.headptr_gray(2), clk, RST_N, syncsys.headptr_gray(2));

   SYNCSYSBITCNT0: SyncDff
   port map(rxcnt_ddr_gray(0), clk, RST_N, syncsys.rxcnt_ddr_gray(0));

   SYNCSYSBITCNT1: SyncDff
   port map(rxcnt_ddr_gray(1), clk, RST_N, syncsys.rxcnt_ddr_gray(1));

   SYNCSYSBITCNT2: SyncDff
   port map(rxcnt_ddr_gray(2), clk, RST_N, syncsys.rxcnt_ddr_gray(2));

   SYNCSYSBITCNT3: SyncDff
   port map(rxcnt_ddr_gray(3), clk, RST_N, syncsys.rxcnt_ddr_gray(3));

   RXRSTLOGIC: SpwReset
   generic map(1)
   port map(RXCLK_IN, RXEN, rx_rst_n);

   FIFOMEM: SpwRam
   generic map(3, MEMWIDTH)
   port map(res_seq.tailptr, '1', resrx_seq.headptr, resrx_seq.bufdata, resrx_seq.bufwrite,
       CLK, RXCLK_IN, RST_N, rx_rst_n, s_bufdout);
   -----------------------------------------------------------------------------
   -- Process bitCounter
   --! \brief        Counter incremented on each edge of RXCLK.
   --! \details      The counter is implemented using two counters. One counter 
   --!               on each RXCLK edge. Then the output is multiplexed using 
   --!               the same clock signal as selector.
   --! - Sensitive To
   --! \arg \ref     RXCLK_IN - recovery clock (rising and falling edge).
   --! \arg \ref     rx_rst_n - synd reset signal to RXCLK_IN (active-low).
   -----------------------------------------------------------------------------
   bitCounter: process( RXCLK_IN, rx_rst_n )
   begin
      -- originally: if-elseif-elseif
      if ( rx_rst_n = '0' ) then
         rxcnt_r <= "0001";
         rxcnt_f <= "0000";
      else
          -- changed to else with seperate if inside, which is equ to else if
          if rising_edge(RXCLK_IN) then
             rxcnt_r <= std_logic_vector(unsigned(rxcnt_r) + 2);
          end if;
          -- also added two seperate cases for each edge, both cannot appear simultaneously
          if falling_edge(RXCLK_IN) then
             rxcnt_f <= std_logic_vector(unsigned(rxcnt_f) + 2);
          end if; -- rx_rst_n
      end if;
   end process bitCounter;
   

   -----------------------------------------------------------------------------
   -- Process updateSpwRegs
   --! \brief        capture flip-flops after SR flip-flops.
   --! \details      Sequential process to update the flip-flops on rising and 
   --!               falling edge of recovered clock.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     RXCLK_IN - recovery clock (rising and falling edge).
   --! \arg \ref     rx_rst_n - synd reset signal to RXCLK_IN (active-low).
   -----------------------------------------------------------------------------
   updateSpwRegs: process( RXCLK_IN, rx_rst_n )
   begin
      if ( rx_rst_n = '0' ) then
         ff_r_di1  <= '0';
         ff_r_di2r <= '0';
         ff_r_di2f <= '0';
      elsif ( rising_edge(RXCLK_IN) ) then
         ff_r_di1  <= ff_spw_di;
         ff_r_di2r <= ff_r_di1;
         ff_r_di2f <= ff_f_di1;
      end if; -- rising_edge(RXCLK_IN)
      if ( rx_rst_n = '0' ) then
         ff_f_di1  <= '0';
      elsif ( falling_edge(RXCLK_IN) ) then
         ff_f_di1  <= ff_spw_di;
         
      end if; -- falling_edge(RXCLK_IN)
   end process updateSpwRegs;

   -----------------------------------------------------------------------------
   -- Process setRegisters
   --! \brief        Combinatorial process of SpwRecvFront unit.
   --! \details      Combinatorial process to set the registers of RXCLK and 
   --!               SYSCLK domains.
   --!               [combinatorial process]
   --! - Sensitive To
   --! \arg \ref     res_seq   - Registers in system clock domain (level).
   --! \arg \ref     resrx_seq - Registers in recovered clock domain (level).
   --! \arg \ref     syncsys   - Registers sync to the system clock domain (level).
   --! \arg \ref     s_bufdout - Data out of FIFO (level).
   --! \arg \ref     ff_r_di2r - 2nd FF of SPW Data in (rising-rising).
   --! \arg \ref     ff_r_di2f - 2nd FF of SPW Data in (falling-rising).
   --! \arg \ref     RXEN      - receiver enable (level)
   -----------------------------------------------------------------------------
   setRegisters: process( res_seq, resrx_seq, syncsys, s_bufdout, ff_r_di2r, ff_r_di2f, RXEN )
      variable vres     : spwrecvfront_regs_type;
      variable vresrx   : rxregs_type;
      variable bitsrx   : std_logic_vector(1 downto 0);
   begin
      vres      := res_seq;
      vresrx    := resrx_seq;
      bitsrx(1) := ff_r_di2f;
      bitsrx(0) := ff_r_di2r;
      ----------- RECOVERED CLOCK DOMAIN ---------------------------------------
      ------------------------
      -- shift incoming bits into register
      if ( RXCHUNK = 1 or RXCHUNK = 2 ) then
         vresrx.bufdata := bitsrx;
      else
         vresrx.bufdata := bitsrx & resrx_seq.bufdata(MEMWIDTH-1 downto 2);
      end if; -- RXCHUNK
      -- countdown nr of needed bits (one-hot counter)
      if ( RXCHUNK = 1 or RXCHUNK = 2 ) then
         vresrx.bufwrite := '1';
      elsif ( RXCHUNK = 4 ) then
         vresrx.bufwrite := not resrx_seq.bufwrite;
      elsif ( RXCHUNK = 6 ) then
         if ( resrx_seq.wr_cnt = "10" ) then
            vresrx.wr_cnt   := (others => '0');
            vresrx.bufwrite := '1';
         else
            vresrx.wr_cnt   := std_logic_vector(unsigned(resrx_seq.wr_cnt) + 1);
            vresrx.bufwrite := '0';
         end if; -- resrx_seq.wr_cnt
      end if; -- RXCHUNK
      ------------------------
      -- Increment head pointer.
      if ( resrx_seq.bufwrite = '1' ) then
         vresrx.headptr := std_logic_vector(unsigned(resrx_seq.headptr) + 1);
      end if; -- resrx_seq.bufwrite
      vresrx.headptr_gray := BinToGray(vresrx.headptr);
      ----------- SYSTEM CLOCK DOMAIN ------------------------------------------
      -- register the output of FIFO
      vres.bufdout := s_bufdout;
      
      -- Compare tailptr to headptr to decide whether there is new data.
      -- If the values are equal, we are about to read a location which has
      -- not yet been written by the RXCLK_IN domain.
      if ( res_seq.tailptr_gray = syncsys.headptr_gray ) then
         -- No more data in cyclic buffer.
         vres.inbvalid  := '0';
      else
         -- Reading valid data from cyclic buffer.
         vres.inbvalid  := '1';
         -- Increment tail pointer.
         if ( RXCHUNK /= 1 ) then
            vres.tailptr   := std_logic_vector(unsigned(res_seq.tailptr) + 1);
         end if; -- RXCHUNK
      end if; -- res_seq.tailptr_gray
      -- If RXCHUNK=1, split 2-bit groups into separate bits.
      if ( RXCHUNK = 1 ) then
         -- Select one of the two bits.
         if ( res_seq.splitinx = '0' ) then
            vres.splitbit  := res_seq.bufdout(0);
         else
            vres.splitbit  := res_seq.bufdout(1);
         end if; -- res_seq.splitinx
         -- Indicate valid bit.
         vres.splitvalid := res_seq.inbvalid;
         -- Increment tail pointer.
         if ( res_seq.inbvalid = '1' ) then
            vres.splitinx   := not res_seq.splitinx;
            if ( res_seq.splitinx = '0' ) then
               vres.tailptr := std_logic_vector(unsigned(res_seq.tailptr) + 1);
            end if; -- res_seq.splitinx
         end if; -- res_seq.inbvalid
      end if; -- RXCHUNK
      vres.tailptr_gray := BinToGray(vres.tailptr);
      -- Activity detection.
      vres.bitcntp_gray  := syncsys.rxcnt_ddr_gray;
      if ( res_seq.bitcntp_gray = syncsys.rxcnt_ddr_gray ) then
         vres.inact := '0';
      else
         vres.inact := '1';
      end if; -- res_seq.bitcntp_gray

      -- Drive outputs
      INACT   <= res_seq.inact;
      if ( RXCHUNK = 1 ) then
         INBVALID    <= res_seq.splitvalid;
         INBITS(0)   <= res_seq.splitbit;
      else
         INBVALID    <= res_seq.inbvalid;
         INBITS      <= res_seq.bufdout;
      end if; -- RXCHUNK
      
      -- Reset when RXEN = 0
      if RXEN = '0' then
         vres := REGS_RESET;
      end if; -- RXEN
      
      -- update registers

      resrx_com     <= vresrx;
      res_com       <= vres;
   end process setRegisters;

   -----------------------------------------------------------------------------
   -- Process updateRxRegs
   --! \brief        Sequential process for RXCLK domain registers.
   --! \details      Sequential process to update the flip-flops on rising edge 
   --!               of recovered clock.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     RXCLK_IN - recovery clock (rising edge).
   --! \arg \ref     rx_rst_n - reset from RXCLK domain (active-low).
   -----------------------------------------------------------------------------
   updateRxRegs: process( RXCLK_IN, rx_rst_n )
   begin
      if ( rx_rst_n = '0' ) then
         resrx_seq <= RXREGS_RESET;
      elsif ( rising_edge(RXCLK_IN) ) then
         resrx_seq <= resrx_com;
      end if; -- rising_edge(RXCLK_IN)
   end process updateRxRegs;

   -----------------------------------------------------------------------------
   -- Process updateSysRegs
   --! \brief        Sequential process for system clock registers.
   --! \details      Sequential process to update the flip-flops on rising edge 
   --!               of system clock.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK   - system clock (rising edge).
   --! \arg \ref     RST_N - unit reset (active-low).
   -----------------------------------------------------------------------------
   updateSysRegs: process( CLK, RST_N )
   begin
      if ( RST_N = '0' ) then
         res_seq <= REGS_RESET;
      elsif ( rising_edge(CLK) ) then
         res_seq <= res_com;
      end if; -- rising_edge(CLK)
   end process updateSysRegs;

end architecture SpwRecvFront_rtl;

--------------------------------------------------------------------------------
-- end SpwRecvFrontXor.vhd
--------------------------------------------------------------------------------
