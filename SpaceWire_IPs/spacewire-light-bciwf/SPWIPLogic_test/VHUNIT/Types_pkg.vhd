--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         Types_pkg.vhd
--!
--! \brief        Package with different type definitions for the
--!               VHUNIT project.
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 10.05.2006
--! \date         Updated: 15.08.2010
--! \version      V 1.00
--
-- Package      : Types_pkg (declaration, body)
-- File Version : $Revision: 35 $
--
--
-- Limitations  : Only for test usage
-- Errors       : None known
--
-- Copyright 2021 IWF
-- 
-- This file is part of VHUNIT.
--
-- VHUNIT is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- VHUNIT is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with VHUNIT.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------
-- History
--
-- $Log: not supported by cvs2svn $
--
-- Revision 1.2  2011/06/07 15:04:15  ottacher
-- Work state, updated with additional unit statistics
--
-- Revision 1.1  2006/06/27 14:57:40  ottacher
-- Initial check in.
-- Version tested with a simple test example.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
--! IEEE standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;

--! standard library
library std;
--! Std standard textio package
use std.textio.all;

--------------------------------------------------------------------------------
-- Package Types_pkg
--! \brief        Types_pkg  - Type definition package for VHUNIT project
--! \details      Defines different types for the VHUNIT project.
--!
--! - Types
--! \li \ref  test_statistic   - Record for suite statistic values.
--! \li \ref  suite_statistic  - Record for case statistic values.
--! \li \ref  case_statistic   - Record for single case statistic information.
--! \li \ref  signal_statistic - Record for signal statistic information.
--
-- Comments :
--
-- Updates :  V 1.00  - 13.06.2006 HOT add suite name
--            V 1.01  - 15.08.2010 HOT add signal and unit statistics
--
--------------------------------------------------------------------------------
package Types_pkg is
   
   ---------------------------------------------------------------------------
   -- forward declaration
   ---------------------------------------------------------------------------
   type test_statistic;
   type suite_statistic;
   type case_statistic;
   type signal_statistic;
   type case_result;
   type case_info;
   
   --! Pointer to test_statistic record
   type p_sub_suite is access test_statistic;
   
   --! Pointer to suite_statistic record
   type p_tests is access suite_statistic;
   
   --! Pointer to case_statistic record
   type p_case is access case_statistic;
   
   --! Pointer to signal_statistic record
   type p_signal is access signal_statistic;
   
   --! Pointer to case result record
   type p_case_result is access case_result;
   
   --! Pointer to case info record
   type p_case_info is access case_info;
   
   -----------------------------------------------------------------------------
   -- Type test_statistic
   --! \brief        Record for test suite and test case statistic values.
   --! \details      Contains statistic information about executed test suites 
   --!               and test cases.
   -- Comments     : 
   -----------------------------------------------------------------------------
   type test_statistic is record
      name            : line;        --! Name of the test suite        
      suites          : integer;     --! Number of executed test suites.       
      tests           : integer;     --! Number of executed test cases.       
      pass            : integer;     --! Number of successful executed test cases.       
      fail            : integer;     --! Number of failed test cases.       
      executed_suites : p_sub_suite; --! pointer to sub suites.
      executed_tests  : p_tests;     --! pointer to current suite statistic. 
   end record test_statistic;

   -----------------------------------------------------------------------------
   -- Type suite_statistic
   --! \brief        Record for case statistic values.
   --! \details      Contains statistic information about executed test cases. 
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   type suite_statistic is record
      tests : integer;        --! Number of executed test cases.
      pass  : integer;        --! Number of successful executed test cases.
      fail  : integer;        --! Number of failed test cases.
      executed_case : p_case; --! pointer to current executed case statistic.
   end record suite_statistic;
     
   -----------------------------------------------------------------------------
   -- Type case_statistic
   --! \brief        Record for single case statistic information.
   --! \details      Contains statistic information about a single test case.
   -- Comments     : 
   -----------------------------------------------------------------------------
   type case_statistic is record
      unit_name         : line;          --! Name of the unit under test (UUT).
      unit_outputs      : integer;       --! Number of outputs available on the UUT.
      monitored_outputs : integer;       --! Number of monitored outputs.
      monitored_signals : p_signal;      --! Pointer to the list of monitored signals.
      case_results      : p_case_result; --! Pointer to the list of result infos.
   end record case_statistic;
  
   -----------------------------------------------------------------------------
   -- Type signal_statistic
   --! \brief        Record for signal statistic information.
   --! \details      Contains statistic information about a signal to monitor.
   -- Comments     : 
   -----------------------------------------------------------------------------
   type signal_statistic is record
      name   : line;             --! Name of the signal.
      events : integer;          --! Number of detected events.
      errors : integer;          --! Number of detected errors.
      next_signal : p_signal;    --! pointer to the next signal statistic.
   end record signal_statistic;  
   
   -----------------------------------------------------------------------------
   -- Type case_result
   --! \brief        Record for case result information.
   --! \details      Contains result information shown in the result area of a 
   --!               test case.
   -- Comments     : 
   -----------------------------------------------------------------------------
   type case_result is record        
      unit_name      : line;          --! Name of the unit under test (UUT).
      result_comment : line;          --! Case result comment string.
	   result_info    : p_case_info;   --! Pointer to the list of case info lines.
      next_result    : p_case_result; --! Pointer to the next result info.
   end record case_result;  
   
   -----------------------------------------------------------------------------
   -- Type case_info
   --! \brief        Record of a case info line.
   --! \details      Contains a result information line.
   -- Comments     : 
   -----------------------------------------------------------------------------
   type case_info is record        
      info        : line;      --! Case info string.
   	next_info : p_case_info; --! Pointer to the next info.
   end record case_info;  
   
end package Types_pkg;

------------------------------------------------------------------------------
-- end Types_pkg.vhd
------------------------------------------------------------------------------
