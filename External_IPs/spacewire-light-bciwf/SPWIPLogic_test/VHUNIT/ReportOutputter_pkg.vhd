--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         ReportOutputter_pkg.vhd
--!
--! \brief        Package with file report functions for the VHUNIT project.
--!               
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 08.05.2006
--! \date         Updated: 05.03.2019
--! \version      V 1.06
--
-- Package      : ReportOutputter_pkg (declaration, body)
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
-- Revision 1.2  2008/08/26 17:57:31  ottacher
-- Update memory leaks
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
--! IEEE standard logic textio package
use ieee.std_logic_textio.all;

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

--------------------------------------------------------------------------------
-- Package ReportOutputter_pkg
--! \brief        ReportOutputter_pkg - file report function package for 
--!               VHUNIT project.
--! \details      Implements procedures to report test results and failures 
--!               to a file.
--! - Procedures
--! \li \ref OpenReport             - Open the report file for writing.
--! \li \ref CloseReport            - Close the report file.
--! \li \ref WriteReportHeader      - Write the report header to the report file.
--! \li \ref WriteReportTestCase    - Write the test case execution to the 
--!                                   report file.
--! \li \ref WriteReportTestSuite   - Write the test suite execution to the 
--!                                   report file.
--! \li \ref WriteReportFailureLine - Write a failure line to the report file.  
--! \li \ref WriteReportCheckLine   - Write a check line to the report file.  
--! \li \ref WriteReportLogLine     - Write a log line to the report file. 
--! \li \ref WriteReportLine        - Write a message line to the report file. 
--! \li \ref WriteReportCaseResult  - Write the test case result to the report 
--!                                   file.
--! \li \ref WriteReportCaseDetails - Write the test case statistic to the 
--!                                   report file.
--! \li \ref WriteReportCaseInfo    - Write the test case reult info to the  
--!                                   report file.
--! \li \ref WriteReportSuiteResult - Write the suite test result to the 
--!                                   report file.
--! \li \ref WriteReportResult      - Write the result of the test run to 
--!                                   the report file.
--
-- Comments     :
--                
-- Updates : V 1.00 - 13.06.2006 HOT change report format
--                    22.06.2006 HOT add test run name      
--                    28.08.2008 HOT add deallocate for allocated memory
--                    29.08.2010 HOT add WriteReportCaseDetails
--           V 1.04 - 12.10.2015 HOT update Print.. function for string usage
--                                      add PrintLog and PrintCheck functions
--           V 1.06 - 19.04.2018 HOT add WriteReportLine function
--                    05.03.2019 HOT add WriteCaseInfo function
--                   
--------------------------------------------------------------------------------
package ReportOutputter_pkg is

   ----------------------------------------------------------------------------
   -- Procedure OpenReport
   --! \brief  Open the report file for writing.
   ----------------------------------------------------------------------------
   procedure OpenReport( 
      report_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure CloseReport
   --! \brief  Close the report file.
   ----------------------------------------------------------------------------
   procedure CloseReport;

   ----------------------------------------------------------------------------
   -- Procedure WriteReportHeader
   --! \brief  Write the report header to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportHeader (
      vhunit_version : in string;
      test_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportTestCase
   --! \brief  Write the test case execution to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportTestCase(
      test_case_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportTestSuite
   --! \brief  Write the test suite execution to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportTestSuite(
      test_suite_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   );                              
   
   ----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportCheckLine
   --! \brief  Write a check line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportLogLine
   --! \brief  Write a log line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportLine
   --! \brief  Write a message line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportLine( 
      test_case        : in string;
      message_severity : in string;
      message          : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure WriteReportCaseResult
   --! \brief  Write the test case result to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportCaseResult(
      error : in integer
   );   

   ----------------------------------------------------------------------------
   -- Procedure WriteReportCaseDetails
   --! \brief  Write the test case statistic to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportCaseDetails(
      active_case : inout p_case 
   );   
   
   ----------------------------------------------------------------------------
   -- Procedure WriteReportCaseInfo
   --! \brief  Write the test case result info to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportCaseInfo(
      active_case : inout p_case 
   );   
   
   ----------------------------------------------------------------------------
   -- Procedure WriteReportSuiteResult
   --! \brief  Write the suite test result to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportSuiteResult (
      suite_name : in string;
      suite : inout suite_statistic
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteReportResult
   --! \brief  Write the result of the test run to the report file.
   ----------------------------------------------------------------------------
   procedure WriteReportResult(
      run : inout test_statistic
   );

end package ReportOutputter_pkg;

------------------------------------------------------------------------------
-- Body ReportOutputter_pkg
--! \brief Report Outputter package implementation.
------------------------------------------------------------------------------
package body ReportOutputter_pkg is
   ---------------------------------------------------------------------------
   -- Internal constants and variables
   ---------------------------------------------------------------------------
   --! the identification level variable.
   shared variable m_ident : integer := 0; 
   --! the report file handle.
   file report_file : text;

   --! \todo GetIdentString: How to document a function only used internally?
   impure function GetIdentString return line is
      variable ident : line := new string'("");
   begin
      fill : for i in 1 to m_ident loop
         write( ident, string'("   ") );
      end loop fill;
      return ident;
   end function GetIdentString;

   -----------------------------------------------------------------------------
   -- Procedure OpenReport
   --! \brief    OpenReport - Open the report file for writing.
   --! \details  The procedure opens the test unit report file with the specified
   --!           name. If the file can not be opened an assertion is executed.
   --! \param    report_name  the report file name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure OpenReport( 
      report_name : in string
   ) is     
      variable file_ok : file_open_status;
   begin
      file_open(file_ok, report_file, report_name, WRITE_MODE);
      AssertFailure((file_ok = OPEN_OK), "OpenReport",
         "report file " & report_name & " can not be opened!");
         
   end procedure OpenReport;   

   -----------------------------------------------------------------------------
   -- Procedure CloseReport
   --! \brief      CloseReport - Close the report file.
   --! \details    The procedure closes the test unit report file.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure CloseReport is     
   begin
      file_close( report_file );      
   end procedure CloseReport;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportHeader
   --! \brief    WriteReportHeader - Write the report header to the report file.
   --! \details  The procedure writes the header information to the test unit 
   --!           report file.
   --! \param    vhunit_version  the version of the VHUNIT package.
   --! \param    test_name       the name of the test run.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportHeader (
      vhunit_version : in string;
      test_name : in string
   ) is
      variable report_line : line;
      variable seperator : string(1 to 78);   
   begin
      seperator := "------------------------------------------------------------------------------";
      write(report_line, seperator );      
      writeline(report_file, report_line);
      write(report_line, string'("-- VHUNIT Test run report file"));
      writeline(report_file, report_line);
      write(report_line, string'("-- Automatic generated by VHUNIT version"));
      write(report_line, vhunit_version );
      writeline(report_file, report_line);
      write(report_line, seperator );      
      writeline(report_file, report_line);
      write(report_line, string'("-- Executed test run "));
      write(report_line, test_name);
      writeline(report_file, report_line);
      write(report_line, seperator );      
      writeline(report_file, report_line);
   end procedure WriteReportHeader;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportTestCase
   --! \brief      WriteReportTestCase - Write the test case execution to the 
   --!                                   report file.
   --! \details    The procedure writes the test case execution message to the 
   --!             test unit report file.
   --! \param      test_case_name  the executed test case name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportTestCase(
      test_case_name : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("TC "));
      write(report_line, test_case_name);
      write(report_line, string'(" - start | "));
      write(report_line, NOW);      
      writeline(report_file, report_line); 
      deallocate( ident ); -- update HOT 28.08.2008 
   end procedure WriteReportTestCase;

   -----------------------------------------------------------------------------
   -- Procedure WriteReportTestSuite
   --! \brief      WriteReportTestSuite - Write the test suite execution to the 
   --!                                    report file.
   --! \details    The procedure writes the test suite execution message to the 
   --!             test unit report file.
   --! \param      test_suite_name  the executed test suite name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportTestSuite(
      test_suite_name : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("TS "));
      write(report_line, test_suite_name);
      writeline(report_file, report_line);
      
      deallocate( ident );
      m_ident := m_ident + 1;
   end procedure WriteReportTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief      WriteReportFailureLine - Write a failure text line to the 
   --!                                      report file.
   --! \details    The procedure writes the failure text line to the test unit 
   --!             report file.
   --! \param      test_case        the name of the test case executed.
   --! \param      actual_output    the current value.
   --! \param      expected_output  the expected value.
   --! \param      signal_name      the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);
      write(report_line, string'("; ERROR  ; TestCase "));
      write(report_line, test_case );
      write(report_line, string'("; Signal "));
      write(report_line, signal_name);
      write(report_line, string'("; expected: "));
      write(report_line, expected_output);
      write(report_line, string'(", current: "));
      write(report_line, actual_output);
      writeline(report_file, report_line);
      deallocate( ident );
   end procedure WriteReportFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief      WriteReportFailureLine - Write a failure text line to the 
   --!                                      report file.
   --! \details    The procedure writes the failure text line to the test unit 
   --!             report file.
   --! \param      test_case        the name of the test case executed.
   --! \param      actual_output    the current value.
   --! \param      expected_output  the expected value.
   --! \param      signal_name      the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);
      write(report_line, string'("; ERROR  ; TestCase "));
      write(report_line, test_case );
      write(report_line, string'("; Signal "));
      write(report_line, signal_name);
      write(report_line, string'("; expected: "));
      write(report_line, expected_output);
      write(report_line, string'(", current: "));
      write(report_line, actual_output);
      writeline(report_file, report_line); 
      deallocate( ident );
   end procedure WriteReportFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportFailureLine
   --! \brief      WriteReportFailureLine - Write a failure text line to the 
   --!                                      report file.
   --! \details    The procedure writes the failure text line to the test unit 
   --!             report file.
   --! \param      test_case       the name of the test case executed.
   --! \param      actual_value    the current value.
   --! \param      expected_value  the expected value.
   --! \param      signal_name     the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);
      write(report_line, string'("; ERROR  ; TestCase "));
      write(report_line, test_case );
      write(report_line, string'("; Signal "));
      write(report_line, signal_name);
      write(report_line, string'("; expected: "));
      write(report_line, expected_value);
      write(report_line, string'(", current: "));
      write(report_line, actual_value);
      writeline(report_file, report_line); 
      deallocate( ident );
   end procedure WriteReportFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportCheckLine
   --! \brief      WriteReportCheckLine - Write the signal check line to the 
   --!                                    report file.
   --! \details    The procedure writes the signal check line to the test unit 
   --!             report file.
   --! \param      test_case    the name of the test case executed.
   --! \param      signal_name  the signal name where the check failure occur.
   --! \param      message      the check information message.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);
      write(report_line, string'("; FAILURE; TestCase "));
      write(report_line, test_case );
      write(report_line, string'("; Signal "));
      write(report_line, signal_name);
      write(report_line, string'("; "));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, message);
      writeline(report_file, report_line); 
      deallocate(ident);
   end procedure WriteReportCheckLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportLogLine
   --! \brief     WriteLogLine - Write the signal log line to the report file.
   --! \details   The procedure writes the signal log line to the test unit 
   --!            report file.
   --! \param     test_case    the name of the test case executed.
   --! \param     signal_name  the signal name where the log is associated.
   --! \param     message      the log information message.
   -- Comments    :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);
      write(report_line, string'("; LOG    ; TestCase "));
      write(report_line, test_case );
      write(report_line, string'("; Signal "));
      write(report_line, signal_name);
      write(report_line, string'("; "));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, message);
      writeline(report_file, report_line); 
      deallocate(ident);
   end procedure WriteReportLogLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteReportLine
   --! \brief     WriteReportLine - Write a message line to the report file.
   --! \details   The procedure writes general message line to the test unit 
   --!            report file with the defined severity.
   --! \param     test_case         the name of the test case executed.
   --! \param     message_severity  the message severity to write.
   --! \param     message           the message to write.
   -- Comments    :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportLine( 
      test_case        : in string;
      message_severity : in string;
      message          : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("Time: "));
      write(report_line, NOW);             
      if ( message_severity = "ERROR" ) then
         write(report_line, string'("; ERROR  "));
      elsif ( message_severity = "FAILURE" ) then
         write(report_line, string'("; FAILURE"));
      else
         write(report_line, string'("; LOG    "));
      end if; 
      write(report_line, string'("; TestCase "));      
      write(report_line, test_case );
      write(report_line, string'("; - "));
      write(report_line, string'("; "));
      write(report_line, message);
      writeline(report_file, report_line); 
      deallocate(ident);
   end procedure WriteReportLine;   
   
   -----------------------------------------------------------------------------
   -- Procedure WriteReportCaseResult
   --! \brief    WriteReportCaseResult - Write the test case result to the 
   --!                                   report file.
   --! \details  The procedure prints the test case result information to the 
   --!           report file.
   --! \param    error  the errors of the executed test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportCaseResult(
      error : in integer
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("   - "));
      if ( error > 0 ) then
         write(report_line, string'("Errors "));
         write(report_line, error);
      else
         write(report_line, string'("OK!"));         
      end if; -- error
      writeline(report_file, report_line);   
      deallocate( ident );
   end procedure WriteReportCaseResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteReportCaseDetails
   --! \brief      WriteReportCaseDetails - Write the test case statistic 
   --!                                      details to the report file.
   --! \details    The procedure prints the test case statistic details 
   --!             information to the report file.
   --!             
   --! \param      active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportCaseDetails(
      active_case : inout p_case 
   ) is
      variable report_line: line;
      variable ident: line;
      variable signal_node : p_signal; 
   begin
      AssertFailure( (active_case /= null) , "WriteReportCaseDetails",
                     "active case is null!");

      if ( active_case.unit_name = null ) then
         return;
      end if; -- unit_name = null

      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("   - UUT : "));
      write(report_line, active_case.unit_name.all );
      if ( active_case.unit_outputs > 0 ) then
         write(report_line, string'(" | Output Signals : "));
         write(report_line, active_case.unit_outputs );
      end if; --  unit_outputs > 0    
      if ( active_case.monitored_outputs > 0 ) then  
         write(report_line, string'(" | Monitored Signals : "));
         write(report_line, active_case.monitored_outputs);
      end if; -- monitored_outputs > 0 
      writeline(report_file, report_line); 
      --
      if ( active_case.monitored_outputs > 0 ) then  
         -- signal statistic
         signal_node := active_case.monitored_signals;
         AssertFailure( (signal_node /= null) , "WriteCaseDetails", 
            "signal list is null!");
         for s in 1 to active_case.monitored_outputs loop
            write(report_line, string'("-- "));
            write(report_line, ident.all);
            write(report_line, string'("      +- "));
            write(report_line, signal_node.name.all);
            write(report_line, string'(" : Events = "));
            write(report_line, signal_node.events);
            write(report_line, string'(" | Errors = "));
            write(report_line, signal_node.errors);
            writeline(report_file, report_line);
            signal_node := signal_node.next_signal;
         end loop; -- active_case.monitored_outputs
      end if; -- monitored_outputs > 0 
      deallocate(ident);
   end procedure WriteReportCaseDetails;
   
   -----------------------------------------------------------------------------
   -- Procedure WriteReportCaseInfo
   --! \brief      WriteReportCaseInfo - Write the test case result info to 
   --!                                   the report file.
   --! \details    The procedure prints the test case result information
   --!             to the report file.
   --! \param      active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportCaseInfo(
      active_case : inout p_case 
   ) is
      variable report_line: line;
      variable ident: line;
      variable first_result : p_case_result; 
      variable result_node : p_case_result; 
      variable first_info : p_case_info; 
      variable info_node : p_case_info; 
   begin
      AssertFailure( (active_case /= null) , "WriteReportCaseDetails",
                     "active case is null!");

      if ( active_case.case_results = null ) then
         return;
      end if; -- case_results = null

      ident := GetIdentString;

      result_node := active_case.case_results;
      first_result := null;      
      
      while ( result_node /= first_result ) loop
         AssertFailure( (result_node.next_result /= null) , "WriteReportCaseDetails",
                        "result node has no next!" );      
            
         write(report_line, string'("-- "));
         write(report_line, ident.all);
         write(report_line, string'("   - UUT : "));  
         write(report_line, result_node.unit_name.all );
         write(report_line, string'(" | "));
         write(report_line, result_node.result_comment.all );
         writeline(report_file, report_line); 
            
         if ( result_node.result_info /= null ) then      
            info_node := result_node.result_info;
            first_info := null;                    
            
            while ( info_node /= first_info ) loop
               AssertFailure( (info_node.next_info /= null) , "WriteReportCaseDetails",
                               "info node has no next!" );      
               write(report_line, string'("-- "));
               write(report_line, ident.all);
               write(report_line, string'("      +- "));
               write(report_line, info_node.info.all );
               writeline(report_file, report_line); 
               
               info_node := info_node.next_info;
               first_info := result_node.result_info;
            end loop; -- info_node.next_info
         end if; -- result_node.result_info /= null
            
         result_node := result_node.next_result;
         first_result := active_case.case_results;
      end loop; -- result_node.next_result
      
      deallocate(ident);
   end procedure WriteReportCaseInfo;
   
   -----------------------------------------------------------------------------
   -- Procedure WriteReportSuiteResult
   --! \brief      WriteReportSuiteResult - Write the suite test result to 
   --!                                      the report file.
   --! \details    The procedure writes the suite result information to the
   --!              report file.
   --! \param      suite_name  the name of the test suite executed.
   --! \param      suite       statistic values of the test suite executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportSuiteResult (
      suite_name : in string;
      suite : inout suite_statistic
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      m_ident := m_ident - 1;

      ident := GetIdentString;
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'("TS "));
      write(report_line, suite_name);
      write(report_line, string'(" - executed tests "));
      write(report_line, suite.tests);
      writeline(report_file, report_line);   
      
      write(report_line, string'("-- "));
      write(report_line, ident.all);
      write(report_line, string'(" - passed "));
      write(report_line, suite.pass);
      if ( suite.fail > 0 ) then
         write(report_line, string'(" FAIL "));
         write(report_line, suite.fail);
      end if; -- fail
      writeline(report_file, report_line);   

      deallocate( ident );
   end procedure WriteReportSuiteResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteReportResult
   --! \brief      WriteReportResult - Write the result of the test run to 
   --!                                 the report file.
   --! \details    The procedure writes the result of the test run information 
   --!             to the report file.
   --! \param      run  statistic values of the test case executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteReportResult(
      run : inout test_statistic
   ) is
      variable report_line: line;
      variable seperator : string(1 to 78);   
   begin
      seperator := "------------------------------------------------------------------------------";
      write(report_line, seperator );      
      writeline(report_file, report_line);   

      write(report_line, string'("-- Result"));
      writeline(report_file, report_line);   
      
      write(report_line, string'("-- executed tests "));
      write(report_line, run.tests);
      writeline(report_file, report_line);   

      write(report_line, string'("--   passed "));
      write(report_line, run.pass);
      if ( run.fail > 0 ) then
         write(report_line, string'(" FAIL "));
         write(report_line, run.fail);
      end if; -- fail
      writeline(report_file, report_line);   

      write(report_line, seperator );      
      writeline(report_file, report_line);   
   
   end procedure WriteReportResult;  
   
end package body ReportOutputter_pkg;

------------------------------------------------------------------------------
-- end ReportOutputter_pkg.vhd
------------------------------------------------------------------------------
