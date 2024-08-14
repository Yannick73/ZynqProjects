//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Wed Jul  3 23:45:40 2024
//Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target Adder.bd
//Design      : Adder
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Adder,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Adder,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=4,da_ps7_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "Adder.hwdef" *) 
module Adder
   (CA,
    CB,
    S,
    carry,
    clk_100MHz,
    data);
  input CA;
  input CB;
  output [7:0]S;
  output carry;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN Adder_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  input [7:0]data;

  wire CA_1;
  wire CB_1;
  wire [7:0]byte_register_0_Q;
  wire [7:0]byte_register_1_Q;
  wire c_addsub_0_C_OUT;
  wire [7:0]c_addsub_0_S;
  wire clk_100MHz_1;
  wire [7:0]data_1;

  assign CA_1 = CA;
  assign CB_1 = CB;
  assign S[7:0] = c_addsub_0_S;
  assign carry = c_addsub_0_C_OUT;
  assign clk_100MHz_1 = clk_100MHz;
  assign data_1 = data[7:0];
  Adder_byte_register_0_1 byte_register_0
       (.D(data_1),
        .Q(byte_register_0_Q),
        .c(CB_1));
  Adder_byte_register_0_3 byte_register_1
       (.D(data_1),
        .Q(byte_register_1_Q),
        .c(CA_1));
  Adder_c_addsub_0_0 c_addsub_0
       (.A(byte_register_1_Q),
        .B(byte_register_0_Q),
        .CLK(clk_100MHz_1),
        .C_OUT(c_addsub_0_C_OUT),
        .S(c_addsub_0_S));
endmodule
