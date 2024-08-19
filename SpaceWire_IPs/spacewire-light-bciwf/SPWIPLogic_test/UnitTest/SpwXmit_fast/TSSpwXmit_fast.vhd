--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TSSpwXmit_fast.vhd
--!
--! \brief        unit test suite for the SpwXmit_fast Logic
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 16.10.2017
--! \version      V 1.00
--
-- Unit         : TSSpwXmit_fast (STR) (entity, architecture)
-- File version : $Revision: 50 $
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
--! VHDL unit test library
library VHUNIT;
--! test execution package
use VHUNIT.TestExecution_pkg.all;

--------------------------------------------------------------------------------
-- Entity TSSpwXmit_fast
--! \brief        TSSpwXmit_fast - SpwXmit_fast test suite.
--! \details      The test suite handles all test cases of the SpwXmit_fast unit
--!               to test.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TSSpwXmit_fast is 
   generic (
      SEED           : integer      := 1    --! seed for random generation.
   );
   port ( 
      CONTROL_IN  : in execution; --! the test suite execution control information.
      CONTROL_OUT : out result    --! the test suite execution result information.
   );
end entity TSSpwXmit_fast;

--------------------------------------------------------------------------------
-- Architecture TSSpwXmit_fast_str
--! \brief  implementation of the SpwXmit_fast unit test suite.
--------------------------------------------------------------------------------
architecture TSSpwXmit_fast_str of TSSpwXmit_fast is 
   signal execute_xmit_fast_tc : execution_vector (1 to 2); --! the SpwXmit_fast test case execution control
   signal result_xmit_fast_tc  : result_vector (1 to 2);    --! the SpwXmit_fast test case result control

begin
   ---------------------------------------------------------------------------
   -- Unit test suite structure
   ---------------------------------------------------------------------------
   TC1XMITFS: entity work.TC1SpwXmit_fast
   generic map (SEED)
   port map(execute_xmit_fast_tc(1),result_xmit_fast_tc(1));
   
   
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
      InitControl( execute_xmit_fast_tc );

      ------------------------------------------------------------------------
      -- wait for test suite start
      ------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      
      ------------------------------------------------------------------------
      -- execute the tests
      ------------------------------------------------------------------------
      wait for 100 ns; -- define first start time
      StartTest( "SpwXmit_fast TC1: transmit operation", 4 us, execute_xmit_fast_tc(1) );
      EvaluateTest( result_xmit_fast_tc(1) );
      
      ------------------------------------------------------------------------
      -- stop the test suite
      ------------------------------------------------------------------------  
      wait for 100 ns; -- update all static signals.
      StopTestSuite( CONTROL_OUT ); -- stop test suite execution
  
   end process executeTS;

end architecture TSSpwXmit_fast_str;

--------------------------------------------------------------------------------
-- end TSSpwXmit_fast.vhd
--------------------------------------------------------------------------------
