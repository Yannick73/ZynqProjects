--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwXmit_fast_pkg.vhd
--!
--! \brief        SpwXmit_fast definitions.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 03.10.2017
--! \date         Updated: 03.10.2017
--! \version      V 1.00
--
-- Package      : SpwXmit_fast (declaration | declaration, body)
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
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;

--------------------------------------------------------------------------------
-- Package SpwXmit_fast
--! \brief        SpwXmit_fast - SpwXmit_fast implementation.
--! \details      The package contains the SpwXmit_fast implementation.
--! - Components
--! \li \ref      SpwXmit_fast - SpaceWire Transmitter using an independent transmission clock.
--! \li \ref      SyncDff - Double flip-flop synchronizer.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwXmit_fast_pkg is 

   -----------------------------------------------------------------------------
   -- Component SpwXmit_fast
   --! \brief  SpaceWire Transmitter using an independent transmission clock.
   -----------------------------------------------------------------------------
   component SpwXmit_fast is 
      port ( 
         DIVCNT   : in  std_logic_vector (7 downto 0); -- The transmit clock is divided by (unsigned(DIVCNT) + 1).
         XMITI    : in  spw_xmit_in_type;              -- Input signals from spwlink.
         CLK      : in  std_logic;                     -- unit clock.
         TXCLK    : in  std_logic;                     -- Transmit clock.
         RST_N    : in  std_logic;                     -- unit reset (active-low).
         TX_RST_N : in  std_logic;                     -- tx clock domain reset (active-low).
         XMITO    : out spw_xmit_out_type;             -- Output signals to spwlink.
         SPW_DO   : out std_logic;                     -- Data Out SpaceWire signal.
         SPW_SO   : out std_logic                      -- Strobe Out SpaceWire signal.
      );
   end component SpwXmit_fast;

   -----------------------------------------------------------------------------
   -- Component SyncDff
   --! \brief  Double flip-flop synchronizer.
   -----------------------------------------------------------------------------
   component SyncDff is 
      port ( 
         DI    : in  std_logic; -- input data.
         CLK   : in  std_logic; -- unit clock (destination clock domain).
         RST_N : in  std_logic; -- unit reset (active-low).
         DO    : out std_logic  -- output data.
      );
   end component SyncDff;

end package SpwXmit_fast_pkg;

--------------------------------------------------------------------------------
-- end SpwXmit_fast_pkg.vhd
--------------------------------------------------------------------------------
