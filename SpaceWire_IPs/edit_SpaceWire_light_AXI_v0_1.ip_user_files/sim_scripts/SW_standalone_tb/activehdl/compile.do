transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93  \
"../../../bd/SW_standalone_tb/ip/SW_standalone_tb_SpwStream_0_0/sim/SW_standalone_tb_SpwStream_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_1.gen/sources_1/bd/SW_standalone_tb/ipshared/3242" -l xil_defaultlib \
"../../../bd/SW_standalone_tb/ip/SW_standalone_tb_clk_wiz_0/SW_standalone_tb_clk_wiz_0_clk_wiz.v" \
"../../../bd/SW_standalone_tb/ip/SW_standalone_tb_clk_wiz_0/SW_standalone_tb_clk_wiz_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/SW_standalone_tb/sim/SW_standalone_tb.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

