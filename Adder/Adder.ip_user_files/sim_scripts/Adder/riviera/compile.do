transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_utils_v3_0_13
vlib riviera/c_reg_fd_v12_0_9
vlib riviera/xbip_dsp48_wrapper_v3_0_6
vlib riviera/xbip_pipe_v3_0_9
vlib riviera/xbip_dsp48_addsub_v3_0_9
vlib riviera/xbip_addsub_v3_0_9
vlib riviera/c_addsub_v12_0_18
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_13 riviera/xbip_utils_v3_0_13
vmap c_reg_fd_v12_0_9 riviera/c_reg_fd_v12_0_9
vmap xbip_dsp48_wrapper_v3_0_6 riviera/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_9 riviera/xbip_pipe_v3_0_9
vmap xbip_dsp48_addsub_v3_0_9 riviera/xbip_dsp48_addsub_v3_0_9
vmap xbip_addsub_v3_0_9 riviera/xbip_addsub_v3_0_9
vmap c_addsub_v12_0_18 riviera/c_addsub_v12_0_18
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_13 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/24e7/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_9 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/e362/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/f596/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/713b/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/378b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_9 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/cb89/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_18 -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/0e04/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_c_addsub_0_0/sim/Adder_c_addsub_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xbip_utils_v3_0_13 -l c_reg_fd_v12_0_9 -l xbip_dsp48_wrapper_v3_0_6 -l xbip_pipe_v3_0_9 -l xbip_dsp48_addsub_v3_0_9 -l xbip_addsub_v3_0_9 -l c_addsub_v12_0_18 -l xil_defaultlib \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_1/sim/Adder_byte_register_0_1.v" \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_3/sim/Adder_byte_register_0_3.v" \
"../../../../Adder.gen/sources_1/bd/Adder/sim/Adder.v" \

vlog -work xil_defaultlib \
"glbl.v"

