--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         Assert_pkg.vhd
--!
--! \brief        Package with different assert and debug functions for the
--!               VHUNIT project.
--! \author       Ottacher Harald  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 11.05.2006
--! \date         Updated: 07.06.2011
--! \version      V 1.00
--
-- Package      : Assert_pkg (declaration, body)
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


--------------------------------------------------------------------------------
-- Package Assert_pkg
--! \brief        Assert_pkg  - Assert utilities package for VHUNIT project.
--! \details      Implements functions and procedures for assert and debug 
--!               purposes.
--!
--! - Procedures
--! \li \ref AssertFailure  - Throw an assert and display the function name 
--!                           and message.
--! \li \ref Message        - Display a message at the simulator output. 
--! \li \ref TimeTagMessage - Display a message at the simulator output with the
--!                           current simulator time.
-- Comments :
--
-- Updates :
--
--------------------------------------------------------------------------------
package Assert_pkg is
   
   ----------------------------------------------------------------------------
   -- Procedure AssertFailure
   --! \brief  Throw an assert and display the function name and message.
   ----------------------------------------------------------------------------
   procedure AssertFailure(
      expresion     : boolean;
      function_name : string;
      message       : string
   );

   ----------------------------------------------------------------------------
   -- Procedure Message
   --! \brief  Display a message at the simulator output. 
   ----------------------------------------------------------------------------
   procedure Message(
      message : string
   );
   
   ----------------------------------------------------------------------------
   -- Procedure TimeTagMessage
   --! \brief  Display a message at the simulator output with the current 
   --!         simulator time.
   ----------------------------------------------------------------------------
   procedure TimeTagMessage(
      message : string
   );
  
end package Assert_pkg;

------------------------------------------------------------------------------
-- Body Assert_pkg
--! \brief  Assert package implementation.
------------------------------------------------------------------------------
package body Assert_pkg is

   -----------------------------------------------------------------------------
   -- Procedure AssertFailure
   --! \brief       AssertFailure  - Throw an assert and display the function 
   --!              name and message.
   --! \details     The procedure throws an assert if the expresion is false. 
   --!              In this case an error report with function name and defined 
   --!              message is displayed.
   --! \param       expresion  the expresion to evaluate. 
   --! \param       function_name  the function name where the assert is used.
   --! \param       message  the message to display.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure AssertFailure(
      expresion     : boolean;
      function_name : string;
      message       : string
   ) is
   begin
      assert expresion
         report function_name & " : " & message
         severity failure;
      return;
   end AssertFailure;
   
   -----------------------------------------------------------------------------
   -- Procedure Message
   --! \brief        Message  - Display a message at the simulator output.
   --! \details      The procedure displays the message at the simulator output.
   --! \param        message  message to display.
   -- Comments     : adapted from Stevfn Doll, txt_util_pkg
   --
   -----------------------------------------------------------------------------
   procedure Message(
      message : string
   ) is
      variable output_line: line;
   begin
      write(output_line, message);
      writeline(output, output_line);
   end Message;
   
   -----------------------------------------------------------------------------
   -- Procedure TimeTagMessage
   --! \brief        TimeTagMessage  - Display a message at the simulator output with 
   --!               the current simulator time.
   --! \details      The procedure displays the message at the simulator output. 
   --!               The current simulator time is added to the message.
   --! \param        message  message to display.
   -- Comments     :
   --
   -----------------------------------------------------------------------------
   procedure TimeTagMessage(
      message : string
   ) is
      variable output_line: line;
   begin
      write(output_line, NOW);
      write(output_line, string'(" | "));
      write(output_line, message);
      writeline(output, output_line);
   end TimeTagMessage;
   
end package body Assert_pkg;

--------------------------------------------------------------------------------
-- end Assert_pkg.vhd
--------------------------------------------------------------------------------
