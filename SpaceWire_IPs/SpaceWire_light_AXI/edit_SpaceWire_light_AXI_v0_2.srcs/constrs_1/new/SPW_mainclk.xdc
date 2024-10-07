# set 1% jitter (double of Zynq datasheet https://docs.amd.com/v/u/en-US/ds187-XC7Z010-XC7Z020-Data-Sheet)
# I think, jitter may be relative (https://docs.amd.com/v/u/en-US/ug472_7Series_Clocking)
# 400MBit/s Tx (https://cdn.teledynelecroy.com/files/pdf/spacewire-datasheet.pdf)
# -> 400MHz Txclk=bitrate (per SPW light doc)
# -> 200MHz Sin/Din is half of pure Rxclock per SPW user guide (https://www.star-dundee.com/wp-content/star_uploads/general/SpaceWire-Users-Guide.pdf)
# -> 100MHz SPW core (core needs to be a fourth or at least a sixth of max Rxclk, per SPW light doc)
# -> 100MHz AXI to be synchronous to SPW

set_property DRIVE 12 [get_ports SPW_Dout]
set_property DRIVE 12 [get_ports SPW_Sout]

#create_clock -period 12.500 -name SPW_Din -waveform {0.000 6.250} [get_ports SPW_Din]
#set_input_jitter SPW_Din 0.330
#create_clock -period 12.500 -name SPW_Sin -waveform {0.000 6.250} [get_ports SPW_Sin]
#set_input_jitter SPW_Sin 0.330
create_clock -period 50.000 -name SPW_Din -waveform {0.000 25.000} [get_ports SPW_Din]
set_input_jitter SPW_Din 0.660
create_clock -period 50.000 -name SPW_Sin -waveform {0.000 25.000} [get_ports SPW_Sin]
set_input_jitter SPW_Sin 0.660


set_clock_groups -asynchronous -group [get_clocks SPW_Sin] -group [get_clocks SPW_Din]
set_clock_groups -asynchronous -group [get_clocks SPW_Din] -group [get_clocks SPW_Sin]




set_property ASYNC_REG true [get_cells {Test_Implementaiton_i/SpaceWire_light_AXI_0/U0/SPW_IF/TXRSTLOGIC/reset_reg_reg[1]}]
set_property ASYNC_REG true [get_cells {Test_Implementaiton_i/SpaceWire_light_AXI_0/U0/SPW_IF/TXRSTLOGIC/reset_reg_reg[0]}]
create_clock -period 12.500 -name VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0 -waveform {0.000 6.250}
#set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -min -add_delay -1.000 [get_ports SPW_Dout]
#set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -max -add_delay 9.000 [get_ports SPW_Dout]
#set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -min -add_delay -1.000 [get_ports SPW_Sout]
#set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -max -add_delay 9.000 [get_ports SPW_Sout]
#set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks TX_clk_Test_Implementaiton_clk_wiz_0_0]
set_false_path -from [get_clocks SPW_core_clk_Test_Implementaiton_clk_wiz_0_0] -to [get_clocks SPW_Din]
set_false_path -from [get_clocks SPW_core_clk_Test_Implementaiton_clk_wiz_0_0] -to [get_clocks SPW_Sin]

set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -min -add_delay -3.985 [get_ports SPW_Dout]
set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -max -add_delay 4.300 [get_ports SPW_Dout]
set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -min -add_delay -3.985 [get_ports SPW_Sout]
set_output_delay -clock [get_clocks VIRTUAL_TX_clk_Test_Implementaiton_clk_wiz_0_0] -max -add_delay 4.300 [get_ports SPW_Sout]
