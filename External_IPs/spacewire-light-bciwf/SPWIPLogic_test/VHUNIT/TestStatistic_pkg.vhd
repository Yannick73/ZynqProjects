--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TestStatistic_pkg.vhd
--!
--! \brief        Package with different report functions for the
--!               VHUNIT project.
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 03.05.2006
--! \date         Updated: 04.03.2019
--! \version      V 1.06
--
-- Package      : TestStatistic_pkg (declaration, body)
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
-- Revision 1.3  2011/06/07 15:04:15  ottacher
-- Work state, updated with additional unit statistics
--
-- Revision 1.2  2007/01/31 09:24:05  ottacher
-- Updated error output.
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

--! VHUNIT test library
library VHUNIT;
--! VHUNIT assert package
use VHUNIT.Assert_pkg.all;
--! VHUNIT types package
use VHUNIT.Types_pkg.all;
--! VHUNIT report outputter package
use VHUNIT.ReportOutputter_pkg.all;
--! VHUNIT text outputter package
use VHUNIT.TextOutputter_pkg.all;
--! VHUNIT HTML outputter package
use VHUNIT.HTMLOutputter_pkg.all;


--------------------------------------------------------------------------------
-- Package TestStatistic_pkg
--! \brief        TestStatistic_pkg  - Report function package for VHUNIT 
--!               project.
--! \details      Implements functions and procedure to report test statistic. 
--!               
--! - Procedures
--! \li \ref  SetTestName       - Set the test run name.
--! \li \ref  SetReportOutput   - Set the status of the report output and define
--!                               the report file name.
--! \li \ref  SetHTMLOutput     - Set the status of the HTML report output and 
--!                               define the HTML report file name.
--! \li \ref  SetTextOutput     - Set the text output status.
--! \li \ref  SetStatistic      - Set the statistic status.
--! \li \ref  SetCaseInfo       - Set the case statistic information.
--! \li \ref  PrintTestCase     - Print the test case execution the used outputs.
--! \li \ref  PrintTestSuite    - Print the test suite execution the used 
--!                               outputs.
--! \li \ref  PrintFailureLine  - Print a failure line to the used outputs. 
--! \li \ref  PrintCheckLine    - Print a signal check line to the used outputs.
--! \li \ref  PrintLogLine      - Print a signal log line to the used outputs. 
--! \li \ref  PrintLine         - Print a logging messsage with the defined severity.  
--! \li \ref  PrintResultHeader - Print a test case result heder information
--! \li \ref  PrintResultLine   - Print a test case result information
--! \li \ref  PrintCaseResult   - Print the test case result to the used 
--!                               outputs.
--! \li \ref  PrintSuiteResult  - Print the test suite result to the used 
--!                               outputs.
--! \li \ref  PrintResult       - Print the test result to the used outputs.
--! \li \ref  AddSuite          - Add a suite to the test statistic.
--! \li \ref  AddTest           - Add a case to the test statistic.
--! \li \ref  AddSignal         - Add a signal to the test case signal list.
--! \li \ref  UpdateSignal      - Update the status of a monitored signal.
--! \li \ref  UpdateTest        - Update the test statistic.
--! \li \ref  UpdateSuiteResult - Update the test statistic information.
--
-- Comments     :
--                
-- Updates : V 1.00 - 22.06.2006 HOT add test run name    
--                    28.08.2008 HOT add deallocate for allocated memory
--           V 1.01 - 15.08.2010 HOT add signal and unit statistics
--                    14.01.2011 HOT update UpdateSuiteResult   
--           V 1.02 - 06.02.2012 HOT add HTML file format output
--           V 1.04 - 12.10.2015 HOT update Print.. function for string usage
--                                   add PrintLog and PrintCheck functions
--           V 1.05 - 14.10.2016 HOT update package to be VHDL 2008 compatible
--           V 1.06 - 19.04.2018 HOT add PrintLine function and logging severity type
--                    21.12.2018 HOT add log_level LOG_FAILURE
--                    04.03.2019 HOT add functions for PrintResultHeader and PrintResultLine
--------------------------------------------------------------------------------
package TestStatistic_pkg is      
   
   ---------------------------------------------------------------------------
   -- used type definitions
   ---------------------------------------------------------------------------
   --! \brief log level type definition               
   --! \arg ALL_INFO    print all infos 
   --! \arg NO_LOG      print no log lines, only errors, failures and summary are reported
   --! \arg NO_FAILUE   print no log lines, no failures only errors and summary are reported
   --! \arg NO_ERROR    print no errors, failures and log lines, only test summary is reported
   --! \arg LOG_ONLY    print no failures and errors, only log lines and summary are reported
   --! \arg LOG_FAILURE print no errors, only log lines, failures and summary are reported
   type log_level is (ALL_INFO, NO_LOG, NO_FAILUE, NO_ERROR, LOG_ONLY, LOG_FAILURE);    

   --! \brief log message serverity type definition               
   --! \arg LS_ERROR    the message is an error message
   --! \arg LS_FAILURE  the message is a failure message
   --! \arg LS_LOG      the message is a log message
   type log_severity is (LS_ERROR, LS_FAILURE, LS_LOG);    
   
   ----------------------------------------------------------------------------
   -- Procedure SetTestName
   --! \brief  Set the test run name.
   ----------------------------------------------------------------------------
   procedure SetTestName( 
      test_name : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure SetReportOutput
   --! \brief  Set the status of the report output and define the report file 
   --!         name.
   ----------------------------------------------------------------------------
   procedure SetReportOutput( 
      report_name : in string;
      active : in boolean;
      level  : in log_level := ALL_INFO
   );
   
   ----------------------------------------------------------------------------
   -- Procedure SetHTMLOutput
   --! \brief  Set the status of the HTML report output and define the HTML 
   --!         report file name.
   ----------------------------------------------------------------------------
   procedure SetHTMLOutput (
      file_name : in string;
      active    : in boolean;
      level     : in log_level := LOG_FAILURE
   );  

   ----------------------------------------------------------------------------
   -- Procedure SetTextOutput
   --! \brief  Set the text output status.
   ----------------------------------------------------------------------------
   procedure SetTextOutput (
      active : in boolean;
      level  : in log_level := ALL_INFO
   );  

   ----------------------------------------------------------------------------
   -- Procedure SetStatistic
   --! \brief  Set the statistic status.
   ----------------------------------------------------------------------------
   procedure SetStatistic (
      active : in boolean
   );  

   ----------------------------------------------------------------------------
   -- Procedure SetCaseInfo
   --! \brief  Set the case statistic information.
   ----------------------------------------------------------------------------
    procedure SetCaseInfo( 
      unit_name : in string;
      unit_outputs : in integer
   );   

   ----------------------------------------------------------------------------
   -- Procedure PrintTestCase
   --! \brief  Print the test case execution the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintTestCase(
      test_case_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure PrintTestSuite
   --! \brief  Print the test suite execution the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintTestSuite(
      test_suite_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief  Print a failure line to the used outputs. 
   ----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   );                              

   ----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief  Print a failure line to the used outputs. 
   ----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief  Print a failure line to the used outputs. 
   ----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure PrintCheckLine
   --! \brief  Print a signal check line to the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintLogLine
   --! \brief  Print a signal log line to the used outputs. 
   ----------------------------------------------------------------------------
   procedure PrintLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintLine
   --! \brief  Print a logging messsage with the defined severity.
   ----------------------------------------------------------------------------
   procedure PrintLine( 
      test_case        : in string;
      message_severity : in log_severity;
      message          : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintResultHeader
   --! \brief  Print a test case result header information.
   ----------------------------------------------------------------------------
   procedure PrintResultHeader( 
      unit_name : in string;
      comment   : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintResultLine
   --! \brief   Print a test case result information
   ----------------------------------------------------------------------------
   procedure PrintResultLine( 
      message          : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure PrintCaseResult
   --! \brief  Print the test case result to the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintCaseResult(
      error : in integer
   );

   ----------------------------------------------------------------------------
   -- Procedure PrintSuiteResult
   --! \brief  Print the test suite result to the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintSuiteResult;
   
   ----------------------------------------------------------------------------
   -- Procedure PrintResult
   --! \brief  Print the test result to the used outputs.
   ----------------------------------------------------------------------------
   procedure PrintResult;

   ----------------------------------------------------------------------------
   -- Procedure AddSuite
   --! \brief  Add a suite to the test statistic.
   ----------------------------------------------------------------------------
   procedure AddSuite(
      test_suite_name : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure AddTest
   --! \brief  Add a case to the test statistic.
   ----------------------------------------------------------------------------
   procedure AddTest;
   
   ----------------------------------------------------------------------------
   -- Procedure AddSignal
   --! \brief  Add a signal to the test case signal list.
   ----------------------------------------------------------------------------
   procedure AddSignal(
      signal_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure UpdateSignal
   --! \brief  Update the status of a monitored signal.
   ----------------------------------------------------------------------------
   procedure UpdateSignal (
      signal_name : in string;
      signal_event : in integer;
      signal_error : in integer
   );

   ----------------------------------------------------------------------------
   -- Procedure UpdateTest
   --! \brief  Update the test statistic.
   ----------------------------------------------------------------------------
   procedure UpdateTest (
      error : in integer
   );

   ----------------------------------------------------------------------------
   -- Procedure UpdateSuiteResult
   --! \brief  Update the test statistic information.
   ----------------------------------------------------------------------------
   procedure UpdateSuiteResult;
   
end package TestStatistic_pkg;

------------------------------------------------------------------------------
-- Body TestStatistic_pkg
--! \brief Test statistic package implementation.
------------------------------------------------------------------------------
package body TestStatistic_pkg is
   ---------------------------------------------------------------------------
   -- Internal constants and variables
   ---------------------------------------------------------------------------
   --! VHUNIT version string
   constant VHUNIT_VERSION : string := " 1.06";
   
   --! Indicate file report output usage.
   shared variable m_use_report : boolean := false;
   
   --! Indicate html report output usage.
   shared variable m_use_html   : boolean := false;
   
   --! Indicate text output usage.
   shared variable m_use_output : boolean := false; 
   
   --! Indicate to display statistic information.
   shared variable m_statistic  : boolean := false;   
   
   --! The name of the test run.
   shared variable m_test_name  : line := null;
   
   --! File report log level.
   shared variable m_report_level : log_level := ALL_INFO;

   --! HTML report log level.
   shared variable m_html_level   : log_level := LOG_FAILURE; 

   --! Text output log level.
   shared variable m_output_level : log_level := ALL_INFO;
   
   --! The string for no test run name defined.
   shared variable m_no_name : line := new string'("");
   
   --! Test run statistic.
   shared variable m_run_statistic : test_statistic := (null,0,0,0,0,null,null);

   --! Current case statistic.
   shared variable m_current_case : p_case := null;
  
   --! Current monitored signal.
   shared variable m_current_signal : p_signal := null;

   --! Current case result info.
   shared variable m_current_result : p_case_result := null;
   
   -----------------------------------------------------------------------------
   -- Procedure GetString
   --! \brief    GetString - Get a string from a line.
   --!          
   --! \details  The function reads a string from a line without clearing of the 
   --!           line buffer. 
   --! \param    l      the line to read from.
   --! \param    value  the string read.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure GetString (
       l: inout line;
       value : out string
   ) is
      constant value_len : natural := value'length;
      constant line_len : natural := l'length;
      variable len : natural;
      variable clear : boolean;
      
   begin
      AssertFailure( (l /= null) , "GetString", "line is null!");
      AssertFailure( (l'left <= l'right) , "GetString", "line is descending!");
      if ( line_len < value_len ) then
         len := line_len;
         clear := true;
      else
         len := value_len;
         clear := false;
      end if; -- line_len < value_len

      -- read all characters of the line, up to the length
      for i in 1 to len loop
         value(i) := l(i);
      end loop; -- read
      
      if ( clear ) then
         -- clear the contents
         for i in (len+1) to value_len  loop
            value(i) := ' ';
         end loop;
      end if; -- clear
   end procedure GetString;
   
   -----------------------------------------------------------------------------
   -- Function IsSuiteOpen
   --! \brief    IsSuiteOpen - Checks if a test suite has started.
   --! \details  The function checks if a test suite or sub suite has 
   --!           started.
   --! \return   True if it has started, false if not.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function IsSuiteOpen return boolean is
   begin
      if ( (m_run_statistic.executed_tests = null) and 
           (m_run_statistic.executed_suites = null) ) then
         return false;
      end if; -- m_run_statistic
      return true;
   end function IsSuiteOpen;

   -----------------------------------------------------------------------------
   -- Function GetActiveSuite
   --! \brief    GetActiveSuite - Returns the active sub test suite.
   --! \details  The function searches for the active sub test suite and  
   --!           returns the pointer to the test_statistic of the sub suite.
   --! \return   The pointer to the test_statistic of the active sub suite.
   -- Comments :
   --               
   -----------------------------------------------------------------------------   
   impure function GetActiveSuite return p_sub_suite is
      variable sub_suite : p_sub_suite; 
   begin
      AssertFailure( (m_run_statistic.executed_suites /= null), "GetActiveSuite",
         "no sub suite open!");
      sub_suite := m_run_statistic.executed_suites;
      find : while (sub_suite.executed_suites /= null) loop
         sub_suite := sub_suite.executed_suites;
      end loop find;
      return sub_suite;
   end function GetActiveSuite;

   -----------------------------------------------------------------------------
   -- Function GetActiveTest
   --! \brief    GetActiveTest - Returns the active test case.
   --! \details  The function searches for the active test case and returns the
   --!           pointer to the case_statistic of the suite.
   --! \return   The pointer to the case_statistic of the active suite.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function GetActiveTest return p_case is
      variable sub_suite : p_sub_suite; 
      variable tests : p_tests; 
      variable active_case : p_case; 
   begin   
      if ( IsSuiteOpen ) then
         if ( m_run_statistic.executed_suites = null ) then
            -- no sub suite
            tests := m_run_statistic.executed_tests;
         else
            -- find active test
            sub_suite := GetActiveSuite;
         	tests := sub_suite.executed_tests;
        end if; -- executed_suites = null
      
         AssertFailure( (tests /= null) , "GetActiveTest", "suite not opened!");
         -- active case
         active_case := tests.executed_case;
      else
         active_case := m_current_case;
      end if; -- IsSuiteOpen
      AssertFailure( (active_case /= null) , "GetActiveTest", "case not defined!");
      -- 
      return active_case;
   end function GetActiveTest;

   -----------------------------------------------------------------------------
   -- Function FindSignal
   --! \brief    FindSignal - Find the signal in the current signal list.
   --! \details  The function searches in the current signal list for the signal. 
   --!           If the signal is not found a null pointer is returned.
   --! \return   The pointer to the signal node, null if the signal is not found.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function FindSignal (
       signal_name : in string
   ) return p_signal is
      variable active_case : p_case; 
      variable signal_node : p_signal; 
      variable current_signal : p_signal;
      variable name : string(signal_name'range);
  begin   
      signal_node := null;
      
      active_case := GetActiveTest;
      if ( active_case.monitored_signals /= null ) then
         current_signal := active_case.monitored_signals;
         for s in 1 to active_case.monitored_outputs loop
            GetString( current_signal.name, name);
            
            if ( name = signal_name ) then
               signal_node := current_signal;
               exit;
            else
               current_signal := current_signal.next_signal;
            end if; -- name = signal_name
         end loop; -- active_case.monitored_outputs
      end if; -- monitored_signals /= null
      
      return signal_node;
   end function FindSignal;

   -----------------------------------------------------------------------------
   -- Function FindLastSignal
   --! \brief    FindLastSignal - Find the last signal in the current signal list.
   --! \details  The function searches the current signal list for the last signal.
   --! \return   The pointer to the signal node, null if no signal exist.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function FindLastSignal return p_signal is
      variable active_case : p_case; 
      variable signal_node : p_signal; 
      variable current_signal : p_signal;
      variable first_signal : p_signal;
  begin   
      signal_node := null;
      
      active_case := GetActiveTest;
      if ( active_case.monitored_signals /= null ) then
         first_signal := active_case.monitored_signals;
         AssertFailure( (first_signal.next_signal /= null) , "FindLastSignal",
                         "first signal has no next!" );      
         current_signal := first_signal;
         while ( current_signal.next_signal /= first_signal ) loop
               AssertFailure( (current_signal.next_signal /= null) , "FindLastSignal",
                              "current signal has no next!" );      
               current_signal := current_signal.next_signal;
         end loop; -- active_case.monitored_outputs
         signal_node := current_signal;
      end if; -- monitored_signals /= null
      
      return signal_node;
   end function FindLastSignal;

   -----------------------------------------------------------------------------
   -- Function GetSignal
   --! \brief    GetSignal - Returns the request signal node.
   --! \details  The function returns the signal node of the requested signal.
   --!           If the signal in the current test case signal list is not
   --!           found a null pointer is returned.
   --! \return   The pointer to the signal node, null if the signal is not found.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function GetSignal (
       signal_name : in string
   ) return p_signal is
      variable signal_node : p_signal;
      variable name : string(signal_name'range);
   begin   
      if ( m_current_signal = null ) then
         signal_node := null;
      else
         GetString( m_current_signal.next_signal.name, name );
         if ( name = signal_name ) then
            signal_node := m_current_signal.next_signal;
         else
            signal_node := FindSignal( signal_name );
         end if; -- next_singnal.name = signal_name
      end if; -- m_current_signal = null
      
      return signal_node;
   end function GetSignal;

   -----------------------------------------------------------------------------
   -- Function GetSuiteStatistic
   --! \brief    GetSuiteStatistic - Returns the pointer to the active suite
   --!                               suite_statistic.
   --! \details  The function searches for the active test suite and returns 
   --!           the pointer to the suite_statistic of the suite.
   --! \return   The pointer to the suite_statistic of the active suite.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function GetSuiteStatistic return p_tests is
      variable sub_suite : p_sub_suite; 
   begin
      AssertFailure( IsSuiteOpen, "GetSuiteStatistic", "no suite open!");
      -- no sub suites
      if (m_run_statistic.executed_suites = null) then
         return m_run_statistic.executed_tests;
      end if; -- m_run_statistic.executed_suites

      -- find sub suites
      sub_suite := GetActiveSuite;
      AssertFailure( (sub_suite.executed_tests /= null) , "GetSuiteStatistic",
         "sub suite not opened!");
      return sub_suite.executed_tests;
   end function GetSuiteStatistic;

   -----------------------------------------------------------------------------
   -- Function GetSuiteName
   --! \brief    GetSuiteName - Returns the pointer to the active suite name. 
   --! \details  The function searches for the active test suite and returns 
   --!           the pointer to the name of the suite.
   --! \return   The pointer to the name of the active suite.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function GetSuiteName return line is
      variable sub_suite : p_sub_suite; 
   begin
      AssertFailure( IsSuiteOpen, "GetSuiteName", "no suite open!");
      -- no sub suites
      if (m_run_statistic.executed_suites = null) then
         return m_run_statistic.name;
      end if; -- m_run_statistic.name

      -- find sub suites
      sub_suite := GetActiveSuite;
      AssertFailure( (sub_suite.executed_tests /= null) , "GetSuiteName",
         "sub suite not opened!");
      return sub_suite.name;
   end function GetSuiteName;

   -----------------------------------------------------------------------------
   -- Function GetTestName
   --! \brief        GetTestName - Returns the pointer to test run name.
   --! \details      The function returns the pointer to the test run name if 
   --!               it is defined. If not a pointer to an empty string will be
   --!               returned. 
   --! \return       The pointer to the test run name.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function GetTestName return line is
      variable test_name : line; 
   begin
      if (m_test_name = null) then
         test_name := m_no_name;
      else
         test_name := m_test_name;
      end if; -- m_run_statistic.name

      return test_name;
   end function GetTestName;
   
   -----------------------------------------------------------------------------
   -- Function FindLastResult
   --! \brief    FindLastResult - Find the last case result node in the 
   --!           current case result list.
   --! \details  The function searches for the current case result in the 
   --!           case result node list.
   --! \return   The pointer to the case result node, null if no case 
   --!           result info exist.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function FindLastResult return p_case_result is
      variable active_case : p_case; 
      variable first_result : p_case_result;
      variable current_result : p_case_result;
      variable result_node : p_case_result;
  begin   
      result_node := null;
      
      active_case := GetActiveTest;
      -- find last case result info node
      if ( active_case.case_results /= null ) then
         first_result := active_case.case_results;
         AssertFailure( (first_result.next_result /= null) , "FindLastResult",
                         "first result has no next!" );      
         current_result := first_result;
         while ( current_result.next_result /= first_result ) loop
               AssertFailure( (current_result.next_result /= null) , "FindLastResult",
                              "current result has no next!" );      
               current_result := current_result.next_result;
         end loop; -- current_result.next_result
         result_node := current_result;
      end if; -- active_case.case_results /= null
      
      return result_node;
   end function FindLastResult;   
   
   -----------------------------------------------------------------------------
   -- Function FindLastInfo
   --! \brief    FindLastResult - Find the last case info in the current case 
   --!           result list.
   --! \details  The function searches for the last case info in the case info 
   --!           node list.
   --! \return   The pointer to the case info node, null if no case info exist.
   -- Comments :
   --               
   -----------------------------------------------------------------------------
   impure function FindLastInfo return p_case_info is
      variable active_result : p_case_result; 
      variable info_node : p_case_info;       
      variable current_info : p_case_info;
      variable first_info : p_case_info;
  begin   
      info_node := null;     
      -- find current case result
      active_result := FindLastResult;
      
      -- find last case info node
      if ( active_result.result_info /= null ) then
         first_info :=  active_result.result_info;
         AssertFailure( (first_info.next_info /= null) , "FindLastInfo",
                         "first info has no next!" );      
         current_info := first_info;
         while ( current_info.next_info /= first_info ) loop
               AssertFailure( (current_info.next_info /= null) , "FindLastInfo",
                              "current info has no next!" );      
               current_info := current_info.next_info;
         end loop; -- current_info.next_info
         info_node := current_info;
      end if; -- current_result.next_info /= null
      
      return info_node;
   end function FindLastInfo;   

   -----------------------------------------------------------------------------
   -- Procedure AddCaseResult
   --! \brief    AddCaseInfo - Add a case info to the info list.
   --! \details  The procedure adds a case info node to the current test case 
   --!           result list.
   --! \param    unit_name the name of the unit under test to add   
   --! \param    comment   the result header comment message to add
   -- Comments : 
   -- 
   -----------------------------------------------------------------------------
   procedure AddCaseResult (
      unit_name : in string;
      comment   : in string
   ) is
      variable active_case : p_case; 
      variable next_result : p_case_result;
   begin
      -- find current test case and case result info list
      active_case := GetActiveTest;   
      
      -- add new result info
      if ( active_case.case_results = null ) then
         active_case.case_results := new case_result'(null,null,null,null);
         m_current_result := active_case.case_results;
         next_result :=  active_case.case_results;
      else                
         m_current_result := FindLastResult;
         AssertFailure( (m_current_result /= null) , "AddCaseResult",
            "result list has no results!" );      
         AssertFailure( (m_current_result.next_result /= null) , "AddCaseResult",
            "active result has no next!" );      
         next_result :=  active_case.case_results;
         m_current_result.next_result := new case_result'(null,null,null,null);
         m_current_result := m_current_result.next_result; 
      end if; -- active_case.case_results = null
      
      -- update information
      m_current_result.unit_name := new string'(""); 
      write( m_current_result.unit_name, unit_name );
      m_current_result.result_comment := new string'(""); 
      write( m_current_result.result_comment, comment );
      m_current_result.next_result := next_result;      
      
   end procedure AddCaseResult;
   
   -----------------------------------------------------------------------------
   -- Procedure AddCaseInfo
   --! \brief    AddCaseInfo - Add a case info to the info list.
   --! \details  The procedure adds a case info  node to the current test case 
   --!           result list.
   --! \param    info     the info to add.
   -- Comments : updated : V 1.04  - 14.10.2015 HOT update to add on last position.
   -- 
   -----------------------------------------------------------------------------
   procedure AddCaseInfo (
      info : string
   ) is
   variable active_result : p_case_result; 
   variable current_info : p_case_info; 
   variable next_info : p_case_info; 
   begin
      -- find current case result
      active_result := FindLastResult;

      -- add new info
      if ( active_result.result_info = null ) then
         active_result.result_info := new case_info'(null,null);
         current_info := active_result.result_info;
         next_info :=  active_result.result_info;
      else                
         current_info := FindLastInfo;
         AssertFailure( (current_info /= null) , "AddCaseInfo",
            "info list has no infos!" );      
         AssertFailure( (current_info.next_info /= null) , "AddCaseInfo",
            "active info has no next!" );      
         next_info :=  current_info.next_info;
         current_info.next_info := new case_info'(null,null);
         current_info := current_info.next_info; 
      end if; -- active_result.result_info = null
      
      -- update information
      current_info.info := new string'(""); 
      write( current_info.info, info );  
      current_info.next_info := next_info;      
      
   end procedure AddCaseInfo;
   
   -----------------------------------------------------------------------------
   -- Procedure DeallocateCaseInfo
   --! \brief    DeallocateCaseInfo - Deallocate the case info node list.
   --! \details  The procedure deallocates the case info node list and set  
   --!           the list pointer to null.
   --! \param    info_list the pointer to the case info list to deallocate.
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure DeallocateCaseInfo( 
      info_list : inout p_case_info
   ) is
      variable info_node : p_case_info; 
      variable next_node : p_case_info; 
   begin
      AssertFailure( (info_list /= null) , "DeallocateCaseInfo", "list is null!");
      info_node := info_list.next_info;
      find_next : while ( info_node /= info_list ) loop
         deallocate(info_node.info);
         next_node := info_node.next_info; 
         info_node.next_info := null;  
         deallocate(info_node);
         info_node := next_node;    
      end loop find_next;
      -- last node = result_list
      deallocate(info_list.info);
      info_list.next_info := null;  
      deallocate(info_list);      
   end procedure DeallocateCaseInfo;
   
   -- DeallocateCaseResultInfo
   -----------------------------------------------------------------------------
   -- Procedure DeallocateCaseResult
   --! \brief    DeallocateCaseResult - Deallocate the case result node list.
   --! \details  The procedure deallocates the case result node list and set  
   --!           the list pointer to null.
   --! \param    result_list the pointer to the case result list to deallocate.
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure DeallocateCaseResult( 
      result_list : inout p_case_result
   ) is
      variable result_node : p_case_result; 
      variable next_node : p_case_result; 
   begin
      AssertFailure( (result_list /= null) , "DeallocateCaseResult", "list is null!");
      result_node := result_list.next_result;
      find_next : while ( result_node /= result_list ) loop
         deallocate(result_node.unit_name);
         deallocate(result_node.result_comment);
         if ( result_node.result_info /= null ) then
            DeallocateCaseInfo(result_node.result_info);
         end if; -- result_info
         next_node := result_node.next_result; 
         result_node.next_result := null;  
         deallocate(result_node);
         result_node := next_node;    
      end loop find_next;
      -- last node = result_list
      deallocate(result_list.unit_name);
      deallocate(result_list.result_comment);
      if ( result_list.result_info /= null ) then
         DeallocateCaseInfo(result_list.result_info);
      end if; -- result_info
      result_list.next_result := null;  
      deallocate(result_list);      
   end procedure DeallocateCaseResult;
 
   -----------------------------------------------------------------------------
   -- Procedure DeallocateSignal
   --! \brief    DeallocateSignal - Deallocate the signal statistic node list.
   --! \details  The procedure deallocates the signal statistic node list and 
   --!           set the list pointer to null.
   --! \param    signal_list the pointer to the signal list to deallocate.
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure DeallocateSignal( 
      signal_list : inout p_signal
   ) is
      variable signal_node : p_signal; 
      variable next_node   : p_signal; 
   begin
      AssertFailure( (signal_list /= null) , "DeallocateSignal", "list is null!");
      signal_node := signal_list.next_signal;
      find_next : while ( signal_node /= signal_list ) loop
         deallocate(signal_node.name);
         next_node := signal_node.next_signal; 
         signal_node.next_signal := null;  
         deallocate(signal_node);
         signal_node := next_node;    
      end loop find_next;
      -- last node = signal_list
      deallocate(signal_list.name);
      signal_list.next_signal := null;  
      deallocate(signal_list);      
   end procedure DeallocateSignal;
   
   -----------------------------------------------------------------------------
   -- Procedure DeallocateCase
   --! \brief    DeallocateCase - Deallocate a case statistic node.
   --!          
   --! \details  The procedure deallocates a case statistic node and associated  
   --!           signal nodes.
   --! \param    case_node   the pointer to the node to deallocate.
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure DeallocateCase( 
      case_node : inout p_case
   ) is
   begin
      AssertFailure( (case_node /= null) , "DeallocateCase", "node is null!");
      if ( case_node.unit_name /= null ) then
         deallocate(case_node.unit_name);
      end if; -- name
      if ( case_node.monitored_signals /= null ) then
         DeallocateSignal(case_node.monitored_signals);
      end if; -- monitored_signals
      if ( case_node.case_results /= null ) then
         DeallocateCaseResult(case_node.case_results);
      end if; -- case_results
      deallocate(case_node);      
   end procedure DeallocateCase;

   -----------------------------------------------------------------------------
   -- Procedure SetTestName
   --! \brief    SetTestName - Set the test run name.
   --!          
   --! \details  The procedure sets the test run name for the test run report.
   --!           
   --! \param    test_name   the report file name.
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure SetTestName( 
      test_name : in string
   ) is
   begin
      if ( m_test_name /= null ) then
         deallocate(m_test_name);      
      end if; -- m_test_name
      m_test_name := new string'(""); 
      write( m_test_name, ''' );
      write( m_test_name, test_name );
      write( m_test_name, ''' );
   
   end procedure SetTestName;
   
   -----------------------------------------------------------------------------
   -- Procedure SetReportOutput
   --! \brief    SetReportOutput - Set the status of the report output and 
   --!                             define the report file name.
   --! \details  The procedure sets the status of the report output and set 
   --!           create the report file with the specified name.
   --! \param    report_name  the report file name.
   --! \param    active       the active flag
   --! \param    level        the used log level for the report output
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure SetReportOutput( 
      report_name : in string;
      active : in boolean;
      level  : in log_level := ALL_INFO      
   ) is 
      variable test_name : line; 
   begin
      m_use_report   := active;      
      m_report_level := level;
      test_name := GetTestName;
      if ( active ) then
         OpenReport( report_name );
         WriteReportHeader( VHUNIT_VERSION, test_name.all );
      else
         CloseReport;
      end if;
   end procedure SetReportOutput;

   -----------------------------------------------------------------------------
   -- Procedure SetHTMLOutput
   --! \brief    SetHTMLOutput - Set the status of the HTML report output 
   --!                           and define the HTML report file name.
   --! \details  The procedure sets the status of the HTML report output and 
   --!           create the HTML report file with the specified name.
   --! \param    file_name  the HTML report file name.
   --! \param    active     the active flag
   --! \param    level      the used log level for the HTML output
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure SetHTMLOutput( 
      file_name : in string;
      active : in boolean;
      level  : in log_level := LOG_FAILURE            
   ) is 
      variable test_name : line; 
   begin
      m_use_html := active;         
      m_html_level := level;
      test_name := GetTestName;
      if ( active ) then
         OpenHTML( file_name );
         WriteHTMLHeader( VHUNIT_VERSION, test_name.all );
      else        
         WriteHTMLFooter( VHUNIT_VERSION );         
         CloseHTML;
      end if;
   end procedure SetHTMLOutput;

   -----------------------------------------------------------------------------
   -- Procedure SetTextOutput
   --! \brief    SetTextOutput - Set the text output status.
   --!          
   --! \details  The procedure sets the text output status.
   --!           
   --! \param    active   the active flag 
   --! \param    level    the used log level for the text output
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure SetTextOutput (
      active : in boolean;
      level  : in log_level := ALL_INFO
   ) is 
       variable test_name : line; 
   begin                                    
      m_use_output := active;
      m_output_level := level;
      test_name := GetTestName;
      if ( active ) then
         WriteHeader( VHUNIT_VERSION, test_name.all );
      end if;
   end procedure SetTextOutput;

   -----------------------------------------------------------------------------
   -- Procedure SetStatistic
   --! \brief    SetStatistic - Set the statistic status.
   --!          
   --! \details  The procedure sets the statistic output status.
   --!           
   --! \param    active  the active flag
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure SetStatistic( 
      active : in boolean
   ) is 
   begin
      m_statistic := active;
   end procedure SetStatistic;

   -----------------------------------------------------------------------------
   -- Procedure SetCaseInfo
   --! \brief    SetCaseInfo - Set the test case statistic information.
   --!          
   --! \details  The procedure sets the test case statistic information for the
   --!           statistic report.
   --! \param    unit_name  the name of the unit under test    
   --! \param    unit_outputs  the number of unit output signals available
   -- Comments :
   --
   -----------------------------------------------------------------------------
    procedure SetCaseInfo( 
      unit_name : in string;
      unit_outputs : in integer
   ) is
      variable active_case : p_case;
   begin  
      active_case := GetActiveTest;
      AssertFailure( (active_case /= null) , "SetCaseInfo", "active case is null!" );
      
      active_case.unit_name := new string'("");
      write( active_case.unit_name, unit_name );
      active_case.unit_outputs := unit_outputs;
   end procedure SetCaseInfo;

   -----------------------------------------------------------------------------
   -- Procedure PrintTestCase
   --! \brief    PrintTestCase - Print the test case execution the used outputs.
   --!          
   --! \details  The procedure prints the test case execution message to the used 
   --!           outputs of the test.
   --! \param    test_case_name  the executed test case name.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintTestCase(
      test_case_name : in string
   )is
   begin
      if ( m_use_report ) then
         WriteReportTestCase( test_case_name );
      end if ; -- m_use_report

      if ( m_use_html ) then
         WriteHTMLTestCase( test_case_name );
      end if ; -- m_use_html
      
      if ( m_use_output ) then
         WriteTestCase( test_case_name );
      end if ; -- m_use_output    
   end procedure PrintTestCase;

   -----------------------------------------------------------------------------
   -- Procedure PrintTestSuite
   --! \brief    PrintTestSuite - Print the test suite execution the used outputs.
   --!          
   --! \details  The procedure prints the test suite execution message to the 
   --!           used outputs of the test.
   --! \param    test_suite_name   the executed test suite name.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintTestSuite(
      test_suite_name : in string
   )is
   begin
      if ( m_use_report ) then
         WriteReportTestSuite( test_suite_name );
      end if ; -- m_use_report

      if ( m_use_html ) then
         WriteHTMLTestSuite( test_suite_name );
      end if ; -- m_use_html
      
      if ( m_use_output ) then
         WriteTestSuite( test_suite_name );
      end if ; -- m_use_output    
   end procedure PrintTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief    PrintFailureLine - Print a failure line to the used outputs.
   --!          
   --! \details  The procedure prints a failure line to the used outputs of the 
   --!           test.
   --! \param    test_case        the name of the test case executed.
   --! \param    actual_output    the current value.
   --! \param    expected_output  the expected value.
   --! \param    signal_name      the signal name where the failure occur.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   ) is
   begin
      if ( m_use_report and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE )) ) then
         WriteReportFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_report

      if ( m_use_html and (not ( m_html_level = NO_ERROR or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE)) ) then
         WriteHTMLFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_html
      
      if ( m_use_output and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE)) ) then
         WriteFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_output 
   end procedure PrintFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief    PrintFailureLine - Print a failure line to the used outputs.
   --!          
   --! \details  The procedure prints a failure line to the used outputs of the 
   --!           test.
   --! \param    test_case        the name of the test case executed.
   --! \param    actual_output    the current value.
   --! \param    expected_output  the expected value.
   --! \param    signal_name      the signal name where the failure occur.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   ) is
   begin
      if ( m_use_report and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE)) ) then
         WriteReportFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_report

      if ( m_use_html and (not ( m_html_level = NO_ERROR or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE)) ) then
         WriteHTMLFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_html
      
      if ( m_use_output and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE)) ) then
         WriteFailureLine( test_case, actual_output, expected_output, signal_name );
      end if ; -- m_use_output
   end procedure PrintFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintFailureLine
   --! \brief    PrintFailureLine - Print a failure line to the used outputs.
   --!           
   --! \details  The procedure prints a failure line to the used outputs of the
   --!           test.
   --! \param    test_case       the name of the test case executed.
   --! \param    actual_value    the current value.
   --! \param    expected_value  the expected value.
   --! \param    signal_name     the signal name where the failure occur.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   ) is
   begin                                
      if ( m_use_report and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE )) ) then
         WriteReportFailureLine( test_case, actual_value, expected_value, signal_name );
      end if ; -- m_use_report

      if ( m_use_html and (not ( m_html_level = NO_ERROR or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE )) ) then
         WriteHTMLFailureLine( test_case, actual_value, expected_value, signal_name );
      end if ; -- m_use_html
      
      if ( m_use_output and (not ( m_output_level = NO_ERROR or m_output_level = LOG_ONLY or m_output_level = LOG_FAILURE )) ) then
         WriteFailureLine( test_case, actual_value, expected_value, signal_name );
      end if ; -- m_use_output 
   end procedure PrintFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintCheckLine
   --! \brief    PrintCheckLine - Print a signal check line to the used outputs.
   --!          
   --! \details  The procedure prints a signal check line to the used outputs of 
   --!           the test.
   --! \param    test_case     the name of the test case executed.
   --! \param    signal_name   the signal name where the check occur.
   --! \param    message       the check information message.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   ) is
   begin   
      if ( m_use_report and ( m_report_level = ALL_INFO or m_report_level = NO_LOG or m_report_level = LOG_FAILURE ) ) then
         WriteReportCheckLine( test_case, signal_name, message );
      end if ; -- m_use_report

      if ( m_use_html and ( m_html_level = ALL_INFO or m_html_level = NO_LOG or m_html_level = LOG_FAILURE ) ) then
          WriteHTMLCheckLine( test_case, signal_name, message );
      end if ; -- m_use_html
      
      if ( m_use_output and ( m_output_level = ALL_INFO or m_output_level = NO_LOG or m_output_level = LOG_FAILURE ) ) then
         WriteCheckLine( test_case, signal_name, message );
      end if ; -- m_use_output
   end procedure PrintCheckLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintLogLine
   --! \brief    PrintLogLine - Print a signal log line to the used outputs.
   --!          
   --! \details  The procedure prints a signal log line to the used outputs 
   --!           of the test.
   --! \param    test_case      the name of the test case executed.
   --! \param    signal_name    the signal name where the check occur.
   --! \param    message        the check information message.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   ) is
   begin   
      if ( m_use_report and ( m_report_level = ALL_INFO or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE ) ) then
         WriteReportLogLine( test_case, signal_name, message );
      end if ; -- m_use_report

      if ( m_use_html and ( m_html_level = ALL_INFO or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE ) ) then
          WriteHTMLLogLine( test_case, signal_name, message );
      end if ; -- m_use_html
      
      if ( m_use_output and ( m_output_level = ALL_INFO or m_output_level = LOG_ONLY or m_output_level = LOG_FAILURE ) ) then
         WriteLogLine( test_case, signal_name, message );
      end if ; -- m_use_output
   end procedure PrintLogLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintLine
   --! \brief    PrintLine - Print a logging messsage with the defined severity.
   --!          
   --! \details  The procedure prints a general logging message to the used outputs 
   --!           of the test with the defined severity level.
   --! \param    test_case         the name of the test case executed.
   --! \param    message_severity  the logging severity of the message.
   --! \param    message           the check information message.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintLine( 
      test_case        : in string;
      message_severity : in log_severity;
      message          : in string
   ) is
   begin                                        
      
      if ( message_severity = LS_ERROR ) then      
         if ( m_use_report and (not ( m_report_level = NO_ERROR or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE )) ) then
            WriteReportLine( test_case, "ERROR", message );
         end if ; -- m_use_report
   
         if ( m_use_html and (not ( m_html_level = NO_ERROR or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE )) ) then
            WriteHTMLLINE( test_case, "ERROR", message );
         end if ; -- m_use_html
         
         if ( m_use_output and (not ( m_output_level = NO_ERROR or m_output_level = LOG_ONLY or m_output_level = LOG_FAILURE )) ) then
            WriteTextLine( test_case, "ERROR", message );
         end if ; -- m_use_output 
      end if; -- message_severity

      if ( message_severity = LS_FAILURE ) then
         if ( m_use_report and ( m_report_level = ALL_INFO or m_report_level = NO_LOG or m_report_level = LOG_FAILURE ) ) then
            WriteReportLine( test_case, "FAILURE", message );
         end if ; -- m_use_report
   
         if ( m_use_html and ( m_html_level = ALL_INFO or m_html_level = NO_LOG or m_html_level = LOG_FAILURE ) ) then
            WriteHTMLLINE( test_case, "FAILURE", message );
         end if ; -- m_use_html
         
         if ( m_use_output and ( m_output_level = ALL_INFO or m_output_level = NO_LOG or m_output_level = LOG_FAILURE) ) then
            WriteTextLine( test_case, "FAILURE", message );
         end if ; -- m_use_output         
      end if; -- message_severity
      
      if ( message_severity = LS_LOG ) then
         if ( m_use_report and ( m_report_level = ALL_INFO or m_report_level = LOG_ONLY or m_report_level = LOG_FAILURE) ) then
            WriteReportLine( test_case, "LOG", message );
         end if ; -- m_use_report
   
         if ( m_use_html and ( m_html_level = ALL_INFO or m_html_level = LOG_ONLY or m_html_level = LOG_FAILURE ) ) then
            WriteHTMLLINE( test_case, "LOG", message );
         end if ; -- m_use_html
         
         if ( m_use_output and ( m_output_level = ALL_INFO or m_output_level = LOG_ONLY or m_output_level = LOG_FAILURE ) ) then
            WriteTextLine( test_case, "LOG", message );
         end if ; -- m_use_output         
      end if; -- message_severity
      
   end procedure PrintLine;   

   -----------------------------------------------------------------------------
   -- Procedure PrintResultHeader
   --! \brief    PrintResultHeader - Print a test case result header information. 
   --! \details  The procedure add the the test case result header information to
   --!           the test case information. The result are printed after the 
   --!           case results to the used outputs.
   --! \param    unit_name the name of the unit under test    
   --! \param    comment   the result header comment message
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintResultHeader( 
      unit_name : in string;
      comment   : in string
   ) is
   begin
      AddCaseResult( unit_name, comment );
   end procedure PrintResultHeader;   

   -----------------------------------------------------------------------------
   -- Procedure PrintResultLine
   --! \brief    PrintResultLine - Print a test case result information. 
   --! \details  The procedure add the the test case result information to
   --!           the test case information. The result are printed after the 
   --!           case results to the used outputs.
   --! \param    message  the result info line message
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintResultLine( 
      message   : in string
   ) is
   begin
      AddCaseInfo( message );
   end procedure PrintResultLine;   
  
   -----------------------------------------------------------------------------
   -- Procedure PrintCaseResult
   --! \brief    PrintCaseResult - Print the test case result to the used 
   --!                             outputs.
   --! \details  The procedure prints the test case result information to the 
   --!           used outputs.
   --! \param    error   the errors of the executed test case.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintCaseResult(
      error : in integer
   ) is
     variable active_case : p_case;
   begin
--      if ( m_statistic ) then 
         active_case := GetActiveTest;
--      end if; -- m_statistic
       
      if ( m_use_report ) then
         WriteReportCaseResult( error );
         if ( m_statistic ) then
            WriteReportCaseDetails ( active_case );
         end if ; -- m_statistic
         WriteReportCaseInfo( active_case );
      end if ; -- m_use_report

      if ( m_use_html ) then
         WriteHTMLCaseResult( error );
         if ( m_statistic ) then
            WriteHTMLCaseDetails ( active_case );
         end if ; -- m_statistic
         WriteHTMLCaseInfo( active_case );
      end if ; -- m_use_html
      
      if ( m_use_output ) then
         WriteCaseResult( error );
         if ( m_statistic ) then
            WriteCaseDetails ( active_case );
         end if ; -- m_statistic
         WriteCaseInfo( active_case );
      end if ; -- m_use_output  
      
--      if ( m_statistic ) then 
--         DeallocateCase( active_case );
--      end if; -- m_statistic
      
   end procedure PrintCaseResult;

   -----------------------------------------------------------------------------
   -- Procedure PrintSuiteResult
   --! \brief    PrintSuiteResult - Print the suite test result to the used
   --!                              outputs.
   --! \details  The procedure prints the suite result information to the used 
   --!           outputs.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure PrintSuiteResult is
      variable suite_name      : line;
      variable suite_statistic : p_tests;
   begin
      if ( not IsSuiteOpen  ) then
         return;
      end if;

      suite_name := GetSuiteName;
      suite_statistic := GetSuiteStatistic;
      
      if ( m_use_report ) then
         WriteReportSuiteResult( suite_name.all, suite_statistic.all ); 
      end if ; -- m_use_report

      if ( m_use_html ) then
         WriteHTMLSuiteResult( suite_name.all, suite_statistic.all ); 
      end if ; -- m_use_html
      
      if ( m_use_output ) then
         WriteSuiteResult( suite_name.all, suite_statistic.all ) ;
      end if ; -- m_use_output    
   end procedure PrintSuiteResult;

   -----------------------------------------------------------------------------
   -- Procedure PrintResult
   --! \brief    PrintResult - Print the result of the test run to the used 
   --!           outputs.
   --! \details  The procedure prints the result of the test run information to 
   --!           the used outputs.
   -- Comments :
  --
   -----------------------------------------------------------------------------
   procedure PrintResult is
   begin
      if ( m_use_report ) then
         WriteReportResult( m_run_statistic );      
         CloseReport;
      end if ; -- use_report

      if ( m_use_html ) then
         WriteHTMLResult( m_run_statistic );      
         WriteHTMLFooter( VHUNIT_VERSION );         
         CloseHTML;
      end if ; -- use_report
      
      if ( m_use_output ) then
         WriteResult( m_run_statistic );
      end if ; -- m_use_output   
      
      -- clear allocated memory  HOT (28.06.2008)
      deallocate(m_run_statistic.name);
   end procedure PrintResult;
   
   -----------------------------------------------------------------------------
   -- Procedure AddSuite
   --! \brief    AddSuite - Add a suite to the test statistic.
   --!          
   --! \details  The procedure increments the suite counter of the test 
   --!           statistic and add a new suite statistic node.
   --! \param    test_suite_name  the executed test suite name.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure AddSuite (
         test_suite_name : in string
   ) is
      variable sub_suite : p_sub_suite; 
   begin
      -- no suite open
      if ( not IsSuiteOpen  ) then
         m_run_statistic.name := new string'(""); 
         write( m_run_statistic.name, test_suite_name );
         m_run_statistic.executed_tests := new suite_statistic'(0,0,0,null);
         m_run_statistic.suites := m_run_statistic.suites + 1;
         return;
      end if; -- not IsSuiteOpen

      -- no sub suite
      if ( m_run_statistic.executed_suites = null ) then
         m_run_statistic.executed_suites := new test_statistic'(null,0,0,0,0,null,null); 
         m_run_statistic.executed_suites.name := new string'(""); 
         write( m_run_statistic.executed_suites.name, test_suite_name );
         m_run_statistic.executed_suites.executed_tests := new suite_statistic'(0,0,0,null);
         m_run_statistic.executed_suites.suites := 1;
         return;
      end if; -- = null

      -- has sub suite
      sub_suite := GetActiveSuite;
      sub_suite.executed_suites := new test_statistic'(null,0,0,0,0,null,null); 
      sub_suite.executed_suites.name := new string'(""); 
      write( sub_suite.executed_suites.name, test_suite_name );
      sub_suite.executed_suites.executed_tests := new suite_statistic'(0,0,0,null);
      sub_suite.executed_suites.suites := 1;
      
   end procedure AddSuite;

   -----------------------------------------------------------------------------
   -- Procedure AddTest
   --! \brief    AddTest - Add a case to the test statistic.
   --!          
   --! \details  The procedure increments the test counter of the executed suite
   --!           and adds a new case statistic node. If no suite is available it
   --!           updates direct the test statistic.
   -- Comments :
   --
   -----------------------------------------------------------------------------
   procedure AddTest is
      variable suite_statistic : p_tests;
   begin   
      if ( IsSuiteOpen  ) then
         suite_statistic := GetSuiteStatistic;
         suite_statistic.tests := suite_statistic.tests + 1;
         -- deallocate old case
         if ( suite_statistic.executed_case /= null ) then
            DeallocateCase(suite_statistic.executed_case);
            m_current_signal := null;
         end if; -- executed_case /= null
         suite_statistic.executed_case := new case_statistic'(null,0,0,null,null);
      else
         m_run_statistic.tests := m_run_statistic.tests + 1;
         if ( m_current_case /= null ) then
            DeallocateCase(m_current_case);
            m_current_signal := null;
         end if; -- m_current_case /= null
         m_current_case := new case_statistic'(null,0,0,null,null);
      end if ; -- IsSuiteOpen
   end procedure AddTest;

   -----------------------------------------------------------------------------
   -- Procedure AddSignal
   --! \brief    AddSignal - Add a signal to the test case signal list.
   --!          
   --! \details  The procedure adds a signal node to the current test case 
   --!           signal list.
   --! \param    signal_name     the signal name to add.
   -- Comments : updated : V 1.04  - 14.10.2015 HOT update to add on last position.
   -- 
   -----------------------------------------------------------------------------
   procedure AddSignal (
      signal_name : in string
   ) is
      variable case_statistic : p_case;
      variable next_signal : p_signal;
   begin
      -- find current test and signal and add new signal
      case_statistic := GetActiveTest;
      if ( case_statistic.monitored_signals = null ) then
         case_statistic.monitored_signals := new signal_statistic'(null,0,0,null);
         m_current_signal := case_statistic.monitored_signals;
         next_signal := case_statistic.monitored_signals;
      else                
         m_current_signal := FindLastSignal;
         AssertFailure( (m_current_signal /= null) , "AddSignal",
            "signal list has no signals!" );      
         AssertFailure( (m_current_signal.next_signal /= null) , "AddSignal",
            "active signal has no next!" );      
         next_signal := m_current_signal.next_signal;
         m_current_signal.next_signal := new signal_statistic'(null,0,0,null);
         m_current_signal := m_current_signal.next_signal; 
      end if; -- m_current_signal = null
      
      -- update information
      m_current_signal.name := new string'(""); 
      write( m_current_signal.name, signal_name );
      m_current_signal.next_signal := next_signal;      
      -- increase monitored number
      case_statistic.monitored_outputs := case_statistic.monitored_outputs + 1;
   end procedure AddSignal;

   -----------------------------------------------------------------------------
   -- Procedure UpdateSignal
   --! \brief   UpdateSignal - update the status of a monitored signal. 
   --!          
   --! \details  The procedure updates the signal status. If the signal is not 
   --!           found in the current signal list, the signal is added to the 
   --!           signal list.
   --! \param    signal_name     the signal name to update.
   --! \param    signal_event    the number of events
   --! \param    signal_error    the number of errors 
   -- Comments : 
   --
   -----------------------------------------------------------------------------
   procedure UpdateSignal (
      signal_name : in string;
      signal_event : in integer;
      signal_error : in integer
   ) is
      variable signal_node : p_signal;
   begin
      if ( not m_statistic ) then 
         return;
      end if; -- m_statistic
      
      -- Quick decision if UUT name set (HOT ?)
      
      signal_node := GetSignal( signal_name );
      if ( signal_node = null ) then
         AddSignal( signal_name );
         signal_node := m_current_signal;
      else
         m_current_signal := signal_node;
      end if; -- signal_node = null
      
      -- update status
      signal_node.events := signal_node.events + signal_event;
      signal_node.errors := signal_node.errors + signal_error;
   end procedure UpdateSignal;

   -----------------------------------------------------------------------------
   -- Procedure UpdateTest
   --! \brief   UpdateTest - Update the test statistic.
   --!          
   --! \details  The procedure increments the test pass counter or the test fail 
   --!           counter of the executed suite. If not available it updates 
   --!           directly the test statistic.
   --! \param    error  the number of errors
   -- Comments : 
   --
   -----------------------------------------------------------------------------
   procedure UpdateTest (
      error : in integer   
   ) is
      variable suite_statistic : p_tests;
      variable pass : integer := 0;
      variable fail : integer := 0;
   begin               
      if ( error > 0 ) then
         fail := 1;
      else
         pass := 1;
      end if; -- error
      
      if ( IsSuiteOpen  ) then
         suite_statistic := GetSuiteStatistic;
         suite_statistic.pass := suite_statistic.pass + pass;
         suite_statistic.fail := suite_statistic.fail + fail;
      else
         m_run_statistic.pass := m_run_statistic.pass + pass;
         m_run_statistic.fail := m_run_statistic.fail + fail;
      end if ; -- IsSuiteOpen
   end procedure UpdateTest;

   -----------------------------------------------------------------------------
   -- Procedure UpdateSuiteResult
   --! \brief    UpdateSuiteResult  - Update the test statistic information.
   --! \details  The procedure updates the test statistic information with 
   --!           the information from the suite statistic.
   -- Comments : 
   --
   -----------------------------------------------------------------------------
   procedure UpdateSuiteResult is
      variable sub_suite : p_sub_suite; 
      variable upper_suite : p_sub_suite; 
      variable suite_statistic : p_tests;
   begin
      AssertFailure( IsSuiteOpen, "UpdateSuiteResult", "no suite open!");
      
      -- no sub suite
      if ( m_run_statistic.executed_suites = null ) then
         suite_statistic := m_run_statistic.executed_tests;
         m_run_statistic.tests := m_run_statistic.tests + suite_statistic.tests;
         m_run_statistic.pass := m_run_statistic.pass + suite_statistic.pass;
         m_run_statistic.fail := m_run_statistic.fail + suite_statistic.fail;
                  
         deallocate(m_run_statistic.name);                              
         -- check if executed_case = null (HOT 14.11.2011)
         if ( m_run_statistic.executed_tests.executed_case /= null ) then
            DeallocateCase(m_run_statistic.executed_tests.executed_case); 
         end if;
         m_current_signal := null;
         deallocate(m_run_statistic.executed_tests);
         return;
      end if;
      
      -- find suites in tree
      sub_suite := m_run_statistic.executed_suites;
      upper_suite := null;
      find : while (sub_suite.executed_suites /= null) loop
         upper_suite := sub_suite;
         sub_suite := sub_suite.executed_suites;
      end loop find;

      -- update suite
      suite_statistic := sub_suite.executed_tests;
      sub_suite.tests := sub_suite.tests + suite_statistic.tests;
      sub_suite.pass := sub_suite.pass + suite_statistic.pass;
      sub_suite.fail := sub_suite.fail + suite_statistic.fail;           

      DeallocateCase(sub_suite.executed_tests.executed_case);
      m_current_signal := null;
      deallocate(sub_suite.executed_tests);
      
      -- update upper suite
      if ( upper_suite /= null ) then	  
         upper_suite.suites := upper_suite.suites + sub_suite.suites;
         upper_suite.tests := upper_suite.tests + sub_suite.tests;
         upper_suite.pass := upper_suite.pass + sub_suite.pass;
         upper_suite.fail := upper_suite.fail + sub_suite.fail;
         upper_suite.executed_suites := null;
      else
         suite_statistic := m_run_statistic.executed_tests;
         suite_statistic.tests := suite_statistic.tests + sub_suite.tests;
         suite_statistic.pass := suite_statistic.pass + sub_suite.pass;
         suite_statistic.fail := suite_statistic.fail + sub_suite.fail;
         m_run_statistic.executed_suites := null;        
      end if ; -- uper_suite
      -- delete sub_suite
      deallocate(sub_suite.name);
      deallocate(sub_suite);
      
   end procedure UpdateSuiteResult;
   
end package body TestStatistic_pkg;

------------------------------------------------------------------------------
-- end TestStatistic_pkg.vhd
------------------------------------------------------------------------------
