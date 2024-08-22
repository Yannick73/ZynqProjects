----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2024 22:44:17
-- Design Name: 
-- Module Name: default_spw - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--! IEEE standard numeric package
use ieee.numeric_std.all;

--! work library
library SPWIP;
use SPWIP.SpwStream.all;

entity default_spw is
    port ( 
      AUTOSTART   : in std_logic;                      --! Enables automatic link start on receipt of a NULL character.
      LINKSTART   : in std_logic;                      --! Enables link start once the Ready state is reached.
      LINKDIS     : in std_logic;                      --! Do not start link (overrides LINKSTART and AUTOSTART) and/or disconnect a running link.
      TXDIVCNT    : in std_logic_vector (7 downto 0);  --! Scaling factor minus 1, used to scale the transmit base clock into the transmission bit rate.
      TICK_IN     : in std_logic;                      --! High for one clock cycle to request transmission of a TimeCode.
      CTRL_IN     : in std_logic_vector (1 downto 0);  --! Control bits of the TimeCode to be sent.
      TIME_IN     : in std_logic_vector (5 downto 0);  --! Counter value of the TimeCode to be sent.
      TXWRITE     : in std_logic;                      --! Pulled high by the application to write an N-Char to the transmit queue.
      TXFLAG      : in std_logic;                      --! Control flag to be sent with the next N_Char.
      TXDATA      : in std_logic_vector (7 downto 0);  --! Byte to be sent, or X"00" for EOP or X"01" for EEP.
      RXREAD      : in std_logic;                      --! Pulled high by the application to accept a received character.
      SPW_DI      : in std_logic;                      --! Data In SpaceWire signal.
      SPW_SI      : in std_logic;                      --! Strobe In SpaceWire signal.
      CLK         : in std_logic;                      --! System clock.
      TXCLK       : in std_logic;                      --! Transmit clock (only for impl_fast).
      ARST_N      : in std_logic;                      --! asynchronous reset (active-low).
      CNT_RST     : in std_logic;                      --! Counters reset.
      TXRDY       : out std_logic;                     --! High if the entity is ready to accept an N-Char for transmission.
      TXHALFF     : out std_logic;                     --! High if the transmission queue is at least half full.
      TICK_OUT    : out std_logic;                     --! High for one clock cycle if a TimeCode was just received.
      CTRL_OUT    : out std_logic_vector (1 downto 0); --! Control bits of the last received TimeCode.
      TIME_OUT    : out std_logic_vector (5 downto 0); --! Counter value of the last received TimeCode.
      RXVALID     : out std_logic;                     --! High if "RXFLAG" and "RXDATA" contain valid data.
      RXHALFF     : out std_logic;                     --! High if the receive FIFO is at least half full.
      RXFLAG      : out std_logic;                     --! High if the rx character is EOP or EEP; low if the rx character is a data byte.
      RXDATA      : out std_logic_vector (7 downto 0); --! Received byte, or X"00" for EOP or X"01" for EEP.
      STARTED     : out std_logic;                     --! High if the link state machine is currently in the Started state.
      CONNECTING  : out std_logic;                     --! High if the link state machine is currently in the Connecting state.
      RUNNING     : out std_logic;                     --! High if the link state machine is currently in the Run state.
      ERRDISC_CNT : out std_logic_vector (7 downto 0); --! Disconnect error counter.
      ERRPAR_CNT  : out std_logic_vector (7 downto 0); --! Parity error counter.
      ERRESC_CNT  : out std_logic_vector (7 downto 0); --! Escape error counter.
      ERRCRED_CNT : out std_logic_vector (7 downto 0); --! Credit error counter.
      EMPTY_CNT   : out std_logic_vector (7 downto 0); --! Empty packet counter.
      SPW_DO      : out std_logic;                     --! Data Out SpaceWire signal.
      SPW_SO      : out std_logic                      --! Strobe Out SpaceWire signal.
   );
end default_spw;

architecture Behavioral of default_spw is
begin
    SpwDefault : SpwStream
    -- set parameters
    generic map (
        -- target core clock frequency of 100MHz
        SYSFREQ  <= 100*1e6,
        -- low speed test
        RXIMPL <= impl_generic,   
        TXIMPL <= impl_generic,
        -- as defined by document for impl_generic
        RXCHUNK <= 1,
        -- default of the doc
        RXFIFOSIZE_BITS <= 11,
        TXFIFOSIZE_BITS <= 11
    )
    port map ( 
          AUTOSTART,
          LINKSTART,
          LINKDIS,
          TXDIVCNT,
          TICK_IN,
          CTRL_IN,
          TIME_IN,
          TXWRITE,
          TXFLAG,
          TXDATA,
          RXREAD,
          SPW_DI,
          SPW_SI,
          CLK,
          TXCLK,
          ARST_N,
          CNT_RST,
          TXRDY,
          TXHALFF,
          TICK_OUT,
          CTRL_OUT,
          TIME_OUT,
          RXVALID,
          RXHALFF,
          RXFLAG,
          RXDATA,
          STARTED,
          CONNECTING,
          RUNNING,
          ERRDISC_CNT,
          ERRPAR_CNT,
          ERRESC_CNT,
          ERRCRED_CNT,
          EMPTY_CNT,
          SPW_DO,
          SPW_SO
       );


end Behavioral;
