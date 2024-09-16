--------------------------------------------------------------------------------
-- Institut f�r Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         ModuleMap_pkg.vhd
--!
--! \brief        Technology mapped module definitions for PROASIC3E.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at 
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 27.11.2017
--! \date         Updated: 08.08.2018
--! \version      V 1.00
--
-- Package      : ModuleMap (declaration | declaration, body)
-- File version : $Revision: 38 $
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
-- Package ModuleMap
--! \brief        ModuleMap - mapped module definitions.
--! \details      The package contains module definitions, which are mapped to 
--!               FPGA modules.
--!               This is the Version for PROASIC3E FPGA.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.08
-- Updates      : 
--------------------------------------------------------------------------------
package ModuleMap_pkg is 
   
   -----------------------------------------------------------------------------
   -- CLKDriver 
   -----------------------------------------------------------------------------	
   component CLKDriver 
      port (A : in std_logic; Y : out std_logic); 
   end component CLKDriver;
   
   -----------------------------------------------------------------------------
   -- Driver 
   -----------------------------------------------------------------------------	
   component Driver 
      port (A : in std_logic; Y : out std_logic); 
   end component Driver;
   
end package ModuleMap_pkg;
  
--------------------------------------------------------------------------------
-- Behavioural models
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Macro instantiations
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;  

--library proasic3e;
--use proasic3e.all;
--------------------------------------------------------------------------------
-- Entity CLKDriver
--! \brief        CLKDriver - ACTEL internal CLK driver.
--! \details      Internal clock/high fanout net driver.
--------------------------------------------------------------------------------
entity CLKDriver is
   port (
      A : in std_logic; --! internal signal connection
      Y : out std_logic --! internal clock net connection
   );
end entity CLKDriver; 
--------------------------------------------------------------------------------
-- Architecture CLKDriver_str
--! \brief  instantiation of the internal CLK driver.
--------------------------------------------------------------------------------
architecture CLKDriver_str of CLKDriver is 
begin     
   Y <= A; 
end architecture CLKDriver_str;   

--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;  

--library proasic3e;
--use proasic3e.all;
--------------------------------------------------------------------------------
-- Entity Driver
--! \brief        Driver - ACTEL internal signal driver.
--! \details      Internal signal driver.
--------------------------------------------------------------------------------
entity Driver is
   port (
      A : in std_logic; --! internal signal connection
      Y : out std_logic --! internal buffered signal connection
   );
end entity Driver; 
--------------------------------------------------------------------------------
-- Architecture Driver_str
--! \brief  instantiation of the normal Driver.
--------------------------------------------------------------------------------
architecture Driver_str of Driver is   
begin
   Y <= A;
end architecture Driver_str;   

--------------------------------------------------------------------------------
-- end ModuleMap_pkg.vhd
--------------------------------------------------------------------------------
