--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TestExecution_pkg.vhd
--!
--! \brief        Test execution package for VHUNIT project.
--!
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \author       Tonfat Jorge     (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 08.05.2006
--! \date         Updated: 21.12.2018
--! \version      V 1.06
--
-- Package      : TestExecution_pkg (declaration, body).
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
-- Revision 1.3  2007/11/12 17:24:42  ottacher
-- Update for easy vector usage.
--
-- Revision 1.2  2006/07/24 11:25:51  ottacher
-- Vector definitions added
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
--! IEEE standard numeric package
use ieee.std_logic_unsigned.all;

--! standard library
library std;
--! Std standard textio package
use std.textio.all;

--! VHUNIT test library
library VHUNIT;
--! VHUNIT test statistic package
use VHUNIT.TestStatistic_pkg.all;

--------------------------------------------------------------------------------
-- Package TestExecution_pkg
--! \brief      TestExecution_pkg - A test execution package for VHUNIT project.
--! \details    Implements types, functions and procedures for execution of
--!             the different tests.
--!
--! - Types
--! \li \ref execution        - Record for execution status values.
--! \li \ref execution_vector - Vector of test executions.
--! \li \ref result           - Record for test result status values.
--! \li \ref result_vector    - Vector of test results.
--! - Functions
--! \li \ref GetExecutedTestSuite - Return the name of the executed test suite.
--! \li \ref GetExecutedTestCase  - Return the name and comment of the executed
--!                                 test case.
--! \li \ref GetExecutedTestCaseName - Return the name of the executed test case
--!                                    only.
--! - Procedures
--! \li \ref InitTest            - Initialize the test run.
--! \li \ref UseReportOutput     - Set the report output active and define
--!                                the report file name.
--! \li \ref UseHTMLOutput       - Set the HTML output active and define
--!                                 the HTML report file name.
--! \li \ref UseTextOutput       - Set the text output active.
--! \li \ref UseTestStatistic    - Set the test statistic output active.
--! \li \ref WaitForStart        - Waits for the start of the test case
--!                                execution.
--! \li \ref StopAtEnd           - Stops the test case execution at the end
--!                                of the running time.
--! \li \ref StopProcess         - Stops the test case execution.
--! \li \ref StopTestSuite       - Stop the test suite execution.
--! \li \ref MonitorWaitForStart - Waits for the start of test case
--!                                execution for the monitor process.
--! \li \ref MonitorStopAtEnd    - Stops the test case execution at the end
--!                                of the running time for the monitor
--!                                process.
--! \li \ref RunUntilTime        - Execute the test case until the runtime
--!                                is reached.
---- \li \ref RunUntilCond        - Execute the test case until a condition
----                                or a timeout is reached.
--! \li \ref ExecuteUntilCond    - Execute the test case until a condition
--!                                or a timeout is reached.
--! \li \ref InitControl         - Initialize the control record.
--! \li \ref StartTestSuite      - Start the test suite.
--! \li \ref EvaluateTestSuite   - Evaluate the test suite.
--! \li \ref StartTest           - Start the test case.
--! \li \ref EvaluateTest        - Evaluate the test case.
--! \li \ref ShowResult          - Show the test result.
-- Comments :
--
-- Updates : V 1.00 - 13.06.2006 by HOT add suite name to end of suite result
--                    22.06.2006 by HOT add test init
--                    24.07.2006 by HOT add vector type definitions
--                    03.10.2006 by HOT add vector type InitControl
--           V 1.01 - 15.08.2010 by HOT add signal statistic
--           V 1.02 - 06.02.2012 by HOT add HTML file format output
--           V 1.03 - 17.07.2012 by HOT add StopTestSuite function
--           V 1.04 - 12.10.2015 by HOT update functions for log level and
--                                      failure counter
--                    07.09.2016 by HOT update StartTest and test case name
--                                      functions, add GetExecutedTestCaseName
--           V 1.05 - 12.10.2016 by JTO add RunUntilCond function
--                                      add new meaning to param time_to_run in
--                                      StartTest(), can be a timeout
--                                      when RunUntilCond() used.
--                    21.11.2016 by HOT change RunUntilCond to ExecuteUntilCond
--                                      add StopProcess function
--           V 1.06 - 19.04.2018 by HOT update UseXXXOutput functions with log level  
--                    21.12.2018 by HOT update UseHTMLOutput with log_level LOG_FAILURE              
--------------------------------------------------------------------------------
package TestExecution_pkg is

   ----------------------------------------------------------------------------
   -- Type execution
   --! \brief        Record for test execution status values.
   --! \details      Contains the test execution status information.
   -- Comments       :
   ----------------------------------------------------------------------------
   type execution is record
      start   : boolean;   --! Flag to indicate the start of a test case.
      runtime : time;      --! Simulation time of the test case stop.
   end record execution;

   ----------------------------------------------------------------------------
   -- Type execution_vector
   --! \brief        Vector of test executions.
   --! \details      Vector definition of the execution record type.
   -- Comments       :
   ----------------------------------------------------------------------------
   type execution_vector is array (natural range <>) of execution;

   ----------------------------------------------------------------------------
   -- Type result
   --! \brief        Record for test result status values.
   --! \details      Contains the test execution result information.
   -- Comments       :
   ----------------------------------------------------------------------------
   type result is record
      stop  : boolean;  --! Flag to indicate the stop of a test case.
      error : integer;  --! Number of errors occurred while test case execution.
   end record result;

   ----------------------------------------------------------------------------
   -- Type result_vector
   --! \brief        Vector of test results.
   --! \details      Vector definition of the result record type.
   -- Comments       :
   ----------------------------------------------------------------------------
   type result_vector is array (natural range <>) of result;

   ----------------------------------------------------------------------------
   -- Function GetExecutedTestSuite
   --! \brief  Return the name of the executed test suite.
   ----------------------------------------------------------------------------
   impure function GetExecutedTestSuite
   return string;

   ----------------------------------------------------------------------------
   -- Function GetExecutedTestCase
   --! \brief  Return the name and comment of the executed test case.
   ----------------------------------------------------------------------------
   impure function GetExecutedTestCase
   return string;

   ----------------------------------------------------------------------------
   -- Function GetExecutedTestCaseName
   --! \brief  Return the name of the executed test case only.
   ----------------------------------------------------------------------------
   impure function GetExecutedTestCaseName
   return string;

   ----------------------------------------------------------------------------
   -- Procedure InitTest
   --! \brief  Initialize the test run.
   ----------------------------------------------------------------------------
   procedure InitTest(
      test_name : in string
   );

   ----------------------------------------------------------------------------
   -- Procedure UseReportOutput
   ----------------------------------------------------------------------------
--   procedure UseReportOutput(
--      report_name : in string
--   );

   ----------------------------------------------------------------------------
   -- Procedure UseReportOutput
   --! \brief  Set the report output active and define the report file name.
   ----------------------------------------------------------------------------
   procedure UseReportOutput(
      report_name : in string;
      level       : in log_level := ALL_INFO
   );
   
   ----------------------------------------------------------------------------
   -- Procedure UseHTMLOutput
   ----------------------------------------------------------------------------
--   procedure UseHTMLOutput(
--      file_name : in string
--   );

   ----------------------------------------------------------------------------
   -- Procedure UseHTMLOutput
   --! \brief  Set the HTML output active and define the HTML report file name.
   ----------------------------------------------------------------------------
   procedure UseHTMLOutput(
      file_name : in string;
      level     : in log_level := LOG_FAILURE
   );
   
   ----------------------------------------------------------------------------
   -- Procedure UseTextOutput
   ----------------------------------------------------------------------------
--   procedure UseTextOutput;

   ----------------------------------------------------------------------------
   -- Procedure UseTextOutput
   --! \brief  Set the text output active.
   ----------------------------------------------------------------------------
   procedure UseTextOutput(
      level : in log_level := ALL_INFO
   );
   
   ----------------------------------------------------------------------------
   -- Procedure UseTestStatistic
   --! \brief  Set the test statistic output active.
   ----------------------------------------------------------------------------
   procedure UseTestStatistic;

   ----------------------------------------------------------------------------
   -- Procedure WaitForStart
   --! \brief  Waits for the start of the test case execution.
   ----------------------------------------------------------------------------
   procedure WaitForStart(
      signal control : in execution
   );

   ----------------------------------------------------------------------------
   -- Procedure StopAtEnd
   --! \brief  Stops the test case execution at the end of the running time.
   ----------------------------------------------------------------------------
   procedure StopAtEnd(
      signal control : in result
   );

      ----------------------------------------------------------------------------
   -- Procedure StopProcess
   --! \brief  Stops the test case execution.
   ----------------------------------------------------------------------------
   procedure StopProcess(
      signal control : in result
   );

   ----------------------------------------------------------------------------
   -- Procedure StopTestSuite
   --! \brief  Stop the test suite execution.
   ----------------------------------------------------------------------------
   procedure StopTestSuite(
      signal control : out result
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorWaitForStart
   --! \brief  Waits for the start of test case execution for the monitor
   --!         process.
   ----------------------------------------------------------------------------
   procedure MonitorWaitForStart(
             unit_name    : in string;
             unit_outputs : in integer;
      signal control      : in execution
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorStopAtEnd
   --! \brief  Stops the test case execution at the end of the running time
   --!         for the monitor process. Updates the test case result.
   ----------------------------------------------------------------------------
   procedure MonitorStopAtEnd(
      signal control_in  : in result;
             error       : in integer;
      signal control_out : out result
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorStopAtEnd
   --! \brief  Stops the test case execution at the end of the running time
   --!         for the monitor process. Updates the test case result.
   --!         It has an additional failure parameter.
   ----------------------------------------------------------------------------
   procedure MonitorStopAtEnd(
      signal   control_in  : in result;
      constant error       : in integer;
      constant failure     : in integer;
      signal   control_out : out result
   );

   ----------------------------------------------------------------------------
   -- Procedure RunUntilTime
   --! \brief  Execute the test case until the runtime is reached.
   ----------------------------------------------------------------------------
   procedure RunUntilTime(
      signal control_in  : in execution;
      signal control_out : out result
   );
   ----------------------------------------------------------------------------
   -- Procedure RunUntilCond
   -- \brief  Execute the test case until a condition or a timeout is reached.
   ----------------------------------------------------------------------------
   -- procedure RunUntilCond(
      -- signal control_in  : in execution;
      -- signal control_out : out result;
      -- signal condition_in: in boolean
   -- );

   ----------------------------------------------------------------------------
   -- Procedure ExecuteUntilCond
   --! \brief  Execute the test case until a condition or a timeout is reached.
   ----------------------------------------------------------------------------
   procedure ExecuteUntilCond(
      signal control_in  : in execution;
      signal condition_in: in boolean;
      constant error     : in integer;
      signal control_tc  : out result;
      signal control_out : out result
   );

   ----------------------------------------------------------------------------
   -- Procedure ExecuteUntilCond
   --! \brief  Execute the test case until a condition or a timeout is reached
   --!         and stops after delay.
   ----------------------------------------------------------------------------
   procedure ExecuteUntilCond(
      signal control_in  : in execution;
      signal condition_in: in boolean;
      constant error     : in integer;
      constant delay     : in time;
      signal control_tc  : out result;
      signal control_out : out result
   );

   ----------------------------------------------------------------------------
   -- Procedure InitControl
   --! \brief  Initialize the control record.
   ----------------------------------------------------------------------------
   procedure InitControl(
      signal control : inout execution
   );

   ----------------------------------------------------------------------------
   -- Procedure InitControl
   --! \brief  Initialize the control vector record.
   ----------------------------------------------------------------------------
   procedure InitControl(
      signal control_vec : inout execution_vector
   );

   ----------------------------------------------------------------------------
   -- Procedure StartTestSuite
   --! \brief  Start the test suite.
   ----------------------------------------------------------------------------
   procedure StartTestSuite(
             test_suite  : in string;
      signal control     : inout execution
   );

   ----------------------------------------------------------------------------
   -- Procedure EvaluateTestSuite
   --! \brief  Evaluate the test suite.
   ----------------------------------------------------------------------------
   procedure EvaluateTestSuite(
      signal control     : in result
   );

   ----------------------------------------------------------------------------
   -- Procedure StartTest
   --! \brief  Start the test case.
   ----------------------------------------------------------------------------
   procedure StartTest(
             test_name   : in string;
             time_to_run : in time;
      signal control     : inout execution
   );

   ----------------------------------------------------------------------------
   -- Procedure StartTest
   --! \brief  Start the test case. Additional test_comment parameter.
   ----------------------------------------------------------------------------
   procedure StartTest(
             test_name    : in string;
             test_comment : in string;
             time_to_run  : in time;
      signal control      : inout execution
   );

   ----------------------------------------------------------------------------
   -- Procedure EvaluateTest
   --! \brief  Evaluate the test case.
   ----------------------------------------------------------------------------
   procedure EvaluateTest(
      signal control     : in result
   );

   ----------------------------------------------------------------------------
   -- Procedure ShowResult
   --! \brief  Show the test result.
   ----------------------------------------------------------------------------
   procedure ShowResult;

end package TestExecution_pkg;

--------------------------------------------------------------------------------
-- Body TestExecution_pkg
--! \brief  test execution package implementation.
--------------------------------------------------------------------------------
package body TestExecution_pkg is

   ---------------------------------------------------------------------------
   -- Internal constants and variables
   ---------------------------------------------------------------------------
   --! the name of the executed test suite.
   shared variable executed_test_suite_name : line := null;
   --! the name of the executed test case.
   shared variable executed_test_name : line := null;
   --! the comment of the executed testcase.
   shared variable executed_test_comment : line := null; 

   -----------------------------------------------------------------------------
   -- Function GetExecutedTestSuite
   --! \brief    GetExecutedTestSuite - Return the name of the executed
   --!           test suite.
   --! \details  The function returns the name of the current executed test
   --!           suite.
   --! \return   The current executed test suite name.
   -- Comments   :
   -----------------------------------------------------------------------------
   impure function GetExecutedTestSuite
   return string is
   begin
      if ( executed_test_suite_name = null ) then
         return "";
      end if; -- null
      return executed_test_suite_name.all;
   end function GetExecutedTestSuite;

   -----------------------------------------------------------------------------
   -- Function GetExecutedTestCase
   --! \brief    GetExecutedTestCase - Return the name and comment of the
   --!           executed test case.
   --! \details  The function returns the name and the test case comment of
   --!           the current executed test case.
   --! \return   The current executed test case long name.
   -- Comments   :
   -----------------------------------------------------------------------------
   impure function GetExecutedTestCase
   return string is
   begin
      if ( executed_test_name = null ) then
         return "";
      end if; -- null

      if ( executed_test_comment = null ) then
         return executed_test_name.all;
      end if; -- null
      return executed_test_name.all & ": " & executed_test_comment.all;
   end function GetExecutedTestCase;

   -----------------------------------------------------------------------------
   -- Function GetExecutedTestCaseName
   --! \brief    GetExecutedTestCaseName - Return the name of the executed
   --!           test case only.
   --! \details  The function returns the name of the current executed test
   --!           case only.
   --! \return   The current executed test case short name.
   -- Comments   :
   -----------------------------------------------------------------------------
   impure function GetExecutedTestCaseName
   return string is
   begin
      if ( executed_test_name = null ) then
         return "";
      end if; -- null
      return executed_test_name.all;
   end function GetExecutedTestCaseName;

   -----------------------------------------------------------------------------
   -- Procedure InitTest
   --! \brief    InitTest - Initialize the test run.
   --! \details  The procedure define the name of the test run for the test
   --!           run report.
   --! \param    test_name  the test run name.
   -- Comments   :
   --
   -----------------------------------------------------------------------------
  procedure InitTest(
      test_name : in string
   ) is
   begin
      SetTestName( test_name );
   end procedure InitTest;

   -----------------------------------------------------------------------------
   -- Procedure UseReportOutput
   -- Comments   :
   --
   -----------------------------------------------------------------------------
--   procedure UseReportOutput(
--      report_name : in string
--   ) is
--   begin
--      SetReportOutput( report_name, true );
--   end procedure UseReportOutput;

   -----------------------------------------------------------------------------
   -- Procedure UseReportOutput
   --! \brief    UseReportOutput - Set the report output active and define
   --!           the report file name.
   --! \details  The procedure activate the report output and set create
   --!           the report file with the specified name.
   --! \param    report_name  the report file name.
   --! \param    level        the used log level for the report output
   -- Comments   :
   --
   -----------------------------------------------------------------------------
   procedure UseReportOutput(
      report_name : in string;
      level       : in log_level := ALL_INFO
   ) is
   begin
      SetReportOutput( report_name, true, level );
   end procedure UseReportOutput;
   
   -----------------------------------------------------------------------------
   -- Procedure UseHTMLOutput
   -----------------------------------------------------------------------------
--   procedure UseHTMLOutput(
--      file_name : in string
--   ) is
--   begin
--      SetHTMLOutput( file_name, true );
--   end procedure UseHTMLOutput;

   -----------------------------------------------------------------------------
   -- Procedure UseHTMLOutput
   --! \brief    UseHTMLOutput - Set the report output active and define
   --!           the report file name.
   --! \details  The procedure activate the HTML output and create the HTML
   --!           report file with the specified name.
   --! \param    file_name  the HTML report file name.
   --! \param    level      the used log level for the HTML output
   -- Comments   :
   --
   -----------------------------------------------------------------------------
   procedure UseHTMLOutput(
      file_name : in string;
      level     : in log_level := LOG_FAILURE
   ) is
   begin
      SetHTMLOutput( file_name, true, level );
   end procedure UseHTMLOutput;
   
   -----------------------------------------------------------------------------
   -- Procedure UseTextOutput
   -----------------------------------------------------------------------------
--   procedure UseTextOutput is
--   begin
--      SetTextOutput( true );
--   end procedure UseTextOutput;

   -----------------------------------------------------------------------------
   -- Procedure UseTextOutput
   --! \brief     UseTextOutput - Set the text output active.
   --! \details   The procedure activate the text output.
   --! \param     level    the used log level for the text output
   -- Comments    :
   --
   -----------------------------------------------------------------------------
   procedure UseTextOutput (
      level  : in log_level := ALL_INFO
   ) is
   begin
      SetTextOutput( true, level );
   end procedure UseTextOutput;
   
   -----------------------------------------------------------------------------
   -- Procedure UseTestStatistic
   --! \brief     UseTestStatistic - Set the test statistic active.
   --! \details   The procedure activate the test statistic output.
   -- Comments    :
   --
   -----------------------------------------------------------------------------
   procedure UseTestStatistic is
   begin
      SetStatistic( true );
   end procedure UseTestStatistic;
   
   -----------------------------------------------------------------------------
   -- Procedure WaitForStart
   --! \brief     WaitForStart - Waits for the start of the test case execution.
   --! \details   The procedure stop a process until the execution is started.
   --! \param     control  execution control of the test case.
   -- Comments    :
   --
   -----------------------------------------------------------------------------
   procedure WaitForStart(
      signal control : in execution
   ) is
   begin
      if not control.start then
         wait until control.start;
      end if; -- control.start
   end procedure WaitForStart;

   -----------------------------------------------------------------------------
   -- Procedure StopAtEnd
   --! \brief      StopAtEnd - Stops the test case execution at the end of
   --!             the running time.
   --! \details    The procedure stop a process at the end of the running time.
   --! \param      control  result control of the test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StopAtEnd(
      signal control : in result
   ) is
   begin
      if control.stop then
         wait;
      end if; -- control.stop
    end procedure StopAtEnd;

   -----------------------------------------------------------------------------
   -- Procedure StopProcess
   --! \brief      StopProcess - Stops the test case execution.
   --! \details    The procedure stop a test case process.
   --! \param      control  result control of the test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StopProcess(
      signal control : in result
   ) is
   begin
      wait;
    end procedure StopProcess;   

    -----------------------------------------------------------------------------
   -- Procedure StopTestSuite
   --! \brief        StopTestSuite - Stop the test suite execution.
   --! \details      The procedure set the control record to stop and stop the
   --!               test suite.
   --! \param        control  execution control to set.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StopTestSuite(
      signal control : out result
   ) is
   begin
      control.stop <= true;
      wait;
   end procedure StopTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure MonitorWaitForStart
   --! \brief       MonitorWaitForStart - Waits for the start of test case
   --!              execution for the monitor process.
   --! \details     The procedure stops the monitor process until the execution
   --!              is started and sets the case statistic information.
   --! \param       unit_name     name of the unit under test.
   --! \param       unit_outputs  number of unit under test outputs.
   --! \param       control       execution control of the test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure MonitorWaitForStart(
            unit_name     : in string;
            unit_outputs  : in integer;
      signal control      : in execution
   ) is
   begin
      if not control.start then
         wait until control.start;
         SetCaseInfo( unit_name, unit_outputs );
      end if; -- control.start
   end procedure MonitorWaitForStart;

   -----------------------------------------------------------------------------
   -- Procedure MonitorStopAtEnd
   --! \brief        MonitorStopAtEnd - Stops the test case execution at the
   --!               end of the running time for the monitor process.
   --! \details      The procedure stop the monitor  process at the end of the
   --!               running time and update the test case result information.
   --! \param        control_in   result control of the test case.
   --! \param        error        error counter of the test case.
   --! \param        control_out  control information of the test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure MonitorStopAtEnd(
      signal control_in  : in result;
             error       : in integer;
      signal control_out : out result
   ) is
   begin
      control_out.stop  <= control_in.stop;
      control_out.error <= error;
      if control_in.stop then
         wait;
      end if; -- control.stop
    end procedure MonitorStopAtEnd;

   -----------------------------------------------------------------------------
   -- Procedure MonitorStopAtEnd
   --! \brief        MonitorStopAtEnd - Stops the test case execution at the 
   --!               end of the running time for the monitor process.
   --! \details      The procedure stop the monitor process at the end of the 
   --!               running time and update the test case result information.
   --! \param        control_in   result control of the test case.
   --! \param        error        error counter of the test case.
   --! \param        failure      failure counter of the test case.
   --! \param        control_out  control information of the test case.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure MonitorStopAtEnd(
      signal   control_in  : in result;
      constant error       : in integer;
      constant failure     : in integer;
      signal   control_out : out result
   ) is
   begin
      control_out.stop  <= control_in.stop;
      control_out.error <= error + failure;
      if control_in.stop then
         wait;
      end if; -- control.stop
    end procedure MonitorStopAtEnd;

   -----------------------------------------------------------------------------
   -- Procedure RunUntilTime
   --! \brief        RunUntilTime  - Execute the test case until the runtime is 
   --!               reached.
   --! \details      The procedure stop the test case if the running time end 
   --!               is reached.
   --! \param        control_in   execution control of the test case.
   --! \param        control_out  result control of the test case.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure RunUntilTime(
      signal control_in  : in execution;
      signal control_out : out result
   ) is
   begin
      WaitForStart( control_in );
      if control_in.runtime < NOW then
         control_out.stop <= true;
         wait;
      end if; -- runtime
   end procedure RunUntilTime;

   ----------------------------------------------------------------------------
   -- Procedure RunUntilCond
   -- \brief        RunUntilCond - Execute the test case until a condition or 
   --               a timeout (defined in StartTest() ) is reached.
   -- \details      The procedure stop the test case if a condition or a 
   --               timeout is reached.
   --
   -- \param        control_in     execution control of the test case.
   -- \param        control_out    result control of the test case.
   -- \param        condition_in   condition to stop the test case.
   -- Comments     :
   --
   ----------------------------------------------------------------------------
   -- procedure RunUntilCond(
      -- signal control_in  : in execution;
      -- signal control_out : out result;
      -- signal condition_in: in boolean
   -- ) is
   -- begin
      -- WaitForStart( control_in );
      -- if (condition_in = true) or (control_in.runtime < NOW) then
         -- control_out.stop <= true;
         -- wait;
      -- end if; -- runtime
   -- end procedure RunUntilCond;

  ----------------------------------------------------------------------------
   -- Procedure ExecuteUntilCond
   --! \brief        ExecuteUntilCond - Execute the test case until a condition or 
   --!               a timeout (defined in StartTest() ) is reached.
   --! \details      The procedure stop the test case if the condition or the 
   --!               timeout is reached.
   --!
   --! \param        control_in     execution control of the test case.
   --! \param        condition_in   condition to stop the test case.
   --! \param        error          error counter of the test case.
   --! \param        control_tc     control of the test case.
   --! \param        control_out    result control of the test case.
   -- Comments     :
   --
   ----------------------------------------------------------------------------
   procedure ExecuteUntilCond(
      signal control_in  : in execution;
      signal condition_in: in boolean;
      constant error     : in integer;
      signal control_tc  : out result;
      signal control_out : out result
   ) is
   begin
      WaitForStart( control_in );
      if (condition_in = true) or (control_in.runtime < NOW) then
         control_tc.stop <= true;
         control_out.stop <= true;
         control_out.error <= error;
         wait;
      end if; -- runtime
   end procedure ExecuteUntilCond;
   
   ----------------------------------------------------------------------------
   -- Procedure ExecuteUntilCond
   --! \brief        ExecuteUntilCond - Execute the test case until a condition or 
   --!               a timeout (defined in StartTest() ) is reached.
   --! \details      The procedure stop the test case if the condition or the 
   --!               timeout is reached.
   --!               The stop of the execution will be performed after the 
   --!               defined delay time.
   --!
   --! \param        control_in     execution control of the test case.
   --! \param        condition_in   condition to stop the test case.
   --! \param        error          error counter of the test case.
   --! \param        delay          time delay for the execution stop.
   --! \param        control_tc     control of the test case.
   --! \param        control_out    result control of the test case.
   -- Comments     :
   --
   ----------------------------------------------------------------------------
   procedure ExecuteUntilCond(
      signal control_in  : in execution;
      signal condition_in: in boolean;
      constant error     : in integer;
      constant delay     : in time;
      signal control_tc  : out result;
      signal control_out : out result
   ) is
   begin
      WaitForStart( control_in );
      if (condition_in = true) or (control_in.runtime < NOW) then
         control_tc.stop <= true after delay;
         control_out.stop <= true after delay;
         control_out.error <= error after delay;
         wait;
      end if; -- runtime
   end procedure ExecuteUntilCond;
   
   -----------------------------------------------------------------------------
   -- Procedure InitControl
   --! \brief        InitControl - Initialize the control record.
   --! \details      The procedure initialize the control record for test
   --!               suites or cases.
   --! \param        control  execution control signal.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure InitControl(
      signal control : inout execution
   ) is
   begin
      control.start <= false;
      control.runtime <= 0 ns;
   end procedure InitControl;

   -----------------------------------------------------------------------------
   -- Procedure InitControl
   --! \brief        InitControl - Initialize the control record.
   --! \details      The procedure initialize the control record vector for test
   --!               suites or cases.
   --! \param       control_vec  execution control vector signal.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure InitControl(
      signal control_vec : inout execution_vector
   ) is
   begin
      for i in control_vec'range loop
         control_vec(i).start <= false;
         control_vec(i).runtime <= 0 ns;
      end loop;
   end procedure InitControl;

   -----------------------------------------------------------------------------
   -- Procedure StartTestSuite
   --! \brief        StartTest  - Start the test suite.
   --! \details      The procedure set the start condition for a test suite.
   --! \param       test_suite  the name of the test suite to start.
   --! \param       control     execution control of the test suite.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StartTestSuite(
             test_suite  : in string;
      signal control     : inout execution
   ) is
   begin
      -- process test_siute
      if (executed_test_suite_name /= null) then
         deallocate (executed_test_suite_name);
         executed_test_suite_name := new string'("");
      end if;
      write( executed_test_suite_name, test_suite );

      -- print report message
      PrintTestSuite( test_suite );

      -- update statistic
      AddSuite( test_suite );

      -- start test suite
      control.start <= true;
      control.runtime <= NOW;
   end procedure StartTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure EvaluateTestSuite
   --! \brief        EvaluateTestSuite  - Evaluate the test suite.
   --! \details      The procedure wait until the test suite is stopped and
   --!               update the run statistic information.
   --! \param        control   result control of the test suite.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure EvaluateTestSuite(
      signal control : in result
   ) is
   begin
      wait until control.stop;
      -- print suite statistic
      PrintSuiteResult;

      -- update statistic
      UpdateSuiteResult;
   end procedure EvaluateTestSuite;

   -----------------------------------------------------------------------------
   -- Procedure StartTest
   --! \brief        StartTest - Start the test case.
   --! \details      The procedure set the start condition and calculate the
   --!               absolute stop time for a test case.
   --! \param       test_name    the name of the test case to start.
   --! \param       time_to_run  time duration of the test case or timeout when
   --!                           using RunUntilCond() function.
   --! \param       control      execution control of the test case
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StartTest(
             test_name   : in string;
             time_to_run : in time;
      signal control     : inout execution
   ) is
   begin
      -- process test_comment
      if (executed_test_comment /= null) then
         deallocate (executed_test_comment);
         executed_test_comment := null;
      end if;

      -- process test_name
      if (executed_test_name /= null) then
         deallocate (executed_test_name);
         executed_test_name := new string'("");
      end if;
      write( executed_test_name, test_name );

      -- print report message
      PrintTestCase( test_name );

      -- update suite statistic
      AddTest;

      -- start test
      control.start <= true;
      control.runtime <= NOW + time_to_run;
   end procedure StartTest;

   -----------------------------------------------------------------------------
   -- Procedure StartTest
   --! \brief        StartTest - Start the test case.
   --! \details      The procedure set the start condition and calculate the
   --!               absolute stop time for a test case.
   --! \param        test_name  the name of the test case to start.
   --! \param        test_comment  the name of the test case to start.
   --! \param        time_to_run   time duration of the test case.
   --! \param        control       execution control of the test case.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure StartTest(
             test_name    : in string;
             test_comment : in string;
             time_to_run  : in time;
      signal control      : inout execution
   ) is
   begin
      -- process test_comment
      if (executed_test_comment /= null) then
         deallocate (executed_test_comment);
         executed_test_comment := new string'("");
      end if;
      write( executed_test_comment, test_comment );

      -- process test_name
      if (executed_test_name /= null) then
         deallocate (executed_test_name);
         executed_test_name := new string'("");
      end if;
      write( executed_test_name, test_name );

      -- print report message: test name + test comment 
      PrintTestCase( test_name & ": " & test_comment );

      -- update suite statistic
      AddTest;

      -- start test
      control.start <= true;
      control.runtime <= NOW + time_to_run;
   end procedure StartTest;

   -----------------------------------------------------------------------------
   -- Procedure EvaluateTest
   --! \brief        EvaluateTest  - Evaluate the test case.
   --! \details      The procedure wait until the test case is stopped and 
   --!               update the statistic information.
   --! \param        control  result control of the test case.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure EvaluateTest(
      signal control : in result
   ) is
   begin
      wait until control.stop;

      -- update test result
      UpdateTest( control.error );

      PrintCaseResult( control.error );
   end procedure EvaluateTest;
   
   -----------------------------------------------------------------------------
   -- Procedure ShowResult
   --! \brief       ShowResult  - Show the test result. 
   --! \details     The procedure show the test result on the defined outputs.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure ShowResult is
   begin
      PrintResult;
   end procedure ShowResult;
    
end package body TestExecution_pkg;

--------------------------------------------------------------------------------
-- end TestExecution_pkg.vhd
--------------------------------------------------------------------------------
