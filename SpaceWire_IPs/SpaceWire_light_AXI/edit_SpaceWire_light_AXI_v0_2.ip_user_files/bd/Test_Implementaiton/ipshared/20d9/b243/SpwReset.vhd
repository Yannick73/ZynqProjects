--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwReset.vhd
--!
--! \brief        Reset logic with asynchronous assert and synchronous de-assert.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 24.02.2017
--! \date         Updated: 03.10.2017
--! \version      V 1.00
--
-- Unit         : SpwReset (RTL|STR) (entity, architecture)
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

--------------------------------------------------------------------------------
-- Entity SpwReset
--! \brief        SpwReset - Reset logic with asynchronous assert, synchronous 
--!               de-assert.
--! \details      The unit is used to generate the reset logic.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
entity SpwReset is 
   generic ( 
      RESET_LATENCY : integer range 1 to 64 := 4  --! latency (in clk cycles) of reset after ARST_N de-assert.
   );
   port ( 
      CLK    : in  std_logic; --! unit clock (target clock domain).
      ARST_N : in std_logic;  --! asynchronous reset (active-low).
      SRST_N : out std_logic  --! output reset, synchronous de-assert (active-low).
   );
end entity SpwReset;

--------------------------------------------------------------------------------
-- Architecture SpwReset_rtl
--! \brief  Reset logic RTL implementation.
--------------------------------------------------------------------------------
architecture SpwReset_rtl of SpwReset is 
   signal reset_reg : std_logic_vector (RESET_LATENCY-1 downto 0); --! reset shift register.
begin
   -----------------------------------------------------------------------------
   -- UPDATE
   -- the LSB of reset_reg drives the output
   SRST_N <= reset_reg(0);

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        sequential process of the SpwReset unit.
   --! \details      The process implements the reset logic.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK    - unit clock (rising edge).
   --! \arg \ref     ARST_N - unit reset (active-low).
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, ARST_N )
   begin
      if ( ARST_N = '0' ) then
         -- asynchronous preset
         reset_reg <= (others => '0');
      elsif ( rising_edge(CLK) ) then
         reset_reg <= '1' & reset_reg(RESET_LATENCY-1 downto 1);
      end if; -- rising_edge(CLK)
   end process updateRegs;

end architecture SpwReset_rtl;

--------------------------------------------------------------------------------
-- end SpwReset.vhd
--------------------------------------------------------------------------------
