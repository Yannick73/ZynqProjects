--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1SpwLink.vhd
--!
--! \brief        implementation of the SpwLink unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1SpwLink (BEH) (entity, architecture)
-- File version : $Revision: 149 $
--
-- Limitations  : Only for logic test usage
-- Errors       : None known
--
-- Copyright 2021 IWF
-- 
-- This file is part of SpaceWire Unit Testbench.
--
-- SpaceWire Unit Testbench is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- SpaceWire Unit Testbench is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with SpaceWire Unit Testbench.  If not, see <https://www.gnu.org/licenses/>.
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
--! standard logic package
use ieee.std_logic_1164.all;
--! numeric package
use ieee.numeric_std.all;
--! VHUNIT test library
library VHUNIT;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;
--! VHUNIT test monitor package
use VHUNIT.TestMonitor_pkg.all;

--! VHDL SPW IP library
library SPWIP;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;
--! SPWIP SpwLink unit
use SPWIP.SpwLink;

--! OSVVM library
library OSVVM;
--! OSVVM Random Base package
use OSVVM.RandomBasePkg.all;
--! OSVVM Random package
use OSVVM.RandomPkg.all;
--! OSVVM Coverage package
use OSVVM.CoveragePkg.all;

--! work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC1SpwLink
--! \brief        TC1SpwLink - test case 1 of the SpwLink unit.
--! \details      The unit executes the test case 1, establish the link running 
--!               then send a data byte, an EEP and a timecode. Evaluate 
--!               SpW link errors at different states of the SpWLink FSM.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC1SpwLink is 
   generic ( 
      SEED           : integer      := 1;    --! seed for random generation.
      UUT_T_SYSCLK   : time         := 40 ns;--! clk period of the sysclk
                                             --! signal for UUT1.
      HOLD_TIME      : delay_length := 1 ns; --! the default hold time.
      DELAY          : delay_length := 2 ns
      );
   port ( 
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
      );
end entity TC1SpwLink;
--------------------------------------------------------------------------------
-- Architecture TC1SpwLink_beh
--! \brief  implementation of the test case 1 for the SpwLink unit.
--------------------------------------------------------------------------------
architecture TC1SpwLink_beh of TC1SpwLink is 
   -----------------------------------------------------------------------------
   -- Component SpwLink
   --! \brief  SpaceWire exchange level controller.
   -----------------------------------------------------------------------------
   component SpwLink is 
      generic ( 
         RESET_TIME : integer  --! Reset time expressed in system clock cycles. Should be 6.4 us (5.82 us .. 7.2 us) according to the standard.
      );
      port ( 
         CLK   : in  std_logic;         --! unit clock.
         RST_N : in  std_logic;         --! unit reset (active-low).
         LINKI : in  spw_link_in_type;  --! Link level inputs.
         LINKO : out spw_link_out_type; --! Link level outputs.
         RXEN  : out std_logic;         --! Receiver enable signal to spwrecv.
         RECVO : in  spw_recv_out_type; --! Output signals from spwrecv.
         XMITI : out spw_xmit_in_type;  --! Input signals for spwxmit.
         XMITO : in  spw_xmit_out_type  --! Output signals from spwxmit.
      );
   end component SpwLink;
   
   constant SYSFREQ    : real := real( 1 sec / UUT_T_SYSCLK ); --! system clock frequency in Hz.
   constant RESET_TIME : integer := integer(SYSFREQ * 6.4e-6); --! reset time (6.4 us) in system clocks.
   ---------------------------------------------------------------------------
   signal control : result;  --! internal execution result
   signal error   : integer := 0; --! error counter
   ---------------------------------------------------------------------------
   signal linki             : spw_link_in_type;    --! Link level inputs
   signal linko             : spw_link_out_type;   --! Link level outputs
   signal rxen              : std_logic;           --! Receiver enable signal to spwrecv
   signal recvo             : spw_recv_out_type;   --! Output signals from spwrecv
   signal xmiti             : spw_xmit_in_type;    --! Input signals for spwxmit
   signal xmito             : spw_xmit_out_type;   --! Output signals from spwxmit
   signal clk               : std_logic;     --! UUT System clock
   signal rst_n             : std_logic;     --! UUT System reset
   ---------------------------------------------------------------------------
   signal linko_exp        : spw_link_out_type; --! Link level outputs expected
   signal rxen_exp         : std_logic;         --! Receiver enable signal to spwrecv expected 
   signal xmiti_exp        : spw_xmit_in_type;  --! data and status signals for readBuffer outgoing expected 
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   type test_op_type is ( NONE, ESTABLISH_LINK, TX_DATA_EEP_TMCOD, ERR_AT_S_ERRORWAIT, ERR_AT_S_READY, 
                          ERR_AT_S_STARTED, ERR_AT_S_CONNECTING, ERR_AT_S_RUN, CRED_ERR_ON_TX_CRED,
                          CRED_ERR_ON_RX_CRED, PAR_ERR_RUN, ESC_ERR_RUN);
   signal test_op : test_op_type := NONE;
   ---------------------------------------------------------------------------

begin
   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
   UUT: SpwLink
   generic map (RESET_TIME)
   port map( clk, rst_n, linki, linko, rxen, recvo, xmiti, xmito);
   -----------------------------------------------------------------------------
   -- Process executeTC
   --! \brief        test case execution.
   --! \details      The process executes the test case and stop it if the end of 
   --!               the run time is reached.
   -----------------------------------------------------------------------------
   executeTC: process
   begin
      WaitForStart( CONTROL_IN );
      RunUntilTime( CONTROL_IN, control );
      wait for 10 ns; -- wait to execute other process;
   end process executeTC;
   -----------------------------------------------------------------------------
   -- Process clockSys
   --! \brief        generate the system clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_SYSCLK generic.
   -----------------------------------------------------------------------------
   clockSys: process
   begin
      -- initialize
      clk <= '0';
      WaitForStart( CONTROL_IN );
      clk <= '0';
      wait for UUT_T_SYSCLK/2;
      clk <= '1';
      wait for UUT_T_SYSCLK/2;
      StopAtEnd( control );
   end process clockSys;

   -----------------------------------------------------------------------------
   -- Process stimulate
   --! \brief        Main process for UUT.
   --! \details      The process sends data and commands to the UUT as a BFM of the 
   --!               Spwstream wrapper unit. 
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulate: process
   begin
      -- INIT UUT inputs
      test_op <= NONE;
      rst_n <= '0';
      --------------------------------------
      -- linki signals
      linki.autostart <= '0';
      linki.linkstart <= '0';
      linki.linkdis   <= '0';
      linki.rxroom    <= (others => '0');
      linki.tick_in   <= '0';
      linki.ctrl_in   <= (others => '0');
      linki.time_in   <= (others => '0');
      linki.txwrite   <= '0';
      linki.txflag    <= '0';
      linki.txdata    <= (others => '0');
      --------------------------------------
      -- SpwRecv signals
      recvo.gotnull  <= '0';
      recvo.gotfct   <= '0';
      recvo.tick_out <= '0';
      recvo.ctrl_out <= "00";
      recvo.time_out <= "000000";
      recvo.rxchar   <= '0';
      recvo.rxflag   <= '0';
      recvo.rxdata   <= X"00";
      recvo.errdisc  <= '0';
      recvo.errpar   <= '0';
      recvo.erresc   <= '0';
      --------------------------------------
      -- SpwXmit_fast signals
      xmito.fctack <= '0';
      xmito.txack  <= '0';
      
      WaitForStart( CONTROL_IN );
      wait for 100 ns; -- 0 fs
      rst_n <= '1';
      linki.rxroom    <= std_logic_vector(to_unsigned(63, linki.rxroom'length));
      ---------------------------------------
      -- establish link
      test_op <= ESTABLISH_LINK;
     
      WaitForCLKCycle(clk, 700);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 200);
      linki.autostart <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 10);
      ---------------------------------------
      -- tx data , EEP and timecode
      test_op <= TX_DATA_EEP_TMCOD;
      linki.txflag    <= '0';
      linki.txdata    <= X"AA";
      WaitForCLKCycle(clk, 1);
      linki.txwrite   <= '1';
      WaitForCLKCycle(clk, 1);
      linki.txwrite   <= '0';
      WaitForCLKCycle(clk, 1);
      linki.txflag    <= '1';
      linki.txdata    <= X"01";
      WaitForCLKCycle(clk, 1);
      linki.txwrite   <= '1';
      WaitForCLKCycle(clk, 1);
      linki.txwrite   <= '0';
      linki.txflag    <= '0';
      WaitForCLKCycle(clk, 1);
      linki.ctrl_in   <= "11";
      linki.time_in   <= "01" & X"5";
      WaitForCLKCycle(clk, 1);
      linki.tick_in   <= '1';
      WaitForCLKCycle(clk, 1);
      linki.tick_in   <= '0';
      linki.ctrl_in   <= "00";
      linki.time_in   <= "00" & X"0";
      
      ---------------------------------------
      -- error at S_Run
      test_op <= ERR_AT_S_RUN;
      WaitForCLKCycle(clk, 100);
      recvo.errdisc  <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.errdisc  <= '0';
      recvo.gotnull  <= '0';
      ---------------------------------------
      -- error at S_ErrorWait
      test_op <= ERR_AT_S_ERRORWAIT;
      WaitForCLKCycle(clk, 180);
      recvo.errpar  <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.errpar  <= '0';
      ---------------------------------------
      -- error at S_Ready
      test_op <= ERR_AT_S_READY;
      WaitForCLKCycle(clk, 500);
      recvo.erresc  <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.erresc  <= '0';
      ---------------------------------------
      -- error at S_Started
      test_op <= ERR_AT_S_STARTED;
      WaitForCLKCycle(clk, 500);
      linki.linkstart <= '1';
      WaitForCLKCycle(clk, 10);
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      ---------------------------------------
      -- error at S_Connecting
      test_op <= ERR_AT_S_CONNECTING;
      WaitForCLKCycle(clk, 500);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.rxchar   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.rxchar   <= '0';
      recvo.gotnull  <= '0';
      WaitForCLKCycle(clk, 10);
      
      ---------------------------------------
      -- credit error on tx_credit
      test_op <= CRED_ERR_ON_TX_CRED;
      WaitForCLKCycle(clk, 500);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.gotfct   <= '1'; -- receive one FCT
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 10);
      recvo.gotfct   <= '1'; -- receive one FCT
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      xmito.txack    <= '1'; -- sent one N-char
      WaitForCLKCycle(clk, 1);
      xmito.txack    <= '0';
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '1';
      xmito.txack    <= '1'; -- sent one N-char
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      xmito.txack    <= '0';
      WaitForCLKCycle(clk, 10);
      xmito.fctack   <= '1'; -- sent one fct
      WaitForCLKCycle(clk, 1);
      xmito.fctack   <= '0';
      WaitForCLKCycle(clk, 10);
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 8);
      recvo.rxflag <= '1';
      recvo.rxdata <= X"01";
      WaitForCLKCycle(clk, 2);
      recvo.rxchar   <= '1'; -- receive one N-char
      WaitForCLKCycle(clk, 1);
      recvo.rxchar   <= '0';
      recvo.rxflag <= '0';
      recvo.rxdata <= X"00";
      --
      WaitForCLKCycle(clk, 1); -- rx one timecode
      recvo.ctrl_out <= "10";
      recvo.time_out <= "101010";
      WaitForCLKCycle(clk, 1);
      recvo.tick_out <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.tick_out <= '0';
      recvo.ctrl_out <= "00";
      recvo.time_out <= "000000";
      WaitForCLKCycle(clk, 2);
      WaitForCLKCycle(clk, 5);
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 8);
      recvo.rxflag <= '0';
      recvo.rxdata <= X"55";
      WaitForCLKCycle(clk, 2);
      recvo.rxchar   <= '1'; -- receive one N-char and sent one fct
      xmito.fctack   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.rxchar   <= '0'; 
      xmito.fctack   <= '0';
      recvo.rxflag <= '0';
      recvo.rxdata <= X"00";
      WaitForCLKCycle(clk, 10);
      recvo.gotfct   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 10);
      WaitForCLKCycle(clk, 10);
      recvo.gotfct   <= '1'; -- receive FCT and sent one N-char
      xmito.txack    <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      xmito.txack    <= '0';
      recvo.gotnull  <= '0';
      WaitForCLKCycle(clk, 10);
      ---------------------------------------
      -- credit error on rx_credit
      test_op <= CRED_ERR_ON_RX_CRED;
      WaitForCLKCycle(clk, 500);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.gotfct   <= '1'; -- receive one fct
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 10);
      recvo.rxchar   <= '1'; -- receive one N-char and sent one fct
      xmito.fctack   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.rxchar   <= '0';
      xmito.fctack   <= '0';
      WaitForCLKCycle(clk, 10);
      
      ---------------------------------------
      -- parity error on at run state
      test_op <= PAR_ERR_RUN;
      WaitForCLKCycle(clk, 500);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.gotfct   <= '1'; -- receive one fct
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 5);
      recvo.errpar   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.errpar   <= '0';
      
      ---------------------------------------
      -- escape error on at run state
      test_op <= ESC_ERR_RUN;
      WaitForCLKCycle(clk, 500);
      recvo.gotnull  <= '1';
      WaitForCLKCycle(clk, 100);
      recvo.gotfct   <= '1'; -- receive one fct
      WaitForCLKCycle(clk, 1);
      recvo.gotfct   <= '0';
      WaitForCLKCycle(clk, 5);
      recvo.erresc   <= '1';
      WaitForCLKCycle(clk, 1);
      recvo.erresc   <= '0';
      WaitForCLKCycle(clk, 10);
      
      test_op <= NONE;
      wait for 1000 ns; --  ns
      StopProcess(control);
   end process stimulate;
   -----------------------------------------------------------------------------
   -- Process expect
   --! \brief        generate the expected values.
   --! \details      The process defines the expected signal values.
   -----------------------------------------------------------------------------
   expect: process
   begin 
      -- INIT
      linko_exp.started    <= '0';
      linko_exp.connecting <= '0';
      linko_exp.running    <= '0';
      linko_exp.errdisc    <= '0';
      linko_exp.errpar     <= '0';
      linko_exp.erresc     <= '0';
      linko_exp.errcred    <= '0';
      linko_exp.txack      <= '0';
      linko_exp.tick_out   <= '0';
      linko_exp.ctrl_out   <= (others => '0');
      linko_exp.time_out   <= (others => '0');
      linko_exp.rxchar     <= '0';
      linko_exp.rxflag     <= '0';
      linko_exp.rxdata     <= (others => '0');
      --
      rxen_exp <= '0';
      --
      xmiti_exp.txen    <= '0';
      xmiti_exp.stnull  <= '0';
      xmiti_exp.stfct   <= '0';
      xmiti_exp.fct_in  <= '0';
      xmiti_exp.tick_in <= '0';
      xmiti_exp.ctrl_in <= (others => '0');
      xmiti_exp.time_in <= (others => '0');
      xmiti_exp.txwrite <= '0';
      xmiti_exp.txflag  <= '0';
      xmiti_exp.txdata  <= (others => '0');
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(clk, 161, false); -- 100 ns
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 739, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.stnull     <= '0' after delay;
      linko_exp.started    <= '0' after delay;
      linko_exp.connecting <= '1' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      WaitForCLKCycle(clk, 99, false);
      linko_exp.connecting <= '0' after delay;
      linko_exp.running    <= '1' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      WaitForCLKCycle(clk, 10, false);
      xmiti_exp.txdata     <= X"AA" after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txwrite    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txwrite    <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txdata     <= X"01" after delay;
      xmiti_exp.txflag     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txwrite    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txwrite    <= '0' after delay;
      xmiti_exp.txflag     <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.ctrl_in    <= "11" after delay;
      xmiti_exp.time_in    <= "01" & X"5" after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.tick_in    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.tick_in    <= '0' after delay;
      xmiti_exp.ctrl_in    <= "00" after delay;
      xmiti_exp.time_in    <= "00" & X"0" after delay;
      ----------------
      WaitForCLKCycle(clk, 100, false);
      linko_exp.errdisc    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.errdisc    <= '0' after delay;
      linko_exp.running    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 19, false);
      rxen_exp             <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 339, false);
      rxen_exp             <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 339, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.txen       <= '0' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      WaitForCLKCycle(clk, 8, false);
      linko_exp.started    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 322, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 17, false);
      xmiti_exp.stnull     <= '0' after delay;
      linko_exp.started    <= '0' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      linko_exp.connecting <= '1' after delay;
      WaitForCLKCycle(clk, 100, false);
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      xmiti_exp.fct_in     <= '0' after delay;
      linko_exp.connecting <= '0' after delay;
      WaitForCLKCycle(clk, 161, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 322, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 27, false);
      linko_exp.started    <= '0' after delay;
      linko_exp.connecting <= '1' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      WaitForCLKCycle(clk, 100, false);
      linko_exp.connecting <= '0' after delay;
      linko_exp.running    <= '1' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      WaitForCLKCycle(clk, 11, false);
      linko_exp.txack      <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.txack      <= '0' after delay;
      WaitForCLKCycle(clk, 2, false);
      linko_exp.txack      <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.txack      <= '0' after delay;
      WaitForCLKCycle(clk, 30, false);
      linko_exp.rxflag     <= '1' after delay;
      linko_exp.rxdata     <= X"01" after delay;
      WaitForCLKCycle(clk, 2, false);
      linko_exp.rxchar     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.rxchar     <= '0' after delay;
      linko_exp.rxflag     <= '0' after delay;
      linko_exp.rxdata     <= X"00" after delay;
      -- 
      WaitForCLKCycle(clk, 1, false);
      linko_exp.ctrl_out   <= "10" after delay;
      linko_exp.time_out   <= "101010" after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.tick_out   <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.tick_out   <= '0' after delay;
      linko_exp.ctrl_out   <= "00" after delay;
      linko_exp.time_out   <= "000000" after delay;
      WaitForCLKCycle(clk, 16, false);
      linko_exp.rxdata     <= X"55" after delay;
      WaitForCLKCycle(clk, 2, false);
      linko_exp.rxchar     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.rxchar     <= '0' after delay;
      linko_exp.rxdata     <= X"00" after delay;
      WaitForCLKCycle(clk, 31, false);
      linko_exp.txack      <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.txack      <= '0' after delay;
      linko_exp.errcred    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.errcred    <= '0' after delay;
      linko_exp.running    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 322, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 26, false);
      linko_exp.started    <= '0' after delay;
      linko_exp.connecting <= '1' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      WaitForCLKCycle(clk, 100, false);
      linko_exp.connecting <= '0' after delay;
      linko_exp.running    <= '1' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      WaitForCLKCycle(clk, 10, false);
      linko_exp.rxchar     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.rxchar     <= '0' after delay;
      linko_exp.errcred    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.errcred    <= '0' after delay;
      linko_exp.running    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 322, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.started    <= '0' after delay;
      linko_exp.connecting <= '1' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      WaitForCLKCycle(clk, 125, false);
      linko_exp.connecting <= '0' after delay;
      linko_exp.running    <= '1' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      WaitForCLKCycle(clk, 5, false);
      linko_exp.errpar     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.errpar     <= '0' after delay;
      linko_exp.running    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      ----------------------------------------------
      WaitForCLKCycle(clk, 160, false);
      rxen_exp             <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '1' after delay;
      WaitForCLKCycle(clk, 322, false);
      xmiti_exp.txen       <= '1' after delay;
      xmiti_exp.stnull     <= '1' after delay;
      linko_exp.started    <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.started    <= '0' after delay;
      linko_exp.connecting <= '1' after delay;
      xmiti_exp.stnull     <= '0' after delay;
      xmiti_exp.stfct      <= '1' after delay;
      WaitForCLKCycle(clk, 116, false);
      linko_exp.connecting <= '0' after delay;
      linko_exp.running    <= '1' after delay;
      xmiti_exp.stfct      <= '0' after delay;
      WaitForCLKCycle(clk, 5, false);
      linko_exp.erresc     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      linko_exp.erresc     <= '0' after delay;
      linko_exp.running    <= '0' after delay;
      rxen_exp             <= '0' after delay;
      xmiti_exp.txen       <= '0' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmiti_exp.fct_in     <= '0' after delay;
      
      WaitForCLKCycle(clk, 2000, false);
      --
      wait for 1000 ns; --  ns
      StopAtEnd( control );
   end process expect;
   -----------------------------------------------------------------------------
   -- Process monitor
   --! \brief        monitor the results.
   --! \details      The process compares the expected values with the resulting 
   --!               values from the UUT.
   -----------------------------------------------------------------------------
   monitor: process
   begin
      MonitorWaitForStart( "SpwLink", 25, CONTROL_IN ); 
      wait on control,linko_exp,rxen_exp,xmiti_exp,clk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( linko.started, linko_exp.started, "linko.started", error );
      MonitorSignal( linko.connecting, linko_exp.connecting, "linko.connecting", error );
      MonitorSignal( linko.running, linko_exp.running, "linko.running", error );
      MonitorSignal( linko.errdisc, linko_exp.errdisc, "linko.errdisc", error );
      MonitorSignal( linko.errpar, linko_exp.errpar, "linko.errpar", error );
      MonitorSignal( linko.erresc, linko_exp.erresc, "linko.erresc", error );
      MonitorSignal( linko.errcred, linko_exp.errcred, "linko.errcred", error );
      MonitorSignal( linko.txack, linko_exp.txack, "linko.txack", error );
      MonitorSignal( linko.tick_out, linko_exp.tick_out, "linko.tick_out", error );
      MonitorSignal( linko.ctrl_out, linko_exp.ctrl_out, "linko.ctrl_out", error );
      MonitorSignal( linko.time_out, linko_exp.time_out, "linko.time_out", error );
      MonitorSignal( linko.rxchar, linko_exp.rxchar, "linko.rxchar", error );
      MonitorSignal( linko.rxflag, linko_exp.rxflag, "linko.rxflag", error );
      MonitorSignal( linko.rxdata, linko_exp.rxdata, "linko.rxdata", error );
      
      MonitorSignal( rxen, rxen_exp, "rxen", error );
      
      MonitorSignal( xmiti.txen, xmiti_exp.txen, "xmiti.txen", error );
      MonitorSignal( xmiti.stnull, xmiti_exp.stnull, "xmiti.stnull", error );
      MonitorSignal( xmiti.stfct, xmiti_exp.stfct, "xmiti.stfct", error );
      MonitorSignal( xmiti.fct_in, xmiti_exp.fct_in, "xmiti.fct_in", error );
      MonitorSignal( xmiti.tick_in, xmiti_exp.tick_in, "xmiti.tick_in", error );
      MonitorSignal( xmiti.ctrl_in, xmiti_exp.ctrl_in, "xmiti.ctrl_in", error );
      MonitorSignal( xmiti.time_in, xmiti_exp.time_in, "xmiti.time_in", error );
      MonitorSignal( xmiti.txwrite, xmiti_exp.txwrite, "xmiti.txwrite", error );
      MonitorSignal( xmiti.txflag, xmiti_exp.txflag, "xmiti.txflag", error );
      MonitorSignal( xmiti.txdata, xmiti_exp.txdata, "xmiti.txdata", error );

   end process monitor;
end architecture TC1SpwLink_beh;
--------------------------------------------------------------------------------
-- end TC1SpwLink.vhd
--------------------------------------------------------------------------------