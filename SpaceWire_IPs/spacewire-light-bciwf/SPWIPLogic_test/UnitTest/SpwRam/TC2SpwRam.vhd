--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC2SpwRam.vhd
--!
--! \brief        implementation of the SpwRam unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC2SpwRam (BEH) (entity, architecture)
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
-- Entity TC2SpwRam
--! \brief        TC2SpwRam - test case 2 of the SpwRam unit. 
--! \details      The unit executes the test case 2. Evaluate the behavior as an 
--!               asynchronous RAM (RCLK /= WCLK). Read enable (REN) is always '1'.
--!               Perform write and read operations at different frequency and phase.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC2SpwRam is 
   generic ( 
      SEED           : integer      := 1;    --! seed for random generation.
      UUT_T_READCLK  : time         := 40 ns;--! clk period of the read clk
                                             --! signal for UUT.
      UUT_T_WRITECLK : time         := 20 ns;--! clk period of the write clk
      HOLD_TIME      : delay_length := 1 ns; --! the default hold time.
      DELAY          : delay_length := 2 ns
      );
   port ( 
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
      );
end entity TC2SpwRam;
--------------------------------------------------------------------------------
-- Architecture TC2SpwRam_beh
--! \brief  implementation of the test case 2 for the SpwRam unit.
--------------------------------------------------------------------------------
architecture TC2SpwRam_beh of TC2SpwRam is 
   -- constants defined as in SpwRecvFront entity
   constant RXCHUNK : integer range 1 to 6 := 6; --! maximum number of bits received per system clock.
   type memwidth_array_type is array(1 to 6) of integer; --! MEMWIDTH array type is the width of bit groups in cyclic buffer.
   constant CHUNK_TO_MEMWIDTH : memwidth_array_type := ( 2, 2, 3, 4, 5, 6 ); --! chunk to memwidth mapper.
   constant MEMWIDTH : integer := CHUNK_TO_MEMWIDTH(RXCHUNK); --! memwidth for fifo.
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
   signal raddr   : std_logic_vector(3-1 downto 0);         --! read address
   signal rdata   : std_logic_vector(MEMWIDTH-1 downto 0);  --! read data
   signal wen     : std_logic;                              --! write enable
   signal waddr   : std_logic_vector(3-1 downto 0);         --! write address
   signal wdata   : std_logic_vector(MEMWIDTH-1 downto 0);  --! write data
   
   signal rclk    : std_logic;        --! UUT read clock
   signal wclk    : std_logic;        --! UUT write clock
   signal rrst_n  : std_logic;        --! UUT read clock syncd reset
   signal wrst_n  : std_logic;        --! UUT write clock syncd reset
   -----------------------------------------------------------------------------
   signal rdata_exp : std_logic_vector(MEMWIDTH-1 downto 0);    --! read data from SpwRam

begin
   -----------------------------------------------------------------------------
   -- Unit under test
   -----------------------------------------------------------------------------
   UUT: SpwRam
   generic map(3, MEMWIDTH)
   port map( raddr, '1', waddr, wdata, wen, rclk, wclk, rrst_n, wrst_n, rdata );

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
   -- Process clockRead
   --! \brief        generate the read clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_READCLK generic.
   -----------------------------------------------------------------------------
   clockRead: process
      variable rv         : RandomPType;
      variable initdelay  : time;
   begin
      -- initialize
      rclk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED) );
      initdelay := rv.RandTime(0 ns, UUT_T_READCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         rclk <= '0';
         wait for UUT_T_READCLK/2;
         rclk <= '1';
         wait for UUT_T_READCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockRead;

   -----------------------------------------------------------------------------
   -- Process clockWrite
   --! \brief        generate the read clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_WRITECLK generic.
   -----------------------------------------------------------------------------
   clockWrite: process
      variable rv         : RandomPType;
      variable initdelay2  : time;
   begin
      -- initialize
      wclk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED) );
      initdelay2 := rv.RandTime(0 ns, UUT_T_WRITECLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay2;
      loop
         wclk <= '0';
         wait for UUT_T_WRITECLK/2;
         wclk <= '1';
         wait for UUT_T_WRITECLK/2;
         StopAtEnd( control );
      end loop;
   end process clockWrite;
   
   -----------------------------------------------------------------------------
   -- Process stimulateWrite
   --! \brief        Reading process for UUT.
   --! \details      The process controls the write interface of the UUT.
   --!               
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulateWrite: process
   begin
      -- INIT UUT inputs
      wrst_n <= '0';
      wen    <= '0';
      waddr  <= (others => '0');
      wdata  <= (others => '0');
      
      WaitForStart( CONTROL_IN );
      WaitForCLKCycle(wclk, 5, false); 
      wrst_n <= '1';
      WaitForCLKCycle(wclk,5); -- 100 ns
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(0, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(1, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(1, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(3, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(2, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(7, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(3, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(15, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(4, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(31, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(5, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(63, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(6, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(62, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(7, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(60, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
      wen    <= '1';
      waddr  <= std_logic_vector(to_unsigned(0, waddr'length));
      wdata  <= std_logic_vector(to_unsigned(56, wdata'length));
      WaitForCLKCycle(wclk,1);
      wen    <= '0';
      WaitForCLKCycle(wclk,3);
      --
   wait for 1000 ns; --  ns
      StopProcess(control);
   end process stimulateWrite;
   
   -----------------------------------------------------------------------------
   -- Process stimulateRead
   --! \brief        Reading process for UUT.
   --! \details      The process controls the read interface of the UUT.
   --!               
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulateRead: process
   begin
      -- INIT UUT inputs
      rrst_n <= '0';
      
      raddr <= (others => '0');

      WaitForStart( CONTROL_IN );
      WaitForCLKCycle(rclk, 5, false); 
      rrst_n <= '1';
      WaitForCLKCycle(rclk, 10);
      ---------------------------------------
      --  read operations
      --
      raddr   <= std_logic_vector(to_unsigned(0, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(1, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(2, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(3, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(4, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(5, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(6, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(7, raddr'length));
      WaitForCLKCycle(rclk, 1);
      --
      raddr   <= std_logic_vector(to_unsigned(0, raddr'length));
      WaitForCLKCycle(rclk, 1);
      
      wait for 1000 ns; --  ns
      StopProcess(control);
   end process stimulateRead;
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
      WaitForCLKCycle(rclk, 1, false); -- 100 ns
     
      WaitForCLKCycle(rclk, 2, false);
      WaitForCLKCycle(wclk, 1, false); -- wait for rising edge of wclk because the data output is updated after writing
      rdata_exp <= "00" & X"1" after delay;
      WaitForCLKCycle(rclk, 11, false);
      --
      rdata_exp <= "00" & X"3" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "00" & X"7" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "00" & X"F" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "01" & X"F" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "11" & X"F" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "11" & X"E" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "11" & X"C" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      rdata_exp <= "11" & X"8" after delay;
      WaitForCLKCycle(rclk, 1, false);
      --
      
      --
      wait for 1000 ns; --  ns
      StopProcess( control );
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
      wait on control,rdata_exp,rclk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( rdata, rdata_exp, "rdata", error );
   end process monitor;
end architecture TC2SpwRam_beh;
--------------------------------------------------------------------------------
-- end TC2SpwRam.vhd
--------------------------------------------------------------------------------