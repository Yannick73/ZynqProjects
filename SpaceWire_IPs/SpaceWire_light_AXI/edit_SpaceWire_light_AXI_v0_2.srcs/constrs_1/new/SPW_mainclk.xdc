## set 1% jitter (double of Zynq datasheet https://docs.amd.com/v/u/en-US/ds187-XC7Z010-XC7Z020-Data-Sheet)
## I think, jitter may be relative (https://docs.amd.com/v/u/en-US/ug472_7Series_Clocking)
## 400MBit/s Tx (https://cdn.teledynelecroy.com/files/pdf/spacewire-datasheet.pdf)
## -> 400MHz Txclk=bitrate (per SPW light doc)
## -> 200MHz Sin/Din is half of pure Rxclock per SPW user guide (https://www.star-dundee.com/wp-content/star_uploads/general/SpaceWire-Users-Guide.pdf)
## -> 100MHz SPW core (core needs to be a fourth or at least a sixth of max Rxclk, per SPW light doc)
## -> 100MHz AXI to be synchronous to SPW

set_property DRIVE 12 [get_ports SPW_Dout]
set_property DRIVE 12 [get_ports SPW_Sout]

# set the recovered RX clock to use 80MHz
create_clock -period 25.000 -name virtual_rxclk -waveform {0.000 12.500} [get_ports -filter { NAME =~  "*SPW*" && DIRECTION == "IN" }]
# the 10ns FPGA clock used 0.3ns -> 2.5*jitter_10ns*4 (clock beeing fed by 2 LVDS signal, so 4 lines)
# using a LVDS serializer with 5feet cable results in 100ps jitter, multiplied by two for Din+Sin?
# https://www.analog.com/en/resources/technical-articles/signal-integrity-vs-transmission-rate-and-cable-length-for-lvds-serializers.html
set_input_jitter [get_clocks virtual_rxclk] 0.500
# The LVDS standard states, that jitter should be less then 250ps at max, so 500ps is the conservative, albeit somewhat high choice.
# I do not think, that offset should be an issue here. Offset results in skewed pulse-width, but it should not effect random error.
# SpaceWire uses TIA/EIA-644 LVDS

set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks virtual_rxclk]

set_output_delay -clock [get_clocks SPW_ZynqSetup_i/clk_wiz_0/inst/clk_in1] -min -add_delay -7.900 [get_ports SPW_Dout]
set_output_delay -clock [get_clocks SPW_ZynqSetup_i/clk_wiz_0/inst/clk_in1] -max -add_delay 1.000 [get_ports SPW_Dout]
set_output_delay -clock [get_clocks SPW_ZynqSetup_i/clk_wiz_0/inst/clk_in1] -min -add_delay -7.900 [get_ports SPW_Sout]
set_output_delay -clock [get_clocks SPW_ZynqSetup_i/clk_wiz_0/inst/clk_in1] -max -add_delay 1.000 [get_ports SPW_Sout]
