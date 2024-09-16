// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Sep 16 23:38:53 2024
// Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Test_Implementaiton_SpaceWire_light_AXI_0_2_sim_netlist.v
// Design      : Test_Implementaiton_SpaceWire_light_AXI_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI
   (axi_awready_reg,
    axi_arready_reg,
    axi_rvalid_reg,
    SPW_Dout,
    SPW_Sout,
    axi_streamout_tvalid,
    axi_streamout_tdata,
    axi_register_bvalid,
    axi_streamin_tready,
    axi_streamout_tlast,
    axi_register_wready,
    axi_streamin_tdata,
    axi_streamin_aresetn,
    SPW_Din,
    SPW_Sin,
    axi_streamin_tvalid,
    axi_streamout_tready,
    axi_streamout_aresetn,
    axi_register_wvalid,
    axi_register_awvalid,
    axi_register_aclk,
    axi_register_arvalid,
    axi_register_rready,
    SPW_main_clk,
    SPW_TX_clk,
    axi_streamin_aclk,
    axi_streamout_aclk,
    axi_register_bready,
    SPW_rst,
    axi_register_aresetn);
  output axi_awready_reg;
  output axi_arready_reg;
  output axi_rvalid_reg;
  output SPW_Dout;
  output SPW_Sout;
  output axi_streamout_tvalid;
  output [7:0]axi_streamout_tdata;
  output axi_register_bvalid;
  output axi_streamin_tready;
  output axi_streamout_tlast;
  output axi_register_wready;
  input [7:0]axi_streamin_tdata;
  input axi_streamin_aresetn;
  input SPW_Din;
  input SPW_Sin;
  input axi_streamin_tvalid;
  input axi_streamout_tready;
  input axi_streamout_aresetn;
  input axi_register_wvalid;
  input axi_register_awvalid;
  input axi_register_aclk;
  input axi_register_arvalid;
  input axi_register_rready;
  input SPW_main_clk;
  input SPW_TX_clk;
  input axi_streamin_aclk;
  input axi_streamout_aclk;
  input axi_register_bready;
  input SPW_rst;
  input axi_register_aresetn;

  wire [7:0]RXDATA;
  wire RXFLAG;
  wire RXVALID;
  wire SPW_Din;
  wire SPW_Dout;
  wire SPW_IF_n_14;
  wire SPW_IF_n_15;
  wire SPW_RXREAD;
  wire SPW_Sin;
  wire SPW_Sout;
  wire [7:0]SPW_TXFIFO;
  wire SPW_TXFLAG;
  wire SPW_TXWRITE;
  wire SPW_TX_clk;
  wire SPW_main_clk;
  wire SPW_rst;
  wire SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2;
  wire SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10;
  wire WEN10_out;
  wire axi_arready_reg;
  wire axi_awready_reg;
  wire axi_register_aclk;
  wire axi_register_aresetn;
  wire axi_register_arvalid;
  wire axi_register_awvalid;
  wire axi_register_bready;
  wire axi_register_bvalid;
  wire axi_register_rready;
  wire axi_register_wready;
  wire axi_register_wvalid;
  wire axi_rvalid_reg;
  wire axi_streamin_aclk;
  wire axi_streamin_aresetn;
  wire [7:0]axi_streamin_tdata;
  wire axi_streamin_tready;
  wire axi_streamin_tvalid;
  wire axi_streamout_aclk;
  wire axi_streamout_aresetn;
  wire [7:0]axi_streamout_tdata;
  wire axi_streamout_tlast;
  wire axi_streamout_tready;
  wire axi_streamout_tvalid;
  wire [6:6]out_fifo;
  wire out_fifo0;
  wire \res_seq_reg[txfull]__0 ;
  wire sel;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream SPW_IF
       (.E(out_fifo),
        .RDATA({RXFLAG,RXDATA}),
        .RXVALID(RXVALID),
        .SPW_Din(SPW_Din),
        .SPW_Dout(SPW_Dout),
        .SPW_RXREAD(SPW_RXREAD),
        .SPW_Sin(SPW_Sin),
        .SPW_Sout(SPW_Sout),
        .SPW_TXWRITE(SPW_TXWRITE),
        .SPW_TX_clk(SPW_TX_clk),
        .SPW_main_clk(SPW_main_clk),
        .SPW_rst(SPW_rst),
        .WDATA({SPW_TXFLAG,SPW_TXFIFO}),
        .WEN10_out(WEN10_out),
        .axi_streamout_aresetn(axi_streamout_aresetn),
        .axi_streamout_tlast(axi_streamout_tlast),
        .axi_streamout_tready(axi_streamout_tready),
        .\escape_fifo_reg[0] (SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2),
        .out_fifo0(out_fifo0),
        .\res_seq_reg[rxfifo_rvalid]_0 (SPW_IF_n_14),
        .\res_seq_reg[rxfifo_rvalid]_1 (SPW_IF_n_15),
        .\res_seq_reg[txdiscard]_0 (SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10),
        .\res_seq_reg[txfull]__0 (\res_seq_reg[txfull]__0 ),
        .sel(sel));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst
       (.E(out_fifo),
        .RDATA({RXFLAG,RXDATA}),
        .RXVALID(RXVALID),
        .SPW_RXREAD(SPW_RXREAD),
        .SPW_main_clk(SPW_main_clk),
        .axi_streamout_aclk(axi_streamout_aclk),
        .axi_streamout_aresetn(axi_streamout_aresetn),
        .axi_streamout_tdata(axi_streamout_tdata),
        .axi_streamout_tready(axi_streamout_tready),
        .axi_streamout_tvalid(axi_streamout_tvalid),
        .out_fifo0(out_fifo0),
        .\out_fifo_reg[6]_0 (SPW_IF_n_15),
        .\out_fifo_reg[7]_0 (SPW_IF_n_14),
        .rxflag_ff_reg_0(SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register_inst
       (.axi_arready_reg_0(axi_arready_reg),
        .axi_awready_reg_0(axi_awready_reg),
        .axi_register_aclk(axi_register_aclk),
        .axi_register_aresetn(axi_register_aresetn),
        .axi_register_arvalid(axi_register_arvalid),
        .axi_register_awvalid(axi_register_awvalid),
        .axi_register_bready(axi_register_bready),
        .axi_register_bvalid(axi_register_bvalid),
        .axi_register_rready(axi_register_rready),
        .axi_register_wready(axi_register_wready),
        .axi_register_wvalid(axi_register_wvalid),
        .axi_rvalid_reg_0(axi_rvalid_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst
       (.SPW_TXWRITE(SPW_TXWRITE),
        .SPW_main_clk(SPW_main_clk),
        .WDATA({SPW_TXFLAG,SPW_TXFIFO}),
        .WEN10_out(WEN10_out),
        .axi_streamin_aclk(axi_streamin_aclk),
        .axi_streamin_aresetn(axi_streamin_aresetn),
        .axi_streamin_tdata(axi_streamin_tdata),
        .axi_streamin_tready(axi_streamin_tready),
        .axi_streamin_tvalid(axi_streamin_tvalid),
        .fifo_full_clear_reg_0(SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10),
        .\res_seq_reg[txfull]__0 (\res_seq_reg[txfull]__0 ),
        .sel(sel));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut
   (axi_streamout_tvalid,
    SPW_RXREAD,
    rxflag_ff_reg_0,
    axi_streamout_tdata,
    axi_streamout_aclk,
    RDATA,
    SPW_main_clk,
    RXVALID,
    axi_streamout_tready,
    axi_streamout_aresetn,
    E,
    \out_fifo_reg[6]_0 ,
    out_fifo0,
    \out_fifo_reg[7]_0 );
  output axi_streamout_tvalid;
  output SPW_RXREAD;
  output rxflag_ff_reg_0;
  output [7:0]axi_streamout_tdata;
  input axi_streamout_aclk;
  input [8:0]RDATA;
  input SPW_main_clk;
  input RXVALID;
  input axi_streamout_tready;
  input axi_streamout_aresetn;
  input [0:0]E;
  input \out_fifo_reg[6]_0 ;
  input out_fifo0;
  input \out_fifo_reg[7]_0 ;

  wire [0:0]E;
  wire \M_AXIS_TDATA[0]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[1]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[2]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[3]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[4]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[5]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[6]__0_i_1_n_0 ;
  wire \M_AXIS_TDATA[7]__0_i_1_n_0 ;
  wire [7:0]M_AXIS_TDATA_reg;
  wire M_AXIS_TVALID0;
  wire [8:0]RDATA;
  wire RXVALID;
  wire SPW_RXREAD;
  wire SPW_main_clk;
  wire axi_streamout_aclk;
  wire axi_streamout_aresetn;
  wire [7:0]axi_streamout_tdata;
  wire axi_streamout_tready;
  wire axi_streamout_tvalid;
  wire [7:0]escape_fifo;
  wire \escape_fifo[7]_i_3_n_0 ;
  wire fifo_full;
  wire fifo_full_i_1_n_0;
  wire out_fifo0;
  wire \out_fifo[0]_i_1_n_0 ;
  wire \out_fifo[1]_i_1_n_0 ;
  wire \out_fifo[2]_i_1_n_0 ;
  wire \out_fifo[3]_i_1_n_0 ;
  wire \out_fifo[4]_i_1_n_0 ;
  wire \out_fifo[5]_i_1_n_0 ;
  wire \out_fifo[6]_i_2_n_0 ;
  wire \out_fifo[7]_i_1_n_0 ;
  wire \out_fifo_reg[6]_0 ;
  wire \out_fifo_reg[7]_0 ;
  wire \out_fifo_reg_n_0_[0] ;
  wire \out_fifo_reg_n_0_[1] ;
  wire \out_fifo_reg_n_0_[2] ;
  wire \out_fifo_reg_n_0_[3] ;
  wire \out_fifo_reg_n_0_[4] ;
  wire \out_fifo_reg_n_0_[5] ;
  wire \out_fifo_reg_n_0_[6] ;
  wire \out_fifo_reg_n_0_[7] ;
  wire read_spw_rx_i_1_n_0;
  wire [7:0]rxfifo_ff;
  wire \rxfifo_ff[7]_i_1_n_0 ;
  wire rxflag_ff_reg_0;
  wire rxflag_ff_reg_n_0;
  wire send_escape;
  wire send_escape_i_1_n_0;

  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[0]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[0] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[0]),
        .O(\M_AXIS_TDATA[0]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[1]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[1] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[1]),
        .O(\M_AXIS_TDATA[1]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[2]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[2] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[2]),
        .O(\M_AXIS_TDATA[2]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[3]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[3] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[3]),
        .O(\M_AXIS_TDATA[3]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[4]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[4] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[4]),
        .O(\M_AXIS_TDATA[4]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[5]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[5] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[5]),
        .O(\M_AXIS_TDATA[5]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[6]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[6] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[6]),
        .O(\M_AXIS_TDATA[6]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \M_AXIS_TDATA[7]__0_i_1 
       (.I0(\out_fifo_reg_n_0_[7] ),
        .I1(axi_streamout_tready),
        .I2(fifo_full),
        .I3(M_AXIS_TDATA_reg[7]),
        .O(\M_AXIS_TDATA[7]__0_i_1_n_0 ));
  FDRE \M_AXIS_TDATA_reg[0] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[0]),
        .Q(M_AXIS_TDATA_reg[0]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[0]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[0]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[0]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[1] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[1]),
        .Q(M_AXIS_TDATA_reg[1]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[1]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[1]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[1]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[2] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[2]),
        .Q(M_AXIS_TDATA_reg[2]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[2]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[2]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[2]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[3] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[3]),
        .Q(M_AXIS_TDATA_reg[3]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[3]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[3]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[3]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[4] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[4]),
        .Q(M_AXIS_TDATA_reg[4]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[4]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[4]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[4]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[5] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[5]),
        .Q(M_AXIS_TDATA_reg[5]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[5]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[5]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[5]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[6] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[6]),
        .Q(M_AXIS_TDATA_reg[6]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[6]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[6]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[6]),
        .R(1'b0));
  FDRE \M_AXIS_TDATA_reg[7] 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(axi_streamout_tdata[7]),
        .Q(M_AXIS_TDATA_reg[7]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \M_AXIS_TDATA_reg[7]__0 
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(\M_AXIS_TDATA[7]__0_i_1_n_0 ),
        .Q(axi_streamout_tdata[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h2)) 
    M_AXIS_TVALID_i_1
       (.I0(axi_streamout_tready),
        .I1(fifo_full),
        .O(M_AXIS_TVALID0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    M_AXIS_TVALID_reg
       (.C(axi_streamout_aclk),
        .CE(1'b1),
        .D(M_AXIS_TVALID0),
        .Q(axi_streamout_tvalid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h5555555545555555)) 
    \escape_fifo[7]_i_2 
       (.I0(rxflag_ff_reg_n_0),
        .I1(\escape_fifo[7]_i_3_n_0 ),
        .I2(rxfifo_ff[2]),
        .I3(rxfifo_ff[5]),
        .I4(rxfifo_ff[0]),
        .I5(rxfifo_ff[1]),
        .O(rxflag_ff_reg_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \escape_fifo[7]_i_3 
       (.I0(rxfifo_ff[6]),
        .I1(rxfifo_ff[7]),
        .I2(rxfifo_ff[4]),
        .I3(rxfifo_ff[3]),
        .O(\escape_fifo[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[0] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[0]),
        .Q(escape_fifo[0]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[1] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[1]),
        .Q(escape_fifo[1]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[2] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[2]),
        .Q(escape_fifo[2]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[3] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[3]),
        .Q(escape_fifo[3]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[4] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[4]),
        .Q(escape_fifo[4]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[5] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[5]),
        .Q(escape_fifo[5]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[6] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[6]),
        .Q(escape_fifo[6]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \escape_fifo_reg[7] 
       (.C(SPW_main_clk),
        .CE(E),
        .D(rxfifo_ff[7]),
        .Q(escape_fifo[7]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h55C00000)) 
    fifo_full_i_1
       (.I0(axi_streamout_tvalid),
        .I1(RXVALID),
        .I2(axi_streamout_tready),
        .I3(fifo_full),
        .I4(axi_streamout_aresetn),
        .O(fifo_full_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fifo_full_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(fifo_full_i_1_n_0),
        .Q(fifo_full),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[0]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[0]),
        .I4(send_escape),
        .I5(escape_fifo[0]),
        .O(\out_fifo[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \out_fifo[1]_i_1 
       (.I0(\out_fifo_reg_n_0_[1] ),
        .I1(out_fifo0),
        .I2(rxfifo_ff[1]),
        .I3(send_escape),
        .I4(escape_fifo[1]),
        .I5(\out_fifo_reg[7]_0 ),
        .O(\out_fifo[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[2]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[2]),
        .I4(send_escape),
        .I5(escape_fifo[2]),
        .O(\out_fifo[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[3]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[3]),
        .I4(send_escape),
        .I5(escape_fifo[3]),
        .O(\out_fifo[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[4]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[4]),
        .I4(send_escape),
        .I5(escape_fifo[4]),
        .O(\out_fifo[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[5]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[5]),
        .I4(send_escape),
        .I5(escape_fifo[5]),
        .O(\out_fifo[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF080808FF08)) 
    \out_fifo[6]_i_2 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(rxfifo_ff[6]),
        .I4(send_escape),
        .I5(escape_fifo[6]),
        .O(\out_fifo[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \out_fifo[7]_i_1 
       (.I0(\out_fifo_reg_n_0_[7] ),
        .I1(out_fifo0),
        .I2(rxfifo_ff[7]),
        .I3(send_escape),
        .I4(escape_fifo[7]),
        .I5(\out_fifo_reg[7]_0 ),
        .O(\out_fifo[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[0] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[0]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[0] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\out_fifo[1]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[2] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[2]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[2] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[3] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[3]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[3] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[4] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[4]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[4] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[5] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[5]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[5] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[6] 
       (.C(SPW_main_clk),
        .CE(\out_fifo_reg[6]_0 ),
        .D(\out_fifo[6]_i_2_n_0 ),
        .Q(\out_fifo_reg_n_0_[6] ),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_fifo_reg[7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\out_fifo[7]_i_1_n_0 ),
        .Q(\out_fifo_reg_n_0_[7] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF08FF8800000000)) 
    read_spw_rx_i_1
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(rxflag_ff_reg_0),
        .I3(SPW_RXREAD),
        .I4(send_escape),
        .I5(axi_streamout_aresetn),
        .O(read_spw_rx_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    read_spw_rx_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(read_spw_rx_i_1_n_0),
        .Q(SPW_RXREAD),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \rxfifo_ff[7]_i_1 
       (.I0(axi_streamout_aresetn),
        .O(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[0]),
        .Q(rxfifo_ff[0]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[1]),
        .Q(rxfifo_ff[1]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[2]),
        .Q(rxfifo_ff[2]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[3]),
        .Q(rxfifo_ff[3]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[4]),
        .Q(rxfifo_ff[4]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[5]),
        .Q(rxfifo_ff[5]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[6] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[6]),
        .Q(rxfifo_ff[6]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \rxfifo_ff_reg[7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[7]),
        .Q(rxfifo_ff[7]),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    rxflag_ff_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(RDATA[8]),
        .Q(rxflag_ff_reg_n_0),
        .R(\rxfifo_ff[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AEA0000)) 
    send_escape_i_1
       (.I0(send_escape),
        .I1(RXVALID),
        .I2(axi_streamout_tready),
        .I3(rxflag_ff_reg_0),
        .I4(axi_streamout_aresetn),
        .O(send_escape_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    send_escape_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(send_escape_i_1_n_0),
        .Q(send_escape),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register
   (axi_register_bvalid,
    axi_awready_reg_0,
    axi_register_wready,
    axi_rvalid_reg_0,
    axi_arready_reg_0,
    axi_register_aclk,
    axi_register_aresetn,
    axi_register_wvalid,
    axi_register_bready,
    axi_register_awvalid,
    axi_register_arvalid,
    axi_register_rready);
  output axi_register_bvalid;
  output axi_awready_reg_0;
  output axi_register_wready;
  output axi_rvalid_reg_0;
  output axi_arready_reg_0;
  input axi_register_aclk;
  input axi_register_aresetn;
  input axi_register_wvalid;
  input axi_register_bready;
  input axi_register_awvalid;
  input axi_register_arvalid;
  input axi_register_rready;

  wire \FSM_onehot_state_write[1]_i_1_n_0 ;
  wire \FSM_onehot_state_write[2]_i_1_n_0 ;
  wire \FSM_onehot_state_write_reg_n_0_[1] ;
  wire \FSM_onehot_state_write_reg_n_0_[2] ;
  wire \FSM_sequential_state_read[0]_i_1_n_0 ;
  wire \FSM_sequential_state_read[1]_i_1_n_0 ;
  wire axi_arready_i_1_n_0;
  wire axi_arready_reg_0;
  wire axi_awready_i_1_n_0;
  wire axi_awready_i_2_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_bvalid_i_2_n_0;
  wire axi_bvalid_i_3_n_0;
  wire axi_register_aclk;
  wire axi_register_aresetn;
  wire axi_register_arvalid;
  wire axi_register_awvalid;
  wire axi_register_bready;
  wire axi_register_bvalid;
  wire axi_register_rready;
  wire axi_register_wready;
  wire axi_register_wvalid;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready;
  wire axi_wready_i_1_n_0;
  wire [1:0]state_read;

  LUT6 #(
    .INIT(64'hFFFFBFAAFFFFBF00)) 
    \FSM_onehot_state_write[1]_i_1 
       (.I0(axi_register_wvalid),
        .I1(axi_register_awvalid),
        .I2(axi_awready_reg_0),
        .I3(\FSM_onehot_state_write_reg_n_0_[1] ),
        .I4(axi_wready),
        .I5(\FSM_onehot_state_write_reg_n_0_[2] ),
        .O(\FSM_onehot_state_write[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0F0F0800)) 
    \FSM_onehot_state_write[2]_i_1 
       (.I0(axi_awready_reg_0),
        .I1(axi_register_awvalid),
        .I2(axi_register_wvalid),
        .I3(\FSM_onehot_state_write_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_write_reg_n_0_[2] ),
        .O(\FSM_onehot_state_write[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:001,wdata:100,waddr:010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_write_reg[0] 
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(1'b0),
        .Q(axi_wready),
        .S(axi_awready_i_1_n_0));
  (* FSM_ENCODED_STATES = "idle:001,wdata:100,waddr:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_write_reg[1] 
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state_write[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_write_reg_n_0_[1] ),
        .R(axi_awready_i_1_n_0));
  (* FSM_ENCODED_STATES = "idle:001,wdata:100,waddr:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_write_reg[2] 
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state_write[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_write_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF0007777FFFF)) 
    \FSM_sequential_state_read[0]_i_1 
       (.I0(axi_register_arvalid),
        .I1(axi_arready_reg_0),
        .I2(axi_register_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0FFF88880000)) 
    \FSM_sequential_state_read[1]_i_1 
       (.I0(axi_arready_reg_0),
        .I1(axi_register_arvalid),
        .I2(axi_register_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:00,rdata:10,raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[0] 
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[0]_i_1_n_0 ),
        .Q(state_read[0]),
        .R(axi_awready_i_1_n_0));
  (* FSM_ENCODED_STATES = "idle:00,rdata:10,raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[1] 
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .Q(state_read[1]),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hC4C4C4C4FFCFCFCF)) 
    axi_arready_i_1
       (.I0(axi_register_arvalid),
        .I1(axi_arready_reg_0),
        .I2(state_read[1]),
        .I3(axi_register_rready),
        .I4(axi_rvalid_reg_0),
        .I5(state_read[0]),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(axi_arready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(axi_register_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFAFFEAEAFFFFEAEA)) 
    axi_awready_i_2
       (.I0(axi_wready),
        .I1(\FSM_onehot_state_write_reg_n_0_[2] ),
        .I2(axi_register_wvalid),
        .I3(\FSM_onehot_state_write_reg_n_0_[1] ),
        .I4(axi_awready_reg_0),
        .I5(axi_register_awvalid),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(axi_awready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAAA8ABA8BB88BB88)) 
    axi_bvalid_i_1
       (.I0(axi_bvalid_i_2_n_0),
        .I1(axi_bvalid_i_3_n_0),
        .I2(axi_register_wvalid),
        .I3(axi_register_bvalid),
        .I4(axi_register_bready),
        .I5(\FSM_onehot_state_write_reg_n_0_[2] ),
        .O(axi_bvalid_i_1_n_0));
  LUT6 #(
    .INIT(64'hFAEAEAEAEAEAEAEA)) 
    axi_bvalid_i_2
       (.I0(axi_wready),
        .I1(\FSM_onehot_state_write_reg_n_0_[2] ),
        .I2(axi_register_wvalid),
        .I3(\FSM_onehot_state_write_reg_n_0_[1] ),
        .I4(axi_register_awvalid),
        .I5(axi_awready_reg_0),
        .O(axi_bvalid_i_2_n_0));
  LUT6 #(
    .INIT(64'hAA80808080808080)) 
    axi_bvalid_i_3
       (.I0(\FSM_onehot_state_write_reg_n_0_[1] ),
        .I1(axi_register_bvalid),
        .I2(axi_register_bready),
        .I3(axi_awready_reg_0),
        .I4(axi_register_awvalid),
        .I5(axi_register_wvalid),
        .O(axi_bvalid_i_3_n_0));
  FDRE axi_bvalid_reg
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(axi_register_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0FFFFFF00800080)) 
    axi_rvalid_i_1
       (.I0(axi_arready_reg_0),
        .I1(axi_register_arvalid),
        .I2(state_read[0]),
        .I3(state_read[1]),
        .I4(axi_register_rready),
        .I5(axi_rvalid_reg_0),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    axi_wready_i_1
       (.I0(axi_wready),
        .I1(axi_register_wready),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(axi_register_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(axi_register_wready),
        .R(axi_awready_i_1_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn
   (SPW_TXWRITE,
    WDATA,
    fifo_full_clear_reg_0,
    axi_streamin_tready,
    WEN10_out,
    SPW_main_clk,
    axi_streamin_aclk,
    axi_streamin_tdata,
    axi_streamin_aresetn,
    sel,
    axi_streamin_tvalid,
    \res_seq_reg[txfull]__0 );
  output SPW_TXWRITE;
  output [8:0]WDATA;
  output fifo_full_clear_reg_0;
  output axi_streamin_tready;
  output WEN10_out;
  input SPW_main_clk;
  input axi_streamin_aclk;
  input [7:0]axi_streamin_tdata;
  input axi_streamin_aresetn;
  input sel;
  input axi_streamin_tvalid;
  input \res_seq_reg[txfull]__0 ;

  wire SPW_TXWRITE;
  wire SPW_main_clk;
  wire [8:0]WDATA;
  wire WEN10_out;
  wire axi_streamin_aclk;
  wire axi_streamin_aresetn;
  wire [7:0]axi_streamin_tdata;
  wire axi_streamin_tready;
  wire axi_streamin_tvalid;
  wire [7:0]char_fifo;
  wire \char_fifo[0]_i_1_n_0 ;
  wire \char_fifo[1]_i_1_n_0 ;
  wire \char_fifo[2]_i_1_n_0 ;
  wire \char_fifo[3]_i_1_n_0 ;
  wire \char_fifo[4]_i_1_n_0 ;
  wire \char_fifo[5]_i_1_n_0 ;
  wire \char_fifo[6]_i_1_n_0 ;
  wire \char_fifo[6]_i_2_n_0 ;
  wire \char_fifo[6]_i_3_n_0 ;
  wire \char_fifo[6]_i_4_n_0 ;
  wire \char_fifo[6]_i_6_n_0 ;
  wire \char_fifo[7]_i_1_n_0 ;
  wire fifo_full_clear_reg_0;
  wire fifo_full_i_1__0_n_0;
  wire fifo_full_reg_n_0;
  wire previous_escape5_out;
  wire previous_escape_i_1_n_0;
  wire previous_escape_reg_n_0;
  wire \res_seq_reg[txfull]__0 ;
  wire sel;
  wire txflag_fifo;
  wire txflag_fifo_i_1_n_0;

  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[0] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[0]),
        .Q(WDATA[0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[1] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[1]),
        .Q(WDATA[1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[2] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[2]),
        .Q(WDATA[2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[3] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[3]),
        .Q(WDATA[3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[4] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[4]),
        .Q(WDATA[4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[5] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[5]),
        .Q(WDATA[5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[6] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[6]),
        .Q(WDATA[6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \SPW_TXFIFO_reg[7] 
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(char_fifo[7]),
        .Q(WDATA[7]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    SPW_TXFLAG_reg
       (.C(SPW_main_clk),
        .CE(fifo_full_reg_n_0),
        .D(txflag_fifo),
        .Q(WDATA[8]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TXMEM_i_1
       (.I0(SPW_TXWRITE),
        .I1(\res_seq_reg[txfull]__0 ),
        .O(WEN10_out));
  LUT2 #(
    .INIT(4'h1)) 
    axi_streamin_tready_INST_0
       (.I0(fifo_full_reg_n_0),
        .I1(\res_seq_reg[txfull]__0 ),
        .O(axi_streamin_tready));
  LUT5 #(
    .INIT(32'hF0D02000)) 
    \char_fifo[0]_i_1 
       (.I0(axi_streamin_tvalid),
        .I1(previous_escape5_out),
        .I2(axi_streamin_aresetn),
        .I3(axi_streamin_tdata[0]),
        .I4(char_fifo[0]),
        .O(\char_fifo[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0D02000)) 
    \char_fifo[1]_i_1 
       (.I0(axi_streamin_tvalid),
        .I1(previous_escape5_out),
        .I2(axi_streamin_aresetn),
        .I3(axi_streamin_tdata[1]),
        .I4(char_fifo[1]),
        .O(\char_fifo[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \char_fifo[2]_i_1 
       (.I0(axi_streamin_tdata[2]),
        .I1(axi_streamin_aresetn),
        .I2(previous_escape_reg_n_0),
        .O(\char_fifo[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \char_fifo[3]_i_1 
       (.I0(axi_streamin_tdata[3]),
        .I1(axi_streamin_aresetn),
        .I2(previous_escape_reg_n_0),
        .O(\char_fifo[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \char_fifo[4]_i_1 
       (.I0(axi_streamin_tdata[4]),
        .I1(axi_streamin_aresetn),
        .I2(previous_escape_reg_n_0),
        .O(\char_fifo[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \char_fifo[5]_i_1 
       (.I0(axi_streamin_tdata[5]),
        .I1(axi_streamin_aresetn),
        .I2(previous_escape_reg_n_0),
        .O(\char_fifo[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \char_fifo[6]_i_1 
       (.I0(axi_streamin_aresetn),
        .I1(axi_streamin_tvalid),
        .I2(\char_fifo[6]_i_4_n_0 ),
        .I3(axi_streamin_tdata[6]),
        .I4(previous_escape_reg_n_0),
        .O(\char_fifo[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h2F)) 
    \char_fifo[6]_i_2 
       (.I0(axi_streamin_tvalid),
        .I1(previous_escape5_out),
        .I2(axi_streamin_aresetn),
        .O(\char_fifo[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \char_fifo[6]_i_3 
       (.I0(previous_escape_reg_n_0),
        .I1(axi_streamin_tdata[6]),
        .I2(axi_streamin_aresetn),
        .O(\char_fifo[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \char_fifo[6]_i_4 
       (.I0(axi_streamin_tdata[4]),
        .I1(axi_streamin_tdata[1]),
        .I2(axi_streamin_tdata[3]),
        .I3(\char_fifo[6]_i_6_n_0 ),
        .O(\char_fifo[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \char_fifo[6]_i_5 
       (.I0(previous_escape_reg_n_0),
        .I1(axi_streamin_tdata[6]),
        .I2(\char_fifo[6]_i_6_n_0 ),
        .I3(axi_streamin_tdata[3]),
        .I4(axi_streamin_tdata[1]),
        .I5(axi_streamin_tdata[4]),
        .O(previous_escape5_out));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \char_fifo[6]_i_6 
       (.I0(axi_streamin_tdata[0]),
        .I1(axi_streamin_tdata[2]),
        .I2(axi_streamin_tdata[5]),
        .I3(axi_streamin_tdata[7]),
        .O(\char_fifo[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hD0D0F0D000002000)) 
    \char_fifo[7]_i_1 
       (.I0(axi_streamin_tvalid),
        .I1(previous_escape5_out),
        .I2(axi_streamin_aresetn),
        .I3(axi_streamin_tdata[7]),
        .I4(previous_escape_reg_n_0),
        .I5(char_fifo[7]),
        .O(\char_fifo[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \char_fifo_reg[0] 
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(\char_fifo[0]_i_1_n_0 ),
        .Q(char_fifo[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \char_fifo_reg[1] 
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(\char_fifo[1]_i_1_n_0 ),
        .Q(char_fifo[1]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \char_fifo_reg[2] 
       (.C(axi_streamin_aclk),
        .CE(\char_fifo[6]_i_2_n_0 ),
        .D(\char_fifo[2]_i_1_n_0 ),
        .Q(char_fifo[2]),
        .S(\char_fifo[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \char_fifo_reg[3] 
       (.C(axi_streamin_aclk),
        .CE(\char_fifo[6]_i_2_n_0 ),
        .D(\char_fifo[3]_i_1_n_0 ),
        .Q(char_fifo[3]),
        .S(\char_fifo[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \char_fifo_reg[4] 
       (.C(axi_streamin_aclk),
        .CE(\char_fifo[6]_i_2_n_0 ),
        .D(\char_fifo[4]_i_1_n_0 ),
        .Q(char_fifo[4]),
        .S(\char_fifo[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \char_fifo_reg[5] 
       (.C(axi_streamin_aclk),
        .CE(\char_fifo[6]_i_2_n_0 ),
        .D(\char_fifo[5]_i_1_n_0 ),
        .Q(char_fifo[5]),
        .S(\char_fifo[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \char_fifo_reg[6] 
       (.C(axi_streamin_aclk),
        .CE(\char_fifo[6]_i_2_n_0 ),
        .D(\char_fifo[6]_i_3_n_0 ),
        .Q(char_fifo[6]),
        .S(\char_fifo[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \char_fifo_reg[7] 
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(\char_fifo[7]_i_1_n_0 ),
        .Q(char_fifo[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    fifo_full_clear_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(fifo_full_reg_n_0),
        .Q(SPW_TXWRITE),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h2F002200)) 
    fifo_full_i_1__0
       (.I0(axi_streamin_tvalid),
        .I1(previous_escape5_out),
        .I2(SPW_TXWRITE),
        .I3(axi_streamin_aresetn),
        .I4(fifo_full_reg_n_0),
        .O(fifo_full_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fifo_full_reg
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(fifo_full_i_1__0_n_0),
        .Q(fifo_full_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA808)) 
    previous_escape_i_1
       (.I0(axi_streamin_aresetn),
        .I1(previous_escape_reg_n_0),
        .I2(axi_streamin_tvalid),
        .I3(previous_escape5_out),
        .O(previous_escape_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    previous_escape_reg
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(previous_escape_i_1_n_0),
        .Q(previous_escape_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \res_seq[txdiscard]_i_2 
       (.I0(SPW_TXWRITE),
        .I1(sel),
        .O(fifo_full_clear_reg_0));
  LUT6 #(
    .INIT(64'hDF758A0000000000)) 
    txflag_fifo_i_1
       (.I0(axi_streamin_tvalid),
        .I1(\char_fifo[6]_i_4_n_0 ),
        .I2(axi_streamin_tdata[6]),
        .I3(previous_escape_reg_n_0),
        .I4(txflag_fifo),
        .I5(axi_streamin_aresetn),
        .O(txflag_fifo_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    txflag_fifo_reg
       (.C(axi_streamin_aclk),
        .CE(1'b1),
        .D(txflag_fifo_i_1_n_0),
        .Q(txflag_fifo),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam
   (RADDR,
    WADDR,
    WDATA,
    WEN,
    CLK,
    RDATA);
  input [15:0]RADDR;
  input [15:0]WADDR;
  input [8:0]WDATA;
  input WEN;
  input CLK;
  output [8:0]RDATA;


endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink
   (\state_seq_reg[timerdone]__0 ,
    \xmiti[fct_in] ,
    recv_rxen,
    \v[pend_char] ,
    \FSM_onehot_state_seq_reg[state][3]_0 ,
    \FSM_onehot_state_seq_reg[state][3]_1 ,
    \FSM_onehot_state_seq_reg[state][1]_0 ,
    \state_seq_reg[timercnt][7]_0 ,
    \vres[txdiscard] ,
    \vres[txpacket]5_out ,
    \res_com[txfifo_rvalid] ,
    \res_seq_reg[txfifo_rvalid] ,
    \res_com[txfull] ,
    \res_seq_reg[txfiforoom][16] ,
    \state_seq_reg[tx_credit][3]_0 ,
    \v[allow_char] ,
    AR,
    \vres[inbvalid]0_out ,
    load,
    \state_seq_reg[rxen]_0 ,
    \vres[rxeep]3_out ,
    DI,
    SPW_main_clk,
    \state_seq_reg[rxen]_1 ,
    Q,
    \state_seq_reg[rx_null_fct]_0 ,
    \recvo[gotfct] ,
    \recvo[gotnull] ,
    \FSM_onehot_state_seq_reg[state][0]_0 ,
    \FSM_onehot_state_seq_reg[state][4]_0 ,
    \state_seq_reg[timercnt][0]_0 ,
    \res_seq_reg[txdiscard] ,
    D,
    \res_seq_reg[txdiscard]_0 ,
    \res_seq_reg[txdiscard]__0 ,
    \vres[txfiforoom]0_in ,
    SPW_TXWRITE,
    O,
    \res_seq_reg[txfifo_rvalid]_0 ,
    \res_seq_reg[txfiforoom][15] ,
    \res_seq_reg[txfiforoom][11] ,
    \res_seq_reg[txfiforoom][7] ,
    \res_seq_reg[txfiforoom][3] ,
    \res_seq_reg[txfifo_rvalid]__0 ,
    \res_seq_reg[txfifo_raddr][15] ,
    \res_seq_reg[allow_fct]__0 ,
    \res_seq_reg[pend_fct]__0 ,
    \recvo[rxchar] ,
    \res_seq_reg[sent_fct]__0 ,
    sys_rst_n,
    \res_seq_reg[inbvalid] ,
    \syncsys[rxcnt_ddr_gray] ,
    \res_seq_reg[rxeep]__0 ,
    \res_seq_reg[rxfull]__0 ,
    \res_seq_reg[rxeep] ,
    \FSM_onehot_state_seq_reg[state][2]_0 );
  output \state_seq_reg[timerdone]__0 ;
  output \xmiti[fct_in] ;
  output recv_rxen;
  output \v[pend_char] ;
  output \FSM_onehot_state_seq_reg[state][3]_0 ;
  output [1:0]\FSM_onehot_state_seq_reg[state][3]_1 ;
  output \FSM_onehot_state_seq_reg[state][1]_0 ;
  output \state_seq_reg[timercnt][7]_0 ;
  output \vres[txdiscard] ;
  output \vres[txpacket]5_out ;
  output \res_com[txfifo_rvalid] ;
  output \res_seq_reg[txfifo_rvalid] ;
  output \res_com[txfull] ;
  output [16:0]\res_seq_reg[txfiforoom][16] ;
  output \state_seq_reg[tx_credit][3]_0 ;
  output \v[allow_char] ;
  output [0:0]AR;
  output \vres[inbvalid]0_out ;
  output load;
  output [2:0]\state_seq_reg[rxen]_0 ;
  output \vres[rxeep]3_out ;
  input [0:0]DI;
  input SPW_main_clk;
  input \state_seq_reg[rxen]_1 ;
  input [5:0]Q;
  input \state_seq_reg[rx_null_fct]_0 ;
  input \recvo[gotfct] ;
  input \recvo[gotnull] ;
  input \FSM_onehot_state_seq_reg[state][0]_0 ;
  input \FSM_onehot_state_seq_reg[state][4]_0 ;
  input \state_seq_reg[timercnt][0]_0 ;
  input \res_seq_reg[txdiscard] ;
  input [0:0]D;
  input \res_seq_reg[txdiscard]_0 ;
  input \res_seq_reg[txdiscard]__0 ;
  input [16:0]\vres[txfiforoom]0_in ;
  input SPW_TXWRITE;
  input [0:0]O;
  input [16:0]\res_seq_reg[txfifo_rvalid]_0 ;
  input [3:0]\res_seq_reg[txfiforoom][15] ;
  input [3:0]\res_seq_reg[txfiforoom][11] ;
  input [3:0]\res_seq_reg[txfiforoom][7] ;
  input [3:0]\res_seq_reg[txfiforoom][3] ;
  input \res_seq_reg[txfifo_rvalid]__0 ;
  input \res_seq_reg[txfifo_raddr][15] ;
  input \res_seq_reg[allow_fct]__0 ;
  input \res_seq_reg[pend_fct]__0 ;
  input \recvo[rxchar] ;
  input \res_seq_reg[sent_fct]__0 ;
  input sys_rst_n;
  input \res_seq_reg[inbvalid] ;
  input [2:0]\syncsys[rxcnt_ddr_gray] ;
  input \res_seq_reg[rxeep]__0 ;
  input \res_seq_reg[rxfull]__0 ;
  input \res_seq_reg[rxeep] ;
  input [0:0]\FSM_onehot_state_seq_reg[state][2]_0 ;

  wire [0:0]AR;
  wire [0:0]D;
  wire [0:0]DI;
  wire \FSM_onehot_state_seq[state][0]_i_1_n_0 ;
  wire \FSM_onehot_state_seq[state][1]_i_1_n_0 ;
  wire \FSM_onehot_state_seq[state][3]_i_1_n_0 ;
  wire \FSM_onehot_state_seq[state][4]_i_1_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_1_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_3_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_4_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_5_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_6_n_0 ;
  wire \FSM_onehot_state_seq[state][5]_i_7_n_0 ;
  wire \FSM_onehot_state_seq_reg[state][0]_0 ;
  wire \FSM_onehot_state_seq_reg[state][1]_0 ;
  wire [0:0]\FSM_onehot_state_seq_reg[state][2]_0 ;
  wire \FSM_onehot_state_seq_reg[state][3]_0 ;
  wire [1:0]\FSM_onehot_state_seq_reg[state][3]_1 ;
  wire \FSM_onehot_state_seq_reg[state][4]_0 ;
  wire \FSM_onehot_state_seq_reg[state_n_0_][0] ;
  wire \FSM_onehot_state_seq_reg[state_n_0_][4] ;
  wire \FSM_onehot_state_seq_reg[state_n_0_][5] ;
  wire [0:0]O;
  wire [5:0]Q;
  wire SPW_TXWRITE;
  wire SPW_main_clk;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_5_n_0;
  wire load;
  wire p_0_in9_in;
  wire \p_1_out_inferred__0/i__carry__0_n_2 ;
  wire \p_1_out_inferred__0/i__carry__0_n_3 ;
  wire \p_1_out_inferred__0/i__carry_n_0 ;
  wire \p_1_out_inferred__0/i__carry_n_1 ;
  wire \p_1_out_inferred__0/i__carry_n_2 ;
  wire \p_1_out_inferred__0/i__carry_n_3 ;
  wire recv_rxen;
  wire \recvo[gotfct] ;
  wire \recvo[gotnull] ;
  wire \recvo[rxchar] ;
  wire \res_com[txfifo_rvalid] ;
  wire \res_com[txfull] ;
  wire \res_seq[txfull]_i_2_n_0 ;
  wire \res_seq[txfull]_i_3_n_0 ;
  wire \res_seq[txfull]_i_4_n_0 ;
  wire \res_seq[txfull]_i_5_n_0 ;
  wire \res_seq_reg[allow_fct]__0 ;
  wire \res_seq_reg[inbvalid] ;
  wire \res_seq_reg[pend_fct]__0 ;
  wire \res_seq_reg[rxeep] ;
  wire \res_seq_reg[rxeep]__0 ;
  wire \res_seq_reg[rxfull]__0 ;
  wire \res_seq_reg[sent_fct]__0 ;
  wire \res_seq_reg[txdiscard] ;
  wire \res_seq_reg[txdiscard]_0 ;
  wire \res_seq_reg[txdiscard]__0 ;
  wire \res_seq_reg[txfifo_raddr][15] ;
  wire \res_seq_reg[txfifo_rvalid] ;
  wire [16:0]\res_seq_reg[txfifo_rvalid]_0 ;
  wire \res_seq_reg[txfifo_rvalid]__0 ;
  wire [3:0]\res_seq_reg[txfiforoom][11] ;
  wire [3:0]\res_seq_reg[txfiforoom][15] ;
  wire [16:0]\res_seq_reg[txfiforoom][16] ;
  wire [3:0]\res_seq_reg[txfiforoom][3] ;
  wire [3:0]\res_seq_reg[txfiforoom][7] ;
  wire [6:0]\state_com[timercnt] ;
  wire \state_seq[errcred]_i_1_n_0 ;
  wire \state_seq[errcred]_i_2_n_0 ;
  wire \state_seq[errcred]_i_3_n_0 ;
  wire \state_seq[errcred]_i_4_n_0 ;
  wire \state_seq[errcred]_i_5_n_0 ;
  wire \state_seq[rx_null_fct]_i_1_n_0 ;
  wire \state_seq[rxen]_i_1_n_0 ;
  wire \state_seq[timercnt][2]_i_2_n_0 ;
  wire \state_seq[timercnt][3]_i_2_n_0 ;
  wire \state_seq[timercnt][4]_i_2_n_0 ;
  wire \state_seq[timercnt][5]_i_2_n_0 ;
  wire \state_seq[timercnt][7]_i_1_n_0 ;
  wire \state_seq[timercnt][7]_i_2_n_0 ;
  wire \state_seq[timercnt][8]_i_1_n_0 ;
  wire \state_seq[timercnt][8]_i_2_n_0 ;
  wire \state_seq[timercnt][9]_i_1_n_0 ;
  wire \state_seq[timercnt][9]_i_2_n_0 ;
  wire \state_seq[timercnt][9]_i_3_n_0 ;
  wire \state_seq[timercnt][9]_i_4_n_0 ;
  wire \state_seq[timerdone]_i_1_n_0 ;
  wire \state_seq[tx_credit][0]_i_1_n_0 ;
  wire \state_seq[tx_credit][1]_i_1_n_0 ;
  wire \state_seq[tx_credit][2]_i_1_n_0 ;
  wire \state_seq[tx_credit][3]_i_1_n_0 ;
  wire \state_seq[tx_credit][3]_i_2_n_0 ;
  wire \state_seq[tx_credit][4]_i_1_n_0 ;
  wire \state_seq[tx_credit][5]_i_2_n_0 ;
  wire \state_seq[tx_credit][5]_i_3_n_0 ;
  wire \state_seq[xmit_fct_in]_i_1_n_0 ;
  wire \state_seq[xmit_fct_in]_i_2_n_0 ;
  wire \state_seq_reg[errcred]__0 ;
  wire [5:0]\state_seq_reg[rx_credit] ;
  wire \state_seq_reg[rx_null_fct]_0 ;
  wire \state_seq_reg[rx_null_fct]__0 ;
  wire [2:0]\state_seq_reg[rxen]_0 ;
  wire \state_seq_reg[rxen]_1 ;
  wire \state_seq_reg[timercnt][0]_0 ;
  wire \state_seq_reg[timercnt][7]_0 ;
  wire \state_seq_reg[timercnt_n_0_][0] ;
  wire \state_seq_reg[timercnt_n_0_][1] ;
  wire \state_seq_reg[timercnt_n_0_][2] ;
  wire \state_seq_reg[timercnt_n_0_][3] ;
  wire \state_seq_reg[timercnt_n_0_][4] ;
  wire \state_seq_reg[timercnt_n_0_][5] ;
  wire \state_seq_reg[timercnt_n_0_][6] ;
  wire \state_seq_reg[timercnt_n_0_][7] ;
  wire \state_seq_reg[timercnt_n_0_][8] ;
  wire \state_seq_reg[timercnt_n_0_][9] ;
  wire \state_seq_reg[timerdone]__0 ;
  wire [5:0]\state_seq_reg[tx_credit] ;
  wire \state_seq_reg[tx_credit][3]_0 ;
  wire [2:0]\syncsys[rxcnt_ddr_gray] ;
  wire sys_rst_n;
  wire \v[allow_char] ;
  wire \v[pend_char] ;
  wire \vres[inbvalid]0_out ;
  wire \vres[rxeep]3_out ;
  wire \vres[txdiscard] ;
  wire [16:0]\vres[txfiforoom]0_in ;
  wire \vres[txpacket]5_out ;
  wire [5:0]\vstate[rx_credit] ;
  wire \vstate[rx_credit]0_carry__0_i_2_n_0 ;
  wire \vstate[rx_credit]0_carry__0_i_3_n_0 ;
  wire \vstate[rx_credit]0_carry__0_n_3 ;
  wire \vstate[rx_credit]0_carry__0_n_6 ;
  wire \vstate[rx_credit]0_carry__0_n_7 ;
  wire \vstate[rx_credit]0_carry_i_1_n_0 ;
  wire \vstate[rx_credit]0_carry_i_2_n_0 ;
  wire \vstate[rx_credit]0_carry_i_3_n_0 ;
  wire \vstate[rx_credit]0_carry_i_4_n_0 ;
  wire \vstate[rx_credit]0_carry_n_0 ;
  wire \vstate[rx_credit]0_carry_n_1 ;
  wire \vstate[rx_credit]0_carry_n_2 ;
  wire \vstate[rx_credit]0_carry_n_3 ;
  wire \vstate[rx_credit]0_carry_n_4 ;
  wire \vstate[rx_credit]0_carry_n_5 ;
  wire \vstate[rx_credit]0_carry_n_6 ;
  wire \vstate[rx_credit]0_carry_n_7 ;
  wire \vstate[tx_credit] ;
  wire [5:3]\vstate[xmit_fct_in]4 ;
  wire \xmiti[fct_in] ;
  wire [3:0]\NLW_p_1_out_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:2]\NLW_p_1_out_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_p_1_out_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:1]\NLW_vstate[rx_credit]0_carry__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_vstate[rx_credit]0_carry__0_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_state_seq[state][0]_i_1 
       (.I0(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .O(\FSM_onehot_state_seq[state][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state_seq[state][1]_i_1 
       (.I0(p_0_in9_in),
        .I1(\state_seq_reg[rx_null_fct]_0 ),
        .O(\FSM_onehot_state_seq[state][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state_seq[state][3]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][4] ),
        .I1(\FSM_onehot_state_seq_reg[state][4]_0 ),
        .O(\FSM_onehot_state_seq[state][3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state_seq[state][4]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][5] ),
        .I1(\FSM_onehot_state_seq_reg[state][4]_0 ),
        .O(\FSM_onehot_state_seq[state][4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFEFEFEFE)) 
    \FSM_onehot_state_seq[state][5]_i_1 
       (.I0(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I3(\state_seq_reg[rx_null_fct]__0 ),
        .I4(\recvo[gotfct] ),
        .I5(p_0_in9_in),
        .O(\FSM_onehot_state_seq[state][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state_seq[state][5]_i_3 
       (.I0(p_0_in9_in),
        .I1(\state_seq_reg[rx_null_fct]_0 ),
        .O(\FSM_onehot_state_seq[state][5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAFFEAEA)) 
    \FSM_onehot_state_seq[state][5]_i_4 
       (.I0(\state_seq[timercnt][9]_i_4_n_0 ),
        .I1(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I2(\recvo[gotnull] ),
        .I3(\state_seq[timercnt][7]_i_2_n_0 ),
        .I4(\FSM_onehot_state_seq[state][5]_i_6_n_0 ),
        .I5(\FSM_onehot_state_seq[state][5]_i_7_n_0 ),
        .O(\FSM_onehot_state_seq[state][5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8F8F8F88)) 
    \FSM_onehot_state_seq[state][5]_i_5 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I1(\FSM_onehot_state_seq_reg[state][0]_0 ),
        .I2(\FSM_onehot_state_seq_reg[state][4]_0 ),
        .I3(\FSM_onehot_state_seq_reg[state_n_0_][4] ),
        .I4(\FSM_onehot_state_seq_reg[state_n_0_][5] ),
        .O(\FSM_onehot_state_seq[state][5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \FSM_onehot_state_seq[state][5]_i_6 
       (.I0(\state_seq_reg[timerdone]__0 ),
        .I1(\state_seq_reg[timercnt_n_0_][7] ),
        .I2(\state_seq_reg[timercnt_n_0_][8] ),
        .I3(\state_seq_reg[timercnt_n_0_][6] ),
        .I4(\FSM_onehot_state_seq_reg[state_n_0_][5] ),
        .I5(\state_seq_reg[timercnt_n_0_][9] ),
        .O(\FSM_onehot_state_seq[state][5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \FSM_onehot_state_seq[state][5]_i_7 
       (.I0(\state_seq_reg[timercnt_n_0_][9] ),
        .I1(\state_seq_reg[timercnt_n_0_][8] ),
        .I2(\state_seq_reg[timercnt_n_0_][6] ),
        .I3(\state_seq[timercnt][7]_i_2_n_0 ),
        .I4(\state_seq_reg[timercnt_n_0_][7] ),
        .I5(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\FSM_onehot_state_seq[state][5]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_seq_reg[state][0] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .D(\FSM_onehot_state_seq[state][0]_i_1_n_0 ),
        .PRE(\state_seq_reg[rxen]_1 ),
        .Q(\FSM_onehot_state_seq_reg[state_n_0_][0] ));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_seq_reg[state][1] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\FSM_onehot_state_seq[state][1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_seq_reg[state][3]_1 [0]));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_seq_reg[state][2] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\FSM_onehot_state_seq_reg[state][2]_0 ),
        .Q(p_0_in9_in));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_seq_reg[state][3] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\FSM_onehot_state_seq[state][3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_seq_reg[state][3]_1 [1]));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_seq_reg[state][4] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\FSM_onehot_state_seq[state][4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_seq_reg[state_n_0_][4] ));
  (* FSM_ENCODED_STATES = "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_seq_reg[state][5] 
       (.C(SPW_main_clk),
        .CE(\FSM_onehot_state_seq[state][5]_i_1_n_0 ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .Q(\FSM_onehot_state_seq_reg[state_n_0_][5] ));
  LUT3 #(
    .INIT(8'h78)) 
    i__carry__0_i_1__0
       (.I0(\vstate[rx_credit]0_carry__0_n_7 ),
        .I1(\vstate[rx_credit]0_carry_n_4 ),
        .I2(\vstate[rx_credit]0_carry__0_n_6 ),
        .O(\vstate[xmit_fct_in]4 [5]));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2__0
       (.I0(\vstate[rx_credit]0_carry_n_4 ),
        .I1(\vstate[rx_credit]0_carry__0_n_7 ),
        .O(\vstate[xmit_fct_in]4 [4]));
  LUT4 #(
    .INIT(16'h6A95)) 
    i__carry__0_i_3__0
       (.I0(\vstate[rx_credit]0_carry__0_n_6 ),
        .I1(\vstate[rx_credit]0_carry_n_4 ),
        .I2(\vstate[rx_credit]0_carry__0_n_7 ),
        .I3(Q[5]),
        .O(i__carry__0_i_3__0_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i__carry__0_i_4__0
       (.I0(\vstate[rx_credit]0_carry__0_n_7 ),
        .I1(\vstate[rx_credit]0_carry_n_4 ),
        .I2(Q[4]),
        .O(i__carry__0_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1
       (.I0(\vstate[rx_credit]0_carry_n_4 ),
        .O(\vstate[xmit_fct_in]4 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2__0
       (.I0(\vstate[rx_credit]0_carry_n_4 ),
        .I1(Q[3]),
        .O(i__carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_3__0
       (.I0(\vstate[rx_credit]0_carry_n_5 ),
        .I1(Q[2]),
        .O(i__carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_4__0
       (.I0(\vstate[rx_credit]0_carry_n_6 ),
        .I1(Q[1]),
        .O(i__carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_5
       (.I0(\vstate[rx_credit]0_carry_n_7 ),
        .I1(Q[0]),
        .O(i__carry_i_5_n_0));
  CARRY4 \p_1_out_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\p_1_out_inferred__0/i__carry_n_0 ,\p_1_out_inferred__0/i__carry_n_1 ,\p_1_out_inferred__0/i__carry_n_2 ,\p_1_out_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({\vstate[xmit_fct_in]4 [3],\vstate[rx_credit]0_carry_n_5 ,\vstate[rx_credit]0_carry_n_6 ,\vstate[rx_credit]0_carry_n_7 }),
        .O(\NLW_p_1_out_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,i__carry_i_5_n_0}));
  CARRY4 \p_1_out_inferred__0/i__carry__0 
       (.CI(\p_1_out_inferred__0/i__carry_n_0 ),
        .CO({\NLW_p_1_out_inferred__0/i__carry__0_CO_UNCONNECTED [3:2],\p_1_out_inferred__0/i__carry__0_n_2 ,\p_1_out_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\vstate[xmit_fct_in]4 [5:4]}),
        .O(\NLW_p_1_out_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \res_seq[allow_char]_i_1 
       (.I0(\res_seq_reg[sent_fct]__0 ),
        .I1(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I2(p_0_in9_in),
        .I3(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .O(\v[allow_char] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \res_seq[allow_fct]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I1(p_0_in9_in),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .O(\FSM_onehot_state_seq_reg[state][3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \res_seq[bitcntp_gray][1]_i_1 
       (.I0(recv_rxen),
        .I1(\syncsys[rxcnt_ddr_gray] [0]),
        .O(\state_seq_reg[rxen]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \res_seq[bitcntp_gray][2]_i_1 
       (.I0(recv_rxen),
        .I1(\syncsys[rxcnt_ddr_gray] [1]),
        .O(\state_seq_reg[rxen]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \res_seq[bitcntp_gray][3]_i_1 
       (.I0(recv_rxen),
        .I1(\syncsys[rxcnt_ddr_gray] [2]),
        .O(\state_seq_reg[rxen]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \res_seq[bitshift][8]_i_1 
       (.I0(recv_rxen),
        .I1(sys_rst_n),
        .O(AR));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \res_seq[inbvalid]_i_1 
       (.I0(recv_rxen),
        .I1(\res_seq_reg[inbvalid] ),
        .O(\vres[inbvalid]0_out ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \res_seq[pend_data][8]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I1(p_0_in9_in),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I3(\res_seq_reg[txfifo_raddr][15] ),
        .O(\v[pend_char] ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \res_seq[pend_data][8]_i_3 
       (.I0(\state_seq_reg[tx_credit] [3]),
        .I1(\state_seq_reg[tx_credit] [2]),
        .I2(\state_seq_reg[tx_credit] [0]),
        .I3(\state_seq_reg[tx_credit] [1]),
        .I4(\state_seq_reg[tx_credit] [4]),
        .I5(\state_seq_reg[tx_credit] [5]),
        .O(\state_seq_reg[tx_credit][3]_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \res_seq[rxeep]_i_1 
       (.I0(\res_seq_reg[rxeep]__0 ),
        .I1(\res_seq_reg[rxfull]__0 ),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I3(\res_seq_reg[rxeep] ),
        .O(\vres[rxeep]3_out ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \res_seq[token1][fctpiggy]_i_4 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I1(p_0_in9_in),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .O(\FSM_onehot_state_seq_reg[state][1]_0 ));
  LUT6 #(
    .INIT(64'hFFFF04FF040E040E)) 
    \res_seq[txdiscard]_i_1 
       (.I0(\v[pend_char] ),
        .I1(\res_seq_reg[txdiscard] ),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I3(D),
        .I4(\res_seq_reg[txdiscard]_0 ),
        .I5(\res_seq_reg[txdiscard]__0 ),
        .O(\vres[txdiscard] ));
  LUT6 #(
    .INIT(64'hAAAAAAAA0000AAA8)) 
    \res_seq[txfifo_raddr][0]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]__0 ),
        .I1(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I2(p_0_in9_in),
        .I3(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I4(\res_seq_reg[txfifo_raddr][15] ),
        .I5(\res_seq_reg[txdiscard]__0 ),
        .O(\res_seq_reg[txfifo_rvalid] ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0434C7F7)) 
    \res_seq[txfifo_rvalid]_i_1 
       (.I0(\vres[txfiforoom]0_in [16]),
        .I1(\res_seq_reg[txfifo_rvalid] ),
        .I2(SPW_TXWRITE),
        .I3(O),
        .I4(\res_seq_reg[txfifo_rvalid]_0 [16]),
        .O(\res_com[txfifo_rvalid] ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][0]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [0]),
        .I1(\res_seq_reg[txfiforoom][3] [0]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [0]),
        .O(\res_seq_reg[txfiforoom][16] [0]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][10]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [10]),
        .I1(\res_seq_reg[txfiforoom][11] [2]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [10]),
        .O(\res_seq_reg[txfiforoom][16] [10]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][11]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [11]),
        .I1(\res_seq_reg[txfiforoom][11] [3]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [11]),
        .O(\res_seq_reg[txfiforoom][16] [11]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][12]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [12]),
        .I1(\res_seq_reg[txfiforoom][15] [0]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [12]),
        .O(\res_seq_reg[txfiforoom][16] [12]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][13]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [13]),
        .I1(\res_seq_reg[txfiforoom][15] [1]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [13]),
        .O(\res_seq_reg[txfiforoom][16] [13]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][14]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [14]),
        .I1(\res_seq_reg[txfiforoom][15] [2]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [14]),
        .O(\res_seq_reg[txfiforoom][16] [14]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][15]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [15]),
        .I1(\res_seq_reg[txfiforoom][15] [3]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [15]),
        .O(\res_seq_reg[txfiforoom][16] [15]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][16]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [16]),
        .I1(O),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [16]),
        .O(\res_seq_reg[txfiforoom][16] [16]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][1]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [1]),
        .I1(\res_seq_reg[txfiforoom][3] [1]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [1]),
        .O(\res_seq_reg[txfiforoom][16] [1]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][2]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [2]),
        .I1(\res_seq_reg[txfiforoom][3] [2]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [2]),
        .O(\res_seq_reg[txfiforoom][16] [2]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][3]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [3]),
        .I1(\res_seq_reg[txfiforoom][3] [3]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [3]),
        .O(\res_seq_reg[txfiforoom][16] [3]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][4]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [4]),
        .I1(\res_seq_reg[txfiforoom][7] [0]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [4]),
        .O(\res_seq_reg[txfiforoom][16] [4]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][5]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [5]),
        .I1(\res_seq_reg[txfiforoom][7] [1]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [5]),
        .O(\res_seq_reg[txfiforoom][16] [5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFBCB3808)) 
    \res_seq[txfiforoom][6]_i_1 
       (.I0(\vres[txfiforoom]0_in [6]),
        .I1(\res_seq_reg[txfifo_rvalid] ),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfiforoom][7] [2]),
        .I4(\res_seq_reg[txfifo_rvalid]_0 [6]),
        .O(\res_seq_reg[txfiforoom][16] [6]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][7]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [7]),
        .I1(\res_seq_reg[txfiforoom][7] [3]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [7]),
        .O(\res_seq_reg[txfiforoom][16] [7]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][8]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [8]),
        .I1(\res_seq_reg[txfiforoom][11] [0]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [8]),
        .O(\res_seq_reg[txfiforoom][16] [8]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[txfiforoom][9]_i_1 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [9]),
        .I1(\res_seq_reg[txfiforoom][11] [1]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [9]),
        .O(\res_seq_reg[txfiforoom][16] [9]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \res_seq[txfull]_i_1 
       (.I0(\res_seq[txfull]_i_2_n_0 ),
        .I1(\res_seq[txfull]_i_3_n_0 ),
        .I2(\res_seq[txfull]_i_4_n_0 ),
        .I3(\res_seq_reg[txfiforoom][16] [10]),
        .I4(\res_seq_reg[txfiforoom][16] [3]),
        .I5(\res_seq_reg[txfiforoom][16] [16]),
        .O(\res_com[txfull] ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \res_seq[txfull]_i_2 
       (.I0(\res_seq_reg[txfiforoom][16] [1]),
        .I1(\res_seq[txfull]_i_5_n_0 ),
        .I2(\res_seq_reg[txfiforoom][16] [13]),
        .I3(\res_seq_reg[txfiforoom][16] [4]),
        .I4(\res_seq_reg[txfiforoom][16] [14]),
        .I5(\res_seq_reg[txfiforoom][16] [5]),
        .O(\res_seq[txfull]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \res_seq[txfull]_i_3 
       (.I0(\res_seq_reg[txfiforoom][16] [0]),
        .I1(\res_seq_reg[txfiforoom][16] [15]),
        .I2(\res_seq_reg[txfiforoom][16] [2]),
        .I3(\res_seq_reg[txfiforoom][16] [9]),
        .O(\res_seq[txfull]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \res_seq[txfull]_i_4 
       (.I0(\res_seq_reg[txfiforoom][16] [8]),
        .I1(\res_seq_reg[txfiforoom][16] [11]),
        .I2(\res_seq_reg[txfiforoom][16] [7]),
        .I3(\res_seq_reg[txfiforoom][16] [12]),
        .O(\res_seq[txfull]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h50355F35)) 
    \res_seq[txfull]_i_5 
       (.I0(\res_seq_reg[txfifo_rvalid]_0 [6]),
        .I1(\res_seq_reg[txfiforoom][7] [2]),
        .I2(SPW_TXWRITE),
        .I3(\res_seq_reg[txfifo_rvalid] ),
        .I4(\vres[txfiforoom]0_in [6]),
        .O(\res_seq[txfull]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h08A8)) 
    \res_seq[txpacket]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I1(\res_seq_reg[txdiscard] ),
        .I2(\v[pend_char] ),
        .I3(D),
        .O(\vres[txpacket]5_out ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \reset_reg[3]_i_2 
       (.I0(recv_rxen),
        .O(load));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFBF0)) 
    \state_seq[errcred]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I2(\state_seq[errcred]_i_2_n_0 ),
        .I3(\state_seq_reg[errcred]__0 ),
        .O(\state_seq[errcred]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4544444444444444)) 
    \state_seq[errcred]_i_2 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\state_seq[errcred]_i_3_n_0 ),
        .I2(\state_seq[errcred]_i_4_n_0 ),
        .I3(\state_seq_reg[tx_credit] [4]),
        .I4(\recvo[gotfct] ),
        .I5(\state_seq_reg[tx_credit] [5]),
        .O(\state_seq[errcred]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \state_seq[errcred]_i_3 
       (.I0(\state_seq[errcred]_i_5_n_0 ),
        .I1(\state_seq_reg[rx_credit] [0]),
        .I2(\state_seq_reg[rx_credit] [4]),
        .I3(\state_seq_reg[rx_credit] [3]),
        .O(\state_seq[errcred]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \state_seq[errcred]_i_4 
       (.I0(\state_seq_reg[tx_credit] [1]),
        .I1(\state_seq_reg[tx_credit] [0]),
        .I2(\state_seq_reg[tx_credit] [2]),
        .I3(\state_seq_reg[tx_credit] [3]),
        .O(\state_seq[errcred]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \state_seq[errcred]_i_5 
       (.I0(\state_seq_reg[rx_credit] [5]),
        .I1(\recvo[rxchar] ),
        .I2(\state_seq_reg[rx_credit] [2]),
        .I3(\state_seq_reg[rx_credit] [1]),
        .O(\state_seq[errcred]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][0]_i_1 
       (.I0(\vstate[rx_credit]0_carry_n_7 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][1]_i_1 
       (.I0(\vstate[rx_credit]0_carry_n_6 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][2]_i_1 
       (.I0(\vstate[rx_credit]0_carry_n_5 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][3]_i_1 
       (.I0(\vstate[rx_credit]0_carry_n_4 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][4]_i_1 
       (.I0(\vstate[rx_credit]0_carry__0_n_7 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state_seq[rx_credit][5]_i_1 
       (.I0(\vstate[rx_credit]0_carry__0_n_6 ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\vstate[rx_credit] [5]));
  LUT6 #(
    .INIT(64'hF555F555E000A000)) 
    \state_seq[rx_null_fct]_i_1 
       (.I0(p_0_in9_in),
        .I1(\recvo[gotnull] ),
        .I2(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .I3(\recvo[gotfct] ),
        .I4(\state_seq_reg[rx_null_fct]_0 ),
        .I5(\state_seq_reg[rx_null_fct]__0 ),
        .O(\state_seq[rx_null_fct]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA0A0A0A3A0A0A0A0)) 
    \state_seq[rxen]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I3(\state_seq[timercnt][9]_i_4_n_0 ),
        .I4(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I5(recv_rxen),
        .O(\state_seq[rxen]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \state_seq[timercnt][0]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\state_seq[timercnt][9]_i_4_n_0 ),
        .I3(\state_seq[timercnt][9]_i_3_n_0 ),
        .I4(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][0] ),
        .O(\state_com[timercnt] [0]));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][1]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq_reg[timercnt_n_0_][1] ),
        .I5(\state_seq_reg[timercnt_n_0_][0] ),
        .O(\state_com[timercnt] [1]));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][2]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][2]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][2] ),
        .O(\state_com[timercnt] [2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state_seq[timercnt][2]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][0] ),
        .I1(\state_seq_reg[timercnt_n_0_][1] ),
        .O(\state_seq[timercnt][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][3]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][3]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][3] ),
        .O(\state_com[timercnt] [3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \state_seq[timercnt][3]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][2] ),
        .I1(\state_seq_reg[timercnt_n_0_][1] ),
        .I2(\state_seq_reg[timercnt_n_0_][0] ),
        .O(\state_seq[timercnt][3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][4]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][4]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][4] ),
        .O(\state_com[timercnt] [4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state_seq[timercnt][4]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][3] ),
        .I1(\state_seq_reg[timercnt_n_0_][0] ),
        .I2(\state_seq_reg[timercnt_n_0_][1] ),
        .I3(\state_seq_reg[timercnt_n_0_][2] ),
        .O(\state_seq[timercnt][4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][5]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][5]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][5] ),
        .O(\state_com[timercnt] [5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state_seq[timercnt][5]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][4] ),
        .I1(\state_seq_reg[timercnt_n_0_][2] ),
        .I2(\state_seq_reg[timercnt_n_0_][1] ),
        .I3(\state_seq_reg[timercnt_n_0_][0] ),
        .I4(\state_seq_reg[timercnt_n_0_][3] ),
        .O(\state_seq[timercnt][5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000001)) 
    \state_seq[timercnt][6]_i_1 
       (.I0(\state_seq_reg[timercnt][7]_0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][7]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][6] ),
        .O(\state_com[timercnt] [6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \state_seq[timercnt][6]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][7] ),
        .I1(\state_seq[timercnt][7]_i_2_n_0 ),
        .I2(\state_seq_reg[timercnt_n_0_][6] ),
        .I3(\state_seq_reg[timercnt_n_0_][8] ),
        .I4(\state_seq_reg[timercnt_n_0_][9] ),
        .O(\state_seq_reg[timercnt][7]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE1)) 
    \state_seq[timercnt][7]_i_1 
       (.I0(\state_seq_reg[timercnt_n_0_][6] ),
        .I1(\state_seq[timercnt][7]_i_2_n_0 ),
        .I2(\state_seq_reg[timercnt_n_0_][7] ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I5(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .O(\state_seq[timercnt][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state_seq[timercnt][7]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][5] ),
        .I1(\state_seq_reg[timercnt_n_0_][3] ),
        .I2(\state_seq_reg[timercnt_n_0_][0] ),
        .I3(\state_seq_reg[timercnt_n_0_][1] ),
        .I4(\state_seq_reg[timercnt_n_0_][2] ),
        .I5(\state_seq_reg[timercnt_n_0_][4] ),
        .O(\state_seq[timercnt][7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0003000000000002)) 
    \state_seq[timercnt][8]_i_1 
       (.I0(\state_seq_reg[timercnt_n_0_][9] ),
        .I1(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_4_n_0 ),
        .I3(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I4(\state_seq[timercnt][8]_i_2_n_0 ),
        .I5(\state_seq_reg[timercnt_n_0_][8] ),
        .O(\state_seq[timercnt][8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \state_seq[timercnt][8]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][7] ),
        .I1(\state_seq[timercnt][7]_i_2_n_0 ),
        .I2(\state_seq_reg[timercnt_n_0_][6] ),
        .O(\state_seq[timercnt][8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF6)) 
    \state_seq[timercnt][9]_i_1 
       (.I0(\state_seq[timercnt][9]_i_2_n_0 ),
        .I1(\state_seq_reg[timercnt_n_0_][9] ),
        .I2(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I3(\state_seq[timercnt][9]_i_3_n_0 ),
        .I4(\state_seq[timercnt][9]_i_4_n_0 ),
        .I5(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .O(\state_seq[timercnt][9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \state_seq[timercnt][9]_i_2 
       (.I0(\state_seq_reg[timercnt_n_0_][8] ),
        .I1(\state_seq_reg[timercnt_n_0_][6] ),
        .I2(\state_seq[timercnt][7]_i_2_n_0 ),
        .I3(\state_seq_reg[timercnt_n_0_][7] ),
        .O(\state_seq[timercnt][9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF88F888F888F8)) 
    \state_seq[timercnt][9]_i_3 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\state_seq_reg[timercnt][7]_0 ),
        .I2(\FSM_onehot_state_seq[state][5]_i_6_n_0 ),
        .I3(\state_seq[timercnt][7]_i_2_n_0 ),
        .I4(\recvo[gotnull] ),
        .I5(\FSM_onehot_state_seq_reg[state][3]_1 [1]),
        .O(\state_seq[timercnt][9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \state_seq[timercnt][9]_i_4 
       (.I0(\FSM_onehot_state_seq_reg[state][3]_1 [0]),
        .I1(\state_seq_reg[timercnt][0]_0 ),
        .I2(\state_seq_reg[errcred]__0 ),
        .O(\state_seq[timercnt][9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000300000002)) 
    \state_seq[timerdone]_i_1 
       (.I0(\state_seq_reg[timerdone]__0 ),
        .I1(\FSM_onehot_state_seq[state][5]_i_3_n_0 ),
        .I2(\state_seq[timercnt][9]_i_3_n_0 ),
        .I3(\state_seq[timercnt][9]_i_4_n_0 ),
        .I4(\FSM_onehot_state_seq[state][5]_i_5_n_0 ),
        .I5(\state_seq_reg[timercnt][7]_0 ),
        .O(\state_seq[timerdone]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0451)) 
    \state_seq[tx_credit][0]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\recvo[gotfct] ),
        .I2(\v[pend_char] ),
        .I3(\state_seq_reg[tx_credit] [0]),
        .O(\state_seq[tx_credit][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h45441011)) 
    \state_seq[tx_credit][1]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\state_seq_reg[tx_credit] [0]),
        .I2(\v[pend_char] ),
        .I3(\recvo[gotfct] ),
        .I4(\state_seq_reg[tx_credit] [1]),
        .O(\state_seq[tx_credit][1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555551000000045)) 
    \state_seq[tx_credit][2]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\v[pend_char] ),
        .I2(\recvo[gotfct] ),
        .I3(\state_seq_reg[tx_credit] [1]),
        .I4(\state_seq_reg[tx_credit] [0]),
        .I5(\state_seq_reg[tx_credit] [2]),
        .O(\state_seq[tx_credit][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000004B964B4B)) 
    \state_seq[tx_credit][3]_i_1 
       (.I0(\recvo[gotfct] ),
        .I1(\v[pend_char] ),
        .I2(\state_seq_reg[tx_credit] [3]),
        .I3(\state_seq_reg[tx_credit] [2]),
        .I4(\state_seq[tx_credit][3]_i_2_n_0 ),
        .I5(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .O(\state_seq[tx_credit][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \state_seq[tx_credit][3]_i_2 
       (.I0(\state_seq_reg[tx_credit] [0]),
        .I1(\state_seq_reg[tx_credit] [1]),
        .O(\state_seq[tx_credit][3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h14411414)) 
    \state_seq[tx_credit][4]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\state_seq[tx_credit][5]_i_3_n_0 ),
        .I2(\state_seq_reg[tx_credit] [4]),
        .I3(\recvo[gotfct] ),
        .I4(\v[pend_char] ),
        .O(\state_seq[tx_credit][4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \state_seq[tx_credit][5]_i_1 
       (.I0(\v[pend_char] ),
        .I1(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I2(\recvo[gotfct] ),
        .O(\vstate[tx_credit] ));
  LUT6 #(
    .INIT(64'h1141444444444414)) 
    \state_seq[tx_credit][5]_i_2 
       (.I0(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I1(\state_seq_reg[tx_credit] [5]),
        .I2(\v[pend_char] ),
        .I3(\recvo[gotfct] ),
        .I4(\state_seq_reg[tx_credit] [4]),
        .I5(\state_seq[tx_credit][5]_i_3_n_0 ),
        .O(\state_seq[tx_credit][5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFE0000FE00)) 
    \state_seq[tx_credit][5]_i_3 
       (.I0(\state_seq_reg[tx_credit] [2]),
        .I1(\state_seq_reg[tx_credit] [0]),
        .I2(\state_seq_reg[tx_credit] [1]),
        .I3(\v[pend_char] ),
        .I4(\recvo[gotfct] ),
        .I5(\state_seq_reg[tx_credit] [3]),
        .O(\state_seq[tx_credit][5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80808F80)) 
    \state_seq[xmit_fct_in]_i_1 
       (.I0(\xmiti[fct_in] ),
        .I1(\state_seq_reg[timercnt][7]_0 ),
        .I2(\FSM_onehot_state_seq_reg[state_n_0_][0] ),
        .I3(\state_seq[xmit_fct_in]_i_2_n_0 ),
        .I4(\p_1_out_inferred__0/i__carry__0_n_2 ),
        .O(\state_seq[xmit_fct_in]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001FFFFFFFFFFFF)) 
    \state_seq[xmit_fct_in]_i_2 
       (.I0(\vstate[rx_credit]0_carry_n_5 ),
        .I1(\vstate[rx_credit]0_carry_n_6 ),
        .I2(\vstate[rx_credit]0_carry_n_4 ),
        .I3(\vstate[rx_credit]0_carry_n_7 ),
        .I4(\vstate[rx_credit]0_carry__0_n_6 ),
        .I5(\vstate[rx_credit]0_carry__0_n_7 ),
        .O(\state_seq[xmit_fct_in]_i_2_n_0 ));
  FDCE \state_seq_reg[errcred] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[errcred]_i_1_n_0 ),
        .Q(\state_seq_reg[errcred]__0 ));
  FDCE \state_seq_reg[rx_credit][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [0]),
        .Q(\state_seq_reg[rx_credit] [0]));
  FDCE \state_seq_reg[rx_credit][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [1]),
        .Q(\state_seq_reg[rx_credit] [1]));
  FDCE \state_seq_reg[rx_credit][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [2]),
        .Q(\state_seq_reg[rx_credit] [2]));
  FDCE \state_seq_reg[rx_credit][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [3]),
        .Q(\state_seq_reg[rx_credit] [3]));
  FDCE \state_seq_reg[rx_credit][4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [4]),
        .Q(\state_seq_reg[rx_credit] [4]));
  FDCE \state_seq_reg[rx_credit][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\vstate[rx_credit] [5]),
        .Q(\state_seq_reg[rx_credit] [5]));
  FDCE \state_seq_reg[rx_null_fct] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[rx_null_fct]_i_1_n_0 ),
        .Q(\state_seq_reg[rx_null_fct]__0 ));
  FDCE \state_seq_reg[rxen] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[rxen]_i_1_n_0 ),
        .Q(recv_rxen));
  FDCE \state_seq_reg[timercnt][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [0]),
        .Q(\state_seq_reg[timercnt_n_0_][0] ));
  FDCE \state_seq_reg[timercnt][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [1]),
        .Q(\state_seq_reg[timercnt_n_0_][1] ));
  FDCE \state_seq_reg[timercnt][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [2]),
        .Q(\state_seq_reg[timercnt_n_0_][2] ));
  FDCE \state_seq_reg[timercnt][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [3]),
        .Q(\state_seq_reg[timercnt_n_0_][3] ));
  FDCE \state_seq_reg[timercnt][4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [4]),
        .Q(\state_seq_reg[timercnt_n_0_][4] ));
  FDCE \state_seq_reg[timercnt][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [5]),
        .Q(\state_seq_reg[timercnt_n_0_][5] ));
  FDCE \state_seq_reg[timercnt][6] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_com[timercnt] [6]),
        .Q(\state_seq_reg[timercnt_n_0_][6] ));
  FDPE \state_seq_reg[timercnt][7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\state_seq[timercnt][7]_i_1_n_0 ),
        .PRE(\state_seq_reg[rxen]_1 ),
        .Q(\state_seq_reg[timercnt_n_0_][7] ));
  FDCE \state_seq_reg[timercnt][8] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[timercnt][8]_i_1_n_0 ),
        .Q(\state_seq_reg[timercnt_n_0_][8] ));
  FDPE \state_seq_reg[timercnt][9] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\state_seq[timercnt][9]_i_1_n_0 ),
        .PRE(\state_seq_reg[rxen]_1 ),
        .Q(\state_seq_reg[timercnt_n_0_][9] ));
  FDCE \state_seq_reg[timerdone] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[timerdone]_i_1_n_0 ),
        .Q(\state_seq_reg[timerdone]__0 ));
  FDCE \state_seq_reg[tx_credit][0] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][0]_i_1_n_0 ),
        .Q(\state_seq_reg[tx_credit] [0]));
  FDCE \state_seq_reg[tx_credit][1] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][1]_i_1_n_0 ),
        .Q(\state_seq_reg[tx_credit] [1]));
  FDCE \state_seq_reg[tx_credit][2] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][2]_i_1_n_0 ),
        .Q(\state_seq_reg[tx_credit] [2]));
  FDCE \state_seq_reg[tx_credit][3] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][3]_i_1_n_0 ),
        .Q(\state_seq_reg[tx_credit] [3]));
  FDCE \state_seq_reg[tx_credit][4] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][4]_i_1_n_0 ),
        .Q(\state_seq_reg[tx_credit] [4]));
  FDCE \state_seq_reg[tx_credit][5] 
       (.C(SPW_main_clk),
        .CE(\vstate[tx_credit] ),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[tx_credit][5]_i_2_n_0 ),
        .Q(\state_seq_reg[tx_credit] [5]));
  FDCE \state_seq_reg[xmit_fct_in] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\state_seq_reg[rxen]_1 ),
        .D(\state_seq[xmit_fct_in]_i_1_n_0 ),
        .Q(\xmiti[fct_in] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vstate[rx_credit]0_carry 
       (.CI(1'b0),
        .CO({\vstate[rx_credit]0_carry_n_0 ,\vstate[rx_credit]0_carry_n_1 ,\vstate[rx_credit]0_carry_n_2 ,\vstate[rx_credit]0_carry_n_3 }),
        .CYINIT(1'b0),
        .DI(\state_seq_reg[rx_credit] [3:0]),
        .O({\vstate[rx_credit]0_carry_n_4 ,\vstate[rx_credit]0_carry_n_5 ,\vstate[rx_credit]0_carry_n_6 ,\vstate[rx_credit]0_carry_n_7 }),
        .S({\vstate[rx_credit]0_carry_i_1_n_0 ,\vstate[rx_credit]0_carry_i_2_n_0 ,\vstate[rx_credit]0_carry_i_3_n_0 ,\vstate[rx_credit]0_carry_i_4_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vstate[rx_credit]0_carry__0 
       (.CI(\vstate[rx_credit]0_carry_n_0 ),
        .CO({\NLW_vstate[rx_credit]0_carry__0_CO_UNCONNECTED [3:1],\vstate[rx_credit]0_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,DI}),
        .O({\NLW_vstate[rx_credit]0_carry__0_O_UNCONNECTED [3:2],\vstate[rx_credit]0_carry__0_n_6 ,\vstate[rx_credit]0_carry__0_n_7 }),
        .S({1'b0,1'b0,\vstate[rx_credit]0_carry__0_i_2_n_0 ,\vstate[rx_credit]0_carry__0_i_3_n_0 }));
  LUT6 #(
    .INIT(64'h55556555AAAAAAAA)) 
    \vstate[rx_credit]0_carry__0_i_2 
       (.I0(\state_seq_reg[rx_credit] [5]),
        .I1(\FSM_onehot_state_seq_reg[state][1]_0 ),
        .I2(\res_seq_reg[allow_fct]__0 ),
        .I3(\xmiti[fct_in] ),
        .I4(\res_seq_reg[pend_fct]__0 ),
        .I5(\recvo[rxchar] ),
        .O(\vstate[rx_credit]0_carry__0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0040FFFFFFBF0000)) 
    \vstate[rx_credit]0_carry__0_i_3 
       (.I0(\FSM_onehot_state_seq_reg[state][1]_0 ),
        .I1(\res_seq_reg[allow_fct]__0 ),
        .I2(\xmiti[fct_in] ),
        .I3(\res_seq_reg[pend_fct]__0 ),
        .I4(\recvo[rxchar] ),
        .I5(\state_seq_reg[rx_credit] [4]),
        .O(\vstate[rx_credit]0_carry__0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h55556555AAAA9AAA)) 
    \vstate[rx_credit]0_carry_i_1 
       (.I0(\state_seq_reg[rx_credit] [3]),
        .I1(\FSM_onehot_state_seq_reg[state][1]_0 ),
        .I2(\res_seq_reg[allow_fct]__0 ),
        .I3(\xmiti[fct_in] ),
        .I4(\res_seq_reg[pend_fct]__0 ),
        .I5(\recvo[rxchar] ),
        .O(\vstate[rx_credit]0_carry_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vstate[rx_credit]0_carry_i_2 
       (.I0(\state_seq_reg[rx_credit] [2]),
        .I1(\recvo[rxchar] ),
        .O(\vstate[rx_credit]0_carry_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vstate[rx_credit]0_carry_i_3 
       (.I0(\state_seq_reg[rx_credit] [1]),
        .I1(\recvo[rxchar] ),
        .O(\vstate[rx_credit]0_carry_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \vstate[rx_credit]0_carry_i_4 
       (.I0(\state_seq_reg[rx_credit] [0]),
        .I1(\recvo[rxchar] ),
        .O(\vstate[rx_credit]0_carry_i_4_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam
   (D,
    CLK,
    \res_seq_reg[tailptr] ,
    recv_rxen,
    SPW_Sin,
    SPW_Din,
    \s_mem_reg[0][0]_0 ,
    \resrx_seq_reg[headptr] ,
    Q,
    \s_mem_reg[0][3]_0 );
  output [3:0]D;
  output CLK;
  input [2:0]\res_seq_reg[tailptr] ;
  input recv_rxen;
  input SPW_Sin;
  input SPW_Din;
  input \s_mem_reg[0][0]_0 ;
  input [2:0]\resrx_seq_reg[headptr] ;
  input [3:0]Q;
  input \s_mem_reg[0][3]_0 ;

  wire CLK;
  wire [3:0]D;
  wire [3:0]Q;
  wire SPW_Din;
  wire SPW_Sin;
  wire [3:0]pre_clk_buf;
  wire recv_rxen;
  wire \res_seq[bufdout][0]_i_2_n_0 ;
  wire \res_seq[bufdout][0]_i_3_n_0 ;
  wire \res_seq[bufdout][1]_i_2_n_0 ;
  wire \res_seq[bufdout][1]_i_3_n_0 ;
  wire \res_seq[bufdout][2]_i_2_n_0 ;
  wire \res_seq[bufdout][2]_i_3_n_0 ;
  wire \res_seq[bufdout][3]_i_2_n_0 ;
  wire \res_seq[bufdout][3]_i_3_n_0 ;
  wire [2:0]\res_seq_reg[tailptr] ;
  wire [2:0]\resrx_seq_reg[headptr] ;
  wire \s_mem[0][3]_i_1_n_0 ;
  wire \s_mem[1]_8 ;
  wire \s_mem[2]_9 ;
  wire \s_mem[3]_10 ;
  wire \s_mem[4]_11 ;
  wire \s_mem[5]_12 ;
  wire \s_mem[6]_13 ;
  wire \s_mem[7]_14 ;
  wire \s_mem_reg[0][0]_0 ;
  wire \s_mem_reg[0][3]_0 ;
  wire [3:0]\s_mem_reg[0]_0 ;
  wire [3:0]\s_mem_reg[1]_1 ;
  wire [3:0]\s_mem_reg[2]_2 ;
  wire [3:0]\s_mem_reg[3]_3 ;
  wire [3:0]\s_mem_reg[4]_4 ;
  wire [3:0]\s_mem_reg[5]_5 ;
  wire [3:0]\s_mem_reg[6]_6 ;
  wire [3:0]\s_mem_reg[7]_7 ;

  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \pre_clk_buf_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(Q[0]),
        .Q(pre_clk_buf[0]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \pre_clk_buf_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(Q[1]),
        .Q(pre_clk_buf[1]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \pre_clk_buf_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(Q[2]),
        .Q(pre_clk_buf[2]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \pre_clk_buf_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(Q[3]),
        .Q(pre_clk_buf[3]));
  LUT4 #(
    .INIT(16'hE200)) 
    \res_seq[bufdout][0]_i_1 
       (.I0(\res_seq[bufdout][0]_i_2_n_0 ),
        .I1(\res_seq_reg[tailptr] [2]),
        .I2(\res_seq[bufdout][0]_i_3_n_0 ),
        .I3(recv_rxen),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][0]_i_2 
       (.I0(\s_mem_reg[3]_3 [0]),
        .I1(\s_mem_reg[2]_2 [0]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[1]_1 [0]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[0]_0 [0]),
        .O(\res_seq[bufdout][0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][0]_i_3 
       (.I0(\s_mem_reg[7]_7 [0]),
        .I1(\s_mem_reg[6]_6 [0]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[5]_5 [0]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[4]_4 [0]),
        .O(\res_seq[bufdout][0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \res_seq[bufdout][1]_i_1 
       (.I0(\res_seq[bufdout][1]_i_2_n_0 ),
        .I1(\res_seq_reg[tailptr] [2]),
        .I2(\res_seq[bufdout][1]_i_3_n_0 ),
        .I3(recv_rxen),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][1]_i_2 
       (.I0(\s_mem_reg[3]_3 [1]),
        .I1(\s_mem_reg[2]_2 [1]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[1]_1 [1]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[0]_0 [1]),
        .O(\res_seq[bufdout][1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][1]_i_3 
       (.I0(\s_mem_reg[7]_7 [1]),
        .I1(\s_mem_reg[6]_6 [1]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[5]_5 [1]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[4]_4 [1]),
        .O(\res_seq[bufdout][1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \res_seq[bufdout][2]_i_1 
       (.I0(\res_seq[bufdout][2]_i_2_n_0 ),
        .I1(\res_seq_reg[tailptr] [2]),
        .I2(\res_seq[bufdout][2]_i_3_n_0 ),
        .I3(recv_rxen),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][2]_i_2 
       (.I0(\s_mem_reg[3]_3 [2]),
        .I1(\s_mem_reg[2]_2 [2]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[1]_1 [2]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[0]_0 [2]),
        .O(\res_seq[bufdout][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][2]_i_3 
       (.I0(\s_mem_reg[7]_7 [2]),
        .I1(\s_mem_reg[6]_6 [2]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[5]_5 [2]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[4]_4 [2]),
        .O(\res_seq[bufdout][2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \res_seq[bufdout][3]_i_1 
       (.I0(\res_seq[bufdout][3]_i_2_n_0 ),
        .I1(\res_seq_reg[tailptr] [2]),
        .I2(\res_seq[bufdout][3]_i_3_n_0 ),
        .I3(recv_rxen),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][3]_i_2 
       (.I0(\s_mem_reg[3]_3 [3]),
        .I1(\s_mem_reg[2]_2 [3]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[1]_1 [3]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[0]_0 [3]),
        .O(\res_seq[bufdout][3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \res_seq[bufdout][3]_i_3 
       (.I0(\s_mem_reg[7]_7 [3]),
        .I1(\s_mem_reg[6]_6 [3]),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(\s_mem_reg[5]_5 [3]),
        .I4(\res_seq_reg[tailptr] [0]),
        .I5(\s_mem_reg[4]_4 [3]),
        .O(\res_seq[bufdout][3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reset_reg[3]_i_1 
       (.I0(SPW_Sin),
        .I1(SPW_Din),
        .O(CLK));
  LUT4 #(
    .INIT(16'h0002)) 
    \s_mem[0][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [1]),
        .I2(\resrx_seq_reg[headptr] [0]),
        .I3(\resrx_seq_reg[headptr] [2]),
        .O(\s_mem[0][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \s_mem[1][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [1]),
        .I2(\resrx_seq_reg[headptr] [0]),
        .I3(\resrx_seq_reg[headptr] [2]),
        .O(\s_mem[1]_8 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \s_mem[2][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [2]),
        .I2(\resrx_seq_reg[headptr] [1]),
        .I3(\resrx_seq_reg[headptr] [0]),
        .O(\s_mem[2]_9 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \s_mem[3][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [2]),
        .I2(\resrx_seq_reg[headptr] [0]),
        .I3(\resrx_seq_reg[headptr] [1]),
        .O(\s_mem[3]_10 ));
  LUT4 #(
    .INIT(16'h0020)) 
    \s_mem[4][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [1]),
        .I2(\resrx_seq_reg[headptr] [2]),
        .I3(\resrx_seq_reg[headptr] [0]),
        .O(\s_mem[4]_11 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \s_mem[5][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [1]),
        .I2(\resrx_seq_reg[headptr] [0]),
        .I3(\resrx_seq_reg[headptr] [2]),
        .O(\s_mem[5]_12 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \s_mem[6][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [0]),
        .I2(\resrx_seq_reg[headptr] [2]),
        .I3(\resrx_seq_reg[headptr] [1]),
        .O(\s_mem[6]_13 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \s_mem[7][3]_i_1 
       (.I0(\s_mem_reg[0][0]_0 ),
        .I1(\resrx_seq_reg[headptr] [0]),
        .I2(\resrx_seq_reg[headptr] [2]),
        .I3(\resrx_seq_reg[headptr] [1]),
        .O(\s_mem[7]_14 ));
  FDCE \s_mem_reg[0][0] 
       (.C(CLK),
        .CE(\s_mem[0][3]_i_1_n_0 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[0]_0 [0]));
  FDCE \s_mem_reg[0][1] 
       (.C(CLK),
        .CE(\s_mem[0][3]_i_1_n_0 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[0]_0 [1]));
  FDCE \s_mem_reg[0][2] 
       (.C(CLK),
        .CE(\s_mem[0][3]_i_1_n_0 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[0]_0 [2]));
  FDCE \s_mem_reg[0][3] 
       (.C(CLK),
        .CE(\s_mem[0][3]_i_1_n_0 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[0]_0 [3]));
  FDCE \s_mem_reg[1][0] 
       (.C(CLK),
        .CE(\s_mem[1]_8 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[1]_1 [0]));
  FDCE \s_mem_reg[1][1] 
       (.C(CLK),
        .CE(\s_mem[1]_8 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[1]_1 [1]));
  FDCE \s_mem_reg[1][2] 
       (.C(CLK),
        .CE(\s_mem[1]_8 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[1]_1 [2]));
  FDCE \s_mem_reg[1][3] 
       (.C(CLK),
        .CE(\s_mem[1]_8 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[1]_1 [3]));
  FDCE \s_mem_reg[2][0] 
       (.C(CLK),
        .CE(\s_mem[2]_9 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[2]_2 [0]));
  FDCE \s_mem_reg[2][1] 
       (.C(CLK),
        .CE(\s_mem[2]_9 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[2]_2 [1]));
  FDCE \s_mem_reg[2][2] 
       (.C(CLK),
        .CE(\s_mem[2]_9 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[2]_2 [2]));
  FDCE \s_mem_reg[2][3] 
       (.C(CLK),
        .CE(\s_mem[2]_9 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[2]_2 [3]));
  FDCE \s_mem_reg[3][0] 
       (.C(CLK),
        .CE(\s_mem[3]_10 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[3]_3 [0]));
  FDCE \s_mem_reg[3][1] 
       (.C(CLK),
        .CE(\s_mem[3]_10 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[3]_3 [1]));
  FDCE \s_mem_reg[3][2] 
       (.C(CLK),
        .CE(\s_mem[3]_10 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[3]_3 [2]));
  FDCE \s_mem_reg[3][3] 
       (.C(CLK),
        .CE(\s_mem[3]_10 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[3]_3 [3]));
  FDCE \s_mem_reg[4][0] 
       (.C(CLK),
        .CE(\s_mem[4]_11 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[4]_4 [0]));
  FDCE \s_mem_reg[4][1] 
       (.C(CLK),
        .CE(\s_mem[4]_11 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[4]_4 [1]));
  FDCE \s_mem_reg[4][2] 
       (.C(CLK),
        .CE(\s_mem[4]_11 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[4]_4 [2]));
  FDCE \s_mem_reg[4][3] 
       (.C(CLK),
        .CE(\s_mem[4]_11 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[4]_4 [3]));
  FDCE \s_mem_reg[5][0] 
       (.C(CLK),
        .CE(\s_mem[5]_12 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[5]_5 [0]));
  FDCE \s_mem_reg[5][1] 
       (.C(CLK),
        .CE(\s_mem[5]_12 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[5]_5 [1]));
  FDCE \s_mem_reg[5][2] 
       (.C(CLK),
        .CE(\s_mem[5]_12 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[5]_5 [2]));
  FDCE \s_mem_reg[5][3] 
       (.C(CLK),
        .CE(\s_mem[5]_12 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[5]_5 [3]));
  FDCE \s_mem_reg[6][0] 
       (.C(CLK),
        .CE(\s_mem[6]_13 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[6]_6 [0]));
  FDCE \s_mem_reg[6][1] 
       (.C(CLK),
        .CE(\s_mem[6]_13 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[6]_6 [1]));
  FDCE \s_mem_reg[6][2] 
       (.C(CLK),
        .CE(\s_mem[6]_13 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[6]_6 [2]));
  FDCE \s_mem_reg[6][3] 
       (.C(CLK),
        .CE(\s_mem[6]_13 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[6]_6 [3]));
  FDCE \s_mem_reg[7][0] 
       (.C(CLK),
        .CE(\s_mem[7]_14 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[0]),
        .Q(\s_mem_reg[7]_7 [0]));
  FDCE \s_mem_reg[7][1] 
       (.C(CLK),
        .CE(\s_mem[7]_14 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[1]),
        .Q(\s_mem_reg[7]_7 [1]));
  FDCE \s_mem_reg[7][2] 
       (.C(CLK),
        .CE(\s_mem[7]_14 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[2]),
        .Q(\s_mem_reg[7]_7 [2]));
  FDCE \s_mem_reg[7][3] 
       (.C(CLK),
        .CE(\s_mem[7]_14 ),
        .CLR(\s_mem_reg[0][3]_0 ),
        .D(pre_clk_buf[3]),
        .Q(\s_mem_reg[7]_7 [3]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv
   (\recvo[gotnull] ,
    \recvo[gotfct] ,
    \recvo[rxchar] ,
    \res_seq_reg[escaped]__0 ,
    \res_seq_reg[null_seen]_0 ,
    \res_seq_reg[rxchar]_0 ,
    \res_seq_reg[gotfct]_0 ,
    \res_seq_reg[disccnt][7]_0 ,
    Q,
    \res_seq_reg[bitshift][8]_0 ,
    \res_seq_reg[null_seen]_1 ,
    \FSM_onehot_state_seq_reg[state][3] ,
    \res_seq_reg[bufdout][2] ,
    \res_seq_reg[bufdout][3] ,
    \res_seq_reg[bitshift][8]_1 ,
    \vres[rxpacket]7_out ,
    D,
    WEN,
    \res_com[rxfifo_rvalid] ,
    \res_com[rxemptydiscard] ,
    WDATA,
    recv_inbvalid,
    SPW_main_clk,
    AR,
    \vres[rxchar]9_out ,
    recv_inact,
    \res_seq_reg[bitshift][8]_2 ,
    \res_seq_reg[bitcnt][8]_0 ,
    \FSM_onehot_state_seq_reg[state][2] ,
    \state_seq_reg[timerdone]__0 ,
    \FSM_onehot_state_seq_reg[state][2]_0 ,
    \res_seq_reg[gotfct]_1 ,
    \res_seq_reg[erresc]_0 ,
    \res_seq_reg[erresc]_1 ,
    \res_seq_reg[rxpacket] ,
    \res_seq_reg[rxfifo_rvalid] ,
    \vres[rxfiforoom]0_in ,
    SPW_RXREAD,
    \vres[rxfiforoom] ,
    \res_seq_reg[rxfull]__0 ,
    \res_seq_reg[rxeep]__0 ,
    \res_seq_reg[rxfifo_waddr][15] ,
    \res_seq_reg[escaped]_0 ,
    E,
    \res_seq_reg[disccnt][0]_0 );
  output \recvo[gotnull] ;
  output \recvo[gotfct] ;
  output \recvo[rxchar] ;
  output \res_seq_reg[escaped]__0 ;
  output \res_seq_reg[null_seen]_0 ;
  output \res_seq_reg[rxchar]_0 ;
  output \res_seq_reg[gotfct]_0 ;
  output \res_seq_reg[disccnt][7]_0 ;
  output [0:0]Q;
  output [0:0]\res_seq_reg[bitshift][8]_0 ;
  output \res_seq_reg[null_seen]_1 ;
  output [0:0]\FSM_onehot_state_seq_reg[state][3] ;
  output \res_seq_reg[bufdout][2] ;
  output \res_seq_reg[bufdout][3] ;
  output \res_seq_reg[bitshift][8]_1 ;
  output \vres[rxpacket]7_out ;
  output [5:0]D;
  output WEN;
  output \res_com[rxfifo_rvalid] ;
  output \res_com[rxemptydiscard] ;
  output [8:0]WDATA;
  input recv_inbvalid;
  input SPW_main_clk;
  input [0:0]AR;
  input \vres[rxchar]9_out ;
  input recv_inact;
  input [3:0]\res_seq_reg[bitshift][8]_2 ;
  input \res_seq_reg[bitcnt][8]_0 ;
  input [1:0]\FSM_onehot_state_seq_reg[state][2] ;
  input \state_seq_reg[timerdone]__0 ;
  input \FSM_onehot_state_seq_reg[state][2]_0 ;
  input \res_seq_reg[gotfct]_1 ;
  input \res_seq_reg[erresc]_0 ;
  input \res_seq_reg[erresc]_1 ;
  input \res_seq_reg[rxpacket] ;
  input [6:0]\res_seq_reg[rxfifo_rvalid] ;
  input [6:0]\vres[rxfiforoom]0_in ;
  input SPW_RXREAD;
  input [6:0]\vres[rxfiforoom] ;
  input \res_seq_reg[rxfull]__0 ;
  input \res_seq_reg[rxeep]__0 ;
  input \res_seq_reg[rxfifo_waddr][15] ;
  input \res_seq_reg[escaped]_0 ;
  input [0:0]E;
  input [0:0]\res_seq_reg[disccnt][0]_0 ;

  wire [0:0]AR;
  wire [5:0]D;
  wire [0:0]E;
  wire [1:0]\FSM_onehot_state_seq_reg[state][2] ;
  wire \FSM_onehot_state_seq_reg[state][2]_0 ;
  wire [0:0]\FSM_onehot_state_seq_reg[state][3] ;
  wire [0:0]Q;
  wire RXMEM_i_27_n_0;
  wire SPW_RXREAD;
  wire SPW_main_clk;
  wire [8:0]WDATA;
  wire WEN;
  wire [1:0]p_0_in;
  wire [9:0]p_0_in__0;
  wire recv_inact;
  wire recv_inbvalid;
  wire \recvo[erresc] ;
  wire \recvo[errpar] ;
  wire \recvo[gotfct] ;
  wire \recvo[gotnull] ;
  wire \recvo[rxchar] ;
  wire [7:0]\recvo[rxdata] ;
  wire \recvo[rxflag] ;
  wire \recvo[tick_out] ;
  wire \res_com[gotfct] ;
  wire \res_com[rxemptydiscard] ;
  wire \res_com[rxfifo_rvalid] ;
  wire \res_seq[bitcnt][0]_i_2_n_0 ;
  wire \res_seq[bitcnt][0]_i_3_n_0 ;
  wire \res_seq[bitcnt][1]_i_2_n_0 ;
  wire \res_seq[bitcnt][2]_i_2_n_0 ;
  wire \res_seq[bitcnt][5]_i_2_n_0 ;
  wire \res_seq[bitcnt][6]_i_2_n_0 ;
  wire \res_seq[bitcnt][7]_i_2_n_0 ;
  wire \res_seq[bitcnt][8]_i_2_n_0 ;
  wire \res_seq[bitcnt][8]_i_4_n_0 ;
  wire \res_seq[bitcnt][8]_i_5_n_0 ;
  wire \res_seq[bitcnt][8]_i_6_n_0 ;
  wire \res_seq[bitcnt][8]_i_7_n_0 ;
  wire \res_seq[bitcnt][9]_i_2_n_0 ;
  wire \res_seq[bitcnt][9]_i_3_n_0 ;
  wire \res_seq[bitcnt][9]_i_4_n_0 ;
  wire \res_seq[bitcnt][9]_i_5_n_0 ;
  wire \res_seq[bitcnt][9]_i_6_n_0 ;
  wire \res_seq[bitcnt][9]_i_7_n_0 ;
  wire \res_seq[control]_i_1_n_0 ;
  wire \res_seq[control]_i_3_n_0 ;
  wire \res_seq[datareg][0]_i_2_n_0 ;
  wire \res_seq[datareg][0]_i_3_n_0 ;
  wire \res_seq[datareg][0]_i_4_n_0 ;
  wire \res_seq[datareg][0]_i_5_n_0 ;
  wire \res_seq[datareg][1]_i_2_n_0 ;
  wire \res_seq[datareg][2]_i_2_n_0 ;
  wire \res_seq[datareg][3]_i_2_n_0 ;
  wire \res_seq[datareg][4]_i_2_n_0 ;
  wire \res_seq[datareg][5]_i_2_n_0 ;
  wire \res_seq[datareg][6]_i_2_n_0 ;
  wire \res_seq[datareg][7]_i_10_n_0 ;
  wire \res_seq[datareg][7]_i_11_n_0 ;
  wire \res_seq[datareg][7]_i_12_n_0 ;
  wire \res_seq[datareg][7]_i_4_n_0 ;
  wire \res_seq[datareg][7]_i_5_n_0 ;
  wire \res_seq[datareg][7]_i_6_n_0 ;
  wire \res_seq[datareg][7]_i_7_n_0 ;
  wire \res_seq[datareg][7]_i_8_n_0 ;
  wire \res_seq[datareg][7]_i_9_n_0 ;
  wire \res_seq[disccnt][1]_i_1_n_0 ;
  wire \res_seq[disccnt][2]_i_1_n_0 ;
  wire \res_seq[disccnt][3]_i_1_n_0 ;
  wire \res_seq[disccnt][4]_i_1_n_0 ;
  wire \res_seq[disccnt][5]_i_1_n_0 ;
  wire \res_seq[disccnt][5]_i_2_n_0 ;
  wire \res_seq[disccnt][6]_i_1_n_0 ;
  wire \res_seq[disccnt][6]_i_2_n_0 ;
  wire \res_seq[disccnt][6]_i_3_n_0 ;
  wire \res_seq[disccnt][7]_i_1_n_0 ;
  wire \res_seq[erresc]_i_1_n_0 ;
  wire \res_seq[erresc]_i_2_n_0 ;
  wire \res_seq[erresc]_i_4_n_0 ;
  wire \res_seq[erresc]_i_6_n_0 ;
  wire \res_seq[errpar]_i_1_n_0 ;
  wire \res_seq[errpar]_i_2_n_0 ;
  wire \res_seq[errpar]_i_3_n_0 ;
  wire \res_seq[escaped]_i_1_n_0 ;
  wire \res_seq[escaped]_i_2_n_0 ;
  wire \res_seq[escaped]_i_4_n_0 ;
  wire \res_seq[escaped]_i_5_n_0 ;
  wire \res_seq[gotfct]_i_5_n_0 ;
  wire \res_seq[gotfct]_i_6_n_0 ;
  wire \res_seq[gotfct]_i_7_n_0 ;
  wire \res_seq[gotfct]_i_8_n_0 ;
  wire \res_seq[gotfct]_i_9_n_0 ;
  wire \res_seq[null_seen]_i_1_n_0 ;
  wire \res_seq[null_seen]_i_2_n_0 ;
  wire \res_seq[null_seen]_i_3_n_0 ;
  wire \res_seq[null_seen]_i_4_n_0 ;
  wire \res_seq[null_seen]_i_5_n_0 ;
  wire \res_seq[null_seen]_i_6_n_0 ;
  wire \res_seq[null_seen]_i_7_n_0 ;
  wire \res_seq[parity]_i_1_n_0 ;
  wire \res_seq[parity]_i_2_n_0 ;
  wire \res_seq[parity]_i_3_n_0 ;
  wire \res_seq[parity]_i_4_n_0 ;
  wire \res_seq[pendfct][0]_i_1_n_0 ;
  wire \res_seq[pendfct][1]_i_1_n_0 ;
  wire \res_seq[rxflag]_i_1_n_0 ;
  wire \res_seq[tick_out]_i_2_n_0 ;
  wire \res_seq[tick_out]_i_3_n_0 ;
  wire \res_seq[tick_out]_i_4_n_0 ;
  wire \res_seq_reg[bit_seen]__0 ;
  wire \res_seq_reg[bitcnt][8]_0 ;
  wire \res_seq_reg[bitcnt_n_0_][0] ;
  wire \res_seq_reg[bitcnt_n_0_][1] ;
  wire \res_seq_reg[bitcnt_n_0_][2] ;
  wire \res_seq_reg[bitcnt_n_0_][3] ;
  wire \res_seq_reg[bitcnt_n_0_][4] ;
  wire \res_seq_reg[bitcnt_n_0_][5] ;
  wire \res_seq_reg[bitcnt_n_0_][6] ;
  wire \res_seq_reg[bitcnt_n_0_][7] ;
  wire \res_seq_reg[bitcnt_n_0_][8] ;
  wire \res_seq_reg[bitcnt_n_0_][9] ;
  wire [0:0]\res_seq_reg[bitshift][8]_0 ;
  wire \res_seq_reg[bitshift][8]_1 ;
  wire [3:0]\res_seq_reg[bitshift][8]_2 ;
  wire \res_seq_reg[bitshift_n_0_][0] ;
  wire \res_seq_reg[bufdout][2] ;
  wire \res_seq_reg[bufdout][3] ;
  wire \res_seq_reg[control]__0 ;
  wire [7:1]\res_seq_reg[disccnt] ;
  wire [0:0]\res_seq_reg[disccnt][0]_0 ;
  wire \res_seq_reg[disccnt][7]_0 ;
  wire \res_seq_reg[erresc]_0 ;
  wire \res_seq_reg[erresc]_1 ;
  wire \res_seq_reg[escaped]_0 ;
  wire \res_seq_reg[escaped]__0 ;
  wire \res_seq_reg[gotfct]_0 ;
  wire \res_seq_reg[gotfct]_1 ;
  wire \res_seq_reg[null_seen]_0 ;
  wire \res_seq_reg[null_seen]_1 ;
  wire \res_seq_reg[parity]__0 ;
  wire \res_seq_reg[pendfct]0 ;
  wire \res_seq_reg[pendfct_n_0_][0] ;
  wire \res_seq_reg[pendfct_n_0_][1] ;
  wire \res_seq_reg[rxchar]_0 ;
  wire \res_seq_reg[rxeep]__0 ;
  wire [6:0]\res_seq_reg[rxfifo_rvalid] ;
  wire \res_seq_reg[rxfifo_waddr][15] ;
  wire \res_seq_reg[rxfull]__0 ;
  wire \res_seq_reg[rxpacket] ;
  wire [4:0]sel0;
  wire \state_seq_reg[timerdone]__0 ;
  wire [7:0]\vres[datareg]__0 ;
  wire \vres[rxchar]9_out ;
  wire [6:0]\vres[rxfiforoom] ;
  wire [6:0]\vres[rxfiforoom]0_in ;
  wire \vres[rxpacket]7_out ;
  wire \vres[tick_out]12_out ;

  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    \FSM_onehot_state_seq[state][2]_i_1 
       (.I0(\FSM_onehot_state_seq_reg[state][2] [1]),
        .I1(\res_seq_reg[rxchar]_0 ),
        .I2(\recvo[gotfct] ),
        .I3(\recvo[gotnull] ),
        .O(\FSM_onehot_state_seq_reg[state][3] ));
  LUT5 #(
    .INIT(32'h00010101)) 
    \FSM_onehot_state_seq[state][2]_i_2 
       (.I0(\recvo[rxchar] ),
        .I1(\res_seq_reg[disccnt][7]_0 ),
        .I2(\recvo[tick_out] ),
        .I3(\state_seq_reg[timerdone]__0 ),
        .I4(\FSM_onehot_state_seq_reg[state][2]_0 ),
        .O(\res_seq_reg[rxchar]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_onehot_state_seq[state][4]_i_2 
       (.I0(\recvo[gotfct] ),
        .I1(\recvo[rxchar] ),
        .I2(\res_seq_reg[disccnt][7]_0 ),
        .I3(\recvo[tick_out] ),
        .O(\res_seq_reg[gotfct]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0100)) 
    \FSM_onehot_state_seq[state][4]_i_3 
       (.I0(\res_seq_reg[disccnt] [7]),
        .I1(\res_seq[disccnt][6]_i_3_n_0 ),
        .I2(\res_seq_reg[disccnt] [6]),
        .I3(\res_seq_reg[bit_seen]__0 ),
        .I4(\recvo[erresc] ),
        .I5(\recvo[errpar] ),
        .O(\res_seq_reg[disccnt][7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \FSM_onehot_state_seq[state][5]_i_8 
       (.I0(\recvo[gotnull] ),
        .I1(\recvo[gotfct] ),
        .I2(\res_seq_reg[rxchar]_0 ),
        .O(\res_seq_reg[null_seen]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    RXMEM_i_17
       (.I0(\recvo[rxflag] ),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[8]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_18
       (.I0(\recvo[rxdata] [7]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[7]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_19
       (.I0(\recvo[rxdata] [6]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[6]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_20
       (.I0(\recvo[rxdata] [5]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[5]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_21
       (.I0(\recvo[rxdata] [4]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[4]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_22
       (.I0(\recvo[rxdata] [3]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_23
       (.I0(\recvo[rxdata] [2]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[2]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    RXMEM_i_24
       (.I0(\recvo[rxdata] [1]),
        .I1(\res_seq_reg[rxeep]__0 ),
        .O(WDATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'hE)) 
    RXMEM_i_25
       (.I0(\res_seq_reg[rxeep]__0 ),
        .I1(\recvo[rxdata] [0]),
        .O(WDATA[0]));
  LUT6 #(
    .INIT(64'h0504050400045504)) 
    RXMEM_i_26
       (.I0(\res_seq_reg[rxfull]__0 ),
        .I1(\res_seq_reg[rxeep]__0 ),
        .I2(\res_seq_reg[rxfifo_waddr][15] ),
        .I3(RXMEM_i_27_n_0),
        .I4(\recvo[rxflag] ),
        .I5(\res_seq_reg[rxpacket] ),
        .O(WEN));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    RXMEM_i_27
       (.I0(\recvo[rxchar] ),
        .I1(\FSM_onehot_state_seq_reg[state][2] [0]),
        .O(RXMEM_i_27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \res_seq[bitcnt][0]_i_1 
       (.I0(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I1(\res_seq[bitcnt][0]_i_2_n_0 ),
        .O(p_0_in__0[0]));
  LUT6 #(
    .INIT(64'hBABFAAAABABFBABF)) 
    \res_seq[bitcnt][0]_i_2 
       (.I0(\res_seq[bitcnt][0]_i_3_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [0]),
        .I2(\res_seq_reg[bitcnt_n_0_][0] ),
        .I3(\res_seq_reg[bitcnt_n_0_][4] ),
        .I4(\recvo[gotnull] ),
        .I5(\res_seq[null_seen]_i_5_n_0 ),
        .O(\res_seq[bitcnt][0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \res_seq[bitcnt][0]_i_3 
       (.I0(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_4_n_0 ),
        .O(\res_seq[bitcnt][0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \res_seq[bitcnt][1]_i_1 
       (.I0(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I1(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I2(\res_seq[bitcnt][1]_i_2_n_0 ),
        .O(p_0_in__0[1]));
  LUT5 #(
    .INIT(32'h0F030F05)) 
    \res_seq[bitcnt][1]_i_2 
       (.I0(\res_seq_reg[bitcnt_n_0_][5] ),
        .I1(\res_seq_reg[bitshift][8]_2 [1]),
        .I2(\res_seq[bitcnt][8]_i_2_n_0 ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq_reg[bitcnt_n_0_][1] ),
        .O(\res_seq[bitcnt][1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \res_seq[bitcnt][2]_i_1 
       (.I0(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I1(\res_seq[bitcnt][2]_i_2_n_0 ),
        .O(p_0_in__0[2]));
  LUT6 #(
    .INIT(64'h0F0F0F0F0F030F05)) 
    \res_seq[bitcnt][2]_i_2 
       (.I0(\res_seq_reg[bitcnt_n_0_][6] ),
        .I1(\res_seq_reg[bitshift][8]_2 [2]),
        .I2(\res_seq_reg[null_seen]_1 ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq_reg[bitcnt_n_0_][2] ),
        .I5(\res_seq[bitcnt][9]_i_3_n_0 ),
        .O(\res_seq[bitcnt][2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0FCFA)) 
    \res_seq[bitcnt][3]_i_1 
       (.I0(\res_seq_reg[bitcnt_n_0_][7] ),
        .I1(\res_seq_reg[bitshift][8]_2 [3]),
        .I2(\res_seq[bitcnt][9]_i_2_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][3] ),
        .I4(\res_seq[bitcnt][5]_i_2_n_0 ),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \res_seq[bitcnt][4]_i_1 
       (.I0(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I1(\res_seq_reg[bitcnt_n_0_][8] ),
        .I2(\res_seq[bitcnt][5]_i_2_n_0 ),
        .O(p_0_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \res_seq[bitcnt][5]_i_1 
       (.I0(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I1(\res_seq_reg[bitcnt_n_0_][9] ),
        .I2(\res_seq[bitcnt][5]_i_2_n_0 ),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \res_seq[bitcnt][5]_i_2 
       (.I0(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_3_n_0 ),
        .O(\res_seq[bitcnt][5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \res_seq[bitcnt][6]_i_1 
       (.I0(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I1(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I2(\res_seq[bitcnt][6]_i_2_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][0] ),
        .I4(\res_seq_reg[bitshift][8]_2 [0]),
        .I5(\res_seq[bitcnt][8]_i_2_n_0 ),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \res_seq[bitcnt][6]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_0 ),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\res_seq_reg[bitshift_n_0_][0] ),
        .I4(\res_seq[bitcnt][9]_i_7_n_0 ),
        .O(\res_seq[bitcnt][6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \res_seq[bitcnt][7]_i_1 
       (.I0(\res_seq_reg[bitshift][8]_2 [1]),
        .I1(\res_seq[bitcnt][8]_i_2_n_0 ),
        .I2(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq_reg[bitcnt_n_0_][1] ),
        .I5(\res_seq_reg[null_seen]_1 ),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h0000FEFF)) 
    \res_seq[bitcnt][7]_i_2 
       (.I0(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][3] ),
        .I4(\res_seq[bitcnt][9]_i_2_n_0 ),
        .O(\res_seq[bitcnt][7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \res_seq[bitcnt][7]_i_3 
       (.I0(\res_seq[null_seen]_i_4_n_0 ),
        .I1(\res_seq[null_seen]_i_6_n_0 ),
        .I2(\recvo[gotnull] ),
        .I3(\res_seq[null_seen]_i_5_n_0 ),
        .O(\res_seq_reg[null_seen]_1 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \res_seq[bitcnt][8]_i_1 
       (.I0(\res_seq[bitcnt][8]_i_2_n_0 ),
        .I1(\res_seq_reg[bitcnt_n_0_][1] ),
        .I2(\res_seq_reg[bitcnt_n_0_][2] ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq_reg[bitcnt][8]_0 ),
        .I5(\res_seq[bitcnt][9]_i_2_n_0 ),
        .O(p_0_in__0[8]));
  LUT5 #(
    .INIT(32'h0000000D)) 
    \res_seq[bitcnt][8]_i_2 
       (.I0(\res_seq[bitcnt][8]_i_4_n_0 ),
        .I1(\res_seq[bitcnt][8]_i_5_n_0 ),
        .I2(\recvo[gotnull] ),
        .I3(\res_seq[bitcnt][8]_i_6_n_0 ),
        .I4(\res_seq[bitcnt][8]_i_7_n_0 ),
        .O(\res_seq[bitcnt][8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \res_seq[bitcnt][8]_i_4 
       (.I0(\res_seq_reg[bitshift_n_0_][0] ),
        .I1(sel0[0]),
        .I2(sel0[1]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .O(\res_seq[bitcnt][8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \res_seq[bitcnt][8]_i_5 
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(sel0[4]),
        .I3(sel0[3]),
        .I4(sel0[2]),
        .O(\res_seq[bitcnt][8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF7)) 
    \res_seq[bitcnt][8]_i_6 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(p_0_in[1]),
        .I5(sel0[4]),
        .O(\res_seq[bitcnt][8]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \res_seq[bitcnt][8]_i_7 
       (.I0(p_0_in[0]),
        .I1(sel0[0]),
        .I2(sel0[3]),
        .O(\res_seq[bitcnt][8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \res_seq[bitcnt][9]_i_1 
       (.I0(\res_seq_reg[bitshift][8]_2 [3]),
        .I1(\res_seq[bitcnt][9]_i_2_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I3(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I4(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I5(\res_seq_reg[bitcnt_n_0_][3] ),
        .O(p_0_in__0[9]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \res_seq[bitcnt][9]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_2 [2]),
        .I1(sel0[2]),
        .I2(p_0_in[0]),
        .I3(\res_seq[null_seen]_i_2_n_0 ),
        .I4(\res_seq[null_seen]_i_4_n_0 ),
        .I5(\res_seq[null_seen]_i_3_n_0 ),
        .O(\res_seq[bitcnt][9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \res_seq[bitcnt][9]_i_3 
       (.I0(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I1(\res_seq_reg[bitcnt_n_0_][1] ),
        .I2(\res_seq[bitcnt][8]_i_2_n_0 ),
        .O(\res_seq[bitcnt][9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAABA000000300030)) 
    \res_seq[bitcnt][9]_i_4 
       (.I0(\res_seq[null_seen]_i_4_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][2] ),
        .I3(\res_seq_reg[bitcnt_n_0_][1] ),
        .I4(\res_seq[null_seen]_i_6_n_0 ),
        .I5(\res_seq[bitcnt][9]_i_6_n_0 ),
        .O(\res_seq[bitcnt][9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAABAAAAAA)) 
    \res_seq[bitcnt][9]_i_5 
       (.I0(\res_seq_reg[bitcnt_n_0_][0] ),
        .I1(\res_seq[bitcnt][9]_i_7_n_0 ),
        .I2(\res_seq_reg[bitshift_n_0_][0] ),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .I5(\res_seq_reg[bitshift][8]_0 ),
        .O(\res_seq[bitcnt][9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5555555554555555)) 
    \res_seq[bitcnt][9]_i_6 
       (.I0(\recvo[gotnull] ),
        .I1(\res_seq[bitcnt][8]_i_5_n_0 ),
        .I2(\res_seq_reg[bitshift_n_0_][0] ),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .I5(\res_seq_reg[bitshift][8]_0 ),
        .O(\res_seq[bitcnt][9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFBFFFF)) 
    \res_seq[bitcnt][9]_i_7 
       (.I0(\recvo[gotnull] ),
        .I1(sel0[4]),
        .I2(p_0_in[0]),
        .I3(sel0[3]),
        .I4(sel0[2]),
        .I5(p_0_in[1]),
        .O(\res_seq[bitcnt][9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \res_seq[control]_i_1 
       (.I0(\res_seq_reg[bufdout][2] ),
        .I1(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [3]),
        .O(\res_seq[control]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \res_seq[control]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_2 [2]),
        .I1(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I2(\res_seq[control]_i_3_n_0 ),
        .O(\res_seq_reg[bufdout][2] ));
  LUT6 #(
    .INIT(64'h551055DC551355DF)) 
    \res_seq[control]_i_3 
       (.I0(\res_seq_reg[bitshift][8]_2 [1]),
        .I1(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][1] ),
        .I3(\res_seq[bitcnt][8]_i_2_n_0 ),
        .I4(\res_seq_reg[bitshift][8]_2 [0]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[control]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000022F0FFFFBBF0)) 
    \res_seq[datareg][0]_i_1 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq_reg[bitshift][8]_2 [1]),
        .I2(sel0[2]),
        .I3(\res_seq_reg[bufdout][2] ),
        .I4(\res_seq_reg[bufdout][3] ),
        .I5(\res_seq[datareg][0]_i_2_n_0 ),
        .O(\vres[datareg]__0 [0]));
  LUT6 #(
    .INIT(64'h0000002F00BF00BF)) 
    \res_seq[datareg][0]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq_reg[bitshift][8]_0 ),
        .I2(\res_seq[gotfct]_i_6_n_0 ),
        .I3(\res_seq[datareg][0]_i_3_n_0 ),
        .I4(\res_seq[datareg][7]_i_9_n_0 ),
        .I5(\res_seq[datareg][0]_i_4_n_0 ),
        .O(\res_seq[datareg][0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \res_seq[datareg][0]_i_3 
       (.I0(sel0[1]),
        .I1(\res_seq[control]_i_3_n_0 ),
        .I2(\res_seq[datareg][7]_i_9_n_0 ),
        .O(\res_seq[datareg][0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000F022FFFFF0BB)) 
    \res_seq[datareg][0]_i_4 
       (.I0(p_0_in[1]),
        .I1(\res_seq_reg[bitshift][8]_0 ),
        .I2(sel0[0]),
        .I3(\res_seq[gotfct]_i_9_n_0 ),
        .I4(\res_seq[datareg][7]_i_11_n_0 ),
        .I5(\res_seq[datareg][0]_i_5_n_0 ),
        .O(\res_seq[datareg][0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hA3)) 
    \res_seq[datareg][0]_i_5 
       (.I0(p_0_in[1]),
        .I1(\res_seq_reg[bitshift_n_0_][0] ),
        .I2(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][1]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(sel0[3]),
        .I2(sel0[2]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][1]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [1]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][1]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(sel0[1]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(sel0[0]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][2]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(sel0[4]),
        .I2(sel0[3]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][2]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [2]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][2]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(sel0[2]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(sel0[1]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][3]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(p_0_in[0]),
        .I2(sel0[4]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][3]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [3]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][3]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(sel0[3]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(sel0[2]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][4]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][4]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [4]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][4]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(sel0[4]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(sel0[3]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][5]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_0 ),
        .I2(p_0_in[1]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][5]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [5]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][5]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(p_0_in[0]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(sel0[4]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][6]_i_1 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [0]),
        .I2(\res_seq_reg[bitshift][8]_0 ),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][6]_i_2_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [6]));
  LUT6 #(
    .INIT(64'h0808080808AA0808)) 
    \res_seq[datareg][6]_i_2 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(p_0_in[1]),
        .I2(\res_seq[tick_out]_i_4_n_0 ),
        .I3(\res_seq[datareg][7]_i_7_n_0 ),
        .I4(p_0_in[0]),
        .I5(\res_seq_reg[control]__0 ),
        .O(\res_seq[datareg][6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hBAAB)) 
    \res_seq[datareg][7]_i_10 
       (.I0(\res_seq[datareg][7]_i_9_n_0 ),
        .I1(\res_seq[control]_i_3_n_0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .O(\res_seq[datareg][7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hF9FFF9F9FFFFFFFF)) 
    \res_seq[datareg][7]_i_11 
       (.I0(\res_seq[datareg][7]_i_12_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [1]),
        .I2(\res_seq_reg[bitcnt_n_0_][0] ),
        .I3(\res_seq[bitcnt][9]_i_7_n_0 ),
        .I4(\res_seq[bitcnt][8]_i_4_n_0 ),
        .I5(\res_seq_reg[bitcnt_n_0_][1] ),
        .O(\res_seq[datareg][7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \res_seq[datareg][7]_i_12 
       (.I0(\res_seq_reg[parity]__0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [0]),
        .O(\res_seq[datareg][7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444444444)) 
    \res_seq[datareg][7]_i_2 
       (.I0(\res_seq[tick_out]_i_3_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [1]),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq[datareg][7]_i_4_n_0 ),
        .I4(\res_seq[datareg][7]_i_5_n_0 ),
        .I5(\res_seq[datareg][7]_i_6_n_0 ),
        .O(\vres[datareg]__0 [7]));
  LUT6 #(
    .INIT(64'hBBBBBBBBFFFFBFFB)) 
    \res_seq[datareg][7]_i_3 
       (.I0(\res_seq[datareg][7]_i_7_n_0 ),
        .I1(\res_seq[datareg][7]_i_8_n_0 ),
        .I2(\res_seq_reg[bitshift][8]_0 ),
        .I3(\res_seq_reg[bitshift][8]_2 [0]),
        .I4(\res_seq[control]_i_3_n_0 ),
        .I5(\res_seq[datareg][7]_i_9_n_0 ),
        .O(\res_seq_reg[bitshift][8]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \res_seq[datareg][7]_i_4 
       (.I0(\res_seq[datareg][7]_i_9_n_0 ),
        .I1(\res_seq[control]_i_3_n_0 ),
        .O(\res_seq[datareg][7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h2A222A222A220000)) 
    \res_seq[datareg][7]_i_5 
       (.I0(\res_seq[datareg][7]_i_10_n_0 ),
        .I1(\res_seq[tick_out]_i_4_n_0 ),
        .I2(\res_seq_reg[control]__0 ),
        .I3(p_0_in[1]),
        .I4(\res_seq_reg[bitshift][8]_0 ),
        .I5(\res_seq[datareg][7]_i_11_n_0 ),
        .O(\res_seq[datareg][7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hEAAE)) 
    \res_seq[datareg][7]_i_6 
       (.I0(\res_seq_reg[bufdout][3] ),
        .I1(\res_seq_reg[bufdout][2] ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[bitshift][8]_2 [1]),
        .O(\res_seq[datareg][7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000047FFFF47)) 
    \res_seq[datareg][7]_i_7 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I2(\res_seq_reg[control]__0 ),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(p_0_in[1]),
        .I5(\res_seq[datareg][7]_i_11_n_0 ),
        .O(\res_seq[datareg][7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFD7D7D7D7D7FFD7)) 
    \res_seq[datareg][7]_i_8 
       (.I0(\res_seq_reg[bitcnt_n_0_][0] ),
        .I1(\res_seq_reg[parity]__0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[control]__0 ),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\res_seq[datareg][7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFFFFFFFFFD)) 
    \res_seq[datareg][7]_i_9 
       (.I0(\res_seq_reg[bitcnt_n_0_][2] ),
        .I1(\res_seq[bitcnt][8]_i_2_n_0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][1] ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq[parity]_i_4_n_0 ),
        .I5(\res_seq_reg[bitshift][8]_2 [2]),
        .O(\res_seq[datareg][7]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h41)) 
    \res_seq[disccnt][1]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt] [1]),
        .I2(Q),
        .O(\res_seq[disccnt][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFEAB)) 
    \res_seq[disccnt][2]_i_1 
       (.I0(recv_inact),
        .I1(Q),
        .I2(\res_seq_reg[disccnt] [1]),
        .I3(\res_seq_reg[disccnt] [2]),
        .O(\res_seq[disccnt][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h55540001)) 
    \res_seq[disccnt][3]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt] [2]),
        .I2(\res_seq_reg[disccnt] [1]),
        .I3(Q),
        .I4(\res_seq_reg[disccnt] [3]),
        .O(\res_seq[disccnt][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAB)) 
    \res_seq[disccnt][4]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt] [3]),
        .I2(Q),
        .I3(\res_seq_reg[disccnt] [1]),
        .I4(\res_seq_reg[disccnt] [2]),
        .I5(\res_seq_reg[disccnt] [4]),
        .O(\res_seq[disccnt][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h41)) 
    \res_seq[disccnt][5]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq[disccnt][5]_i_2_n_0 ),
        .I2(\res_seq_reg[disccnt] [5]),
        .O(\res_seq[disccnt][5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \res_seq[disccnt][5]_i_2 
       (.I0(\res_seq_reg[disccnt] [4]),
        .I1(\res_seq_reg[disccnt] [2]),
        .I2(\res_seq_reg[disccnt] [1]),
        .I3(Q),
        .I4(\res_seq_reg[disccnt] [3]),
        .O(\res_seq[disccnt][5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \res_seq[disccnt][6]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt] [6]),
        .I2(\res_seq[disccnt][6]_i_3_n_0 ),
        .I3(\res_seq_reg[disccnt] [7]),
        .O(\res_seq[disccnt][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hEB)) 
    \res_seq[disccnt][6]_i_2 
       (.I0(recv_inact),
        .I1(\res_seq[disccnt][6]_i_3_n_0 ),
        .I2(\res_seq_reg[disccnt] [6]),
        .O(\res_seq[disccnt][6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \res_seq[disccnt][6]_i_3 
       (.I0(\res_seq_reg[disccnt] [5]),
        .I1(\res_seq_reg[disccnt] [3]),
        .I2(Q),
        .I3(\res_seq_reg[disccnt] [1]),
        .I4(\res_seq_reg[disccnt] [2]),
        .I5(\res_seq_reg[disccnt] [4]),
        .O(\res_seq[disccnt][6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h5400)) 
    \res_seq[disccnt][7]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt] [6]),
        .I2(\res_seq[disccnt][6]_i_3_n_0 ),
        .I3(\res_seq_reg[disccnt] [7]),
        .O(\res_seq[disccnt][7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \res_seq[erresc]_i_1 
       (.I0(\res_seq_reg[escaped]__0 ),
        .I1(recv_inbvalid),
        .I2(\res_seq[erresc]_i_2_n_0 ),
        .I3(\recvo[erresc] ),
        .O(\res_seq[erresc]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7070707000707070)) 
    \res_seq[erresc]_i_2 
       (.I0(\res_seq_reg[erresc]_0 ),
        .I1(\res_seq[gotfct]_i_6_n_0 ),
        .I2(\res_seq[erresc]_i_4_n_0 ),
        .I3(\res_seq_reg[erresc]_1 ),
        .I4(\res_seq_reg[bufdout][2] ),
        .I5(\res_seq_reg[bufdout][3] ),
        .O(\res_seq[erresc]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000007F5F5F7F7F)) 
    \res_seq[erresc]_i_4 
       (.I0(\res_seq_reg[control]__0 ),
        .I1(p_0_in[0]),
        .I2(\res_seq[erresc]_i_6_n_0 ),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(p_0_in[1]),
        .I5(\res_seq[gotfct]_i_7_n_0 ),
        .O(\res_seq[erresc]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \res_seq[erresc]_i_6 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq_reg[parity]__0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][0] ),
        .O(\res_seq[erresc]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFA88A8888)) 
    \res_seq[errpar]_i_1 
       (.I0(recv_inbvalid),
        .I1(\res_seq[errpar]_i_2_n_0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[parity]__0 ),
        .I4(\res_seq_reg[bitcnt_n_0_][0] ),
        .I5(\recvo[errpar] ),
        .O(\res_seq[errpar]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0100FFFF0000)) 
    \res_seq[errpar]_i_2 
       (.I0(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][3] ),
        .I4(\res_seq[errpar]_i_3_n_0 ),
        .I5(\res_seq[parity]_i_2_n_0 ),
        .O(\res_seq[errpar]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00AA00BA00300000)) 
    \res_seq[errpar]_i_3 
       (.I0(\res_seq_reg[bitcnt_n_0_][1] ),
        .I1(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][2] ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq_reg[bitshift][8]_2 [2]),
        .I5(\res_seq[parity]_i_4_n_0 ),
        .O(\res_seq[errpar]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFAFCF00C0A0C0)) 
    \res_seq[escaped]_i_1 
       (.I0(\res_seq[escaped]_i_2_n_0 ),
        .I1(\res_seq_reg[escaped]_0 ),
        .I2(recv_inbvalid),
        .I3(\res_seq_reg[bufdout][3] ),
        .I4(\res_seq[escaped]_i_4_n_0 ),
        .I5(\res_seq_reg[escaped]__0 ),
        .O(\res_seq[escaped]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF4444444)) 
    \res_seq[escaped]_i_2 
       (.I0(\res_seq[escaped]_i_5_n_0 ),
        .I1(\res_seq[datareg][7]_i_9_n_0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(\res_seq[gotfct]_i_6_n_0 ),
        .O(\res_seq[escaped]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h9F000000)) 
    \res_seq[escaped]_i_4 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq_reg[parity]__0 ),
        .I2(\res_seq_reg[bitcnt_n_0_][0] ),
        .I3(\res_seq[datareg][7]_i_11_n_0 ),
        .I4(\res_seq[datareg][7]_i_9_n_0 ),
        .O(\res_seq[escaped]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h07FF77FF77FF77FF)) 
    \res_seq[escaped]_i_5 
       (.I0(\res_seq_reg[bitshift][8]_0 ),
        .I1(\res_seq[gotfct]_i_7_n_0 ),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(\res_seq_reg[control]__0 ),
        .I5(\res_seq[datareg][7]_i_11_n_0 ),
        .O(\res_seq[escaped]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABAAAAAAABA)) 
    \res_seq[gotfct]_i_1 
       (.I0(\res_seq_reg[pendfct]0 ),
        .I1(\res_seq_reg[escaped]__0 ),
        .I2(recv_inbvalid),
        .I3(\res_seq_reg[gotfct]_1 ),
        .I4(\res_seq_reg[bufdout][3] ),
        .I5(\res_seq[gotfct]_i_5_n_0 ),
        .O(\res_com[gotfct] ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \res_seq[gotfct]_i_2 
       (.I0(\res_seq_reg[pendfct_n_0_][0] ),
        .I1(\res_seq_reg[pendfct_n_0_][1] ),
        .I2(recv_inbvalid),
        .O(\res_seq_reg[pendfct]0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF6F)) 
    \res_seq[gotfct]_i_4 
       (.I0(\res_seq[parity]_i_3_n_0 ),
        .I1(\res_seq_reg[bitshift][8]_2 [3]),
        .I2(\res_seq_reg[bitcnt_n_0_][3] ),
        .I3(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I4(\res_seq[bitcnt][9]_i_4_n_0 ),
        .I5(\res_seq[bitcnt][9]_i_3_n_0 ),
        .O(\res_seq_reg[bufdout][3] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF004F0044)) 
    \res_seq[gotfct]_i_5 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq[gotfct]_i_6_n_0 ),
        .I2(p_0_in[1]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(\res_seq[gotfct]_i_7_n_0 ),
        .I5(\res_seq[gotfct]_i_8_n_0 ),
        .O(\res_seq[gotfct]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    \res_seq[gotfct]_i_6 
       (.I0(\res_seq[parity]_i_3_n_0 ),
        .I1(\res_seq[bitcnt][9]_i_3_n_0 ),
        .I2(\res_seq[gotfct]_i_9_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][2] ),
        .I4(\res_seq[bitcnt][9]_i_5_n_0 ),
        .O(\res_seq[gotfct]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h5404)) 
    \res_seq[gotfct]_i_7 
       (.I0(\res_seq[datareg][7]_i_11_n_0 ),
        .I1(\res_seq_reg[control]__0 ),
        .I2(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I3(\res_seq_reg[bitshift][8]_2 [0]),
        .O(\res_seq[gotfct]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000280000)) 
    \res_seq[gotfct]_i_8 
       (.I0(\res_seq_reg[bitcnt_n_0_][0] ),
        .I1(\res_seq_reg[parity]__0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(p_0_in[1]),
        .I4(\res_seq_reg[control]__0 ),
        .I5(p_0_in[0]),
        .O(\res_seq[gotfct]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \res_seq[gotfct]_i_9 
       (.I0(\res_seq_reg[bitshift][8]_2 [0]),
        .I1(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I2(\res_seq_reg[control]__0 ),
        .O(\res_seq[gotfct]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0010)) 
    \res_seq[null_seen]_i_1 
       (.I0(\res_seq_reg[bitshift][8]_2 [2]),
        .I1(sel0[2]),
        .I2(p_0_in[0]),
        .I3(\res_seq[null_seen]_i_2_n_0 ),
        .I4(\res_seq[null_seen]_i_3_n_0 ),
        .I5(\res_seq[null_seen]_i_4_n_0 ),
        .O(\res_seq[null_seen]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    \res_seq[null_seen]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_2 [1]),
        .I1(\res_seq_reg[bitshift][8]_2 [0]),
        .I2(p_0_in[1]),
        .I3(\res_seq_reg[bitshift][8]_0 ),
        .I4(sel0[3]),
        .I5(sel0[4]),
        .O(\res_seq[null_seen]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \res_seq[null_seen]_i_3 
       (.I0(\res_seq[null_seen]_i_5_n_0 ),
        .I1(\recvo[gotnull] ),
        .I2(\res_seq[null_seen]_i_6_n_0 ),
        .O(\res_seq[null_seen]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \res_seq[null_seen]_i_4 
       (.I0(sel0[1]),
        .I1(sel0[2]),
        .I2(p_0_in[0]),
        .I3(\res_seq[null_seen]_i_7_n_0 ),
        .O(\res_seq[null_seen]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \res_seq[null_seen]_i_5 
       (.I0(\res_seq[bitcnt][8]_i_4_n_0 ),
        .I1(sel0[2]),
        .I2(sel0[3]),
        .I3(sel0[4]),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\res_seq[null_seen]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \res_seq[null_seen]_i_6 
       (.I0(sel0[3]),
        .I1(sel0[0]),
        .I2(p_0_in[0]),
        .I3(\res_seq[bitcnt][8]_i_6_n_0 ),
        .O(\res_seq[null_seen]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    \res_seq[null_seen]_i_7 
       (.I0(\res_seq_reg[bitshift][8]_2 [1]),
        .I1(\res_seq_reg[bitshift][8]_2 [0]),
        .I2(\res_seq_reg[bitshift][8]_0 ),
        .I3(p_0_in[1]),
        .I4(sel0[3]),
        .I5(sel0[4]),
        .O(\res_seq[null_seen]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \res_seq[parity]_i_1 
       (.I0(\res_seq[bitcnt][7]_i_2_n_0 ),
        .I1(\res_seq[parity]_i_2_n_0 ),
        .O(\res_seq[parity]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h56)) 
    \res_seq[parity]_i_2 
       (.I0(\res_seq_reg[bitshift][8]_2 [3]),
        .I1(\res_seq[parity]_i_3_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_4_n_0 ),
        .O(\res_seq[parity]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h55556566)) 
    \res_seq[parity]_i_3 
       (.I0(\res_seq_reg[bitshift][8]_2 [2]),
        .I1(\res_seq[parity]_i_4_n_0 ),
        .I2(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I3(\res_seq_reg[bitcnt_n_0_][1] ),
        .I4(\res_seq[bitcnt][8]_i_2_n_0 ),
        .O(\res_seq[parity]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5665566555555665)) 
    \res_seq[parity]_i_4 
       (.I0(\res_seq_reg[bitshift][8]_2 [1]),
        .I1(\res_seq_reg[bitcnt_n_0_][0] ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[parity]__0 ),
        .I4(\res_seq[bitcnt][8]_i_4_n_0 ),
        .I5(\res_seq[bitcnt][9]_i_7_n_0 ),
        .O(\res_seq[parity]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hA4)) 
    \res_seq[pendfct][0]_i_1 
       (.I0(recv_inbvalid),
        .I1(\res_seq_reg[pendfct_n_0_][1] ),
        .I2(\res_seq_reg[pendfct_n_0_][0] ),
        .O(\res_seq[pendfct][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    \res_seq[pendfct][1]_i_1 
       (.I0(\res_seq_reg[pendfct_n_0_][0] ),
        .I1(\res_seq_reg[pendfct_n_0_][1] ),
        .I2(recv_inbvalid),
        .O(\res_seq[pendfct][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \res_seq[rxemptydiscard]_i_1 
       (.I0(\res_seq_reg[rxpacket] ),
        .I1(\recvo[rxflag] ),
        .I2(\recvo[rxchar] ),
        .I3(\FSM_onehot_state_seq_reg[state][2] [0]),
        .I4(\res_seq_reg[rxfifo_waddr][15] ),
        .O(\res_com[rxemptydiscard] ));
  LUT5 #(
    .INIT(32'h0434C7F7)) 
    \res_seq[rxfifo_rvalid]_i_1 
       (.I0(\vres[rxfiforoom]0_in [6]),
        .I1(SPW_RXREAD),
        .I2(WEN),
        .I3(\vres[rxfiforoom] [6]),
        .I4(\res_seq_reg[rxfifo_rvalid] [6]),
        .O(\res_com[rxfifo_rvalid] ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][12]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [3]),
        .I1(\vres[rxfiforoom]0_in [3]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][13]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [4]),
        .I1(\vres[rxfiforoom]0_in [4]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][15]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [5]),
        .I1(\vres[rxfiforoom]0_in [5]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [5]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][1]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [0]),
        .I1(\vres[rxfiforoom]0_in [0]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][8]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [1]),
        .I1(\vres[rxfiforoom]0_in [1]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][9]_i_1 
       (.I0(\res_seq_reg[rxfifo_rvalid] [2]),
        .I1(\vres[rxfiforoom]0_in [2]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hEFE0)) 
    \res_seq[rxflag]_i_1 
       (.I0(\res_seq_reg[control]__0 ),
        .I1(\res_seq_reg[escaped]__0 ),
        .I2(E),
        .I3(\recvo[rxflag] ),
        .O(\res_seq[rxflag]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h7040)) 
    \res_seq[rxpacket]_i_1 
       (.I0(\recvo[rxflag] ),
        .I1(\recvo[rxchar] ),
        .I2(\FSM_onehot_state_seq_reg[state][2] [0]),
        .I3(\res_seq_reg[rxpacket] ),
        .O(\vres[rxpacket]7_out ));
  LUT4 #(
    .INIT(16'h7000)) 
    \res_seq[tick_out]_i_1 
       (.I0(\res_seq[tick_out]_i_2_n_0 ),
        .I1(\res_seq[tick_out]_i_3_n_0 ),
        .I2(\res_seq_reg[escaped]__0 ),
        .I3(recv_inbvalid),
        .O(\vres[tick_out]12_out ));
  LUT6 #(
    .INIT(64'hFFD7000000000000)) 
    \res_seq[tick_out]_i_2 
       (.I0(\res_seq_reg[bitcnt_n_0_][0] ),
        .I1(\res_seq_reg[parity]__0 ),
        .I2(\res_seq_reg[bitshift][8]_2 [0]),
        .I3(\res_seq_reg[control]__0 ),
        .I4(\res_seq[tick_out]_i_4_n_0 ),
        .I5(\res_seq[datareg][7]_i_4_n_0 ),
        .O(\res_seq[tick_out]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \res_seq[tick_out]_i_3 
       (.I0(\res_seq_reg[bufdout][3] ),
        .I1(\res_seq_reg[bufdout][2] ),
        .O(\res_seq[tick_out]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \res_seq[tick_out]_i_4 
       (.I0(\res_seq[datareg][7]_i_11_n_0 ),
        .I1(\res_seq_reg[control]__0 ),
        .I2(\res_seq[bitcnt][9]_i_5_n_0 ),
        .I3(\res_seq_reg[bitshift][8]_2 [0]),
        .O(\res_seq[tick_out]_i_4_n_0 ));
  FDCE \res_seq_reg[bit_seen] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(1'b1),
        .Q(\res_seq_reg[bit_seen]__0 ));
  FDCE \res_seq_reg[bitcnt][0] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[0]),
        .Q(\res_seq_reg[bitcnt_n_0_][0] ));
  FDCE \res_seq_reg[bitcnt][1] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[1]),
        .Q(\res_seq_reg[bitcnt_n_0_][1] ));
  FDCE \res_seq_reg[bitcnt][2] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[2]),
        .Q(\res_seq_reg[bitcnt_n_0_][2] ));
  FDCE \res_seq_reg[bitcnt][3] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[3]),
        .Q(\res_seq_reg[bitcnt_n_0_][3] ));
  FDCE \res_seq_reg[bitcnt][4] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[4]),
        .Q(\res_seq_reg[bitcnt_n_0_][4] ));
  FDCE \res_seq_reg[bitcnt][5] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[5]),
        .Q(\res_seq_reg[bitcnt_n_0_][5] ));
  FDCE \res_seq_reg[bitcnt][6] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[6]),
        .Q(\res_seq_reg[bitcnt_n_0_][6] ));
  FDCE \res_seq_reg[bitcnt][7] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[7]),
        .Q(\res_seq_reg[bitcnt_n_0_][7] ));
  FDCE \res_seq_reg[bitcnt][8] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[8]),
        .Q(\res_seq_reg[bitcnt_n_0_][8] ));
  FDCE \res_seq_reg[bitcnt][9] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(p_0_in__0[9]),
        .Q(\res_seq_reg[bitcnt_n_0_][9] ));
  FDPE \res_seq_reg[bitshift][0] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(sel0[3]),
        .PRE(AR),
        .Q(\res_seq_reg[bitshift_n_0_][0] ));
  FDPE \res_seq_reg[bitshift][1] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(sel0[4]),
        .PRE(AR),
        .Q(sel0[0]));
  FDPE \res_seq_reg[bitshift][2] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(p_0_in[0]),
        .PRE(AR),
        .Q(sel0[1]));
  FDPE \res_seq_reg[bitshift][3] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(p_0_in[1]),
        .PRE(AR),
        .Q(sel0[2]));
  FDPE \res_seq_reg[bitshift][4] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(\res_seq_reg[bitshift][8]_0 ),
        .PRE(AR),
        .Q(sel0[3]));
  FDPE \res_seq_reg[bitshift][5] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(\res_seq_reg[bitshift][8]_2 [0]),
        .PRE(AR),
        .Q(sel0[4]));
  FDPE \res_seq_reg[bitshift][6] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(\res_seq_reg[bitshift][8]_2 [1]),
        .PRE(AR),
        .Q(p_0_in[0]));
  FDPE \res_seq_reg[bitshift][7] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(\res_seq_reg[bitshift][8]_2 [2]),
        .PRE(AR),
        .Q(p_0_in[1]));
  FDPE \res_seq_reg[bitshift][8] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .D(\res_seq_reg[bitshift][8]_2 [3]),
        .PRE(AR),
        .Q(\res_seq_reg[bitshift][8]_0 ));
  FDCE \res_seq_reg[control] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(\res_seq[control]_i_1_n_0 ),
        .Q(\res_seq_reg[control]__0 ));
  FDCE \res_seq_reg[datareg][0] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [0]),
        .Q(\recvo[rxdata] [0]));
  FDCE \res_seq_reg[datareg][1] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [1]),
        .Q(\recvo[rxdata] [1]));
  FDCE \res_seq_reg[datareg][2] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [2]),
        .Q(\recvo[rxdata] [2]));
  FDCE \res_seq_reg[datareg][3] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [3]),
        .Q(\recvo[rxdata] [3]));
  FDCE \res_seq_reg[datareg][4] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [4]),
        .Q(\recvo[rxdata] [4]));
  FDCE \res_seq_reg[datareg][5] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [5]),
        .Q(\recvo[rxdata] [5]));
  FDCE \res_seq_reg[datareg][6] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [6]),
        .Q(\recvo[rxdata] [6]));
  FDCE \res_seq_reg[datareg][7] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(AR),
        .D(\vres[datareg]__0 [7]),
        .Q(\recvo[rxdata] [7]));
  FDCE \res_seq_reg[disccnt][0] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq_reg[disccnt][0]_0 ),
        .Q(Q));
  FDCE \res_seq_reg[disccnt][1] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][1]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [1]));
  FDCE \res_seq_reg[disccnt][2] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][2]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [2]));
  FDCE \res_seq_reg[disccnt][3] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][3]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [3]));
  FDCE \res_seq_reg[disccnt][4] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][4]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [4]));
  FDCE \res_seq_reg[disccnt][5] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][5]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [5]));
  FDCE \res_seq_reg[disccnt][6] 
       (.C(SPW_main_clk),
        .CE(\res_seq[disccnt][6]_i_1_n_0 ),
        .CLR(AR),
        .D(\res_seq[disccnt][6]_i_2_n_0 ),
        .Q(\res_seq_reg[disccnt] [6]));
  FDCE \res_seq_reg[disccnt][7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[disccnt][7]_i_1_n_0 ),
        .Q(\res_seq_reg[disccnt] [7]));
  FDCE \res_seq_reg[erresc] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[erresc]_i_1_n_0 ),
        .Q(\recvo[erresc] ));
  FDCE \res_seq_reg[errpar] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[errpar]_i_1_n_0 ),
        .Q(\recvo[errpar] ));
  FDCE \res_seq_reg[escaped] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[escaped]_i_1_n_0 ),
        .Q(\res_seq_reg[escaped]__0 ));
  FDCE \res_seq_reg[gotfct] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_com[gotfct] ),
        .Q(\recvo[gotfct] ));
  FDCE \res_seq_reg[null_seen] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(\res_seq[null_seen]_i_1_n_0 ),
        .Q(\recvo[gotnull] ));
  FDCE \res_seq_reg[parity] 
       (.C(SPW_main_clk),
        .CE(recv_inbvalid),
        .CLR(AR),
        .D(\res_seq[parity]_i_1_n_0 ),
        .Q(\res_seq_reg[parity]__0 ));
  FDCE \res_seq_reg[pendfct][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[pendfct][0]_i_1_n_0 ),
        .Q(\res_seq_reg[pendfct_n_0_][0] ));
  FDCE \res_seq_reg[pendfct][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[pendfct][1]_i_1_n_0 ),
        .Q(\res_seq_reg[pendfct_n_0_][1] ));
  FDCE \res_seq_reg[rxchar] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\vres[rxchar]9_out ),
        .Q(\recvo[rxchar] ));
  FDCE \res_seq_reg[rxflag] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\res_seq[rxflag]_i_1_n_0 ),
        .Q(\recvo[rxflag] ));
  FDCE \res_seq_reg[tick_out] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(AR),
        .D(\vres[tick_out]12_out ),
        .Q(\recvo[tick_out] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront
   (syncdff_ff2_reg,
    recv_inact,
    recv_inbvalid,
    \res_seq_reg[bufdout][2]_0 ,
    Q,
    \res_seq_reg[tailptr_gray][0]_0 ,
    \vres[rxchar]9_out ,
    E,
    \res_seq_reg[bufdout][1]_0 ,
    \res_seq_reg[bufdout][1]_1 ,
    \res_seq_reg[bufdout][0]_0 ,
    \res_seq_reg[bufdout][0]_1 ,
    D,
    SPW_Din,
    SPW_main_clk,
    buf_ff0_reg,
    \vres[inbvalid]0_out ,
    \res_seq_reg[bitcnt][8] ,
    recv_rxen,
    SPW_Sin,
    \res_seq_reg[escaped]__0 ,
    \res_seq_reg[datareg][7] ,
    \res_seq_reg[datareg][7]_0 ,
    \res_seq_reg[datareg][7]_1 ,
    \res_seq[erresc]_i_2 ,
    \res_seq_reg[disccnt][0] ,
    \res_seq_reg[bitcntp_gray][3]_0 ,
    load);
  output [2:0]syncdff_ff2_reg;
  output recv_inact;
  output recv_inbvalid;
  output \res_seq_reg[bufdout][2]_0 ;
  output [3:0]Q;
  output \res_seq_reg[tailptr_gray][0]_0 ;
  output \vres[rxchar]9_out ;
  output [0:0]E;
  output \res_seq_reg[bufdout][1]_0 ;
  output \res_seq_reg[bufdout][1]_1 ;
  output \res_seq_reg[bufdout][0]_0 ;
  output \res_seq_reg[bufdout][0]_1 ;
  output [0:0]D;
  input SPW_Din;
  input SPW_main_clk;
  input buf_ff0_reg;
  input \vres[inbvalid]0_out ;
  input \res_seq_reg[bitcnt][8] ;
  input recv_rxen;
  input SPW_Sin;
  input \res_seq_reg[escaped]__0 ;
  input \res_seq_reg[datareg][7] ;
  input \res_seq_reg[datareg][7]_0 ;
  input \res_seq_reg[datareg][7]_1 ;
  input [0:0]\res_seq[erresc]_i_2 ;
  input [0:0]\res_seq_reg[disccnt][0] ;
  input [2:0]\res_seq_reg[bitcntp_gray][3]_0 ;
  input load;

  wire A;
  wire [1:0]BinToGray;
  wire [0:0]D;
  wire DI;
  wire [0:0]E;
  wire FIFOMEM_n_0;
  wire FIFOMEM_n_1;
  wire FIFOMEM_n_2;
  wire FIFOMEM_n_3;
  wire [3:0]Q;
  wire RXRSTLOGIC_n_0;
  wire SPW_Din;
  wire SPW_Sin;
  wire SPW_main_clk;
  wire SYNCSYSHEADPTR0_n_0;
  wire SYNCSYSHEADPTR0_n_1;
  wire buf_ff0_reg;
  wire ff_f_di1;
  wire ff_r_di1;
  wire load;
  wire p_0_in2_in;
  wire p_10_in;
  wire [3:1]plusOp;
  wire [3:1]plusOp__0;
  wire recv_inact;
  wire recv_inbvalid;
  wire recv_rxen;
  wire [0:0]\res_com[bitcntp_gray] ;
  wire [1:0]\res_com[tailptr] ;
  wire [2:2]\res_com[tailptr_gray] ;
  wire [0:0]\res_seq[erresc]_i_2 ;
  wire \res_seq_reg[bitcnt][8] ;
  wire [3:0]\res_seq_reg[bitcntp_gray] ;
  wire [2:0]\res_seq_reg[bitcntp_gray][3]_0 ;
  wire \res_seq_reg[bufdout][0]_0 ;
  wire \res_seq_reg[bufdout][0]_1 ;
  wire \res_seq_reg[bufdout][1]_0 ;
  wire \res_seq_reg[bufdout][1]_1 ;
  wire \res_seq_reg[bufdout][2]_0 ;
  wire \res_seq_reg[datareg][7] ;
  wire \res_seq_reg[datareg][7]_0 ;
  wire \res_seq_reg[datareg][7]_1 ;
  wire [0:0]\res_seq_reg[disccnt][0] ;
  wire \res_seq_reg[escaped]__0 ;
  wire [2:0]\res_seq_reg[tailptr] ;
  wire [1:0]\res_seq_reg[tailptr_gray] ;
  wire \res_seq_reg[tailptr_gray][0]_0 ;
  wire [3:0]\resrx_com[bufdata] ;
  wire \resrx_com[bufwrite] ;
  wire \resrx_seq_reg[bufdata_n_0_][0] ;
  wire \resrx_seq_reg[bufdata_n_0_][1] ;
  wire \resrx_seq_reg[bufwrite_n_0_] ;
  wire [2:0]\resrx_seq_reg[headptr] ;
  wire \resrx_seq_reg[headptr_gray_n_0_][0] ;
  wire rxclk;
  wire [3:1]rxcnt_f_reg;
  wire \rxcnt_r_reg_n_0_[2] ;
  wire \rxcnt_r_reg_n_0_[3] ;
  wire [2:0]syncdff_ff2_reg;
  wire [2:1]\syncsys[headptr_gray] ;
  wire [0:0]\syncsys[rxcnt_ddr_gray] ;
  wire \vres[inact]1_out ;
  wire \vres[inbvalid]0_out ;
  wire \vres[rxchar]9_out ;
  wire [1:0]\vresrx[headptr] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam FIFOMEM
       (.CLK(rxclk),
        .D({FIFOMEM_n_0,FIFOMEM_n_1,FIFOMEM_n_2,FIFOMEM_n_3}),
        .Q({\resrx_com[bufdata] [1:0],\resrx_seq_reg[bufdata_n_0_][1] ,\resrx_seq_reg[bufdata_n_0_][0] }),
        .SPW_Din(SPW_Din),
        .SPW_Sin(SPW_Sin),
        .recv_rxen(recv_rxen),
        .\res_seq_reg[tailptr] (\res_seq_reg[tailptr] ),
        .\resrx_seq_reg[headptr] (\resrx_seq_reg[headptr] ),
        .\s_mem_reg[0][0]_0 (\resrx_seq_reg[bufwrite_n_0_] ),
        .\s_mem_reg[0][3]_0 (RXRSTLOGIC_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5 RXRSTLOGIC
       (.CLK(rxclk),
        .load(load),
        .\reset_reg_reg[0]_0 (RXRSTLOGIC_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6 SYNCSYSBITCNT0
       (.D(\res_com[bitcntp_gray] ),
        .Q(A),
        .SPW_Din(SPW_Din),
        .SPW_Sin(SPW_Sin),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .buf_ff0_reg_1(rxcnt_f_reg[1]),
        .recv_rxen(recv_rxen),
        .\syncsys[rxcnt_ddr_gray] (\syncsys[rxcnt_ddr_gray] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7 SYNCSYSBITCNT1
       (.Q({\rxcnt_r_reg_n_0_[2] ,A}),
        .SPW_Din(SPW_Din),
        .SPW_Sin(SPW_Sin),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .buf_ff0_reg_1(rxcnt_f_reg[2:1]),
        .syncdff_ff2_reg_0(syncdff_ff2_reg[0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8 SYNCSYSBITCNT2
       (.Q({\rxcnt_r_reg_n_0_[3] ,\rxcnt_r_reg_n_0_[2] }),
        .SPW_Din(SPW_Din),
        .SPW_Sin(SPW_Sin),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .buf_ff0_reg_1(rxcnt_f_reg[3:2]),
        .syncdff_ff2_reg_0(syncdff_ff2_reg[1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9 SYNCSYSBITCNT3
       (.Q(\res_seq_reg[bitcntp_gray] ),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .p_0_in2_in(p_0_in2_in),
        .recv_rxen(recv_rxen),
        .\res_seq_reg[inact] (syncdff_ff2_reg[1:0]),
        .syncdff_ff2_reg_0(syncdff_ff2_reg[2]),
        .\syncsys[rxcnt_ddr_gray] (\syncsys[rxcnt_ddr_gray] ),
        .\vres[inact]1_out (\vres[inact]1_out ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10 SYNCSYSHEADPTR0
       (.D({SYNCSYSHEADPTR0_n_0,SYNCSYSHEADPTR0_n_1}),
        .Q(\resrx_seq_reg[headptr_gray_n_0_][0] ),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .recv_rxen(recv_rxen),
        .\res_com[tailptr_gray] (\res_com[tailptr_gray] ),
        .\res_seq_reg[tailptr] (\res_seq_reg[tailptr] ),
        .\res_seq_reg[tailptr][2] (\syncsys[headptr_gray] ),
        .\res_seq_reg[tailptr][2]_0 (\res_seq_reg[tailptr_gray] ),
        .\res_seq_reg[tailptr_gray][0] (\res_seq_reg[tailptr_gray][0]_0 ),
        .\state_seq_reg[rxen] (\res_com[tailptr] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11 SYNCSYSHEADPTR1
       (.Q(DI),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .syncdff_ff2_reg_0(\syncsys[headptr_gray] [1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12 SYNCSYSHEADPTR2
       (.SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(buf_ff0_reg),
        .\resrx_seq_reg[headptr] (\resrx_seq_reg[headptr] [2]),
        .syncdff_ff2_reg_0(\syncsys[headptr_gray] [2]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    ff_f_di1_reg
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(SPW_Din),
        .Q(ff_f_di1));
  FDCE ff_r_di1_reg
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(SPW_Din),
        .Q(ff_r_di1));
  FDCE ff_r_di2f_reg
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(ff_f_di1),
        .Q(\resrx_com[bufdata] [3]));
  FDCE ff_r_di2r_reg
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(ff_r_di1),
        .Q(\resrx_com[bufdata] [2]));
  LUT2 #(
    .INIT(4'h1)) 
    \res_seq[bitcnt][8]_i_3 
       (.I0(Q[2]),
        .I1(\res_seq_reg[bitcnt][8] ),
        .O(\res_seq_reg[bufdout][2]_0 ));
  LUT6 #(
    .INIT(64'h888A8A8A8A8A888A)) 
    \res_seq[datareg][7]_i_1 
       (.I0(recv_inbvalid),
        .I1(\res_seq_reg[datareg][7] ),
        .I2(\res_seq_reg[datareg][7]_0 ),
        .I3(\res_seq_reg[datareg][7]_1 ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(E));
  LUT2 #(
    .INIT(4'h1)) 
    \res_seq[disccnt][0]_i_1 
       (.I0(recv_inact),
        .I1(\res_seq_reg[disccnt][0] ),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \res_seq[erresc]_i_3 
       (.I0(Q[0]),
        .I1(\res_seq[erresc]_i_2 ),
        .O(\res_seq_reg[bufdout][0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \res_seq[erresc]_i_5 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\res_seq_reg[bufdout][0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[escaped]_i_3 
       (.I0(\res_seq_reg[datareg][7]_1 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\res_seq_reg[bufdout][1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \res_seq[gotfct]_i_3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\res_seq_reg[datareg][7]_1 ),
        .O(\res_seq_reg[bufdout][1]_1 ));
  LUT2 #(
    .INIT(4'h2)) 
    \res_seq[rxchar]_i_1 
       (.I0(E),
        .I1(\res_seq_reg[escaped]__0 ),
        .O(\vres[rxchar]9_out ));
  FDPE \res_seq_reg[bitcntp_gray][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\res_com[bitcntp_gray] ),
        .PRE(buf_ff0_reg),
        .Q(\res_seq_reg[bitcntp_gray] [0]));
  FDCE \res_seq_reg[bitcntp_gray][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq_reg[bitcntp_gray][3]_0 [0]),
        .Q(\res_seq_reg[bitcntp_gray] [1]));
  FDCE \res_seq_reg[bitcntp_gray][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq_reg[bitcntp_gray][3]_0 [1]),
        .Q(\res_seq_reg[bitcntp_gray] [2]));
  FDCE \res_seq_reg[bitcntp_gray][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq_reg[bitcntp_gray][3]_0 [2]),
        .Q(\res_seq_reg[bitcntp_gray] [3]));
  FDCE \res_seq_reg[bufdout][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(FIFOMEM_n_3),
        .Q(Q[0]));
  FDCE \res_seq_reg[bufdout][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(FIFOMEM_n_2),
        .Q(Q[1]));
  FDCE \res_seq_reg[bufdout][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(FIFOMEM_n_1),
        .Q(Q[2]));
  FDCE \res_seq_reg[bufdout][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(FIFOMEM_n_0),
        .Q(Q[3]));
  FDCE \res_seq_reg[inact] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\vres[inact]1_out ),
        .Q(recv_inact));
  FDCE \res_seq_reg[inbvalid] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\vres[inbvalid]0_out ),
        .Q(recv_inbvalid));
  FDCE \res_seq_reg[tailptr][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_com[tailptr] [0]),
        .Q(\res_seq_reg[tailptr] [0]));
  FDCE \res_seq_reg[tailptr][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_com[tailptr] [1]),
        .Q(\res_seq_reg[tailptr] [1]));
  FDCE \res_seq_reg[tailptr][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_com[tailptr_gray] ),
        .Q(\res_seq_reg[tailptr] [2]));
  FDCE \res_seq_reg[tailptr_gray][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSHEADPTR0_n_1),
        .Q(\res_seq_reg[tailptr_gray] [0]));
  FDCE \res_seq_reg[tailptr_gray][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSHEADPTR0_n_0),
        .Q(\res_seq_reg[tailptr_gray] [1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \resrx_seq[bufwrite]_i_1 
       (.I0(\resrx_seq_reg[bufwrite_n_0_] ),
        .O(\resrx_com[bufwrite] ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \resrx_seq[headptr][0]_i_1 
       (.I0(\resrx_seq_reg[headptr] [0]),
        .I1(\resrx_seq_reg[bufwrite_n_0_] ),
        .O(\vresrx[headptr] [0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \resrx_seq[headptr][1]_i_1 
       (.I0(\resrx_seq_reg[headptr] [0]),
        .I1(\resrx_seq_reg[bufwrite_n_0_] ),
        .I2(\resrx_seq_reg[headptr] [1]),
        .O(\vresrx[headptr] [1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \resrx_seq[headptr][2]_i_1 
       (.I0(\resrx_seq_reg[bufwrite_n_0_] ),
        .I1(\resrx_seq_reg[headptr] [0]),
        .I2(\resrx_seq_reg[headptr] [1]),
        .I3(\resrx_seq_reg[headptr] [2]),
        .O(p_10_in));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h56)) 
    \resrx_seq[headptr_gray][0]_i_1 
       (.I0(\resrx_seq_reg[headptr] [1]),
        .I1(\resrx_seq_reg[bufwrite_n_0_] ),
        .I2(\resrx_seq_reg[headptr] [0]),
        .O(BinToGray[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h5666)) 
    \resrx_seq[headptr_gray][1]_i_1 
       (.I0(\resrx_seq_reg[headptr] [2]),
        .I1(\resrx_seq_reg[headptr] [1]),
        .I2(\resrx_seq_reg[bufwrite_n_0_] ),
        .I3(\resrx_seq_reg[headptr] [0]),
        .O(BinToGray[1]));
  FDCE \resrx_seq_reg[bufdata][0] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\resrx_com[bufdata] [0]),
        .Q(\resrx_seq_reg[bufdata_n_0_][0] ));
  FDCE \resrx_seq_reg[bufdata][1] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\resrx_com[bufdata] [1]),
        .Q(\resrx_seq_reg[bufdata_n_0_][1] ));
  FDCE \resrx_seq_reg[bufdata][2] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\resrx_com[bufdata] [2]),
        .Q(\resrx_com[bufdata] [0]));
  FDCE \resrx_seq_reg[bufdata][3] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\resrx_com[bufdata] [3]),
        .Q(\resrx_com[bufdata] [1]));
  FDCE \resrx_seq_reg[bufwrite] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\resrx_com[bufwrite] ),
        .Q(\resrx_seq_reg[bufwrite_n_0_] ));
  FDCE \resrx_seq_reg[headptr][0] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\vresrx[headptr] [0]),
        .Q(\resrx_seq_reg[headptr] [0]));
  FDCE \resrx_seq_reg[headptr][1] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(\vresrx[headptr] [1]),
        .Q(\resrx_seq_reg[headptr] [1]));
  FDCE \resrx_seq_reg[headptr][2] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(p_10_in),
        .Q(\resrx_seq_reg[headptr] [2]));
  FDCE \resrx_seq_reg[headptr_gray][0] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(BinToGray[0]),
        .Q(\resrx_seq_reg[headptr_gray_n_0_][0] ));
  FDCE \resrx_seq_reg[headptr_gray][1] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(BinToGray[1]),
        .Q(DI));
  LUT4 #(
    .INIT(16'hEB28)) 
    rxcnt_ddr
       (.I0(rxcnt_f_reg[3]),
        .I1(SPW_Sin),
        .I2(SPW_Din),
        .I3(\rxcnt_r_reg_n_0_[3] ),
        .O(p_0_in2_in));
  LUT1 #(
    .INIT(2'h1)) 
    \rxcnt_f[1]_i_1 
       (.I0(rxcnt_f_reg[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rxcnt_f[2]_i_1 
       (.I0(rxcnt_f_reg[1]),
        .I1(rxcnt_f_reg[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rxcnt_f[3]_i_1 
       (.I0(rxcnt_f_reg[1]),
        .I1(rxcnt_f_reg[2]),
        .I2(rxcnt_f_reg[3]),
        .O(plusOp__0[3]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \rxcnt_f_reg[1] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp__0[1]),
        .Q(rxcnt_f_reg[1]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \rxcnt_f_reg[2] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp__0[2]),
        .Q(rxcnt_f_reg[2]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \rxcnt_f_reg[3] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp__0[3]),
        .Q(rxcnt_f_reg[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \rxcnt_r[1]_i_1 
       (.I0(A),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rxcnt_r[2]_i_1 
       (.I0(A),
        .I1(\rxcnt_r_reg_n_0_[2] ),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rxcnt_r[3]_i_1 
       (.I0(A),
        .I1(\rxcnt_r_reg_n_0_[2] ),
        .I2(\rxcnt_r_reg_n_0_[3] ),
        .O(plusOp[3]));
  FDCE \rxcnt_r_reg[1] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp[1]),
        .Q(A));
  FDCE \rxcnt_r_reg[2] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp[2]),
        .Q(\rxcnt_r_reg_n_0_[2] ));
  FDCE \rxcnt_r_reg[3] 
       (.C(rxclk),
        .CE(1'b1),
        .CLR(RXRSTLOGIC_n_0),
        .D(plusOp[3]),
        .Q(\rxcnt_r_reg_n_0_[3] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset
   (\reset_reg_reg[0]_0 ,
    SPW_rst_0,
    SPW_rst,
    SPW_TX_clk);
  output \reset_reg_reg[0]_0 ;
  output SPW_rst_0;
  input SPW_rst;
  input SPW_TX_clk;

  wire SPW_TX_clk;
  wire SPW_rst;
  wire SPW_rst_0;
  wire \reset_reg_reg[0]_0 ;
  wire \reset_reg_reg_n_0_[1] ;
  wire \reset_reg_reg_n_0_[2] ;
  wire \reset_reg_reg_n_0_[3] ;
  wire tx_rst_n;

  LUT1 #(
    .INIT(2'h1)) 
    \reset_reg[3]_i_1__0 
       (.I0(SPW_rst),
        .O(SPW_rst_0));
  FDCE \reset_reg_reg[0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(SPW_rst_0),
        .D(\reset_reg_reg_n_0_[1] ),
        .Q(tx_rst_n));
  FDCE \reset_reg_reg[1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(SPW_rst_0),
        .D(\reset_reg_reg_n_0_[2] ),
        .Q(\reset_reg_reg_n_0_[1] ));
  FDCE \reset_reg_reg[2] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(SPW_rst_0),
        .D(\reset_reg_reg_n_0_[3] ),
        .Q(\reset_reg_reg_n_0_[2] ));
  FDCE \reset_reg_reg[3] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(SPW_rst_0),
        .D(1'b1),
        .Q(\reset_reg_reg_n_0_[3] ));
  LUT1 #(
    .INIT(2'h1)) 
    s_spwdo_i_1
       (.I0(tx_rst_n),
        .O(\reset_reg_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "SpwReset" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5
   (\reset_reg_reg[0]_0 ,
    CLK,
    load);
  output \reset_reg_reg[0]_0 ;
  input CLK;
  input load;

  wire CLK;
  wire load;
  wire [2:0]p_0_in__0;
  wire \reset_reg_reg[0]_0 ;
  wire \reset_reg_reg_n_0_[0] ;

  FDCE \reset_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(load),
        .D(p_0_in__0[0]),
        .Q(\reset_reg_reg_n_0_[0] ));
  FDCE \reset_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(load),
        .D(p_0_in__0[1]),
        .Q(p_0_in__0[0]));
  FDCE \reset_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(load),
        .D(p_0_in__0[2]),
        .Q(p_0_in__0[1]));
  FDCE \reset_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(load),
        .D(1'b1),
        .Q(p_0_in__0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \resrx_seq[bufwrite]_i_2 
       (.I0(\reset_reg_reg_n_0_[0] ),
        .O(\reset_reg_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "SpwReset" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2
   (sys_rst_n,
    \reset_reg_reg[0]_0 ,
    SPW_main_clk,
    \reset_reg_reg[0]_1 );
  output sys_rst_n;
  output \reset_reg_reg[0]_0 ;
  input SPW_main_clk;
  input \reset_reg_reg[0]_1 ;

  wire SPW_main_clk;
  wire \reset_reg_reg[0]_0 ;
  wire \reset_reg_reg[0]_1 ;
  wire sys_rst_n;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state_seq[state][5]_i_2 
       (.I0(sys_rst_n),
        .O(\reset_reg_reg[0]_0 ));
  FDCE \reset_reg_reg[0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(\reset_reg_reg[0]_1 ),
        .D(1'b1),
        .Q(sys_rst_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream
   (SPW_Dout,
    SPW_Sout,
    RDATA,
    \res_seq_reg[txfull]__0 ,
    RXVALID,
    sel,
    \res_seq_reg[rxfifo_rvalid]_0 ,
    \res_seq_reg[rxfifo_rvalid]_1 ,
    E,
    out_fifo0,
    axi_streamout_tlast,
    SPW_main_clk,
    SPW_TX_clk,
    SPW_Din,
    WDATA,
    WEN10_out,
    SPW_Sin,
    axi_streamout_tready,
    \escape_fifo_reg[0] ,
    axi_streamout_aresetn,
    \res_seq_reg[txdiscard]_0 ,
    SPW_TXWRITE,
    SPW_RXREAD,
    SPW_rst);
  output SPW_Dout;
  output SPW_Sout;
  output [8:0]RDATA;
  output \res_seq_reg[txfull]__0 ;
  output RXVALID;
  output sel;
  output \res_seq_reg[rxfifo_rvalid]_0 ;
  output \res_seq_reg[rxfifo_rvalid]_1 ;
  output [0:0]E;
  output out_fifo0;
  output axi_streamout_tlast;
  input SPW_main_clk;
  input SPW_TX_clk;
  input SPW_Din;
  input [8:0]WDATA;
  input WEN10_out;
  input SPW_Sin;
  input axi_streamout_tready;
  input \escape_fifo_reg[0] ;
  input axi_streamout_aresetn;
  input \res_seq_reg[txdiscard]_0 ;
  input SPW_TXWRITE;
  input SPW_RXREAD;
  input SPW_rst;

  wire [0:0]E;
  wire LINK_INST_n_31;
  wire LINK_INST_n_4;
  wire LINK_INST_n_5;
  wire LINK_INST_n_7;
  wire LINK_INST_n_8;
  wire [15:0]RADDR;
  wire [8:0]RDATA;
  wire RECVFRONT_INST_n_10;
  wire RECVFRONT_INST_n_13;
  wire RECVFRONT_INST_n_14;
  wire RECVFRONT_INST_n_15;
  wire RECVFRONT_INST_n_16;
  wire RECVFRONT_INST_n_5;
  wire RECV_INST_n_10;
  wire RECV_INST_n_11;
  wire RECV_INST_n_12;
  wire RECV_INST_n_13;
  wire RECV_INST_n_14;
  wire RECV_INST_n_16;
  wire RECV_INST_n_17;
  wire RECV_INST_n_18;
  wire RECV_INST_n_19;
  wire RECV_INST_n_20;
  wire RECV_INST_n_21;
  wire RECV_INST_n_4;
  wire RECV_INST_n_5;
  wire RECV_INST_n_6;
  wire RECV_INST_n_7;
  wire RXVALID;
  wire SPW_Din;
  wire SPW_Dout;
  wire SPW_RXREAD;
  wire SPW_Sin;
  wire SPW_Sout;
  wire SPW_TXWRITE;
  wire SPW_TX_clk;
  wire SPW_main_clk;
  wire SPW_rst;
  wire SYSRSTLOGIC_n_1;
  wire TXRSTLOGIC_n_0;
  wire TXRSTLOGIC_n_1;
  wire [15:0]WADDR;
  wire [8:0]WDATA;
  wire [8:0]WDATA_0;
  wire WEN;
  wire WEN10_out;
  wire XMIT_FAST_INST_n_5;
  wire XMIT_FAST_INST_n_6;
  wire axi_streamout_aresetn;
  wire axi_streamout_tlast;
  wire axi_streamout_tready;
  wire \escape_fifo_reg[0] ;
  wire \i_/i_/i___30_carry__0_n_0 ;
  wire \i_/i_/i___30_carry__0_n_1 ;
  wire \i_/i_/i___30_carry__0_n_2 ;
  wire \i_/i_/i___30_carry__0_n_3 ;
  wire \i_/i_/i___30_carry__0_n_4 ;
  wire \i_/i_/i___30_carry__0_n_5 ;
  wire \i_/i_/i___30_carry__0_n_6 ;
  wire \i_/i_/i___30_carry__0_n_7 ;
  wire \i_/i_/i___30_carry__1_n_0 ;
  wire \i_/i_/i___30_carry__1_n_1 ;
  wire \i_/i_/i___30_carry__1_n_2 ;
  wire \i_/i_/i___30_carry__1_n_3 ;
  wire \i_/i_/i___30_carry__1_n_4 ;
  wire \i_/i_/i___30_carry__1_n_5 ;
  wire \i_/i_/i___30_carry__1_n_6 ;
  wire \i_/i_/i___30_carry__1_n_7 ;
  wire \i_/i_/i___30_carry__2_n_1 ;
  wire \i_/i_/i___30_carry__2_n_2 ;
  wire \i_/i_/i___30_carry__2_n_3 ;
  wire \i_/i_/i___30_carry__2_n_4 ;
  wire \i_/i_/i___30_carry__2_n_5 ;
  wire \i_/i_/i___30_carry__2_n_6 ;
  wire \i_/i_/i___30_carry__2_n_7 ;
  wire \i_/i_/i___30_carry_n_0 ;
  wire \i_/i_/i___30_carry_n_1 ;
  wire \i_/i_/i___30_carry_n_2 ;
  wire \i_/i_/i___30_carry_n_3 ;
  wire \i_/i_/i___30_carry_n_4 ;
  wire \i_/i_/i___30_carry_n_5 ;
  wire \i_/i_/i___30_carry_n_6 ;
  wire \i_/i_/i___30_carry_n_7 ;
  wire \i_/i_/i___61_carry__0_n_0 ;
  wire \i_/i_/i___61_carry__0_n_1 ;
  wire \i_/i_/i___61_carry__0_n_2 ;
  wire \i_/i_/i___61_carry__0_n_3 ;
  wire \i_/i_/i___61_carry__0_n_4 ;
  wire \i_/i_/i___61_carry__0_n_5 ;
  wire \i_/i_/i___61_carry__0_n_6 ;
  wire \i_/i_/i___61_carry__0_n_7 ;
  wire \i_/i_/i___61_carry__1_n_0 ;
  wire \i_/i_/i___61_carry__1_n_1 ;
  wire \i_/i_/i___61_carry__1_n_2 ;
  wire \i_/i_/i___61_carry__1_n_3 ;
  wire \i_/i_/i___61_carry__1_n_4 ;
  wire \i_/i_/i___61_carry__1_n_5 ;
  wire \i_/i_/i___61_carry__1_n_6 ;
  wire \i_/i_/i___61_carry__1_n_7 ;
  wire \i_/i_/i___61_carry__2_n_1 ;
  wire \i_/i_/i___61_carry__2_n_2 ;
  wire \i_/i_/i___61_carry__2_n_3 ;
  wire \i_/i_/i___61_carry__2_n_4 ;
  wire \i_/i_/i___61_carry__2_n_5 ;
  wire \i_/i_/i___61_carry__2_n_6 ;
  wire \i_/i_/i___61_carry__2_n_7 ;
  wire \i_/i_/i___61_carry_n_0 ;
  wire \i_/i_/i___61_carry_n_1 ;
  wire \i_/i_/i___61_carry_n_2 ;
  wire \i_/i_/i___61_carry_n_3 ;
  wire \i_/i_/i___61_carry_n_4 ;
  wire \i_/i_/i___61_carry_n_5 ;
  wire \i_/i_/i___61_carry_n_6 ;
  wire \i_/i_/i___61_carry_n_7 ;
  wire \i_/i_/i__carry__0_n_0 ;
  wire \i_/i_/i__carry__0_n_1 ;
  wire \i_/i_/i__carry__0_n_2 ;
  wire \i_/i_/i__carry__0_n_3 ;
  wire \i_/i_/i__carry__0_n_4 ;
  wire \i_/i_/i__carry__0_n_5 ;
  wire \i_/i_/i__carry__0_n_6 ;
  wire \i_/i_/i__carry__0_n_7 ;
  wire \i_/i_/i__carry__1_n_0 ;
  wire \i_/i_/i__carry__1_n_1 ;
  wire \i_/i_/i__carry__1_n_2 ;
  wire \i_/i_/i__carry__1_n_3 ;
  wire \i_/i_/i__carry__1_n_4 ;
  wire \i_/i_/i__carry__1_n_5 ;
  wire \i_/i_/i__carry__1_n_6 ;
  wire \i_/i_/i__carry__1_n_7 ;
  wire \i_/i_/i__carry__2_n_1 ;
  wire \i_/i_/i__carry__2_n_2 ;
  wire \i_/i_/i__carry__2_n_3 ;
  wire \i_/i_/i__carry__2_n_4 ;
  wire \i_/i_/i__carry__2_n_5 ;
  wire \i_/i_/i__carry__2_n_6 ;
  wire \i_/i_/i__carry__2_n_7 ;
  wire \i_/i_/i__carry_n_0 ;
  wire \i_/i_/i__carry_n_1 ;
  wire \i_/i_/i__carry_n_2 ;
  wire \i_/i_/i__carry_n_3 ;
  wire \i_/i_/i__carry_n_4 ;
  wire \i_/i_/i__carry_n_5 ;
  wire \i_/i_/i__carry_n_6 ;
  wire \i_/i_/i__carry_n_7 ;
  wire i___30_carry_i_1_n_0;
  wire i___61_carry_i_1_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire load;
  wire minusOp_carry__0_i_1_n_0;
  wire minusOp_carry__0_i_2_n_0;
  wire minusOp_carry__0_i_3_n_0;
  wire minusOp_carry__0_i_4_n_0;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_4;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry__1_i_1_n_0;
  wire minusOp_carry__1_i_2_n_0;
  wire minusOp_carry__1_i_3_n_0;
  wire minusOp_carry__1_i_4_n_0;
  wire minusOp_carry__1_n_0;
  wire minusOp_carry__1_n_1;
  wire minusOp_carry__1_n_2;
  wire minusOp_carry__1_n_3;
  wire minusOp_carry__1_n_4;
  wire minusOp_carry__1_n_5;
  wire minusOp_carry__1_n_6;
  wire minusOp_carry__1_n_7;
  wire minusOp_carry__2_i_1_n_0;
  wire minusOp_carry__2_i_2_n_0;
  wire minusOp_carry__2_i_3_n_0;
  wire minusOp_carry__2_i_4_n_0;
  wire minusOp_carry__2_n_0;
  wire minusOp_carry__2_n_1;
  wire minusOp_carry__2_n_2;
  wire minusOp_carry__2_n_3;
  wire minusOp_carry__2_n_4;
  wire minusOp_carry__2_n_5;
  wire minusOp_carry__2_n_6;
  wire minusOp_carry__2_n_7;
  wire minusOp_carry__3_i_1_n_0;
  wire minusOp_carry__3_n_7;
  wire minusOp_carry_i_1_n_0;
  wire minusOp_carry_i_2_n_0;
  wire minusOp_carry_i_3_n_0;
  wire minusOp_carry_i_4_n_0;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire \minusOp_inferred__0/i__carry__0_n_0 ;
  wire \minusOp_inferred__0/i__carry__0_n_1 ;
  wire \minusOp_inferred__0/i__carry__0_n_2 ;
  wire \minusOp_inferred__0/i__carry__0_n_3 ;
  wire \minusOp_inferred__0/i__carry__1_n_0 ;
  wire \minusOp_inferred__0/i__carry__1_n_1 ;
  wire \minusOp_inferred__0/i__carry__1_n_2 ;
  wire \minusOp_inferred__0/i__carry__1_n_3 ;
  wire \minusOp_inferred__0/i__carry__2_n_0 ;
  wire \minusOp_inferred__0/i__carry__2_n_1 ;
  wire \minusOp_inferred__0/i__carry__2_n_2 ;
  wire \minusOp_inferred__0/i__carry__2_n_3 ;
  wire \minusOp_inferred__0/i__carry_n_0 ;
  wire \minusOp_inferred__0/i__carry_n_1 ;
  wire \minusOp_inferred__0/i__carry_n_2 ;
  wire \minusOp_inferred__0/i__carry_n_3 ;
  wire out_fifo0;
  wire p_0_in10_in;
  wire [0:0]p_7_in;
  wire recv_inact;
  wire [3:0]recv_inbits;
  wire recv_inbvalid;
  wire recv_rxen;
  wire \recvo[gotfct] ;
  wire \recvo[gotnull] ;
  wire \recvo[rxchar] ;
  wire [3:1]\res_com[bitcntp_gray] ;
  wire [0:0]\res_com[disccnt] ;
  wire \res_com[rxemptydiscard] ;
  wire \res_com[rxfifo_rvalid] ;
  wire \res_com[rxfull] ;
  wire [5:0]\res_com[rxroom] ;
  wire \res_com[txfifo_rvalid] ;
  wire \res_com[txfull] ;
  wire \res_seq[rxfifo_raddr][3]_i_2_n_0 ;
  wire \res_seq[rxfiforoom][0]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][10]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][11]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][14]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][2]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][3]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][3]_i_3_n_0 ;
  wire \res_seq[rxfiforoom][4]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][5]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][6]_i_1_n_0 ;
  wire \res_seq[rxfiforoom][7]_i_1_n_0 ;
  wire \res_seq[rxfull]_i_2_n_0 ;
  wire \res_seq[rxfull]_i_3_n_0 ;
  wire \res_seq[rxfull]_i_4_n_0 ;
  wire \res_seq[rxfull]_i_5_n_0 ;
  wire \res_seq[txfiforoom][3]_i_3_n_0 ;
  wire \res_seq_reg[allow_fct]__0 ;
  wire \res_seq_reg[bit_seen]0 ;
  wire [0:0]\res_seq_reg[disccnt] ;
  wire \res_seq_reg[escaped]__0 ;
  wire \res_seq_reg[pend_fct]__0 ;
  wire \res_seq_reg[rxeep]__0 ;
  wire \res_seq_reg[rxemptydiscard_n_0_] ;
  wire [15:0]\res_seq_reg[rxfifo_raddr] ;
  wire \res_seq_reg[rxfifo_raddr][11]_i_1_n_0 ;
  wire \res_seq_reg[rxfifo_raddr][11]_i_1_n_1 ;
  wire \res_seq_reg[rxfifo_raddr][11]_i_1_n_2 ;
  wire \res_seq_reg[rxfifo_raddr][11]_i_1_n_3 ;
  wire \res_seq_reg[rxfifo_raddr][15]_i_1_n_1 ;
  wire \res_seq_reg[rxfifo_raddr][15]_i_1_n_2 ;
  wire \res_seq_reg[rxfifo_raddr][15]_i_1_n_3 ;
  wire \res_seq_reg[rxfifo_raddr][3]_i_1_n_0 ;
  wire \res_seq_reg[rxfifo_raddr][3]_i_1_n_1 ;
  wire \res_seq_reg[rxfifo_raddr][3]_i_1_n_2 ;
  wire \res_seq_reg[rxfifo_raddr][3]_i_1_n_3 ;
  wire \res_seq_reg[rxfifo_raddr][7]_i_1_n_0 ;
  wire \res_seq_reg[rxfifo_raddr][7]_i_1_n_1 ;
  wire \res_seq_reg[rxfifo_raddr][7]_i_1_n_2 ;
  wire \res_seq_reg[rxfifo_raddr][7]_i_1_n_3 ;
  wire \res_seq_reg[rxfifo_rvalid]1 ;
  wire \res_seq_reg[rxfifo_rvalid]_0 ;
  wire \res_seq_reg[rxfifo_rvalid]_1 ;
  wire \res_seq_reg[rxfiforoom][11]_i_2_n_0 ;
  wire \res_seq_reg[rxfiforoom][11]_i_2_n_1 ;
  wire \res_seq_reg[rxfiforoom][11]_i_2_n_2 ;
  wire \res_seq_reg[rxfiforoom][11]_i_2_n_3 ;
  wire \res_seq_reg[rxfiforoom][15]_i_2_n_0 ;
  wire \res_seq_reg[rxfiforoom][15]_i_2_n_1 ;
  wire \res_seq_reg[rxfiforoom][15]_i_2_n_2 ;
  wire \res_seq_reg[rxfiforoom][15]_i_2_n_3 ;
  wire \res_seq_reg[rxfiforoom][3]_i_2_n_0 ;
  wire \res_seq_reg[rxfiforoom][3]_i_2_n_1 ;
  wire \res_seq_reg[rxfiforoom][3]_i_2_n_2 ;
  wire \res_seq_reg[rxfiforoom][3]_i_2_n_3 ;
  wire \res_seq_reg[rxfiforoom][7]_i_2_n_0 ;
  wire \res_seq_reg[rxfiforoom][7]_i_2_n_1 ;
  wire \res_seq_reg[rxfiforoom][7]_i_2_n_2 ;
  wire \res_seq_reg[rxfiforoom][7]_i_2_n_3 ;
  wire \res_seq_reg[rxfiforoom_n_0_][0] ;
  wire \res_seq_reg[rxfiforoom_n_0_][10] ;
  wire \res_seq_reg[rxfiforoom_n_0_][11] ;
  wire \res_seq_reg[rxfiforoom_n_0_][12] ;
  wire \res_seq_reg[rxfiforoom_n_0_][13] ;
  wire \res_seq_reg[rxfiforoom_n_0_][14] ;
  wire \res_seq_reg[rxfiforoom_n_0_][15] ;
  wire \res_seq_reg[rxfiforoom_n_0_][16] ;
  wire \res_seq_reg[rxfiforoom_n_0_][1] ;
  wire \res_seq_reg[rxfiforoom_n_0_][2] ;
  wire \res_seq_reg[rxfiforoom_n_0_][3] ;
  wire \res_seq_reg[rxfiforoom_n_0_][4] ;
  wire \res_seq_reg[rxfiforoom_n_0_][5] ;
  wire \res_seq_reg[rxfiforoom_n_0_][6] ;
  wire \res_seq_reg[rxfiforoom_n_0_][7] ;
  wire \res_seq_reg[rxfiforoom_n_0_][8] ;
  wire \res_seq_reg[rxfiforoom_n_0_][9] ;
  wire \res_seq_reg[rxfull]__0 ;
  wire \res_seq_reg[rxpacket_n_0_] ;
  wire \res_seq_reg[rxroom_n_0_][0] ;
  wire \res_seq_reg[rxroom_n_0_][1] ;
  wire \res_seq_reg[rxroom_n_0_][2] ;
  wire \res_seq_reg[rxroom_n_0_][3] ;
  wire \res_seq_reg[rxroom_n_0_][4] ;
  wire \res_seq_reg[rxroom_n_0_][5] ;
  wire \res_seq_reg[sent_fct]__0 ;
  wire \res_seq_reg[txdiscard]_0 ;
  wire \res_seq_reg[txdiscard]__0 ;
  wire [15:0]\res_seq_reg[txfifo_raddr] ;
  wire \res_seq_reg[txfifo_rvalid]__0 ;
  wire [15:0]\res_seq_reg[txfifo_waddr] ;
  wire \res_seq_reg[txfiforoom][11]_i_2_n_0 ;
  wire \res_seq_reg[txfiforoom][11]_i_2_n_1 ;
  wire \res_seq_reg[txfiforoom][11]_i_2_n_2 ;
  wire \res_seq_reg[txfiforoom][11]_i_2_n_3 ;
  wire \res_seq_reg[txfiforoom][15]_i_2_n_0 ;
  wire \res_seq_reg[txfiforoom][15]_i_2_n_1 ;
  wire \res_seq_reg[txfiforoom][15]_i_2_n_2 ;
  wire \res_seq_reg[txfiforoom][15]_i_2_n_3 ;
  wire \res_seq_reg[txfiforoom][3]_i_2_n_0 ;
  wire \res_seq_reg[txfiforoom][3]_i_2_n_1 ;
  wire \res_seq_reg[txfiforoom][3]_i_2_n_2 ;
  wire \res_seq_reg[txfiforoom][3]_i_2_n_3 ;
  wire \res_seq_reg[txfiforoom][7]_i_2_n_0 ;
  wire \res_seq_reg[txfiforoom][7]_i_2_n_1 ;
  wire \res_seq_reg[txfiforoom][7]_i_2_n_2 ;
  wire \res_seq_reg[txfiforoom][7]_i_2_n_3 ;
  wire \res_seq_reg[txfiforoom_n_0_][0] ;
  wire \res_seq_reg[txfiforoom_n_0_][10] ;
  wire \res_seq_reg[txfiforoom_n_0_][11] ;
  wire \res_seq_reg[txfiforoom_n_0_][12] ;
  wire \res_seq_reg[txfiforoom_n_0_][13] ;
  wire \res_seq_reg[txfiforoom_n_0_][14] ;
  wire \res_seq_reg[txfiforoom_n_0_][15] ;
  wire \res_seq_reg[txfiforoom_n_0_][16] ;
  wire \res_seq_reg[txfiforoom_n_0_][1] ;
  wire \res_seq_reg[txfiforoom_n_0_][2] ;
  wire \res_seq_reg[txfiforoom_n_0_][3] ;
  wire \res_seq_reg[txfiforoom_n_0_][4] ;
  wire \res_seq_reg[txfiforoom_n_0_][5] ;
  wire \res_seq_reg[txfiforoom_n_0_][6] ;
  wire \res_seq_reg[txfiforoom_n_0_][7] ;
  wire \res_seq_reg[txfiforoom_n_0_][8] ;
  wire \res_seq_reg[txfiforoom_n_0_][9] ;
  wire \res_seq_reg[txfull]__0 ;
  wire \res_seq_reg[txpacket_n_0_] ;
  wire [8:0]s_txfifo_rdata;
  wire sel;
  wire \state_seq_reg[timerdone]__0 ;
  wire [3:1]\syncsys[rxcnt_ddr_gray] ;
  wire sys_rst_n;
  wire \v[allow_char] ;
  wire \v[pend_char] ;
  wire \vres[inbvalid]0_out ;
  wire \vres[rxchar]9_out ;
  wire \vres[rxeep]3_out ;
  wire [15:0]\vres[rxfifo_raddr] ;
  wire [16:0]\vres[rxfiforoom] ;
  wire [16:0]\vres[rxfiforoom]0_in ;
  wire \vres[rxflag]6_out ;
  wire \vres[rxpacket]7_out ;
  wire \vres[txdiscard] ;
  wire [16:0]\vres[txfiforoom] ;
  wire [16:0]\vres[txfiforoom]0_in ;
  wire \vres[txpacket]5_out ;
  wire \xmiti[fct_in] ;
  wire [3:3]\NLW_i_/i_/i___30_carry__2_CO_UNCONNECTED ;
  wire [3:3]\NLW_i_/i_/i___61_carry__2_CO_UNCONNECTED ;
  wire [3:3]\NLW_i_/i_/i__carry__2_CO_UNCONNECTED ;
  wire [3:0]NLW_minusOp_carry__3_CO_UNCONNECTED;
  wire [3:1]NLW_minusOp_carry__3_O_UNCONNECTED;
  wire [3:0]\NLW_minusOp_inferred__0/i__carry__3_CO_UNCONNECTED ;
  wire [3:1]\NLW_minusOp_inferred__0/i__carry__3_O_UNCONNECTED ;
  wire [3:3]\NLW_res_seq_reg[rxfifo_raddr][15]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_res_seq_reg[rxfifo_rvalid]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_res_seq_reg[rxfifo_rvalid]_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_res_seq_reg[txfifo_rvalid]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_res_seq_reg[txfifo_rvalid]_i_2_O_UNCONNECTED ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink LINK_INST
       (.AR(\res_seq_reg[bit_seen]0 ),
        .D(s_txfifo_rdata[8]),
        .DI(XMIT_FAST_INST_n_6),
        .\FSM_onehot_state_seq_reg[state][0]_0 (RECV_INST_n_4),
        .\FSM_onehot_state_seq_reg[state][1]_0 (LINK_INST_n_7),
        .\FSM_onehot_state_seq_reg[state][2]_0 (RECV_INST_n_11),
        .\FSM_onehot_state_seq_reg[state][3]_0 (LINK_INST_n_4),
        .\FSM_onehot_state_seq_reg[state][3]_1 ({LINK_INST_n_5,p_0_in10_in}),
        .\FSM_onehot_state_seq_reg[state][4]_0 (RECV_INST_n_6),
        .O(minusOp_carry__3_n_7),
        .Q({\res_seq_reg[rxroom_n_0_][5] ,\res_seq_reg[rxroom_n_0_][4] ,\res_seq_reg[rxroom_n_0_][3] ,\res_seq_reg[rxroom_n_0_][2] ,\res_seq_reg[rxroom_n_0_][1] ,\res_seq_reg[rxroom_n_0_][0] }),
        .SPW_TXWRITE(SPW_TXWRITE),
        .SPW_main_clk(SPW_main_clk),
        .load(load),
        .recv_rxen(recv_rxen),
        .\recvo[gotfct] (\recvo[gotfct] ),
        .\recvo[gotnull] (\recvo[gotnull] ),
        .\recvo[rxchar] (\recvo[rxchar] ),
        .\res_com[txfifo_rvalid] (\res_com[txfifo_rvalid] ),
        .\res_com[txfull] (\res_com[txfull] ),
        .\res_seq_reg[allow_fct]__0 (\res_seq_reg[allow_fct]__0 ),
        .\res_seq_reg[inbvalid] (RECVFRONT_INST_n_10),
        .\res_seq_reg[pend_fct]__0 (\res_seq_reg[pend_fct]__0 ),
        .\res_seq_reg[rxeep] (\res_seq_reg[rxpacket_n_0_] ),
        .\res_seq_reg[rxeep]__0 (\res_seq_reg[rxeep]__0 ),
        .\res_seq_reg[rxfull]__0 (\res_seq_reg[rxfull]__0 ),
        .\res_seq_reg[sent_fct]__0 (\res_seq_reg[sent_fct]__0 ),
        .\res_seq_reg[txdiscard] (\res_seq_reg[txpacket_n_0_] ),
        .\res_seq_reg[txdiscard]_0 (\res_seq_reg[txdiscard]_0 ),
        .\res_seq_reg[txdiscard]__0 (\res_seq_reg[txdiscard]__0 ),
        .\res_seq_reg[txfifo_raddr][15] (XMIT_FAST_INST_n_5),
        .\res_seq_reg[txfifo_rvalid] (sel),
        .\res_seq_reg[txfifo_rvalid]_0 ({\res_seq_reg[txfiforoom_n_0_][16] ,\res_seq_reg[txfiforoom_n_0_][15] ,\res_seq_reg[txfiforoom_n_0_][14] ,\res_seq_reg[txfiforoom_n_0_][13] ,\res_seq_reg[txfiforoom_n_0_][12] ,\res_seq_reg[txfiforoom_n_0_][11] ,\res_seq_reg[txfiforoom_n_0_][10] ,\res_seq_reg[txfiforoom_n_0_][9] ,\res_seq_reg[txfiforoom_n_0_][8] ,\res_seq_reg[txfiforoom_n_0_][7] ,\res_seq_reg[txfiforoom_n_0_][6] ,\res_seq_reg[txfiforoom_n_0_][5] ,\res_seq_reg[txfiforoom_n_0_][4] ,\res_seq_reg[txfiforoom_n_0_][3] ,\res_seq_reg[txfiforoom_n_0_][2] ,\res_seq_reg[txfiforoom_n_0_][1] ,\res_seq_reg[txfiforoom_n_0_][0] }),
        .\res_seq_reg[txfifo_rvalid]__0 (\res_seq_reg[txfifo_rvalid]__0 ),
        .\res_seq_reg[txfiforoom][11] ({minusOp_carry__1_n_4,minusOp_carry__1_n_5,minusOp_carry__1_n_6,minusOp_carry__1_n_7}),
        .\res_seq_reg[txfiforoom][15] ({minusOp_carry__2_n_4,minusOp_carry__2_n_5,minusOp_carry__2_n_6,minusOp_carry__2_n_7}),
        .\res_seq_reg[txfiforoom][16] (\vres[txfiforoom] ),
        .\res_seq_reg[txfiforoom][3] ({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .\res_seq_reg[txfiforoom][7] ({minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .\state_seq_reg[rx_null_fct]_0 (RECV_INST_n_5),
        .\state_seq_reg[rxen]_0 (\res_com[bitcntp_gray] ),
        .\state_seq_reg[rxen]_1 (SYSRSTLOGIC_n_1),
        .\state_seq_reg[timercnt][0]_0 (RECV_INST_n_7),
        .\state_seq_reg[timercnt][7]_0 (LINK_INST_n_8),
        .\state_seq_reg[timerdone]__0 (\state_seq_reg[timerdone]__0 ),
        .\state_seq_reg[tx_credit][3]_0 (LINK_INST_n_31),
        .\syncsys[rxcnt_ddr_gray] (\syncsys[rxcnt_ddr_gray] ),
        .sys_rst_n(sys_rst_n),
        .\v[allow_char] (\v[allow_char] ),
        .\v[pend_char] (\v[pend_char] ),
        .\vres[inbvalid]0_out (\vres[inbvalid]0_out ),
        .\vres[rxeep]3_out (\vres[rxeep]3_out ),
        .\vres[txdiscard] (\vres[txdiscard] ),
        .\vres[txfiforoom]0_in (\vres[txfiforoom]0_in ),
        .\vres[txpacket]5_out (\vres[txpacket]5_out ),
        .\xmiti[fct_in] (\xmiti[fct_in] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront RECVFRONT_INST
       (.D(\res_com[disccnt] ),
        .E(\vres[rxflag]6_out ),
        .Q(recv_inbits),
        .SPW_Din(SPW_Din),
        .SPW_Sin(SPW_Sin),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg(SYSRSTLOGIC_n_1),
        .load(load),
        .recv_inact(recv_inact),
        .recv_inbvalid(recv_inbvalid),
        .recv_rxen(recv_rxen),
        .\res_seq[erresc]_i_2 (p_7_in),
        .\res_seq_reg[bitcnt][8] (RECV_INST_n_10),
        .\res_seq_reg[bitcntp_gray][3]_0 (\res_com[bitcntp_gray] ),
        .\res_seq_reg[bufdout][0]_0 (RECVFRONT_INST_n_15),
        .\res_seq_reg[bufdout][0]_1 (RECVFRONT_INST_n_16),
        .\res_seq_reg[bufdout][1]_0 (RECVFRONT_INST_n_13),
        .\res_seq_reg[bufdout][1]_1 (RECVFRONT_INST_n_14),
        .\res_seq_reg[bufdout][2]_0 (RECVFRONT_INST_n_5),
        .\res_seq_reg[datareg][7] (RECV_INST_n_14),
        .\res_seq_reg[datareg][7]_0 (RECV_INST_n_13),
        .\res_seq_reg[datareg][7]_1 (RECV_INST_n_12),
        .\res_seq_reg[disccnt][0] (\res_seq_reg[disccnt] ),
        .\res_seq_reg[escaped]__0 (\res_seq_reg[escaped]__0 ),
        .\res_seq_reg[tailptr_gray][0]_0 (RECVFRONT_INST_n_10),
        .syncdff_ff2_reg(\syncsys[rxcnt_ddr_gray] ),
        .\vres[inbvalid]0_out (\vres[inbvalid]0_out ),
        .\vres[rxchar]9_out (\vres[rxchar]9_out ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv RECV_INST
       (.AR(\res_seq_reg[bit_seen]0 ),
        .D({RECV_INST_n_16,RECV_INST_n_17,RECV_INST_n_18,RECV_INST_n_19,RECV_INST_n_20,RECV_INST_n_21}),
        .E(\vres[rxflag]6_out ),
        .\FSM_onehot_state_seq_reg[state][2] ({LINK_INST_n_5,p_0_in10_in}),
        .\FSM_onehot_state_seq_reg[state][2]_0 (LINK_INST_n_8),
        .\FSM_onehot_state_seq_reg[state][3] (RECV_INST_n_11),
        .Q(\res_seq_reg[disccnt] ),
        .SPW_RXREAD(SPW_RXREAD),
        .SPW_main_clk(SPW_main_clk),
        .WDATA(WDATA_0),
        .WEN(WEN),
        .recv_inact(recv_inact),
        .recv_inbvalid(recv_inbvalid),
        .\recvo[gotfct] (\recvo[gotfct] ),
        .\recvo[gotnull] (\recvo[gotnull] ),
        .\recvo[rxchar] (\recvo[rxchar] ),
        .\res_com[rxemptydiscard] (\res_com[rxemptydiscard] ),
        .\res_com[rxfifo_rvalid] (\res_com[rxfifo_rvalid] ),
        .\res_seq_reg[bitcnt][8]_0 (RECVFRONT_INST_n_5),
        .\res_seq_reg[bitshift][8]_0 (p_7_in),
        .\res_seq_reg[bitshift][8]_1 (RECV_INST_n_14),
        .\res_seq_reg[bitshift][8]_2 (recv_inbits),
        .\res_seq_reg[bufdout][2] (RECV_INST_n_12),
        .\res_seq_reg[bufdout][3] (RECV_INST_n_13),
        .\res_seq_reg[disccnt][0]_0 (\res_com[disccnt] ),
        .\res_seq_reg[disccnt][7]_0 (RECV_INST_n_7),
        .\res_seq_reg[erresc]_0 (RECVFRONT_INST_n_16),
        .\res_seq_reg[erresc]_1 (RECVFRONT_INST_n_15),
        .\res_seq_reg[escaped]_0 (RECVFRONT_INST_n_13),
        .\res_seq_reg[escaped]__0 (\res_seq_reg[escaped]__0 ),
        .\res_seq_reg[gotfct]_0 (RECV_INST_n_6),
        .\res_seq_reg[gotfct]_1 (RECVFRONT_INST_n_14),
        .\res_seq_reg[null_seen]_0 (RECV_INST_n_4),
        .\res_seq_reg[null_seen]_1 (RECV_INST_n_10),
        .\res_seq_reg[rxchar]_0 (RECV_INST_n_5),
        .\res_seq_reg[rxeep]__0 (\res_seq_reg[rxeep]__0 ),
        .\res_seq_reg[rxfifo_rvalid] ({\res_seq_reg[rxfiforoom_n_0_][16] ,\res_seq_reg[rxfiforoom_n_0_][15] ,\res_seq_reg[rxfiforoom_n_0_][13] ,\res_seq_reg[rxfiforoom_n_0_][12] ,\res_seq_reg[rxfiforoom_n_0_][9] ,\res_seq_reg[rxfiforoom_n_0_][8] ,\res_seq_reg[rxfiforoom_n_0_][1] }),
        .\res_seq_reg[rxfifo_waddr][15] (\res_seq_reg[rxemptydiscard_n_0_] ),
        .\res_seq_reg[rxfull]__0 (\res_seq_reg[rxfull]__0 ),
        .\res_seq_reg[rxpacket] (\res_seq_reg[rxpacket_n_0_] ),
        .\state_seq_reg[timerdone]__0 (\state_seq_reg[timerdone]__0 ),
        .\vres[rxchar]9_out (\vres[rxchar]9_out ),
        .\vres[rxfiforoom] ({\vres[rxfiforoom] [16:15],\vres[rxfiforoom] [13:12],\vres[rxfiforoom] [9:8],\vres[rxfiforoom] [1]}),
        .\vres[rxfiforoom]0_in ({\vres[rxfiforoom]0_in [16:15],\vres[rxfiforoom]0_in [13:12],\vres[rxfiforoom]0_in [9:8],\vres[rxfiforoom]0_in [1]}),
        .\vres[rxpacket]7_out (\vres[rxpacket]7_out ));
  (* ABITS = "16" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam RXMEM
       (.CLK(SPW_main_clk),
        .RADDR(RADDR),
        .RDATA(RDATA),
        .WADDR(WADDR),
        .WDATA(WDATA_0),
        .WEN(WEN));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_1
       (.I0(\vres[rxfifo_raddr] [15]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [15]),
        .O(RADDR[15]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_10
       (.I0(\vres[rxfifo_raddr] [6]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [6]),
        .O(RADDR[6]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_11
       (.I0(\vres[rxfifo_raddr] [5]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [5]),
        .O(RADDR[5]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_12
       (.I0(\vres[rxfifo_raddr] [4]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [4]),
        .O(RADDR[4]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_13
       (.I0(\vres[rxfifo_raddr] [3]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [3]),
        .O(RADDR[3]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_14
       (.I0(\vres[rxfifo_raddr] [2]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [2]),
        .O(RADDR[2]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_15
       (.I0(\vres[rxfifo_raddr] [1]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [1]),
        .O(RADDR[1]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_16
       (.I0(\vres[rxfifo_raddr] [0]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [0]),
        .O(RADDR[0]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_2
       (.I0(\vres[rxfifo_raddr] [14]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [14]),
        .O(RADDR[14]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_3
       (.I0(\vres[rxfifo_raddr] [13]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [13]),
        .O(RADDR[13]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_4
       (.I0(\vres[rxfifo_raddr] [12]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [12]),
        .O(RADDR[12]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_5
       (.I0(\vres[rxfifo_raddr] [11]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [11]),
        .O(RADDR[11]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_6
       (.I0(\vres[rxfifo_raddr] [10]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [10]),
        .O(RADDR[10]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_7
       (.I0(\vres[rxfifo_raddr] [9]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [9]),
        .O(RADDR[9]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_8
       (.I0(\vres[rxfifo_raddr] [8]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [8]),
        .O(RADDR[8]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    RXMEM_i_9
       (.I0(\vres[rxfifo_raddr] [7]),
        .I1(SPW_RXREAD),
        .I2(\res_seq_reg[rxfifo_raddr] [7]),
        .O(RADDR[7]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2 SYSRSTLOGIC
       (.SPW_main_clk(SPW_main_clk),
        .\reset_reg_reg[0]_0 (SYSRSTLOGIC_n_1),
        .\reset_reg_reg[0]_1 (TXRSTLOGIC_n_1),
        .sys_rst_n(sys_rst_n));
  (* ABITS = "16" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam TXMEM
       (.CLK(SPW_main_clk),
        .RADDR(\res_seq_reg[txfifo_raddr] ),
        .RDATA(s_txfifo_rdata),
        .WADDR(\res_seq_reg[txfifo_waddr] ),
        .WDATA(WDATA),
        .WEN(WEN10_out));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset TXRSTLOGIC
       (.SPW_TX_clk(SPW_TX_clk),
        .SPW_rst(SPW_rst),
        .SPW_rst_0(TXRSTLOGIC_n_1),
        .\reset_reg_reg[0]_0 (TXRSTLOGIC_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast XMIT_FAST_INST
       (.D(s_txfifo_rdata),
        .DI(XMIT_FAST_INST_n_6),
        .E(\v[pend_char] ),
        .SPW_Dout(SPW_Dout),
        .SPW_Sout(SPW_Sout),
        .SPW_TX_clk(SPW_TX_clk),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg(SYSRSTLOGIC_n_1),
        .buf_ff0_reg_0(TXRSTLOGIC_n_0),
        .\recvo[rxchar] (\recvo[rxchar] ),
        .\res_seq_reg[allow_char]_0 (XMIT_FAST_INST_n_5),
        .\res_seq_reg[allow_fct]_0 (LINK_INST_n_4),
        .\res_seq_reg[allow_fct]__0 (\res_seq_reg[allow_fct]__0 ),
        .\res_seq_reg[pend_char]_0 (LINK_INST_n_31),
        .\res_seq_reg[pend_fct]__0 (\res_seq_reg[pend_fct]__0 ),
        .\res_seq_reg[sent_fct]__0 (\res_seq_reg[sent_fct]__0 ),
        .\res_seq_reg[token1][char][7]_0 (LINK_INST_n_7),
        .\res_seq_reg[txdiscard]__0 (\res_seq_reg[txdiscard]__0 ),
        .\res_seq_reg[txdivreg][5]_0 (p_0_in10_in),
        .\res_seq_reg[txfifo_rvalid]__0 (\res_seq_reg[txfifo_rvalid]__0 ),
        .\v[allow_char] (\v[allow_char] ),
        .\xmiti[fct_in] (\xmiti[fct_in] ));
  LUT1 #(
    .INIT(2'h1)) 
    axi_streamout_tlast_INST_0
       (.I0(RXVALID),
        .O(axi_streamout_tlast));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \escape_fifo[7]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(\escape_fifo_reg[0] ),
        .O(E));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___30_carry 
       (.CI(1'b0),
        .CO({\i_/i_/i___30_carry_n_0 ,\i_/i_/i___30_carry_n_1 ,\i_/i_/i___30_carry_n_2 ,\i_/i_/i___30_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\i_/i_/i___30_carry_n_4 ,\i_/i_/i___30_carry_n_5 ,\i_/i_/i___30_carry_n_6 ,\i_/i_/i___30_carry_n_7 }),
        .S({\res_seq_reg[txfifo_waddr] [3:1],i___30_carry_i_1_n_0}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___30_carry__0 
       (.CI(\i_/i_/i___30_carry_n_0 ),
        .CO({\i_/i_/i___30_carry__0_n_0 ,\i_/i_/i___30_carry__0_n_1 ,\i_/i_/i___30_carry__0_n_2 ,\i_/i_/i___30_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___30_carry__0_n_4 ,\i_/i_/i___30_carry__0_n_5 ,\i_/i_/i___30_carry__0_n_6 ,\i_/i_/i___30_carry__0_n_7 }),
        .S(\res_seq_reg[txfifo_waddr] [7:4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___30_carry__1 
       (.CI(\i_/i_/i___30_carry__0_n_0 ),
        .CO({\i_/i_/i___30_carry__1_n_0 ,\i_/i_/i___30_carry__1_n_1 ,\i_/i_/i___30_carry__1_n_2 ,\i_/i_/i___30_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___30_carry__1_n_4 ,\i_/i_/i___30_carry__1_n_5 ,\i_/i_/i___30_carry__1_n_6 ,\i_/i_/i___30_carry__1_n_7 }),
        .S(\res_seq_reg[txfifo_waddr] [11:8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___30_carry__2 
       (.CI(\i_/i_/i___30_carry__1_n_0 ),
        .CO({\NLW_i_/i_/i___30_carry__2_CO_UNCONNECTED [3],\i_/i_/i___30_carry__2_n_1 ,\i_/i_/i___30_carry__2_n_2 ,\i_/i_/i___30_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___30_carry__2_n_4 ,\i_/i_/i___30_carry__2_n_5 ,\i_/i_/i___30_carry__2_n_6 ,\i_/i_/i___30_carry__2_n_7 }),
        .S(\res_seq_reg[txfifo_waddr] [15:12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___61_carry 
       (.CI(1'b0),
        .CO({\i_/i_/i___61_carry_n_0 ,\i_/i_/i___61_carry_n_1 ,\i_/i_/i___61_carry_n_2 ,\i_/i_/i___61_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\i_/i_/i___61_carry_n_4 ,\i_/i_/i___61_carry_n_5 ,\i_/i_/i___61_carry_n_6 ,\i_/i_/i___61_carry_n_7 }),
        .S({WADDR[3:1],i___61_carry_i_1_n_0}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___61_carry__0 
       (.CI(\i_/i_/i___61_carry_n_0 ),
        .CO({\i_/i_/i___61_carry__0_n_0 ,\i_/i_/i___61_carry__0_n_1 ,\i_/i_/i___61_carry__0_n_2 ,\i_/i_/i___61_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___61_carry__0_n_4 ,\i_/i_/i___61_carry__0_n_5 ,\i_/i_/i___61_carry__0_n_6 ,\i_/i_/i___61_carry__0_n_7 }),
        .S(WADDR[7:4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___61_carry__1 
       (.CI(\i_/i_/i___61_carry__0_n_0 ),
        .CO({\i_/i_/i___61_carry__1_n_0 ,\i_/i_/i___61_carry__1_n_1 ,\i_/i_/i___61_carry__1_n_2 ,\i_/i_/i___61_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___61_carry__1_n_4 ,\i_/i_/i___61_carry__1_n_5 ,\i_/i_/i___61_carry__1_n_6 ,\i_/i_/i___61_carry__1_n_7 }),
        .S(WADDR[11:8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i___61_carry__2 
       (.CI(\i_/i_/i___61_carry__1_n_0 ),
        .CO({\NLW_i_/i_/i___61_carry__2_CO_UNCONNECTED [3],\i_/i_/i___61_carry__2_n_1 ,\i_/i_/i___61_carry__2_n_2 ,\i_/i_/i___61_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i___61_carry__2_n_4 ,\i_/i_/i___61_carry__2_n_5 ,\i_/i_/i___61_carry__2_n_6 ,\i_/i_/i___61_carry__2_n_7 }),
        .S(WADDR[15:12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i__carry 
       (.CI(1'b0),
        .CO({\i_/i_/i__carry_n_0 ,\i_/i_/i__carry_n_1 ,\i_/i_/i__carry_n_2 ,\i_/i_/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\i_/i_/i__carry_n_4 ,\i_/i_/i__carry_n_5 ,\i_/i_/i__carry_n_6 ,\i_/i_/i__carry_n_7 }),
        .S({\res_seq_reg[txfifo_raddr] [3:1],i__carry_i_1__1_n_0}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i__carry__0 
       (.CI(\i_/i_/i__carry_n_0 ),
        .CO({\i_/i_/i__carry__0_n_0 ,\i_/i_/i__carry__0_n_1 ,\i_/i_/i__carry__0_n_2 ,\i_/i_/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i__carry__0_n_4 ,\i_/i_/i__carry__0_n_5 ,\i_/i_/i__carry__0_n_6 ,\i_/i_/i__carry__0_n_7 }),
        .S(\res_seq_reg[txfifo_raddr] [7:4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i__carry__1 
       (.CI(\i_/i_/i__carry__0_n_0 ),
        .CO({\i_/i_/i__carry__1_n_0 ,\i_/i_/i__carry__1_n_1 ,\i_/i_/i__carry__1_n_2 ,\i_/i_/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i__carry__1_n_4 ,\i_/i_/i__carry__1_n_5 ,\i_/i_/i__carry__1_n_6 ,\i_/i_/i__carry__1_n_7 }),
        .S(\res_seq_reg[txfifo_raddr] [11:8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \i_/i_/i__carry__2 
       (.CI(\i_/i_/i__carry__1_n_0 ),
        .CO({\NLW_i_/i_/i__carry__2_CO_UNCONNECTED [3],\i_/i_/i__carry__2_n_1 ,\i_/i_/i__carry__2_n_2 ,\i_/i_/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_/i_/i__carry__2_n_4 ,\i_/i_/i__carry__2_n_5 ,\i_/i_/i__carry__2_n_6 ,\i_/i_/i__carry__2_n_7 }),
        .S(\res_seq_reg[txfifo_raddr] [15:12]));
  LUT1 #(
    .INIT(2'h1)) 
    i___30_carry_i_1
       (.I0(\res_seq_reg[txfifo_waddr] [0]),
        .O(i___30_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___61_carry_i_1
       (.I0(WADDR[0]),
        .O(i___61_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(\res_seq_reg[rxfiforoom_n_0_][7] ),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2
       (.I0(\res_seq_reg[rxfiforoom_n_0_][6] ),
        .O(i__carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3
       (.I0(\res_seq_reg[rxfiforoom_n_0_][5] ),
        .O(i__carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4
       (.I0(\res_seq_reg[rxfiforoom_n_0_][4] ),
        .O(i__carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(\res_seq_reg[rxfiforoom_n_0_][11] ),
        .O(i__carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2
       (.I0(\res_seq_reg[rxfiforoom_n_0_][10] ),
        .O(i__carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3
       (.I0(\res_seq_reg[rxfiforoom_n_0_][9] ),
        .O(i__carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4
       (.I0(\res_seq_reg[rxfiforoom_n_0_][8] ),
        .O(i__carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1
       (.I0(\res_seq_reg[rxfiforoom_n_0_][15] ),
        .O(i__carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2
       (.I0(\res_seq_reg[rxfiforoom_n_0_][14] ),
        .O(i__carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3
       (.I0(\res_seq_reg[rxfiforoom_n_0_][13] ),
        .O(i__carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4
       (.I0(\res_seq_reg[rxfiforoom_n_0_][12] ),
        .O(i__carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1
       (.I0(\res_seq_reg[rxfiforoom_n_0_][16] ),
        .O(i__carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(\res_seq_reg[rxfiforoom_n_0_][3] ),
        .O(i__carry_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__1
       (.I0(\res_seq_reg[txfifo_raddr] [0]),
        .O(i__carry_i_1__1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2
       (.I0(\res_seq_reg[rxfiforoom_n_0_][2] ),
        .O(i__carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3
       (.I0(\res_seq_reg[rxfiforoom_n_0_][1] ),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4
       (.I0(\res_seq_reg[rxfiforoom_n_0_][0] ),
        .I1(\res_seq_reg[rxfull]__0 ),
        .O(i__carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\res_seq_reg[txfiforoom_n_0_][3] ,\res_seq_reg[txfiforoom_n_0_][2] ,\res_seq_reg[txfiforoom_n_0_][1] ,\res_seq_reg[txfiforoom_n_0_][0] }),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S({minusOp_carry_i_1_n_0,minusOp_carry_i_2_n_0,minusOp_carry_i_3_n_0,minusOp_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[txfiforoom_n_0_][7] ,\res_seq_reg[txfiforoom_n_0_][6] ,\res_seq_reg[txfiforoom_n_0_][5] ,\res_seq_reg[txfiforoom_n_0_][4] }),
        .O({minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S({minusOp_carry__0_i_1_n_0,minusOp_carry__0_i_2_n_0,minusOp_carry__0_i_3_n_0,minusOp_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_1
       (.I0(\res_seq_reg[txfiforoom_n_0_][7] ),
        .O(minusOp_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_2
       (.I0(\res_seq_reg[txfiforoom_n_0_][6] ),
        .O(minusOp_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_3
       (.I0(\res_seq_reg[txfiforoom_n_0_][5] ),
        .O(minusOp_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_4
       (.I0(\res_seq_reg[txfiforoom_n_0_][4] ),
        .O(minusOp_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__1
       (.CI(minusOp_carry__0_n_0),
        .CO({minusOp_carry__1_n_0,minusOp_carry__1_n_1,minusOp_carry__1_n_2,minusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[txfiforoom_n_0_][11] ,\res_seq_reg[txfiforoom_n_0_][10] ,\res_seq_reg[txfiforoom_n_0_][9] ,\res_seq_reg[txfiforoom_n_0_][8] }),
        .O({minusOp_carry__1_n_4,minusOp_carry__1_n_5,minusOp_carry__1_n_6,minusOp_carry__1_n_7}),
        .S({minusOp_carry__1_i_1_n_0,minusOp_carry__1_i_2_n_0,minusOp_carry__1_i_3_n_0,minusOp_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_1
       (.I0(\res_seq_reg[txfiforoom_n_0_][11] ),
        .O(minusOp_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_2
       (.I0(\res_seq_reg[txfiforoom_n_0_][10] ),
        .O(minusOp_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_3
       (.I0(\res_seq_reg[txfiforoom_n_0_][9] ),
        .O(minusOp_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_4
       (.I0(\res_seq_reg[txfiforoom_n_0_][8] ),
        .O(minusOp_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__2
       (.CI(minusOp_carry__1_n_0),
        .CO({minusOp_carry__2_n_0,minusOp_carry__2_n_1,minusOp_carry__2_n_2,minusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[txfiforoom_n_0_][15] ,\res_seq_reg[txfiforoom_n_0_][14] ,\res_seq_reg[txfiforoom_n_0_][13] ,\res_seq_reg[txfiforoom_n_0_][12] }),
        .O({minusOp_carry__2_n_4,minusOp_carry__2_n_5,minusOp_carry__2_n_6,minusOp_carry__2_n_7}),
        .S({minusOp_carry__2_i_1_n_0,minusOp_carry__2_i_2_n_0,minusOp_carry__2_i_3_n_0,minusOp_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_1
       (.I0(\res_seq_reg[txfiforoom_n_0_][15] ),
        .O(minusOp_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_2
       (.I0(\res_seq_reg[txfiforoom_n_0_][14] ),
        .O(minusOp_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_3
       (.I0(\res_seq_reg[txfiforoom_n_0_][13] ),
        .O(minusOp_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__2_i_4
       (.I0(\res_seq_reg[txfiforoom_n_0_][12] ),
        .O(minusOp_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp_carry__3
       (.CI(minusOp_carry__2_n_0),
        .CO(NLW_minusOp_carry__3_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_minusOp_carry__3_O_UNCONNECTED[3:1],minusOp_carry__3_n_7}),
        .S({1'b0,1'b0,1'b0,minusOp_carry__3_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__3_i_1
       (.I0(\res_seq_reg[txfiforoom_n_0_][16] ),
        .O(minusOp_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_1
       (.I0(\res_seq_reg[txfiforoom_n_0_][3] ),
        .O(minusOp_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_2
       (.I0(\res_seq_reg[txfiforoom_n_0_][2] ),
        .O(minusOp_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_3
       (.I0(\res_seq_reg[txfiforoom_n_0_][1] ),
        .O(minusOp_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    minusOp_carry_i_4
       (.I0(\res_seq_reg[txfiforoom_n_0_][0] ),
        .I1(\res_seq_reg[txfull]__0 ),
        .O(minusOp_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\minusOp_inferred__0/i__carry_n_0 ,\minusOp_inferred__0/i__carry_n_1 ,\minusOp_inferred__0/i__carry_n_2 ,\minusOp_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({\res_seq_reg[rxfiforoom_n_0_][3] ,\res_seq_reg[rxfiforoom_n_0_][2] ,\res_seq_reg[rxfiforoom_n_0_][1] ,\res_seq_reg[rxfiforoom_n_0_][0] }),
        .O(\vres[rxfiforoom] [3:0]),
        .S({i__carry_i_1__0_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry__0 
       (.CI(\minusOp_inferred__0/i__carry_n_0 ),
        .CO({\minusOp_inferred__0/i__carry__0_n_0 ,\minusOp_inferred__0/i__carry__0_n_1 ,\minusOp_inferred__0/i__carry__0_n_2 ,\minusOp_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[rxfiforoom_n_0_][7] ,\res_seq_reg[rxfiforoom_n_0_][6] ,\res_seq_reg[rxfiforoom_n_0_][5] ,\res_seq_reg[rxfiforoom_n_0_][4] }),
        .O(\vres[rxfiforoom] [7:4]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry__1 
       (.CI(\minusOp_inferred__0/i__carry__0_n_0 ),
        .CO({\minusOp_inferred__0/i__carry__1_n_0 ,\minusOp_inferred__0/i__carry__1_n_1 ,\minusOp_inferred__0/i__carry__1_n_2 ,\minusOp_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[rxfiforoom_n_0_][11] ,\res_seq_reg[rxfiforoom_n_0_][10] ,\res_seq_reg[rxfiforoom_n_0_][9] ,\res_seq_reg[rxfiforoom_n_0_][8] }),
        .O(\vres[rxfiforoom] [11:8]),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry__2 
       (.CI(\minusOp_inferred__0/i__carry__1_n_0 ),
        .CO({\minusOp_inferred__0/i__carry__2_n_0 ,\minusOp_inferred__0/i__carry__2_n_1 ,\minusOp_inferred__0/i__carry__2_n_2 ,\minusOp_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({\res_seq_reg[rxfiforoom_n_0_][15] ,\res_seq_reg[rxfiforoom_n_0_][14] ,\res_seq_reg[rxfiforoom_n_0_][13] ,\res_seq_reg[rxfiforoom_n_0_][12] }),
        .O(\vres[rxfiforoom] [15:12]),
        .S({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \minusOp_inferred__0/i__carry__3 
       (.CI(\minusOp_inferred__0/i__carry__2_n_0 ),
        .CO(\NLW_minusOp_inferred__0/i__carry__3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_minusOp_inferred__0/i__carry__3_O_UNCONNECTED [3:1],\vres[rxfiforoom] [16]}),
        .S({1'b0,1'b0,1'b0,i__carry__3_i_1_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_fifo[6]_i_1 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .O(\res_seq_reg[rxfifo_rvalid]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out_fifo[7]_i_2 
       (.I0(axi_streamout_tready),
        .I1(RXVALID),
        .O(out_fifo0));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h08FF)) 
    \out_fifo[7]_i_3 
       (.I0(RXVALID),
        .I1(axi_streamout_tready),
        .I2(\escape_fifo_reg[0] ),
        .I3(axi_streamout_aresetn),
        .O(\res_seq_reg[rxfifo_rvalid]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \res_seq[rxfifo_raddr][3]_i_2 
       (.I0(\res_seq_reg[rxfifo_raddr] [0]),
        .I1(RXVALID),
        .O(\res_seq[rxfifo_raddr][3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][0]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][0] ),
        .I1(\vres[rxfiforoom] [0]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [0]),
        .O(\res_seq[rxfiforoom][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][10]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][10] ),
        .I1(\vres[rxfiforoom] [10]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [10]),
        .O(\res_seq[rxfiforoom][10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][11]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][11] ),
        .I1(\vres[rxfiforoom] [11]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [11]),
        .O(\res_seq[rxfiforoom][11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][14]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][14] ),
        .I1(\vres[rxfiforoom] [14]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [14]),
        .O(\res_seq[rxfiforoom][14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][16]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][16] ),
        .I1(\vres[rxfiforoom] [16]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [16]),
        .O(\res_seq_reg[rxfifo_rvalid]1 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][2]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][2] ),
        .I1(\vres[rxfiforoom] [2]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [2]),
        .O(\res_seq[rxfiforoom][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][3]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][3] ),
        .I1(\vres[rxfiforoom] [3]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [3]),
        .O(\res_seq[rxfiforoom][3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \res_seq[rxfiforoom][3]_i_3 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][0] ),
        .I1(RXVALID),
        .O(\res_seq[rxfiforoom][3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][4]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][4] ),
        .I1(\vres[rxfiforoom] [4]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [4]),
        .O(\res_seq[rxfiforoom][4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][5]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][5] ),
        .I1(\vres[rxfiforoom] [5]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [5]),
        .O(\res_seq[rxfiforoom][5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][6]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][6] ),
        .I1(\vres[rxfiforoom] [6]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [6]),
        .O(\res_seq[rxfiforoom][6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFCAA0CA)) 
    \res_seq[rxfiforoom][7]_i_1 
       (.I0(\res_seq_reg[rxfiforoom_n_0_][7] ),
        .I1(\vres[rxfiforoom] [7]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [7]),
        .O(\res_seq[rxfiforoom][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \res_seq[rxfull]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\res_seq[rxfiforoom][3]_i_1_n_0 ),
        .I2(\res_seq[rxfiforoom][2]_i_1_n_0 ),
        .I3(\res_seq[rxfull]_i_3_n_0 ),
        .I4(\res_seq[rxfiforoom][5]_i_1_n_0 ),
        .I5(RECV_INST_n_21),
        .O(\res_com[rxfull] ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \res_seq[rxfull]_i_2 
       (.I0(RECV_INST_n_17),
        .I1(\res_seq[rxfiforoom][14]_i_1_n_0 ),
        .I2(RECV_INST_n_16),
        .I3(\res_seq[rxfull]_i_4_n_0 ),
        .I4(\res_seq[rxfull]_i_5_n_0 ),
        .O(\res_seq[rxfull]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBCB3808)) 
    \res_seq[rxfull]_i_3 
       (.I0(\vres[rxfiforoom]0_in [4]),
        .I1(SPW_RXREAD),
        .I2(WEN),
        .I3(\vres[rxfiforoom] [4]),
        .I4(\res_seq_reg[rxfiforoom_n_0_][4] ),
        .I5(\res_seq[rxfiforoom][0]_i_1_n_0 ),
        .O(\res_seq[rxfull]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \res_seq[rxfull]_i_4 
       (.I0(\res_seq[rxfiforoom][11]_i_1_n_0 ),
        .I1(RECV_INST_n_19),
        .I2(RECV_INST_n_20),
        .I3(\res_seq_reg[rxfifo_rvalid]1 ),
        .O(\res_seq[rxfull]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \res_seq[rxfull]_i_5 
       (.I0(\res_seq[rxfiforoom][10]_i_1_n_0 ),
        .I1(\res_seq[rxfiforoom][6]_i_1_n_0 ),
        .I2(RECV_INST_n_18),
        .I3(\res_seq[rxfiforoom][7]_i_1_n_0 ),
        .O(\res_seq[rxfull]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFAEFAFEAAAEA)) 
    \res_seq[rxroom][0]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\vres[rxfiforoom]0_in [0]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [0]),
        .I5(\res_seq_reg[rxfiforoom_n_0_][0] ),
        .O(\res_com[rxroom] [0]));
  LUT6 #(
    .INIT(64'hFFEFFAEFAFEAAAEA)) 
    \res_seq[rxroom][1]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\vres[rxfiforoom] [1]),
        .I2(WEN),
        .I3(SPW_RXREAD),
        .I4(\vres[rxfiforoom]0_in [1]),
        .I5(\res_seq_reg[rxfiforoom_n_0_][1] ),
        .O(\res_com[rxroom] [1]));
  LUT6 #(
    .INIT(64'hFFEFFAEFAFEAAAEA)) 
    \res_seq[rxroom][2]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\vres[rxfiforoom]0_in [2]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [2]),
        .I5(\res_seq_reg[rxfiforoom_n_0_][2] ),
        .O(\res_com[rxroom] [2]));
  LUT6 #(
    .INIT(64'hEEFFFAEEEEAAFAEE)) 
    \res_seq[rxroom][3]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\res_seq_reg[rxfiforoom_n_0_][3] ),
        .I2(\vres[rxfiforoom] [3]),
        .I3(WEN),
        .I4(SPW_RXREAD),
        .I5(\vres[rxfiforoom]0_in [3]),
        .O(\res_com[rxroom] [3]));
  LUT6 #(
    .INIT(64'hFFEFFAEFAFEAAAEA)) 
    \res_seq[rxroom][4]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\vres[rxfiforoom]0_in [4]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [4]),
        .I5(\res_seq_reg[rxfiforoom_n_0_][4] ),
        .O(\res_com[rxroom] [4]));
  LUT6 #(
    .INIT(64'hFFEFFAEFAFEAAAEA)) 
    \res_seq[rxroom][5]_i_1 
       (.I0(\res_seq[rxfull]_i_2_n_0 ),
        .I1(\vres[rxfiforoom]0_in [5]),
        .I2(SPW_RXREAD),
        .I3(WEN),
        .I4(\vres[rxfiforoom] [5]),
        .I5(\res_seq_reg[rxfiforoom_n_0_][5] ),
        .O(\res_com[rxroom] [5]));
  LUT2 #(
    .INIT(4'h6)) 
    \res_seq[txfiforoom][3]_i_3 
       (.I0(\res_seq_reg[txfiforoom_n_0_][0] ),
        .I1(\res_seq_reg[txfifo_rvalid]__0 ),
        .O(\res_seq[txfiforoom][3]_i_3_n_0 ));
  FDCE \res_seq_reg[rxeep] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxeep]3_out ),
        .Q(\res_seq_reg[rxeep]__0 ));
  FDCE \res_seq_reg[rxemptydiscard] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxemptydiscard] ),
        .Q(\res_seq_reg[rxemptydiscard_n_0_] ));
  FDCE \res_seq_reg[rxfifo_raddr][0] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [0]),
        .Q(\res_seq_reg[rxfifo_raddr] [0]));
  FDCE \res_seq_reg[rxfifo_raddr][10] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [10]),
        .Q(\res_seq_reg[rxfifo_raddr] [10]));
  FDCE \res_seq_reg[rxfifo_raddr][11] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [11]),
        .Q(\res_seq_reg[rxfifo_raddr] [11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfifo_raddr][11]_i_1 
       (.CI(\res_seq_reg[rxfifo_raddr][7]_i_1_n_0 ),
        .CO({\res_seq_reg[rxfifo_raddr][11]_i_1_n_0 ,\res_seq_reg[rxfifo_raddr][11]_i_1_n_1 ,\res_seq_reg[rxfifo_raddr][11]_i_1_n_2 ,\res_seq_reg[rxfifo_raddr][11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfifo_raddr] [11:8]),
        .S(\res_seq_reg[rxfifo_raddr] [11:8]));
  FDCE \res_seq_reg[rxfifo_raddr][12] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [12]),
        .Q(\res_seq_reg[rxfifo_raddr] [12]));
  FDCE \res_seq_reg[rxfifo_raddr][13] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [13]),
        .Q(\res_seq_reg[rxfifo_raddr] [13]));
  FDCE \res_seq_reg[rxfifo_raddr][14] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [14]),
        .Q(\res_seq_reg[rxfifo_raddr] [14]));
  FDCE \res_seq_reg[rxfifo_raddr][15] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [15]),
        .Q(\res_seq_reg[rxfifo_raddr] [15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfifo_raddr][15]_i_1 
       (.CI(\res_seq_reg[rxfifo_raddr][11]_i_1_n_0 ),
        .CO({\NLW_res_seq_reg[rxfifo_raddr][15]_i_1_CO_UNCONNECTED [3],\res_seq_reg[rxfifo_raddr][15]_i_1_n_1 ,\res_seq_reg[rxfifo_raddr][15]_i_1_n_2 ,\res_seq_reg[rxfifo_raddr][15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfifo_raddr] [15:12]),
        .S(\res_seq_reg[rxfifo_raddr] [15:12]));
  FDCE \res_seq_reg[rxfifo_raddr][1] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [1]),
        .Q(\res_seq_reg[rxfifo_raddr] [1]));
  FDCE \res_seq_reg[rxfifo_raddr][2] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [2]),
        .Q(\res_seq_reg[rxfifo_raddr] [2]));
  FDCE \res_seq_reg[rxfifo_raddr][3] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [3]),
        .Q(\res_seq_reg[rxfifo_raddr] [3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfifo_raddr][3]_i_1 
       (.CI(1'b0),
        .CO({\res_seq_reg[rxfifo_raddr][3]_i_1_n_0 ,\res_seq_reg[rxfifo_raddr][3]_i_1_n_1 ,\res_seq_reg[rxfifo_raddr][3]_i_1_n_2 ,\res_seq_reg[rxfifo_raddr][3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\res_seq_reg[rxfifo_raddr] [0]}),
        .O(\vres[rxfifo_raddr] [3:0]),
        .S({\res_seq_reg[rxfifo_raddr] [3:1],\res_seq[rxfifo_raddr][3]_i_2_n_0 }));
  FDCE \res_seq_reg[rxfifo_raddr][4] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [4]),
        .Q(\res_seq_reg[rxfifo_raddr] [4]));
  FDCE \res_seq_reg[rxfifo_raddr][5] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [5]),
        .Q(\res_seq_reg[rxfifo_raddr] [5]));
  FDCE \res_seq_reg[rxfifo_raddr][6] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [6]),
        .Q(\res_seq_reg[rxfifo_raddr] [6]));
  FDCE \res_seq_reg[rxfifo_raddr][7] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [7]),
        .Q(\res_seq_reg[rxfifo_raddr] [7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfifo_raddr][7]_i_1 
       (.CI(\res_seq_reg[rxfifo_raddr][3]_i_1_n_0 ),
        .CO({\res_seq_reg[rxfifo_raddr][7]_i_1_n_0 ,\res_seq_reg[rxfifo_raddr][7]_i_1_n_1 ,\res_seq_reg[rxfifo_raddr][7]_i_1_n_2 ,\res_seq_reg[rxfifo_raddr][7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfifo_raddr] [7:4]),
        .S(\res_seq_reg[rxfifo_raddr] [7:4]));
  FDCE \res_seq_reg[rxfifo_raddr][8] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [8]),
        .Q(\res_seq_reg[rxfifo_raddr] [8]));
  FDCE \res_seq_reg[rxfifo_raddr][9] 
       (.C(SPW_main_clk),
        .CE(SPW_RXREAD),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxfifo_raddr] [9]),
        .Q(\res_seq_reg[rxfifo_raddr] [9]));
  FDCE \res_seq_reg[rxfifo_rvalid] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxfifo_rvalid] ),
        .Q(RXVALID));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfifo_rvalid]_i_2 
       (.CI(\res_seq_reg[rxfiforoom][15]_i_2_n_0 ),
        .CO(\NLW_res_seq_reg[rxfifo_rvalid]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_res_seq_reg[rxfifo_rvalid]_i_2_O_UNCONNECTED [3:1],\vres[rxfiforoom]0_in [16]}),
        .S({1'b0,1'b0,1'b0,\res_seq_reg[rxfiforoom_n_0_][16] }));
  FDCE \res_seq_reg[rxfifo_waddr][0] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry_n_7 ),
        .Q(WADDR[0]));
  FDCE \res_seq_reg[rxfifo_waddr][10] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__1_n_5 ),
        .Q(WADDR[10]));
  FDCE \res_seq_reg[rxfifo_waddr][11] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__1_n_4 ),
        .Q(WADDR[11]));
  FDCE \res_seq_reg[rxfifo_waddr][12] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__2_n_7 ),
        .Q(WADDR[12]));
  FDCE \res_seq_reg[rxfifo_waddr][13] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__2_n_6 ),
        .Q(WADDR[13]));
  FDCE \res_seq_reg[rxfifo_waddr][14] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__2_n_5 ),
        .Q(WADDR[14]));
  FDCE \res_seq_reg[rxfifo_waddr][15] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__2_n_4 ),
        .Q(WADDR[15]));
  FDCE \res_seq_reg[rxfifo_waddr][1] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry_n_6 ),
        .Q(WADDR[1]));
  FDCE \res_seq_reg[rxfifo_waddr][2] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry_n_5 ),
        .Q(WADDR[2]));
  FDCE \res_seq_reg[rxfifo_waddr][3] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry_n_4 ),
        .Q(WADDR[3]));
  FDCE \res_seq_reg[rxfifo_waddr][4] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__0_n_7 ),
        .Q(WADDR[4]));
  FDCE \res_seq_reg[rxfifo_waddr][5] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__0_n_6 ),
        .Q(WADDR[5]));
  FDCE \res_seq_reg[rxfifo_waddr][6] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__0_n_5 ),
        .Q(WADDR[6]));
  FDCE \res_seq_reg[rxfifo_waddr][7] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__0_n_4 ),
        .Q(WADDR[7]));
  FDCE \res_seq_reg[rxfifo_waddr][8] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__1_n_7 ),
        .Q(WADDR[8]));
  FDCE \res_seq_reg[rxfifo_waddr][9] 
       (.C(SPW_main_clk),
        .CE(WEN),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___61_carry__1_n_6 ),
        .Q(WADDR[9]));
  FDCE \res_seq_reg[rxfiforoom][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][0]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][0] ));
  FDCE \res_seq_reg[rxfiforoom][10] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][10]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][10] ));
  FDCE \res_seq_reg[rxfiforoom][11] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][11]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][11] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfiforoom][11]_i_2 
       (.CI(\res_seq_reg[rxfiforoom][7]_i_2_n_0 ),
        .CO({\res_seq_reg[rxfiforoom][11]_i_2_n_0 ,\res_seq_reg[rxfiforoom][11]_i_2_n_1 ,\res_seq_reg[rxfiforoom][11]_i_2_n_2 ,\res_seq_reg[rxfiforoom][11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfiforoom]0_in [11:8]),
        .S({\res_seq_reg[rxfiforoom_n_0_][11] ,\res_seq_reg[rxfiforoom_n_0_][10] ,\res_seq_reg[rxfiforoom_n_0_][9] ,\res_seq_reg[rxfiforoom_n_0_][8] }));
  FDCE \res_seq_reg[rxfiforoom][12] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_18),
        .Q(\res_seq_reg[rxfiforoom_n_0_][12] ));
  FDCE \res_seq_reg[rxfiforoom][13] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_17),
        .Q(\res_seq_reg[rxfiforoom_n_0_][13] ));
  FDCE \res_seq_reg[rxfiforoom][14] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][14]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][14] ));
  FDCE \res_seq_reg[rxfiforoom][15] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_16),
        .Q(\res_seq_reg[rxfiforoom_n_0_][15] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfiforoom][15]_i_2 
       (.CI(\res_seq_reg[rxfiforoom][11]_i_2_n_0 ),
        .CO({\res_seq_reg[rxfiforoom][15]_i_2_n_0 ,\res_seq_reg[rxfiforoom][15]_i_2_n_1 ,\res_seq_reg[rxfiforoom][15]_i_2_n_2 ,\res_seq_reg[rxfiforoom][15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfiforoom]0_in [15:12]),
        .S({\res_seq_reg[rxfiforoom_n_0_][15] ,\res_seq_reg[rxfiforoom_n_0_][14] ,\res_seq_reg[rxfiforoom_n_0_][13] ,\res_seq_reg[rxfiforoom_n_0_][12] }));
  FDPE \res_seq_reg[rxfiforoom][16] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\res_seq_reg[rxfifo_rvalid]1 ),
        .PRE(SYSRSTLOGIC_n_1),
        .Q(\res_seq_reg[rxfiforoom_n_0_][16] ));
  FDCE \res_seq_reg[rxfiforoom][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_21),
        .Q(\res_seq_reg[rxfiforoom_n_0_][1] ));
  FDCE \res_seq_reg[rxfiforoom][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][2]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][2] ));
  FDCE \res_seq_reg[rxfiforoom][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][3]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][3] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfiforoom][3]_i_2 
       (.CI(1'b0),
        .CO({\res_seq_reg[rxfiforoom][3]_i_2_n_0 ,\res_seq_reg[rxfiforoom][3]_i_2_n_1 ,\res_seq_reg[rxfiforoom][3]_i_2_n_2 ,\res_seq_reg[rxfiforoom][3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\res_seq_reg[rxfiforoom_n_0_][0] }),
        .O(\vres[rxfiforoom]0_in [3:0]),
        .S({\res_seq_reg[rxfiforoom_n_0_][3] ,\res_seq_reg[rxfiforoom_n_0_][2] ,\res_seq_reg[rxfiforoom_n_0_][1] ,\res_seq[rxfiforoom][3]_i_3_n_0 }));
  FDCE \res_seq_reg[rxfiforoom][4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][4]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][4] ));
  FDCE \res_seq_reg[rxfiforoom][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][5]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][5] ));
  FDCE \res_seq_reg[rxfiforoom][6] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][6]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][6] ));
  FDCE \res_seq_reg[rxfiforoom][7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_seq[rxfiforoom][7]_i_1_n_0 ),
        .Q(\res_seq_reg[rxfiforoom_n_0_][7] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[rxfiforoom][7]_i_2 
       (.CI(\res_seq_reg[rxfiforoom][3]_i_2_n_0 ),
        .CO({\res_seq_reg[rxfiforoom][7]_i_2_n_0 ,\res_seq_reg[rxfiforoom][7]_i_2_n_1 ,\res_seq_reg[rxfiforoom][7]_i_2_n_2 ,\res_seq_reg[rxfiforoom][7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[rxfiforoom]0_in [7:4]),
        .S({\res_seq_reg[rxfiforoom_n_0_][7] ,\res_seq_reg[rxfiforoom_n_0_][6] ,\res_seq_reg[rxfiforoom_n_0_][5] ,\res_seq_reg[rxfiforoom_n_0_][4] }));
  FDCE \res_seq_reg[rxfiforoom][8] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_20),
        .Q(\res_seq_reg[rxfiforoom_n_0_][8] ));
  FDCE \res_seq_reg[rxfiforoom][9] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(RECV_INST_n_19),
        .Q(\res_seq_reg[rxfiforoom_n_0_][9] ));
  FDCE \res_seq_reg[rxfull] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxfull] ),
        .Q(\res_seq_reg[rxfull]__0 ));
  FDCE \res_seq_reg[rxpacket] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[rxpacket]7_out ),
        .Q(\res_seq_reg[rxpacket_n_0_] ));
  FDCE \res_seq_reg[rxroom][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [0]),
        .Q(\res_seq_reg[rxroom_n_0_][0] ));
  FDCE \res_seq_reg[rxroom][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [1]),
        .Q(\res_seq_reg[rxroom_n_0_][1] ));
  FDCE \res_seq_reg[rxroom][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [2]),
        .Q(\res_seq_reg[rxroom_n_0_][2] ));
  FDCE \res_seq_reg[rxroom][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [3]),
        .Q(\res_seq_reg[rxroom_n_0_][3] ));
  FDCE \res_seq_reg[rxroom][4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [4]),
        .Q(\res_seq_reg[rxroom_n_0_][4] ));
  FDCE \res_seq_reg[rxroom][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[rxroom] [5]),
        .Q(\res_seq_reg[rxroom_n_0_][5] ));
  FDCE \res_seq_reg[txdiscard] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txdiscard] ),
        .Q(\res_seq_reg[txdiscard]__0 ));
  FDCE \res_seq_reg[txfifo_raddr][0] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry_n_7 ),
        .Q(\res_seq_reg[txfifo_raddr] [0]));
  FDCE \res_seq_reg[txfifo_raddr][10] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__1_n_5 ),
        .Q(\res_seq_reg[txfifo_raddr] [10]));
  FDCE \res_seq_reg[txfifo_raddr][11] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__1_n_4 ),
        .Q(\res_seq_reg[txfifo_raddr] [11]));
  FDCE \res_seq_reg[txfifo_raddr][12] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__2_n_7 ),
        .Q(\res_seq_reg[txfifo_raddr] [12]));
  FDCE \res_seq_reg[txfifo_raddr][13] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__2_n_6 ),
        .Q(\res_seq_reg[txfifo_raddr] [13]));
  FDCE \res_seq_reg[txfifo_raddr][14] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__2_n_5 ),
        .Q(\res_seq_reg[txfifo_raddr] [14]));
  FDCE \res_seq_reg[txfifo_raddr][15] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__2_n_4 ),
        .Q(\res_seq_reg[txfifo_raddr] [15]));
  FDCE \res_seq_reg[txfifo_raddr][1] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry_n_6 ),
        .Q(\res_seq_reg[txfifo_raddr] [1]));
  FDCE \res_seq_reg[txfifo_raddr][2] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry_n_5 ),
        .Q(\res_seq_reg[txfifo_raddr] [2]));
  FDCE \res_seq_reg[txfifo_raddr][3] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry_n_4 ),
        .Q(\res_seq_reg[txfifo_raddr] [3]));
  FDCE \res_seq_reg[txfifo_raddr][4] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__0_n_7 ),
        .Q(\res_seq_reg[txfifo_raddr] [4]));
  FDCE \res_seq_reg[txfifo_raddr][5] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__0_n_6 ),
        .Q(\res_seq_reg[txfifo_raddr] [5]));
  FDCE \res_seq_reg[txfifo_raddr][6] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__0_n_5 ),
        .Q(\res_seq_reg[txfifo_raddr] [6]));
  FDCE \res_seq_reg[txfifo_raddr][7] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__0_n_4 ),
        .Q(\res_seq_reg[txfifo_raddr] [7]));
  FDCE \res_seq_reg[txfifo_raddr][8] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__1_n_7 ),
        .Q(\res_seq_reg[txfifo_raddr] [8]));
  FDCE \res_seq_reg[txfifo_raddr][9] 
       (.C(SPW_main_clk),
        .CE(sel),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i__carry__1_n_6 ),
        .Q(\res_seq_reg[txfifo_raddr] [9]));
  FDCE \res_seq_reg[txfifo_rvalid] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[txfifo_rvalid] ),
        .Q(\res_seq_reg[txfifo_rvalid]__0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[txfifo_rvalid]_i_2 
       (.CI(\res_seq_reg[txfiforoom][15]_i_2_n_0 ),
        .CO(\NLW_res_seq_reg[txfifo_rvalid]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_res_seq_reg[txfifo_rvalid]_i_2_O_UNCONNECTED [3:1],\vres[txfiforoom]0_in [16]}),
        .S({1'b0,1'b0,1'b0,\res_seq_reg[txfiforoom_n_0_][16] }));
  FDCE \res_seq_reg[txfifo_waddr][0] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry_n_7 ),
        .Q(\res_seq_reg[txfifo_waddr] [0]));
  FDCE \res_seq_reg[txfifo_waddr][10] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__1_n_5 ),
        .Q(\res_seq_reg[txfifo_waddr] [10]));
  FDCE \res_seq_reg[txfifo_waddr][11] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__1_n_4 ),
        .Q(\res_seq_reg[txfifo_waddr] [11]));
  FDCE \res_seq_reg[txfifo_waddr][12] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__2_n_7 ),
        .Q(\res_seq_reg[txfifo_waddr] [12]));
  FDCE \res_seq_reg[txfifo_waddr][13] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__2_n_6 ),
        .Q(\res_seq_reg[txfifo_waddr] [13]));
  FDCE \res_seq_reg[txfifo_waddr][14] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__2_n_5 ),
        .Q(\res_seq_reg[txfifo_waddr] [14]));
  FDCE \res_seq_reg[txfifo_waddr][15] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__2_n_4 ),
        .Q(\res_seq_reg[txfifo_waddr] [15]));
  FDCE \res_seq_reg[txfifo_waddr][1] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry_n_6 ),
        .Q(\res_seq_reg[txfifo_waddr] [1]));
  FDCE \res_seq_reg[txfifo_waddr][2] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry_n_5 ),
        .Q(\res_seq_reg[txfifo_waddr] [2]));
  FDCE \res_seq_reg[txfifo_waddr][3] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry_n_4 ),
        .Q(\res_seq_reg[txfifo_waddr] [3]));
  FDCE \res_seq_reg[txfifo_waddr][4] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__0_n_7 ),
        .Q(\res_seq_reg[txfifo_waddr] [4]));
  FDCE \res_seq_reg[txfifo_waddr][5] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__0_n_6 ),
        .Q(\res_seq_reg[txfifo_waddr] [5]));
  FDCE \res_seq_reg[txfifo_waddr][6] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__0_n_5 ),
        .Q(\res_seq_reg[txfifo_waddr] [6]));
  FDCE \res_seq_reg[txfifo_waddr][7] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__0_n_4 ),
        .Q(\res_seq_reg[txfifo_waddr] [7]));
  FDCE \res_seq_reg[txfifo_waddr][8] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__1_n_7 ),
        .Q(\res_seq_reg[txfifo_waddr] [8]));
  FDCE \res_seq_reg[txfifo_waddr][9] 
       (.C(SPW_main_clk),
        .CE(WEN10_out),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\i_/i_/i___30_carry__1_n_6 ),
        .Q(\res_seq_reg[txfifo_waddr] [9]));
  FDCE \res_seq_reg[txfiforoom][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [0]),
        .Q(\res_seq_reg[txfiforoom_n_0_][0] ));
  FDCE \res_seq_reg[txfiforoom][10] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [10]),
        .Q(\res_seq_reg[txfiforoom_n_0_][10] ));
  FDCE \res_seq_reg[txfiforoom][11] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [11]),
        .Q(\res_seq_reg[txfiforoom_n_0_][11] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[txfiforoom][11]_i_2 
       (.CI(\res_seq_reg[txfiforoom][7]_i_2_n_0 ),
        .CO({\res_seq_reg[txfiforoom][11]_i_2_n_0 ,\res_seq_reg[txfiforoom][11]_i_2_n_1 ,\res_seq_reg[txfiforoom][11]_i_2_n_2 ,\res_seq_reg[txfiforoom][11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[txfiforoom]0_in [11:8]),
        .S({\res_seq_reg[txfiforoom_n_0_][11] ,\res_seq_reg[txfiforoom_n_0_][10] ,\res_seq_reg[txfiforoom_n_0_][9] ,\res_seq_reg[txfiforoom_n_0_][8] }));
  FDCE \res_seq_reg[txfiforoom][12] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [12]),
        .Q(\res_seq_reg[txfiforoom_n_0_][12] ));
  FDCE \res_seq_reg[txfiforoom][13] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [13]),
        .Q(\res_seq_reg[txfiforoom_n_0_][13] ));
  FDCE \res_seq_reg[txfiforoom][14] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [14]),
        .Q(\res_seq_reg[txfiforoom_n_0_][14] ));
  FDCE \res_seq_reg[txfiforoom][15] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [15]),
        .Q(\res_seq_reg[txfiforoom_n_0_][15] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[txfiforoom][15]_i_2 
       (.CI(\res_seq_reg[txfiforoom][11]_i_2_n_0 ),
        .CO({\res_seq_reg[txfiforoom][15]_i_2_n_0 ,\res_seq_reg[txfiforoom][15]_i_2_n_1 ,\res_seq_reg[txfiforoom][15]_i_2_n_2 ,\res_seq_reg[txfiforoom][15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[txfiforoom]0_in [15:12]),
        .S({\res_seq_reg[txfiforoom_n_0_][15] ,\res_seq_reg[txfiforoom_n_0_][14] ,\res_seq_reg[txfiforoom_n_0_][13] ,\res_seq_reg[txfiforoom_n_0_][12] }));
  FDPE \res_seq_reg[txfiforoom][16] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .D(\vres[txfiforoom] [16]),
        .PRE(SYSRSTLOGIC_n_1),
        .Q(\res_seq_reg[txfiforoom_n_0_][16] ));
  FDCE \res_seq_reg[txfiforoom][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [1]),
        .Q(\res_seq_reg[txfiforoom_n_0_][1] ));
  FDCE \res_seq_reg[txfiforoom][2] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [2]),
        .Q(\res_seq_reg[txfiforoom_n_0_][2] ));
  FDCE \res_seq_reg[txfiforoom][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [3]),
        .Q(\res_seq_reg[txfiforoom_n_0_][3] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[txfiforoom][3]_i_2 
       (.CI(1'b0),
        .CO({\res_seq_reg[txfiforoom][3]_i_2_n_0 ,\res_seq_reg[txfiforoom][3]_i_2_n_1 ,\res_seq_reg[txfiforoom][3]_i_2_n_2 ,\res_seq_reg[txfiforoom][3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\res_seq_reg[txfiforoom_n_0_][0] }),
        .O(\vres[txfiforoom]0_in [3:0]),
        .S({\res_seq_reg[txfiforoom_n_0_][3] ,\res_seq_reg[txfiforoom_n_0_][2] ,\res_seq_reg[txfiforoom_n_0_][1] ,\res_seq[txfiforoom][3]_i_3_n_0 }));
  FDCE \res_seq_reg[txfiforoom][4] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [4]),
        .Q(\res_seq_reg[txfiforoom_n_0_][4] ));
  FDCE \res_seq_reg[txfiforoom][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [5]),
        .Q(\res_seq_reg[txfiforoom_n_0_][5] ));
  FDCE \res_seq_reg[txfiforoom][6] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [6]),
        .Q(\res_seq_reg[txfiforoom_n_0_][6] ));
  FDCE \res_seq_reg[txfiforoom][7] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [7]),
        .Q(\res_seq_reg[txfiforoom_n_0_][7] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \res_seq_reg[txfiforoom][7]_i_2 
       (.CI(\res_seq_reg[txfiforoom][3]_i_2_n_0 ),
        .CO({\res_seq_reg[txfiforoom][7]_i_2_n_0 ,\res_seq_reg[txfiforoom][7]_i_2_n_1 ,\res_seq_reg[txfiforoom][7]_i_2_n_2 ,\res_seq_reg[txfiforoom][7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\vres[txfiforoom]0_in [7:4]),
        .S({\res_seq_reg[txfiforoom_n_0_][7] ,\res_seq_reg[txfiforoom_n_0_][6] ,\res_seq_reg[txfiforoom_n_0_][5] ,\res_seq_reg[txfiforoom_n_0_][4] }));
  FDCE \res_seq_reg[txfiforoom][8] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [8]),
        .Q(\res_seq_reg[txfiforoom_n_0_][8] ));
  FDCE \res_seq_reg[txfiforoom][9] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txfiforoom] [9]),
        .Q(\res_seq_reg[txfiforoom_n_0_][9] ));
  FDCE \res_seq_reg[txfull] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\res_com[txfull] ),
        .Q(\res_seq_reg[txfull]__0 ));
  FDCE \res_seq_reg[txpacket] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(SYSRSTLOGIC_n_1),
        .D(\vres[txpacket]5_out ),
        .Q(\res_seq_reg[txpacket_n_0_] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast
   (\res_seq_reg[allow_fct]__0 ,
    SPW_Dout,
    SPW_Sout,
    \res_seq_reg[sent_fct]__0 ,
    \res_seq_reg[pend_fct]__0 ,
    \res_seq_reg[allow_char]_0 ,
    DI,
    \res_seq_reg[allow_fct]_0 ,
    SPW_main_clk,
    buf_ff0_reg,
    \v[allow_char] ,
    SPW_TX_clk,
    buf_ff0_reg_0,
    \res_seq_reg[pend_char]_0 ,
    \res_seq_reg[txfifo_rvalid]__0 ,
    \res_seq_reg[txdiscard]__0 ,
    \recvo[rxchar] ,
    \xmiti[fct_in] ,
    \res_seq_reg[token1][char][7]_0 ,
    \res_seq_reg[txdivreg][5]_0 ,
    E,
    D);
  output \res_seq_reg[allow_fct]__0 ;
  output SPW_Dout;
  output SPW_Sout;
  output \res_seq_reg[sent_fct]__0 ;
  output \res_seq_reg[pend_fct]__0 ;
  output \res_seq_reg[allow_char]_0 ;
  output [0:0]DI;
  input \res_seq_reg[allow_fct]_0 ;
  input SPW_main_clk;
  input buf_ff0_reg;
  input \v[allow_char] ;
  input SPW_TX_clk;
  input buf_ff0_reg_0;
  input \res_seq_reg[pend_char]_0 ;
  input \res_seq_reg[txfifo_rvalid]__0 ;
  input \res_seq_reg[txdiscard]__0 ;
  input \recvo[rxchar] ;
  input \xmiti[fct_in] ;
  input \res_seq_reg[token1][char][7]_0 ;
  input [0:0]\res_seq_reg[txdivreg][5]_0 ;
  input [0:0]E;
  input [8:0]D;

  wire [8:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire SPW_Dout;
  wire SPW_Sout;
  wire SPW_TX_clk;
  wire SPW_main_clk;
  wire SYNCSYSTXFLIP0_n_1;
  wire SYNCSYSTXFLIP0_n_2;
  wire SYNCSYSTXFLIP0_n_3;
  wire SYNCSYSTXFLIP0_n_4;
  wire SYNCSYSTXFLIP0_n_5;
  wire SYNCSYSTXFLIP1_n_0;
  wire SYNCSYSTXFLIP1_n_2;
  wire SYNCTXSYSFLIP0_n_0;
  wire SYNCTXSYSFLIP0_n_1;
  wire SYNCTXSYSFLIP0_n_2;
  wire SYNCTXSYSFLIP1_n_1;
  wire SYNCTXTXEN_n_1;
  wire SYNCTXTXEN_n_2;
  wire SYNCTXTXEN_n_3;
  wire SYNCTXTXEN_n_4;
  wire SYNCTXTXEN_n_5;
  wire buf_ff0_reg;
  wire buf_ff0_reg_0;
  wire p_0_in;
  wire p_0_in38_in;
  wire [1:0]p_1_in;
  wire [1:0]p_1_in2_in;
  wire [1:0]p_1_in5_in;
  wire \recvo[rxchar] ;
  wire [1:0]\res_com[txdivtmp] ;
  wire \res_seq[token1][char][0]_i_1_n_0 ;
  wire \res_seq[token1][char][1]_i_1_n_0 ;
  wire \res_seq[token1][char][2]_i_1_n_0 ;
  wire \res_seq[token1][char][3]_i_1_n_0 ;
  wire \res_seq[token1][char][4]_i_1_n_0 ;
  wire \res_seq[token1][char][5]_i_1_n_0 ;
  wire \res_seq[token1][char][6]_i_1_n_0 ;
  wire \res_seq[token1][char][7]_i_1_n_0 ;
  wire \res_seq[token1][fctpiggy]_i_3_n_0 ;
  wire \res_seq[tokmux]_i_3_n_0 ;
  wire \res_seq[txdivnorm]_i_1_n_0 ;
  wire \res_seq[txdivreg][0]_i_1_n_0 ;
  wire \res_seq[txdivreg][3]_i_1_n_0 ;
  wire \res_seq[txdivreg][5]_i_1_n_0 ;
  wire \res_seq[txdivsafe]_i_1_n_0 ;
  wire \res_seq[txenreg]_i_1_n_0 ;
  wire \res_seq_reg[allow_char]_0 ;
  wire \res_seq_reg[allow_char]__0 ;
  wire \res_seq_reg[allow_fct]_0 ;
  wire \res_seq_reg[allow_fct]__0 ;
  wire \res_seq_reg[pend_char]_0 ;
  wire \res_seq_reg[pend_char]__0 ;
  wire \res_seq_reg[pend_data_n_0_][0] ;
  wire \res_seq_reg[pend_data_n_0_][1] ;
  wire \res_seq_reg[pend_data_n_0_][2] ;
  wire \res_seq_reg[pend_data_n_0_][3] ;
  wire \res_seq_reg[pend_data_n_0_][4] ;
  wire \res_seq_reg[pend_data_n_0_][5] ;
  wire \res_seq_reg[pend_data_n_0_][6] ;
  wire \res_seq_reg[pend_data_n_0_][7] ;
  wire \res_seq_reg[pend_data_n_0_][8] ;
  wire \res_seq_reg[pend_fct]__0 ;
  wire \res_seq_reg[sent_fct]__0 ;
  wire \res_seq_reg[sysflip0]__0 ;
  wire \res_seq_reg[sysflip1]__0 ;
  wire [7:0]\res_seq_reg[token0][char] ;
  wire \res_seq_reg[token0][fct_n_0_] ;
  wire \res_seq_reg[token0][fctpiggy_n_0_] ;
  wire \res_seq_reg[token0][flag_n_0_] ;
  wire [7:0]\res_seq_reg[token1][char] ;
  wire \res_seq_reg[token1][char][7]_0 ;
  wire \res_seq_reg[token1][fct_n_0_] ;
  wire \res_seq_reg[token1][fctpiggy_n_0_] ;
  wire \res_seq_reg[token1][flag_n_0_] ;
  wire \res_seq_reg[tokmux]__0 ;
  wire \res_seq_reg[txdiscard]__0 ;
  wire \res_seq_reg[txdivnorm]__0 ;
  wire [5:0]\res_seq_reg[txdivreg] ;
  wire [0:0]\res_seq_reg[txdivreg][5]_0 ;
  wire \res_seq_reg[txdivsafe]__0 ;
  wire [1:0]\res_seq_reg[txdivtmp] ;
  wire \res_seq_reg[txenreg]__0 ;
  wire \res_seq_reg[txfifo_rvalid]__0 ;
  wire \restx_com[b_txflip] ;
  wire [8:0]\restx_com[d_bits] ;
  wire [9:0]\restx_com[e_count] ;
  wire [5:0]\restx_com[txclkcnt] ;
  wire \restx_com[txclken] ;
  wire \restx_com[txclkpre]__0 ;
  wire \restx_seq[b_token][char][0]_i_1_n_0 ;
  wire \restx_seq[b_token][char][1]_i_1_n_0 ;
  wire \restx_seq[b_token][char][2]_i_1_n_0 ;
  wire \restx_seq[b_token][char][3]_i_1_n_0 ;
  wire \restx_seq[b_token][char][4]_i_1_n_0 ;
  wire \restx_seq[b_token][char][5]_i_1_n_0 ;
  wire \restx_seq[b_token][char][6]_i_1_n_0 ;
  wire \restx_seq[b_token][char][7]_i_1_n_0 ;
  wire \restx_seq[b_token][fct]_i_1_n_0 ;
  wire \restx_seq[b_token][fctpiggy]_i_1_n_0 ;
  wire \restx_seq[b_token][flag]_i_1_n_0 ;
  wire \restx_seq[c_bits][2]_i_1_n_0 ;
  wire \restx_seq[c_bits][3]_i_1_n_0 ;
  wire \restx_seq[c_bits][4]_i_1_n_0 ;
  wire \restx_seq[c_bits][5]_i_1_n_0 ;
  wire \restx_seq[c_bits][6]_i_1_n_0 ;
  wire \restx_seq[c_bits][7]_i_1_n_0 ;
  wire \restx_seq[c_bits][8]_i_1_n_0 ;
  wire \restx_seq[e_shift][0]_i_1_n_0 ;
  wire \restx_seq[e_shift][1]_i_1_n_0 ;
  wire \restx_seq[e_shift][2]_i_1_n_0 ;
  wire \restx_seq[e_shift][3]_i_1_n_0 ;
  wire \restx_seq[e_shift][4]_i_1_n_0 ;
  wire \restx_seq[e_shift][5]_i_1_n_0 ;
  wire \restx_seq[e_shift][6]_i_1_n_0 ;
  wire \restx_seq[e_shift][7]_i_1_n_0 ;
  wire \restx_seq[e_shift][8]_i_1_n_0 ;
  wire \restx_seq[e_shift][9]_i_1_n_0 ;
  wire \restx_seq[f_spwdo]_i_1_n_0 ;
  wire \restx_seq[txclkcnt][4]_i_1_n_0 ;
  wire \restx_seq[txclkcnt][6]_i_1_n_0 ;
  wire \restx_seq[txclkcnt][7]_i_1_n_0 ;
  wire \restx_seq[txclkcy][0]_i_1_n_0 ;
  wire \restx_seq[txclkcy][1]_i_1_n_0 ;
  wire \restx_seq[txclkcy][2]_i_1_n_0 ;
  wire \restx_seq[txclkdone][0]_i_1_n_0 ;
  wire \restx_seq[txclkdone][1]_i_1_n_0 ;
  wire \restx_seq_reg[b_mux]__0 ;
  wire [7:0]\restx_seq_reg[b_token][char] ;
  wire \restx_seq_reg[b_token][fct]__0 ;
  wire \restx_seq_reg[b_token][fctpiggy]__0 ;
  wire \restx_seq_reg[b_token][flag]__0 ;
  wire \restx_seq_reg[b_txflip]__0 ;
  wire \restx_seq_reg[b_update]__0 ;
  wire \restx_seq_reg[b_valid]__0 ;
  wire \restx_seq_reg[c_bits_n_0_][0] ;
  wire \restx_seq_reg[c_bits_n_0_][1] ;
  wire \restx_seq_reg[c_bits_n_0_][2] ;
  wire \restx_seq_reg[c_bits_n_0_][3] ;
  wire \restx_seq_reg[c_bits_n_0_][4] ;
  wire \restx_seq_reg[c_bits_n_0_][5] ;
  wire \restx_seq_reg[c_bits_n_0_][6] ;
  wire \restx_seq_reg[c_bits_n_0_][7] ;
  wire \restx_seq_reg[c_bits_n_0_][8] ;
  wire \restx_seq_reg[c_busy]__0 ;
  wire \restx_seq_reg[c_esc_n_0_] ;
  wire \restx_seq_reg[c_fct_n_0_] ;
  wire \restx_seq_reg[c_update_n_0_] ;
  wire \restx_seq_reg[d_bits_n_0_][0] ;
  wire \restx_seq_reg[d_bits_n_0_][1] ;
  wire \restx_seq_reg[d_bits_n_0_][2] ;
  wire \restx_seq_reg[d_bits_n_0_][3] ;
  wire \restx_seq_reg[d_bits_n_0_][4] ;
  wire \restx_seq_reg[d_bits_n_0_][5] ;
  wire \restx_seq_reg[d_bits_n_0_][6] ;
  wire \restx_seq_reg[d_bits_n_0_][7] ;
  wire \restx_seq_reg[d_bits_n_0_][8] ;
  wire \restx_seq_reg[d_cnt10]__0 ;
  wire \restx_seq_reg[e_count_n_0_][0] ;
  wire \restx_seq_reg[e_count_n_0_][1] ;
  wire \restx_seq_reg[e_count_n_0_][2] ;
  wire \restx_seq_reg[e_count_n_0_][4] ;
  wire \restx_seq_reg[e_count_n_0_][5] ;
  wire \restx_seq_reg[e_count_n_0_][6] ;
  wire \restx_seq_reg[e_count_n_0_][7] ;
  wire \restx_seq_reg[e_count_n_0_][8] ;
  wire \restx_seq_reg[e_count_n_0_][9] ;
  wire \restx_seq_reg[e_parity]__0 ;
  wire \restx_seq_reg[e_shift_n_0_][0] ;
  wire \restx_seq_reg[e_shift_n_0_][1] ;
  wire \restx_seq_reg[e_shift_n_0_][2] ;
  wire \restx_seq_reg[e_shift_n_0_][3] ;
  wire \restx_seq_reg[e_shift_n_0_][4] ;
  wire \restx_seq_reg[e_shift_n_0_][5] ;
  wire \restx_seq_reg[e_shift_n_0_][6] ;
  wire \restx_seq_reg[e_shift_n_0_][7] ;
  wire \restx_seq_reg[e_shift_n_0_][8] ;
  wire \restx_seq_reg[e_shift_n_0_][9] ;
  wire \restx_seq_reg[e_valid]__0 ;
  wire \restx_seq_reg[f_spwdo]__0 ;
  wire \restx_seq_reg[f_spwso]__0 ;
  wire \restx_seq_reg[txclkcnt_n_0_][0] ;
  wire \restx_seq_reg[txclkcnt_n_0_][1] ;
  wire \restx_seq_reg[txclkcy_n_0_][0] ;
  wire \restx_seq_reg[txclkcy_n_0_][2] ;
  wire \restx_seq_reg[txclkdiv_n_0_][0] ;
  wire \restx_seq_reg[txclkdiv_n_0_][3] ;
  wire \restx_seq_reg[txclkdiv_n_0_][5] ;
  wire \restx_seq_reg[txclkdone_n_0_][0] ;
  wire \restx_seq_reg[txclkdone_n_0_][1] ;
  wire \restx_seq_reg[txclken]__0 ;
  wire \restx_seq_reg[txclkpre]__0 ;
  wire \restx_seq_reg[txdivnorm_n_0_] ;
  wire \restx_seq_reg[txflip_n_0_0] ;
  wire \restx_seq_reg[txflip_n_0_1] ;
  wire syncdff_ff2;
  wire \synctx[sysflip1] ;
  wire \synctx[txen] ;
  wire \v[allow_char] ;
  wire \v[token0][tick] ;
  wire \v[token1][tick] ;
  wire vhavetoken0;
  wire \vtoken[fctpiggy] ;
  wire \vtoken[flag] ;
  wire \vtx[b_update] ;
  wire \vtx[c_update]__0 ;
  wire \vtx[d_cnt10]__0 ;
  wire \vtx[e_parity]1_out ;
  wire \vtx[f_spwso]__0 ;
  wire \xmiti[fct_in] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff SYNCSYSTXFLIP0
       (.E(\v[token0][tick] ),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(\restx_seq_reg[txflip_n_0_0] ),
        .buf_ff0_reg_1(buf_ff0_reg),
        .\res_seq_reg[allow_char] (SYNCSYSTXFLIP0_n_2),
        .\res_seq_reg[allow_char]__0 (\res_seq_reg[allow_char]__0 ),
        .\res_seq_reg[allow_fct] (SYNCSYSTXFLIP0_n_1),
        .\res_seq_reg[pend_char] (\res_seq_reg[allow_char]_0 ),
        .\res_seq_reg[pend_char]__0 (\res_seq_reg[pend_char]__0 ),
        .\res_seq_reg[pend_fct] (SYNCSYSTXFLIP0_n_5),
        .\res_seq_reg[pend_fct]_0 (\res_seq_reg[allow_fct]__0 ),
        .\res_seq_reg[pend_fct]_1 (\res_seq_reg[pend_fct]__0 ),
        .\res_seq_reg[sent_fct]__0 (\res_seq_reg[sent_fct]__0 ),
        .\res_seq_reg[sysflip0] (\res_seq[token1][fctpiggy]_i_3_n_0 ),
        .\res_seq_reg[sysflip0]__0 (\res_seq_reg[sysflip0]__0 ),
        .\res_seq_reg[sysflip1] (SYNCSYSTXFLIP0_n_4),
        .\res_seq_reg[sysflip1]__0 (\res_seq_reg[sysflip1]__0 ),
        .\res_seq_reg[token0][char][7] (\res_seq_reg[token1][char][7]_0 ),
        .\res_seq_reg[tokmux] (SYNCSYSTXFLIP0_n_3),
        .\res_seq_reg[tokmux]_0 (SYNCSYSTXFLIP1_n_0),
        .\res_seq_reg[tokmux]_1 (\res_seq[tokmux]_i_3_n_0 ),
        .\res_seq_reg[tokmux]__0 (\res_seq_reg[tokmux]__0 ),
        .vhavetoken0(vhavetoken0),
        .\xmiti[fct_in] (\xmiti[fct_in] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0 SYNCSYSTXFLIP1
       (.E(\v[token1][tick] ),
        .SPW_main_clk(SPW_main_clk),
        .buf_ff0_reg_0(\restx_seq_reg[txflip_n_0_1] ),
        .buf_ff0_reg_1(buf_ff0_reg),
        .\res_seq_reg[sysflip1] (\res_seq[token1][fctpiggy]_i_3_n_0 ),
        .\res_seq_reg[sysflip1]__0 (\res_seq_reg[sysflip1]__0 ),
        .\res_seq_reg[token1][char][7] (\res_seq_reg[token1][char][7]_0 ),
        .\res_seq_reg[tokmux] (SYNCSYSTXFLIP1_n_2),
        .\res_seq_reg[tokmux]__0 (\res_seq_reg[tokmux]__0 ),
        .syncdff_ff2_reg_0(SYNCSYSTXFLIP1_n_0),
        .vhavetoken0(vhavetoken0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1 SYNCTXSYSFLIP0
       (.SPW_TX_clk(SPW_TX_clk),
        .buf_ff0_reg_0(buf_ff0_reg_0),
        .\res_seq_reg[sysflip0]__0 (\res_seq_reg[sysflip0]__0 ),
        .\restx_seq_reg[b_mux]__0 (\restx_seq_reg[b_mux]__0 ),
        .\restx_seq_reg[b_txflip]__0 (\restx_seq_reg[b_txflip]__0 ),
        .\restx_seq_reg[b_update] (SYNCTXSYSFLIP0_n_2),
        .\restx_seq_reg[b_update]__0 (\restx_seq_reg[b_update]__0 ),
        .\restx_seq_reg[b_valid]__0 (\restx_seq_reg[b_valid]__0 ),
        .\restx_seq_reg[txflip0] (\restx_seq_reg[txflip_n_0_0] ),
        .syncdff_ff2_reg_0(SYNCTXSYSFLIP0_n_0),
        .syncdff_ff2_reg_1(SYNCTXSYSFLIP0_n_1),
        .\synctx[sysflip1] (\synctx[sysflip1] ),
        .\synctx[txen] (\synctx[txen] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2 SYNCTXSYSFLIP1
       (.SPW_TX_clk(SPW_TX_clk),
        .buf_ff0_reg_0(buf_ff0_reg_0),
        .\res_seq_reg[sysflip1]__0 (\res_seq_reg[sysflip1]__0 ),
        .\restx_seq_reg[b_mux]__0 (\restx_seq_reg[b_mux]__0 ),
        .\restx_seq_reg[b_update]__0 (\restx_seq_reg[b_update]__0 ),
        .\restx_seq_reg[txflip1] (\restx_seq_reg[txflip_n_0_1] ),
        .syncdff_ff2_reg_0(SYNCTXSYSFLIP1_n_1),
        .\synctx[sysflip1] (\synctx[sysflip1] ),
        .\synctx[txen] (\synctx[txen] ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3 SYNCTXTXDIVSAFE
       (.E(syncdff_ff2),
        .SPW_TX_clk(SPW_TX_clk),
        .buf_ff0_reg_0(buf_ff0_reg_0),
        .\res_seq_reg[txdivsafe]__0 (\res_seq_reg[txdivsafe]__0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4 SYNCTXTXEN
       (.E(SYNCTXTXEN_n_1),
        .Q(\restx_seq_reg[e_count_n_0_][0] ),
        .SPW_TX_clk(SPW_TX_clk),
        .buf_ff0_reg_0(buf_ff0_reg_0),
        .\res_seq_reg[txenreg]__0 (\res_seq_reg[txenreg]__0 ),
        .\restx_com[d_bits] (\restx_com[d_bits] [0]),
        .\restx_seq_reg[b_token][fct]__0 (\restx_seq_reg[b_token][fct]__0 ),
        .\restx_seq_reg[b_token][fctpiggy] (SYNCTXTXEN_n_3),
        .\restx_seq_reg[b_token][fctpiggy]__0 (\restx_seq_reg[b_token][fctpiggy]__0 ),
        .\restx_seq_reg[b_valid] (SYNCTXTXEN_n_4),
        .\restx_seq_reg[b_valid]_0 (SYNCTXTXEN_n_5),
        .\restx_seq_reg[b_valid]__0 (\restx_seq_reg[b_valid]__0 ),
        .\restx_seq_reg[c_busy] (\restx_seq_reg[c_update_n_0_] ),
        .\restx_seq_reg[c_busy]__0 (\restx_seq_reg[c_busy]__0 ),
        .\restx_seq_reg[d_bits][0] (\restx_seq_reg[c_fct_n_0_] ),
        .\restx_seq_reg[d_bits][0]_0 (\restx_seq_reg[c_esc_n_0_] ),
        .\restx_seq_reg[d_bits][0]_1 (\restx_seq_reg[c_bits_n_0_][0] ),
        .\restx_seq_reg[e_count][0] (SYNCTXTXEN_n_2),
        .\restx_seq_reg[e_parity] (\restx_seq_reg[e_shift_n_0_][1] ),
        .\restx_seq_reg[e_parity]_0 (\restx_seq_reg[d_bits_n_0_][0] ),
        .\restx_seq_reg[e_parity]__0 (\restx_seq_reg[e_parity]__0 ),
        .\restx_seq_reg[e_valid]__0 (\restx_seq_reg[e_valid]__0 ),
        .\restx_seq_reg[txclken]__0 (\restx_seq_reg[txclken]__0 ),
        .\synctx[txen] (\synctx[txen] ),
        .\vtx[b_update] (\vtx[b_update] ),
        .\vtx[e_parity]1_out (\vtx[e_parity]1_out ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    \res_seq[pend_data][8]_i_2 
       (.I0(\res_seq_reg[pend_char]_0 ),
        .I1(\res_seq_reg[allow_char]__0 ),
        .I2(\res_seq_reg[txfifo_rvalid]__0 ),
        .I3(\res_seq_reg[pend_char]__0 ),
        .I4(\res_seq_reg[txdiscard]__0 ),
        .O(\res_seq_reg[allow_char]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][0]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][0] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][1]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][1] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][2]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][2] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][3]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][3] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][4]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][4] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][5]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][5] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][6]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][6] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][char][7]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][7] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\res_seq[token1][char][7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \res_seq[token1][fct]_i_1 
       (.I0(\res_seq_reg[allow_fct]__0 ),
        .I1(\res_seq_reg[pend_fct]__0 ),
        .I2(\xmiti[fct_in] ),
        .O(vhavetoken0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hE0000000)) 
    \res_seq[token1][fctpiggy]_i_2 
       (.I0(\xmiti[fct_in] ),
        .I1(\res_seq_reg[pend_fct]__0 ),
        .I2(\res_seq_reg[allow_fct]__0 ),
        .I3(\res_seq_reg[pend_char]__0 ),
        .I4(\res_seq_reg[allow_char]__0 ),
        .O(\vtoken[fctpiggy] ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \res_seq[token1][fctpiggy]_i_3 
       (.I0(\res_seq_reg[allow_char]__0 ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .O(\res_seq[token1][fctpiggy]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \res_seq[token1][flag]_i_1 
       (.I0(\res_seq_reg[pend_data_n_0_][8] ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq_reg[allow_char]__0 ),
        .O(\vtoken[flag] ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'h00077777)) 
    \res_seq[tokmux]_i_3 
       (.I0(\res_seq_reg[pend_char]__0 ),
        .I1(\res_seq_reg[allow_char]__0 ),
        .I2(\xmiti[fct_in] ),
        .I3(\res_seq_reg[pend_fct]__0 ),
        .I4(\res_seq_reg[allow_fct]__0 ),
        .O(\res_seq[tokmux]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFF01)) 
    \res_seq[txdivnorm]_i_1 
       (.I0(\res_seq_reg[txdivsafe]__0 ),
        .I1(\res_seq_reg[txdivtmp] [0]),
        .I2(\res_seq_reg[txdivtmp] [1]),
        .I3(\res_seq_reg[txdivnorm]__0 ),
        .O(\res_seq[txdivnorm]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFF01)) 
    \res_seq[txdivreg][0]_i_1 
       (.I0(\res_seq_reg[txdivsafe]__0 ),
        .I1(\res_seq_reg[txdivtmp] [0]),
        .I2(\res_seq_reg[txdivtmp] [1]),
        .I3(\res_seq_reg[txdivreg] [0]),
        .O(\res_seq[txdivreg][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \res_seq[txdivreg][3]_i_1 
       (.I0(\res_seq_reg[txdivreg][5]_0 ),
        .I1(\res_seq_reg[txdivtmp] [1]),
        .I2(\res_seq_reg[txdivtmp] [0]),
        .I3(\res_seq_reg[txdivsafe]__0 ),
        .I4(\res_seq_reg[txdivreg] [3]),
        .O(\res_seq[txdivreg][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'hFFFD0001)) 
    \res_seq[txdivreg][5]_i_1 
       (.I0(\res_seq_reg[txdivreg][5]_0 ),
        .I1(\res_seq_reg[txdivtmp] [1]),
        .I2(\res_seq_reg[txdivtmp] [0]),
        .I3(\res_seq_reg[txdivsafe]__0 ),
        .I4(\res_seq_reg[txdivreg] [5]),
        .O(\res_seq[txdivreg][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \res_seq[txdivsafe]_i_1 
       (.I0(\res_seq_reg[txdivtmp] [1]),
        .I1(\res_seq_reg[txdivtmp] [0]),
        .I2(\res_seq_reg[txdivsafe]__0 ),
        .O(\res_seq[txdivsafe]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \res_seq[txdivtmp][0]_i_1 
       (.I0(\res_seq_reg[txdivtmp] [0]),
        .O(\res_com[txdivtmp] [0]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h98)) 
    \res_seq[txdivtmp][1]_i_1 
       (.I0(\res_seq_reg[txdivtmp] [0]),
        .I1(\res_seq_reg[txdivtmp] [1]),
        .I2(\res_seq_reg[txdivsafe]__0 ),
        .O(\res_com[txdivtmp] [1]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h55550001)) 
    \res_seq[txenreg]_i_1 
       (.I0(\res_seq_reg[token1][char][7]_0 ),
        .I1(\res_seq_reg[txdivsafe]__0 ),
        .I2(\res_seq_reg[txdivtmp] [0]),
        .I3(\res_seq_reg[txdivtmp] [1]),
        .I4(\res_seq_reg[txenreg]__0 ),
        .O(\res_seq[txenreg]_i_1_n_0 ));
  FDCE \res_seq_reg[allow_char] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\v[allow_char] ),
        .Q(\res_seq_reg[allow_char]__0 ));
  FDCE \res_seq_reg[allow_fct] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq_reg[allow_fct]_0 ),
        .Q(\res_seq_reg[allow_fct]__0 ));
  FDCE \res_seq_reg[pend_char] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP0_n_2),
        .Q(\res_seq_reg[pend_char]__0 ));
  FDCE \res_seq_reg[pend_data][0] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[0]),
        .Q(\res_seq_reg[pend_data_n_0_][0] ));
  FDCE \res_seq_reg[pend_data][1] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[1]),
        .Q(\res_seq_reg[pend_data_n_0_][1] ));
  FDCE \res_seq_reg[pend_data][2] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[2]),
        .Q(\res_seq_reg[pend_data_n_0_][2] ));
  FDCE \res_seq_reg[pend_data][3] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[3]),
        .Q(\res_seq_reg[pend_data_n_0_][3] ));
  FDCE \res_seq_reg[pend_data][4] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[4]),
        .Q(\res_seq_reg[pend_data_n_0_][4] ));
  FDCE \res_seq_reg[pend_data][5] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[5]),
        .Q(\res_seq_reg[pend_data_n_0_][5] ));
  FDCE \res_seq_reg[pend_data][6] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[6]),
        .Q(\res_seq_reg[pend_data_n_0_][6] ));
  FDCE \res_seq_reg[pend_data][7] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[7]),
        .Q(\res_seq_reg[pend_data_n_0_][7] ));
  FDCE \res_seq_reg[pend_data][8] 
       (.C(SPW_main_clk),
        .CE(E),
        .CLR(buf_ff0_reg),
        .D(D[8]),
        .Q(\res_seq_reg[pend_data_n_0_][8] ));
  FDCE \res_seq_reg[pend_fct] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP0_n_5),
        .Q(\res_seq_reg[pend_fct]__0 ));
  FDCE \res_seq_reg[sent_fct] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP0_n_1),
        .Q(\res_seq_reg[sent_fct]__0 ));
  FDCE \res_seq_reg[sysflip0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP0_n_3),
        .Q(\res_seq_reg[sysflip0]__0 ));
  FDCE \res_seq_reg[sysflip1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP1_n_2),
        .Q(\res_seq_reg[sysflip1]__0 ));
  FDCE \res_seq_reg[token0][char][0] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][0]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [0]));
  FDCE \res_seq_reg[token0][char][1] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][1]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [1]));
  FDCE \res_seq_reg[token0][char][2] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][2]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [2]));
  FDCE \res_seq_reg[token0][char][3] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][3]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [3]));
  FDCE \res_seq_reg[token0][char][4] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][4]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [4]));
  FDCE \res_seq_reg[token0][char][5] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][5]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [5]));
  FDCE \res_seq_reg[token0][char][6] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][6]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [6]));
  FDCE \res_seq_reg[token0][char][7] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][7]_i_1_n_0 ),
        .Q(\res_seq_reg[token0][char] [7]));
  FDCE \res_seq_reg[token0][fct] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(vhavetoken0),
        .Q(\res_seq_reg[token0][fct_n_0_] ));
  FDCE \res_seq_reg[token0][fctpiggy] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\vtoken[fctpiggy] ),
        .Q(\res_seq_reg[token0][fctpiggy_n_0_] ));
  FDCE \res_seq_reg[token0][flag] 
       (.C(SPW_main_clk),
        .CE(\v[token0][tick] ),
        .CLR(buf_ff0_reg),
        .D(\vtoken[flag] ),
        .Q(\res_seq_reg[token0][flag_n_0_] ));
  FDCE \res_seq_reg[token1][char][0] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][0]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [0]));
  FDCE \res_seq_reg[token1][char][1] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][1]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [1]));
  FDCE \res_seq_reg[token1][char][2] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][2]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [2]));
  FDCE \res_seq_reg[token1][char][3] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][3]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [3]));
  FDCE \res_seq_reg[token1][char][4] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][4]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [4]));
  FDCE \res_seq_reg[token1][char][5] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][5]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [5]));
  FDCE \res_seq_reg[token1][char][6] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][6]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [6]));
  FDCE \res_seq_reg[token1][char][7] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\res_seq[token1][char][7]_i_1_n_0 ),
        .Q(\res_seq_reg[token1][char] [7]));
  FDCE \res_seq_reg[token1][fct] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(vhavetoken0),
        .Q(\res_seq_reg[token1][fct_n_0_] ));
  FDCE \res_seq_reg[token1][fctpiggy] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\vtoken[fctpiggy] ),
        .Q(\res_seq_reg[token1][fctpiggy_n_0_] ));
  FDCE \res_seq_reg[token1][flag] 
       (.C(SPW_main_clk),
        .CE(\v[token1][tick] ),
        .CLR(buf_ff0_reg),
        .D(\vtoken[flag] ),
        .Q(\res_seq_reg[token1][flag_n_0_] ));
  FDCE \res_seq_reg[tokmux] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(SYNCSYSTXFLIP0_n_4),
        .Q(\res_seq_reg[tokmux]__0 ));
  FDCE \res_seq_reg[txdivnorm] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txdivnorm]_i_1_n_0 ),
        .Q(\res_seq_reg[txdivnorm]__0 ));
  FDCE \res_seq_reg[txdivreg][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txdivreg][0]_i_1_n_0 ),
        .Q(\res_seq_reg[txdivreg] [0]));
  FDCE \res_seq_reg[txdivreg][3] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txdivreg][3]_i_1_n_0 ),
        .Q(\res_seq_reg[txdivreg] [3]));
  FDCE \res_seq_reg[txdivreg][5] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txdivreg][5]_i_1_n_0 ),
        .Q(\res_seq_reg[txdivreg] [5]));
  FDCE \res_seq_reg[txdivsafe] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txdivsafe]_i_1_n_0 ),
        .Q(\res_seq_reg[txdivsafe]__0 ));
  FDCE \res_seq_reg[txdivtmp][0] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_com[txdivtmp] [0]),
        .Q(\res_seq_reg[txdivtmp] [0]));
  FDCE \res_seq_reg[txdivtmp][1] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_com[txdivtmp] [1]),
        .Q(\res_seq_reg[txdivtmp] [1]));
  FDCE \res_seq_reg[txenreg] 
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg),
        .D(\res_seq[txenreg]_i_1_n_0 ),
        .Q(\res_seq_reg[txenreg]__0 ));
  LUT3 #(
    .INIT(8'h07)) 
    \restx_com[txclkpre] 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][0] ),
        .I1(\restx_seq_reg[txclkpre]__0 ),
        .I2(\restx_seq_reg[txdivnorm_n_0_] ),
        .O(\restx_com[txclkpre]__0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][0]_i_1 
       (.I0(\res_seq_reg[token1][char] [0]),
        .I1(\res_seq_reg[token0][char] [0]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][1]_i_1 
       (.I0(\res_seq_reg[token1][char] [1]),
        .I1(\res_seq_reg[token0][char] [1]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][2]_i_1 
       (.I0(\res_seq_reg[token1][char] [2]),
        .I1(\res_seq_reg[token0][char] [2]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][3]_i_1 
       (.I0(\res_seq_reg[token1][char] [3]),
        .I1(\res_seq_reg[token0][char] [3]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][4]_i_1 
       (.I0(\res_seq_reg[token1][char] [4]),
        .I1(\res_seq_reg[token0][char] [4]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][5]_i_1 
       (.I0(\res_seq_reg[token1][char] [5]),
        .I1(\res_seq_reg[token0][char] [5]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][6]_i_1 
       (.I0(\res_seq_reg[token1][char] [6]),
        .I1(\res_seq_reg[token0][char] [6]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \restx_seq[b_token][char][7]_i_1 
       (.I0(\res_seq_reg[token1][char] [7]),
        .I1(\res_seq_reg[token0][char] [7]),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .O(\restx_seq[b_token][char][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[b_token][fct]_i_1 
       (.I0(\res_seq_reg[token1][fct_n_0_] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\res_seq_reg[token0][fct_n_0_] ),
        .O(\restx_seq[b_token][fct]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[b_token][fctpiggy]_i_1 
       (.I0(\res_seq_reg[token1][fctpiggy_n_0_] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\res_seq_reg[token0][fctpiggy_n_0_] ),
        .O(\restx_seq[b_token][fctpiggy]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[b_token][flag]_i_1 
       (.I0(\res_seq_reg[token1][flag_n_0_] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\res_seq_reg[token0][flag_n_0_] ),
        .O(\restx_seq[b_token][flag]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[b_txflip]_i_1 
       (.I0(\restx_seq_reg[txflip_n_0_1] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\restx_seq_reg[txflip_n_0_0] ),
        .O(\restx_com[b_txflip] ));
  LUT3 #(
    .INIT(8'h74)) 
    \restx_seq[c_bits][2]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [0]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .I2(\restx_seq_reg[b_token][char] [1]),
        .O(\restx_seq[c_bits][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][3]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [2]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][4]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [3]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][5]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [4]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][6]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [5]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][7]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [6]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \restx_seq[c_bits][8]_i_1 
       (.I0(\restx_seq_reg[b_token][char] [7]),
        .I1(\restx_seq_reg[b_token][flag]__0 ),
        .O(\restx_seq[c_bits][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'hF2FF)) 
    \restx_seq[d_bits][1]_i_1 
       (.I0(\restx_seq_reg[c_bits_n_0_][1] ),
        .I1(\restx_seq_reg[c_fct_n_0_] ),
        .I2(\restx_seq_reg[c_esc_n_0_] ),
        .I3(\synctx[txen] ),
        .O(\restx_com[d_bits] [1]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'hF2FF)) 
    \restx_seq[d_bits][2]_i_1 
       (.I0(\restx_seq_reg[c_bits_n_0_][2] ),
        .I1(\restx_seq_reg[c_fct_n_0_] ),
        .I2(\restx_seq_reg[c_esc_n_0_] ),
        .I3(\synctx[txen] ),
        .O(\restx_com[d_bits] [2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][3]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][3] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [3]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][4]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][4] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [4]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][5]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][5] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [5]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][6]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][6] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [6]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][7]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][7] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [7]));
  LUT4 #(
    .INIT(16'h0020)) 
    \restx_seq[d_bits][8]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[c_esc_n_0_] ),
        .I2(\restx_seq_reg[c_bits_n_0_][8] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\restx_com[d_bits] [8]));
  LUT3 #(
    .INIT(8'h4F)) 
    \restx_seq[e_count][0]_i_1 
       (.I0(\restx_seq_reg[e_count_n_0_][0] ),
        .I1(\restx_seq_reg[e_count_n_0_][1] ),
        .I2(\synctx[txen] ),
        .O(\restx_com[e_count] [0]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][1]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][2] ),
        .O(\restx_com[e_count] [1]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][2]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(p_0_in),
        .O(\restx_com[e_count] [2]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    \restx_seq[e_count][3]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][4] ),
        .I2(\restx_seq_reg[e_count_n_0_][0] ),
        .I3(\restx_seq_reg[d_bits_n_0_][0] ),
        .O(\restx_com[e_count] [3]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][4]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][5] ),
        .O(\restx_com[e_count] [4]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][5]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][6] ),
        .O(\restx_com[e_count] [5]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][6]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][7] ),
        .O(\restx_com[e_count] [6]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][7]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][8] ),
        .O(\restx_com[e_count] [7]));
  LUT3 #(
    .INIT(8'h20)) 
    \restx_seq[e_count][8]_i_1 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_count_n_0_][9] ),
        .O(\restx_com[e_count] [8]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \restx_seq[e_count][9]_i_2 
       (.I0(\synctx[txen] ),
        .I1(\restx_seq_reg[d_cnt10]__0 ),
        .I2(\restx_seq_reg[e_count_n_0_][0] ),
        .O(\restx_com[e_count] [9]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h9F90)) 
    \restx_seq[e_shift][0]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][0] ),
        .I1(\restx_seq_reg[e_parity]__0 ),
        .I2(\restx_seq_reg[e_count_n_0_][0] ),
        .I3(\restx_seq_reg[e_shift_n_0_][1] ),
        .O(\restx_seq[e_shift][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][1]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][0] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][2] ),
        .O(\restx_seq[e_shift][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][2]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][1] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][3] ),
        .O(\restx_seq[e_shift][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][3]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][2] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][4] ),
        .O(\restx_seq[e_shift][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][4]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][3] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][5] ),
        .O(\restx_seq[e_shift][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][5]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][4] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][6] ),
        .O(\restx_seq[e_shift][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][6]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][5] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][7] ),
        .O(\restx_seq[e_shift][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][7]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][6] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][8] ),
        .O(\restx_seq[e_shift][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \restx_seq[e_shift][8]_i_1 
       (.I0(\restx_seq_reg[d_bits_n_0_][7] ),
        .I1(\restx_seq_reg[e_count_n_0_][0] ),
        .I2(\restx_seq_reg[e_shift_n_0_][9] ),
        .O(\restx_seq[e_shift][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \restx_seq[e_shift][9]_i_1 
       (.I0(\restx_seq_reg[e_count_n_0_][0] ),
        .I1(\restx_seq_reg[d_bits_n_0_][8] ),
        .O(\restx_seq[e_shift][9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \restx_seq[f_spwdo]_i_1 
       (.I0(\restx_seq_reg[e_shift_n_0_][0] ),
        .I1(\restx_seq_reg[e_valid]__0 ),
        .I2(\restx_seq_reg[f_spwdo]__0 ),
        .I3(\restx_seq_reg[f_spwso]__0 ),
        .O(\restx_seq[f_spwdo]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \restx_seq[txclkcnt][0]_i_1 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][0] ),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(\restx_seq_reg[txclkcnt_n_0_][0] ),
        .O(\restx_com[txclkcnt] [0]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'hB88B)) 
    \restx_seq[txclkcnt][1]_i_1 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][5] ),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(\restx_seq_reg[txclkcnt_n_0_][0] ),
        .I3(\restx_seq_reg[txclkcnt_n_0_][1] ),
        .O(\restx_com[txclkcnt] [1]));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \restx_seq[txclkcnt][2]_i_1 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][5] ),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(p_1_in[0]),
        .I3(\restx_seq_reg[txclkcy_n_0_][0] ),
        .O(\restx_com[txclkcnt] [2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hBB8B88B8)) 
    \restx_seq[txclkcnt][3]_i_1 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][3] ),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(\restx_seq_reg[txclkcy_n_0_][0] ),
        .I3(p_1_in[0]),
        .I4(p_1_in[1]),
        .O(\restx_com[txclkcnt] [3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \restx_seq[txclkcnt][4]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(p_0_in38_in),
        .I2(p_1_in2_in[0]),
        .O(\restx_seq[txclkcnt][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hBB8B88B8)) 
    \restx_seq[txclkcnt][5]_i_1 
       (.I0(\restx_seq_reg[txclkdiv_n_0_][5] ),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(p_0_in38_in),
        .I3(p_1_in2_in[0]),
        .I4(p_1_in2_in[1]),
        .O(\restx_com[txclkcnt] [5]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \restx_seq[txclkcnt][6]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(\restx_seq_reg[txclkcy_n_0_][2] ),
        .I2(p_1_in5_in[0]),
        .O(\restx_seq[txclkcnt][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h4144)) 
    \restx_seq[txclkcnt][7]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(p_1_in5_in[1]),
        .I2(p_1_in5_in[0]),
        .I3(\restx_seq_reg[txclkcy_n_0_][2] ),
        .O(\restx_seq[txclkcnt][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \restx_seq[txclkcy][0]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(\restx_seq_reg[txclkcnt_n_0_][1] ),
        .I2(\restx_seq_reg[txclkcnt_n_0_][0] ),
        .O(\restx_seq[txclkcy][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \restx_seq[txclkcy][1]_i_1 
       (.I0(p_1_in[0]),
        .I1(p_1_in[1]),
        .I2(\restx_seq_reg[txclkcy_n_0_][0] ),
        .I3(\restx_seq_reg[txclken]__0 ),
        .O(\restx_seq[txclkcy][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \restx_seq[txclkcy][2]_i_1 
       (.I0(p_1_in2_in[0]),
        .I1(p_1_in2_in[1]),
        .I2(p_0_in38_in),
        .I3(\restx_seq_reg[txclken]__0 ),
        .O(\restx_seq[txclkcy][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \restx_seq[txclkdone][0]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(\restx_seq_reg[txclkcnt_n_0_][0] ),
        .I2(p_1_in[1]),
        .I3(p_1_in[0]),
        .I4(\restx_seq_reg[txclkcnt_n_0_][1] ),
        .O(\restx_seq[txclkdone][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \restx_seq[txclkdone][1]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(p_1_in2_in[1]),
        .I2(p_1_in2_in[0]),
        .I3(p_1_in5_in[0]),
        .I4(p_1_in5_in[1]),
        .O(\restx_seq[txclkdone][1]_i_1_n_0 ));
  FDCE \restx_seq_reg[b_mux] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(SYNCTXSYSFLIP0_n_1),
        .Q(\restx_seq_reg[b_mux]__0 ));
  FDCE \restx_seq_reg[b_token][char][0] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][0]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [0]));
  FDCE \restx_seq_reg[b_token][char][1] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][1]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [1]));
  FDCE \restx_seq_reg[b_token][char][2] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][2]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [2]));
  FDCE \restx_seq_reg[b_token][char][3] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][3]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [3]));
  FDCE \restx_seq_reg[b_token][char][4] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][4]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [4]));
  FDCE \restx_seq_reg[b_token][char][5] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][5]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [5]));
  FDCE \restx_seq_reg[b_token][char][6] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][6]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [6]));
  FDCE \restx_seq_reg[b_token][char][7] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][char][7]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][char] [7]));
  FDCE \restx_seq_reg[b_token][fct] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][fct]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][fct]__0 ));
  FDCE \restx_seq_reg[b_token][fctpiggy] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][fctpiggy]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][fctpiggy]__0 ));
  FDCE \restx_seq_reg[b_token][flag] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[b_update]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[b_token][flag]_i_1_n_0 ),
        .Q(\restx_seq_reg[b_token][flag]__0 ));
  FDCE \restx_seq_reg[b_txflip] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[b_txflip] ),
        .Q(\restx_seq_reg[b_txflip]__0 ));
  FDCE \restx_seq_reg[b_update] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\vtx[b_update] ),
        .Q(\restx_seq_reg[b_update]__0 ));
  FDCE \restx_seq_reg[b_valid] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(SYNCTXSYSFLIP0_n_2),
        .Q(\restx_seq_reg[b_valid]__0 ));
  FDPE \restx_seq_reg[c_bits][0] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .D(\restx_seq_reg[b_token][flag]__0 ),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[c_bits_n_0_][0] ));
  FDCE \restx_seq_reg[c_bits][1] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq_reg[b_token][char] [0]),
        .Q(\restx_seq_reg[c_bits_n_0_][1] ));
  FDPE \restx_seq_reg[c_bits][2] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .D(\restx_seq[c_bits][2]_i_1_n_0 ),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[c_bits_n_0_][2] ));
  FDCE \restx_seq_reg[c_bits][3] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][3]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][3] ));
  FDCE \restx_seq_reg[c_bits][4] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][4]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][4] ));
  FDCE \restx_seq_reg[c_bits][5] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][5]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][5] ));
  FDCE \restx_seq_reg[c_bits][6] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][6]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][6] ));
  FDCE \restx_seq_reg[c_bits][7] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][7]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][7] ));
  FDCE \restx_seq_reg[c_bits][8] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[c_update_n_0_] ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[c_bits][8]_i_1_n_0 ),
        .Q(\restx_seq_reg[c_bits_n_0_][8] ));
  FDPE \restx_seq_reg[c_busy] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(SYNCTXTXEN_n_3),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[c_busy]__0 ));
  FDPE \restx_seq_reg[c_esc] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(SYNCTXTXEN_n_5),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[c_esc_n_0_] ));
  FDPE \restx_seq_reg[c_fct] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(SYNCTXTXEN_n_4),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[c_fct_n_0_] ));
  FDCE \restx_seq_reg[c_update] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\vtx[c_update]__0 ),
        .Q(\restx_seq_reg[c_update_n_0_] ));
  FDPE \restx_seq_reg[d_bits][0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(\restx_com[d_bits] [0]),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[d_bits_n_0_][0] ));
  FDPE \restx_seq_reg[d_bits][1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(\restx_com[d_bits] [1]),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[d_bits_n_0_][1] ));
  FDPE \restx_seq_reg[d_bits][2] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(\restx_com[d_bits] [2]),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[d_bits_n_0_][2] ));
  FDCE \restx_seq_reg[d_bits][3] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [3]),
        .Q(\restx_seq_reg[d_bits_n_0_][3] ));
  FDCE \restx_seq_reg[d_bits][4] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [4]),
        .Q(\restx_seq_reg[d_bits_n_0_][4] ));
  FDCE \restx_seq_reg[d_bits][5] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [5]),
        .Q(\restx_seq_reg[d_bits_n_0_][5] ));
  FDCE \restx_seq_reg[d_bits][6] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [6]),
        .Q(\restx_seq_reg[d_bits_n_0_][6] ));
  FDCE \restx_seq_reg[d_bits][7] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [7]),
        .Q(\restx_seq_reg[d_bits_n_0_][7] ));
  FDCE \restx_seq_reg[d_bits][8] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[d_bits] [8]),
        .Q(\restx_seq_reg[d_bits_n_0_][8] ));
  FDCE \restx_seq_reg[d_cnt10] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\vtx[d_cnt10]__0 ),
        .Q(\restx_seq_reg[d_cnt10]__0 ));
  FDPE \restx_seq_reg[e_count][0] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .D(\restx_com[e_count] [0]),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[e_count_n_0_][0] ));
  FDCE \restx_seq_reg[e_count][1] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [1]),
        .Q(\restx_seq_reg[e_count_n_0_][1] ));
  FDCE \restx_seq_reg[e_count][2] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [2]),
        .Q(\restx_seq_reg[e_count_n_0_][2] ));
  FDCE \restx_seq_reg[e_count][3] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [3]),
        .Q(p_0_in));
  FDCE \restx_seq_reg[e_count][4] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [4]),
        .Q(\restx_seq_reg[e_count_n_0_][4] ));
  FDCE \restx_seq_reg[e_count][5] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [5]),
        .Q(\restx_seq_reg[e_count_n_0_][5] ));
  FDCE \restx_seq_reg[e_count][6] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [6]),
        .Q(\restx_seq_reg[e_count_n_0_][6] ));
  FDCE \restx_seq_reg[e_count][7] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [7]),
        .Q(\restx_seq_reg[e_count_n_0_][7] ));
  FDCE \restx_seq_reg[e_count][8] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [8]),
        .Q(\restx_seq_reg[e_count_n_0_][8] ));
  FDCE \restx_seq_reg[e_count][9] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[e_count] [9]),
        .Q(\restx_seq_reg[e_count_n_0_][9] ));
  FDCE \restx_seq_reg[e_parity] 
       (.C(SPW_TX_clk),
        .CE(SYNCTXTXEN_n_1),
        .CLR(buf_ff0_reg_0),
        .D(\vtx[e_parity]1_out ),
        .Q(\restx_seq_reg[e_parity]__0 ));
  FDCE \restx_seq_reg[e_shift][0] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][0]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][0] ));
  FDCE \restx_seq_reg[e_shift][1] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][1]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][1] ));
  FDCE \restx_seq_reg[e_shift][2] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][2]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][2] ));
  FDCE \restx_seq_reg[e_shift][3] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][3]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][3] ));
  FDCE \restx_seq_reg[e_shift][4] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][4]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][4] ));
  FDCE \restx_seq_reg[e_shift][5] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][5]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][5] ));
  FDCE \restx_seq_reg[e_shift][6] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][6]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][6] ));
  FDCE \restx_seq_reg[e_shift][7] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][7]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][7] ));
  FDCE \restx_seq_reg[e_shift][8] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][8]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][8] ));
  FDCE \restx_seq_reg[e_shift][9] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[e_shift][9]_i_1_n_0 ),
        .Q(\restx_seq_reg[e_shift_n_0_][9] ));
  FDCE \restx_seq_reg[e_valid] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(SYNCTXTXEN_n_2),
        .Q(\restx_seq_reg[e_valid]__0 ));
  FDCE \restx_seq_reg[f_spwdo] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[f_spwdo]_i_1_n_0 ),
        .Q(\restx_seq_reg[f_spwdo]__0 ));
  FDCE \restx_seq_reg[f_spwso] 
       (.C(SPW_TX_clk),
        .CE(\restx_seq_reg[txclken]__0 ),
        .CLR(buf_ff0_reg_0),
        .D(\vtx[f_spwso]__0 ),
        .Q(\restx_seq_reg[f_spwso]__0 ));
  FDCE \restx_seq_reg[txclkcnt][0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclkcnt] [0]),
        .Q(\restx_seq_reg[txclkcnt_n_0_][0] ));
  FDCE \restx_seq_reg[txclkcnt][1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclkcnt] [1]),
        .Q(\restx_seq_reg[txclkcnt_n_0_][1] ));
  FDCE \restx_seq_reg[txclkcnt][2] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclkcnt] [2]),
        .Q(p_1_in[0]));
  FDCE \restx_seq_reg[txclkcnt][3] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclkcnt] [3]),
        .Q(p_1_in[1]));
  FDCE \restx_seq_reg[txclkcnt][4] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcnt][4]_i_1_n_0 ),
        .Q(p_1_in2_in[0]));
  FDCE \restx_seq_reg[txclkcnt][5] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclkcnt] [5]),
        .Q(p_1_in2_in[1]));
  FDCE \restx_seq_reg[txclkcnt][6] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcnt][6]_i_1_n_0 ),
        .Q(p_1_in5_in[0]));
  FDCE \restx_seq_reg[txclkcnt][7] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcnt][7]_i_1_n_0 ),
        .Q(p_1_in5_in[1]));
  FDCE \restx_seq_reg[txclkcy][0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcy][0]_i_1_n_0 ),
        .Q(\restx_seq_reg[txclkcy_n_0_][0] ));
  FDCE \restx_seq_reg[txclkcy][1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcy][1]_i_1_n_0 ),
        .Q(p_0_in38_in));
  FDCE \restx_seq_reg[txclkcy][2] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkcy][2]_i_1_n_0 ),
        .Q(\restx_seq_reg[txclkcy_n_0_][2] ));
  FDCE \restx_seq_reg[txclkdiv][0] 
       (.C(SPW_TX_clk),
        .CE(syncdff_ff2),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txdivreg] [0]),
        .Q(\restx_seq_reg[txclkdiv_n_0_][0] ));
  FDCE \restx_seq_reg[txclkdiv][3] 
       (.C(SPW_TX_clk),
        .CE(syncdff_ff2),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txdivreg] [3]),
        .Q(\restx_seq_reg[txclkdiv_n_0_][3] ));
  FDCE \restx_seq_reg[txclkdiv][5] 
       (.C(SPW_TX_clk),
        .CE(syncdff_ff2),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txdivreg] [5]),
        .Q(\restx_seq_reg[txclkdiv_n_0_][5] ));
  FDCE \restx_seq_reg[txclkdone][0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkdone][0]_i_1_n_0 ),
        .Q(\restx_seq_reg[txclkdone_n_0_][0] ));
  FDCE \restx_seq_reg[txclkdone][1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq[txclkdone][1]_i_1_n_0 ),
        .Q(\restx_seq_reg[txclkdone_n_0_][1] ));
  FDCE \restx_seq_reg[txclken] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_com[txclken] ),
        .Q(\restx_seq_reg[txclken]__0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \restx_seq_reg[txclken]0 
       (.I0(\restx_seq_reg[txclkdone_n_0_][1] ),
        .I1(\restx_seq_reg[txclkdone_n_0_][0] ),
        .I2(\restx_seq_reg[txclkpre]__0 ),
        .O(\restx_com[txclken] ));
  FDPE \restx_seq_reg[txclkpre] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .D(\restx_com[txclkpre]__0 ),
        .PRE(buf_ff0_reg_0),
        .Q(\restx_seq_reg[txclkpre]__0 ));
  FDCE \restx_seq_reg[txdivnorm] 
       (.C(SPW_TX_clk),
        .CE(syncdff_ff2),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txdivnorm]__0 ),
        .Q(\restx_seq_reg[txdivnorm_n_0_] ));
  FDCE \restx_seq_reg[txflip0] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(SYNCTXSYSFLIP0_n_0),
        .Q(\restx_seq_reg[txflip_n_0_0] ));
  FDCE \restx_seq_reg[txflip1] 
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(SYNCTXSYSFLIP1_n_1),
        .Q(\restx_seq_reg[txflip_n_0_1] ));
  FDCE s_spwdo_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq_reg[f_spwdo]__0 ),
        .Q(SPW_Dout));
  FDCE s_spwso_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\restx_seq_reg[f_spwso]__0 ),
        .Q(SPW_Sout));
  LUT5 #(
    .INIT(32'hAAAA8AAA)) 
    \vstate[rx_credit]0_carry__0_i_1 
       (.I0(\recvo[rxchar] ),
        .I1(\res_seq_reg[pend_fct]__0 ),
        .I2(\xmiti[fct_in] ),
        .I3(\res_seq_reg[allow_fct]__0 ),
        .I4(\res_seq_reg[token1][char][7]_0 ),
        .O(DI));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \vtx[c_update] 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(\synctx[txen] ),
        .I2(p_0_in),
        .O(\vtx[c_update]__0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \vtx[d_cnt10] 
       (.I0(\restx_seq_reg[c_esc_n_0_] ),
        .I1(\restx_seq_reg[c_bits_n_0_][0] ),
        .I2(\synctx[txen] ),
        .I3(\restx_seq_reg[c_fct_n_0_] ),
        .O(\vtx[d_cnt10]__0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h2882)) 
    \vtx[f_spwso] 
       (.I0(\restx_seq_reg[e_valid]__0 ),
        .I1(\restx_seq_reg[f_spwso]__0 ),
        .I2(\restx_seq_reg[e_shift_n_0_][0] ),
        .I3(\restx_seq_reg[f_spwdo]__0 ),
        .O(\vtx[f_spwso]__0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff
   (E,
    \res_seq_reg[allow_fct] ,
    \res_seq_reg[allow_char] ,
    \res_seq_reg[tokmux] ,
    \res_seq_reg[sysflip1] ,
    \res_seq_reg[pend_fct] ,
    buf_ff0_reg_0,
    SPW_main_clk,
    buf_ff0_reg_1,
    \res_seq_reg[sysflip0] ,
    vhavetoken0,
    \res_seq_reg[tokmux]__0 ,
    \res_seq_reg[sysflip0]__0 ,
    \res_seq_reg[token0][char][7] ,
    \res_seq_reg[sysflip1]__0 ,
    \res_seq_reg[tokmux]_0 ,
    \res_seq_reg[pend_fct]_0 ,
    \res_seq_reg[pend_fct]_1 ,
    \xmiti[fct_in] ,
    \res_seq_reg[sent_fct]__0 ,
    \res_seq_reg[allow_char]__0 ,
    \res_seq_reg[pend_char]__0 ,
    \res_seq_reg[pend_char] ,
    \res_seq_reg[tokmux]_1 );
  output [0:0]E;
  output \res_seq_reg[allow_fct] ;
  output \res_seq_reg[allow_char] ;
  output \res_seq_reg[tokmux] ;
  output \res_seq_reg[sysflip1] ;
  output \res_seq_reg[pend_fct] ;
  input buf_ff0_reg_0;
  input SPW_main_clk;
  input buf_ff0_reg_1;
  input \res_seq_reg[sysflip0] ;
  input vhavetoken0;
  input \res_seq_reg[tokmux]__0 ;
  input \res_seq_reg[sysflip0]__0 ;
  input \res_seq_reg[token0][char][7] ;
  input \res_seq_reg[sysflip1]__0 ;
  input \res_seq_reg[tokmux]_0 ;
  input \res_seq_reg[pend_fct]_0 ;
  input \res_seq_reg[pend_fct]_1 ;
  input \xmiti[fct_in] ;
  input \res_seq_reg[sent_fct]__0 ;
  input \res_seq_reg[allow_char]__0 ;
  input \res_seq_reg[pend_char]__0 ;
  input \res_seq_reg[pend_char] ;
  input \res_seq_reg[tokmux]_1 ;

  wire [0:0]E;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_1;
  wire buf_ff0_reg_n_0;
  wire \res_seq[sent_fct]_i_2_n_0 ;
  wire \res_seq[tokmux]_i_2_n_0 ;
  wire \res_seq_reg[allow_char] ;
  wire \res_seq_reg[allow_char]__0 ;
  wire \res_seq_reg[allow_fct] ;
  wire \res_seq_reg[pend_char] ;
  wire \res_seq_reg[pend_char]__0 ;
  wire \res_seq_reg[pend_fct] ;
  wire \res_seq_reg[pend_fct]_0 ;
  wire \res_seq_reg[pend_fct]_1 ;
  wire \res_seq_reg[sent_fct]__0 ;
  wire \res_seq_reg[sysflip0] ;
  wire \res_seq_reg[sysflip0]__0 ;
  wire \res_seq_reg[sysflip1] ;
  wire \res_seq_reg[sysflip1]__0 ;
  wire \res_seq_reg[token0][char][7] ;
  wire \res_seq_reg[tokmux] ;
  wire \res_seq_reg[tokmux]_0 ;
  wire \res_seq_reg[tokmux]_1 ;
  wire \res_seq_reg[tokmux]__0 ;
  wire syncdff_ff1_reg_n_0;
  wire syncdff_ff2_reg_n_0;
  wire vhavetoken0;
  wire \xmiti[fct_in] ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(buf_ff0_reg_0),
        .Q(buf_ff0_reg_n_0));
  LUT5 #(
    .INIT(32'h0000C4FF)) 
    \res_seq[pend_char]_i_1 
       (.I0(\res_seq_reg[allow_char]__0 ),
        .I1(\res_seq_reg[pend_char]__0 ),
        .I2(\res_seq[sent_fct]_i_2_n_0 ),
        .I3(\res_seq_reg[pend_char] ),
        .I4(\res_seq_reg[token0][char][7] ),
        .O(\res_seq_reg[allow_char] ));
  LUT5 #(
    .INIT(32'h0000AC8C)) 
    \res_seq[pend_fct]_i_1 
       (.I0(\res_seq[sent_fct]_i_2_n_0 ),
        .I1(\res_seq_reg[pend_fct]_1 ),
        .I2(\res_seq_reg[pend_fct]_0 ),
        .I3(\xmiti[fct_in] ),
        .I4(\res_seq_reg[token0][char][7] ),
        .O(\res_seq_reg[pend_fct] ));
  LUT6 #(
    .INIT(64'h5555555510101000)) 
    \res_seq[sent_fct]_i_1 
       (.I0(\res_seq_reg[token0][char][7] ),
        .I1(\res_seq[sent_fct]_i_2_n_0 ),
        .I2(\res_seq_reg[pend_fct]_0 ),
        .I3(\res_seq_reg[pend_fct]_1 ),
        .I4(\xmiti[fct_in] ),
        .I5(\res_seq_reg[sent_fct]__0 ),
        .O(\res_seq_reg[allow_fct] ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h0FF06666)) 
    \res_seq[sent_fct]_i_2 
       (.I0(\res_seq_reg[sysflip0]__0 ),
        .I1(syncdff_ff2_reg_n_0),
        .I2(\res_seq_reg[sysflip1]__0 ),
        .I3(\res_seq_reg[tokmux]_0 ),
        .I4(\res_seq_reg[tokmux]__0 ),
        .O(\res_seq[sent_fct]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5504555500000051)) 
    \res_seq[sysflip0]_i_1 
       (.I0(\res_seq_reg[token0][char][7] ),
        .I1(\res_seq_reg[sysflip0] ),
        .I2(vhavetoken0),
        .I3(\res_seq_reg[tokmux]__0 ),
        .I4(syncdff_ff2_reg_n_0),
        .I5(\res_seq_reg[sysflip0]__0 ),
        .O(\res_seq_reg[tokmux] ));
  LUT6 #(
    .INIT(64'h000000000D00000D)) 
    \res_seq[token0][fctpiggy]_i_1 
       (.I0(\res_seq_reg[sysflip0] ),
        .I1(vhavetoken0),
        .I2(\res_seq_reg[tokmux]__0 ),
        .I3(syncdff_ff2_reg_n_0),
        .I4(\res_seq_reg[sysflip0]__0 ),
        .I5(\res_seq_reg[token0][char][7] ),
        .O(E));
  LUT6 #(
    .INIT(64'h00000000FF00BEAA)) 
    \res_seq[tokmux]_i_1 
       (.I0(\res_seq[tokmux]_i_2_n_0 ),
        .I1(\res_seq_reg[sysflip1]__0 ),
        .I2(\res_seq_reg[tokmux]_0 ),
        .I3(\res_seq_reg[tokmux]__0 ),
        .I4(\res_seq_reg[tokmux]_1 ),
        .I5(\res_seq_reg[token0][char][7] ),
        .O(\res_seq_reg[sysflip1] ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h41)) 
    \res_seq[tokmux]_i_2 
       (.I0(\res_seq_reg[tokmux]__0 ),
        .I1(syncdff_ff2_reg_n_0),
        .I2(\res_seq_reg[sysflip0]__0 ),
        .O(\res_seq[tokmux]_i_2_n_0 ));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_n_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0
   (syncdff_ff2_reg_0,
    E,
    \res_seq_reg[tokmux] ,
    buf_ff0_reg_0,
    SPW_main_clk,
    buf_ff0_reg_1,
    \res_seq_reg[sysflip1] ,
    vhavetoken0,
    \res_seq_reg[tokmux]__0 ,
    \res_seq_reg[sysflip1]__0 ,
    \res_seq_reg[token1][char][7] );
  output syncdff_ff2_reg_0;
  output [0:0]E;
  output \res_seq_reg[tokmux] ;
  input buf_ff0_reg_0;
  input SPW_main_clk;
  input buf_ff0_reg_1;
  input \res_seq_reg[sysflip1] ;
  input vhavetoken0;
  input \res_seq_reg[tokmux]__0 ;
  input \res_seq_reg[sysflip1]__0 ;
  input \res_seq_reg[token1][char][7] ;

  wire [0:0]E;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_1;
  wire buf_ff0_reg_n_0;
  wire \res_seq_reg[sysflip1] ;
  wire \res_seq_reg[sysflip1]__0 ;
  wire \res_seq_reg[token1][char][7] ;
  wire \res_seq_reg[tokmux] ;
  wire \res_seq_reg[tokmux]__0 ;
  wire syncdff_ff1_reg_n_0;
  wire syncdff_ff2_reg_0;
  wire vhavetoken0;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(buf_ff0_reg_0),
        .Q(buf_ff0_reg_n_0));
  LUT6 #(
    .INIT(64'h0455555500005100)) 
    \res_seq[sysflip1]_i_1 
       (.I0(\res_seq_reg[token1][char][7] ),
        .I1(\res_seq_reg[sysflip1] ),
        .I2(vhavetoken0),
        .I3(\res_seq_reg[tokmux]__0 ),
        .I4(syncdff_ff2_reg_0),
        .I5(\res_seq_reg[sysflip1]__0 ),
        .O(\res_seq_reg[tokmux] ));
  LUT6 #(
    .INIT(64'h00000000D00000D0)) 
    \res_seq[token1][fctpiggy]_i_1 
       (.I0(\res_seq_reg[sysflip1] ),
        .I1(vhavetoken0),
        .I2(\res_seq_reg[tokmux]__0 ),
        .I3(syncdff_ff2_reg_0),
        .I4(\res_seq_reg[sysflip1]__0 ),
        .I5(\res_seq_reg[token1][char][7] ),
        .O(E));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_1),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1
   (syncdff_ff2_reg_0,
    syncdff_ff2_reg_1,
    \restx_seq_reg[b_update] ,
    \res_seq_reg[sysflip0]__0 ,
    SPW_TX_clk,
    buf_ff0_reg_0,
    \restx_seq_reg[b_mux]__0 ,
    \restx_seq_reg[b_update]__0 ,
    \synctx[txen] ,
    \restx_seq_reg[txflip0] ,
    \restx_seq_reg[b_txflip]__0 ,
    \synctx[sysflip1] ,
    \restx_seq_reg[b_valid]__0 );
  output syncdff_ff2_reg_0;
  output syncdff_ff2_reg_1;
  output \restx_seq_reg[b_update] ;
  input \res_seq_reg[sysflip0]__0 ;
  input SPW_TX_clk;
  input buf_ff0_reg_0;
  input \restx_seq_reg[b_mux]__0 ;
  input \restx_seq_reg[b_update]__0 ;
  input \synctx[txen] ;
  input \restx_seq_reg[txflip0] ;
  input \restx_seq_reg[b_txflip]__0 ;
  input \synctx[sysflip1] ;
  input \restx_seq_reg[b_valid]__0 ;

  wire SPW_TX_clk;
  wire buf_ff0;
  wire buf_ff0_reg_0;
  wire \res_seq_reg[sysflip0]__0 ;
  wire \restx_seq_reg[b_mux]__0 ;
  wire \restx_seq_reg[b_txflip]__0 ;
  wire \restx_seq_reg[b_update] ;
  wire \restx_seq_reg[b_update]__0 ;
  wire \restx_seq_reg[b_valid]__0 ;
  wire \restx_seq_reg[txflip0] ;
  wire syncdff_ff1;
  wire syncdff_ff2_reg_0;
  wire syncdff_ff2_reg_1;
  wire \synctx[sysflip0] ;
  wire \synctx[sysflip1] ;
  wire \synctx[txen] ;
  wire \vtx[b_valid]13_out ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[sysflip0]__0 ),
        .Q(buf_ff0));
  LUT6 #(
    .INIT(64'hC3FF000066000000)) 
    \restx_seq[b_mux]_i_1 
       (.I0(\synctx[sysflip0] ),
        .I1(\restx_seq_reg[b_txflip]__0 ),
        .I2(\synctx[sysflip1] ),
        .I3(\restx_seq_reg[b_update]__0 ),
        .I4(\synctx[txen] ),
        .I5(\restx_seq_reg[b_mux]__0 ),
        .O(syncdff_ff2_reg_1));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \restx_seq[b_valid]_i_1 
       (.I0(\vtx[b_valid]13_out ),
        .I1(\restx_seq_reg[b_update]__0 ),
        .I2(\synctx[txen] ),
        .I3(\restx_seq_reg[b_valid]__0 ),
        .O(\restx_seq_reg[b_update] ));
  LUT5 #(
    .INIT(32'h36C60000)) 
    \restx_seq[b_valid]_i_2 
       (.I0(\synctx[sysflip0] ),
        .I1(\restx_seq_reg[b_txflip]__0 ),
        .I2(\restx_seq_reg[b_mux]__0 ),
        .I3(\synctx[sysflip1] ),
        .I4(\synctx[txen] ),
        .O(\vtx[b_valid]13_out ));
  LUT5 #(
    .INIT(32'hEF002000)) 
    \restx_seq[txflip0]_i_1 
       (.I0(\synctx[sysflip0] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\restx_seq_reg[b_update]__0 ),
        .I3(\synctx[txen] ),
        .I4(\restx_seq_reg[txflip0] ),
        .O(syncdff_ff2_reg_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0),
        .Q(syncdff_ff1));
  FDCE syncdff_ff2_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1),
        .Q(\synctx[sysflip0] ));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10
   (D,
    \res_seq_reg[tailptr_gray][0] ,
    \state_seq_reg[rxen] ,
    \res_com[tailptr_gray] ,
    Q,
    SPW_main_clk,
    buf_ff0_reg_0,
    \res_seq_reg[tailptr][2] ,
    \res_seq_reg[tailptr] ,
    recv_rxen,
    \res_seq_reg[tailptr][2]_0 );
  output [1:0]D;
  output \res_seq_reg[tailptr_gray][0] ;
  output [1:0]\state_seq_reg[rxen] ;
  output [0:0]\res_com[tailptr_gray] ;
  input [0:0]Q;
  input SPW_main_clk;
  input buf_ff0_reg_0;
  input [1:0]\res_seq_reg[tailptr][2] ;
  input [2:0]\res_seq_reg[tailptr] ;
  input recv_rxen;
  input [1:0]\res_seq_reg[tailptr][2]_0 ;

  wire [1:0]D;
  wire [0:0]Q;
  wire SPW_main_clk;
  wire buf_ff0;
  wire buf_ff0_reg_0;
  wire recv_rxen;
  wire [0:0]\res_com[tailptr_gray] ;
  wire [2:0]\res_seq_reg[tailptr] ;
  wire [1:0]\res_seq_reg[tailptr][2] ;
  wire [1:0]\res_seq_reg[tailptr][2]_0 ;
  wire \res_seq_reg[tailptr_gray][0] ;
  wire [1:0]\state_seq_reg[rxen] ;
  wire syncdff_ff1;
  wire [0:0]\syncsys[headptr_gray] ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(Q),
        .Q(buf_ff0));
  LUT3 #(
    .INIT(8'h82)) 
    \res_seq[tailptr][0]_i_1 
       (.I0(recv_rxen),
        .I1(\res_seq_reg[tailptr_gray][0] ),
        .I2(\res_seq_reg[tailptr] [0]),
        .O(\state_seq_reg[rxen] [0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hA208)) 
    \res_seq[tailptr][1]_i_1 
       (.I0(recv_rxen),
        .I1(\res_seq_reg[tailptr] [0]),
        .I2(\res_seq_reg[tailptr_gray][0] ),
        .I3(\res_seq_reg[tailptr] [1]),
        .O(\state_seq_reg[rxen] [1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \res_seq[tailptr][2]_i_1 
       (.I0(recv_rxen),
        .I1(\res_seq_reg[tailptr] [1]),
        .I2(\res_seq_reg[tailptr_gray][0] ),
        .I3(\res_seq_reg[tailptr] [0]),
        .I4(\res_seq_reg[tailptr] [2]),
        .O(\res_com[tailptr_gray] ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h4B00)) 
    \res_seq[tailptr_gray][0]_i_1 
       (.I0(\res_seq_reg[tailptr] [0]),
        .I1(\res_seq_reg[tailptr_gray][0] ),
        .I2(\res_seq_reg[tailptr] [1]),
        .I3(recv_rxen),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h45BA0000)) 
    \res_seq[tailptr_gray][1]_i_1 
       (.I0(\res_seq_reg[tailptr] [1]),
        .I1(\res_seq_reg[tailptr_gray][0] ),
        .I2(\res_seq_reg[tailptr] [0]),
        .I3(\res_seq_reg[tailptr] [2]),
        .I4(recv_rxen),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \res_seq[tailptr_gray][1]_i_2 
       (.I0(\res_seq_reg[tailptr][2]_0 [0]),
        .I1(\syncsys[headptr_gray] ),
        .I2(\res_seq_reg[tailptr][2]_0 [1]),
        .I3(\res_seq_reg[tailptr][2] [0]),
        .I4(\res_seq_reg[tailptr][2] [1]),
        .I5(\res_seq_reg[tailptr] [2]),
        .O(\res_seq_reg[tailptr_gray][0] ));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0),
        .Q(syncdff_ff1));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1),
        .Q(\syncsys[headptr_gray] ));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11
   (syncdff_ff2_reg_0,
    Q,
    SPW_main_clk,
    buf_ff0_reg_0);
  output [0:0]syncdff_ff2_reg_0;
  input [0:0]Q;
  input SPW_main_clk;
  input buf_ff0_reg_0;

  wire [0:0]Q;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]syncdff_ff2_reg_0;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(Q),
        .Q(buf_ff0_reg_n_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12
   (syncdff_ff2_reg_0,
    \resrx_seq_reg[headptr] ,
    SPW_main_clk,
    buf_ff0_reg_0);
  output [0:0]syncdff_ff2_reg_0;
  input [0:0]\resrx_seq_reg[headptr] ;
  input SPW_main_clk;
  input buf_ff0_reg_0;

  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire [0:0]\resrx_seq_reg[headptr] ;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]syncdff_ff2_reg_0;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\resrx_seq_reg[headptr] ),
        .Q(buf_ff0_reg_n_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2
   (\synctx[sysflip1] ,
    syncdff_ff2_reg_0,
    \res_seq_reg[sysflip1]__0 ,
    SPW_TX_clk,
    buf_ff0_reg_0,
    \restx_seq_reg[b_mux]__0 ,
    \restx_seq_reg[b_update]__0 ,
    \synctx[txen] ,
    \restx_seq_reg[txflip1] );
  output \synctx[sysflip1] ;
  output syncdff_ff2_reg_0;
  input \res_seq_reg[sysflip1]__0 ;
  input SPW_TX_clk;
  input buf_ff0_reg_0;
  input \restx_seq_reg[b_mux]__0 ;
  input \restx_seq_reg[b_update]__0 ;
  input \synctx[txen] ;
  input \restx_seq_reg[txflip1] ;

  wire SPW_TX_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire \res_seq_reg[sysflip1]__0 ;
  wire \restx_seq_reg[b_mux]__0 ;
  wire \restx_seq_reg[b_update]__0 ;
  wire \restx_seq_reg[txflip1] ;
  wire syncdff_ff1_reg_n_0;
  wire syncdff_ff2_reg_0;
  wire \synctx[sysflip1] ;
  wire \synctx[txen] ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[sysflip1]__0 ),
        .Q(buf_ff0_reg_n_0));
  LUT5 #(
    .INIT(32'hBF008000)) 
    \restx_seq[txflip1]_i_1 
       (.I0(\synctx[sysflip1] ),
        .I1(\restx_seq_reg[b_mux]__0 ),
        .I2(\restx_seq_reg[b_update]__0 ),
        .I3(\synctx[txen] ),
        .I4(\restx_seq_reg[txflip1] ),
        .O(syncdff_ff2_reg_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(\synctx[sysflip1] ));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3
   (E,
    \res_seq_reg[txdivsafe]__0 ,
    SPW_TX_clk,
    buf_ff0_reg_0);
  output [0:0]E;
  input \res_seq_reg[txdivsafe]__0 ;
  input SPW_TX_clk;
  input buf_ff0_reg_0;

  wire [0:0]E;
  wire SPW_TX_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire \res_seq_reg[txdivsafe]__0 ;
  wire syncdff_ff1_reg_n_0;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txdivsafe]__0 ),
        .Q(buf_ff0_reg_n_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(E));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4
   (\synctx[txen] ,
    E,
    \restx_seq_reg[e_count][0] ,
    \restx_seq_reg[b_token][fctpiggy] ,
    \restx_seq_reg[b_valid] ,
    \restx_seq_reg[b_valid]_0 ,
    \vtx[b_update] ,
    \vtx[e_parity]1_out ,
    \restx_com[d_bits] ,
    \res_seq_reg[txenreg]__0 ,
    SPW_TX_clk,
    buf_ff0_reg_0,
    \restx_seq_reg[txclken]__0 ,
    Q,
    \restx_seq_reg[e_valid]__0 ,
    \restx_seq_reg[b_token][fctpiggy]__0 ,
    \restx_seq_reg[b_valid]__0 ,
    \restx_seq_reg[c_busy] ,
    \restx_seq_reg[c_busy]__0 ,
    \restx_seq_reg[b_token][fct]__0 ,
    \restx_seq_reg[d_bits][0] ,
    \restx_seq_reg[d_bits][0]_0 ,
    \restx_seq_reg[e_parity]__0 ,
    \restx_seq_reg[e_parity] ,
    \restx_seq_reg[e_parity]_0 ,
    \restx_seq_reg[d_bits][0]_1 );
  output \synctx[txen] ;
  output [0:0]E;
  output \restx_seq_reg[e_count][0] ;
  output \restx_seq_reg[b_token][fctpiggy] ;
  output \restx_seq_reg[b_valid] ;
  output \restx_seq_reg[b_valid]_0 ;
  output \vtx[b_update] ;
  output \vtx[e_parity]1_out ;
  output [0:0]\restx_com[d_bits] ;
  input \res_seq_reg[txenreg]__0 ;
  input SPW_TX_clk;
  input buf_ff0_reg_0;
  input \restx_seq_reg[txclken]__0 ;
  input [0:0]Q;
  input \restx_seq_reg[e_valid]__0 ;
  input \restx_seq_reg[b_token][fctpiggy]__0 ;
  input \restx_seq_reg[b_valid]__0 ;
  input \restx_seq_reg[c_busy] ;
  input \restx_seq_reg[c_busy]__0 ;
  input \restx_seq_reg[b_token][fct]__0 ;
  input \restx_seq_reg[d_bits][0] ;
  input \restx_seq_reg[d_bits][0]_0 ;
  input \restx_seq_reg[e_parity]__0 ;
  input [0:0]\restx_seq_reg[e_parity] ;
  input \restx_seq_reg[e_parity]_0 ;
  input [0:0]\restx_seq_reg[d_bits][0]_1 ;

  wire [0:0]E;
  wire [0:0]Q;
  wire SPW_TX_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire \res_seq_reg[txenreg]__0 ;
  wire [0:0]\restx_com[d_bits] ;
  wire \restx_seq_reg[b_token][fct]__0 ;
  wire \restx_seq_reg[b_token][fctpiggy] ;
  wire \restx_seq_reg[b_token][fctpiggy]__0 ;
  wire \restx_seq_reg[b_valid] ;
  wire \restx_seq_reg[b_valid]_0 ;
  wire \restx_seq_reg[b_valid]__0 ;
  wire \restx_seq_reg[c_busy] ;
  wire \restx_seq_reg[c_busy]__0 ;
  wire \restx_seq_reg[d_bits][0] ;
  wire \restx_seq_reg[d_bits][0]_0 ;
  wire [0:0]\restx_seq_reg[d_bits][0]_1 ;
  wire \restx_seq_reg[e_count][0] ;
  wire [0:0]\restx_seq_reg[e_parity] ;
  wire \restx_seq_reg[e_parity]_0 ;
  wire \restx_seq_reg[e_parity]__0 ;
  wire \restx_seq_reg[e_valid]__0 ;
  wire \restx_seq_reg[txclken]__0 ;
  wire syncdff_ff1_reg_n_0;
  wire \synctx[txen] ;
  wire \vtx[b_update] ;
  wire \vtx[e_parity]1_out ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(\res_seq_reg[txenreg]__0 ),
        .Q(buf_ff0_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \restx_seq[b_update]_i_1 
       (.I0(Q),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(\restx_seq_reg[c_busy]__0 ),
        .I3(\synctx[txen] ),
        .O(\vtx[b_update] ));
  LUT5 #(
    .INIT(32'h0FFFB0FF)) 
    \restx_seq[c_busy]_i_1 
       (.I0(\restx_seq_reg[b_token][fctpiggy]__0 ),
        .I1(\restx_seq_reg[b_valid]__0 ),
        .I2(\restx_seq_reg[c_busy] ),
        .I3(\synctx[txen] ),
        .I4(\restx_seq_reg[c_busy]__0 ),
        .O(\restx_seq_reg[b_token][fctpiggy] ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h3F4F)) 
    \restx_seq[c_esc]_i_1 
       (.I0(\restx_seq_reg[b_valid]__0 ),
        .I1(\restx_seq_reg[c_busy] ),
        .I2(\synctx[txen] ),
        .I3(\restx_seq_reg[d_bits][0]_0 ),
        .O(\restx_seq_reg[b_valid]_0 ));
  LUT6 #(
    .INIT(64'h5DFFFFFF5D00FFFF)) 
    \restx_seq[c_fct]_i_1 
       (.I0(\restx_seq_reg[b_valid]__0 ),
        .I1(\restx_seq_reg[b_token][fct]__0 ),
        .I2(\restx_seq_reg[c_busy]__0 ),
        .I3(\restx_seq_reg[c_busy] ),
        .I4(\synctx[txen] ),
        .I5(\restx_seq_reg[d_bits][0] ),
        .O(\restx_seq_reg[b_valid] ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \restx_seq[d_bits][0]_i_1 
       (.I0(\restx_seq_reg[d_bits][0] ),
        .I1(\restx_seq_reg[d_bits][0]_1 ),
        .I2(\restx_seq_reg[d_bits][0]_0 ),
        .I3(\synctx[txen] ),
        .O(\restx_com[d_bits] ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \restx_seq[e_count][9]_i_1 
       (.I0(\restx_seq_reg[txclken]__0 ),
        .I1(\synctx[txen] ),
        .O(E));
  LUT5 #(
    .INIT(32'hF6060000)) 
    \restx_seq[e_parity]_i_1 
       (.I0(\restx_seq_reg[e_parity]__0 ),
        .I1(\restx_seq_reg[e_parity] ),
        .I2(Q),
        .I3(\restx_seq_reg[e_parity]_0 ),
        .I4(\synctx[txen] ),
        .O(\vtx[e_parity]1_out ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hF080)) 
    \restx_seq[e_valid]_i_1 
       (.I0(Q),
        .I1(\restx_seq_reg[txclken]__0 ),
        .I2(\synctx[txen] ),
        .I3(\restx_seq_reg[e_valid]__0 ),
        .O(\restx_seq_reg[e_count][0] ));
  FDCE syncdff_ff1_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_TX_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(\synctx[txen] ));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6
   (\syncsys[rxcnt_ddr_gray] ,
    D,
    SPW_main_clk,
    buf_ff0_reg_0,
    Q,
    buf_ff0_reg_1,
    SPW_Din,
    SPW_Sin,
    recv_rxen);
  output [0:0]\syncsys[rxcnt_ddr_gray] ;
  output [0:0]D;
  input SPW_main_clk;
  input buf_ff0_reg_0;
  input [0:0]Q;
  input [0:0]buf_ff0_reg_1;
  input SPW_Din;
  input SPW_Sin;
  input recv_rxen;

  wire [0:0]D;
  wire [0:0]Q;
  wire SPW_Din;
  wire SPW_Sin;
  wire SPW_main_clk;
  wire buf_ff0_i_1__1_n_0;
  wire buf_ff0_reg_0;
  wire [0:0]buf_ff0_reg_1;
  wire buf_ff0_reg_n_0;
  wire recv_rxen;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]\syncsys[rxcnt_ddr_gray] ;

  LUT4 #(
    .INIT(16'h5CC5)) 
    buf_ff0_i_1__1
       (.I0(Q),
        .I1(buf_ff0_reg_1),
        .I2(SPW_Din),
        .I3(SPW_Sin),
        .O(buf_ff0_i_1__1_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_i_1__1_n_0),
        .Q(buf_ff0_reg_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    \res_seq[bitcntp_gray][0]_i_1 
       (.I0(\syncsys[rxcnt_ddr_gray] ),
        .I1(recv_rxen),
        .O(D));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(\syncsys[rxcnt_ddr_gray] ));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7
   (syncdff_ff2_reg_0,
    SPW_main_clk,
    buf_ff0_reg_0,
    Q,
    buf_ff0_reg_1,
    SPW_Din,
    SPW_Sin);
  output [0:0]syncdff_ff2_reg_0;
  input SPW_main_clk;
  input buf_ff0_reg_0;
  input [1:0]Q;
  input [1:0]buf_ff0_reg_1;
  input SPW_Din;
  input SPW_Sin;

  wire BinToGray01_out;
  wire [1:0]Q;
  wire SPW_Din;
  wire SPW_Sin;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire [1:0]buf_ff0_reg_1;
  wire buf_ff0_reg_n_0;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]syncdff_ff2_reg_0;

  LUT6 #(
    .INIT(64'h5A33335A5ACCCC5A)) 
    buf_ff0_i_1
       (.I0(Q[1]),
        .I1(buf_ff0_reg_1[1]),
        .I2(Q[0]),
        .I3(SPW_Din),
        .I4(SPW_Sin),
        .I5(buf_ff0_reg_1[0]),
        .O(BinToGray01_out));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(BinToGray01_out),
        .Q(buf_ff0_reg_n_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8
   (syncdff_ff2_reg_0,
    SPW_main_clk,
    buf_ff0_reg_0,
    Q,
    buf_ff0_reg_1,
    SPW_Din,
    SPW_Sin);
  output [0:0]syncdff_ff2_reg_0;
  input SPW_main_clk;
  input buf_ff0_reg_0;
  input [1:0]Q;
  input [1:0]buf_ff0_reg_1;
  input SPW_Din;
  input SPW_Sin;

  wire BinToGray03_out;
  wire [1:0]Q;
  wire SPW_Din;
  wire SPW_Sin;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire [1:0]buf_ff0_reg_1;
  wire buf_ff0_reg_n_0;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]syncdff_ff2_reg_0;

  LUT6 #(
    .INIT(64'h5A33335A5ACCCC5A)) 
    buf_ff0_i_1__0
       (.I0(Q[1]),
        .I1(buf_ff0_reg_1[1]),
        .I2(Q[0]),
        .I3(SPW_Din),
        .I4(SPW_Sin),
        .I5(buf_ff0_reg_1[0]),
        .O(BinToGray03_out));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(BinToGray03_out),
        .Q(buf_ff0_reg_n_0));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* ORIG_REF_NAME = "SyncDff" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9
   (syncdff_ff2_reg_0,
    \vres[inact]1_out ,
    p_0_in2_in,
    SPW_main_clk,
    buf_ff0_reg_0,
    recv_rxen,
    Q,
    \syncsys[rxcnt_ddr_gray] ,
    \res_seq_reg[inact] );
  output [0:0]syncdff_ff2_reg_0;
  output \vres[inact]1_out ;
  input p_0_in2_in;
  input SPW_main_clk;
  input buf_ff0_reg_0;
  input recv_rxen;
  input [3:0]Q;
  input [0:0]\syncsys[rxcnt_ddr_gray] ;
  input [1:0]\res_seq_reg[inact] ;

  wire [3:0]Q;
  wire SPW_main_clk;
  wire buf_ff0_reg_0;
  wire buf_ff0_reg_n_0;
  wire p_0_in2_in;
  wire recv_rxen;
  wire \res_seq[inact]_i_2_n_0 ;
  wire [1:0]\res_seq_reg[inact] ;
  wire syncdff_ff1_reg_n_0;
  wire [0:0]syncdff_ff2_reg_0;
  wire [0:0]\syncsys[rxcnt_ddr_gray] ;
  wire \vres[inact]1_out ;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    buf_ff0_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(p_0_in2_in),
        .Q(buf_ff0_reg_n_0));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAA8AA8)) 
    \res_seq[inact]_i_1 
       (.I0(recv_rxen),
        .I1(\res_seq[inact]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(\syncsys[rxcnt_ddr_gray] ),
        .I4(Q[2]),
        .I5(\res_seq_reg[inact] [1]),
        .O(\vres[inact]1_out ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \res_seq[inact]_i_2 
       (.I0(Q[3]),
        .I1(syncdff_ff2_reg_0),
        .I2(Q[1]),
        .I3(\res_seq_reg[inact] [0]),
        .O(\res_seq[inact]_i_2_n_0 ));
  FDCE syncdff_ff1_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(buf_ff0_reg_n_0),
        .Q(syncdff_ff1_reg_n_0));
  FDCE syncdff_ff2_reg
       (.C(SPW_main_clk),
        .CE(1'b1),
        .CLR(buf_ff0_reg_0),
        .D(syncdff_ff1_reg_n_0),
        .Q(syncdff_ff2_reg_0));
endmodule

(* CHECK_LICENSE_TYPE = "Test_Implementaiton_SpaceWire_light_AXI_0_2,SpaceWire_light_AXI,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "SpaceWire_light_AXI,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (IRQ,
    SPW_Dout,
    SPW_Sout,
    SPW_Din,
    SPW_Sin,
    SPW_TX_clk,
    SPW_main_clk,
    SPW_rst,
    axi_register_aclk,
    axi_register_aresetn,
    axi_register_awaddr,
    axi_register_awprot,
    axi_register_awvalid,
    axi_register_awready,
    axi_register_wdata,
    axi_register_wstrb,
    axi_register_wvalid,
    axi_register_wready,
    axi_register_bresp,
    axi_register_bvalid,
    axi_register_bready,
    axi_register_araddr,
    axi_register_arprot,
    axi_register_arvalid,
    axi_register_arready,
    axi_register_rdata,
    axi_register_rresp,
    axi_register_rvalid,
    axi_register_rready,
    axi_streamin_aclk,
    axi_streamin_aresetn,
    axi_streamin_tready,
    axi_streamin_tdata,
    axi_streamin_tstrb,
    axi_streamin_tlast,
    axi_streamin_tvalid,
    axi_streamout_aclk,
    axi_streamout_aresetn,
    axi_streamout_tvalid,
    axi_streamout_tdata,
    axi_streamout_tstrb,
    axi_streamout_tlast,
    axi_streamout_tready);
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output IRQ;
  output SPW_Dout;
  output SPW_Sout;
  input SPW_Din;
  input SPW_Sin;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 SPW_TX_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME SPW_TX_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input SPW_TX_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 SPW_main_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME SPW_main_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input SPW_main_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 SPW_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME SPW_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input SPW_rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_Register_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_Register_CLK, ASSOCIATED_BUSIF AXI_Register, ASSOCIATED_RESET axi_register_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input axi_register_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_Register_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_Register_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input axi_register_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_Register, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 8, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [4:0]axi_register_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register AWPROT" *) input [2:0]axi_register_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register AWVALID" *) input axi_register_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register AWREADY" *) output axi_register_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register WDATA" *) input [31:0]axi_register_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register WSTRB" *) input [3:0]axi_register_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register WVALID" *) input axi_register_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register WREADY" *) output axi_register_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register BRESP" *) output [1:0]axi_register_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register BVALID" *) output axi_register_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register BREADY" *) input axi_register_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register ARADDR" *) input [4:0]axi_register_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register ARPROT" *) input [2:0]axi_register_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register ARVALID" *) input axi_register_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register ARREADY" *) output axi_register_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register RDATA" *) output [31:0]axi_register_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register RRESP" *) output [1:0]axi_register_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register RVALID" *) output axi_register_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI_Register RREADY" *) input axi_register_rready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_StreamIn_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamIn_CLK, ASSOCIATED_BUSIF AXI_StreamIn, ASSOCIATED_RESET axi_streamin_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input axi_streamin_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_StreamIn_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamIn_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input axi_streamin_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamIn TREADY" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamIn, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output axi_streamin_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamIn TDATA" *) input [7:0]axi_streamin_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamIn TSTRB" *) input [0:0]axi_streamin_tstrb;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamIn TLAST" *) input axi_streamin_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamIn TVALID" *) input axi_streamin_tvalid;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_StreamOut_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamOut_CLK, ASSOCIATED_BUSIF AXI_StreamOut, ASSOCIATED_RESET axi_streamout_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input axi_streamout_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_StreamOut_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamOut_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input axi_streamout_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamOut TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_StreamOut, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN Test_Implementaiton_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output axi_streamout_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamOut TDATA" *) output [7:0]axi_streamout_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamOut TSTRB" *) output [0:0]axi_streamout_tstrb;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamOut TLAST" *) output axi_streamout_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_StreamOut TREADY" *) input axi_streamout_tready;

  wire \<const0> ;
  wire SPW_Din;
  wire SPW_Dout;
  wire SPW_Sin;
  wire SPW_Sout;
  wire SPW_TX_clk;
  wire SPW_main_clk;
  wire SPW_rst;
  wire axi_register_aclk;
  wire axi_register_aresetn;
  wire axi_register_arready;
  wire axi_register_arvalid;
  wire axi_register_awready;
  wire axi_register_awvalid;
  wire axi_register_bready;
  wire axi_register_bvalid;
  wire axi_register_rready;
  wire axi_register_rvalid;
  wire axi_register_wready;
  wire axi_register_wvalid;
  wire axi_streamin_aclk;
  wire axi_streamin_aresetn;
  wire [7:0]axi_streamin_tdata;
  wire axi_streamin_tready;
  wire axi_streamin_tvalid;
  wire axi_streamout_aclk;
  wire axi_streamout_aresetn;
  wire [7:0]axi_streamout_tdata;
  wire axi_streamout_tlast;
  wire axi_streamout_tready;
  wire axi_streamout_tvalid;

  assign IRQ = \<const0> ;
  assign axi_register_bresp[1] = \<const0> ;
  assign axi_register_bresp[0] = \<const0> ;
  assign axi_register_rdata[31] = \<const0> ;
  assign axi_register_rdata[30] = \<const0> ;
  assign axi_register_rdata[29] = \<const0> ;
  assign axi_register_rdata[28] = \<const0> ;
  assign axi_register_rdata[27] = \<const0> ;
  assign axi_register_rdata[26] = \<const0> ;
  assign axi_register_rdata[25] = \<const0> ;
  assign axi_register_rdata[24] = \<const0> ;
  assign axi_register_rdata[23] = \<const0> ;
  assign axi_register_rdata[22] = \<const0> ;
  assign axi_register_rdata[21] = \<const0> ;
  assign axi_register_rdata[20] = \<const0> ;
  assign axi_register_rdata[19] = \<const0> ;
  assign axi_register_rdata[18] = \<const0> ;
  assign axi_register_rdata[17] = \<const0> ;
  assign axi_register_rdata[16] = \<const0> ;
  assign axi_register_rdata[15] = \<const0> ;
  assign axi_register_rdata[14] = \<const0> ;
  assign axi_register_rdata[13] = \<const0> ;
  assign axi_register_rdata[12] = \<const0> ;
  assign axi_register_rdata[11] = \<const0> ;
  assign axi_register_rdata[10] = \<const0> ;
  assign axi_register_rdata[9] = \<const0> ;
  assign axi_register_rdata[8] = \<const0> ;
  assign axi_register_rdata[7] = \<const0> ;
  assign axi_register_rdata[6] = \<const0> ;
  assign axi_register_rdata[5] = \<const0> ;
  assign axi_register_rdata[4] = \<const0> ;
  assign axi_register_rdata[3] = \<const0> ;
  assign axi_register_rdata[2] = \<const0> ;
  assign axi_register_rdata[1] = \<const0> ;
  assign axi_register_rdata[0] = \<const0> ;
  assign axi_register_rresp[1] = \<const0> ;
  assign axi_register_rresp[0] = \<const0> ;
  assign axi_streamout_tstrb[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI U0
       (.SPW_Din(SPW_Din),
        .SPW_Dout(SPW_Dout),
        .SPW_Sin(SPW_Sin),
        .SPW_Sout(SPW_Sout),
        .SPW_TX_clk(SPW_TX_clk),
        .SPW_main_clk(SPW_main_clk),
        .SPW_rst(SPW_rst),
        .axi_arready_reg(axi_register_arready),
        .axi_awready_reg(axi_register_awready),
        .axi_register_aclk(axi_register_aclk),
        .axi_register_aresetn(axi_register_aresetn),
        .axi_register_arvalid(axi_register_arvalid),
        .axi_register_awvalid(axi_register_awvalid),
        .axi_register_bready(axi_register_bready),
        .axi_register_bvalid(axi_register_bvalid),
        .axi_register_rready(axi_register_rready),
        .axi_register_wready(axi_register_wready),
        .axi_register_wvalid(axi_register_wvalid),
        .axi_rvalid_reg(axi_register_rvalid),
        .axi_streamin_aclk(axi_streamin_aclk),
        .axi_streamin_aresetn(axi_streamin_aresetn),
        .axi_streamin_tdata(axi_streamin_tdata),
        .axi_streamin_tready(axi_streamin_tready),
        .axi_streamin_tvalid(axi_streamin_tvalid),
        .axi_streamout_aclk(axi_streamout_aclk),
        .axi_streamout_aresetn(axi_streamout_aresetn),
        .axi_streamout_tdata(axi_streamout_tdata),
        .axi_streamout_tlast(axi_streamout_tlast),
        .axi_streamout_tready(axi_streamout_tready),
        .axi_streamout_tvalid(axi_streamout_tvalid));
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
