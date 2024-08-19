--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TestResult_pkg.vhd
--!
--! \brief        Package with different results functions for the
--!               VHUNIT project.
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 02.10.2006
--! \date         Updated: 31.01.2007
--! \version      V 1.00
--
-- Package      : TestResult_pkg (declaration, body)
-- File Version : $Revision: 18 $
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
-- Revision 1.1  2007/01/31 09:23:09  ottacher
-- Initial check in.
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
--! IEEE standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;

--! VHUNIT test library
library VHUNIT;
--! VHUNIT test statistic package
use VHUNIT.Assert_pkg.all;

--------------------------------------------------------------------------------
-- Package TestResult_pkg
--! \brief        TestResult_pkg  - Result functions package for VHUNIT project.
--! \details      Implements functions and procedures to generate result values.
--!
--! - Types
--! \li \ref      delay_time - Time subtype for signal delay specifications.
--! - Procedures
--! \li \ref SetResult - Set the result of a signal with the defined value 
--!                      and delay.
--! \li \ref SetResult - Set the result of a vector with the defined value 
--!                      and delay.
--
-- Comments :
--
-- Updates :
--
--------------------------------------------------------------------------------
package TestResult_pkg is

   -----------------------------------------------------------------------------
   -- Type delay_time
   --! \brief        Time subtype for signal delay specifications.
   --! \details      Defines a time specification for positive values only.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   subtype delay_time is time range 0 fs to time'high;

   ----------------------------------------------------------------------------
   -- Procedure SetResult
   --! \brief  Set the result of a signal with the defined value and delay.
   ----------------------------------------------------------------------------
   procedure SetResult( 
      signal signal_to_set : inout std_logic;
             value         : in std_logic;
             delay         : in delay_time
   );

   ----------------------------------------------------------------------------
   -- Procedure SetResult
   --! \brief  Set the result of a vector with the defined value and delay.
   ----------------------------------------------------------------------------
   procedure SetResult( 
      signal vector_to_set : inout std_logic_vector;
             value         : in std_logic_vector;
             delay         : in delay_time
   );
   
end package TestResult_pkg;

--------------------------------------------------------------------------------
-- Body TestResult_pkg
--! \brief Test result package implementation.
--------------------------------------------------------------------------------
package body TestResult_pkg is
   
   -----------------------------------------------------------------------------
   -- Procedure SetResult
   --! \brief    SetResult - Set the result of a signal with the defined value 
   --!                       and delay.
   --! \details  The procedure sets the signal value to don't care ('-') value. 
   --!           After the delay time the signal is set to the defined value.
   --! \param  signal_to_set the signal to set.
   --! \param  value         the result value to set.
   --! \param  delay         the time to delay the change of the signal value.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure SetResult( 
      signal signal_to_set : inout std_logic;
             value         : in std_logic;
             delay         : in delay_time
   ) is
   begin
      signal_to_set <= '-' after 0 fs, value after delay;
   end procedure SetResult;   
   

   -----------------------------------------------------------------------------
   -- Procedure SetResult
   --! \brief    SetResult - Set the result of a vector with the defined value 
   --!                       and delay.
   --! \details  The procedure sets the vector value to don't care ('-') value. 
   --!           After the delay time the vector is set to the defined value. An
   --!           assertion is executed, if the vectors have not the same size.
   --! \param   vector_to_set the vector to set.    
   --! \param   value         the result value to set.    
   --! \param   delay         the time to delay the change of the vector value.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   procedure SetResult( 
      signal vector_to_set : inout std_logic_vector;
             value         : in std_logic_vector;
             delay         : in delay_time
   ) is
      variable dont_care : std_logic_vector (vector_to_set'length-1 downto 0);
   begin
      AssertFailure( (vector_to_set'length = value'length), "SetResult",
                     "vectors have not the same size!" ); 
      
      for i in vector_to_set'range loop
          dont_care(i) := '-';
      end loop; -- vector_to_set'range
      vector_to_set <= dont_care after 0 fs, value after delay;
   end procedure SetResult;   
   
end package body TestResult_pkg;

------------------------------------------------------------------------------
-- end TestResult_pkg.vhd
------------------------------------------------------------------------------
