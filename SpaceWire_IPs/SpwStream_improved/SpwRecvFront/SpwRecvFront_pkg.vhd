--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRecvFront_pkg.vhd
--!
--! \brief        SpwRecvFront definitions.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 03.10.2017
--! \date         Updated: 03.10.2017
--! \version      V 1.00
--
-- Package      : SpwRecvFront (declaration | declaration, body)
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
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;

--------------------------------------------------------------------------------
-- Package SpwRecvFront
--! \brief        SpwRecvFront - SpwRecvFront implementation.
--! \details      The package contains the SpwRecvFront implementation.
--! - Components
--! \li \ref      SpwRecvFront - SpaceWire receiver front-end with clock recovery.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwRecvFront_pkg is 

   -----------------------------------------------------------------------------
   -- Component SpwRecvFront
   --! \brief  SpaceWire receiver front-end with clock recovery.
   -----------------------------------------------------------------------------
   component SpwRecvFront is 
      generic ( 
         RXCHUNK : integer range 1 to 6  -- maximum number of bits received per system clock.
      );
      port ( 
         SPW_SI   : in std_logic;                              -- Strobe In SpaceWire signal.
         SPW_DI   : in std_logic;                              -- Data In SpaceWire signal.
         CLK      : in std_logic;                              -- unit clock.
         RXCLK_IN : in std_logic;                              -- Recovered clock in (after clock buffer).
         RST_N    : in std_logic;                              -- unit reset (active-low).
         RXEN     : in std_logic;                              -- High to enable receiver; low to disable and reset receiver.
         INACT    : out std_logic;                             -- High if there has been recent activity on the input lines.
         INBVALID : out std_logic;                             -- High if inbits contains a valid group of received bits.
         INBITS   : out std_logic_vector (RXCHUNK-1 downto 0)  -- Received bits.
      );
   end component SpwRecvFront;

end package SpwRecvFront_pkg;

--------------------------------------------------------------------------------
-- end SpwRecvFront_pkg.vhd
--------------------------------------------------------------------------------
