--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRecv.vhd
--!
--! \brief        SpaceWire Receiver.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.06.2010
--! \date         Updated: 02.10.2017
--! \version      V 1.00
--
-- Unit         : SpwRecv (RTL|STR) (entity, architecture)
-- File version : $Revision: 111 $
--
-- Limitations  : None known
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
--  SpaceWire Receiver
--
--  This entity decodes the sequence of incoming data bits into tokens.
--  Data bits are passed to this entity from the Receiver Front-end
--  in groups of RXCHUNK bits at a time.
--
--  The bitrate of the incoming SpaceWire signal must be strictly less
--  than RXCHUNK times the system clock frequency.
--
--  The unit was modified to support RXCHUNKS of 6 bits. This will allow this
--  unit to run at 25 MHz and be able to process data rates of 100 Mbps.
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
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwRecv
--! \brief        SpwRecv - SpaceWire receiver.
--! \details      The SpaceWire receiver collects data from the receiver 
--!               front-end SpwRecvFront.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
entity SpwRecv is 
   generic ( 
      DISCONNECT_TIME : integer range 1 to 255; --! Disconnect timeout, expressed in system clock cycles.
      RXCHUNK         : integer range 1 to 6  --! Nr of bits sampled per system clock cycle.
   );
   port ( 
      INACT    : in  std_logic;                             --! High if there has been recent activity on the input lines.
      INBVALID : in  std_logic;                             --! High if INBITS contains a valid group of received bits.
      INBITS   : in  std_logic_vector (RXCHUNK-1 downto 0); --! Received bits from receiver front-end.
      CLK      : in  std_logic;                             --! unit clock.
      RST_N    : in  std_logic;                             --! unit reset (active-low).
      RXEN     : in  std_logic;                             --! High to enable receiver; low to disable and reset receiver.
      RECVO    : out spw_recv_out_type                      --! Output signals to spwlink.
   );
end entity SpwRecv;

--------------------------------------------------------------------------------
-- Architecture SpwRecv_rtl
--! \brief  SpaceWire receiver RTL implementation.
--------------------------------------------------------------------------------
architecture SpwRecv_rtl of SpwRecv is 
   -----------------------------------------------------------------------------
   -- spwrecv_definitions - reset value for record type registers.
   -----------------------------------------------------------------------------
   --! reset value for SpwRecv registers.
   constant REGS_RESET : spwrecv_regs_type := ( bit_seen => '0', null_seen => '0',
       bitshift => (others => '1'), bitcnt => (others => '0'), parity => '0',
       control => '0', escaped => '0', gotfct => '0', pendeop => '0', pendeep => '0',
       penderresc => '0', pendfct => (others => '0'), tick_out => '0', rxchar => '0',
       rxflag => '0', timereg => (others => '0'), datareg => (others => '0'),
       disccnt => "00000000", errpar => '0', erresc => '0' );
   -----------------------------------------------------------------------------
   signal res_seq : spwrecv_regs_type; --! result sequential.
   signal res_com : spwrecv_regs_type; --! result combinatorial.
begin

   -----------------------------------------------------------------------------
   -- Process setRegisters
   --! \brief        combinatorial process of the spw receiver.
   --! \details      The process defines the next state for the sequential 
   --!               process.
   --!               [combinatorial process]
   --! - Sensitive To
   --! \arg \ref     INACT    - indicates recent activity on the input lines (level).
   --! \arg \ref     INBVALID - high if INBITS contains a valid group of received bits (level).
   --! \arg \ref     INBITS   - received bits from receiver front-end (level).
   --! \arg \ref     res_seq  - registers in system clock domain (level).
   -----------------------------------------------------------------------------
   setRegisters: process( INACT, INBVALID, INBITS, res_seq )
      variable vres       : spwrecv_regs_type;
      variable vinbit     : std_ulogic;
      variable vchunkcnt  : std_logic_vector(5 downto 0);
      -- to sinalize a gotfct event in the first 4 bits of the chunk. This will help to solve
      -- the problem of receiving two FCTs together and only detecting one.
      variable vchkgotfct : unsigned(0 downto 0);
   begin
      vres   := res_seq;
      vinbit := '0';
      -- disconnect timer
      if ( INACT = '1' ) then
         -- activity on input; reset timer
         vres.disccnt   := to_unsigned(DISCONNECT_TIME, vres.disccnt'length);
      elsif ( res_seq.disccnt /= 0 ) then
         -- count down
         vres.disccnt   := res_seq.disccnt - 1;
      end if; -- res_seq.disccnt
      -- assume no new token
      vres.gotfct   := '0';
      vres.tick_out := '0';
      vres.rxchar   := '0';
      vchunkcnt     := "000000";
      vchkgotfct   := "0";
      -- when data input rate is 100 Mbps and sysclk = 25 Mhz.
      -- This means that INBVALID is '1' in 2 of 3 clk cycles.
      -- Rx 12 bits in 3 clk cycles = 4 bits each clk cycle.
      if ( INBVALID = '1' ) then
         -- process incoming bits
         for i in 0 to RXCHUNK-1 loop
            vinbit  := INBITS(i);
            -- got a bit transition
            vres.bit_seen  := '1';
            if ( vres.bitcnt(0) = '1' ) then
               -- received new token
               -- note that this will not happen before null_seen='1'
               if ( (vres.parity xor vinbit) = '0' ) then
                  -- Parity check failed.
                  vres.errpar    := '1';
               else
                  if ( vres.control = '1' ) then
                     -- received control code
                     case vres.bitshift(7 downto 6) is
                        when "00" => -- FCT or NULL
                           -- we are processing INBITS(4) or INBITS(5)
                           if ( vchunkcnt(2) = '1' or vchunkcnt(1) = '1' ) then
                              vres.gotfct    := not vres.escaped;
                              vres.pendfct   := res_seq.pendfct + vchkgotfct;
                           else
                              vres.gotfct    := not res_seq.escaped;
                              vchkgotfct(0) := not res_seq.escaped;
                           end if; -- vchunkcnt(2)
                           vres.escaped   := '0';
                        when "10" => -- EOP
                           if ( vchunkcnt(2) = '1' or vchunkcnt(1) = '1' ) then
                              vres.erresc  := vres.escaped;
                              vres.pendeop := (not res_seq.pendeop and not res_seq.pendeep)
                                              and (not vres.escaped);
                              --vres.rxchar := not vres.escaped;
                           else
                              vres.erresc    := res_seq.escaped;
                              vres.rxchar    := not res_seq.escaped;
                              vres.datareg   := "00000000";
                              vres.rxflag    := '1';
                           end if; --  vchunkcnt(2)
                           vres.penderresc   := vres.erresc;
                           vres.escaped      := '0';
                        when "01" => -- EEP
                           if ( vchunkcnt(2) = '1' or vchunkcnt(1) = '1' ) then
                              vres.erresc  := vres.escaped;
                              vres.pendeep := (not res_seq.pendeep and not res_seq.pendeop)
                                              and (not vres.escaped);
                              --vres.rxchar  := not vres.escaped;
                           else
                              vres.erresc    := res_seq.escaped;
                              vres.rxchar    := not res_seq.escaped;
                              vres.datareg   := "00000001";
                              vres.rxflag    := '1';
                           end if; --  vchunkcnt(2)
                           vres.penderresc   := vres.erresc;
                           vres.escaped   := '0';
                        when others => -- ESC
                           if ( vchunkcnt(2) = '1' or vchunkcnt(1) = '1' ) then
                              vres.erresc    := vres.escaped or vres.penderresc;
                           else
                              vres.erresc    := res_seq.escaped;
                           end if; --  vchunkcnt(2)
                           vres.escaped   := '1';
                     end case;
                  else
                     -- received 8-bit character
                     if ( vchunkcnt(2) = '1' or vchunkcnt(1) = '1' ) then
                        vres.tick_out  := vres.escaped;
                        vres.rxflag    := vres.escaped;
                        vres.rxchar    := not vres.escaped;
                     else
                        vres.tick_out  := res_seq.escaped;
                        vres.rxflag    := res_seq.escaped;
                        vres.rxchar    := not res_seq.escaped;
                     end if; --vchunkcnt(2)
                     vres.timereg   := vres.bitshift(7 downto 0);
                     vres.datareg   := vres.bitshift(7 downto 0);
                     vres.escaped   := '0';
                  end if; -- vres.control
               end if; -- vres.parity

               -- prepare for next code
               vres.parity    := '0';
               vres.control   := vinbit;
               if ( vinbit = '1' ) then
                  -- next word will be control code.
                  vres.bitcnt    := (3 => '1', others => '0');
               else
                  -- next word will be a data byte.
                  vres.bitcnt    := (9 => '1', others => '0');
               end if; -- vinbit
            else
               -- wait until next code is completely received;
               -- accumulate parity
               vres.bitcnt    := '0' & vres.bitcnt(9 downto 1);
               vres.parity    := vres.parity xor vinbit;
            end if; -- vres.bitcnt(0)

            -- detect first NULL
            if ( vres.null_seen = '0' ) then
               if ( vres.bitshift = "000101110" ) then
                  -- got first NULL pattern
                  vres.null_seen := '1';
                  vres.control   := vinbit; -- should always be '1'
                  vres.parity    := '0';
                  vres.bitcnt    := (3 => '1', others => '0');
               end if; -- vres.bitshift
            end if; -- vres.null_seen
            -- shift new bit into register.
            vres.bitshift  := vinbit & vres.bitshift(vres.bitshift'high downto 1);
            -- shift the vchunkcnt
            vchunkcnt := '1' & vchunkcnt(vchunkcnt'high downto 1);
         end loop;
      end if; -- INBVALID

      -- pending EOP, EEP and FCT are mutual exclusive so these events can not
      -- be triggered in the same chunk.
      -- send pending EOP or EEP
      if ( res_seq.pendeop = '1' or res_seq.pendeep = '1' ) then
         vres.datareg  := "0000000" & res_seq.pendeep; -- if pendeop = 1, then pendeep = 0
         vres.rxflag   := '1';
         vres.rxchar   := '1';
         vres.pendeop  := '0';
         vres.pendeep  := '0';
      end if; -- res_seq.pendeop = '1'
      -- send pending FCT
      if ( res_seq.pendfct /= "00" and INBVALID = '0' ) then
         vres.gotfct  := '1';
         vres.pendfct := res_seq.pendfct - to_unsigned(1, vres.pendfct'length);
      end if; -- res_seq.pendfct
      -- drive outputs
      --RECVO.gotbit    <= res_seq.bit_seen;
      RECVO.gotnull   <= res_seq.null_seen;
      RECVO.gotfct    <= res_seq.gotfct;
      RECVO.tick_out  <= res_seq.tick_out;
      RECVO.ctrl_out  <= res_seq.timereg(7 downto 6);
      RECVO.time_out  <= res_seq.timereg(5 downto 0);
      RECVO.rxchar    <= res_seq.rxchar;
      RECVO.rxflag    <= res_seq.rxflag;
      RECVO.rxdata    <= res_seq.datareg;
      if ( res_seq.bit_seen = '1' and res_seq.disccnt = 0 ) then
         RECVO.errdisc  <= '1';
      else
         RECVO.errdisc  <= '0';
      end if; -- res_seq.bit_seen
      RECVO.errpar   <= res_seq.errpar;
      RECVO.erresc   <= res_seq.erresc;
      -- update registers
      res_com        <= vres;
   end process setRegisters;

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        sequential process of the spw receiver.
   --! \details      Sequential process to update the registers on rising edge 
   --!               of unit clock.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK   - unit clock (rising edge).
   --! \arg \ref     RST_N - unit reset (active-low).
   --! \arg \ref     RXEN  - receiver enable (level).
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, RST_N, RXEN )
   begin
      if ( RST_N = '0' or RXEN = '0' )  then
         res_seq <= REGS_RESET;
      elsif ( rising_edge(CLK) ) then
         res_seq <= res_com;
      end if;  -- rising_edge(CLK)
   end process updateRegs;

end architecture SpwRecv_rtl;

--------------------------------------------------------------------------------
-- end SpwRecv.vhd
--------------------------------------------------------------------------------
