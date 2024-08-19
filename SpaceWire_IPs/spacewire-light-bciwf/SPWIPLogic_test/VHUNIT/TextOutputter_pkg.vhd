--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TextOutputter_pkg.vhd
--!
--! \brief        Package with text report functions for the VHUNIT project.
--!               
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 08.05.2006
--! \date         Updated: 05.03.2019
--! \version      V 1.06
--
-- Package      : TextOutputter_pkg (declaration, body)
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
-- Revision 1.4  2011/06/07 15:04:15  ottacher
-- Work state, updated with additional unit statistics
--
-- Revision 1.3  2008/08/26 17:57:31  ottacher
-- Update memory leaks
--
-- Revision 1.2  2007/11/12 17:24:42  ottacher
-- Update for easy vector usage.
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
-- Package TextOutputter_pkg
--! \brief        TextOutputter_pkg - Text report function package for 
--!               VHUNIT project.
--! \details      Implements procedures to report results and failures to 
--!               the text output.
--! - Procedures
--! \li \ref  WriteHeader      - Write the test run header to the text output.
--! \li \ref  WriteTestCase    - Write the test case execution to the text 
--!                              output.
--! \li \ref  WriteTestSuite   - Write the test suite execution to the text 
--!                              output.
--! \li \ref  WriteFailureLine - Write a failure line to the text output. 
--! \li \ref  WriteCheckLine   - Write a check line to the text output.         
--! \li \ref  WriteLogLine     - Write a log line to the text output. 
--! \li \ref  WriteTextLine    - Write a message line to the text output. 
--! \li \ref  WriteCaseResult  - Write the test case result to the text output.        
--! \li \ref  WriteCaseDetails - Write the test case statistic to the text 
--!                              output. 
--! \li \ref  WriteCaseInfo    - Write the test case reult info to the text 
--!                              output. 
--! \li \ref  WriteSuiteResult - Write the suite test result to the text output.
--! \li \ref  WriteResult      - Write the result of the test run to the text
--!                              output.
--
-- Comments     :
--                
-- Updates : V 1.00 - 13.06.2006 HOT change report format
--                    22.06.2006 HOT add test run name   
--                    28.08.2008 HOT add deallocate for allocated memory
--                    15.08.2010 HOT add WriteCaseDetails
--           V 1.04 - 12.10.2015 HOT update Write.. function for string usage
--                                   add WriteLog and WriteCheck functions
--           V 1.06 - 19.04.2018 HOT add WriteTextLine function
--                    05.03.2019 HOT add WriteCaseInfo function
--
--------------------------------------------------------------------------------
package TextOutputter_pkg is

   ----------------------------------------------------------------------------
   -- Procedure WriteHeader
   --! \brief  Write the test run header to the text output.
   ----------------------------------------------------------------------------
   procedure WriteHeader (
      vhunit_version : in string;
      test_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteTestCase
   --! \brief  Write the test case execution to the text output.
   ----------------------------------------------------------------------------
   procedure WriteTestCase(
      test_case_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteTestSuite
   --! \brief  Write the test suite execution to the text output.
   ----------------------------------------------------------------------------
   procedure WriteTestSuite(
      test_suite_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteFailureLine
   --! \brief   Write a failure line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   );                              
   
   ----------------------------------------------------------------------------
   -- Procedure WriteFailureLine
   --! \brief   Write a failure line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteFailureLine
   --! \brief   Write a failure line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   );                           

   ----------------------------------------------------------------------------
   -- Procedure WriteCheckLine
   --! \brief  Write a check line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteLogLine
   --! \brief  Write a log line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteTextLine
   --! \brief  Write a message line to the text output.
   ----------------------------------------------------------------------------
   procedure WriteTextLine( 
      test_case        : in string;
      message_severity : in string;
      message          : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure WriteCaseResult
   --! \brief  Write the test case result to the text output.
   ----------------------------------------------------------------------------
   procedure WriteCaseResult(
      error : in integer
   );        

   ----------------------------------------------------------------------------
   -- Procedure WriteCaseDetails
   --! \brief  Write the test case statistic to the text output.
   ----------------------------------------------------------------------------
   procedure WriteCaseDetails(
      active_case : inout p_case 
   );   

   ----------------------------------------------------------------------------
   -- Procedure WriteCaseInfo
   --! \brief  Write the test case result info to the text output.
   ----------------------------------------------------------------------------
   procedure WriteCaseInfo(
      active_case : inout p_case 
   );   
   
   ----------------------------------------------------------------------------
   -- Procedure WriteSuiteResult
   --! \brief  Write the suite test result to the text output.
   ----------------------------------------------------------------------------
   procedure WriteSuiteResult (
      suite_name : in string;
      suite : inout suite_statistic
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteResult
   --! \brief  Write the result of the test run to the text output.
   ----------------------------------------------------------------------------
   procedure WriteResult(
      run : inout test_statistic
   );
   
end package TextOutputter_pkg;

------------------------------------------------------------------------------
-- Body TextOutputter_pkg
--! \brief  Text Outputter package implementation.
------------------------------------------------------------------------------
package body TextOutputter_pkg is

   -----------------------------------------------------------------------------
   -- Internal constants and variables
   -----------------------------------------------------------------------------
   shared variable m_ident : integer := 0; -- the ident level
   
   -----------------------------------------------------------------------------
   -- Function GetSubUnitString
   --! \brief        GetSubUnitString  - Get the indent string for a sub unit text.
   --! \details      The function return the correct indenting string for the 
   --!               sub unit text string.
   --!
   --! \return       the sub unit indenting string  
   -- Comments     : 
   --
   -----------------------------------------------------------------------------
   impure function GetSubUnitString return line is
      variable ident : line := new string'("");
   begin
      if ( m_ident = 0 ) then
         return ident;
      end if; -- m_ident
      
      fill : for i in 2 to m_ident loop
         write( ident, string'("|  ") );         
      end loop fill;
      write( ident, string'("+- ") );         
      
      return ident;
   end function GetSubUnitString;
   
   -----------------------------------------------------------------------------
   -- Function GetIdentString
   --! \brief        GetIdentString  - Get the indent string for a text line.
   --! \details      The function return the correct indenting string for the 
   --!               text line string.
   --!
   --! \return       the text indenting string  
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   impure function GetIdentString return line is
      variable ident : line := new string'("");
   begin
      fill : for i in 1 to m_ident loop
         write( ident, string'("|  ") );         
      end loop fill;
      return ident;
   end function GetIdentString;

   -----------------------------------------------------------------------------
   -- Procedure WriteHeader
   --! \brief    WriteHeader - Write the test run header to the text output.
   --!                             
   --! \details  The procedure writes the test run header information to the
   --!           test unit text output.
   --!
   --! \param    vhunit_version  the version of the VHUNIT package.
   --! \param    test_name       the name of the test run.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHeader (
      vhunit_version : in string;
      test_name : in string
   ) is
      variable output_line : line;
      variable seperator : string(1 to 78);   
   begin
      seperator := "------------------------------------------------------------------------------";
      write(output_line, seperator );      
      writeline(output, output_line);

      write(output_line, string'("-- VHUNIT V "));
      write(output_line, vhunit_version );
      write(output_line, string'(", Test ")); 
      write(output_line, test_name );
      write(output_line, string'(" started "));
      writeline(output, output_line);

      write(output_line, seperator );      
      writeline(output, output_line);

   end procedure WriteHeader;   

   -----------------------------------------------------------------------------
   -- Procedure WriteTestCase
   --! \brief    WriteTestCase - Write the test case execution to the text 
   --!                           output.
   --! \details  The procedure write the test case execution message to the 
   --!           test unit text output.
   --!
   --! \param    test_case_name   the executed test case name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteTestCase(
      test_case_name : in string
   ) is
      variable output_line: line;
      variable ident: line;
   begin
      ident := GetSubUnitString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'("TC "));
      write(output_line, test_case_name);
      write(output_line, string'(" - start | "));
      write(output_line, NOW);      
      writeline(output, output_line);  
      deallocate(ident); -- update HOT 28.08.2008 
   end procedure WriteTestCase;

   -----------------------------------------------------------------------------
   -- Procedure WriteTestSuite
   --! \brief     WriteTestSuite - Write the test suite execution to the text
   --!                             output.
   --! \details  The procedure write the test suite execution message to the 
   --!           test unit text output.
   --!
   --! \param    test_suite_name   the executed test suite name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteTestSuite(
      test_suite_name : in string
   ) is
      variable output_line: line;
      variable ident: line;
   begin
      ident := GetSubUnitString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'("TS "));
      write(output_line, test_suite_name);
      write(output_line, string'(" - start "));
      -- write(output_line, NOW);      
      writeline(output, output_line);  
      
      deallocate(ident);
      m_ident := m_ident + 1;
   end procedure WriteTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure WriteFailureLine
   --! \brief    WriteFailureLine - Write the failure text line to the text 
   --!                              output.
   --! \details  The procedure write the failure text line to the test unit 
   --!           text output.
   --!
   --! \param    test_case         the name of the test case executed.
   --! \param    actual_output     the current value.
   --! \param    expected_output   the expected value.
   --! \param    signal_name       the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, string'("ERROR   in "));
      write(output_line, test_case );
      write(output_line, string'(" on "));
      write(output_line, signal_name);
      write(output_line, string'(" expected "));
      write(output_line, expected_output);
      write(output_line, string'(" found "));
      write(output_line, actual_output);
      writeline(output, output_line);
      deallocate(ident);
   end procedure WriteFailureLine;   

   procedure WriteFailureLine( 
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, string'("ERROR   in "));
      write(output_line, test_case );
      write(output_line, string'(" on "));
      write(output_line, signal_name);
      write(output_line, string'(" expected "));
      write(output_line, expected_output);
      write(output_line, string'(" found "));
      write(output_line, actual_output);
      writeline(output, output_line);  
      deallocate(ident);
   end procedure WriteFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteFailureLine
   --! \brief    WriteFailureLine - Write the failure text line to the text 
   --!                              output.
   --! \details  The procedure write the failure text line to the test unit 
   --!           text output.
   --!
   --! \param    test_case       the name of the test case executed.
   --! \param    actual_value    the current value.
   --! \param    expected_value  the expected value.
   --! \param    signal_name     the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteFailureLine( 
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, string'("ERROR   in ")); 
      write(output_line, test_case );
      write(output_line, string'(" on "));
      write(output_line, signal_name);
      write(output_line, string'(" expected "));
      write(output_line, expected_value);
      write(output_line, string'(" found "));
      write(output_line, actual_value);
      writeline(output, output_line);
      deallocate(ident);
   end procedure WriteFailureLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteCheckLine
   --! \brief   WriteCheckLine - Write the signal check line to the text output.
   --!                             
   --! \details  The procedure write the signal check line to the test unit text
   --!            output.
   --!
   --! \param    test_case    the name of the test case executed.
   --! \param    signal_name  the signal name where the check failure occur.
   --! \param    message      the check information message.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteCheckLine( 
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, string'("FAILURE in "));
      write(output_line, test_case );
      write(output_line, string'(" on "));
      write(output_line, signal_name);
      write(output_line, string'(" "));
      write(output_line, message);
      writeline(output, output_line);
      deallocate(ident);
   end procedure WriteCheckLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteLogLine
   --! \brief    WriteLogLine - Write the signal log line to the text output.
   --!                             
   --! \details  The procedure write the signal log line to the test unit 
   --!           text output.
   --!
   --! \param    test_case    the name of the test case executed.
   --! \param    signal_name  the signal name where the log event occur.
   --! \param    message      the log information message.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteLogLine( 
      test_case   : in string;
      signal_name : in string;
      message     : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, string'("LOG     in "));
      write(output_line, test_case );
      write(output_line, string'(" on "));
      write(output_line, signal_name);
      write(output_line, string'(" "));
      write(output_line, message);
      writeline(output, output_line);
      deallocate(ident);
   end procedure WriteLogLine;   

   -----------------------------------------------------------------------------
   -- Procedure WriteTextLine
   --! \brief    WriteTextLine - Write a message line to the text output.
   --! \details  The procedure writes general message line to the test unit 
   --!           text output with the defined severity.
   --! \param    test_case         the name of the test case executed.
   --! \param    message_severity  the message severity to write.
   --! \param    message           the message to write.
   -- Comments   :
   --
   -----------------------------------------------------------------------------
   procedure WriteTextLine( 
      test_case        : in string;
      message_severity : in string;
      message          : in string
   ) is
      variable output_line : line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, NOW);
      write(output_line, string'(" | "));            
      if ( message_severity = "ERROR" ) then
         write(output_line, string'("ERROR   in ")); 
      elsif ( message_severity = "FAILURE" ) then
         write(output_line, string'("FAILURE in "));
      else
         write(output_line, string'("LOG     in "));
      end if; 
      write(output_line, test_case );
      write(output_line, string'(" - "));
      write(output_line, message);
      writeline(output, output_line);
      deallocate(ident);
   end procedure WriteTextLine;   
   
   -----------------------------------------------------------------------------
   -- Procedure WriteCaseResult
   --! \brief   WriteCaseResult - Write the test case result to the text output.
   --!                             
   --! \details  The procedure print the test case result information to the 
   --!           text output.
   --!
   --! \param    error  the errors of the executed test case. 
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteCaseResult(
      error : in integer
   ) is
      variable output_line: line;
      variable ident: line;
   begin
      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'(" +- "));
      if ( error > 0 ) then
         write(output_line, string'("Errors "));
         write(output_line, error);
      else
         write(output_line, string'("OK!"));         
      end if; -- error
      writeline(output, output_line);   
      deallocate(ident);
   end procedure WriteCaseResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteCaseDetails
   --! \brief    WriteCaseDetails - Write the test case statistic details to the
   --!                              text output.
   --! \details  The procedure print the test case statistic details information
   --!           to the text output.
   --!
   --! \param    active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteCaseDetails(
      active_case : inout p_case 
   ) is
      variable output_line: line;
      variable ident: line;
      variable signal_node : p_signal; 
   begin
      AssertFailure( (active_case /= null) , "WriteCaseDetails", "active case is null!");

      if ( active_case.unit_name = null ) then
         return;
      end if; -- unit_name = null

      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'(" +- UUT : "));
      write(output_line, active_case.unit_name.all );
      if ( active_case.unit_outputs > 0 ) then
         write(output_line, string'(" | Output Signals : "));
         write(output_line, active_case.unit_outputs );
      end if; --  unit_outputs > 0    
      if ( active_case.monitored_outputs > 0 ) then  
         write(output_line, string'(" | Monitored Signals : "));
         write(output_line, active_case.monitored_outputs);
      end if; -- monitored_outputs > 0 
      writeline(output, output_line); 
      --
      if ( active_case.monitored_outputs > 0 ) then  
         -- signal statistic
         signal_node := active_case.monitored_signals;
         AssertFailure( (signal_node /= null) , "WriteCaseDetails", 
            "signal list is null!");
         for s in 1 to active_case.monitored_outputs loop
            write(output_line, string'("-- "));
            write(output_line, ident.all);
            write(output_line, string'("     +- "));
            write(output_line, signal_node.name.all);
            write(output_line, string'(" : Events = "));
            write(output_line, signal_node.events);
            write(output_line, string'(" | Errors = "));
            write(output_line, signal_node.errors);
            writeline(output, output_line);
            signal_node := signal_node.next_signal;
         end loop; -- active_case.monitored_outputs
      end if; -- monitored_outputs > 0 
      deallocate(ident);
   end procedure WriteCaseDetails;

   -----------------------------------------------------------------------------
   -- Procedure WriteCaseInfo
   --! \brief    WriteCaseInfo - Write the test case result info to the text 
   --!                           output.
   --! \details  The procedure print the test case result information to the 
   --!           text output.
   --!
   --! \param    active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteCaseInfo(
      active_case : inout p_case 
   ) is
      variable output_line : line;
      variable ident : line;
      variable first_result : p_case_result; 
      variable result_node : p_case_result; 
      variable first_info : p_case_info; 
      variable info_node : p_case_info; 
   begin
      AssertFailure( (active_case /= null) , "WriteCaseInfo", "active case is null!");

      if ( active_case.case_results = null ) then
         return;
      end if; -- case_results = null

      ident := GetIdentString;

      result_node := active_case.case_results;
      first_result := null;      
      
      while ( result_node /= first_result ) loop
         AssertFailure( (result_node.next_result /= null) , "WriteCaseInfo",
                        "result node has no next!" );      
            
         write(output_line, string'("-- "));
         write(output_line, ident.all);
         write(output_line, string'(" +- UUT : "));  
         write(output_line, result_node.unit_name.all );
         write(output_line, string'(" | "));
         write(output_line, result_node.result_comment.all );
         writeline(output, output_line);
            
         if ( result_node.result_info /= null ) then      
            info_node := result_node.result_info;
            first_info := null;                    
            
            while ( info_node /= first_info ) loop
               AssertFailure( (info_node.next_info /= null) , "WriteCaseInfo",
                               "info node has no next!" );      
               write(output_line, string'("-- "));
               write(output_line, ident.all);
               write(output_line, string'("     +- "));
               write(output_line, info_node.info.all );
               writeline(output, output_line);     
               
               info_node := info_node.next_info;
               first_info := result_node.result_info;
            end loop; -- info_node.next_info
         end if; -- result_node.result_info /= null
            
         result_node := result_node.next_result;
         first_result := active_case.case_results;
      end loop; -- result_node.next_result
      
      deallocate(ident);
   end procedure WriteCaseInfo;

   -----------------------------------------------------------------------------
   -- Procedure WriteSuiteResult
   --! \brief    WriteSuiteResult - Write the suite test result to the text 
   --!                              output.
   --! \details  The procedure write the suite result information to the text 
   --!           output.
   --!
   --! \param   suite_name  the name of the test suite executed.
   --! \param   suite  statistic values of the test suite executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteSuiteResult(
      suite_name : in string;
      suite : inout suite_statistic
   ) is
      variable output_line: line;
      variable ident: line;
   begin
      m_ident := m_ident - 1;

      ident := GetIdentString;
      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'("TS "));
      write(output_line, suite_name);
      write(output_line, string'(" - executed tests "));
      write(output_line, suite.tests);
      writeline(output, output_line);   

      write(output_line, string'("-- "));
      write(output_line, ident.all);
      write(output_line, string'(" +- passed "));
      write(output_line, suite.pass);
      if ( suite.fail > 0 ) then
         write(output_line, string'(" FAIL "));
         write(output_line, suite.fail);
      end if; -- fail
      writeline(output, output_line); 
      deallocate(ident);
   end procedure WriteSuiteResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteResult
   --! \brief    WriteResult - Write the result of the test run to the text 
   --!                         output.
   --! \details  The procedure write the result of the test run information to 
   --!           the text output.
   --!
   --! \param    run  statistic values of the test executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteResult(
      run : inout test_statistic
   ) is
      variable output_line: line;
      variable seperator : string(1 to 78);   
   begin
      seperator := "------------------------------------------------------------------------------";
      write(output_line, seperator );      
      writeline(output, output_line);

      write(output_line, string'("-- Result"));
      writeline(output, output_line);
      
      write(output_line, string'("-- executed tests "));
      write(output_line, run.tests);
      writeline(output, output_line);   

      write(output_line, string'("--   passed "));
      write(output_line, run.pass);
      if ( run.fail > 0 ) then
         write(output_line, string'(" FAIL "));
         write(output_line, run.fail);
      end if; -- fail
      writeline(output, output_line);   

      write(output_line, seperator );      
      writeline(output, output_line);
   
   end procedure WriteResult;  
   
end package body TextOutputter_pkg;

------------------------------------------------------------------------------
-- end TextOutputter_pkg.vhd
------------------------------------------------------------------------------
