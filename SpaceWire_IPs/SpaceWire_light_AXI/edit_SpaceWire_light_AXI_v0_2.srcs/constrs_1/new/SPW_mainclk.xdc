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

set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP0/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP0/syncdff_ff2_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXDIVSAFE/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXDIVSAFE/syncdff_ff2_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP1/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXSYSFLIP1/syncdff_ff2_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXEN/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCTXTXEN/syncdff_ff2_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP1/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP1/syncdff_ff2_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP0/syncdff_ff1_reg]
set_property ASYNC_REG true [get_cells SPW_IF/XMIT_FAST_INST/SYNCSYSTXFLIP0/syncdff_ff2_reg]
create_clock -period 5.000 -name SPW_Din -waveform {0.000 2.500} [get_ports SPW_Din]
set_input_jitter SPW_Din 0.0100
create_clock -period 5.000 -name SPW_Sin -waveform {0.000 2.500} [get_ports SPW_Sin]
set_input_jitter SPW_Sin 0.0100
create_clock -period 2.500 -name SPW_TX_clk -waveform {0.000 1.250} [get_ports SPW_TX_clk]
set_input_jitter SPW_TX_clk 0.0100
create_clock -period 10.000 -name SPW_main_clk -waveform {0.000 5.000} [get_ports SPW_main_clk]
set_input_jitter SPW_main_clk 0.0100
create_clock -period 10.000 -name axi_register_aclk -waveform {0.000 5.000} [get_ports axi_register_aclk]
set_input_jitter axi_register_aclk 0.0100
create_clock -period 10.000 -name axi_streamin_aclk -waveform {0.000 5.000} [get_ports axi_streamin_aclk]
set_input_jitter axi_streamin_aclk 0.0100
create_clock -period 10.000 -name axi_streamout_aclk -waveform {0.000 5.000} [get_ports axi_streamout_aclk]
set_input_jitter axi_streamout_aclk 0.0100











