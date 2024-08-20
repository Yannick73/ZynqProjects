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
        rst : inout std_logic := '1';
        clk : inout std_logic := '0';
        txclk : inout std_logic := '0';
        -- master device control and status
        link_start : inout std_logic := '0';
        -- auto_start : inout std_logic := '0';
        started : inout std_logic;
        connecting : inout std_logic;
        running : inout std_logic;
        -- txrdy : inout std_logic;
        -- master I/O
        txdata: inout std_logic_vector (7 downto 0) := x"00";
        txwrite: inout std_logic := '0';
        txflag: inout std_logic := '0' --;
        -- ctrlin: inout std_logic_vector(1 downto 0) := "00"--;
        -- simulation clock
        -- simclk: inout std_logic := '0'
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
        RXIMPL => impl_fast,   
        TXIMPL => impl_fast,
        -- as defined by document for impl_generic
        RXCHUNK => 2,
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
        TXDIVCNT => x"00",
        TICK_IN => '0',
        CTRL_IN => "00",
        TIME_IN => "000000",
        TXWRITE => txwrite,
        TXFLAG => txflag,
        TXDATA => txdata,
        RXREAD => '0',
        TXCLK => clk,
        CNT_RST => '1'
    );
    
    -- Client of the SpaceWire test system
    SPW_Client : SpwStream
    -- set parameters
    generic map (
        -- target core clock frequency of 100MHz
        SYSFREQ  => 100.0*1e6,
        -- low speed test
        RXIMPL => impl_fast,   
        TXIMPL => impl_fast,
        -- as defined by document for impl_generic
        RXCHUNK => 2,
        -- default of the doc
        RXFIFOSIZE_BITS => 11,
        TXFIFOSIZE_BITS => 11
    )
    port map (
        -- Connect the wires to the main bus
        SPW_DO => dmico,
        SPW_SO => smico,
        SPW_DI => dmoci,
        SPW_SI => smoci,
        -- Connect the common device control
        ARST_N => rst,
        CLK => clk,
        -- Connect the master device control and status
        LINKSTART => '0',
        -- STARTED => started,
        -- CONNECTING => connecting,
        -- RUNNING => running,
        -- connect the constants
        AUTOSTART => '1',
        LINKDIS => '0',
        TXDIVCNT => x"00",
        TICK_IN => '0',
        CTRL_IN => "00",
        TIME_IN => "000000",
        TXWRITE => '0',
        TXFLAG => '0',
        TXDATA => "00000000",
        RXREAD => '0',
        TXCLK => clk,
        CNT_RST => '1'
    );
    
    -- start a 1GHz sim step clk
    -- simclk <= not simclk after 500ps;
    -- start the 100MHz core clk
    clk <= not clk after 5ns;
    -- start the 200MHz transmit clk
    txclk <= not txclk after 2500ps;
    -- reset the devices (active low) for 10 cycles
    rst <= '0', '1' after 1us;
    
    stimulus:
    process begin
        -- wait for reset
        wait until (rst = '1');
        -- wait for 10 more cycles for good measue
        wait for 20us;
        
        -- now try to establish the link
        -- in sim needs to be clocked high for at least 20us,
        link_start <= '1';
        -- after that takes about 19us until 'started', which itself lasts for 14us (w/o any input)
        wait until (started = '1');
        wait for 8ns;
        
--        for i in 0 to 0 loop
--            -- esc and fct are the null control code
--            txflag <= '1'; txdata <= "00000011";    -- write esc
--            txwrite <= '1', '0' after 10ns; wait for 10ns;
--            txflag <= '1'; txdata <= x"00";    -- write fct
--            txwrite <= '1', '0' after 10ns; wait for 10ns;
--            wait for 1us;
--        end loop;
        -- takes until around 30us
--        wait until (started = '0');
--        for i in 0 to 7 loop
--            txflag <= '1'; ctrlin <= "00";    -- write fct
--            txwrite <= '1', '0' after 10ns; wait for 10ns;
--            wait for 1us;
--        end loop;
--        link_start <= '0';

--        auto_start <= '1';
--        wait for 20us;
--        for i in 0 to 1 loop
--                -- esc and fct are the null control code
--            txflag <= '1'; txdata <= "00000011";    -- write esc
--            txwrite <= '1', '0' after 10ns; wait for 10ns;
--            txflag <= '1'; txdata <= "00000000";    -- write fct
--            txwrite <= '1', '0' after 10ns; wait for 10ns;
--            wait for 2us;
--        end loop;
        
        
        wait for 100us;
    end process stimulus;


end Behavioral;

