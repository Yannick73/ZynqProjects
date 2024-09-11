library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library SPWIP;
use SPWIP.SpwStream_pkg.all;

entity SpaceWire_light_AXI is
	generic (
		-- Users to add parameters here
        SYSFREQ : real range 1.0e6 to 1.0e9 := 100.0*1e6;
        TXCLKFREQ : real range 1.0e6 to 1.0e9 := 400.0*1e6;
        RXCHUNK : integer range 1 to 6 := 4;
        RXFIFOSIZE_BITS : integer range 6 to 16 := 14;
        TXFIFOSIZE_BITS : integer range 2 to 16 := 14;
        ESCAPE_CHAR : std_logic_vector (7 downto 0) := x"7D";
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface AXI_Register
		C_AXI_Register_DATA_WIDTH	: integer	:= 32;
		C_AXI_Register_ADDR_WIDTH	: integer	:= 5;

		-- Parameters of Axi Slave Bus Interface AXI_StreamIn
		C_AXI_StreamIn_TDATA_WIDTH	: integer	:= 8;

		-- Parameters of Axi Master Bus Interface AXI_StreamOut
		C_AXI_StreamOut_TDATA_WIDTH	: integer	:= 8;
		C_AXI_StreamOut_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
		
		IRQ : out std_logic;
		
		SPW_Dout : out std_logic;
		SPW_Sout : out std_logic;
		SPW_Din : in std_logic;
		SPW_Sin : in std_logic;
		
		SPW_TX_clk : in std_logic;
		SPW_main_clk : in std_logic;
		SPW_rst : in std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface AXI_Register
		axi_register_aclk	: in std_logic;
		axi_register_aresetn	: in std_logic;
		axi_register_awaddr	: in std_logic_vector(C_AXI_Register_ADDR_WIDTH-1 downto 0);
		axi_register_awprot	: in std_logic_vector(2 downto 0);
		axi_register_awvalid	: in std_logic;
		axi_register_awready	: out std_logic;
		axi_register_wdata	: in std_logic_vector(C_AXI_Register_DATA_WIDTH-1 downto 0);
		axi_register_wstrb	: in std_logic_vector((C_AXI_Register_DATA_WIDTH/8)-1 downto 0);
		axi_register_wvalid	: in std_logic;
		axi_register_wready	: out std_logic;
		axi_register_bresp	: out std_logic_vector(1 downto 0);
		axi_register_bvalid	: out std_logic;
		axi_register_bready	: in std_logic;
		axi_register_araddr	: in std_logic_vector(C_AXI_Register_ADDR_WIDTH-1 downto 0);
		axi_register_arprot	: in std_logic_vector(2 downto 0);
		axi_register_arvalid	: in std_logic;
		axi_register_arready	: out std_logic;
		axi_register_rdata	: out std_logic_vector(C_AXI_Register_DATA_WIDTH-1 downto 0);
		axi_register_rresp	: out std_logic_vector(1 downto 0);
		axi_register_rvalid	: out std_logic;
		axi_register_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface AXI_StreamIn
		axi_streamin_aclk	: in std_logic;
		axi_streamin_aresetn	: in std_logic;
		axi_streamin_tready	: out std_logic;
		axi_streamin_tdata	: in std_logic_vector(C_AXI_StreamIn_TDATA_WIDTH-1 downto 0);
		axi_streamin_tstrb	: in std_logic_vector((C_AXI_StreamIn_TDATA_WIDTH/8)-1 downto 0);
		axi_streamin_tlast	: in std_logic;
		axi_streamin_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface AXI_StreamOut
		axi_streamout_aclk	: in std_logic;
		axi_streamout_aresetn	: in std_logic;
		axi_streamout_tvalid	: out std_logic;
		axi_streamout_tdata	: out std_logic_vector(C_AXI_StreamOut_TDATA_WIDTH-1 downto 0);
		axi_streamout_tstrb	: out std_logic_vector((C_AXI_StreamOut_TDATA_WIDTH/8)-1 downto 0);
		axi_streamout_tlast	: out std_logic;
		axi_streamout_tready	: in std_logic
	);
end SpaceWire_light_AXI;

architecture arch_imp of SpaceWire_light_AXI is

	-- component declaration
	component SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5
		);
		port (
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register;

	component SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
		generic (
        ESCAPE_CHAR : std_logic_vector (7 downto 0) := x"7D";
		C_S_AXIS_TDATA_WIDTH	: integer	:= 8
		);
		port (
        SPW_TXRDY : in std_logic;
        SPW_TXFIFO : out std_logic_vector (7 downto 0);
        SPW_TXFLAG : out std_logic;
        SPW_TXWRITE : out std_logic;
        SPW_CLK : in std_logic;
        
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn;

	component SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut is
		generic (
        ESCAPE_CHAR : std_logic_vector (7 downto 0) := x"7D";
		C_M_AXIS_TDATA_WIDTH	: integer	:= 8;
		C_M_START_COUNT	: integer	:= 32
		);
		port (
		SPW_RXVALID : in std_logic;
        SPW_RXFIFO : in std_logic_vector (7 downto 0);
        SPW_RXFLAG : in std_logic;
        SPW_RXREAD : out std_logic;
        SPW_CLK : in std_logic;
        
		M_AXIS_ACLK	: in std_logic;
		M_AXIS_ARESETN	: in std_logic;
		M_AXIS_TVALID	: out std_logic;
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		M_AXIS_TLAST	: out std_logic;
		M_AXIS_TREADY	: in std_logic
		);
	end component SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut;
	
--	signal spw_txrdy_signal : std_logic;
--    signal spw_fifo_signal : std_logic_vector (7 downto 0);
--    signal spw_flag_signal : std_logic;
--    signal spw_txwrite_signal : std_logic;
--    signal spw_clk_signal : std_logic;
    signal spw_txrdy_signal : std_logic := '0';
    signal spw_txfifo_signal : std_logic_vector (7 downto 0) := x"00";
    signal spw_txflag_signal : std_logic := '0';
    signal spw_txwrite_signal : std_logic := '0';
    signal spw_clk_signal : std_logic := '0';
    
    
--	    SPW_RXVALID : in std_logic;
--        SPW_RXFIFO : in std_logic_vector (7 downto 0);
--        SPW_RXFLAG : in std_logic;
--        SPW_RXREAD : out std_logic;
--        SPW_CLK : in std_logic;
    signal spw_rxvalid_signal : std_logic := '0';
    signal spw_rxfifo_signal : std_logic_vector (7 downto 0) := x"00";
    signal spw_rxflag_signal : std_logic := '0';
    signal spw_rxread_signal : std_logic := '0';
    
begin

    spw_clk_signal <= SPW_main_clk;

-- Instantiation of Axi Bus Interface AXI_Register
SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register_inst : SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_AXI_Register_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_AXI_Register_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> axi_register_aclk,
		S_AXI_ARESETN	=> axi_register_aresetn,
		S_AXI_AWADDR	=> axi_register_awaddr,
		S_AXI_AWPROT	=> axi_register_awprot,
		S_AXI_AWVALID	=> axi_register_awvalid,
		S_AXI_AWREADY	=> axi_register_awready,
		S_AXI_WDATA	=> axi_register_wdata,
		S_AXI_WSTRB	=> axi_register_wstrb,
		S_AXI_WVALID	=> axi_register_wvalid,
		S_AXI_WREADY	=> axi_register_wready,
		S_AXI_BRESP	=> axi_register_bresp,
		S_AXI_BVALID	=> axi_register_bvalid,
		S_AXI_BREADY	=> axi_register_bready,
		S_AXI_ARADDR	=> axi_register_araddr,
		S_AXI_ARPROT	=> axi_register_arprot,
		S_AXI_ARVALID	=> axi_register_arvalid,
		S_AXI_ARREADY	=> axi_register_arready,
		S_AXI_RDATA	=> axi_register_rdata,
		S_AXI_RRESP	=> axi_register_rresp,
		S_AXI_RVALID	=> axi_register_rvalid,
		S_AXI_RREADY	=> axi_register_rready
	);

-- Instantiation of Axi Bus Interface AXI_StreamIn
SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst : SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn
	generic map (
        ESCAPE_CHAR             => ESCAPE_CHAR, 
		C_S_AXIS_TDATA_WIDTH	=> C_AXI_StreamIn_TDATA_WIDTH
	)
	port map (
	    -- connect the spw signals
	    SPW_TXRDY => spw_txrdy_signal,
	    SPW_TXFIFO => spw_txfifo_signal,
	    SPW_TXFLAG => spw_txflag_signal,
	    SPW_TXWRITE => spw_txwrite_signal,
	    SPW_CLK => spw_clk_signal,
	    
		S_AXIS_ACLK	=> axi_streamin_aclk,
		S_AXIS_ARESETN	=> axi_streamin_aresetn,
		S_AXIS_TREADY	=> axi_streamin_tready,
		S_AXIS_TDATA	=> axi_streamin_tdata,
		S_AXIS_TSTRB	=> axi_streamin_tstrb,
		S_AXIS_TLAST	=> axi_streamin_tlast,
		S_AXIS_TVALID	=> axi_streamin_tvalid
	);

-- Instantiation of Axi Bus Interface AXI_StreamOut
SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst : SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut
	generic map (
	    ESCAPE_CHAR             => ESCAPE_CHAR,
		C_M_AXIS_TDATA_WIDTH	=> C_AXI_StreamOut_TDATA_WIDTH,
		C_M_START_COUNT	=> C_AXI_StreamOut_START_COUNT
	)
	port map (
	    SPW_RXVALID => spw_rxvalid_signal,
        SPW_RXFIFO => spw_rxfifo_signal,
        SPW_RXFLAG => spw_rxflag_signal,
        SPW_RXREAD => spw_rxread_signal,
        SPW_CLK => spw_clk_signal,
        
		M_AXIS_ACLK	=> axi_streamout_aclk,
		M_AXIS_ARESETN	=> axi_streamout_aresetn,
		M_AXIS_TVALID	=> axi_streamout_tvalid,
		M_AXIS_TDATA	=> axi_streamout_tdata,
		M_AXIS_TSTRB	=> axi_streamout_tstrb,
		M_AXIS_TLAST	=> axi_streamout_tlast,
		M_AXIS_TREADY	=> axi_streamout_tready
	);

	-- Add user logic here

    SPW_IF : SpwStream
    generic map (
        SYSFREQ => SYSFREQ,
        TXCLKFREQ => TXCLKFREQ,
        RXFIFOSIZE_BITS => RXFIFOSIZE_BITS,
        TXFIFOSIZE_BITS => TXFIFOSIZE_BITS,
        RXCHUNK => RXCHUNK
    )
    port map (
        -- Connect the wires to the main bus
        SPW_DO => SPW_Dout,
        SPW_SO => SPW_Sout,
        SPW_DI => SPW_Din,
        SPW_SI => SPW_Sin,
        -- Connect the common device control
        ARST_N => SPW_rst,
        TXCLK => SPW_TX_clk,
        CLK => spw_clk_signal,
        -- Connect the master device control and status
        LINKSTART => '0',
--        STARTED => '0',
--        CONNECTING => '0',
--        RUNNING => '0',
        -- connect the constants
        AUTOSTART => '0',
        LINKDIS => '0',
        TXDIVCNT => x"09",
        TICK_IN => '0',
        CTRL_IN => "00",
        TIME_IN => "000000",
        -- write logic
        TXWRITE => spw_txwrite_signal,
        TXFLAG => spw_txflag_signal,
--        TXFLAG => '0',
        TXDATA => spw_txfifo_signal,
--        TXDATA => x"00",       
        
        -- read logic
        RXVALID => spw_rxvalid_signal,
        RXDATA => spw_rxfifo_signal,
        RXFLAG => spw_rxflag_signal,
        RXREAD => spw_rxread_signal,
        
        CNT_RST => '1',
        
        TXRDY => spw_txrdy_signal
    );
    
--    spw_txrdy_signal <= 
--	    SPW_TXFIFO => spw_txfifo_signal,
--	    SPW_TXFLAG => spw_txflag_signal,
--	    SPW_TXWRITE => spw_txwrite_signal,
--	    SPW_CLK => spw_clk_signal,
    
	-- User logic ends

end arch_imp;
