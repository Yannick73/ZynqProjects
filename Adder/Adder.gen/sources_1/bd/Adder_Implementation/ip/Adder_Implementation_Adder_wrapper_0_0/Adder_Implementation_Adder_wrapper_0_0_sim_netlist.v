// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Wed Jul  3 23:17:46 2024
// Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder_Implementation/ip/Adder_Implementation_Adder_wrapper_0_0/Adder_Implementation_Adder_wrapper_0_0_sim_netlist.v
// Design      : Adder_Implementation_Adder_wrapper_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Adder_Implementation_Adder_wrapper_0_0,Adder_wrapper,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "Adder_wrapper,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module Adder_Implementation_Adder_wrapper_0_0
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

  Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper inst
       (.CA(CA),
        .CB(CB),
        .S(S),
        .carry(carry),
        .clk_100MHz(clk_100MHz),
        .data(data));
endmodule

(* HW_HANDOFF = "Adder.hwdef" *) (* ORIG_REF_NAME = "Adder" *) 
module Adder_Implementation_Adder_wrapper_0_0_Adder
   (CA,
    CB,
    S,
    carry,
    clk_100MHz,
    data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CA CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CA, CLK_DOMAIN Adder_CA, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CA;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CB CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CB, CLK_DOMAIN Adder_CB, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CB;
  output [7:0]S;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.CARRY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.CARRY, LAYERED_METADATA undef" *) output carry;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN Adder_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  input [7:0]data;

  wire CA;
  wire CB;
  wire [7:0]S;
  wire [7:0]byte_register_0_Q;
  wire [7:0]byte_register_1_Q;
  wire carry;
  wire clk_100MHz;
  wire [7:0]data;

  (* X_CORE_INFO = "byte_register,Vivado 2024.1" *) 
  Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_1 byte_register_0
       (.D(data),
        .Q(byte_register_0_Q),
        .c(CB));
  (* X_CORE_INFO = "byte_register,Vivado 2024.1" *) 
  Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_3 byte_register_1
       (.D(data),
        .Q(byte_register_1_Q),
        .c(CA));
  (* X_CORE_INFO = "c_addsub_v12_0_18,Vivado 2024.1" *) 
  Adder_Implementation_Adder_wrapper_0_0_Adder_c_addsub_0_0 c_addsub_0
       (.A(byte_register_1_Q),
        .B(byte_register_0_Q),
        .CLK(clk_100MHz),
        .C_OUT(carry),
        .S(S));
endmodule

(* ORIG_REF_NAME = "Adder_byte_register_0_1" *) (* X_CORE_INFO = "byte_register,Vivado 2024.1" *) 
module Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_1
   (D,
    c,
    Q);
  input [7:0]D;
  (* syn_isclock = "1" *) input c;
  output [7:0]Q;


endmodule

(* ORIG_REF_NAME = "Adder_byte_register_0_3" *) (* X_CORE_INFO = "byte_register,Vivado 2024.1" *) 
module Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_3
   (D,
    c,
    Q);
  input [7:0]D;
  (* syn_isclock = "1" *) input c;
  output [7:0]Q;


endmodule

(* ORIG_REF_NAME = "Adder_c_addsub_0_0" *) (* X_CORE_INFO = "c_addsub_v12_0_18,Vivado 2024.1" *) 
module Adder_Implementation_Adder_wrapper_0_0_Adder_c_addsub_0_0
   (A,
    B,
    CLK,
    C_OUT,
    S);
  input [7:0]A;
  input [7:0]B;
  (* syn_isclock = "1" *) input CLK;
  output C_OUT;
  output [7:0]S;


endmodule

(* ORIG_REF_NAME = "Adder_wrapper" *) 
module Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper
   (S,
    carry,
    CA,
    CB,
    clk_100MHz,
    data);
  output [7:0]S;
  output carry;
  input CA;
  input CB;
  input clk_100MHz;
  input [7:0]data;

  wire CA;
  wire CB;
  wire [7:0]S;
  wire carry;
  wire clk_100MHz;
  wire [7:0]data;

  (* HW_HANDOFF = "Adder.hwdef" *) 
  Adder_Implementation_Adder_wrapper_0_0_Adder Adder_i
       (.CA(CA),
        .CB(CB),
        .S(S),
        .carry(carry),
        .clk_100MHz(clk_100MHz),
        .data(data));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
