--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRam.vhd
--!
--! \brief        Synchronous two-port RAM.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \author       Yannick Dzubba  (YDZ)
--! \date         Created: 06.06.2010
--! \date         Updated: 02.10.2017
--! \date         Updated: 11.09.2024
--! \version      V 2.0
--
-- Unit         : SpwRam (RTL|STR) (entity, architecture)
-- File version : $Revision: 111 $
--
-- Limitations  : None known
-- Errors       : None known
--
-- Copyright 2009-2013 Joris van Rantwijk
-- Copyright 2021 IWF
-- Copyright 2024 IRS
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
--  Synchronous two-port RAM with separate clocks for read and write ports.
--
--  Removed the data clear mode, so Vivado infers this as block RAM
--
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

--! IEEE standard numeric package
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity SpwRam
--! \brief        SpwRam - Synchronous two-port RAM.
--! \details      This unit describes a generic synchronous two-port RAM with 
--!               two independent clocks.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : V 1.01 JTO 05.03.2019 - remove data output register to solve problem with res_seq.txdiscard flag in SpwStream
--------------------------------------------------------------------------------
entity SpwBlockRam is 
   generic ( 
      ABITS : integer --! number of address bits.
   );
   port ( 
      RADDR  : in std_logic_vector (ABITS-1 downto 0);  --! read address.
      WADDR  : in std_logic_vector (ABITS-1 downto 0);  --! write address.
      WDATA  : in std_logic_vector (8 downto 0);  --! write data.
      WEN    : in std_logic;                            --! write enable.
      CLK   : in std_logic;                            --! read clock.
      RDATA  : out std_logic_vector (8 downto 0)  --! read data.
   );
end entity SpwBlockRam;

--------------------------------------------------------------------------------
-- Architecture SpwRam_rtl
--! \brief  RTL implementation of a generic synchronous two-port RAM.
--------------------------------------------------------------------------------
architecture SpwBlockRam_rtl of SpwBlockRam is 
   -----------------------------------------------------------------------------
   -- spwram_definitions - contains the constants, types and subtypes used in the SpwRam unit.
   -----------------------------------------------------------------------------
   type mem_type is array(integer range <>) of std_logic_vector(8 downto 0);
   signal s_mem : mem_type (0 to (2**ABITS - 1)) := (others => (others => '0')); --! memory described as an array of std_logic_vector.
   signal raddr_buf : std_logic_vector(ABITS - 1 downto 0) := (others => '0');
   
--    -----------------------------------------------------------------------------
--    -- Component SpwBlockRam
--    --! \brief  Synchronous two-port RAM.
--    -----------------------------------------------------------------------------
--    component SpwBlockRam is 
--      generic ( 
--         ABITS : integer -- number of address bits.
--      );
--      port ( 
--         RADDR  : in std_logic_vector (ABITS-1 downto 0);  --! read address.
--         WADDR  : in std_logic_vector (ABITS-1 downto 0);  --! write address.
--         WDATA  : in std_logic_vector (8 downto 0);  --! write data.
--         WEN    : in std_logic;                            --! write enable.
--         CLK   : in std_logic;                            --! read clock.
--         RDATA  : out std_logic_vector (8 downto 0)  --! read data.
--      );
--    end component SpwBlockRam;

begin
   -----------------------------------------------------------------------------
   -- READ
    RDATA <= s_mem(to_integer(unsigned(raddr_buf)));

   -----------------------------------------------------------------------------
   -- Process write
   --! \brief        Write operation.
   --! \details      The process models the write operation.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     WCLK   - start the function (rising edge).
   --! \arg \ref     WRST_N - write clock domain reset (active-low).
   -----------------------------------------------------------------------------
   process( CLK )
   begin
      if ( rising_edge(CLK) ) then
         if ( WEN = '1' ) then
            s_mem(to_integer(unsigned(WADDR))) <= WDATA;
         end if; -- WEN
         raddr_buf <= RADDR;
      end if; -- rising_edge(WCLK)

   end process;

end architecture SpwBlockRam_rtl;

--------------------------------------------------------------------------------
-- end SpwRam.vhd
--------------------------------------------------------------------------------
