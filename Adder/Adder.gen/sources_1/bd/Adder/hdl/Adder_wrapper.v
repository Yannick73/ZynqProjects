//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Wed Jul  3 23:45:41 2024
//Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target Adder_wrapper.bd
//Design      : Adder_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Adder_wrapper
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
  input clk_100MHz;
  input [7:0]data;

  wire CA;
  wire CB;
  wire [7:0]S;
  wire carry;
  wire clk_100MHz;
  wire [7:0]data;

  Adder Adder_i
       (.CA(CA),
        .CB(CB),
        .S(S),
        .carry(carry),
        .clk_100MHz(clk_100MHz),
        .data(data));
endmodule
