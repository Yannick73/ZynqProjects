--------------------------------------------------------------------------------
-- Institut f�r Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwStream_pkg.vhd
--!
--! \brief        SpwStream definitions.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 12.06.2017
--! \date         Updated: 21.01.2019
--! \version      V 1.00
--
-- Package      : SpwStream (declaration | declaration, body)
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
library SPWIP;
use SPWIP.SpwRegisters_pkg.spw_implementation_type;


--------------------------------------------------------------------------------
-- Package SpwStream
--! \brief        SpwStream - SpwStream implementation.
--! \details      The package contains the SpwStream implementation.
--! - Components
--! \li \ref      SpwStream - SpwStream is the top module for the Spacewire protocol IP.
--! \li \ref      SpwRam - Synchronous two-port RAM.
--! \li \ref      SpwReset - Reset logic with asynchronous assert, synchronous de-assert.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwStream_pkg is 

   -----------------------------------------------------------------------------
   -- Component SpwStream
   --! \brief  SpwStream is the top module for the Spacewire protocol IP.
   -----------------------------------------------------------------------------
   component SpwStream is 
     -- added missing generics
     generic (
          SYSFREQ           : real;                                         -- IP core clock
          TXCLKFREQ         : real;                                         -- transmit clock
          RXIMPL            : spw_implementation_type   := impl_recovclk;   -- receiver using core clock
          TXIMPL            : spw_implementation_type   := impl_fast;       -- receiver using core clock
          RXCHUNK           : integer range 1 to 6      := 1;               -- 1 in case of impl_generic
          RXFIFOSIZE_BITS   : integer range 6 to 16     := 11;              -- 11 bit RXFIFO adress space = 2kB FIFO
          TXFIFOSIZE_BITS   : integer range 2 to 16     := 11               -- 11 bit TXFIFO adress space = 2kB FIFO
     ); 
      port ( 
         AUTOSTART   : in std_logic;                      -- Enables automatic link start on receipt of a NULL character.
         LINKSTART   : in std_logic;                      -- Enables link start once the Ready state is reached.
         LINKDIS     : in std_logic;                      -- Do not start link (overrides LINKSTART and AUTOSTART) and/or disconnect a running link.
         TXDIVCNT    : in std_logic_vector (7 downto 0);  -- Scaling factor minus 1, used to scale the transmit base clock into the transmission bit rate.
         TICK_IN     : in std_logic;                      -- High for one clock cycle to request transmission of a TimeCode.
         CTRL_IN     : in std_logic_vector (1 downto 0);  -- Control bits of the TimeCode to be sent.
         TIME_IN     : in std_logic_vector (5 downto 0);  -- Counter value of the TimeCode to be sent.
         TXWRITE     : in std_logic;                      -- Pulled high by the application to write an N-Char to the transmit queue.
         TXFLAG      : in std_logic;                      -- Control flag to be sent with the next N_Char.
         TXDATA      : in std_logic_vector (7 downto 0);  -- Byte to be sent, or X"00" for EOP or X"01" for EEP.
         RXREAD      : in std_logic;                      -- Pulled high by the application to accept a received character.
         SPW_DI      : in std_logic;                      -- Data In SpaceWire signal.
         SPW_SI      : in std_logic;                      -- Strobe In SpaceWire signal.
         CLK         : in std_logic;                      -- System clock.
         TXCLK       : in std_logic;                      -- Transmit clock (only for impl_fast).
         ARST_N      : in std_logic;                      -- asynchronous reset (active-low).
         CNT_RST     : in std_logic;                      -- Counters reset.
         TXRDY       : out std_logic;                     -- High if the entity is ready to accept an N-Char for transmission.
         TXHALFF     : out std_logic;                     -- High if the transmission queue is at least half full.
         TICK_OUT    : out std_logic;                     -- High for one clock cycle if a TimeCode was just received.
         CTRL_OUT    : out std_logic_vector (1 downto 0); -- Control bits of the last received TimeCode.
         TIME_OUT    : out std_logic_vector (5 downto 0); -- Counter value of the last received TimeCode.
         RXVALID     : out std_logic;                     -- High if "RXFLAG" and "RXDATA" contain valid data.
         RXHALFF     : out std_logic;                     -- High if the receive FIFO is at least half full.
         RXFLAG      : out std_logic;                     -- High if the rx character is EOP or EEP; low if the rx character is a data byte.
         RXDATA      : out std_logic_vector (7 downto 0); -- Received byte, or X"00" for EOP or X"01" for EEP.
         STARTED     : out std_logic;                     -- High if the link state machine is currently in the Started state.
         CONNECTING  : out std_logic;                     -- High if the link state machine is currently in the Connecting state.
         RUNNING     : out std_logic;                     -- High if the link state machine is currently in the Run state.
         ERRDISC_CNT : out std_logic_vector (7 downto 0); -- Disconnect error counter.
         ERRPAR_CNT  : out std_logic_vector (7 downto 0); -- Parity error counter.
         ERRESC_CNT  : out std_logic_vector (7 downto 0); -- Escape error counter.
         ERRCRED_CNT : out std_logic_vector (7 downto 0); -- Credit error counter.
         EMPTY_CNT   : out std_logic_vector (7 downto 0); -- Empty packet counter.
         SPW_DO      : out std_logic;                     -- Data Out SpaceWire signal.
         SPW_SO      : out std_logic;                      -- Strobe Out SpaceWire signal.
         
         TXFIFOROOM  : out std_logic_vector (TXFIFOSIZE_BITS downto 0);
         RXFIFOROOM  : out std_logic_vector (RXFIFOSIZE_BITS downto 0)
      );
   end component SpwStream;

   -----------------------------------------------------------------------------
   -- Component SpwRam
   --! \brief  Synchronous two-port RAM.
   -----------------------------------------------------------------------------
   component SpwRam is 
      generic ( 
         ABITS : integer; -- number of address bits.
         DBITS : integer  -- number of data bits.
      );
      port ( 
         RADDR  : in std_logic_vector (ABITS-1 downto 0);  -- read address.
         REN    : in std_logic;                            -- read enable.
         WADDR  : in std_logic_vector (ABITS-1 downto 0);  -- write address.
         WDATA  : in std_logic_vector (DBITS-1 downto 0);  -- write data.
         WEN    : in std_logic;                            -- write enable.
         RCLK   : in std_logic;                            -- read clock.
         WCLK   : in std_logic;                            -- write clock.
         RRST_N : in std_logic;                            -- read clock syncd unit reset (active-low).
         WRST_N : in std_logic;                            -- write clock syncd unit reset (active-low).
         RDATA  : out std_logic_vector (DBITS-1 downto 0)  -- read data.
      );
   end component SpwRam;
   
   -----------------------------------------------------------------------------
   -- Component SpwBlockRam
   --! \brief  Synchronous two-port RAM.
   -----------------------------------------------------------------------------
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

   -----------------------------------------------------------------------------
   -- Component SpwReset
   --! \brief  Reset logic with asynchronous assert, synchronous de-assert.
   -----------------------------------------------------------------------------
   component SpwReset is 
      generic ( 
         RESET_LATENCY : integer range 1 to 64 := 4  -- latency (in clk cycles) of reset after ARST_N de-assert.
      );
      port ( 
         CLK    : in  std_logic; -- unit clock (target clock domain).
         ARST_N : in std_logic;  -- asynchronous reset (active-low).
         SRST_N : out std_logic  -- output reset, synchronous de-assert (active-low).
      );
   end component SpwReset;

end package SpwStream_pkg;

--------------------------------------------------------------------------------
-- end SpwStream_pkg.vhd
--------------------------------------------------------------------------------
