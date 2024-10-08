-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
-- Date        : Tue Oct  8 14:55:56 2024
-- Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ SPW_ZynqSetup_SpaceWire_light_AXI_0_0_stub.vhdl
-- Design      : SPW_ZynqSetup_SpaceWire_light_AXI_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    IRQ : out STD_LOGIC;
    SPW_Dout : out STD_LOGIC;
    SPW_Sout : out STD_LOGIC;
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    SPW_rst : in STD_LOGIC;
    axi_register_aclk : in STD_LOGIC;
    axi_register_aresetn : in STD_LOGIC;
    axi_register_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_register_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_register_awvalid : in STD_LOGIC;
    axi_register_awready : out STD_LOGIC;
    axi_register_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_register_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_register_wvalid : in STD_LOGIC;
    axi_register_wready : out STD_LOGIC;
    axi_register_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_register_bvalid : out STD_LOGIC;
    axi_register_bready : in STD_LOGIC;
    axi_register_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_register_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_register_arvalid : in STD_LOGIC;
    axi_register_arready : out STD_LOGIC;
    axi_register_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_register_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_register_rvalid : out STD_LOGIC;
    axi_register_rready : in STD_LOGIC;
    axi_streamin_aclk : in STD_LOGIC;
    axi_streamin_aresetn : in STD_LOGIC;
    axi_streamin_tready : out STD_LOGIC;
    axi_streamin_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamin_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    axi_streamin_tlast : in STD_LOGIC;
    axi_streamin_tvalid : in STD_LOGIC;
    axi_streamout_aclk : in STD_LOGIC;
    axi_streamout_aresetn : in STD_LOGIC;
    axi_streamout_tvalid : out STD_LOGIC;
    axi_streamout_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamout_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_streamout_tlast : out STD_LOGIC;
    axi_streamout_tready : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "IRQ,SPW_Dout,SPW_Sout,SPW_Din,SPW_Sin,SPW_TX_clk,SPW_main_clk,SPW_rst,axi_register_aclk,axi_register_aresetn,axi_register_awaddr[4:0],axi_register_awprot[2:0],axi_register_awvalid,axi_register_awready,axi_register_wdata[31:0],axi_register_wstrb[3:0],axi_register_wvalid,axi_register_wready,axi_register_bresp[1:0],axi_register_bvalid,axi_register_bready,axi_register_araddr[4:0],axi_register_arprot[2:0],axi_register_arvalid,axi_register_arready,axi_register_rdata[31:0],axi_register_rresp[1:0],axi_register_rvalid,axi_register_rready,axi_streamin_aclk,axi_streamin_aresetn,axi_streamin_tready,axi_streamin_tdata[7:0],axi_streamin_tstrb[0:0],axi_streamin_tlast,axi_streamin_tvalid,axi_streamout_aclk,axi_streamout_aresetn,axi_streamout_tvalid,axi_streamout_tdata[7:0],axi_streamout_tstrb[0:0],axi_streamout_tlast,axi_streamout_tready";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SpaceWire_light_AXI,Vivado 2024.1.2";
begin
end;
