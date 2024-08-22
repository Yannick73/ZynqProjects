-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: IRS:RomeoOBDH:SpaceWire_light_AXI:0.2
-- IP Revision: 8

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY SPWIP;
USE SPWIP.SpaceWire_light_AXI;

ENTITY Test_Implementaiton_SpaceWire_light_AXI_0_2 IS
  PORT (
    IRQ : OUT STD_LOGIC;
    SPW_Dout : OUT STD_LOGIC;
    SPW_Sout : OUT STD_LOGIC;
    SPW_Din : IN STD_LOGIC;
    SPW_Sin : IN STD_LOGIC;
    SPW_TX_clk : IN STD_LOGIC;
    SPW_main_clk : IN STD_LOGIC;
    SPW_rst : IN STD_LOGIC;
    axi_register_aclk : IN STD_LOGIC;
    axi_register_aresetn : IN STD_LOGIC;
    axi_register_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    axi_register_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_register_awvalid : IN STD_LOGIC;
    axi_register_awready : OUT STD_LOGIC;
    axi_register_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_register_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_register_wvalid : IN STD_LOGIC;
    axi_register_wready : OUT STD_LOGIC;
    axi_register_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_register_bvalid : OUT STD_LOGIC;
    axi_register_bready : IN STD_LOGIC;
    axi_register_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    axi_register_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_register_arvalid : IN STD_LOGIC;
    axi_register_arready : OUT STD_LOGIC;
    axi_register_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_register_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_register_rvalid : OUT STD_LOGIC;
    axi_register_rready : IN STD_LOGIC;
    axi_streamin_aclk : IN STD_LOGIC;
    axi_streamin_aresetn : IN STD_LOGIC;
    axi_streamin_tready : OUT STD_LOGIC;
    axi_streamin_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    axi_streamin_tstrb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_streamin_tlast : IN STD_LOGIC;
    axi_streamin_tvalid : IN STD_LOGIC;
    axi_streamout_aclk : IN STD_LOGIC;
    axi_streamout_aresetn : IN STD_LOGIC;
    axi_streamout_tvalid : OUT STD_LOGIC;
    axi_streamout_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axi_streamout_tstrb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_streamout_tlast : OUT STD_LOGIC;
    axi_streamout_tready : IN STD_LOGIC
  );
END Test_Implementaiton_SpaceWire_light_AXI_0_2;

ARCHITECTURE Test_Implementaiton_SpaceWire_light_AXI_0_2_arch OF Test_Implementaiton_SpaceWire_light_AXI_0_2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF Test_Implementaiton_SpaceWire_light_AXI_0_2_arch: ARCHITECTURE IS "yes";
  COMPONENT SpaceWire_light_AXI IS
    GENERIC (
      C_AXI_StreamOut_TDATA_WIDTH : INTEGER;
      C_AXI_StreamOut_START_COUNT : INTEGER;
      C_AXI_Register_DATA_WIDTH : INTEGER;
      C_AXI_Register_ADDR_WIDTH : INTEGER;
      C_AXI_StreamIn_TDATA_WIDTH : INTEGER
    );
    PORT (
      IRQ : OUT STD_LOGIC;
      SPW_Dout : OUT STD_LOGIC;
      SPW_Sout : OUT STD_LOGIC;
      SPW_Din : IN STD_LOGIC;
      SPW_Sin : IN STD_LOGIC;
      SPW_TX_clk : IN STD_LOGIC;
      SPW_main_clk : IN STD_LOGIC;
      SPW_rst : IN STD_LOGIC;
      axi_register_aclk : IN STD_LOGIC;
      axi_register_aresetn : IN STD_LOGIC;
      axi_register_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      axi_register_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_register_awvalid : IN STD_LOGIC;
      axi_register_awready : OUT STD_LOGIC;
      axi_register_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_register_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_register_wvalid : IN STD_LOGIC;
      axi_register_wready : OUT STD_LOGIC;
      axi_register_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_register_bvalid : OUT STD_LOGIC;
      axi_register_bready : IN STD_LOGIC;
      axi_register_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      axi_register_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_register_arvalid : IN STD_LOGIC;
      axi_register_arready : OUT STD_LOGIC;
      axi_register_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_register_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_register_rvalid : OUT STD_LOGIC;
      axi_register_rready : IN STD_LOGIC;
      axi_streamin_aclk : IN STD_LOGIC;
      axi_streamin_aresetn : IN STD_LOGIC;
      axi_streamin_tready : OUT STD_LOGIC;
      axi_streamin_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      axi_streamin_tstrb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_streamin_tlast : IN STD_LOGIC;
      axi_streamin_tvalid : IN STD_LOGIC;
      axi_streamout_aclk : IN STD_LOGIC;
      axi_streamout_aresetn : IN STD_LOGIC;
      axi_streamout_tvalid : OUT STD_LOGIC;
      axi_streamout_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      axi_streamout_tstrb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_streamout_tlast : OUT STD_LOGIC;
      axi_streamout_tready : IN STD_LOGIC
    );
  END COMPONENT SpaceWire_light_AXI;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF Test_Implementaiton_SpaceWire_light_AXI_0_2_arch: ARCHITECTURE IS "SpaceWire_light_AXI,Vivado 2024.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF Test_Implementaiton_SpaceWire_light_AXI_0_2_arch : ARCHITECTURE IS "Test_Implementaiton_SpaceWire_light_AXI_0_2,SpaceWire_light_AXI,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF IRQ: SIGNAL IS "XIL_INTERFACENAME IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF IRQ: SIGNAL IS "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF SPW_TX_clk: SIGNAL IS "XIL_INTERFACENAME SPW_TX_clk, FREQ_HZ 1e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF SPW_TX_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 SPW_TX_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF SPW_main_clk: SIGNAL IS "XIL_INTERFACENAME SPW_main_clk, FREQ_HZ 1e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF SPW_main_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 SPW_main_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF SPW_rst: SIGNAL IS "XIL_INTERFACENAME SPW_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF SPW_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 SPW_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_register_aclk: SIGNAL IS "XIL_INTERFACENAME AXI_Register_CLK, ASSOCIATED_BUSIF AXI_Register, ASSOCIATED_RESET axi_register_aresetn, FREQ_HZ 1e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 AXI_Register_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register ARADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_register_aresetn: SIGNAL IS "XIL_INTERFACENAME AXI_Register_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI_Register_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_register_awaddr: SIGNAL IS "XIL_INTERFACENAME AXI_Register, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 8, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 1e+08, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_proc" & 
"essing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF axi_register_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_Register WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamin_aclk: SIGNAL IS "XIL_INTERFACENAME AXI_StreamIn_CLK, ASSOCIATED_BUSIF AXI_StreamIn, ASSOCIATED_RESET axi_streamin_aresetn, FREQ_HZ 1e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 AXI_StreamIn_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamin_aresetn: SIGNAL IS "XIL_INTERFACENAME AXI_StreamIn_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI_StreamIn_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamIn TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamIn TLAST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamin_tready: SIGNAL IS "XIL_INTERFACENAME AXI_StreamIn, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamIn TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamIn TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamin_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamIn TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamout_aclk: SIGNAL IS "XIL_INTERFACENAME AXI_StreamOut_CLK, ASSOCIATED_BUSIF AXI_StreamOut, ASSOCIATED_RESET axi_streamout_aresetn, FREQ_HZ 1e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 AXI_StreamOut_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamout_aresetn: SIGNAL IS "XIL_INTERFACENAME AXI_StreamOut_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI_StreamOut_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamOut TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamOut TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamOut TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamOut TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_streamout_tvalid: SIGNAL IS "XIL_INTERFACENAME AXI_StreamOut, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1e+08, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_streamout_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 AXI_StreamOut TVALID";
BEGIN
  U0 : SpaceWire_light_AXI
    GENERIC MAP (
      C_AXI_StreamOut_TDATA_WIDTH => 8,
      C_AXI_StreamOut_START_COUNT => 32,
      C_AXI_Register_DATA_WIDTH => 32,
      C_AXI_Register_ADDR_WIDTH => 5,
      C_AXI_StreamIn_TDATA_WIDTH => 8
    )
    PORT MAP (
      IRQ => IRQ,
      SPW_Dout => SPW_Dout,
      SPW_Sout => SPW_Sout,
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_TX_clk => SPW_TX_clk,
      SPW_main_clk => SPW_main_clk,
      SPW_rst => SPW_rst,
      axi_register_aclk => axi_register_aclk,
      axi_register_aresetn => axi_register_aresetn,
      axi_register_awaddr => axi_register_awaddr,
      axi_register_awprot => axi_register_awprot,
      axi_register_awvalid => axi_register_awvalid,
      axi_register_awready => axi_register_awready,
      axi_register_wdata => axi_register_wdata,
      axi_register_wstrb => axi_register_wstrb,
      axi_register_wvalid => axi_register_wvalid,
      axi_register_wready => axi_register_wready,
      axi_register_bresp => axi_register_bresp,
      axi_register_bvalid => axi_register_bvalid,
      axi_register_bready => axi_register_bready,
      axi_register_araddr => axi_register_araddr,
      axi_register_arprot => axi_register_arprot,
      axi_register_arvalid => axi_register_arvalid,
      axi_register_arready => axi_register_arready,
      axi_register_rdata => axi_register_rdata,
      axi_register_rresp => axi_register_rresp,
      axi_register_rvalid => axi_register_rvalid,
      axi_register_rready => axi_register_rready,
      axi_streamin_aclk => axi_streamin_aclk,
      axi_streamin_aresetn => axi_streamin_aresetn,
      axi_streamin_tready => axi_streamin_tready,
      axi_streamin_tdata => axi_streamin_tdata,
      axi_streamin_tstrb => axi_streamin_tstrb,
      axi_streamin_tlast => axi_streamin_tlast,
      axi_streamin_tvalid => axi_streamin_tvalid,
      axi_streamout_aclk => axi_streamout_aclk,
      axi_streamout_aresetn => axi_streamout_aresetn,
      axi_streamout_tvalid => axi_streamout_tvalid,
      axi_streamout_tdata => axi_streamout_tdata,
      axi_streamout_tstrb => axi_streamout_tstrb,
      axi_streamout_tlast => axi_streamout_tlast,
      axi_streamout_tready => axi_streamout_tready
    );
END Test_Implementaiton_SpaceWire_light_AXI_0_2_arch;
