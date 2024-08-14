vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_13
vlib modelsim_lib/msim/c_reg_fd_v12_0_9
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vlib modelsim_lib/msim/xbip_pipe_v3_0_9
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_9
vlib modelsim_lib/msim/xbip_addsub_v3_0_9
vlib modelsim_lib/msim/c_addsub_v12_0_18
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_13 modelsim_lib/msim/xbip_utils_v3_0_13
vmap c_reg_fd_v12_0_9 modelsim_lib/msim/c_reg_fd_v12_0_9
vmap xbip_dsp48_wrapper_v3_0_6 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_9 modelsim_lib/msim/xbip_pipe_v3_0_9
vmap xbip_dsp48_addsub_v3_0_9 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_9
vmap xbip_addsub_v3_0_9 modelsim_lib/msim/xbip_addsub_v3_0_9
vmap c_addsub_v12_0_18 modelsim_lib/msim/c_addsub_v12_0_18
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_13 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/24e7/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_9 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/e362/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/f596/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/713b/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/378b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_9 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/cb89/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_18 -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ipshared/0e04/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_c_addsub_0_0/sim/Adder_c_addsub_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_1/sim/Adder_byte_register_0_1.v" \
"../../../../Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_3/sim/Adder_byte_register_0_3.v" \
"../../../../Adder.gen/sources_1/bd/Adder/sim/Adder.v" \

vlog -work xil_defaultlib \
"glbl.v"

