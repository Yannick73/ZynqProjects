----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2024 15:22:15
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

entity exchange_data is
    Port (
        -- main SpaceWire bus 
        dmoci : inout STD_LOGIC;
        smoci : inout STD_LOGIC;
        dmico : inout STD_LOGIC;
        smico : inout STD_LOGIC;
        -- recoclk : inout std_logic;
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
        txflag: inout std_logic := '0';
        -- client I/O
        rxvalid: inout std_logic;
        rxdata: inout std_logic_vector (7 downto 0);
        rxread: inout std_logic := '0';
        rxflag: inout std_logic;
        -- readout data
        readdata: inout std_logic_vector (7 downto 0);
        readflag: inout std_logic
    );
    

end exchange_data;

architecture Behavioral of exchange_data is

begin
    -- Master of the SpaceWire test system
    SPW_Master : SpwStream
    -- set parameters
    generic map (
        -- target core clock frequency of 100MHz and transmit clock of 200MHz
        SYSFREQ  => 100.0*1e6,
        TXCLKFREQ => 200.0*1e6,
        RXFIFOSIZE_BITS => 6,
        TXFIFOSIZE_BITS => 6,
        RXCHUNK => 1
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
        TXDIVCNT => x"09",
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
        -- target core clock frequency of 100MHz and transmit clock of 200MHz
        SYSFREQ  => 100.0*1e6,
        TXCLKFREQ => 200.0*1e6,
        RXFIFOSIZE_BITS => 6,
        TXFIFOSIZE_BITS => 6,
        RXCHUNK => 1
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
        TXDIVCNT => x"09",
        TICK_IN => '0',
        CTRL_IN => "00",
        TIME_IN => "000000",
        TXWRITE => '0',
        TXFLAG => '0',
        TXDATA => "00000000",
        RXDATA => rxdata,
        RXREAD => rxread,
        RXVALID => rxvalid,
        RXFLAG => rxflag,
        TXCLK => clk,
        CNT_RST => '1'
    );
    
    -- recoclk <= dmoci xor smoci;
    
    -- start a 1GHz sim step clk
    -- simclk <= not simclk after 500ps;
    -- start the 100MHz core clk
    clk <= not clk after 5ns;
    --clk <= not clk after 2500ps;
    -- start the 200MHz transmit clk
    txclk <= not txclk after 2500ps;
    -- reset the devices (active low) for 10 cycles
    rst <= '0', '1' after 10us;
    
    stimulus:
    process begin
        -- wait for reset
        wait until (rst = '1');
        -- wait for 10 more cycles for good measue
        wait for 20us;
        -- rxread <= '1', '0' after 20ns;  -- idk, why this needs to be here, but w/o the rxvalid never triggers
        
        -- now try to establish the link
        -- in sim needs to be clocked high for at least 20us,
        link_start <= '1';
        -- after that takes about 19us until 'started', which itself lasts for 14us (w/o any input)
        wait until (running = '1');
        wait for 8ns;
        link_start <= '0';
        
        -- write 42 on the bus
        txflag <= '0'; txdata <= x"42"; txwrite <= '1', '0' after 2500ps; wait for 10ns;
        -- write 43 on the bus
        txflag <= '0'; txdata <= x"43"; txwrite <= '1', '0' after 2500ps; wait for 10ns;
        -- write 44 on the bus
        txflag <= '0'; txdata <= x"44"; txwrite <= '1', '0' after 2500ps; wait for 10ns;
        -- write EOP on the bus
        txflag <= '1'; txdata <= x"01"; txwrite <= '1', '0' after 2500ps; wait for 2500ps;
        
        -- valid coincides with the rising clock, for the output to be stable, wait until the falling clock
        wait until (rxvalid = '1'); wait until(clk = '0');
        -- then save the data
        readdata <= rxdata; readflag <= rxflag;
        -- and now trigger the read to update the rxfifo address until it is update on the main clk rising edge
        rxread <= '1'; wait until(clk = '1'); rxread <= '0';
        -- now the cycle may continue
        wait until (rxvalid = '1'); wait until(clk = '0');
        readdata <= rxdata; readflag <= rxflag;
        rxread <= '1'; wait until(clk = '1'); rxread <= '0';
        wait until (rxvalid = '1'); wait until(clk = '0');
        readdata <= rxdata; readflag <= rxflag;
        rxread <= '1'; wait until(clk = '1'); rxread <= '0';
        wait until (rxvalid = '1'); wait until(clk = '0');
        readdata <= rxdata; readflag <= rxflag;
        rxread <= '1'; wait until(clk = '1'); rxread <= '0';
        
        
        wait for 1000ms;
    end process stimulus;


end Behavioral;

