--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TSSpwRecvFront.vhd
--!
--! \brief        unit test suite for the Spacewire Receiver Front-end with clock 
--!               recovery
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 24.01.2017
--! \date         Updated: 16.10.2017
--! \version      V 1.00
--
-- Unit         : TSSpwRecvFront (STR) (entity, architecture)
-- File version : $Revision $
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
-- Entity TSSpwRecvFront
--! \brief        TSSpwRecvFront - SPW Receiver front-end unit test suite.
--! \details      The test suite handles all test cases of the SPW Receiver 
--!               front-end unit to test.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TSSpwRecvFront is  
   generic (
      SEED           : integer      := 1    --! seed for random generation.
   );
   port ( 
      CONTROL_IN  : in execution; --! the test suite execution control information.
      CONTROL_OUT : out result    --! the test suite execution result information.
   );
end entity TSSpwRecvFront;
--------------------------------------------------------------------------------
-- Architecture TSSPWIPUnit_str
--! \brief  implementation of the SPW Receiver Front-end unit test suite.
--------------------------------------------------------------------------------
architecture TSSpwRecvFront_str of TSSpwRecvFront is 
   signal execute_recvft_tc : execution_vector (1 to 4); --! the test case execution control
   signal result_recvft_tc  : result_vector (1 to 4);    --! the test case result control
   
begin
   ---------------------------------------------------------------------------
   -- Unit test suite structure
   ---------------------------------------------------------------------------
   TC1RECVFT: entity work.TC1SpwrecvFront
   generic map (SEED)
   port map(execute_recvft_tc(1),result_recvft_tc(1));
   
   TC2RECVFT: entity work.TC2SpwrecvFront
   generic map (SEED)
   port map(execute_recvft_tc(2),result_recvft_tc(2));
   
   TC3RECVFT: entity work.TC3SpwrecvFront
   generic map (SEED)
   port map(execute_recvft_tc(3),result_recvft_tc(3));
   
   TC4RECVFT: entity work.TC4SpwrecvFront
   generic map (SEED)
   port map(execute_recvft_tc(4),result_recvft_tc(4));
   
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
      InitControl( execute_recvft_tc );
      
      ------------------------------------------------------------------------
      -- wait for test suite start
      ------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      
      ------------------------------------------------------------------------
      -- execute the tests
      ------------------------------------------------------------------------
      wait for 100 ns; -- define first start time
      --
      StartTest( "SpwrecvFront TC1: receiving operation RXCHUNK=6", 100 us, execute_recvft_tc(1) );
      EvaluateTest( result_recvft_tc(1) );
      wait for 100 ns; -- define next start time
	  --
	  StartTest( "SpwrecvFront TC2: receiving operation RXCHUNK=1", 10 us, execute_recvft_tc(2) );
      EvaluateTest( result_recvft_tc(2) );
      wait for 100 ns; -- define next start time
      --
	  StartTest( "SpwrecvFront TC3: receiving operation RXCHUNK=4", 10 us, execute_recvft_tc(3) );
      EvaluateTest( result_recvft_tc(3) );
      wait for 100 ns; -- define next start time
	  --
	  StartTest( "SpwrecvFront TC4: receiving operation RXCHUNK=2", 10 us, execute_recvft_tc(4) );
      EvaluateTest( result_recvft_tc(4) );
      wait for 100 ns; -- define next start time
      ------------------------------------------------------------------------
      -- stop the test suite
      ------------------------------------------------------------------------  
      wait for 100 ns; -- update all static signals.
      StopTestSuite( CONTROL_OUT ); -- stop test suite execution
  
   end process executeTS;

end architecture TSSpwRecvFront_str;

--------------------------------------------------------------------------------
-- end TSSpwRecvFront.vhd
--------------------------------------------------------------------------------
