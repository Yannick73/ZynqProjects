--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwProtocol_pkg.vhd
--!
--! \brief        spwip protocol definitions.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 02.10.2017
--! \date         Updated: 02.10.2017
--! \version      V 1.00
--
-- Package      : SpwProtocol (declaration | declaration, body)
-- File version : $Revision: 112 $
--
-- Limitations  : None known
-- Errors       : None known
--
-- Copyright 2021 IWF
-- 
-- This file is part of SpaceWire Light.
--
-- SpaceWire Light is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- SpaceWire Light is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with SpaceWire Light.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------
-- History
--
-- $Log$
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
--! standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Package SpwProtocol
--! \brief        SpwProtocol - SpW unit internal record type definitions.
--! \details      The package contains record type definitions for the spacewire 
--!               IP core.
--! - Types
--! \li \ref      spw_link_in_type - Input signals to spwlink.
--! \li \ref      spw_link_out_type - Output signals from spwlink.
--! \li \ref      spw_recv_out_type - Output signals from spwrecv to spwlink.
--! \li \ref      spw_xmit_in_type - Input signals to spwxmit from spwlink.
--! \li \ref      spw_xmit_out_type - Output signals from spwxmit to spwlink.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwProtocol_pkg is 

   -----------------------------------------------------------------------------
   -- Type spw_link_in_type
   --! \brief        Input signals to spwlink.
   --! \details      The type contains the input signals to spwlink unit.
   -----------------------------------------------------------------------------
   type spw_link_in_type is record 
      autostart : std_logic; --! Enables automatic link start on receipt of a NULL character.
      linkstart : std_logic; --! Enables link start once the Ready state is reached.
      linkdis   : std_logic; --! Do not start link (overrides "linkstart" and "autostart").
      rxroom    : std_logic_vector (5 downto 0); --! Number of bytes available in the receive buffer.
      tick_in   : std_logic; --! High for one clock cycle to request transmission of a TimeCode.
      ctrl_in   : std_logic_vector (1 downto 0); --! Control bits of the TimeCode to be sent.
      time_in   : std_logic_vector (5 downto 0); --! Counter value of the TimeCode to be sent.
      txwrite   : std_logic; --! Requests transmission of an N-Char.
      txflag    : std_logic; --! Control flag to be sent with the next N-Char.
      txdata    : std_logic_vector (7 downto 0); --! Byte to be sent, or X"00" for EOP or X"01" for EEP.
   end record spw_link_in_type;

   -----------------------------------------------------------------------------
   -- Type spw_link_out_type
   --! \brief        Output signals from spwlink.
   --! \details      The type contains the output signals from spwlink unit.
   -----------------------------------------------------------------------------
   type spw_link_out_type is record 
      started    : std_logic; --! High if the link state machine is currently in state Started.
      connecting : std_logic; --! High if the link state machine is currently in state Connecting.
      running    : std_logic; --! High if the link state machine is currently in state Run.
      errdisc    : std_logic; --! Disconnect detected in state Run. Triggers a reset and reconnect.
      errpar     : std_logic; --! Parity error detected in state Run. Triggers a reset and reconnect.
      erresc     : std_logic; --! Invalid escape sequence detected in state Run.
      errcred    : std_logic; --! Credit error detected. Triggers a reset and reconnect.
      txack      : std_logic; --! High to confirm the transmission of an N-Char.
      tick_out   : std_logic; --! High for one clock cycle if a TimeCode was just received.
      ctrl_out   : std_logic_vector (1 downto 0); --! Control bits of last received TimeCode.
      time_out   : std_logic_vector (5 downto 0); --! Counter value of last received TimeCode.
      rxchar     : std_logic; --! High for one clock cycle if an N-Char (data byte or EOP or EEP) was just received.
      rxflag     : std_logic; --! High if the received character is EOP or EEP, low if it is a data byte.
      rxdata     : std_logic_vector (7 downto 0); --! Received byte, or X"00" for EOP or X"01" for EEP.
   end record spw_link_out_type;

   -----------------------------------------------------------------------------
   -- Type spw_recv_out_type
   --! \brief        Output signals from spwrecv to spwlink.
   --! \details      The type contains the output signals from spwrecv to 
   --!               spwlink.
   -----------------------------------------------------------------------------
   type spw_recv_out_type is record 
      gotnull  : std_logic; --! High if at least one valid NULL pattern was detected since enable.
      gotfct   : std_logic; --! High for one clock cycle if an FCT token was just received.
      tick_out : std_logic; --! High for one clock cycle if a TimeCode was just received.
      ctrl_out : std_logic_vector (1 downto 0); --! Control bits of last received TimeCode.
      time_out : std_logic_vector (5 downto 0); --! Counter value of last received TimeCode.
      rxchar   : std_logic; --! High for one clock cycle if an N-Char (data byte or EOP/EEP) was just received.
      rxflag   : std_logic; --! High if rxchar is high and the received character is EOP or EEP.
      rxdata   : std_logic_vector (7 downto 0); --! Received byte, or X"00" for EOP or X"01" for EEP.
      errdisc  : std_logic; --! Disconnect detected (after a signal change was seen).
      errpar   : std_logic; --! Parity error detected (after a valid NULL pattern was seen).
      erresc   : std_logic; --! Escape sequence error detected (after a valid NULL pattern was seen).
   end record spw_recv_out_type;

   -----------------------------------------------------------------------------
   -- Type spw_xmit_in_type
   --! \brief        Input signals to spwxmit from spwlink.
   --! \details      The type contains the input signals to spwxmit from 
   --!               spwlink.
   -----------------------------------------------------------------------------
   type spw_xmit_in_type is record 
      txen    : std_logic; --! High to enable transmitter; low to disable and reset transmitter.
      stnull  : std_logic; --! Indicates that only NULL characters may be transmitted.
      stfct   : std_logic; --! Indicates that only NULL and/or FCT characters may be transmitted.
      fct_in  : std_logic; --! Requests transmission of an FCT character.
      tick_in : std_logic; --! High for one clock cycle to request transmission of a TimeCode.
      ctrl_in : std_logic_vector (1 downto 0); --! Control bits of the TimeCode to be sent.
      time_in : std_logic_vector (5 downto 0); --! Counter value of the TimeCode to be sent.
      txwrite : std_logic; --! Request transmission of an N-Char.
      txflag  : std_logic; --! Control flag to be sent with the next N-Char.
      txdata  : std_logic_vector (7 downto 0); --! Byte to send, or X"00" for EOP or X"01" for EEP.
   end record spw_xmit_in_type;

   -----------------------------------------------------------------------------
   -- Type spw_xmit_out_type
   --! \brief        Output signals from spwxmit to spwlink.
   --! \details      The type contain the output signals from spwxmit to 
   --!               spwlink.
   -----------------------------------------------------------------------------
   type spw_xmit_out_type is record 
      fctack : std_logic; --! High to confirm transmission on an FCT character.
      txack  : std_logic; --! High to confirm transmission of an N-Char.
   end record spw_xmit_out_type;

end package SpwProtocol_pkg;

--------------------------------------------------------------------------------
-- end SpwProtocol_pkg.vhd
--------------------------------------------------------------------------------
