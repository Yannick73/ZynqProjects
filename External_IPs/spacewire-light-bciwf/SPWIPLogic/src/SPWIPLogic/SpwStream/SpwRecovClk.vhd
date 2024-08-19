--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRecovClk.vhd
--!
--! \brief        implementation of the SpwRecovClk unit
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.02.2017
--! \date         Updated: 02.10.2017
--! \version      V 1.00
--
-- Unit         : SpwRecovClk (RTL|STR) (entity, architecture)
-- File version : $Revision: 111 $
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

--! work library
library SPWIP;
--! SPWIP mapped module definitions.
use SPWIP.ModuleMap_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwRecovClk
--! \brief        SpwRecovClk - SpaceWire clock recovery from SI and DI signals.
--! \details      This unit recover the clock from data and strobe signals.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
entity SpwRecovClk is 
   port ( 
      SPW_DI : in std_logic;  --! Data In SpaceWire signal.
      SPW_SI : in std_logic;  --! Strobe In SpaceWire signal.
      RXCLK  : out std_logic  --! Recovered clock out.
   );
end entity SpwRecovClk;

--------------------------------------------------------------------------------
-- Architecture SpwRecovClk_str
--! \brief  SpaceWire clock recovery structural implementation
--------------------------------------------------------------------------------
architecture SpwRecovClk_str of SpwRecovClk is 
   signal rxclk_int : std_logic; --! internal rxclk signal before clock buffer.
begin

   ----------------------------------------------------------------------
   -- Component instance
   ----------------------------------------------------------------------
   -- RXCLKBUF
   RXCLKBUF: CLKDriver
      port map (
         -- Inputs
         A => rxclk_int,
         -- Outputs
         Y => RXCLK
      );

   -----------------------------------------------------------------------------
   -- UPDATE
   -- Recovered clock.
   rxclk_int <= SPW_DI xor SPW_SI;

end architecture SpwRecovClk_str;

--------------------------------------------------------------------------------
-- end SpwRecovClk.vhd
--------------------------------------------------------------------------------
