# set 1% jitter (double of Zynq datasheet https://docs.amd.com/v/u/en-US/ds187-XC7Z010-XC7Z020-Data-Sheet)
# I think, jitter may be relative (https://docs.amd.com/v/u/en-US/ug472_7Series_Clocking)
# 400MBit/s Tx (https://cdn.teledynelecroy.com/files/pdf/spacewire-datasheet.pdf)
# -> 400MHz Txclk=bitrate (per SPW light doc)
# -> 200MHz Sin/Din is half of pure Rxclock per SPW user guide (https://www.star-dundee.com/wp-content/star_uploads/general/SpaceWire-Users-Guide.pdf)
# -> 100MHz SPW core (core needs to be a fourth or at least a sixth of max Rxclk, per SPW light doc)
# -> 100MHz AXI to be synchronous to SPW

set_property DRIVE 12 [get_ports {axi_register_rdata[6]}]
set_property SLEW SLOW [get_ports {axi_register_rdata[6]}]
set_property DRIVE 12 [get_ports SPW_Dout]

#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP0/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP0/syncdff_ff2_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXDIVSAFE/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXDIVSAFE/syncdff_ff2_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP1/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP1/syncdff_ff2_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXEN/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXEN/syncdff_ff2_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP1/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP1/syncdff_ff2_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP0/syncdff_ff1_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP0/syncdff_ff2_reg]
create_clock -period 10.000 -name SPW_Din -waveform {0.000 5.000} [get_ports SPW_Din]
set_input_jitter SPW_Din 0.010
create_clock -period 10.000 -name SPW_Sin -waveform {0.000 5.000} [get_ports SPW_Sin]
set_input_jitter SPW_Sin 0.010
create_clock -period 5.000 -name SPW_TX_clk -waveform {0.000 2.500} [get_ports SPW_TX_clk]
set_input_jitter SPW_TX_clk 0.010
create_clock -period 10.000 -name SPW_main_clk -waveform {0.000 5.000} [get_ports SPW_main_clk]
set_input_jitter SPW_main_clk 0.010
create_clock -period 10.000 -name axi_register_aclk -waveform {0.000 5.000} [get_ports axi_register_aclk]
set_input_jitter axi_register_aclk 0.010
create_clock -period 10.000 -name axi_streamin_aclk -waveform {0.000 5.000} [get_ports axi_streamin_aclk]
set_input_jitter axi_streamin_aclk 0.010
create_clock -period 10.000 -name axi_streamout_aclk -waveform {0.000 5.000} [get_ports axi_streamout_aclk]
set_input_jitter axi_streamout_aclk 0.010






















#set_property ASYNC_REG true [get_cells {SPW_IF/TXRSTLOGIC/reset_reg_reg[3]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/TXRSTLOGIC/reset_reg_reg[0]}]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP1/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXEN/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXDIVSAFE/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP0/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP1/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP0/buf_ff0_reg]
#set_property ASYNC_REG true [get_cells SPW_IF/RECVFRONT_INST/ff_r_di2r_reg]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/resrx_seq_reg[bufdata][1]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/FIFOMEM/pre_clk_buf_reg[1]}]
#set_property ASYNC_REG true [get_cells SPW_IF/RECVFRONT_INST/ff_r_di2f_reg]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/resrx_seq_reg[bufdata][0]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/FIFOMEM/pre_clk_buf_reg[0]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/RXRSTLOGIC/reset_reg_reg[1]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/RXRSTLOGIC/reset_reg_reg[2]}]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/RXRSTLOGIC/reset_reg_reg[0]}]
#set_property ASYNC_REG true [get_cells SPW_IF/RECVFRONT_INST/ff_r_di1_reg]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/resrx_seq_reg[bufdata][2]}]
#set_property ASYNC_REG true [get_cells SPW_IF/RECVFRONT_INST/ff_f_di1_reg]
#set_property ASYNC_REG true [get_cells {SPW_IF/RECVFRONT_INST/resrx_seq_reg[bufdata][3]}]

#set_input_delay -clock [::get_clocks_ren SPW_main_clk] -min -add_delay 2.000 [get_ports SPW_rst]
#set_input_delay -clock [::get_clocks_ren SPW_main_clk] -max -add_delay 4.000 [get_ports SPW_rst]
#set_clock_groups -asynchronous -group [::get_clocks_ren SPW_main_clk] -group [::get_clocks_ren SPW_TX_clk]
#set_clock_groups -asynchronous -group [::get_clocks_ren SPW_TX_clk] -group [::get_clocks_ren SPW_main_clk]
