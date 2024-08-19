--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         UnitTest.vhd
--!
--! \brief        main test entity for the unit test of Spacewire IP.
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 11.10.2016
--! \date         Updated: 16.10.2017
--! \version      V 1.00
--
-- Unit         : UnitTest (STR) (entity, architecture)
-- File version : $Revision: 142 $
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
--! IEEE standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;
--! IEEE standard numeric package
use ieee.numeric_std.all;
--! VHUNIT test library
library VHUNIT;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;

--------------------------------------------------------------------------------
-- Entity UnitTest
--! \brief        UnitTest - main test unit of the unit tests.
--! \details      The test unit executes all test cases for the Spacewire IP test.
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity UnitTest is
end entity UnitTest;
--------------------------------------------------------------------------------
-- Architecture Test_str
--! \brief  implementation of the unit test bench.
--------------------------------------------------------------------------------
architecture UnitTest_str of UnitTest is
   signal execute_lnk_ts    : execution; --! the SpwLink Unit test suite execution control
   signal result_lnk_ts     : result;    --! the SpwLink Unit test suite result control
   signal execute_ram_ts    : execution; --! the SpwRam Unit test suite execution control
   signal result_ram_ts     : result;    --! the SpwRam Unit test suite result control
   signal execute_rcv_ts    : execution; --! the SpwRecv Unit test suite execution control
   signal result_rcv_ts     : result;    --! the SpwRecv Unit test suite result control
   signal execute_rcvft_ts  : execution; --! the SpwRecvFront Unit test suite execution control
   signal result_rcvft_ts   : result;    --! the SpwRecvFront Unit test suite result control
   signal execute_rst_ts    : execution; --! the SpwReset Unit test suite execution control
   signal result_rst_ts     : result;    --! the SpwReset Unit test suite result control
   signal execute_xmtfs_ts  : execution; --! the SpwXmit_fast Unit test suite execution control
   signal result_xmtfs_ts   : result;    --! the SpwXmit_fast Unit test suite result control
   --
   signal execute_spwstream_ts  : execution; --! the SpwStream Unit test suite execution control
   signal result_spwstream_ts   : result;    --! the SpwStream Unit test suite result control
   
begin
   ---------------------------------------------------------------------------
   -- Unit test structure
   ---------------------------------------------------------------------------
   TSLNK: entity work.TSSpwLink
   port map(execute_lnk_ts,result_lnk_ts);
   
   TSRAM: entity work.TSSpwRam
   port map(execute_ram_ts,result_ram_ts);
   
   TSRCV: entity work.TSSpwRecv
   port map(execute_rcv_ts,result_rcv_ts);
   
   TSRCVFT: entity work.TSSpwRecvFront
   port map(execute_rcvft_ts,result_rcvft_ts);
 
   TSRST: entity work.TSSpwReset
   port map(execute_rst_ts,result_rst_ts);
   
   TSXMTFS: entity work.TSSpwXmit_fast
   port map(execute_xmtfs_ts,result_xmtfs_ts);
   --
   TSSPWSTR: entity work.TSSpwStream
   port map(execute_spwstream_ts,result_spwstream_ts);

   -----------------------------------------------------------------------------
   -- Process executeTest
   --! \brief        execute the unit tests.
   --! \details      The process execute all defined unit tests.
   -----------------------------------------------------------------------------
   executeTest: process
   begin
      --------------------------------------------------------------------------
      -- initialize the test run
      --------------------------------------------------------------------------
      InitTest( "SPW IP Logic Unit Test" );
      --------------------------------------------------------------------------
      -- define the used outputs, if not called UsedXXXOutput
      -- the output is disabled
      --------------------------------------------------------------------------
      UseReportOutput( "SPW_IP_test.log" );
      UseHTMLOutput( "SPW_IP_test.html" );
      UseTextOutput;
      -- set test statistic active
      UseTestStatistic;
      --------------------------------------------------------------------------
      -- initialize the execution control records
      --------------------------------------------------------------------------
      InitControl( execute_lnk_ts );
      InitControl( execute_ram_ts );
      InitControl( execute_rcv_ts );
      InitControl( execute_rcvft_ts );
      InitControl( execute_rst_ts );
      InitControl( execute_xmtfs_ts );
      InitControl( execute_spwstream_ts );
      --------------------------------------------------------------------------
      -- execute the test cases
      --------------------------------------------------------------------------
      wait for 100 ns; -- define the first start time
      StartTestSuite( "SpwLink", execute_lnk_ts );
      EvaluateTestSuite( result_lnk_ts );
      
      StartTestSuite( "SpwRam", execute_ram_ts );
      EvaluateTestSuite( result_ram_ts );
      
      StartTestSuite( "SpwRecv", execute_rcv_ts );
      EvaluateTestSuite( result_rcv_ts );
      
      StartTestSuite( "SpwRecvFront", execute_rcvft_ts );
      EvaluateTestSuite( result_rcvft_ts );
      
      StartTestSuite( "SpwReset", execute_rst_ts );
      EvaluateTestSuite( result_rst_ts );
--    
      StartTestSuite( "SpwXmit_fast", execute_xmtfs_ts );
      EvaluateTestSuite( result_xmtfs_ts );
      --
      StartTestSuite( "SpwStream", execute_spwstream_ts );
      EvaluateTestSuite( result_spwstream_ts );
      ------------------------------------------------------------------------
      -- output the test run results
      ------------------------------------------------------------------------
      wait for 100 ns; -- update all static signals.
      ShowResult; -- finish the results
      wait; -- stop the execution
   end process executeTest;
end architecture UnitTest_str;
--------------------------------------------------------------------------------
-- end UnitTest.vhd
--------------------------------------------------------------------------------