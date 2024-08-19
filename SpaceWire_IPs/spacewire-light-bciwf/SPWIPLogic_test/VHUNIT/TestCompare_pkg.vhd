--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TestCompare_pkg.vhd
--!
--! \brief        Package with compare functions for VHUNIT project.
--!
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 02.05.2006
--! \date         Updated: 31.01.2007
--! \version      V 1.00
--
-- Package      : TestCompare_pkg (declaration, body)
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


--! VHUNIT test library
library VHUNIT;
--! VHUNIT assert package
use VHUNIT.Assert_pkg.all;


--------------------------------------------------------------------------------
-- Package TestCompare_pkg
--! \brief        TestCompare_pkg  - Compare function package for VHUNIT
--!               project.
--! \details      Implements functions and procedures to compare signal values.
--!               
--! - Functions
--! \li \ref   IsComparable - Compare two signals.
--! \li \ref   IsComparableVector - Compare two vectors with same size.
--
-- Comments :
-- 
-- Updates  :
-- 
--------------------------------------------------------------------------------
package TestCompare_pkg is

   -----------------------------------------------------------------------------
   -- Function IsComparable
   --! \brief  Function that compares two signals.
   -----------------------------------------------------------------------------
   function IsComparable( 
      compare  : std_logic;
      expected : std_ulogic
   ) return boolean;

   -----------------------------------------------------------------------------
   -- Function IsComparableVector
   --! \brief  Function that compares two signal vectors with same size.
   -----------------------------------------------------------------------------
   function IsComparableVector( 
      compare  : std_logic_vector;
      expected : std_ulogic_vector
   ) return boolean;

end package TestCompare_pkg;

--------------------------------------------------------------------------------
-- Body TestCompare_pkg
--! \brief  Test Compare package implementation.
--------------------------------------------------------------------------------
package body TestCompare_pkg is
   
   ---------------------------------------------------------------------------
   -- Internal constants and variables
   ---------------------------------------------------------------------------
   --! type definition of COMPARE_RESULT_TABLE
   type COMPARE_RESULT_TABLE is array (std_logic,std_ulogic) of boolean;

   ---------------------------------------------------------------------------
   --! compare table for decision.
   --! The compare table are used from the WAVES_1164_Utilities package.
   ---------------------------------------------------------------------------
   constant tbl_compare_result: COMPARE_RESULT_TABLE := 
   -- -------------------------------------------------------------------------------
   -- |    U      X      0      1      Z      W      L      H      -   | exp / comp  |
   -- -------------------------------------------------------------------------------
      (( true , false, false, false, false, false, false, false, true ),  -- |   U   |
       ( true , true , false, false, false, false, false, false, true ),  -- |   X   |
       ( true , true , true , false, false, false, false, false, true ),  -- |   0   |
       ( true , true , false, true , false, false, false, false, true ),  -- |   1   |
       ( true , false, false, false, true , false, false, false, true ),  -- |   Z   |
       ( true , false, false, false, false, true , false, false, true ),  -- |   W   |
       ( true , false, false, false, false, true , true , false, true ),  -- |   L   |
       ( true , false, false, false, false, true , false, true , true ),  -- |   H   |
       ( true , false, false, false, false, false, false, false, true )); -- |   -   |


   -----------------------------------------------------------------------------
   -- Function IsComparable
   --! \brief        IsComparable  - Compares two signals.
   --! \details      The function compares two signals and use the the compare 
   --!               result table as decision base.
   --! \param        compare   the signal to compare.
   --! \param        expected  the signal to compare to.
   --! \return       True if it is comparable, false if not.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------   
   function IsComparable( 
      compare  : std_logic;
      expected : std_ulogic
   ) return boolean is
   begin
      return tbl_compare_result(compare,expected);
   end function IsComparable;

   -----------------------------------------------------------------------------
   -- Function IsComparableVector
   --! \brief       IsComparableVector  - Compare two vectors with same size.
   --! \details     The function compares two vectors and use the the compare 
   --!              result table as decision base. If the vectors have different
   --!              sizes an assertion is executed.
   --! \param       compare   the signal vector to compare.
   --! \param       expected  the signal vector to compare to.
   --! \return      True if it is comparable, false if not.
   -- Comments     : 
   --                
   -----------------------------------------------------------------------------
   function IsComparableVector( 
      compare  : std_logic_vector;
      expected : std_ulogic_vector
   ) return boolean is
      variable result: boolean := true;
   begin
      AssertFailure( (compare'length = expected'length), "IsComparableVector",
                     "vectors have not the same size!" );
   
      for i in compare'range loop
          result := result and tbl_compare_result(compare(i),expected(i));
      end loop; -- compare'range
      return result;
   end function IsComparableVector;

end package body TestCompare_pkg;

------------------------------------------------------------------------------
-- end TestCompare_pkg.vhd
------------------------------------------------------------------------------
