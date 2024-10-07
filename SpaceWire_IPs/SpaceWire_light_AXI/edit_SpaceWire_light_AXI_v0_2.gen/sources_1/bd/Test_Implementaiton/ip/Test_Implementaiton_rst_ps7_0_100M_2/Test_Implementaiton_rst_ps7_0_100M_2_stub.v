// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
// Date        : Mon Oct  7 21:28:57 2024
// Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/Test_Implementaiton_rst_ps7_0_100M_2_stub.v
// Design      : Test_Implementaiton_rst_ps7_0_100M_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "proc_sys_reset,Vivado 2024.1.2" *)
module Test_Implementaiton_rst_ps7_0_100M_2(slowest_sync_clk, ext_reset_in, aux_reset_in, 
  mb_debug_sys_rst, dcm_locked, mb_reset, bus_struct_reset, peripheral_reset, 
  interconnect_aresetn, peripheral_aresetn)
/* synthesis syn_black_box black_box_pad_pin="ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset,bus_struct_reset[0:0],peripheral_reset[0:0],interconnect_aresetn[0:0],peripheral_aresetn[0:0]" */
/* synthesis syn_force_seq_prim="slowest_sync_clk" */;
  input slowest_sync_clk /* synthesis syn_isclock = 1 */;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;
endmodule
