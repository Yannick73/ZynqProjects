library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library SPWIP;
use SPWIP.SpwStream_pkg.all;
use SPWIP.SpwRegisters_pkg.spw_implementation_type;

entity SpaceWire_light_AXI is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXI_ControlRegister
		C_S_AXI_ControlRegister_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ControlRegister_ADDR_WIDTH	: integer	:= 5;

		-- Parameters of Axi Slave Bus Interface S_AXI_Stream
		C_S_AXI_Stream_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S_AXI_INTR
		C_S_AXI_INTR_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_INTR_ADDR_WIDTH	: integer	:= 5;
		C_NUM_OF_INTR	: integer	:= 1;
		C_INTR_SENSITIVITY	: std_logic_vector	:= x"FFFFFFFF";
		C_INTR_ACTIVE_STATE	: std_logic_vector	:= x"FFFFFFFF";
		C_IRQ_SENSITIVITY	: integer	:= 1;
		C_IRQ_ACTIVE_STATE	: integer	:= 1
	);
	port (
		-- Users to add ports here
		
		spw_core_clk   : in std_logic;     -- main core clock
		spw_rxfclk     : in std_logic;     -- rxclk used in rximpl = impl_fast
		spw_txfclk     : in std_logic;     -- txclk used in tximpl = impl_fast
		spw_core_rst   : in std_logic;     -- main core reset, active low to conform to standard
		-- needs inversion to active high for the IP core
		
		spw_di    : in std_logic;     -- data in
		spw_si    : in std_logic;     -- strobe in
		spw_do    : out std_logic;    -- data out
		spw_so    : out std_logic;    -- strobe out

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AXI_ControlRegister
		s_axi_controlregister_aclk	: in std_logic;
		s_axi_controlregister_aresetn	: in std_logic;
		s_axi_controlregister_awaddr	: in std_logic_vector(C_S_AXI_ControlRegister_ADDR_WIDTH-1 downto 0);
		s_axi_controlregister_awprot	: in std_logic_vector(2 downto 0);
		s_axi_controlregister_awvalid	: in std_logic;
		s_axi_controlregister_awready	: out std_logic;
		s_axi_controlregister_wdata	: in std_logic_vector(C_S_AXI_ControlRegister_DATA_WIDTH-1 downto 0);
		s_axi_controlregister_wstrb	: in std_logic_vector((C_S_AXI_ControlRegister_DATA_WIDTH/8)-1 downto 0);
		s_axi_controlregister_wvalid	: in std_logic;
		s_axi_controlregister_wready	: out std_logic;
		s_axi_controlregister_bresp	: out std_logic_vector(1 downto 0);
		s_axi_controlregister_bvalid	: out std_logic;
		s_axi_controlregister_bready	: in std_logic;
		s_axi_controlregister_araddr	: in std_logic_vector(C_S_AXI_ControlRegister_ADDR_WIDTH-1 downto 0);
		s_axi_controlregister_arprot	: in std_logic_vector(2 downto 0);
		s_axi_controlregister_arvalid	: in std_logic;
		s_axi_controlregister_arready	: out std_logic;
		s_axi_controlregister_rdata	: out std_logic_vector(C_S_AXI_ControlRegister_DATA_WIDTH-1 downto 0);
		s_axi_controlregister_rresp	: out std_logic_vector(1 downto 0);
		s_axi_controlregister_rvalid	: out std_logic;
		s_axi_controlregister_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S_AXI_Stream
		s_axi_stream_aclk	: in std_logic;
		s_axi_stream_aresetn	: in std_logic;
		s_axi_stream_tready	: out std_logic;
		s_axi_stream_tdata	: in std_logic_vector(C_S_AXI_Stream_TDATA_WIDTH-1 downto 0);
		s_axi_stream_tstrb	: in std_logic_vector((C_S_AXI_Stream_TDATA_WIDTH/8)-1 downto 0);
		s_axi_stream_tlast	: in std_logic;
		s_axi_stream_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S_AXI_INTR
		irq	: out std_logic
	);
end SpaceWire_light_AXI;

architecture arch_imp of SpaceWire_light_AXI is

	-- component declaration
	component SpaceWire_light_AXI_slave_lite_v0_1_S_AXI_ControlRegister is
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
	end component SpaceWire_light_AXI_slave_lite_v0_1_S_AXI_ControlRegister;

	component SpaceWire_light_AXI_slave_stream_v0_1_S_AXI_Stream is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component SpaceWire_light_AXI_slave_stream_v0_1_S_AXI_Stream;

	component SpaceWire_light_AXI_slave_lite_inter_v0_1_S_AXI_INTR is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5;
		C_NUM_OF_INTR	: integer	:= 1;
		C_INTR_SENSITIVITY	: std_logic_vector	:= x"FFFFFFFF";
		C_INTR_ACTIVE_STATE	: std_logic_vector	:= x"FFFFFFFF";
		C_IRQ_SENSITIVITY	: integer	:= 1;
		C_IRQ_ACTIVE_STATE	: integer	:= 1
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
		S_AXI_RREADY	: in std_logic;
		irq	: out std_logic
		);
	end component SpaceWire_light_AXI_slave_lite_inter_v0_1_S_AXI_INTR;

begin

    -- SpaceWire peripheral (tbd!)
    spw_if : SpwStream
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
        -- SPW_DO => dmoci,
        -- SPW_SO => smoci,
        SPW_DI => '0',
        SPW_SI => '0',
        -- Connect the common device control
        ARST_N => '1',
        CLK => '0',
        -- Connect the master device control and status
        LINKSTART => '0',
--        STARTED => started,
--        CONNECTING => connecting,
--        RUNNING => running,
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

-- Instantiation of Axi Bus Interface S_AXI_ControlRegister
SpaceWire_light_AXI_slave_lite_v0_1_S_AXI_ControlRegister_inst : SpaceWire_light_AXI_slave_lite_v0_1_S_AXI_ControlRegister
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_ControlRegister_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ControlRegister_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> s_axi_controlregister_aclk,
		S_AXI_ARESETN	=> s_axi_controlregister_aresetn,
		S_AXI_AWADDR	=> s_axi_controlregister_awaddr,
		S_AXI_AWPROT	=> s_axi_controlregister_awprot,
		S_AXI_AWVALID	=> s_axi_controlregister_awvalid,
		S_AXI_AWREADY	=> s_axi_controlregister_awready,
		S_AXI_WDATA	=> s_axi_controlregister_wdata,
		S_AXI_WSTRB	=> s_axi_controlregister_wstrb,
		S_AXI_WVALID	=> s_axi_controlregister_wvalid,
		S_AXI_WREADY	=> s_axi_controlregister_wready,
		S_AXI_BRESP	=> s_axi_controlregister_bresp,
		S_AXI_BVALID	=> s_axi_controlregister_bvalid,
		S_AXI_BREADY	=> s_axi_controlregister_bready,
		S_AXI_ARADDR	=> s_axi_controlregister_araddr,
		S_AXI_ARPROT	=> s_axi_controlregister_arprot,
		S_AXI_ARVALID	=> s_axi_controlregister_arvalid,
		S_AXI_ARREADY	=> s_axi_controlregister_arready,
		S_AXI_RDATA	=> s_axi_controlregister_rdata,
		S_AXI_RRESP	=> s_axi_controlregister_rresp,
		S_AXI_RVALID	=> s_axi_controlregister_rvalid,
		S_AXI_RREADY	=> s_axi_controlregister_rready
	);

-- Instantiation of Axi Bus Interface S_AXI_Stream
SpaceWire_light_AXI_slave_stream_v0_1_S_AXI_Stream_inst : SpaceWire_light_AXI_slave_stream_v0_1_S_AXI_Stream
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_S_AXI_Stream_TDATA_WIDTH
	)
	port map (
		S_AXIS_ACLK	=> s_axi_stream_aclk,
		S_AXIS_ARESETN	=> s_axi_stream_aresetn,
		S_AXIS_TREADY	=> s_axi_stream_tready,
		S_AXIS_TDATA	=> s_axi_stream_tdata,
		S_AXIS_TSTRB	=> s_axi_stream_tstrb,
		S_AXIS_TLAST	=> s_axi_stream_tlast,
		S_AXIS_TVALID	=> s_axi_stream_tvalid
	);

end arch_imp;
