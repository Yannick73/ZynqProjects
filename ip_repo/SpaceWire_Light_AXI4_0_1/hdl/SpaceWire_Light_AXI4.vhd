library ieee;
-- library xil_defaultlib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.spwstream;

entity SpaceWire_Light_AXI4 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface AXI_registers
		C_AXI_registers_DATA_WIDTH	: integer	:= 32;
		C_AXI_registers_ADDR_WIDTH	: integer	:= 5;

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
		
		sw_clock : in std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface AXI_registers
		axi_registers_aclk	: in std_logic;
		axi_registers_aresetn	: in std_logic;
		axi_registers_awaddr	: in std_logic_vector(C_AXI_registers_ADDR_WIDTH-1 downto 0);
		axi_registers_awprot	: in std_logic_vector(2 downto 0);
		axi_registers_awvalid	: in std_logic;
		axi_registers_awready	: out std_logic;
		axi_registers_wdata	: in std_logic_vector(C_AXI_registers_DATA_WIDTH-1 downto 0);
		axi_registers_wstrb	: in std_logic_vector((C_AXI_registers_DATA_WIDTH/8)-1 downto 0);
		axi_registers_wvalid	: in std_logic;
		axi_registers_wready	: out std_logic;
		axi_registers_bresp	: out std_logic_vector(1 downto 0);
		axi_registers_bvalid	: out std_logic;
		axi_registers_bready	: in std_logic;
		axi_registers_araddr	: in std_logic_vector(C_AXI_registers_ADDR_WIDTH-1 downto 0);
		axi_registers_arprot	: in std_logic_vector(2 downto 0);
		axi_registers_arvalid	: in std_logic;
		axi_registers_arready	: out std_logic;
		axi_registers_rdata	: out std_logic_vector(C_AXI_registers_DATA_WIDTH-1 downto 0);
		axi_registers_rresp	: out std_logic_vector(1 downto 0);
		axi_registers_rvalid	: out std_logic;
		axi_registers_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S_AXI_INTR
		s_axi_intr_aclk	: in std_logic;
		s_axi_intr_aresetn	: in std_logic;
		s_axi_intr_awaddr	: in std_logic_vector(C_S_AXI_INTR_ADDR_WIDTH-1 downto 0);
		s_axi_intr_awprot	: in std_logic_vector(2 downto 0);
		s_axi_intr_awvalid	: in std_logic;
		s_axi_intr_awready	: out std_logic;
		s_axi_intr_wdata	: in std_logic_vector(C_S_AXI_INTR_DATA_WIDTH-1 downto 0);
		s_axi_intr_wstrb	: in std_logic_vector((C_S_AXI_INTR_DATA_WIDTH/8)-1 downto 0);
		s_axi_intr_wvalid	: in std_logic;
		s_axi_intr_wready	: out std_logic;
		s_axi_intr_bresp	: out std_logic_vector(1 downto 0);
		s_axi_intr_bvalid	: out std_logic;
		s_axi_intr_bready	: in std_logic;
		s_axi_intr_araddr	: in std_logic_vector(C_S_AXI_INTR_ADDR_WIDTH-1 downto 0);
		s_axi_intr_arprot	: in std_logic_vector(2 downto 0);
		s_axi_intr_arvalid	: in std_logic;
		s_axi_intr_arready	: out std_logic;
		s_axi_intr_rdata	: out std_logic_vector(C_S_AXI_INTR_DATA_WIDTH-1 downto 0);
		s_axi_intr_rresp	: out std_logic_vector(1 downto 0);
		s_axi_intr_rvalid	: out std_logic;
		s_axi_intr_rready	: in std_logic;
		irq	: out std_logic
	);
end SpaceWire_Light_AXI4;

architecture arch_imp of SpaceWire_Light_AXI4 is

	-- component declaration
	component SpaceWire_Light_AXI4_slave_lite_v0_1_AXI_registers is
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
	end component SpaceWire_Light_AXI4_slave_lite_v0_1_AXI_registers;

	component SpaceWire_Light_AXI4_slave_lite_inter_v0_1_S_AXI_INTR is
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
	end component SpaceWire_Light_AXI4_slave_lite_inter_v0_1_S_AXI_INTR;

begin

-- Instantiation of Axi Bus Interface AXI_registers
SpaceWire_Light_AXI4_slave_lite_v0_1_AXI_registers_inst : SpaceWire_Light_AXI4_slave_lite_v0_1_AXI_registers
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_AXI_registers_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_AXI_registers_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> axi_registers_aclk,
		S_AXI_ARESETN	=> axi_registers_aresetn,
		S_AXI_AWADDR	=> axi_registers_awaddr,
		S_AXI_AWPROT	=> axi_registers_awprot,
		S_AXI_AWVALID	=> axi_registers_awvalid,
		S_AXI_AWREADY	=> axi_registers_awready,
		S_AXI_WDATA	=> axi_registers_wdata,
		S_AXI_WSTRB	=> axi_registers_wstrb,
		S_AXI_WVALID	=> axi_registers_wvalid,
		S_AXI_WREADY	=> axi_registers_wready,
		S_AXI_BRESP	=> axi_registers_bresp,
		S_AXI_BVALID	=> axi_registers_bvalid,
		S_AXI_BREADY	=> axi_registers_bready,
		S_AXI_ARADDR	=> axi_registers_araddr,
		S_AXI_ARPROT	=> axi_registers_arprot,
		S_AXI_ARVALID	=> axi_registers_arvalid,
		S_AXI_ARREADY	=> axi_registers_arready,
		S_AXI_RDATA	=> axi_registers_rdata,
		S_AXI_RRESP	=> axi_registers_rresp,
		S_AXI_RVALID	=> axi_registers_rvalid,
		S_AXI_RREADY	=> axi_registers_rready
	);

-- Instantiation of Axi Bus Interface S_AXI_INTR
SpaceWire_Light_AXI4_slave_lite_inter_v0_1_S_AXI_INTR_inst : SpaceWire_Light_AXI4_slave_lite_inter_v0_1_S_AXI_INTR
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_INTR_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_INTR_ADDR_WIDTH,
		C_NUM_OF_INTR	=> C_NUM_OF_INTR,
		C_INTR_SENSITIVITY	=> C_INTR_SENSITIVITY,
		C_INTR_ACTIVE_STATE	=> C_INTR_ACTIVE_STATE,
		C_IRQ_SENSITIVITY	=> C_IRQ_SENSITIVITY,
		C_IRQ_ACTIVE_STATE	=> C_IRQ_ACTIVE_STATE
	)
	port map (
		S_AXI_ACLK	=> s_axi_intr_aclk,
		S_AXI_ARESETN	=> s_axi_intr_aresetn,
		S_AXI_AWADDR	=> s_axi_intr_awaddr,
		S_AXI_AWPROT	=> s_axi_intr_awprot,
		S_AXI_AWVALID	=> s_axi_intr_awvalid,
		S_AXI_AWREADY	=> s_axi_intr_awready,
		S_AXI_WDATA	=> s_axi_intr_wdata,
		S_AXI_WSTRB	=> s_axi_intr_wstrb,
		S_AXI_WVALID	=> s_axi_intr_wvalid,
		S_AXI_WREADY	=> s_axi_intr_wready,
		S_AXI_BRESP	=> s_axi_intr_bresp,
		S_AXI_BVALID	=> s_axi_intr_bvalid,
		S_AXI_BREADY	=> s_axi_intr_bready,
		S_AXI_ARADDR	=> s_axi_intr_araddr,
		S_AXI_ARPROT	=> s_axi_intr_arprot,
		S_AXI_ARVALID	=> s_axi_intr_arvalid,
		S_AXI_ARREADY	=> s_axi_intr_arready,
		S_AXI_RDATA	=> s_axi_intr_rdata,
		S_AXI_RRESP	=> s_axi_intr_rresp,
		S_AXI_RVALID	=> s_axi_intr_rvalid,
		S_AXI_RREADY	=> s_axi_intr_rready,
		irq	=> irq
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
