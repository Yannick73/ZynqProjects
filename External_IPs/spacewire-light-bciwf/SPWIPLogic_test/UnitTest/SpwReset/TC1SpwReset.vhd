--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1SpwReset.vhd
--!
--! \brief        implementation of the SpwReset unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1SpwReset (BEH) (entity, architecture)
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
--! SPWIP SpwReset unit
use SPWIP.SpwReset; 

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
-- Entity TC1SpwReset
--! \brief        TC1SpwReset - test case 1 of the SpwReset unit.
--! \details      The unit executes the test case 1. Assert asynchronous input reset
--!               and wait for a reset delay before de-assert the input reset.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC1SpwReset is 
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
end entity TC1SpwReset;
--------------------------------------------------------------------------------
-- Architecture TC1SpwReset_beh
--! \brief  implementation of the test case 1 for the SpwReset unit.
--------------------------------------------------------------------------------
architecture TC1SpwReset_beh of TC1SpwReset is 
   -----------------------------------------------------------------------------
   -- Component SpwReset
   --! \brief  Reset logic with asynchronous assert, synchronous de-assert.
   -----------------------------------------------------------------------------
   component SpwReset is 
      generic ( 
         RESET_LATENCY : integer range 1 to 64 := 4  --! latency (in clk cycles) of reset after ARST_N de-assert.
      );
      port ( 
         CLK    : in  std_logic; --! unit clock (target clock domain).
         ARST_N : in std_logic;  --! asynchronous reset (active-low).
         SRST_N : out std_logic  --! output reset, synchronous de-assert (active-low).
      );
   end component SpwReset;
   ---------------------------------------------------------------------------
   signal control : result;  --! internal execution result
   signal error   : integer := 0; --! error counter
   ---------------------------------------------------------------------------
   
   signal clk               : std_logic;     --! UUT System clock
   signal arst_n            : std_logic;     --! UUT asynchronous reset
   signal sync_rst_n        : std_logic;     --! UUT synchronous reset output
   ---------------------------------------------------------------------------
   signal sync_rst_n_exp    : std_logic;     --! UUT synchronous reset output expected
   ---------------------------------------------------------------------------

   type test_op_type is ( NONE );
   signal test_op : test_op_type := NONE;
   ---------------------------------------------------------------------------
begin
   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
   UUT: SpwReset
   generic map(1)
   port map( clk, arst_n, sync_rst_n);
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
   --! \details      The process sets the asynchronous reset
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulate: process
     variable rv         : RandomPType;
     variable resetdelay  : time;
   begin
      -- INIT UUT inputs
      test_op <= NONE;
      arst_n <= '0';
      rv.InitSeed( integer'image(5*SEED) );
      resetdelay := rv.RandTime(50 ns, 450 ns);
      
      WaitForStart( CONTROL_IN );
      wait for 100 ns; -- 0 fs
      ------------
      wait for resetdelay;
      arst_n <= '1';
      resetdelay := rv.RandTime(500 ns, 1000 ns);
      wait for resetdelay;
      ------
      arst_n <= '0';
      resetdelay := rv.RandTime(500 ns, 1000 ns);
      wait for resetdelay;
      arst_n <= '1';
      --
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
      sync_rst_n_exp   <= '0' after delay;
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(clk, 1, false); -- 100 ns
      
      WaitForCLKCycle(clk, 12, false); -- 100 ns
      sync_rst_n_exp   <= '1' after delay;
      wait until sync_rst_n = '0';
      sync_rst_n_exp   <= '0' after delay;
      WaitForCLKCycle(clk, 19, false); -- 100 ns
      sync_rst_n_exp   <= '1' after delay;

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
      MonitorWaitForStart( "SpwReset", 1, CONTROL_IN ); 
      wait on control,sync_rst_n_exp,clk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( sync_rst_n, sync_rst_n_exp, "sync_rst_n", error );
   end process monitor;
end architecture TC1SpwReset_beh;
--------------------------------------------------------------------------------
-- end TC1SpwReset.vhd
--------------------------------------------------------------------------------