--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TestMonitor_pkg.vhd
--!
--! \brief        Monitor functions package for VHUNIT project.
--!
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \author       Tonfat Jorge     (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 02.05.2006
--! \date         Updated: 15.11.2017
--! \version      V 1.05
--
-- Package      : TestMonitor_pkg (declaration, body).
-- File Version : $Revision: 31 $
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
--! IEEE standard numeric functions
use ieee.numeric_std.all;

--! standard library
library std;
--! Std standard textio package
use std.textio.all;

--vhdl_comp_off -2008
--! ieee_proposed library
library ieee_proposed;
--! ieee_proposed standard additions package
use ieee_proposed.standard_additions.all; 
--! ieee_proposed standard logic additions package
use ieee_proposed.std_logic_1164_additions.all; 
--vhdl_comp_on

--! VHUNIT test library
library VHUNIT;
--! VHUNIT assert package
use VHUNIT.Assert_pkg.all;
--! VHUNIT test compare package
use VHUNIT.TestCompare_pkg.all;
--! VHUNIT test statistic package
use VHUNIT.TestStatistic_pkg.all;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;

--------------------------------------------------------------------------------
-- Package TestMonitor_pkg
--! \brief      TestMonitor_pkg - Monitor function package for VHUNIT project.
--! \details    Implements functions and procedures to monitor signal values.
--!
--! - Procedures
--! \li \ref  MonitorResult     - Monitor a signal and produce failure report.
--! \li \ref  MonitorResult     - Monitor a vector and produce failure report.
--! \li \ref  MonitorSignalErrCntVar - Monitor a signal and update error count 
--!                                    to a variable.
--! \li \ref  MonitorSignal     - Monitor a signal and update test statistic.
--! \li \ref  MonitorSignal     - Monitor a vector and update test statistic.
--! \li \ref  CheckSignalStable - Check if a signal was stable and update test
--!                               statistic.
--! \li \ref  CheckSignalStable - Check if a vector was stable and update test
--!                               statistic.
--! \li \ref  CheckSignalChange - Check if a signal changed and update test 
--!                               statistic.
--! \li \ref  CheckSignalChange - Check if a vector changed and update test 
--!                               statistic.
--! \li \ref  WatchSignalStable - Wait and check if a signal was stable and 
--!                               update test statistic.
--! \li \ref  WatchSignalStable - Wait and check if a vector was stable and 
--!                               update test statistic.
--! \li \ref  WatchSignalChange - Wait and check if a signal changed and 
--!                               update test statistic.
--! \li \ref  WatchSignalChange - Wait and check if a vector changed and 
--!                               update test statistic.
-- Comments :
--
-- Updates : V 1.00  - 12.11.2007 HOT add MonitorResult for std_logic_vector
--           V 1.001 - 25.08.2010 HOT add MonitorSignal 
--           V 1.04  - 12.10.2015 HOT add WatchSignal and CheckSignal 
--                                    update Print.. function for string usage
--                    07.09.2016 HOT update functions to use 
--                                   GetExecutedTestCaseName
--           V 1.05 - 14.10.2016 HOT update package to be VHDL 2008 compatible
--                    19.10.2016 JTO add MonitorSignalErrCntVar, solves prob
--                                   to update error cnt in one delta time cycle   
--                    21.10.2016 HOT add WatchSignalStable 
--                    15.11.2017 HOT add MonitorResult and MonitorSignal for unsigned 
--------------------------------------------------------------------------------
package TestMonitor_pkg is

   ----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief  Monitor a signal and produce failure report.
   ----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string;
      signal error_counter : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief  Monitor a vector and produce failure report.
   ----------------------------------------------------------------------------
   --vhdl_comp_off -2008
   procedure MonitorResult( 
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string;
      signal error_counter : inout integer
   );
   --vhdl_comp_on

   ----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief  Monitor a vector and produce failure report.
   ----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in std_logic_vector;
      expected_output  : in std_logic_vector;
      signal_name      : in string;
      signal error_counter : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief  Monitor a vector and produce failure report.
   ----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in unsigned;
      expected_output  : in unsigned;
      signal_name      : in string;
      signal error_counter : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorSignalErrCntVar
   --! \brief  Monitor a signal and update error count to a variable.
   ----------------------------------------------------------------------------
   procedure MonitorSignalErrCntVar( 
      signal   actual_output    : in std_logic;
      signal   expected_output  : in std_ulogic;
      constant signal_name      : in string;
      error_counter    : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief  Monitor a signal and update test statistic.
   ----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output    : in std_logic;
      signal   expected_output  : in std_ulogic;
      constant signal_name      : in string;
      signal  error_counter    : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief  Monitor a vector and update test statistic.
   ----------------------------------------------------------------------------
   --vhdl_comp_off -2008
   procedure MonitorSignal( 
      signal   actual_output    : in std_logic_vector;
      signal   expected_output  : in std_ulogic_vector;
      constant signal_name      : in string;
      signal   error_counter    : inout integer
   );
   --vhdl_comp_on

   ----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief  Monitor a vector and update test statistic.
   ----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output    : in std_logic_vector;
      signal   expected_output  : in std_logic_vector;
      constant signal_name      : in string;
      signal   error_counter    : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief  Monitor a vector and update test statistic.
   ----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output    : in unsigned;
      signal   expected_output  : in unsigned;
      constant signal_name      : in string;
      signal   error_counter    : inout integer
   );

   ----------------------------------------------------------------------------
   -- Procedure CheckSignalStable
   --! \brief  Check if a signal was stable and update test statistic.
   ----------------------------------------------------------------------------
   procedure CheckSignalStable( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant stable_for       : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure CheckSignalStable
   --! \brief  Check if a vector changed and update test statistic.
   ----------------------------------------------------------------------------
   procedure CheckSignalStable( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant stable_for       : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure CheckSignalChange
   --! \brief  Check if a signal changed and update test statistic.
   ----------------------------------------------------------------------------
   procedure CheckSignalChange( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant check_for        : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure CheckSignalChange
   --! \brief  Check if a vector changed and update test statistic.
   ----------------------------------------------------------------------------
   procedure CheckSignalChange( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant check_for        : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure WatchSignalStable
   -- \brief  Wait and check if a signal is stable  and update test statistic.
   ----------------------------------------------------------------------------
   procedure WatchSignalStable( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure WatchSignalStable
   -- \brief  Wait and check if a vector is stable and update test statistic.
   ----------------------------------------------------------------------------
   procedure WatchSignalStable( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );
   
   ----------------------------------------------------------------------------
   -- Procedure WatchSignalChange
   --! \brief  Wait and check if a signal changed and update test statistic.
   ----------------------------------------------------------------------------
   procedure WatchSignalChange( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );

   ----------------------------------------------------------------------------
   -- Procedure WatchSignalChange
   --! \brief  Wait and check if a vector changed and update test statistic.
   ----------------------------------------------------------------------------
   procedure WatchSignalChange( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   );
   
end package TestMonitor_pkg;

------------------------------------------------------------------------------
-- Body TestMonitor_pkg
--! \brief Test Monitor package implementation.
------------------------------------------------------------------------------
package body TestMonitor_pkg is
   
   -----------------------------------------------------------------------------
   -- Internal constants and variables
   -----------------------------------------------------------------------------
   --! Unit in which the time is shown.
   constant VHUNIT_TIME_BASE : time := ns; 
     
   -----------------------------------------------------------------------------
   -- Procedure CheckTimeWindow
   --! \brief    CheckTimeWindow - Check if the condition occurred in the time 
   --!                             window.
   --! \details  The procedure checks if the given condition occurred between 
   --!           min_time and max_time. It is a helper for internal use only.
   --!           The parameter success is used to distinguish between the 
   --!           following cases: 
   --!           - the signal reached success condition at max_time,
   --!           - max_time was reached with no success condition.
   --! \param  success        the signal check success.
   --! \param  elapsed_time   the elapsed time of the check.
   --! \param  min_time       the minimum time of the window.
   --! \param  max_time       the maximum time of the window.
   --! \param  signal_name    the signal name.
   --! \param  check_type     the check type string.
   --! \param  message        the failure indicator.
   --! \param  failure        the failure indicator.
   -- Comments :  adapted from the BITVIS UTILITY LIBRARY  methods_pkg package.
   --                
   -----------------------------------------------------------------------------
   procedure CheckTimeWindow(
      constant success      : in boolean;
      constant elapsed_time : in time;
      constant min_time     : in time;
      constant max_time     : in time;
      constant signal_name  : in string;
      constant check_type   : in string;
      constant message      : in string;
      variable failure      : inout integer
   ) is      
      constant time_string : string := to_string(elapsed_time, VHUNIT_TIME_BASE);
   begin                  
      AssertFailure( (max_time >= min_time) , "CompareTimewindow",
                    "min_time must be less than max_time" );      
                    
      if ( elapsed_time < min_time ) then
         PrintCheckLine( GetExecutedTestCaseName, signal_name, check_type &
                       "failed. Condition occurred too early, at " & 
                       time_string & ". "  & message );   
         failure := 1;
      elsif success then                                        
         PrintLogLine( GetExecutedTestCaseName, signal_name, check_type & 
                     "OK. Condition occurred at " & 
                       time_string & ". "  & message );   
         failure := 0;
      else -- max_time reached with no success
         PrintCheckLine( GetExecutedTestCaseName, signal_name, check_type &
                       "failed. Timed out at " &
                       time_string & ". "  & message );   
         failure := 1;
      end if; -- elapsed_time
   end procedure CheckTimeWindow;
  
   
   -----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief    MonitorResult - Monitor a signal and produce failure report. [std_logic]
   --!                             
   --! \details  The procedure compares an actual signal with the expected signal
   --!           and generates the failure report if both signals are not 
   --!           comparable.
   --! \param  actual_output    the current signal value.
   --! \param  expected_output  the expected signal value.
   --! \param  signal_name      the signal name.
   --! \param  error_counter    the updated error counter of the compare.
   --
   -- Comments :  adapted from ALDEC Monitor_Utilities package
   --                
   -----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in std_logic;
      expected_output  : in std_ulogic;
      signal_name      : in string;
      signal error_counter : inout integer
   ) is
      constant actual_value_string   : string := to_string(actual_output);
      constant expected_value_string : string := to_string(expected_output);
   begin
      if not IsComparable( actual_output, expected_output ) then
         error_counter <= error_counter + 1;    -- update error        
         -- update PrintFailureLine !!
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected_output, signal_name );
      end if; -- not IsCompareable
   end procedure MonitorResult;   

   -----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief    MonitorResult - Monitor a signal vector and produce failure 
   --!                           report. [std_logic_vector]
   --! \details  The procedure compares an actual signal vector with the expected 
   --!           signal vector and generate the failure report if both vectors  
   --!           are not comparable.
   --! \param  actual_output   the current vector value.
   --! \param  expected_output the expected vector value.
   --! \param  signal_name     the signal vector name.
   --! \param  error_counter   the updated error counter of the compare.
   --
   -- Comments :  adapted from ALDEC Monitor_Utilities package
   --                
   -----------------------------------------------------------------------------
   --vhdl_comp_off -2008
   procedure MonitorResult( 
      actual_output    : in std_logic_vector;
      expected_output  : in std_ulogic_vector;
      signal_name      : in string;
      signal error_counter : inout integer  -- change to result
   ) is
   begin
      if not IsComparableVector( actual_output, expected_output ) then
         error_counter <= error_counter + 1;       -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected_output, signal_name );
      end if; -- not IsCompareable
   end procedure MonitorResult;   
   --vhdl_comp_on

   -----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief    MonitorResult - Monitor a signal vector and produce failure 
   --!                           report. [std_logic_vector]
   --! \details  The procedure compares an actual signal vector with the expected
   --!           signal vector and generate the failure report if both vectors 
   --!           are not comparable. Procedure version for pure std_logic_vector 
   --!           inputs.
   --! \param  actual_output    the current vector value.
   --! \param  expected_output  the expected vector value.
   --! \param  signal_name      the signal vector name.
   --! \param  error_counter    the updated error counter of the compare.
   --
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in std_logic_vector;
      expected_output  : in std_logic_vector;
      signal_name      : in string;
      signal error_counter : inout integer  -- change to result
   ) is
   begin
      if not IsComparableVector( actual_output, to_stdulogicvector(expected_output) ) then
         error_counter <= error_counter + 1;       -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, 
                           to_stdulogicvector(expected_output), signal_name );
      end if; -- not IsCompareable
   end procedure MonitorResult;   
   
   -----------------------------------------------------------------------------
   -- Procedure MonitorResult
   --! \brief    MonitorResult - Monitor a signal vector and produce failure 
   --!                           report. [unsigned]
   --! \details  The procedure compares an actual unsigned vector with the expected
   --!           unsigned vector and generate the failure report if both vectors 
   --!           are not comparable. Procedure version for unsigned inputs.
   --!           The unsigned type is defined in the ieee.std_logic_arith package.
   --! \param  actual_output    the current vector value.
   --! \param  expected_output  the expected vector value.
   --! \param  signal_name      the signal vector name.
   --! \param  error_counter    the updated error counter of the compare.
   --
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorResult( 
      actual_output    : in unsigned;
      expected_output  : in unsigned;
      signal_name      : in string;
      signal error_counter : inout integer  -- change to result
   ) is
   begin
      if not IsComparableVector( std_logic_vector(actual_output), to_stdulogicvector(std_logic_vector(expected_output)) ) then
         error_counter <= error_counter + 1;       -- update error
         PrintFailureLine( GetExecutedTestCaseName, std_logic_vector(actual_output), 
                           to_stdulogicvector(std_logic_vector(expected_output)), signal_name );
      end if; -- not IsCompareable
   end procedure MonitorResult;   
   
   -----------------------------------------------------------------------------
   -- Procedure MonitorSignalErrCntVar
   --! \brief    MonitorSignalErrCntVar - Monitor a signal and update test 
   --!           statistic.
   --! \details  The procedure compares an actual signal with the expected 
   --!           signal, update the signal statistic and generate the failure 
   --!           report if both signals are not comparable.
   --! \param  actual_output    the current signal value.
   --! \param  expected_output  the expected signal value.
   --! \param  signal_name      the signal name.
   --! \param  error_counter    the updated error counter of the compare.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorSignalErrCntVar( 
      signal   actual_output   : in std_logic;
      signal   expected_output : in std_ulogic;
      constant signal_name     : in string;
      error_counter   : inout integer
   ) is
      variable error : integer := 0;
      variable event : integer := 0;
   begin
      if ( actual_output'event or expected_output'event ) then
         event := 1;
      end if; -- event
      
      if not IsComparable( actual_output, expected_output ) then
         error := 1;
         error_counter := error_counter + error;    -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected_output, signal_name );
      end if; -- not IsCompareable
      
      UpdateSignal( signal_name, event, error ); 
   end procedure MonitorSignalErrCntVar;

   -----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief   MonitorSignal - Monitor a signal and update test statistic. [std_logic]
   --!                             
   --! \details The procedure compares an actual signal with the expected signal,
   --!          update the signal statistic and generate the failure report
   --!          if both signals are not comparable.
   --! \param  actual_output   the current signal value.
   --! \param  expected_output the expected signal value.
   --! \param  signal_name     the signal name.
   --! \param  error_counter   the updated error counter of the compare.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output   : in std_logic;
      signal   expected_output : in std_ulogic;
      constant signal_name     : in string;
      signal   error_counter   : inout integer
   ) is
      variable error : integer := 0;
      variable event : integer := 0;
   begin
      if ( actual_output'event or expected_output'event ) then
         event := 1;
      end if; -- event
      
      if not IsComparable( actual_output, expected_output ) then
         error := 1;
         error_counter <= error_counter + error;    -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected_output, signal_name );
      end if; -- not IsCompareable
      
      UpdateSignal( signal_name, event, error ); 
   end procedure MonitorSignal;

   -----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief  MonitorSignal - Monitor a signal vector and update test 
   --!                         statistic. [std_logic_vector]
   --! \details  The procedure compares an actual signal vector with the expected 
   --!           signal vector, update the signal statistic and generate the 
   --!           failure report if both vectors are not comparable. 
   --! \param  actual_output    the current vector value.
   --! \param  expected_output  the expected vector value.
   --! \param  signal_name      the signal vector name.
   --! \param  error_counter    the updated error counter of the compare.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   --vhdl_comp_off -2008
   procedure MonitorSignal( 
      signal   actual_output   : in std_logic_vector;
      signal   expected_output : in std_ulogic_vector;
      constant signal_name     : in string;
      signal   error_counter   : inout integer  -- change to result
   ) is
      variable error : integer := 0;
      variable event : integer := 0;
   begin
      if ( actual_output'event or expected_output'event ) then
         event := 1;
      end if; -- event
      
      if not IsComparableVector( actual_output, expected_output ) then
         error := 1;
         error_counter <= error_counter + error;    -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected_output, signal_name );
      end if; -- not IsCompareable
      
      UpdateSignal( signal_name, event, error ); 
   end procedure MonitorSignal;   
   --vhdl_comp_on

   -----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief    MonitorSignal - Monitor a signal vector and update test 
   --!                           statistic. [std_logic_vector]
   --! \details  The procedure compares an actual signal vector with the expected 
   --!           signal vector, updates the signal statistic and generate the 
   --!           failure report if both vectors are not comparable. Procedure 
   --!           version for pure std_logic_vector inputs.
   --! \param   actual_output   the current vector value.
   --! \param   expected_output the expected vector value.
   --! \param   signal_name     the signal vector name.
   --! \param   error_counter   the updated error counter of the compare.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output   : in std_logic_vector;
      signal   expected_output : in std_logic_vector;
      constant signal_name     : in string;
      signal   error_counter   : inout integer  -- change to result
   ) is
      variable error : integer := 0;
      variable event : integer := 0;
      variable expected : std_ulogic_vector(expected_output'range);
   begin
      if ( actual_output'event or expected_output'event ) then
         event := 1;
      end if; -- event
      
      expected := to_stdulogicvector(expected_output);
      if not IsComparableVector( actual_output, expected ) then
         error := 1;
         error_counter <= error_counter + error;    -- update error
         PrintFailureLine( GetExecutedTestCaseName, actual_output, expected, signal_name );
      end if; -- not IsCompareable
      
      UpdateSignal( signal_name, event, error ); 
   end procedure MonitorSignal;

   -----------------------------------------------------------------------------
   -- Procedure MonitorSignal
   --! \brief    MonitorSignal - Monitor a signal vector and update test 
   --!                           statistic. [unsigned]
   --! \details  The procedure compares an actual unsiged vector with the expected 
   --!           unsigned vector, updates the signal statistic and generate the 
   --!           failure report if both vectors are not comparable. Procedure 
   --!           version for unsigned vector inputs.   
   --!           The unsigned type is defined in the ieee.std_logic_arith package.	   
   --! \param   actual_output   the current vector value.
   --! \param   expected_output the expected vector value.
   --! \param   signal_name     the signal vector name.
   --! \param   error_counter   the updated error counter of the compare.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure MonitorSignal( 
      signal   actual_output   : in unsigned;
      signal   expected_output : in unsigned;
      constant signal_name     : in string;
      signal   error_counter   : inout integer  -- change to result
   ) is
      variable error : integer := 0;
      variable event : integer := 0;
      variable expected : std_ulogic_vector(expected_output'range);
   begin
      if ( actual_output'event or expected_output'event ) then
         event := 1;
      end if; -- event
      
      expected := to_stdulogicvector(std_logic_vector(expected_output));
      if not IsComparableVector( std_logic_vector(actual_output), expected ) then
         error := 1;
         error_counter <= error_counter + error;    -- update error
         PrintFailureLine( GetExecutedTestCaseName, std_logic_vector(actual_output), expected, signal_name );
      end if; -- not IsCompareable
      
      UpdateSignal( signal_name, event, error ); 
   end procedure MonitorSignal;
   
   -----------------------------------------------------------------------------
   -- Procedure CheckSignalStable
   --! \brief    CheckSignalStable - check if a signal is stable and update test 
   --!                               statistic. [std_logic]
   --! \details  The procedure checks if the signal was stable over the defined 
   --!           time duration.  It updates the signal statistic and generate the 
   --!           failure report if the signal was not stable.
   --! \param  target           the current signal to check.
   --! \param  signal_name      the signal name.
   --! \param  stable_for       the time for which the signal must be stable.
   --! \param  failure_counter  the updated error counter of the check.      
   --! \param  message          the check information message.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure CheckSignalStable( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant stable_for       : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant value_string       : string  := to_string(target);
      constant last_value_string  : string  := to_string(target'last_value);
      constant last_change        : time    := target'last_event;
      constant last_change_string : string  := to_string(last_change, VHUNIT_TIME_BASE);
  begin
     if ( last_change >= stable_for ) then
         PrintLogLine( GetExecutedTestCaseName, signal_name, "=> stable at '" & value_string &
                       "'. "  & message );
      else 
         failure := 1;
         failure_counter <= failure_counter + failure;    -- update counter
         PrintCheckLine( GetExecutedTestCaseName, signal_name, "=> not stable. " &
                         "Switched from " & last_value_string & " to " & value_string &
                         " " & last_change_string & " ago. " & message );
      end if; -- last_change
      
      UpdateSignal( signal_name, event, failure );  
   end procedure CheckSignalStable;
   
   -----------------------------------------------------------------------------
   -- Procedure CheckSignalStable
   --! \brief    CheckSignalStable - check if a vector is stable and update test
   --!                               statistic. [std_logic_vector]
   --! \details  The procedure checks if the vector was stable over the defined 
   --!           time duration. It updates the signal vector statistic and generate the 
   --!           failure report if the vector was not stable.
   --! \param  target           the current signal vector to check.
   --! \param  signal_name      the signal vector name.
   --! \param  stable_for       the time for which the signal vector must
   --!                          be stable.
   --! \param  failure_counter  the updated error counter of the check. 
   --! \param  message          the check information message.

   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure CheckSignalStable( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant stable_for       : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant value_string       : string  := to_string(target);
      constant last_value_string  : string  := to_string(target'last_value);
      constant last_change        : time    := target'last_event;
      constant last_change_string : string  := to_string(last_change, VHUNIT_TIME_BASE);
   begin
      if ( last_change >= stable_for ) then
         PrintLogLine( GetExecutedTestCaseName, signal_name, "=> stable at " & value_string &
                       " "  & message );
      else 
         failure := 1;
         failure_counter <= failure_counter + failure;    -- update counter
         PrintCheckLine( GetExecutedTestCaseName, signal_name, "=> not stable. " &
                         "Switched from " & last_value_string & " to " & value_string &
                         " " & last_change_string & " ago. " & message );
      end if; -- last_change
      
      UpdateSignal( signal_name, event, failure );   
   end procedure CheckSignalStable;

   -----------------------------------------------------------------------------
   -- Procedure CheckSignalChange
   --! \brief    CheckSignalChange - check if a signal change and update test 
   --!                               statistic. [std_logic]
   --! \details  The procedure checks if the signal was changed in the defined 
   --!           time duration. It updates the signal statistic and generate the 
   --!           failure report if the signal does not change.
   --! \param  target          the current signal to check.
   --! \param  signal_name     the signal name.
   --! \param  check_for       the time in which the signal must change before 
   --!                         now.
   --! \param  failure_counter the updated error counter of the check.      
   --! \param  message         the check information message.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure CheckSignalChange( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant check_for        : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant last_change        : time    := target'last_event;
   begin
      CheckTimeWindow( last_change < check_for, now-last_change, now-check_for, now, 
                       signal_name, "=> check of change ", message, failure );
      
      failure_counter <= failure_counter + failure;    -- update counter
      UpdateSignal( signal_name, event, failure );  
   end procedure CheckSignalChange;

   -----------------------------------------------------------------------------
   -- Procedure CheckSignalChange
   --! \brief    CheckSignalChange - check if a vector change and update test 
   --!                               statistic. [std_logic_vector]
   --! \details  The procedure checks if the vector was changed in the defined 
   --!           time duration. It updates the signal vector statistic and generate the 
   --!           failure report if the vector does not change.
   --! \param  target           the current signal vector to check.
   --! \param  signal_name      the signal vector name.
   --! \param  check_for        the time in which the signal vector must change before
   --!                          now.
   --! \param  failure_counter  the updated error counter of the check.      
   --! \param  message          the check information message.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure CheckSignalChange( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant check_for        : in time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant last_change        : time    := target'last_event;
   begin
      CheckTimeWindow( last_change < check_for, now-last_change, now-check_for, now, 
                       signal_name, "=> check of change ", message, failure );
      
      failure_counter <= failure_counter + failure;    -- update counter
      UpdateSignal( signal_name, event, failure );  
   end procedure CheckSignalChange;
   
   -----------------------------------------------------------------------------
   -- Procedure WatchSignalStable
   --! \brief    WatchSignalStable - check if a signal is stable and update test 
   --!                               statistic. [std_logic]
   --! \details  The procedure checks if the signal was stable over the defined 
   --!           time duration. It updates the signal statistic and generate the 
   --!           failure report if the signal was not stable.
   --! \param  target           the current signal to check.
   --! \param  signal_name      the signal name.
   --! \param  begin_time       the time to wait to start the watch procedure.
   --! \param  end_time         the time the signal is watched.
   --! \param  failure_counter  the updated error counter of the check.
   --! \param  message          the check information message. 
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure WatchSignalStable(    
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant start_time         : time    := now;
    begin
      -- wait until begin 
      wait for begin_time;
      -- wait until change or end
      wait on target for end_time;
  
      if ( now >= start_time+end_time ) then
         PrintLogLine( GetExecutedTestCaseName, signal_name, "=> stable at '" & to_string(target) &
                       "'. "  & message );
      else -- event before end of time
         failure := 1;
         failure_counter <= failure_counter + failure;    -- update counter
         PrintCheckLine( GetExecutedTestCaseName, signal_name, "=> not stable. " &
                         "Switched from " & to_string(target'last_value) & " to " & to_string(target) &
                         " at " & to_string(now, VHUNIT_TIME_BASE) &". " & message );
         -- wait unitl end
         wait for ( (start_time+end_time) - now );
      end if; -- now   
         
      UpdateSignal( signal_name, event, failure );  
   end procedure WatchSignalStable;

   -----------------------------------------------------------------------------
   -- Procedure WatchSignalStable
   --! \brief    WatchSignalStable - check if a vector is stable and update test 
   --!                               statistic. [std_logic_vector]
   --! \details  The procedure checks if the vector was stable over the defined 
   --!           time duration. It updates the signal vector statistic and generate the 
   --!           failure report if the vector was not stable.
   --! \param  target           the current signal vector to check.
   --! \param  signal_name      the signal vector name.
   --! \param  begin_time       the time to wait to start the watch procedure.
   --! \param  end_time         the time the signal vector is watched.
   --! \param  failure_counter  the updated error counter of the check.
   --! \param  message          the check information message. 
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure WatchSignalStable(    
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant start_time         : time    := now;
    begin    
      -- wait until begin 
      wait for begin_time;
      -- wait until change or end
      wait on target for end_time;
  
      if ( now < start_time+end_time ) then
         PrintLogLine( GetExecutedTestCaseName, signal_name, "=> stable at '" & to_string(target) &
                       "'. "  & message );
      else -- event before end of time
         failure := 1;
         failure_counter <= failure_counter + failure;    -- update counter
         PrintCheckLine( GetExecutedTestCaseName, signal_name, "=> not stable. " &
                         "Switched from " & to_string(target'last_value) & " to " & to_string(target) &
                         " at " & to_string(now, VHUNIT_TIME_BASE) &". " & message );
         -- wait unitl end
         wait for ( (start_time+end_time) - now );
      end if; -- now   
         
      UpdateSignal( signal_name, event, failure );  
   end procedure WatchSignalStable;
   
   -----------------------------------------------------------------------------
   -- Procedure WatchSignalChange
   --! \brief    WatchSignalChange - check if a signal change and update test 
   --!                               statistic. [std_logic]
   --! \details  The procedure checks if the signal was changed in the defined 
   --!           time duration. It updates the signal statistic and generate the 
   --!           failure report if the signal does not change.
   --! \param  target           the current signal to check.
   --! \param  signal_name      the signal name.
   --! \param  begin_time       the time to wait to start the watch procedure.
   --! \param  end_time         the time the signal is watched.
   --! \param  failure_counter  the updated error counter of the check.      
   --! \param  message          the check information message.
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure WatchSignalChange( 
      signal   target           : in std_logic;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant start_time         : time    := now;
    begin
      wait on target for end_time;
     
      CheckTimeWindow( target'event, now, start_time+begin_time, start_time+end_time, 
                       signal_name, "=> watch of change ", message, failure );
     
      failure_counter <= failure_counter + failure;    -- update counter
      UpdateSignal( signal_name, event, failure );  
   end procedure WatchSignalChange;

   -----------------------------------------------------------------------------
   -- Procedure WatchSignalChange
   --! \brief    WatchSignalChange - check if a vector change and update test 
   --!                               statistic. [std_logic_vector]
   --! \details  The procedure checks if the vector was changed in the defined 
   --!           time duration. It updates the signal vector statistic and generate 
   --!           the failure report if the vector does not change.
   --! \param  target           the current signal vector to check.
   --! \param  signal_name      the signal vector name.
   --! \param  begin_time       the time to wait to start the watch procedure.
   --! \param  end_time         the time the signal vector is watched.
   --! \param  failure_counter  the updated error counter of the check.
   --! \param  message          the check information message. 
   -- Comments :  
   --                
   -----------------------------------------------------------------------------
   procedure WatchSignalChange( 
      signal   target           : in std_logic_vector;
      constant signal_name      : in string;
      constant begin_time       : time;
      constant end_time         : time;
      signal   failure_counter  : inout integer;
      constant message          : in string := ""
   ) is
      variable            failure : integer := 0;
      variable              event : integer := 1;
      constant start_time         : time    := now;
    begin
      wait on target for end_time;
     
      CheckTimeWindow( target'event, now, start_time+begin_time, start_time+end_time, 
                       signal_name, "=> watch of change ", message, failure );
     
      failure_counter <= failure_counter + failure;    -- update counter
      UpdateSignal( signal_name, event, failure );  
   end procedure WatchSignalChange;
   
end package body TestMonitor_pkg;

------------------------------------------------------------------------------
-- end TestMonitor_pkg.vhd
------------------------------------------------------------------------------
