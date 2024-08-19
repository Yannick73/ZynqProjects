--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TSSpwStream.vhd
--!
--! \brief        unit test suite for the SpwStream unit
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 12.10.2016
--! \date         Updated: 24.01.2019
--! \version      V 1.00
--
-- Unit         : TSSpwStream (STR) (entity, architecture)
-- File version : $Revision: 89 $
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
--! VHUNIT test library
library VHUNIT;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;

--------------------------------------------------------------------------------
-- Entity TSSpwStream
--! \brief        TSSpwStream - SpwStream unit test suite.
--! \details      The test suite handles all test cases of the SpwStream unit to
--!               test.
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TSSpwStream is
   port (
      CONTROL_IN  : in execution; --! the test suite execution control information.
      CONTROL_OUT : out result    --! the test suite execution result information.
   );
end entity TSSpwStream;
--------------------------------------------------------------------------------
-- Architecture TSSpwStream_str
--! \brief  implementation of the SpwStream unit test suite.
--------------------------------------------------------------------------------
architecture TSSpwStream_str of TSSpwStream is
   signal execute_spwstream_tc : execution_vector (1 to 9); --! the SpwStream test case execution control
   signal result_spwstream_tc  : result_vector (1 to 9);    --! the SpwStream test case result control
begin
   ---------------------------------------------------------------------------
   -- Unit test suite structure
   ---------------------------------------------------------------------------
 --  TC1SPW: entity work.TC1SPW
 --  port map(execute_spwstream_tc(8),result_spwstream_tc(8));
 
 --  TC2SPW: entity work.TC2SPW
 --  port map(execute_spwstream_tc(9),result_spwstream_tc(9));
   
   --Reset
   TC1Reset: entity work.TC1Reset
   port map(execute_spwstream_tc(1),result_spwstream_tc(1));
   
   --Link Initialization
   TC2LinkInit: entity work.TC2LinkInit
   port map(execute_spwstream_tc(2),result_spwstream_tc(2));
   
   --Handling Receiver Errors (clause 8.9.2)
   TC3RecvErr: entity work.TC3RecvErr
   port map(execute_spwstream_tc(3),result_spwstream_tc(3));
   
   --Handling Empty Packets (clause 8.9.3) 
   TC4Epkts: entity work.TC4Epkts
   port map(execute_spwstream_tc(4),result_spwstream_tc(4));
   
   --Exchange of silence error recovery procedure (clause 8.9.4) 
   TC5ExchgSilence: entity work.TC5ExchgSilence
   port map(execute_spwstream_tc(5),result_spwstream_tc(5));
   
   --Exception Conditions (clause 8.10)
   TC6ExceptCond: entity work.TC6ExceptCond
   port map(execute_spwstream_tc(6),result_spwstream_tc(6));
   
   -- Normal Operation
   TC7NormalOp: entity work.TC7NormalOp
   port map(execute_spwstream_tc(7),result_spwstream_tc(7));
    
   -----------------------------------------------------------------------------
   -- Process executeTS
   --! \brief        test suite execution.
   --! \details      The process execute all execute all defined test suites and
   --!               test cases.
   -----------------------------------------------------------------------------
   executeTS: process
   begin
      ------------------------------------------------------------------------
      -- initialize the execution control records
      ------------------------------------------------------------------------
      InitControl( execute_spwstream_tc );
      ------------------------------------------------------------------------
      -- wait for test suite start
      ------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      ------------------------------------------------------------------------
      -- execute the tests
      ------------------------------------------------------------------------
      wait for 100 ns; -- define first start time
      ---- Testcase for all error sequences
      --StartTest( "TC1SPW", 1 ms, execute_spwstream_tc(8) );
      --EvaluateTest( result_spwstream_tc(8) );
      --wait for 100 ns ; -- define next start time
      -- Two SPW links connected
      --StartTest( "TC2SPW", 5 ms, execute_spwstream_tc(9) );
      --EvaluateTest( result_spwstream_tc(9) );
      
      --Reset
      StartTest( "TC1Reset", 200 us, execute_spwstream_tc(1) );
      EvaluateTest( result_spwstream_tc(1) );
      wait for 100 ns ; -- define next start time
      
      --Link Initialization
      StartTest( "TC2LinkInit", 300 us, execute_spwstream_tc(2) );
      EvaluateTest( result_spwstream_tc(2) );
      wait for 100 ns ; -- define next start time
      
      --Receiver errors
      StartTest( "TC3RecvErr", 600 us, execute_spwstream_tc(3) );
      EvaluateTest( result_spwstream_tc(3) );
      wait for 100 ns ; -- define next start time
      
      --Empty packets
      StartTest( "TC4Epkts", 600 us, execute_spwstream_tc(4) );
      EvaluateTest( result_spwstream_tc(4) );
      wait for 100 ns ; -- define next start time
      
      --Exchange of silence error recovery procedure
      StartTest( "TC5ExchgSilence", 900 us, execute_spwstream_tc(5) );
      EvaluateTest( result_spwstream_tc(5) );
      wait for 100 ns ; -- define next start time
      
      --Exception Conditions
      StartTest( "TC6ExceptCond", 640 us, execute_spwstream_tc(6) );
      EvaluateTest( result_spwstream_tc(6) );
      wait for 100 ns ; -- define next start time
      
      --Normal Operation
      StartTest( "TC7NormalOp", 700 us, execute_spwstream_tc(7) );
      --StartTest( "TC7NormalOp", 5 ms, execute_spwstream_tc(7) );
      EvaluateTest( result_spwstream_tc(7) );
      wait for 100 ns ; -- define next start time
      
      ------------------------------------------------------------------------
      -- stop the test suite
      ------------------------------------------------------------------------
      wait for 100 ns; -- update all static signals.
      StopTestSuite( CONTROL_OUT ); -- stop test suite execution
   end process executeTS;
end architecture TSSpwStream_str;
--------------------------------------------------------------------------------
-- end TSSpwStream.vhd
--------------------------------------------------------------------------------