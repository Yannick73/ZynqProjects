--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SyncDff.vhd
--!
--! \brief        Double flip-flop synchronizer.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.06.2010
--! \date         Updated: 03.10.2017
--! \version      V 1.00
--
-- Unit         : SyncDff (RTL|STR) (entity, architecture)
-- File version : $Revision: 111 $
--
-- Limitations  : None known
-- Errors       : None known
--
-- Copyright 2009-2013 Joris van Rantwijk
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
--  Adapted to IWF coding guidelines by Jorge Tonfat (JTO) jorge.tonfat@oeaw.ac.at
--
--  Double flip-flop synchronizer.
--
--  This entity is used to safely capture asynchronous signals.
--
--  An implementation may assign additional constraints to this entity
--  in order to reduce the probability of meta-stability issues.
--  For example, an extra tight timing constraint could be placed on
--  the data path from syncdff_ff1 to syncdff_ff2 to ensure that
--  meta-stability of ff1 is resolved before ff2 captures the signal.
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
-- Entity SyncDff
--! \brief        SyncDff - Double flip-flop synchronizer.
--! \details      The unit is used to safely capture asynchronous signals.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
entity SyncDff is 
   port ( 
      DI    : in  std_logic; --! input data.
      CLK   : in  std_logic; --! unit clock (destination clock domain).
      RST_N : in  std_logic; --! unit reset (active-low).
      DO    : out std_logic  --! output data.
   );
   ---- Turn off register replication in XST.
   --attribute REGISTER_DUPLICATION: string;
   --attribute REGISTER_DUPLICATION of syncdff: entity is "NO";
end entity SyncDff;

--------------------------------------------------------------------------------
-- Architecture SyncDff_rtl
--! \brief  Sync Dff RTL implementation
--------------------------------------------------------------------------------
architecture SyncDff_rtl of SyncDff is 
   signal syncdff_ff1 : std_ulogic; --! flip-flop stage 1.
   signal syncdff_ff2 : std_ulogic; --! flip-flop stage 2.
   ---- Turn of shift-register extraction in XST.
   --attribute SHIFT_EXTRACT: string;
   --attribute SHIFT_EXTRACT of syncdff_ff1: signal is "NO";
   --attribute SHIFT_EXTRACT of syncdff_ff2: signal is "NO";
   ---- Tell XST to place both flip-flops in the same slice.
   --attribute RLOC: string;
   --attribute RLOC of syncdff_ff1: signal is "X0Y0";
   --attribute RLOC of syncdff_ff2: signal is "X0Y0";
   ---- Tell XST to keep the flip-flop net names to be used in timing constraints.
   --attribute KEEP: string;
   --attribute KEEP of syncdff_ff1: signal is "SOFT";
   --attribute KEEP of syncdff_ff2: signal is "SOFT";
   -- TODO: Search for Microsemi attributes that can mimic this Xilinx attributes.
begin
   -----------------------------------------------------------------------------
   -- UPDATE
   -- second flip-flop drives the output signal
   DO <= syncdff_ff2;

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        sequential process of the SyncDff unit.
   --! \details      The process implements the flip-flop synchronizers.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK   - unit clock (rising edge).
   --! \arg \ref     RST_N - unit reset (active-low)
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, RST_N )
   begin
      if ( RST_N = '0' ) then
         -- asynchronous reset
         syncdff_ff1 <= '0';
         syncdff_ff2 <= '0';
      elsif ( rising_edge(CLK) ) then
         -- data synchronization
         syncdff_ff1 <= DI;
         syncdff_ff2 <= syncdff_ff1;
      end if; -- rising_edge(CLK)
   end process updateRegs;

end architecture SyncDff_rtl;

--------------------------------------------------------------------------------
-- end SyncDff.vhd
--------------------------------------------------------------------------------
