// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Wed Jul  3 23:28:35 2024
// Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_3/Adder_byte_register_0_3_stub.v
// Design      : Adder_byte_register_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "byte_register,Vivado 2024.1" *)
module Adder_byte_register_0_3(D, c, Q)
/* synthesis syn_black_box black_box_pad_pin="D[7:0],Q[7:0]" */
/* synthesis syn_force_seq_prim="c" */;
  input [7:0]D;
  input c /* synthesis syn_isclock = 1 */;
  output [7:0]Q;
endmodule
