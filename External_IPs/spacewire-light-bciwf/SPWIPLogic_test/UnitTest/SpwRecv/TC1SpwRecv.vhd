--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1SpwRecv.vhd
--!
--! \brief        implementation of the SpwRecv unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1SpwRecv (BEH) (entity, architecture)
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
--! SPWIP SpwRecv unit
use SPWIP.SpwRecv; 


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
-- Entity TC1SpwRecv
--! \brief        TC1SpwRecv - test case 1 of the SpwRecv unit.
--! \details      The unit executes the test case 1. Receive different type of 
--!               data and control characters. Evaluate disconnect and parity errors.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC1SpwRecv is 
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
end entity TC1SpwRecv;
--------------------------------------------------------------------------------
-- Architecture TC1SpwRecv_beh
--! \brief  implementation of the test case 1 for the SpwRecv unit.
--------------------------------------------------------------------------------
architecture TC1SpwRecv_beh of TC1SpwRecv is 
   -----------------------------------------------------------------------------
   -- Component SpwRecv
   --! \brief  SpaceWire receiver.
   -----------------------------------------------------------------------------
   component SpwRecv is 
      generic ( 
         DISCONNECT_TIME : integer range 1 to 255; --! Disconnect timeout, expressed in system clock cycles.
         RXCHUNK         : integer range 1 to 6  --! Nr of bits sampled per system clock cycle.
      );
      port ( 
         CLK      : in  std_logic;                            --! unit clock.
         RST_N    : in  std_logic;                            --! unit reset (active-low).
         RXEN     : in  std_logic;                            --! High to enable receiver; low to disable and reset receiver.
         RECVO    : out spw_recv_out_type;                    --! Output signals to spwlink.
         INACT    : in  std_logic;                            --! High if there has been recent activity on the input lines.
         INBVALID : in  std_logic;                            --! High if INBITS contains a valid group of received bits.
         INBITS   : in  std_logic_vector(RXCHUNK-1 downto 0)  --! Received bits from receiver front-end.
      );
   end component SpwRecv;

   constant DISCONNECT_TIME : integer := integer(SYSFREQ * 850.0e-9); --! disconnect time (850 ns) in system clocks.
   ---------------------------------------------------------------------------
   signal control : result;  --! internal execution result
   signal error   : integer := 0; --! error counter
   ---------------------------------------------------------------------------
   signal rxen       : std_logic;          --! receiver enable signal to spwrecv.
   signal recvo      : spw_recv_out_type;  --! output signals from spwrecv.
   signal inact      : std_logic;          --! high if there has been recent activity on the input lines.
   signal inbvalid   : std_logic;          --! high if inbits contains a valid group of received bits.
   signal inbits     : std_logic_vector(RXCHUNK-1 downto 0);   --! received bits.

   signal clk        : std_logic;     --! UUT System clock
   signal rst_n      : std_logic;     --! UUT System reset
   ---------------------------------------------------------------------------
   signal recvo_exp  : spw_recv_out_type;  --! expected output signals from spwrecv
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   type test_op_type is ( NONE, SEND_NULL, SEND_FCT, SEND_DATA, SEND_TIMECODE,
                          SEND_EOP_EPP, SEND_ERRESC, SEND_ERRPAR, SEND_ERRDISC);
   signal test_op : test_op_type := NONE;
   ---------------------------------------------------------------------------
begin
   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
   UUT: SpwRecv
   generic map(DISCONNECT_TIME, RXCHUNK)
   port map( clk, rst_n, rxen, recvo, inact, inbvalid, inbits);

   -----------------------------------------------------------------------------
   -- Process executeTC
   --! \brief        test case execution.
   --! \details      The process execute the test case and stop it if the end of 
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
   --! \details      The process stimulates the UUT as a as a BFM of the 
   --!               Spwstream wrapper unit. 
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulate: process
   begin
      -- INIT UUT inputs
      test_op <= NONE;
      rst_n <= '0';
      --
      rxen <= '0';
      inact <= '0';
      inbvalid <= '0';
      inbits <= (others => '0');
      
      WaitForStart( CONTROL_IN );
      wait for 100 ns; -- 0 fs
      rst_n <= '1';
      WaitForCLKCycle(clk, 5); -- 100 ns
      rxen <= '1';
      WaitForCLKCycle(clk, 5); -- 100 ns
      ----------------------------
      ---------
      test_op <= SEND_NULL;
      INACT <= '1';
      wait for 40 ns; --1252923 ns
      INACT <= '0';
      wait for 160 ns; --1252963 ns
      INACT <= '1';
      wait for 40 ns; --1253123 ns
      INACT <= '0';
      wait for 160 ns; --1253163 ns
      INACT <= '1';
      wait for 40 ns; --1253323 ns
      INACT <= '0';
      wait for 80 ns; --1253363 ns
      INBITS <= "011100";
      wait for 80 ns; --1253443 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1253523 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1253563 ns
      INACT <= '1';
      wait for 40 ns; --1253723 ns
      INACT <= '0';
      wait for 160 ns; --1253763 ns
      INACT <= '1';
      wait for 40 ns; --1253923 ns
      INACT <= '0';
      wait for 80 ns; --1253963 ns
      INBITS <= "110001";
      wait for 80 ns; --1254043 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1254123 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1254163 ns
      INACT <= '1';
      wait for 40 ns; --1254323 ns
      INACT <= '0';
      wait for 160 ns; --1254363 ns
      INACT <= '1';
      wait for 40 ns; --1254523 ns
      INACT <= '0';
      wait for 80 ns; --1254563 ns
      INBITS <= "000101";
      wait for 80 ns; --1254643 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1254723 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1254763 ns
      INACT <= '1';
      wait for 40 ns; --1254923 ns
      INACT <= '0';
      wait for 160 ns; --1254963 ns
      INACT <= '1';
      wait for 40 ns; --1255123 ns
      INACT <= '0';
      wait for 80 ns; --1255163 ns
      INBITS <= "010111";
      wait for 80 ns; --1255243 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1255323 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1255363 ns
      INACT <= '1';
      wait for 40 ns; --1255523 ns
      INACT <= '0';
      wait for 160 ns; --1255563 ns
      INACT <= '1';
      wait for 40 ns; --1255723 ns
      INACT <= '0';
      wait for 80 ns; --1255763 ns
      INBITS <= "000100";
      wait for 80 ns; --1255843 ns
      ---------
      test_op <= SEND_FCT;
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1255923 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1255963 ns
      INACT <= '1';
      wait for 40 ns; --1256123 ns
      INACT <= '0';
      wait for 160 ns; --1256163 ns
      INACT <= '1';
      wait for 40 ns; --1256323 ns
      INACT <= '0';
      wait for 80 ns; --1256363 ns
      INBITS <= "010001";
      wait for 80 ns; --1256443 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1256523 ns
      INBITS <= "000000";
      INBVALID <= '0';
      INACT <= '0';
      wait for 160 ns; --1256563 ns
      INACT <= '1';
      wait for 40 ns; --1256723 ns
      INACT <= '0';
      wait for 160 ns; --1256763 ns
      INACT <= '1';
      wait for 40 ns; --1256923 ns
      INACT <= '0';
      wait for 80 ns; --1256963 ns
      INBITS <= "000100";
      wait for 80 ns; --1257043 ns
      INBVALID <= '1';
      INACT <= '1';
      wait for 40 ns; --1257123 ns
      INBITS <= "010001";
      INBVALID <= '0';
      wait for 40 ns; --1257163 ns
      INBVALID <= '1';
      wait for 40 ns; --1257203 ns
      INBITS <= "000100";
      INBVALID <= '0';
      wait for 40 ns; --1257243 ns
      INBVALID <= '1';
      wait for 40 ns; --1257283 ns
      INBITS <= "010111";
      wait for 40 ns; --1257323 ns
      -------------
      test_op <= SEND_DATA;
      INBITS <= "011100";
      INBVALID <= '0';
      wait for 40 ns; --1257363 ns
      INBVALID <= '1';
      wait for 40 ns; --1257403 ns
      INBITS <= "101001";
      wait for 40 ns; --1257443 ns
      INBITS <= "010000";
      INBVALID <= '0';
      wait for 40 ns; --1257483 ns
      INBVALID <= '1';
      wait for 40 ns; --1257523 ns
      INBITS <= "011100";
      wait for 40 ns; --1257563 ns
      INBITS <= "110001";
      INBVALID <= '0';
      wait for 40 ns; --1257603 ns
      INBVALID <= '1';
      wait for 40 ns; --1257643 ns
      INBITS <= "000101";
      wait for 40 ns; --1257683 ns
      INBITS <= "010111";
      INBVALID <= '0';
      wait for 40 ns; --1257723 ns
      INBVALID <= '1';
      wait for 40 ns; --1257763 ns
      INBITS <= "011100";
      wait for 40 ns; --1257803 ns
      INBITS <= "110001";
      INBVALID <= '0';
      wait for 40 ns; --1257843 ns
      INBVALID <= '1';
      wait for 40 ns; --1257883 ns
      INBITS <= "000101";
      wait for 40 ns; --1257923 ns
      INBITS <= "010111";
      INBVALID <= '0';
      wait for 40 ns; --1257963 ns
      INBVALID <= '1';
      wait for 40 ns; --1258003 ns
      INBITS <= "011100";
      wait for 40 ns; --1258043 ns
      INBITS <= "110001";
      INBVALID <= '0';
      wait for 40 ns; --1258083 ns
      INBVALID <= '1';
      wait for 40 ns; --1258123 ns
      INBITS <= "000101";
      wait for 40 ns; --1258163 ns
      INBITS <= "010111";
      INBVALID <= '0';
      wait for 40 ns; --1258203 ns
      INBVALID <= '1';
      wait for 40 ns; --1258243 ns
      INBITS <= "011100";
      wait for 40 ns; --1258283 ns
      INBITS <= "110001";
      INBVALID <= '0';
      wait for 40 ns; --1258323 ns
      INBVALID <= '1';
      wait for 40 ns; --1258363 ns
      INBITS <= "100101";
      wait for 40 ns; --1258403 ns
      INBITS <= "011110";
      INBVALID <= '0';
      wait for 40 ns; --1258443 ns
      
      
      INBVALID <= '1';
       wait for 40 ns; --1258483 ns
      INBITS <= "110000";
       wait for 40 ns; --1258523 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1258563 ns
      INBVALID <= '1';
       wait for 40 ns; --1258603 ns
      INBITS <= "010111";
       wait for 40 ns; --1258643 ns
      INBITS <= "011100";
      INBVALID <= '0';
       wait for 40 ns; --1258683 ns
      INBVALID <= '1';
       wait for 40 ns; --1258723 ns
      INBITS <= "110001";
       wait for 40 ns; --1258763 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1258803 ns
      INBVALID <= '1';
       wait for 40 ns; --1258843 ns
      INBITS <= "010111";
       wait for 40 ns; --1258883 ns
      INBITS <= "011100";
      INBVALID <= '0';
       wait for 40 ns; --1258923 ns
      INBVALID <= '1';
       wait for 40 ns; --1258963 ns
      INBITS <= "110001";
       wait for 40 ns; --1259003 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1259043 ns
      INBVALID <= '1';
       wait for 40 ns; --1259083 ns
      INBITS <= "010111";
       wait for 40 ns; --1259123 ns
      INBITS <= "011100";
      INBVALID <= '0';
       wait for 40 ns; --1259163 ns
      INBVALID <= '1';
       wait for 40 ns; --1259203 ns
      INBITS <= "110001";
       wait for 40 ns; --1259243 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1259283 ns
      INBVALID <= '1';
       wait for 40 ns; --1259323 ns
      INBITS <= "010111";
       wait for 40 ns; --1259363 ns
      INBITS <= "011100";
      INBVALID <= '0';
       wait for 40 ns; --1259403 ns
      INBVALID <= '1';
       wait for 40 ns; --1259443 ns
      INBITS <= "110001";
       wait for 40 ns; --1259483 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1259523 ns
      INBVALID <= '1';
       wait for 40 ns; --1259563 ns
      INBITS <= "010111";
       wait for 40 ns; --1259603 ns
      INBITS <= "011100";
      INBVALID <= '0';
       wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "110001";
       wait for 40 ns; --1259723 ns
      INBITS <= "000101";
      INBVALID <= '0';
      -------------------------------------
      test_op <= SEND_EOP_EPP;
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "111101";
       wait for 40 ns; --1259723 ns
      INBITS <= "011110";
      INBVALID <= '0';
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "110001";
       wait for 40 ns; --1259723 ns
      INBITS <= "000101";
      INBVALID <= '0';
       wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "010111";
       wait for 40 ns; --1259723 ns
      INBITS <= "111100";
      INBVALID <= '0';
      wait for 40 ns; --1259643 ns
      ------------------------------------
      test_op <= SEND_TIMECODE;
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "001010";
       wait for 40 ns; --1259723 ns
      INBITS <= "110101";
      INBVALID <= '0';
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "010011";
       wait for 40 ns; --1259723 ns
      INBITS <= "001011";
      INBVALID <= '0';
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "010111";
       wait for 40 ns; --1259723 ns
      INBITS <= "011100";
      INBVALID <= '0';
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
       wait for 40 ns; --1259683 ns
      INBITS <= "110001";
      INBVALID <= '0';
      --
      test_op <= SEND_ERRESC;
      wait for 40 ns; --1259643 ns
      INBVALID <= '1';
      wait for 40 ns; --1259683 ns
      INBITS <= "011101";
       wait for 40 ns; --1259723 ns
      INBITS <= "110111";
      --
      test_op <= SEND_ERRPAR;
      wait for 40 ns; --1259683 ns
      INBITS <= "011111";
       wait for 40 ns; --1259723 ns
      INBITS <= "110111";
      wait for 40 ns; --1259723 ns
      INBITS <= "000000";
      INBVALID <= '0';
      ----------
      INACT <= '0';
      test_op <= SEND_ERRDISC;
      wait for 1200 ns;
      rxen <= '0';

      wait for 1000 ns; --  ns
      StopProcess(control);
   end process stimulate;
   -----------------------------------------------------------------------------
   -- Process expect
   --! \brief        generate the expected values.
   --! \details      The process define the expected signal values.
   -----------------------------------------------------------------------------
   expect: process
   begin 
      -- initialize
      recvo_exp.gotnull    <= '0' after delay;
      recvo_exp.gotfct     <= '0' after delay;
      recvo_exp.tick_out   <= '0' after delay;
      recvo_exp.ctrl_out   <= (others => '0') after delay;
      recvo_exp.time_out   <= (others => '0') after delay;
      recvo_exp.rxchar     <= '0' after delay;
      recvo_exp.rxflag     <= '0' after delay;
      recvo_exp.rxdata     <= (others => '0') after delay;
      recvo_exp.errdisc    <= '0' after delay;
      recvo_exp.errpar     <= '0' after delay;
      recvo_exp.erresc     <= '0' after delay;

      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(clk, 1, false); -- 100 ns
      ------
      WaitForCLKCycle(clk, 40, false);
      recvo_exp.gotnull    <= '1' after delay;
      WaitForCLKCycle(clk, 60, false);
      recvo_exp.gotfct     <= '1' after delay;
      WaitForCLKCycle(clk, 2, false); 
      recvo_exp.gotfct     <= '0' after delay;
      WaitForCLKCycle(clk, 13, false);
      recvo_exp.gotfct     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.gotfct     <= '0' after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.gotfct     <= '1' after delay;
      WaitForCLKCycle(clk, 4, false); 
      recvo_exp.gotfct     <= '0' after delay;
      WaitForCLKCycle(clk, 5, false); 
      recvo_exp.time_out   <= "100001" after delay;
      recvo_exp.rxchar     <= '1' after delay;
      recvo_exp.rxdata     <= "00100001" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.rxchar     <= '0' after delay;
      WaitForCLKCycle(clk, 23, false); 
      recvo_exp.time_out   <= "001111" after delay;
      recvo_exp.rxchar     <= '1' after delay;
      recvo_exp.rxdata     <= "00001111" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.rxchar     <= '0' after delay;
      WaitForCLKCycle(clk, 33, false);
      recvo_exp.rxchar     <= '1' after delay;
      recvo_exp.rxflag     <= '1' after delay;
      recvo_exp.rxdata     <= "00000000" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.rxdata     <= "00000001" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.rxchar     <= '0' after delay;
      WaitForCLKCycle(clk, 8, false); 
      recvo_exp.tick_out   <= '1' after delay;
      recvo_exp.ctrl_out   <= "10" after delay;
      recvo_exp.time_out   <= "100101" after delay;
      recvo_exp.rxdata     <= "10100101" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.tick_out   <= '0' after delay;
      WaitForCLKCycle(clk, 3, false); 
      recvo_exp.tick_out   <= '1' after delay;
      recvo_exp.ctrl_out   <= "01" after delay;
      recvo_exp.time_out   <= "011010" after delay;
      recvo_exp.rxdata     <= "01011010" after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.tick_out   <= '0' after delay;
      WaitForCLKCycle(clk, 5, false); 
      recvo_exp.erresc     <= '1' after delay;
      WaitForCLKCycle(clk, 1, false); 
      recvo_exp.errpar     <= '1' after delay;
      WaitForCLKCycle(clk, 22, false); 
      recvo_exp.errdisc    <= '1' after delay;
      WaitForCLKCycle(clk, 9, false); 
      recvo_exp.gotnull    <= '0' after delay;
      recvo_exp.ctrl_out   <= "00" after delay;
      recvo_exp.time_out   <= "000000" after delay;
      recvo_exp.rxflag     <= '0' after delay;
      recvo_exp.rxdata     <= "00000000" after delay;
      recvo_exp.errdisc    <= '0' after delay;
      recvo_exp.errpar     <= '0' after delay;
      recvo_exp.erresc     <= '0' after delay;
      
      --
      wait for 1000 ns; --  ns
      StopAtEnd( control );
   end process expect;
   -----------------------------------------------------------------------------
   -- Process monitor
   --! \brief        monitor the results.
   --! \details      The process compare the expected values with the resulting 
   --!               values from the UUT.
   -----------------------------------------------------------------------------
   monitor: process
   begin
      MonitorWaitForStart( "SpwRecv", 11, CONTROL_IN ); 
      wait on control,recvo_exp,clk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( recvo.gotnull, recvo_exp.gotnull, "recvo.gotnull", error );
      MonitorSignal( recvo.gotfct, recvo_exp.gotfct, "recvo.gotfct", error );
      MonitorSignal( recvo.tick_out, recvo_exp.tick_out, "recvo.tick_out", error );
      MonitorSignal( recvo.ctrl_out, recvo_exp.ctrl_out, "recvo.ctrl_out", error );
      MonitorSignal( recvo.time_out, recvo_exp.time_out, "recvo.time_out", error );
      MonitorSignal( recvo.rxchar, recvo_exp.rxchar, "recvo.rxchar", error );
      MonitorSignal( recvo.rxflag, recvo_exp.rxflag, "recvo.rxflag", error );
      MonitorSignal( recvo.rxdata, recvo_exp.rxdata, "recvo.rxdata", error );
      MonitorSignal( recvo.errdisc, recvo_exp.errdisc, "recvo.errdisc", error );
      MonitorSignal( recvo.errpar, recvo_exp.errpar, "recvo.errpar", error );
      MonitorSignal( recvo.erresc, recvo_exp.erresc, "recvo.erresc", error );
   end process monitor;
end architecture TC1SpwRecv_beh;
--------------------------------------------------------------------------------
-- end TC1SpwRecv.vhd
--------------------------------------------------------------------------------