----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2024 22:28:39
-- Design Name: 
-- Module Name: default_link - Behavioral
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

--! VHDL SPW IP library
library SPWIP;
--! VHDL SPW IP package
use SPWIP.SpwStream_pkg.all;
--! spw_implementation_type
use SPWIP.SpwRegisters_pkg.spw_implementation_type;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity default_link is
    Port (
        -- main SpaceWire bus 
        dmoci : inout STD_LOGIC;
        smoci : inout STD_LOGIC;
        dmico : inout STD_LOGIC;
        smico : inout STD_LOGIC;
        -- common device control
        rst : buffer std_logic;
        clk : buffer std_logic;
        -- master device control and status
        link_start : buffer std_logic;
        started : out std_logic;
        connecting : out std_logic;
        running : out std_logic
        );
    
end default_link;

architecture Behavioral of default_link is
begin
    -- Master of the SpaceWire test system
    SPW_Master : SpwStream
    -- set parameters
    generic map (
        -- target core clock frequency of 100MHz
        SYSFREQ  => 100.0*1e6,
        -- low speed test
        RXIMPL => impl_generic,   
        TXIMPL => impl_generic,
        -- as defined by document for impl_generic
        RXCHUNK => 1,
        -- default of the doc
        RXFIFOSIZE_BITS => 11,
        TXFIFOSIZE_BITS => 11
    )
    port map (
        -- Connect the wires to the main bus
        SPW_DO => dmoci,
        SPW_SO => smoci,
        SPW_DI => dmico,
        SPW_SI => smico,
        -- Connect the common device control
        ARST_N => rst,
        CLK => clk,
        -- Connect the master device control and status
        LINKSTART => link_start,
        STARTED => started,
        CONNECTING => connecting,
        RUNNING => running,
        -- connect the constants
        AUTOSTART => '0',
        LINKDIS => '0',
        TXDIVCNT => "00000000",
        TICK_IN => '0',
        CTRL_IN => "00",
        TIME_IN => "000000",
        TXWRITE => '0',
        TXFLAG => '0',
        TXDATA => "00000000",
        RXREAD => '0',
        TXCLK => '0',
        CNT_RST => '1'
    );
    
    -- Client of the SpaceWire test system
--    SPW_Client : SpwStream
--    generic map (
--        SYSFREQ  <= 100.0*1e6,
--        RXIMPL <= impl_generic,   
--        TXIMPL <= impl_generic,
--        RXCHUNK <= 1,
--        RXFIFOSIZE_BITS <= 11,
--        TXFIFOSIZE_BITS <= 11
--    )
--    -- Connect the wires to the main bus
--    port map (
--        SPW_DO <= dmoci,
--        SPW_SO <= smoci,
--        SPW_DI => dmico,
--        SPW_SI => smico,
--        ARST_N <= rst,
--        CLK <= clk
--    );
    
    -- set link to start with 0
    link_start <= '0';
    -- start the 100MHz core clk
    clk <= not clk after 10ns;
    -- reset the devices (active low) for 10 cycles
    rst <= '0', '1' after 100ns;
    
    stimulus:
    process begin
        -- wait for reset
        wait until (rst = '1');
        -- wait for 10 more cycles for good measue
        wait for 100ns;
        
        -- now try to establish the link
        link_start <= '1';
        wait for 100ns;
    end process stimulus;


end Behavioral;