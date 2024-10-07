// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
// Date        : Mon Oct  7 22:24:11 2024
// Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_clk_wiz_0_0/Test_Implementaiton_clk_wiz_0_0_stub.v
// Design      : Test_Implementaiton_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Test_Implementaiton_clk_wiz_0_0(TX_clk, SPW_core_clk, resetn, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="resetn,clk_in1" */
/* synthesis syn_force_seq_prim="TX_clk" */
/* synthesis syn_force_seq_prim="SPW_core_clk" */;
  output TX_clk /* synthesis syn_isclock = 1 */;
  output SPW_core_clk /* synthesis syn_isclock = 1 */;
  input resetn;
  input clk_in1;
endmodule
