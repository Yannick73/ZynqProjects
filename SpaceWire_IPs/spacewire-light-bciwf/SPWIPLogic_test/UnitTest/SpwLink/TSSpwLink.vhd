--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TSSpwLink.vhd
--!
--! \brief        unit test suite for the SpwLink Logic
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 16.12.2018
--! \version      V 1.00
--
-- Unit         : TSSpwLink (STR) (entity, architecture)
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
-- Entity TSSpwLink
--! \brief        TSSpwLink - SpwLink test suite.
--! \details      The test suite handles all test cases of the SpwLink unit
--!               to test.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TSSpwLink is 
   generic (
      SEED           : integer      := 1    --! seed for random generation.
   );
   port ( 
      CONTROL_IN  : in execution; --! the test suite execution control information.
      CONTROL_OUT : out result    --! the test suite execution result information.
   );
end entity TSSpwLink;

--------------------------------------------------------------------------------
-- Architecture TSSpwLink_str
--! \brief  implementation of the SpwLink unit test suite.
--------------------------------------------------------------------------------
architecture TSSpwLink_str of TSSpwLink is 
   signal execute_link_tc : execution_vector (1 to 2); --! the SpwLink test case execution control
   signal result_link_tc  : result_vector (1 to 2);    --! the SpwLink test case result control

begin
   ---------------------------------------------------------------------------
   -- Unit test suite structure
   ---------------------------------------------------------------------------
   TC1LNK: entity work.TC1SpwLink
   generic map (SEED)
   port map(execute_link_tc(1),result_link_tc(1));
   
   
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
      InitControl( execute_link_tc );

      ------------------------------------------------------------------------
      -- wait for test suite start
      ------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      
      ------------------------------------------------------------------------
      -- execute the tests
      ------------------------------------------------------------------------
      wait for 100 ns; -- define first start time
      StartTest( "SpwLink TC1: link run and link errors", 220 us, execute_link_tc(1) );
      EvaluateTest( result_link_tc(1) );
      
      ------------------------------------------------------------------------
      -- stop the test suite
      ------------------------------------------------------------------------  
      wait for 100 ns; -- update all static signals.
      StopTestSuite( CONTROL_OUT ); -- stop test suite execution
  
   end process executeTS;

end architecture TSSpwLink_str;

--------------------------------------------------------------------------------
-- end TSSpwLink.vhd
--------------------------------------------------------------------------------
