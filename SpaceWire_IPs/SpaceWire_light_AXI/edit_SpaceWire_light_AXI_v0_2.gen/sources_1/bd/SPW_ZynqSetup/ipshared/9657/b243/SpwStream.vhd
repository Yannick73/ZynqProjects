--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwStream.vhd
--!
--! \brief        implementation of the SpwStream unit
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.06.2010
--! \date         Updated: 03.09.2020
--! \version      V 1.03
--
-- Unit         : SpwStream (RTL|STR) (entity, architecture)
-- File version : $Revision: 137 $
--
-- Limitations  : 
--
-- Related to RXCHUNK:
-- The module works for RXCHUNK = 1,2 4 and 6. 3 and 5 are not feasible because
-- with the clock recovery method the incoming bits are received in pairs.
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
--  Adapted to IWF coding guidelines by Jorge Tonfat (JTO) jorge.tonfat@oeaw.ac.at
--
--  SpaceWire core with character-stream interface.
--
--  This entity provides a SpaceWire core with a character-stream interface.
--  The interface provides means for connection initiation, sending and
--  receiving of N-Chars and TimeCodes, and error reporting.
--
--  This entity instantiates spwlink, spwrecv, spwxmit and one of the
--  spwrecvfront implementations. It also implements a receive FIFO and
--  a transmit FIFO.
--
--  The SpaceWire standard requires that each transceiver use an initial
--  signalling rate of 10 Mbit/s. This implies that the system clock frequency
--  must be a multiple of 10 MHz. See the manual for further details on
--  bitrates and clocking.
--
--
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
--! SPWIP SpwRecvFront implementation.
use SPWIP.SpwRecvFront_pkg.all;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;
--! block RAM
-- use SPWIP.SpwBlockRam_pkg.all;
--use SPWIP.SpwStream_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwStream
--! \brief        SpwStream - SpwStream is the top module for the Spacewire 
--!               protocol IP.
--! \details      The interface provides means for connection initiation, 
--!               sending and receiving of N-Chars and TimeCodes, and error 
--!               reporting. It also implements a receive FIFO and a transmit 
--!               FIFO.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : V 1.01 JTO 28.01.2019 - update for RX and TX FIFO pointers, flags, room/depth logic
--                V 1.02 JTO 05.03.2019 - update logic for txfifo_rvalid and rxfifo_rvalid due to remove of output register in SpwRam
--                V 1.03 JTO 03.09.2020 - update logic to improve code coverage in integration test
--------------------------------------------------------------------------------
entity SpwStream is 
--   -- added missing generics
   generic (
      SYSFREQ           : real;                                         -- IP core clock
      TXCLKFREQ         : real;                                         -- transmit clock
      RXIMPL            : spw_implementation_type   := impl_recovclk;   -- receiver using core clock
      TXIMPL            : spw_implementation_type   := impl_fast;       -- receiver using core clock
      RXCHUNK           : integer range 1 to 6      := 4;               -- 1 in case of impl_generic
      RXFIFOSIZE_BITS   : integer range 6 to 16     := 14;              -- 11 bit RXFIFO adress space = 2kB FIFO
      TXFIFOSIZE_BITS   : integer range 2 to 16     := 14               -- 11 bit TXFIFO adress space = 2kB FIFO
   ); 
   port ( 
      AUTOSTART   : in std_logic;                      --! Enables automatic link start on receipt of a NULL character.
      LINKSTART   : in std_logic;                      --! Enables link start once the Ready state is reached.
      LINKDIS     : in std_logic;                      --! Do not start link (overrides LINKSTART and AUTOSTART) and/or disconnect a running link.
      TXDIVCNT    : in std_logic_vector (7 downto 0);  --! Scaling factor minus 1, used to scale the transmit base clock into the transmission bit rate.
      TICK_IN     : in std_logic;                      --! High for one clock cycle to request transmission of a TimeCode.
      CTRL_IN     : in std_logic_vector (1 downto 0);  --! Control bits of the TimeCode to be sent.
      TIME_IN     : in std_logic_vector (5 downto 0);  --! Counter value of the TimeCode to be sent.
      TXWRITE     : in std_logic;                      --! Pulled high by the application to write an N-Char to the transmit queue.
      TXFLAG      : in std_logic;                      --! Control flag to be sent with the next N_Char.
      TXDATA      : in std_logic_vector (7 downto 0);  --! Byte to be sent, or X"00" for EOP or X"01" for EEP.
      RXREAD      : in std_logic;                      --! Pulled high by the application to accept a received character.
      SPW_DI      : in std_logic;                      --! Data In SpaceWire signal.
      SPW_SI      : in std_logic;                      --! Strobe In SpaceWire signal.
--      RXCLK_PIN   : in std_logic;                      --! Added: Manual clock in generated from Di xor Si externally
      CLK         : in std_logic;                      --! System clock.
      TXCLK       : in std_logic;                      --! Transmit clock (only for impl_fast).
      ARST_N      : in std_logic;                      --! asynchronous reset (active-low).
      CNT_RST     : in std_logic;                      --! Counters reset.
      TXRDY       : out std_logic;                     --! High if the entity is ready to accept an N-Char for transmission.
      TXHALFF     : out std_logic;                     --! High if the transmission queue is at least half full.
      TICK_OUT    : out std_logic;                     --! High for one clock cycle if a TimeCode was just received.
      CTRL_OUT    : out std_logic_vector (1 downto 0); --! Control bits of the last received TimeCode.
      TIME_OUT    : out std_logic_vector (5 downto 0); --! Counter value of the last received TimeCode.
      RXVALID     : out std_logic;                     --! High if "RXFLAG" and "RXDATA" contain valid data.
      RXHALFF     : out std_logic;                     --! High if the receive FIFO is at least half full.
      RXFLAG      : out std_logic;                     --! High if the rx character is EOP or EEP; low if the rx character is a data byte.
      RXDATA      : out std_logic_vector (7 downto 0); --! Received byte, or X"00" for EOP or X"01" for EEP.
      STARTED     : out std_logic;                     --! High if the link state machine is currently in the Started state.
      CONNECTING  : out std_logic;                     --! High if the link state machine is currently in the Connecting state.
      RUNNING     : out std_logic;                     --! High if the link state machine is currently in the Run state.
      ERRDISC_CNT : out std_logic_vector (7 downto 0); --! Disconnect error counter.
      ERRPAR_CNT  : out std_logic_vector (7 downto 0); --! Parity error counter.
      ERRESC_CNT  : out std_logic_vector (7 downto 0); --! Escape error counter.
      ERRCRED_CNT : out std_logic_vector (7 downto 0); --! Credit error counter.
      EMPTY_CNT   : out std_logic_vector (7 downto 0); --! Empty packet counter.
      SPW_DO      : out std_logic;                     --! Data Out SpaceWire signal.
      SPW_SO      : out std_logic;                      --! Strobe Out SpaceWire signal.
      
      TXFIFOROOM  : out std_logic_vector (TXFIFOSIZE_BITS downto 0);
      RXFIFOROOM  : out std_logic_vector (RXFIFOSIZE_BITS downto 0)
   );
end entity SpwStream;

--------------------------------------------------------------------------------
-- Architecture SpwStream_rtl
--! \brief  SpaceWire core with character-stream interface RTL implementation.
--!
--! \cdc ARST_N -> tx_rst_n synchronize asynchronous external reset to transmission clock clock (100 MHz).
--! \cdc ARST_N -> sys_rst_n synchronize asynchronous external reset to system clock (25 MHz).
--------------------------------------------------------------------------------
architecture SpwStream_rtl of SpwStream is 
   -----------------------------------------------------------------------------
   -- spwstream_definitions - contains the constants, types and subtypes used in the SpwStream unit.
   -----------------------------------------------------------------------------
   --! reset time (6.4 us) in system clocks.
   constant RESET_TIME : integer := integer(SYSFREQ * 6.4e-6);
   --! disconnect time (850 ns) in system clocks -1 sysclk to account for sync latency.
   constant DISCONNECT_TIME : integer := integer((SYSFREQ * 850.0e-9) - 1.0);
   --! maps spw_implementation_type to real type.
   type impl_to_real_type is array(spw_implementation_type) of real;
   --! maps the correct txclk freq according to the implementation.
   constant TXIMPL_TO_TXCLK_FREQ : impl_to_real_type := ( impl_generic => SYSFREQ,
       impl_fast => TXCLKFREQ, impl_recovclk => TXCLKFREQ);
   --! effective txclk frequency.
   constant EFFECTIVE_TXCLK_FREQ : real := TXIMPL_TO_TXCLK_FREQ(TXIMPL);
   --! initial tx clock scaler (10 Mbit).
   constant DEFAULT_DIVCNT : std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(integer(EFFECTIVE_TXCLK_FREQ / 10.0e6 - 1.0),
       8));
       
--   -- assumption: the RX and TX clocks are likely to be similar
--   type real_array is array(integer range 0 to 1) of integer;
--   constant reset_times : real_array := (0 => integer(TXCLKFREQ / SYSFREQ + 0.5), 1 => 1);
--   constant RESET_CYCLES : integer := reset_times'HIGH;     -- max(reset_times)?
   -----------------------------------------------------------------------------
   -- Type spwstream_regs_type
   --! \brief        internal registers for the Spwstream module.
   --! \details      The type contains the registers used by the Spwstream unit.
   -----------------------------------------------------------------------------
   type spwstream_regs_type is record 
      -- packet state
      rxpacket       : std_logic; --! '1' when receiving a packet.
      rxeep          : std_logic; --! '1' when rx EEP character pending.
      txpacket       : std_logic; --! '1' when transmitting a packet.
      txdiscard      : std_logic; --! '1' when discarding a tx packet.
      rxemptydiscard : std_logic; --! '1' when rx empty packet (consecutive EOP or EEP).
      -- FIFO pointers
      rxfifo_raddr   : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO read addr pointer.
      rxfifo_waddr   : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO write addr pointer.
      txfifo_raddr   : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO read addr pointer.
      txfifo_waddr   : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO write addr pointer.
      -- FIFO state
      rxfifo_rvalid  : std_logic; --! '1' if s_rxfifo_rdata is valid.
      txfifo_rvalid  : std_logic; --! '1' if s_txfifo_rdata is valid.
      rxfull         : std_logic; --! '1' if RX fifo is full.
      rxhalff        : std_logic; --! '1' if RX fifo is at least half full.
      txfull         : std_logic; --! '1' if TX fifo is full.
      txhalff        : std_logic; --! '1' if TX fifo is at least half full.
      rxroom         : std_logic_vector (5 downto 0); --! nr of free positions in the rx fifo up to 63.
      rxfiforoom     : std_logic_vector (RXFIFOSIZE_BITS downto 0); --! RX FIFO room.
      txfiforoom     : std_logic_vector (TXFIFOSIZE_BITS downto 0); --! TX FIFO room.
      -- error counters
      disc_cnt       : std_logic_vector (7 downto 0); --! disconnect error counter.
      par_cnt        : std_logic_vector (7 downto 0); --! parity error counter.
      esc_cnt        : std_logic_vector (7 downto 0); --! escape error counter.
      cred_cnt       : std_logic_vector (7 downto 0); --! credit error counter.
      empty_cnt      : std_logic_vector (7 downto 0); --! empty packet counter.
   end record spwstream_regs_type;
   -----------------------------------------------------------------------------
   -- spwstream_regs_reset - reset value for record type registers.
   -----------------------------------------------------------------------------
   --! reset value for SpwStream registers.
   constant REGS_RESET : spwstream_regs_type := ( rxemptydiscard => '0', rxpacket => '0',
       rxeep => '0', txpacket => '0', txdiscard => '0',
       rxfifo_raddr => (others => '0'), rxfifo_waddr => (others => '0'),
       txfifo_raddr => (others => '0'), txfifo_waddr => (others => '0'),
       rxfifo_rvalid => '0', txfifo_rvalid => '0', rxfull => '0', rxhalff => '0',
       txfull => '0', txhalff => '0', rxroom => (others => '0'),
       rxfiforoom => std_logic_vector (to_unsigned(2**RXFIFOSIZE_BITS,
      RXFIFOSIZE_BITS+1)),
       txfiforoom => std_logic_vector (to_unsigned(2**TXFIFOSIZE_BITS,
      TXFIFOSIZE_BITS+1)), disc_cnt => (others => '0'), par_cnt => (others => '0'),
       esc_cnt => (others => '0'), cred_cnt => (others => '0'),
       empty_cnt => (others => '0'));
   -----------------------------------------------------------------------------
   signal res_seq        : spwstream_regs_type;                           --! sequential signal, input for the combinatorial process.
   signal res_com        : spwstream_regs_type;                           --! combinatorial signal, input for the sequential process.
   signal recv_rxen      : std_logic;                                     --! receiver enable signal to spwrecv.
   signal recvo          : spw_recv_out_type;                             --! output signals from spwrecv.
   signal recv_inact     : std_logic;                                     --! high if there has been recent activity on the input lines.
   signal recv_inbvalid  : std_logic;                                     --! high if inbits contains a valid group of received bits.
   signal recv_inbits    : std_logic_vector (RXCHUNK-1 downto 0);         --! received bits.
   signal xmiti          : spw_xmit_in_type;                              --! signals from SpwLink unit to SpwXmit_fast unit.
   signal xmito          : spw_xmit_out_type;                             --! signals from SpwXmit_fast unit to SpwLink unit.
   signal xmit_divcnt    : std_logic_vector (7 downto 0);                 --! transmit clock divider.
   signal linki          : spw_link_in_type;                              --! SpwLink unit inputs.
   signal linko          : spw_link_out_type;                             --! SpwLink unit outputs.
   signal s_rxfifo_raddr : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! rxfifo read address.
   signal s_rxfifo_rdata : std_logic_vector (8 downto 0);                 --! rxfifo read data.
   signal s_rxfifo_wen   : std_logic;                                     --! rxfifo write enable.
   signal s_rxfifo_waddr : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! rxfifo write address.
   signal s_rxfifo_wdata : std_logic_vector (8 downto 0);                 --! rxfifo write data.
   signal s_txfifo_raddr : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! txfifo read address.
   signal s_txfifo_rdata : std_logic_vector (8 downto 0);                 --! txfifo read data.
   signal s_txfifo_wen   : std_logic;                                     --! txfifo write enable.
   signal s_txfifo_waddr : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! txfifo write address.
   signal s_txfifo_wdata : std_logic_vector (8 downto 0);                 --! txfifo write data.
   signal sys_rst_n      : std_logic;                                     --! reset (active-low) for system clock registers.
   signal tx_rst_n       : std_logic;                                     --! reset (active-low) for tx clock domain registers.
   signal rxclk          : std_logic;                                     --! recovered clock signal.
   -----------------------------------------------------------------------------
   -- Component SpwLink
   --! \brief  SpaceWire exchange level controller.
   -----------------------------------------------------------------------------
   component SpwLink is 
      generic ( 
         RESET_TIME : integer  -- Reset time expressed in system clock cycles. Should be 6.4 us (5.82 us .. 7.2 us) according to the standard.
      );
      port ( 
         LINKI : in  spw_link_in_type;  -- Link level inputs.
         RECVO : in  spw_recv_out_type; -- Output signals from spwrecv.
         XMITO : in  spw_xmit_out_type; -- Output signals from spwxmit.
         CLK   : in  std_logic;         -- unit clock.
         RST_N : in  std_logic;         -- unit reset (active-low).
         LINKO : out spw_link_out_type; -- Link level outputs.
         RXEN  : out std_logic;         -- Receiver enable signal to spwrecv.
         XMITI : out spw_xmit_in_type   -- Input signals for spwxmit.
      );
   end component SpwLink;

   -----------------------------------------------------------------------------
   -- Component SpwRecv
   --! \brief  SpaceWire receiver.
   -----------------------------------------------------------------------------
   component SpwRecv is 
      generic ( 
         DISCONNECT_TIME : integer range 1 to 255; -- Disconnect timeout, expressed in system clock cycles.
         RXCHUNK         : integer range 1 to 6  -- Nr of bits sampled per system clock cycle.
      );
      port ( 
         INACT    : in  std_logic;                             -- High if there has been recent activity on the input lines.
         INBVALID : in  std_logic;                             -- High if INBITS contains a valid group of received bits.
         INBITS   : in  std_logic_vector (RXCHUNK-1 downto 0); -- Received bits from receiver front-end.
         CLK      : in  std_logic;                             -- unit clock.
         RST_N    : in  std_logic;                             -- unit reset (active-low).
         RXEN     : in  std_logic;                             -- High to enable receiver; low to disable and reset receiver.
         RECVO    : out spw_recv_out_type                      -- Output signals to spwlink.
      );
   end component SpwRecv;

   -----------------------------------------------------------------------------
   -- Component SpwRecovClk
   --! \brief  SpaceWire clock recovery from SI and DI signals.
   -----------------------------------------------------------------------------
   component SpwRecovClk is 
      port ( 
         SPW_DI : in std_logic;  -- Data In SpaceWire signal.
         SPW_SI : in std_logic;  -- Strobe In SpaceWire signal.
         RXCLK  : out std_logic  -- Recovered clock out.
      );
   end component SpwRecovClk;

   -----------------------------------------------------------------------------
   -- Component SpwRam
   --! \brief  Synchronous two-port RAM.
   -----------------------------------------------------------------------------
   component SpwRam is 
      generic ( 
         ABITS : integer; -- number of address bits.
         DBITS : integer  -- number of data bits.
      );
      port ( 
         RADDR  : in std_logic_vector (ABITS-1 downto 0);  -- read address.
         REN    : in std_logic;                            -- read enable.
         WADDR  : in std_logic_vector (ABITS-1 downto 0);  -- write address.
         WDATA  : in std_logic_vector (DBITS-1 downto 0);  -- write data.
         WEN    : in std_logic;                            -- write enable.
         RCLK   : in std_logic;                            -- read clock.
         WCLK   : in std_logic;                            -- write clock.
         RRST_N : in std_logic;                            -- read clock syncd unit reset (active-low).
         WRST_N : in std_logic;                            -- write clock syncd unit reset (active-low).
         RDATA  : out std_logic_vector (DBITS-1 downto 0)  -- read data.
      );
   end component SpwRam;
   
   component SpwBlockRam is 
      generic ( 
         ABITS : integer -- number of address bits.
      );
      port ( 
         RADDR  : in std_logic_vector (ABITS-1 downto 0);  --! read address.
         WADDR  : in std_logic_vector (ABITS-1 downto 0);  --! write address.
         WDATA  : in std_logic_vector (8 downto 0);  --! write data.
         WEN    : in std_logic;                            --! write enable.
         CLK   : in std_logic;                            --! read clock.
         RDATA  : out std_logic_vector (8 downto 0)  --! read data.
      );
   end component SpwBlockRam;
   

   -----------------------------------------------------------------------------
   -- Component SpwReset
   --! \brief  Reset logic with asynchronous assert, synchronous de-assert.
   -----------------------------------------------------------------------------
   component SpwReset is 
      generic ( 
         RESET_LATENCY : integer range 1 to 64  -- latency (in clk cycles) of reset after ARST_N de-assert.
      );
      port ( 
         CLK    : in  std_logic; -- unit clock (target clock domain).
         ARST_N : in std_logic;  -- asynchronous reset (active-low).
         SRST_N : out std_logic  -- output reset, synchronous de-assert (active-low).
      );
   end component SpwReset;

   -----------------------------------------------------------------------------
begin
   -----------------------------------------------------------------------------

   -- STRUCTURE
   LINK_INST: SpwLink
   generic map(RESET_TIME)
   port map(linki, recvo, xmito, CLK, sys_rst_n, linko, recv_rxen, xmiti);

   RECV_INST: SpwRecv
   generic map(DISCONNECT_TIME, RXCHUNK)
   port map(recv_inact, recv_inbvalid, recv_inbits, CLK, sys_rst_n, recv_rxen, recvo);

   XMIT_FAST_INST: SpwXmit_fast
   port map(xmit_divcnt, xmiti, CLK, TXCLK, sys_rst_n, tx_rst_n, xmito, SPW_DO, SPW_SO);

   RECOV_CLK_INST: SpwRecovClk
   port map(SPW_DI, SPW_SI, rxclk);
--   rxclk <= RXCLK_PIN;

   RXMEM: SpwBlockRam
   generic map(ABITS => RXFIFOSIZE_BITS)
   port map(RADDR => s_rxfifo_raddr, WADDR => s_rxfifo_waddr, WDATA => s_rxfifo_wdata, WEN => s_rxfifo_wen, CLK => CLK, RDATA => s_rxfifo_rdata);

   TXMEM: SpwBlockRam
   generic map(ABITS => TXFIFOSIZE_BITS)
   port map(RADDR => s_txfifo_raddr, WADDR => s_txfifo_waddr, WDATA => s_txfifo_wdata, WEN => s_txfifo_wen, CLK => CLK, RDATA => s_txfifo_rdata);

   RECVFRONT_INST: SpwRecvFront
   generic map(RXCHUNK)
   port map(SPW_SI, SPW_DI, CLK, rxclk, sys_rst_n, recv_rxen, recv_inact, recv_inbvalid,
       recv_inbits);

   TXRSTLOGIC: SpwReset
   generic map(RXCHUNK)
   port map(TXCLK, ARST_N, tx_rst_n);

   SYSRSTLOGIC: SpwReset
   generic map(1)
   port map(CLK, ARST_N, sys_rst_n);

   -----------------------------------------------------------------------------
   -- Process setRegisters
   --! \brief        Combinatorial process of the SpwStream unit.
   --! \details      The process defines the next state for the sequential 
   --!               process.
   --!               [combinatorial process]
   --! - Sensitive To
   --! \arg \ref     AUTOSTART      - Host input to enable link start on receipt of a NULL character (level).
   --! \arg \ref     LINKSTART      - Host input to enable link start once the Ready state is reached (level).
   --! \arg \ref     LINKDIS        - Host input to do not start link (overrides linkstart and autostart) and/or disconnect a running link (level).
   --! \arg \ref     TXDIVCNT       - Host input. Scaling factor minus 1 (level).
   --! \arg \ref     TICK_IN        - Host input. High for one clock cycle to request transmission of a TimeCode (level).
   --! \arg \ref     CTRL_IN        - Host input. Control bits of the TimeCode to be sent (level).
   --! \arg \ref     TIME_IN        - Host input. Counter value of the TimeCode to be sent (level).
   --! \arg \ref     TXWRITE        - Host input. Pulled high by the application to write an N-Char to the transmit queue (level).
   --! \arg \ref     TXFLAG         - Host input. Control flag to be sent with the next N_Char (level).
   --! \arg \ref     TXDATA         - Host input. Byte to be sent, or X"00" for EOP or X"01" for EEP (level).
   --! \arg \ref     RXREAD         - Host input. Pulled high by the application to accept a received character (level).
   --! \arg \ref     CNT_RST        - counters reset (level).
   --! \arg \ref     res_seq        - Registers of SpwStream in system clock domain (level).
   --! \arg \ref     linko          - Link level outputs (level).
   --! \arg \ref     s_rxfifo_rdata - Data read from RX FIFO (level).
   --! \arg \ref     s_txfifo_rdata - Data read from TX FIFO (level).
   -----------------------------------------------------------------------------
   setRegisters: process( AUTOSTART, LINKSTART, LINKDIS, TXDIVCNT, TICK_IN, CTRL_IN, TIME_IN, TXWRITE, TXFLAG, TXDATA, RXREAD, CNT_RST, res_seq, linko, s_rxfifo_rdata, s_txfifo_rdata )
      variable vres : spwstream_regs_type;
      variable vrxfifo_wreq : std_logic; -- rxfifo write request.
      variable vrxfifo_op : std_logic_vector (1 downto 0); -- rxfifo operation.
      variable vrxfifo_raddr_succ : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); -- rxfifo successive position to read.
      variable vrxfifo_waddr_succ : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); -- rxfifo successive position to write.
      --
      variable vtxfifo_rreq : std_logic; -- txfifo read request.
      variable vtxfifo_op : std_logic_vector (1 downto 0); -- txfifo operation.
      variable vtxfifo_raddr_succ : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); -- txfifo successive position to read.
      variable vtxfifo_waddr_succ : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); -- txfifo successive position to write.
   begin
      vres := res_seq;
      -- Keep track of whether we are sending and/or receiving a packet.
      if ( linko.rxchar = '1' ) then
         -- got character
         vres.rxpacket  := not linko.rxflag;
         -- previous char was EOP or EEP and current char is also EOP or EEP
         if ( res_seq.rxpacket = '0' ) then
            vres.rxemptydiscard := linko.rxflag;
         end if; -- res_seq.rxpacket
      end if; -- linko.rxchar
      if ( linko.txack = '1' ) then
         -- send character
         vres.txpacket  := not s_txfifo_rdata(8);
      end if; -- linko.txack
      --------------------------------------------------------------------------
      -- Update RX fifo pointers.
      --------------------------------------------------------------------------
      vrxfifo_wreq := (linko.rxchar or res_seq.rxeep) and (not vres.rxemptydiscard) and (not res_seq.rxfull);
      vrxfifo_op := vrxfifo_wreq & RXREAD;
      vrxfifo_raddr_succ := std_logic_vector(unsigned(res_seq.rxfifo_raddr) + 1);
      vrxfifo_waddr_succ := std_logic_vector(unsigned(res_seq.rxfifo_waddr) + 1);
      case vrxfifo_op is
         when "00" =>
         when "01" => -- read
            if ( res_seq.rxfifo_rvalid = '1' ) then -- If FIFO is NOT empty, it can be read.
               vres.rxfifo_raddr := vrxfifo_raddr_succ;
               vres.rxfiforoom := std_logic_vector(unsigned(res_seq.rxfiforoom) + 1);
            end if; -- res_seq.rxfifo_rvalid
         when "10" => -- write
            if ( res_seq.rxfull = '0' ) then  -- If FIFO is NOT full, it can be written.
               vres.rxfifo_waddr := vrxfifo_waddr_succ;
               vres.rxfiforoom := std_logic_vector(unsigned(res_seq.rxfiforoom) - 1);
            end if; -- res_seq.rxfull
         when others => -- write and read at the same time
            if ( res_seq.rxfifo_rvalid = '1' ) then
               vres.rxfifo_raddr := vrxfifo_raddr_succ;
            end if; -- res_seq.rxfifo_rvalid
            if ( res_seq.rxfull = '0' ) then
               vres.rxfifo_waddr := vrxfifo_waddr_succ;
            end if; -- res_seq.rxfull
--         when others =>
      end case;

-- The concetanation seems to have caused trouble: vrxfifo_op was 0 for transmit=0 and read=U
-- Possibly only an issue for simulations, still rewriting the case to ifs should permanently fix this
--      if (vrxfifo_wreq = '0' and RXREAD = '1') then
--            if ( res_seq.rxfifo_rvalid = '1' ) then -- If FIFO is NOT empty, it can be read.
--               vres.rxfifo_raddr := vrxfifo_raddr_succ;
--               vres.rxfiforoom := std_logic_vector(unsigned(res_seq.rxfiforoom) + 1);
--            end if; -- res_seq.rxfifo_rvalid
--      else if (vrxfifo_wreq = '1' and RXREAD = '0') then
--            if ( res_seq.rxfull = '0' ) then  -- If FIFO is NOT full, it can be written.
--               vres.rxfifo_waddr := vrxfifo_waddr_succ;
--               vres.rxfiforoom := std_logic_vector(unsigned(res_seq.rxfiforoom) - 1);
--            end if; -- res_seq.rxfull
--      else if (vrxfifo_wreq = '1' and RXREAD = '1') then
--            if ( res_seq.rxfifo_rvalid = '1' ) then
--               vres.rxfifo_raddr := vrxfifo_raddr_succ;
--            end if; -- res_seq.rxfifo_rvalid
--            if ( res_seq.rxfull = '0' ) then
--               vres.rxfifo_waddr := vrxfifo_waddr_succ;
--            end if; -- res_seq.rxfull
--      end
      

      vres.rxfifo_rvalid := bool_to_logic( ( unsigned(vres.rxfiforoom) < to_unsigned(2**RXFIFOSIZE_BITS, RXFIFOSIZE_BITS+1) ) );
      vres.rxfull := bool_to_logic( vres.rxfiforoom = std_logic_vector(to_unsigned(0,RXFIFOSIZE_BITS+1)) ); -- NOTE: using new value
      vres.rxhalff := bool_to_logic( unsigned(vres.rxfiforoom) < 2**(RXFIFOSIZE_BITS-1) );
      -------------------
      if ( res_seq.rxfull = '0' ) then
         vres.rxeep := '0';
      end if; -- res_seq.rxfull
      -------------------
      if (unsigned(vres.rxfiforoom) > 63 ) then
         vres.rxroom := (others => '1');
      else
         vres.rxroom := std_logic_vector(vres.rxfiforoom(5 downto 0));
      end if; -- (unsigned(vres.rxfiforoom)
      --------------------------------------------------------------------------
      -- Update TX fifo pointers.
      --------------------------------------------------------------------------
      vtxfifo_rreq := bool_to_logic( ((linko.txack = '1') or (res_seq.txdiscard = '1')) and (res_seq.txfifo_rvalid = '1') );
      vtxfifo_op := TXWRITE & vtxfifo_rreq;
      vtxfifo_raddr_succ := std_logic_vector(unsigned(res_seq.txfifo_raddr) + 1);
      vtxfifo_waddr_succ := std_logic_vector(unsigned(res_seq.txfifo_waddr) + 1);
      case vtxfifo_op is
         when "00" =>
         when "01" => -- read
            if ( res_seq.txfifo_rvalid = '1' ) then -- If FIFO is NOT empty, it can be read.
               vres.txfifo_raddr := vtxfifo_raddr_succ;
               vres.txfiforoom := std_logic_vector(unsigned(res_seq.txfiforoom) + 1);
            end if; -- res_seq.txfifo_rvalid
            if ( s_txfifo_rdata(8) = '1' ) then
               vres.txdiscard := '0'; -- got EOP/EEP, stop discarding data
            end if; -- s_txfifo_rdata(8)
         when "10" => -- write
            if ( res_seq.txfull = '0' ) then -- If FIFO is NOT full, it can be written.
               vres.txfifo_waddr := vtxfifo_waddr_succ;
               vres.txfiforoom := std_logic_vector(unsigned(res_seq.txfiforoom) - 1);
            end if; -- res_seq.txfull
         when others => -- write and read at the same time
            if ( res_seq.txfifo_rvalid = '1' ) then
               vres.txfifo_raddr := vtxfifo_raddr_succ;
            end if; -- res_seq.txfifo_rvalid
            if ( res_seq.txfull = '0' ) then
               vres.txfifo_waddr := vtxfifo_waddr_succ;
            end if; -- res_seq.txfull
      end case; 

      vres.txfifo_rvalid := bool_to_logic( unsigned(vres.txfiforoom) < to_unsigned(2**TXFIFOSIZE_BITS, TXFIFOSIZE_BITS+1) );
      vres.txfull := bool_to_logic( vres.txfiforoom = std_logic_vector(to_unsigned(0,TXFIFOSIZE_BITS+1)) ); -- NOTE: using new value 
      vres.txhalff := bool_to_logic( unsigned(vres.txfiforoom) < 2**(TXFIFOSIZE_BITS-1) );
      
      --------------------------------------------------------------------------
      -- If the link is lost, set a flag to discard the current packet.
      if ( linko.running = '0' ) then
         vres.rxeep     := vres.rxeep or vres.rxpacket;     -- use new value of rxpacket
         vres.txdiscard := vres.txdiscard or vres.txpacket; -- use new value of txpacket
         vres.rxpacket  := '0';
         vres.txpacket  := '0';
      end if; -- linko.running
      -- Clear the discard flag when the link is explicitly disabled.
      if ( LINKDIS = '1' ) then
         vres.txdiscard := '0';
      end if; -- LINKDIS
      -- Drive control signals to RX fifo.
      s_rxfifo_raddr  <= vres.rxfifo_raddr;  -- using new value of rxfifo_raddr
      s_rxfifo_wen    <= (not res_seq.rxfull) and vrxfifo_wreq;
      s_rxfifo_waddr  <= res_seq.rxfifo_waddr;
      if ( res_seq.rxeep = '1' ) then
         s_rxfifo_wdata  <= "100000001";
      else
         s_rxfifo_wdata  <= linko.rxflag & linko.rxdata;
      end if; -- res_seq.rxeep
      -- Drive control signals to TX fifo.
      s_txfifo_raddr  <= res_seq.txfifo_raddr;
      s_txfifo_wen    <= (not res_seq.txfull) and TXWRITE;
      s_txfifo_waddr  <= res_seq.txfifo_waddr;
      s_txfifo_wdata  <= TXFLAG & TXDATA;
      -- Drive inputs to spwlink.
      linki.autostart <= AUTOSTART;
      linki.linkstart <= LINKSTART;
      linki.linkdis   <= LINKDIS;
      linki.rxroom    <= res_seq.rxroom;
      linki.tick_in   <= TICK_IN;
      linki.ctrl_in   <= CTRL_IN;
      linki.time_in   <= TIME_IN;
      linki.txwrite   <= res_seq.txfifo_rvalid and not res_seq.txdiscard;
      linki.txflag    <= s_txfifo_rdata(8);
      linki.txdata    <= s_txfifo_rdata(7 downto 0);
      -- Drive divcnt input to spwxmit.
      if ( linko.running = '1' ) then
         xmit_divcnt <= TXDIVCNT;
      else
         xmit_divcnt <= default_divcnt;
      end if; -- linko.running
      -- Counters
      --
      if ( CNT_RST = '1' ) then
         vres.disc_cnt := (others => '0');
      elsif ( linko.errdisc = '1' ) then
         vres.disc_cnt := std_logic_vector(unsigned(res_seq.disc_cnt) + 1);
      end if; -- linko.errdisc
      --
      if ( CNT_RST = '1' ) then
         vres.par_cnt := (others => '0');
      elsif ( linko.errpar = '1' ) then
         vres.par_cnt := std_logic_vector(unsigned(res_seq.par_cnt) + 1);
      end if; -- linko.errpar
      --
      if ( CNT_RST = '1' ) then
         vres.esc_cnt := (others => '0');
      elsif ( linko.erresc = '1' ) then
         vres.esc_cnt := std_logic_vector(unsigned(res_seq.esc_cnt) + 1);
      end if; -- linko.erresc
      --
      if ( CNT_RST = '1' ) then
         vres.cred_cnt := (others => '0');
      elsif ( linko.errcred = '1' ) then
         vres.cred_cnt := std_logic_vector(unsigned(res_seq.cred_cnt) + 1);
      end if; -- linko.cred_cnt
      --
      if ( CNT_RST = '1' ) then
         vres.empty_cnt := (others => '0');
      elsif ( res_seq.rxpacket = '0' and linko.rxchar = '1' and linko.rxflag = '1' ) then
         vres.empty_cnt := std_logic_vector(unsigned(res_seq.empty_cnt) + 1);
      end if; -- res_seq.rxpacket
      --

      -- Drive outputs.
      TXRDY       <= not res_seq.txfull;
      TXHALFF     <= res_seq.txhalff;
      TICK_OUT    <= linko.tick_out;
      CTRL_OUT    <= linko.ctrl_out;
      TIME_OUT    <= linko.time_out;
      RXVALID     <= res_seq.rxfifo_rvalid;
      RXHALFF     <= res_seq.rxhalff;
      RXFLAG      <= s_rxfifo_rdata(8);
      RXDATA      <= s_rxfifo_rdata(7 downto 0);
      STARTED     <= linko.started;
      CONNECTING  <= linko.connecting;
      RUNNING     <= linko.running;
      ERRDISC_CNT <= res_seq.disc_cnt;
      ERRPAR_CNT  <= res_seq.par_cnt;
      ERRESC_CNT  <= res_seq.esc_cnt;
      ERRCRED_CNT <= res_seq.cred_cnt;
      EMPTY_CNT   <= res_seq.empty_cnt;
      
      TXFIFOROOM  <= res_seq.txfiforoom;
      RXFIFOROOM  <= res_seq.rxfiforoom;
      
      -- Update registers.
      res_com <= vres;
   end process setRegisters;

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        sequential process of the SpwStream unit.
   --! \details      Sequential process to update the registers on rising edge 
   --!               of unit clock.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK       - unit clock (rising edge).
   --! \arg \ref     SYS_RST_N - system clock reset (active-low).
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, SYS_RST_N )
   begin
      if ( sys_rst_n = '0' ) then
         res_seq <= REGS_RESET;
      elsif ( rising_edge(CLK) ) then
         res_seq <= res_com;
--vhdl_cover_off
         --------------------------------------------------
         -- simulation assertions
         assert s_rxfifo_wen = '0' or res_seq.rxfiforoom /= std_logic_vector(to_unsigned(0,RXFIFOSIZE_BITS+1)) or RXREAD = '1'
            report "Attempt to write to full RXFIFO" severity Warning;
         
         assert RXREAD = '0' or res_seq.rxfiforoom /= std_logic_vector(to_unsigned(2**RXFIFOSIZE_BITS,RXFIFOSIZE_BITS+1))
            report "Attempt to read an empty RXFIFO" severity Warning;
            
         assert TXWRITE = '0' or res_seq.txfiforoom /= std_logic_vector(to_unsigned(0,TXFIFOSIZE_BITS+1)) or (linko.txack = '1') or (res_seq.txdiscard = '1')
            report "Attempt to write to full TXFIFO" severity Warning;
         
         assert ((linko.txack = '0') and (res_seq.txdiscard = '0')) or (res_seq.txfifo_rvalid = '0') 
         or res_seq.txfiforoom /= std_logic_vector(to_unsigned(2**TXFIFOSIZE_BITS,TXFIFOSIZE_BITS+1))
            report "Attempt to read an empty TXFIFO" severity Warning;
--vhdl_cover_on
      end if; -- rising_edge(CLK)
   end process updateRegs;

end architecture SpwStream_rtl;

--------------------------------------------------------------------------------
-- end SpwStream.vhd
--------------------------------------------------------------------------------
