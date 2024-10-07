--------------------------------------------------------------------------------
-- Institut f�r Weltraumforschung (IWF)
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

--------------------------------------------------------------------------------
-- Package SpwRecvFront
--! \brief        SpwRecvFront - SpwRecvFront implementation.
--! \details      The package contains the SpwRecvFront implementation.
--! - Components
--! \li \ref      SpwRecvFront - SpaceWire receiver front-end with clock recovery.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwBlockRam_pkg is 

   component SpwBlockRam is 
      generic ( 
         ABITS : integer -- number of address bits.
      );
      port ( 
         RADDR  : in std_logic_vector (ABITS-1 downto 0);  --! read address.
         WADDR  : in std_logic_vector (ABITS-1 downto 0);  --! write address.
         WDATA  : in std_logic_vector (8 downto 0);  --! write data.
         WEN    : in std_logic;                            --! write enable.
         CLK   : in std_logic;                            --! read clock.
         RDATA  : out std_logic_vector (8 downto 0)  --! read data.
      );
   end component SpwBlockRam;

end package SpwBlockRam_pkg;

--------------------------------------------------------------------------------
-- end SpwRecvFront_pkg.vhd
--------------------------------------------------------------------------------
