--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwLink.vhd
--!
--! \brief        SpaceWire exchange level controller.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.06.2010
--! \date         Updated: 30.01.2019
--! \version      V 1.01
--
-- Unit         : SpwLink (RTL|STR) (entity, architecture)
-- File version : $Revision: 141 $
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
--  SpaceWire Exchange Level Controller.
--
--  This entity implements exchange level aspects of the SpaceWire protocol.
--  It handles connection setup, error detection and flow control.
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
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwLink
--! \brief        SpwLink - SpaceWire exchange level controller.
--! \details      This unit implements exchange level aspects of the SpaceWire 
--!               protocol.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : V 1.01 JTO 30.01.2019 - update for FCT send condition
--------------------------------------------------------------------------------
entity SpwLink is 
   generic ( 
      RESET_TIME : integer  --! Reset time expressed in system clock cycles. Should be 6.4 us (5.82 us .. 7.2 us) according to the standard.
   );
   port ( 
      LINKI : in  spw_link_in_type;  --! Link level inputs.
      RECVO : in  spw_recv_out_type; --! Output signals from spwrecv.
      XMITO : in  spw_xmit_out_type; --! Output signals from spwxmit.
      CLK   : in  std_logic;         --! unit clock.
      RST_N : in  std_logic;         --! unit reset (active-low).
      LINKO : out spw_link_out_type; --! Link level outputs.
      RXEN  : out std_logic;         --! Receiver enable signal to spwrecv.
      XMITI : out spw_xmit_in_type   --! Input signals for spwxmit.
   );
end entity SpwLink;

--------------------------------------------------------------------------------
-- Architecture SpwLink_rtl
--! \brief  SpaceWire exchange level controller RTL implementation.
--------------------------------------------------------------------------------
architecture SpwLink_rtl of SpwLink is 
   -----------------------------------------------------------------------------
   -- spwlink_definitions - reset value for record type registers.
   -----------------------------------------------------------------------------
   --! reset value for SpwLink registers.
   constant REGS_RESET : spwlink_regs_type := ( state => S_ErrorReset,
       tx_credit => "000000", rx_credit => "000000", errcred => '0',
       timercnt => to_unsigned(RESET_TIME, 11), timerdone => '0', xmit_fct_in => '0',
       rxen => '0', rx_null_fct => '0' );
   -----------------------------------------------------------------------------
   signal state_seq : spwlink_regs_type; --! fsm state sequential, combinatorial process input, rising edge.
   signal state_com : spwlink_regs_type; --! fsm state combinatorial, sequential process input, rising edge.
begin
   -- Aldec enum spwlink CURRENT=state_seq.state
   -- Aldec enum spwlink STATES=S_ErrorReset,S_ErrorWait,S_Ready,S_Started,S_Connecting,S_Run
   -- Aldec enum spwlink TRANS=S_ErrorReset->S_ErrorWait
   -- Aldec enum spwlink TRANS=S_ErrorWait->S_Ready,S_ErrorWait->S_ErrorReset
   -- Aldec enum spwlink TRANS=S_Ready->S_Started,S_Ready->S_ErrorReset
   -- Aldec enum spwlink TRANS=S_Started->S_Connecting,S_Started->S_ErrorReset
   -- Aldec enum spwlink TRANS=S_Connecting->S_Run,S_Connecting->S_ErrorReset
   -- Aldec enum spwlink TRANS=S_Run->S_ErrorReset
   -----------------------------------------------------------------------------
   -- Process setRegisters
   --! \brief        combinatorial process of the state machine and logic.
   --! \details      The process defines the next state for the sequential 
   --!               process.
   --!               [combinatorial process]
   --! - Sensitive To
   --! \arg \ref     LINKI     - Link level inputs (level).
   --! \arg \ref     RECVO     - Receiver unit outputs (level).
   --! \arg \ref     XMITO     - Transmitter unit outputs (level).
   --! \arg \ref     state_seq - Registers from SpwLink unit (level).
   -----------------------------------------------------------------------------
   setRegisters: process( LINKI, RECVO, XMITO, state_seq )
      variable vstate: spwlink_regs_type;
      variable vtimerrst: std_logic;
   begin
      vstate     := state_seq;
      vtimerrst  := '0';
      -- State machine.
      case state_seq.state is
         when S_ErrorReset =>
            -- Wait for timer.
            if ( state_seq.timercnt = 0 ) then
               vstate.state := S_ErrorWait;
               vtimerrst    := '1';
               vstate.rxen  := '1';
            else
               vstate.errcred := '0';
               vstate.xmit_fct_in := '0';
               vstate.rxen := '0';
            end if; -- state_seq.timercnt
         when S_ErrorWait =>
            -- Wait for 2 timer periods.
            if ((RECVO.errdisc or RECVO.errpar or RECVO.erresc) = '1') or
               ((RECVO.gotfct or RECVO.tick_out or RECVO.rxchar) = '1') then
               -- Note: spwrecv will never issue errpar, erresc, gotfct,
               -- tick_out or rxchar before the first NULL has been seen.
               -- Therefore it's ok here to bail on those conditions
               -- without explicitly testing got_null.
               vstate.state := S_ErrorReset;    -- error, go back to reset
               vtimerrst    := '1';
               vstate.rxen  := '0';
            elsif ( state_seq.timercnt = 0 ) then
               if ( state_seq.timerdone = '1' ) then
                  vstate.state := S_Ready;
                  vtimerrst   := '1';
               end if; -- state_seq.timerdone
            end if; -- state_seq.timercnt
         when S_Ready =>
            -- Wait for link start.
            if ((RECVO.errdisc or RECVO.errpar or RECVO.erresc) = '1') or
               ((RECVO.gotfct or RECVO.tick_out or RECVO.rxchar) = '1') then
               vstate.state := S_ErrorReset;    -- error, go back to reset
               vtimerrst    := '1';
               vstate.rxen  := '0';
            elsif (LINKI.linkdis = '0') and (state_seq.xmit_fct_in = '1') and
                 ((LINKI.linkstart or (LINKI.autostart and RECVO.gotnull)) = '1') then
               vstate.state := S_Started;       -- link enabled; start sending NULL
               vtimerrst    := '1';
            end if; -- LINKI.linkdis
         when S_Started =>
            -- Wait for NULL.
            if ((RECVO.errdisc or RECVO.errpar or RECVO.erresc) = '1') or
               (((RECVO.gotfct and not RECVO.gotnull) or RECVO.tick_out or RECVO.rxchar) = '1') or
               ((state_seq.timercnt = 0) and state_seq.timerdone = '1') then
               -- Note: added gotnull cond for simultaneous NULL and FCT detection.
               -- It is not necessary to evaluate in which order where received since
               -- all bits before first NULL are ignored.
               -- Only added in this state since in the last two states it is an
               -- error to receive a single NULL and then a FCT.
               vstate.state := S_ErrorReset;    -- error, go back to reset
               vtimerrst    := '1';
               vstate.rxen  := '0';
            elsif ( RECVO.gotnull = '1' ) then
               vstate.state := S_Connecting;    -- received null, continue
               vtimerrst    := '1';
               if ( RECVO.gotfct = '1' ) then -- received null and fct together
                  vstate.rx_null_fct := '1';
               end if; -- RECVO.gotfct
            end if; -- RECVO.gotnull
         when S_Connecting =>
            vstate.rx_null_fct := '0';
            -- Wait for FCT.
            if ((RECVO.errdisc or RECVO.errpar or RECVO.erresc) = '1') or
               ((RECVO.tick_out or RECVO.rxchar) = '1') or
               ((state_seq.timercnt = 0) and state_seq.timerdone = '1') then
               vstate.state := S_ErrorReset;    -- error, go back to reset
               vtimerrst    := '1';
               vstate.rxen  := '0';
            elsif ( RECVO.gotfct = '1' or state_seq.rx_null_fct = '1' ) then
               vstate.state := S_Run;           -- got FCT, init completed
            end if; -- RECVO.gotfct
         when S_Run =>
            -- All is well.
            if ((RECVO.errdisc or RECVO.errpar or RECVO.erresc) = '1') or
               (state_seq.errcred = '1') or (LINKI.linkdis = '1') then
               vstate.state := S_ErrorReset;    -- error, go back to reset
               vtimerrst    := '1';
               vstate.rxen  := '0';
            end if; -- RECVO.errdisc
--vhdl_cover_off
         when others =>
            vstate.state := S_ErrorReset;       -- recover from invalid state
            vtimerrst    := '1';
--vhdl_cover_on
      end case;
      -- Update credit counters.
      if ( state_seq.state = S_ErrorReset ) then
         -- reset credit
         vstate.tx_credit := to_unsigned(0, vstate.tx_credit'length);
         vstate.rx_credit := to_unsigned(0, vstate.rx_credit'length);
      else
         -- update TX credit
         if ( RECVO.gotfct = '1' and XMITO.txack = '0' ) then
            -- just received a FCT token
            vstate.tx_credit := vstate.tx_credit + to_unsigned(8, vstate.tx_credit'length);
            if ( state_seq.tx_credit > 48 ) then
               -- received too many FCT tokens
               vstate.errcred := '1';
            end if; -- state_seq.tx_credit
         --end if; -- RECVO.gotfct
         elsif ( XMITO.txack = '1' and RECVO.gotfct = '0' ) then
            -- just sent one byte
            vstate.tx_credit := vstate.tx_credit - to_unsigned(1, vstate.tx_credit'length);
         elsif ( XMITO.txack = '1' and RECVO.gotfct = '1' ) then
            vstate.tx_credit := vstate.tx_credit + to_unsigned(7, vstate.tx_credit'length);
            if ( state_seq.tx_credit > 48 ) then
               -- received too many FCT tokens
               vstate.errcred := '1';
            end if; -- state_seq.tx_credit
         end if; -- XMITO.txack

         -- update RX credit after sending FCT
         if ( XMITO.fctack = '1' and RECVO.rxchar = '0' ) then
            -- just sent a FCT token
            vstate.rx_credit := vstate.rx_credit + to_unsigned(8, vstate.rx_credit'length);
         elsif ( RECVO.rxchar = '1' and XMITO.fctack = '0' ) then
            -- just received a character
            vstate.rx_credit := vstate.rx_credit - to_unsigned(1, vstate.rx_credit'length);
            if ( state_seq.rx_credit = 0 ) then
               -- remote transmitter violated its credit
               vstate.errcred := '1';
            end if; --  state_seq.rx_credit
         elsif ( RECVO.rxchar = '1' and XMITO.fctack = '1' ) then
            vstate.rx_credit := vstate.rx_credit + to_unsigned(7, vstate.rx_credit'length);
            if ( state_seq.rx_credit = 0 ) then
               -- remote transmitter violated its credit
               vstate.errcred := '1';
            end if; --  state_seq.rx_credit
         end if; -- RECVO.rxchar
         -- decide about sending FCT tokens
         vstate.xmit_fct_in := bool_to_logic( (vstate.rx_credit <= 48) and
                              (vstate.rx_credit + to_unsigned(8, vstate.rx_credit'length) < unsigned(LINKI.rxroom)) );
      end if; -- state_seq.state

      -- Update the initialization reset timer.
      if ( vtimerrst = '1' ) then
         vstate.timercnt  := to_unsigned(RESET_TIME, vstate.timercnt'length);
         vstate.timerdone := '0';
      else
         if ( state_seq.timercnt = 0 ) then
            vstate.timercnt  := to_unsigned(RESET_TIME, vstate.timercnt'length);
            vstate.timerdone := '1';
         else
            vstate.timercnt  := state_seq.timercnt - 1;
         end if; -- state_seq.timercnt
      end if; -- vtimerrst
      
      -- Drive link level outputs.
      LINKO.started    <= bool_to_logic(state_seq.state = S_Started);
      LINKO.connecting <= bool_to_logic(state_seq.state = S_Connecting);
      LINKO.running    <= bool_to_logic(state_seq.state = S_Run);
      LINKO.errdisc    <= RECVO.errdisc and bool_to_logic(state_seq.state = S_Run);
      LINKO.errpar     <= RECVO.errpar  and bool_to_logic(state_seq.state = S_Run);
      LINKO.erresc     <= RECVO.erresc  and bool_to_logic(state_seq.state = S_Run);
      -- According to clause 8.9.2.4, the credit error should only be reported in the run state.
      LINKO.errcred    <= state_seq.errcred and bool_to_logic(state_seq.state = S_Run) ;
      LINKO.txack      <= XMITO.txack;
      LINKO.tick_out   <= RECVO.tick_out and bool_to_logic(state_seq.state = S_Run);
      LINKO.ctrl_out   <= RECVO.ctrl_out;
      LINKO.time_out   <= RECVO.time_out;
      LINKO.rxchar     <= RECVO.rxchar  and bool_to_logic(state_seq.state = S_Run);
      LINKO.rxflag     <= RECVO.rxflag;
      LINKO.rxdata     <= RECVO.rxdata;
      -- Drive receiver inputs.
      RXEN             <= state_seq.rxen;
      -- Drive transmitter input signals.
      XMITI.txen       <= bool_to_logic(state_seq.state = S_Started or
                                        state_seq.state = S_Connecting or
                                        state_seq.state = S_Run);
      XMITI.stnull     <= bool_to_logic(state_seq.state = S_Started);
      XMITI.stfct      <= bool_to_logic(state_seq.state = S_Connecting);
      XMITI.fct_in     <= state_seq.xmit_fct_in;
      XMITI.tick_in    <= LINKI.tick_in and bool_to_logic(state_seq.state = S_Run);
      XMITI.ctrl_in    <= LINKI.ctrl_in;
      XMITI.time_in    <= LINKI.time_in;
      XMITI.txwrite    <= LINKI.txwrite and bool_to_logic(state_seq.tx_credit /= 0);
      XMITI.txflag     <= LINKI.txflag;
      XMITI.txdata     <= LINKI.txdata;
      -- Update registers.
      state_com <= vstate;
   end process setRegisters;

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        sequential process of the state machine.
   --! \details      The process sets the next state for the combinatorial 
   --!               process.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK   - unit clock (rising edge).
   --! \arg \ref     RST_N - unit reset (active-low).
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, RST_N )
   begin
      if ( RST_N = '0' ) then
         state_seq <= REGS_RESET;
      elsif ( rising_edge(CLK) ) then
         state_seq <= state_com;
      end if; -- rising_edge(CLK)
   end process updateRegs;

end architecture SpwLink_rtl;

--------------------------------------------------------------------------------
-- end SpwLink.vhd
--------------------------------------------------------------------------------