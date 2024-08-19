--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1SpwRam.vhd
--!
--! \brief        implementation of the SpwRam unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1SpwRam (BEH) (entity, architecture)
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
--! SPWIP SpwRam unit
use SPWIP.SpwRam;

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
-- Entity TC1SpwRam
--! \brief        TC1SpwRam - test case 1 of the SpwRam unit. 
--! \details      The unit executes the test case 1. Evaluate the behavior as a 
--!               synchronous RAM (RCLK = WCLK). Perform write operations, read
--!               operations and simultaneous read and write operations.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC1SpwRam is 
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
end entity TC1SpwRam;
--------------------------------------------------------------------------------
-- Architecture TC1SpwRam_beh
--! \brief  implementation of the test case 1 for the SpwRam unit.
--------------------------------------------------------------------------------
architecture TC1SpwRam_beh of TC1SpwRam is 
   -----------------------------------------------------------------------------
   -- Component SpwRam
   --! \brief  Synchronous two-port RAM.
   -----------------------------------------------------------------------------
   component SpwRam is 
      generic ( 
         ABITS : integer; --! number of address bits.
         DBITS : integer  --! number of data bits.
      );
      port ( 
         RADDR  : in std_logic_vector (ABITS-1 downto 0);  --! read address.
         REN    : in std_logic;                            --! read enable.
         WADDR  : in std_logic_vector (ABITS-1 downto 0);  --! write address.
         WDATA  : in std_logic_vector (DBITS-1 downto 0);  --! write data.
         WEN    : in std_logic;                            --! write enable.
         RCLK   : in std_logic;                            --! read clock.
         WCLK   : in std_logic;                            --! write clock.
         RRST_N : in std_logic;                            --! read clock syncd unit reset (active-low).
         WRST_N : in std_logic;                            --! write clock syncd unit reset (active-low).
         RDATA  : out std_logic_vector (DBITS-1 downto 0)  --! read data.
      );
   end component SpwRam;

   -----------------------------------------------------------------------------
   signal control : result;  --! internal execution result
   signal error   : integer := 0; --! error counter
   -----------------------------------------------------------------------------
   signal ren     : std_logic;                                    --! read enable
   signal raddr   : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! read address
   signal rdata   : std_logic_vector(8 downto 0);                 --! read data
   signal wen     : std_logic;                                    --! write enable
   signal waddr   : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! write address
   signal wdata   : std_logic_vector(8 downto 0);                 --! write data
   
   signal clk     : std_logic;        --! UUT System clock
   signal rst_n   : std_logic;        --! UUT System reset
   -----------------------------------------------------------------------------
   signal rdata_exp : std_logic_vector(8 downto 0);    --! read data from SpwRam
   ---------------------------------------------------------------------------
   type test_op_type is ( NONE, WRITE_DATA, READ_DATA, READ_WRITE_DATA );
   signal test_op : test_op_type := NONE;
   -----------------------------------------------------------------------------
begin
   -----------------------------------------------------------------------------
   -- Unit under test
   -----------------------------------------------------------------------------
   UUT: SpwRam
   generic map(RXFIFOSIZE_BITS, 9)
   port map( raddr, ren, waddr, wdata, wen, clk, clk, rst_n, rst_n, rdata);

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
   --! \details      The process sends data and commands to the UUT as a BFM of the 
   --!               TargetCmdDecode unit. Also send packet data to the write buffer
   --!               interface when a write command is performed and read data from 
   --!               read buffer interface when a read command is performed.
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulate: process
   begin
      -- INIT UUT inputs
      test_op <= NONE;
      rst_n   <= '0';
      --
      ren     <= '0';
      raddr   <= (others => '0');
      wen     <= '0';
      waddr   <= (others => '0');
      wdata   <= (others => '0');
 
      WaitForStart( CONTROL_IN );
      wait for 100 ns; -- 0 fs
      rst_n   <= '1';
      WaitForCLKCycle(clk, 1); -- 100 ns
      ---------------------------------------
      -- write operations
      test_op <= WRITE_DATA;
      WaitForCLKCycle(clk, 5); 
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(0, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(1, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(1, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(2, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(2, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(3, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(3, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(4, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(4, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(5, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(63, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(511, wdata'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      
      ---------------------------------------
      -- read operations
      test_op <= READ_DATA;
      WaitForCLKCycle(clk, 2);
      ren     <= '1';
      WaitForCLKCycle(clk, 3);
      --
      raddr   <= std_logic_vector(to_unsigned(0, raddr'length));
      WaitForCLKCycle(clk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(1, raddr'length));
      WaitForCLKCycle(clk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(2, raddr'length));
      WaitForCLKCycle(clk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(3, raddr'length));
      WaitForCLKCycle(clk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(4, raddr'length));
      WaitForCLKCycle(clk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(63, raddr'length));
      WaitForCLKCycle(clk, 1);
      
      ---------------------------------------
      -- simultaneous read and write operations
      test_op <= READ_WRITE_DATA;
      WaitForCLKCycle(clk, 5);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(0, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(5, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(0, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(1, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(6, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(1, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(2, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(7, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(2, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(3, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(8, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(3, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(4, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(9, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(4, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
      --
      wen     <= '1';
      waddr   <= std_logic_vector(to_unsigned(63, waddr'length));
      wdata   <= std_logic_vector(to_unsigned(63, wdata'length));
      raddr   <= std_logic_vector(to_unsigned(63, raddr'length));
      WaitForCLKCycle(clk, 1);
      wen     <= '0';
      WaitForCLKCycle(clk, 1);
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
      rdata_exp <= (others => '0') after delay;
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(clk, 1, false); -- 100 ns
     
      ---------------------------------------
      -- write operations (no output)
      WaitForCLKCycle(clk, 19, false);
      ---------------------------------------
      -- read operations 
      rdata_exp <= '0' & X"01" after delay;
      WaitForCLKCycle(clk, 4, false); 
      rdata_exp <= '0' & X"02" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"03" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"04" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"05" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '1' & X"FF" after delay;
      ---------------------------------------
      -- read and write operations 
      WaitForCLKCycle(clk, 6, false);
      rdata_exp <= '0' & X"01" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"05" after delay;
      WaitForCLKCycle(clk, 1, false); 
      --
      rdata_exp <= '0' & X"02" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"06" after delay;
      WaitForCLKCycle(clk, 1, false); 
      --
      rdata_exp <= '0' & X"03" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"07" after delay;
      WaitForCLKCycle(clk, 1, false); 
      --
      rdata_exp <= '0' & X"04" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"08" after delay;
      WaitForCLKCycle(clk, 1, false); 
      --
      rdata_exp <= '0' & X"05" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"09" after delay;
      WaitForCLKCycle(clk, 1, false); 
      --
      rdata_exp <= '1' & X"FF" after delay;
      WaitForCLKCycle(clk, 1, false); 
      rdata_exp <= '0' & X"3F" after delay;
      WaitForCLKCycle(clk, 1, false); 
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
      MonitorWaitForStart( "SpwRam", 1, CONTROL_IN ); 
      wait on control,rdata_exp,clk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( rdata, rdata_exp, "rdata", error );
   end process monitor;
end architecture TC1SpwRam_beh;
--------------------------------------------------------------------------------
-- end TC1SpwRam.vhd
--------------------------------------------------------------------------------