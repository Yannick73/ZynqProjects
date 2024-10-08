// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
// Date        : Tue Oct  8 13:34:15 2024
// Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_SpaceWire_light_AXI_0_2/Test_Implementaiton_SpaceWire_light_AXI_0_2_stub.v
// Design      : Test_Implementaiton_SpaceWire_light_AXI_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SpaceWire_light_AXI,Vivado 2024.1.2" *)
module Test_Implementaiton_SpaceWire_light_AXI_0_2(IRQ, SPW_Dout, SPW_Sout, SPW_Din, SPW_Sin, 
  SPW_TX_clk, SPW_main_clk, SPW_rst, axi_register_aclk, axi_register_aresetn, 
  axi_register_awaddr, axi_register_awprot, axi_register_awvalid, axi_register_awready, 
  axi_register_wdata, axi_register_wstrb, axi_register_wvalid, axi_register_wready, 
  axi_register_bresp, axi_register_bvalid, axi_register_bready, axi_register_araddr, 
  axi_register_arprot, axi_register_arvalid, axi_register_arready, axi_register_rdata, 
  axi_register_rresp, axi_register_rvalid, axi_register_rready, axi_streamin_aclk, 
  axi_streamin_aresetn, axi_streamin_tready, axi_streamin_tdata, axi_streamin_tstrb, 
  axi_streamin_tlast, axi_streamin_tvalid, axi_streamout_aclk, axi_streamout_aresetn, 
  axi_streamout_tvalid, axi_streamout_tdata, axi_streamout_tstrb, axi_streamout_tlast, 
  axi_streamout_tready)
/* synthesis syn_black_box black_box_pad_pin="IRQ,SPW_Dout,SPW_Sout,SPW_Din,SPW_Sin,SPW_rst,axi_register_aresetn,axi_register_awaddr[4:0],axi_register_awprot[2:0],axi_register_awvalid,axi_register_awready,axi_register_wdata[31:0],axi_register_wstrb[3:0],axi_register_wvalid,axi_register_wready,axi_register_bresp[1:0],axi_register_bvalid,axi_register_bready,axi_register_araddr[4:0],axi_register_arprot[2:0],axi_register_arvalid,axi_register_arready,axi_register_rdata[31:0],axi_register_rresp[1:0],axi_register_rvalid,axi_register_rready,axi_streamin_aresetn,axi_streamin_tready,axi_streamin_tdata[7:0],axi_streamin_tstrb[0:0],axi_streamin_tlast,axi_streamin_tvalid,axi_streamout_aresetn,axi_streamout_tvalid,axi_streamout_tdata[7:0],axi_streamout_tstrb[0:0],axi_streamout_tlast,axi_streamout_tready" */
/* synthesis syn_force_seq_prim="SPW_TX_clk" */
/* synthesis syn_force_seq_prim="SPW_main_clk" */
/* synthesis syn_force_seq_prim="axi_register_aclk" */
/* synthesis syn_force_seq_prim="axi_streamin_aclk" */
/* synthesis syn_force_seq_prim="axi_streamout_aclk" */;
  output IRQ;
  output SPW_Dout;
  output SPW_Sout;
  input SPW_Din;
  input SPW_Sin;
  input SPW_TX_clk /* synthesis syn_isclock = 1 */;
  input SPW_main_clk /* synthesis syn_isclock = 1 */;
  input SPW_rst;
  input axi_register_aclk /* synthesis syn_isclock = 1 */;
  input axi_register_aresetn;
  input [4:0]axi_register_awaddr;
  input [2:0]axi_register_awprot;
  input axi_register_awvalid;
  output axi_register_awready;
  input [31:0]axi_register_wdata;
  input [3:0]axi_register_wstrb;
  input axi_register_wvalid;
  output axi_register_wready;
  output [1:0]axi_register_bresp;
  output axi_register_bvalid;
  input axi_register_bready;
  input [4:0]axi_register_araddr;
  input [2:0]axi_register_arprot;
  input axi_register_arvalid;
  output axi_register_arready;
  output [31:0]axi_register_rdata;
  output [1:0]axi_register_rresp;
  output axi_register_rvalid;
  input axi_register_rready;
  input axi_streamin_aclk /* synthesis syn_isclock = 1 */;
  input axi_streamin_aresetn;
  output axi_streamin_tready;
  input [7:0]axi_streamin_tdata;
  input [0:0]axi_streamin_tstrb;
  input axi_streamin_tlast;
  input axi_streamin_tvalid;
  input axi_streamout_aclk /* synthesis syn_isclock = 1 */;
  input axi_streamout_aresetn;
  output axi_streamout_tvalid;
  output [7:0]axi_streamout_tdata;
  output [0:0]axi_streamout_tstrb;
  output axi_streamout_tlast;
  input axi_streamout_tready;
endmodule
