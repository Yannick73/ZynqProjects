--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         HTMLOutputter_pkg.vhd
--!
--! \brief        Package with HTML file report functions for the
--!               VHUNIT project.
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.02.2012
--! \date         Updated: 06.03.2019
--! \version      V 1.06
--
-- Package      : HTMLOutputter_pkg (declaration, body)
-- File Version : $Revision: 36 $
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
-- Package HTMLOutputter_pkg
--! \brief        HTMLOutputter_pkg - HTML file report function package for
--!               VHUNIT project.
--! \details      Implements procedures to report test results and failures to
--!               a file in HTML format.
--! - Procedures
--! \li \ref  OpenHTML             - Open the report file for writing.
--! \li \ref  CloseHTML            - Close the report file.
--! \li \ref  WriteHTMLHeader      - Write the report header to the report file.
--! \li \ref  WriteHTMLFooter      - Write the report footer to the report file.
--! \li \ref  WriteHTMLTestCase    - Write the test case execution to the
--!                                  report file.
--! \li \ref  WriteHTMLTestSuite   - Write the test suite execution to the
--!                                  report file.
--! \li \ref  WriteHTMLFailureLine - Write a failure line to the report file.
--! \li \ref  WriteHTMLCheckLine   - Write the signal check failure line to the
--!                                  report file.
--! \li \ref  WriteHTMLLogLine     - Write the signal log line to the report file.
--! \li \ref  WriteHTMLLine        - Write a message line to the text report file. 
--! \li \ref  WriteHTMLCaseResult  - Write the test case result to the report
--!                                  file.
--! \li \ref  WriteHTMLCaseDetails - Write the test case statistic to the
--!                                  report file.
--! \li \ref  WriteHTMLCaseInfo    - Write the test case reult info to the
--!                                  report file.
--! \li \ref  WriteHTMLSuiteResult - Write the suite test result to the
--!                                  report file.
--! \li \ref  WriteHTMLResult      - Write the result of the test run to the
--!                                  report file.
--
-- Comments     :
--
-- Updates : V 1.03 - 09.01.2014 HOT add color information to cell directly.
--           V 1.04 - 12.10.2015 HOT Update Write... procedures for string
--                                   usage.
--                                   add WriteHTMLCheckLine & WriteHTMLLogLine
--                                   procedures.
--           V 1.05 - 08.11.2017 HOT Update the unit to compile with ModelSim.
--           V 1.06 - 19.04.2018 HOT add WriteHTMLLine function
--                    05.03.2019 HOT add WriteHTMLCaseInfo function
--                    06.03.2019 HOT Update time coloumn format
--
--------------------------------------------------------------------------------
package HTMLOutputter_pkg is

   ----------------------------------------------------------------------------
   -- Procedure OpenHTML
   --! \brief  Open the report file for writing.
   ----------------------------------------------------------------------------
   procedure OpenHTML(
      file_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure CloseHTML
   --! \brief  Close the report file.
   ----------------------------------------------------------------------------
   procedure CloseHTML;

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLHeader
   --! \brief  Write the report header to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLHeader (
      vhunit_version : in string;
      test_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLFooter
   --! \brief  Write the report footer to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLFooter (
      vhunit_version : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLTestCase
   --! \brief  Write the test case execution to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLTestCase(
      test_case_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLTestSuite
   --! \brief  Write the test suite execution to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLTestSuite(
      test_suite_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case      : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name    : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief  Write a failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLCheckLine
   --! \brief  Write the signal check failure line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLCheckLine(
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLLogLine
   --! \brief  Write the signal log line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLLogLine(
      test_case   : in string;
      signal_name : in string;
      message     : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLLine
   --! \brief  Write a message line to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLLine(
      test_case        : in string;
      message_severity : in string;
      message          : in string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseResult
   --! \brief  Write the test case result to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLCaseResult(
      error : in integer
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseDetails
   --! \brief  Write the test case statistic to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLCaseDetails(
      active_case : inout p_case
   );
   
   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseInfo
   --! \brief  Write the test case result info to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLCaseInfo(
      active_case : inout p_case 
   );   
   
   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLSuiteResult
   --! \brief  Write the suite test result to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLSuiteResult (
      suite_name : in string;
      suite : inout suite_statistic
   );

   ----------------------------------------------------------------------------
   -- Procedure WriteHTMLResult
   --! \brief  Write the result of the test run to the report file.
   ----------------------------------------------------------------------------
   procedure WriteHTMLResult(
      run : inout test_statistic
   );

end package HTMLOutputter_pkg;

--------------------------------------------------------------------------------
-- Body HTMLOutputter_pkg
--! \brief  HTML Outputter package implementation.
--------------------------------------------------------------------------------
package body HTMLOutputter_pkg is
   -----------------------------------------------------------------------------
   -- Internal constants and variables
   -----------------------------------------------------------------------------
   --! The identification level variable.
   shared variable m_ident : integer := 0;
   --! The HTML report file handle.
   file html_file : text;


   --! \todo Function GetIdentString check if need, no call found
   impure function GetIdentString return line is
      variable ident : line := new string'("");
   begin
      fill : for i in 1 to m_ident loop
         write( ident, string'("   ") );
      end loop fill;
      return ident;
   end function GetIdentString;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLBegin
   --! \brief     WriteHTMLBegin - Writes the header for the html file.
   --! \details   The procedure writes the header for the opened html file.
   --!             
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLBegin is
      variable report_line : line;
   begin
      write(report_line, string'("<html><head>") );
      writeline(html_file, report_line);
      write(report_line, string'("<title>VHUNIT test report</title>") );
      writeline(html_file, report_line);
      write(report_line, string'("</head>") );
      writeline(html_file, report_line);
      write(report_line,string'("<style>"));
      write(report_line,string'("body { font-size: 10; font-family: verdena,arial,helvetica,sans-serif; color:#000000;}"));
      write(report_line,string'(".Error {background-color: #FF7A7A}"));
      write(report_line,string'(".Failure {background-color: #FFA0A0}"));
      write(report_line,string'(".Success {background-color: #97FF73}"));
      write(report_line,string'(".tr1 {background-color: #C0C0C0}"));  -- gray
      write(report_line,string'(".tr2 {background-color: #E0E0E0}"));  -- light gray
      write(report_line,string'(".tr3 {background-color: #AED5FF}"));  -- bright blue
      write(report_line,string'(".tr4 {background-color: #FFD46C}"));  -- light orange
      write(report_line,string'(".tr5 {background-color: #FFB400}"));  -- orange
      write(report_line,string'("</style>"));
      writeline(html_file, report_line);
      write(report_line,string'("<body bgcolor='#ffffff' text='#000000' link='#ff00ff' vlink='#cc00cc' alink='#aa00aa'>") );
      writeline(html_file, report_line);

   end procedure WriteHTMLBegin;


   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLEnd
   --! \brief      WriteHTMLEnd - Writes the body and html closure tags.
   --! \details    The procedure writes the body and html closure tags in the 
   --!             opened HTML file.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLEnd is
      variable report_line : line;
   begin
      write(report_line, string'("</body></html>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLEnd;

   -----------------------------------------------------------------------------
   -- Procedure OpenHTML
   --! \brief      OpenHTML - Open the report file for writing.
   --! \details    The procedure opens the HTML report file with the specified 
   --!             name. If the file can not be opened an assertion is executed.
   --! \param      file_name  the HTML report file name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure OpenHTML(
      file_name : in string
   ) is
      variable file_ok : file_open_status;
   begin
      file_open(file_ok, html_file, file_name, WRITE_MODE);
      AssertFailure((file_ok = OPEN_OK), "OpenHTML",
         "report file " & file_name & " can not be opened!");
      WriteHTMLBegin;
   end procedure OpenHTML;

   -----------------------------------------------------------------------------
   -- Procedure CloseHTML
   --! \brief      CloseHTML - Close the report file.
   --! \details    The procedure closes the test unit report file.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure CloseHTML is
   begin
      WriteHTMLEnd;
      file_close( html_file );
   end procedure CloseHTML;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLHeader
   --! \brief      WriteHTMLHeader - Write the report header to the report file.
   --! \details    The procedure writes the header information to the test unit
   --!             report file.
   --! \param      vhunit_version  the version of the VHUNIT package.
   --! \param      test_name  the name of the test run.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLHeader (
      vhunit_version : in string;
      test_name : in string
   ) is
      variable report_line : line;
      variable seperator : string(1 to 78);
   begin
      write(report_line, string'("<table width='100%'><tr>"));
      write(report_line, string'("<td align='left'><h3>VHUNIT test run report</h3></td>"));
      write(report_line, string'("<td align='right'><h2>Executed test run "));
      write(report_line, test_name);
      write(report_line, string'("</h2></td> "));
      write(report_line, string'("</tr></table><hr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLHeader;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLFooter
   --! \brief    WriteHTMLFooter - Write the report footer to the HTML report
   --!                             file.
   --! \details  The procedure writes the page footer information to the
   --!           HTML report file.
   --!
   --! \param    vhunit_version  the version of the VHUNIT package.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLFooter (
      vhunit_version : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<hr><table width='100%'><tr>"));
      write(report_line, string'("<td align='left'></td>"));
      write(report_line, string'("<td align='right'>Automatic generated by VHUNIT version "));
      write(report_line, vhunit_version );
      write(report_line, string'("</td></tr></table>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLFooter;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLTestCase
   --! \brief    WriteHTMLTestCase - Write the test case execution to the
   --!                               report file.
   --! \details  The procedure writes the test case execution message to the
   --!           test unit report file.
   --!
   --! \param   test_case_name  the executed test case name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLTestCase(
      test_case_name : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<table width='100%' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr3' bgcolor='#AED5FF'>"));
      write(report_line, string'("<td><strong>TC "));
      write(report_line, test_case_name);
      write(report_line, string'("</strong></td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

      write(report_line, string'("<table width='100%' cellspacing='2' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr3' bgcolor='#AED5FF'>"));
      write(report_line, string'("<th width='202'>Item</th><th width='95'>Status<th>Info</th><th nowrap width='100'>Time</th>"));
      write(report_line, string'("</tr>"));
      writeline(html_file, report_line);

   end procedure WriteHTMLTestCase;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLTestSuite
   --! \brief    WriteHTMLTestSuite - Write the test suite execution to the
   --!                                report file.
   --! \details  The procedure writes the test suite execution message to the
   --!           test unit report file.
   --! \param    test_suite_name  the executed test suite name.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLTestSuite(
      test_suite_name : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<br><table width='100%' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr4' bgcolor='#FFD46C'>"));
      write(report_line, string'("<td><strong>TS "));
      write(report_line, test_suite_name);
      write(report_line, string'("</strong></td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

   end procedure WriteHTMLTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief    WriteHTMLFailureLine - Write a failure text line to the report
   --!                                  file.
   --! \details  The procedure writes the failure text line to the test unit
   --!           report file.
   --! \param   test_case        the name of the test case executed.
   --! \param   actual_output    the current value.
   --! \param   expected_output  the expected value.
   --! \param   signal_name      the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case        : in string;
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<tr class='Error' bgcolor='#FF7A7A'>"));
      write(report_line, string'("<td>Signal</td>"));
      write(report_line, string'("<td><strong>ERROR</strong></td>"));
      write(report_line, string'("<td>"));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, string'(" expected: "));
      write(report_line, expected_output);
      write(report_line, string'(", current: "));
      write(report_line, actual_output);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLFailureLine;



   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief    WriteHTMLFailureLine - Write a failure text line to the report
   --!                                  file.
   --! \details  The procedure writes the failure text line to the test unit
   --!           report file.
   --!
   --! \param   test_case        the name of the test case executed.
   --! \param   actual_output    the current value.
   --! \param   expected_output  the expected value.
   --! \param   signal_name      the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case        : in string;
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      write(report_line, string'("<tr class='Error' bgcolor='#FF7A7A'>"));
      write(report_line, string'("<td>Signal</td>"));
      write(report_line, string'("<td><strong>ERROR</strong></td>"));
      write(report_line, string'("<td>"));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, string'(" expected: "));
      write(report_line, expected_output);
      write(report_line, string'(", current: "));
      write(report_line, actual_output);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLFailureLine;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLFailureLine
   --! \brief    WriteHTMLFailureLine - Write a failure text line to the report
   --!                                  file.
   --! \details  The procedure writes the failure text line to the test unit
   --!           report file.
   --! \param  test_case       the name of the test case executed.
   --! \param  actual_value    the current value.
   --! \param  expected_value  the expected value.
   --! \param  signal_name     the signal name where the failure occur.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLFailureLine(
      test_case        : in string;
      actual_value   : in string;
      expected_value : in string;
      signal_name      : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<tr class='Error' bgcolor='#FF7A7A'>"));
      write(report_line, string'("<td>Signal</td>"));
      write(report_line, string'("<td><strong>ERROR</strong></td>"));
      write(report_line, string'("<td>"));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, string'(" expected: "));
      write(report_line, expected_value);
      write(report_line, string'(", current: "));
      write(report_line, actual_value);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLFailureLine;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLCheckLine
   --! \brief    WriteHTMLCheckLine - Write the signal check failure line to the
   --!                                report file.
   --! \details  The procedure writes the signal check failure line to the test
   --!           unit report file.
   --! \param  test_case    the name of the test case executed.
   --! \param  signal_name  the signal name where the check failure occur.
   --! \param  message      the check information message.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLCheckLine(
      test_case    : in string;
      signal_name  : in string;
      message      : in string
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<tr class='Failure' bgcolor='#FFA0A0'>"));
      write(report_line, string'("<td>Signal</td>"));
      write(report_line, string'("<td>FAILURE</td>"));
      write(report_line, string'("<td>"));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, message);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLCheckLine;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLLogLine
   --! \brief    WriteHTMLLogLine - Write the signal log line to the report file.
   --! \details  The procedure writes the signal log line to the test unit
   --!           report file.
   --! \param  test_case    the name of the test case executed.
   --! \param  signal_name  the signal name where the log occur.
   --! \param  message      the log information message.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLLogLine(
      test_case   : in string;
      signal_name : in string;
      message     : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
      write(report_line, string'("<td>Signal</td>"));
      write(report_line, string'("<td>LOG</td>"));
      write(report_line, string'("<td>"));
      write(report_line, signal_name);
      write(report_line, string'(" "));
      write(report_line, message);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLLogLine;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLLine
   --! \brief    WriteHTMLLine - Write a message line to the report file.
   --! \details  The procedure writes a message line to the test unit
   --!           report file with the defined severity.
   --! \param    test_case         the name of the test case executed.
   --! \param    message_severity  the message severity to write.
   --! \param    message           the message to write.
   -- Comments     :
   --                                                          
   -----------------------------------------------------------------------------
   procedure WriteHTMLLine(
      test_case        : in string;
      message_severity : in string;
      message          : in string
   ) is
      variable report_line : line;
      variable ident: line;
   begin
      if ( message_severity = "ERROR" ) then
         write(report_line, string'("<tr class='Error' bgcolor='#FF7A7A'>"));
         write(report_line, string'("<td> </td>"));
         write(report_line, string'("<td><strong>ERROR</strong></td>"));
      elsif ( message_severity = "FAILURE" ) then
         write(report_line, string'("<tr class='Failure' bgcolor='#FFA0A0'>"));
         write(report_line, string'("<td> </td>"));
         write(report_line, string'("<td>FAILURE</td>"));
      else
         write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
         write(report_line, string'("<td> </td>"));
         write(report_line, string'("<td>LOG</td>"));
      end if; 
      write(report_line, string'("<td>"));
      write(report_line, message);
      write(report_line, string'("</td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLLine;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseResult
   --! \brief  WriteHTMLCaseResult - Write the test case result to the report
   --!                               file.
   --! \details  The procedure prints the test case result information to the
   --!           report file.
   --! \param   error  the errors of the executed test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLCaseResult(
      error : in integer
   ) is
      variable report_line : line;
   begin
      if ( error > 0 ) then
         write(report_line, string'("<tr class='Error' bgcolor='#FF7A7A'>"));
         write(report_line, string'("<td>Test</td>"));
         write(report_line, string'("<td><strong>FAILED</strong></td>"));
         write(report_line, string'("<td>Errors found<strong>  "));
         write(report_line, error);
         write(report_line, string'("</strong></td>"));
      else
         write(report_line, string'("<tr class='Success' bgcolor='#97FF73'>"));
         write(report_line, string'("<td>Test</td>"));
         write(report_line, string'("<td><strong>OK</strong></td>"));
         write(report_line, string'("<td></td>"));
      end if; -- error
      write(report_line, string'("<td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

   end procedure WriteHTMLCaseResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseDetails
   --! \brief  WriteHTMLCaseDetails - Write the test case statistic details to
   --!                                the report file.
   --! \details  The procedure prints the test case statistic detailt information
   --!           to the report file.
   --! \param   active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLCaseDetails(
      active_case : inout p_case
   ) is
      variable report_line: line;
      variable ident: line;
      variable signal_node : p_signal;
   begin
      AssertFailure( (active_case /= null) , "WriteHTMLCaseDetails",
                     "active case is null!");

      if ( active_case.unit_name = null ) then
         return;
      end if; -- unit_name = null

      write(report_line, string'("<table width='100%' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr class='tr3' bgcolor='#AED5FF'>"));
      write(report_line, string'("<td width='202'><B>Unit Under Test</B></td>"));
      write(report_line, string'("<td width='95'>Output Ports</td>"));
      write(report_line, string'("<td width='95'>Monitored</td>"));
      write(report_line, string'("<td></td><td width='100'></td></tr>"));
      writeline(html_file, report_line);
      --
      write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
      write(report_line, string'("<td>"));
      write(report_line, active_case.unit_name.all);
      write(report_line, string'("</td>"));
      if ( active_case.unit_outputs > 0 ) then
         write(report_line, string'("<td>"));
         write(report_line, active_case.unit_outputs);
         write(report_line, string'("</td>"));
      else
         write(report_line, string'("<td></td>"));
      end if; --  unit_outputs > 0
      if ( active_case.monitored_outputs > 0 ) then
         write(report_line, string'("<td>"));
         write(report_line, active_case.monitored_outputs);
         write(report_line, string'("</td>"));
      else
         write(report_line, string'("<td></td>"));
      end if; -- monitored_outputs > 0
      write(report_line, string'("<td></td><td width='100'></td></tr>"));
      writeline(html_file, report_line);

      -- signal statistic
      if ( active_case.monitored_outputs > 0 ) then
         signal_node := active_case.monitored_signals;
         AssertFailure( (signal_node /= null) , "WriteHTMLCaseDetails",
            "signal list is null!");
         --
         write(report_line, string'("<tr class='tr3' bgcolor='#AED5FF'>"));
         write(report_line, string'("<td width='202'></td><td width='95'>Events</td>"));
         write(report_line, string'("<td width='95'>Errors</td><td></td><td width='100'></td></tr>"));
         writeline(html_file, report_line);
         --
         for s in 1 to active_case.monitored_outputs loop
            write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
            write(report_line, string'("<td>"));
            write(report_line, signal_node.name.all);
            write(report_line, string'("</td>"));
            write(report_line, string'("<td>"));
            write(report_line, signal_node.events);
            write(report_line, string'("</td>"));
            write(report_line, string'("<td>"));
            write(report_line, signal_node.errors);
            write(report_line, string'("</td>"));
            write(report_line, string'("<td></td><td width='100'></td></tr>"));
            writeline(html_file, report_line);
            signal_node := signal_node.next_signal;
         end loop; -- active_case.monitored_outputs
      end if; -- monitored_outputs > 0

      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

   end procedure WriteHTMLCaseDetails;
   
   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLCaseInfo
   --! \brief  WriteHTMLCaseInfo - Write the test case reult info to the 
   --!                             report file.
   --! \details  The procedure prints the test case result information
   --!           to the report file.
   --! \param   active_case  the pointer to the active case information.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLCaseInfo(
      active_case : inout p_case
   ) is
      variable report_line: line;
      variable first_result : p_case_result; 
      variable result_node : p_case_result; 
      variable first_info : p_case_info; 
      variable info_node : p_case_info; 
   begin
      AssertFailure( (active_case /= null) , "WriteHTMLCaseInfo", "active case is null!");

      if ( active_case.case_results = null ) then
         return;
      end if; -- case_results = null

      result_node := active_case.case_results;
      first_result := null;      
      
      while ( result_node /= first_result ) loop
         AssertFailure( (result_node.next_result /= null) , "WriteCaseInfo",
                        "result node has no next!" );      
                        
         write(report_line, string'("<table width='100%' cellpadding='5' border='0'>"));
         write(report_line, string'("<tr class='tr3' bgcolor='#AED5FF'>"));
         write(report_line, string'("<td width='202'><B>Unit Under Test</B></td>"));
         --write(report_line, string'("<td width='95'></td>"));
         --write(report_line, string'("<td width='95'></td>"));
         write(report_line, string'("<td></td><td width='100'></td></tr>"));
         writeline(html_file, report_line);

         write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
         write(report_line, string'("<td width='202'>"));
         write(report_line, result_node.unit_name.all);
         write(report_line, string'("</td>"));
         --write(report_line, string'("<td width='95'></td>"));
         --write(report_line, string'("<td width='95'></td>"));
         write(report_line, string'("<td>"));
         write(report_line, result_node.result_comment.all);
         write(report_line, string'("</td>"));
         write(report_line, string'("<td width='100'></td></tr>"));
         writeline(html_file, report_line);
      
         if ( result_node.result_info /= null ) then      
            info_node := result_node.result_info;
            first_info := null;                    
            
            while ( info_node /= first_info ) loop
               AssertFailure( (info_node.next_info /= null) , "WriteCaseInfo",
                               "info node has no next!" );      
               write(report_line, string'("<tr class='tr2' bgcolor='#E0E0E0'>"));
               write(report_line, string'("<td width='202'></td>"));
               --write(report_line, string'("<td></td>"));
               --write(report_line, string'("<td></td>"));
               write(report_line, string'("<td>"));
               write(report_line, info_node.info.all);
               write(report_line, string'("</td>"));
               write(report_line, string'("<td width='100'></td></tr>"));
               writeline(html_file, report_line);
               
               info_node := info_node.next_info;
               first_info := result_node.result_info;
            end loop; -- info_node.next_info
         end if; -- result_node.result_info /= null
         
         write(report_line, string'("</table>"));
         writeline(html_file, report_line);
         
         result_node := result_node.next_result;
         first_result := active_case.case_results;
      end loop; -- result_node.next_result
      
   end procedure WriteHTMLCaseInfo;
   
   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLSuiteResult
   --! \brief    WriteHTMLSuiteResult - Write the suite test result to the
   --!                                  report file.
   --! \details  The procedure writes the suite result information to the report
   --!           file.
   --! \param   suite_name  the name of the test suite executed.
   --! \param   suite       statistic values of the test suite executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLSuiteResult (
      suite_name : in string;
      suite : inout suite_statistic
   ) is
      variable report_line : line;
   begin
      write(report_line, string'("<table width='100%' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr4' bgcolor='#FFD46C'>"));
      write(report_line, string'("<td><strong>TS "));
      write(report_line, suite_name);
      write(report_line, string'("</strong></td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

      write(report_line, string'("<table width='100%' cellspacing='2' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr4' bgcolor='#FFD46C'>"));
      write(report_line, string'("<td width='95'><strong>Tests</strong></td><td width='95'><strong>Passed</strong>"));
      write(report_line, string'("</td><td width='95'><strong>Failed</strong></td><td width='95'><strong>Success rate</strong></td>"));
      write(report_line, string'("<td></td><td width='100' align='center'><strong>Time</strong></td>"));
      write(report_line, string'("</tr>"));
      writeline(html_file, report_line);

      write(report_line, string'("<tr valign='top' class='tr2' bgcolor='#E0E0E0'>"));
      write(report_line, string'("<td>"));
      write(report_line, suite.tests);
      write(report_line, string'("</td><td>"));
      write(report_line, suite.pass);
      write(report_line, string'("</td><td>"));
      write(report_line, suite.fail);
      write(report_line, string'("</td><td>"));

      if (suite.tests)>0 then
         write(report_line,(suite.pass*100)/(suite.tests));
      end if;

      write(report_line, string'(" %</td><td></td><td style=""text-align: right;"">"));
      write(report_line, NOW);
      write(report_line, string'("</td></tr>"));
      write(report_line, string'("</table><br>"));
      writeline(html_file, report_line);

   end procedure WriteHTMLSuiteResult;

   -----------------------------------------------------------------------------
   -- Procedure WriteHTMLResult
   --! \brief    WriteHTMLResult - Write the result of the test run to the
   --!                             report file.
   --! \details  The procedure writes the result of the test run 
   --!           information to the report file.
   --! \param   run  statistic values of the test case executed.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure WriteHTMLResult(
      run : inout test_statistic
   ) is
      variable report_line: line;
   begin

      write(report_line, string'("<hr><br><table width='100%' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr5' bgcolor='#FFB400'>"));
      write(report_line, string'("<td><strong>Summary</strong></td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);

      write(report_line, string'("<table width='100%' cellspacing='2' cellpadding='5' border='0'>"));
      write(report_line, string'("<tr valign='top' class='tr5' bgcolor='#FFB400'>"));
      write(report_line, string'("<td width='95'><strong>Tests</strong></td><td width='95'><strong>Passed</strong></td>"));
      write(report_line, string'("<td width='95'><strong>Failed</strong></td><td width='95'><strong>Success rate</strong></td>"));
      write(report_line, string'("<td></td><td width='100' align='center'><strong>Run Time</strong></td>"));
      write(report_line, string'("</tr>"));
      writeline(html_file, report_line);

      write(report_line, string'("<tr valign='top' class='tr2' bgcolor='#E0E0E0'>"));
      write(report_line, string'("<td>"));
      write(report_line,run.tests);
      write(report_line, string'("</td><td>"));
      write(report_line,run.pass);
      write(report_line, string'("</td><td>"));
      write(report_line,run.fail);
      write(report_line, string'("</td><td>"));

      if (run.tests)>0 then
         write(report_line,(run.pass*100)/(run.tests));
      end if;

      write(report_line, string'(" %</td><td></td><td style=""text-align: right;"">"));
      write(report_line,NOW);
      write(report_line, string'("</td></tr>"));
      write(report_line, string'("</table>"));
      writeline(html_file, report_line);
   end procedure WriteHTMLResult;

end package body HTMLOutputter_pkg;

------------------------------------------------------------------------------
-- end HTMLOutputter_pkg.vhd
------------------------------------------------------------------------------
