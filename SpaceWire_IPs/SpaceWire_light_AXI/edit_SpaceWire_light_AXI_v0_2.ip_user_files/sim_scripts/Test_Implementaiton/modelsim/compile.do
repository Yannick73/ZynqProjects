vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_18
vlib modelsim_lib/msim/processing_system7_vip_v1_0_20
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_3
vlib modelsim_lib/msim/proc_sys_reset_v5_0_15
vlib modelsim_lib/msim/SPWIP
vlib modelsim_lib/msim/lib_pkg_v1_0_4
vlib modelsim_lib/msim/fifo_generator_v13_2_10
vlib modelsim_lib/msim/lib_fifo_v1_0_19
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_4
vlib modelsim_lib/msim/axi_datamover_v5_1_34
vlib modelsim_lib/msim/axi_sg_v4_1_18
vlib modelsim_lib/msim/axi_dma_v7_1_33
vlib modelsim_lib/msim/generic_baseblocks_v2_1_2
vlib modelsim_lib/msim/axi_register_slice_v2_1_32
vlib modelsim_lib/msim/axi_data_fifo_v2_1_31
vlib modelsim_lib/msim/axi_crossbar_v2_1_33
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_32

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_18 modelsim_lib/msim/axi_vip_v1_1_18
vmap processing_system7_vip_v1_0_20 modelsim_lib/msim/processing_system7_vip_v1_0_20
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_3 modelsim_lib/msim/lib_cdc_v1_0_3
vmap proc_sys_reset_v5_0_15 modelsim_lib/msim/proc_sys_reset_v5_0_15
vmap SPWIP modelsim_lib/msim/SPWIP
vmap lib_pkg_v1_0_4 modelsim_lib/msim/lib_pkg_v1_0_4
vmap fifo_generator_v13_2_10 modelsim_lib/msim/fifo_generator_v13_2_10
vmap lib_fifo_v1_0_19 modelsim_lib/msim/lib_fifo_v1_0_19
vmap lib_srl_fifo_v1_0_4 modelsim_lib/msim/lib_srl_fifo_v1_0_4
vmap axi_datamover_v5_1_34 modelsim_lib/msim/axi_datamover_v5_1_34
vmap axi_sg_v4_1_18 modelsim_lib/msim/axi_sg_v4_1_18
vmap axi_dma_v7_1_33 modelsim_lib/msim/axi_dma_v7_1_33
vmap generic_baseblocks_v2_1_2 modelsim_lib/msim/generic_baseblocks_v2_1_2
vmap axi_register_slice_v2_1_32 modelsim_lib/msim/axi_register_slice_v2_1_32
vmap axi_data_fifo_v2_1_31 modelsim_lib/msim/axi_data_fifo_v2_1_31
vmap axi_crossbar_v2_1_33 modelsim_lib/msim/axi_crossbar_v2_1_33
vmap axi_protocol_converter_v2_1_32 modelsim_lib/msim/axi_protocol_converter_v2_1_32

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_18 -L processing_system7_vip_v1_0_20 -L xilinx_vip "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_18 -L processing_system7_vip_v1_0_20 -L xilinx_vip "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_18  -incr -mfcu  -sv -L axi_vip_v1_1_18 -L processing_system7_vip_v1_0_20 -L xilinx_vip "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1f8d/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_20  -incr -mfcu  -sv -L axi_vip_v1_1_18 -L processing_system7_vip_v1_0_20 -L xilinx_vip "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_processing_system7_0_1/sim/Test_Implementaiton_processing_system7_0_1.v" \

vcom -work lib_cdc_v1_0_3  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_15  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3a26/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/sim/Test_Implementaiton_rst_ps7_0_100M_2.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/hdl/SpaceWire_light_AXI.vhd" \

vcom -work SPWIP  -93  \
"../../../bd/Test_Implementaiton/ipshared/9657/a5ad/ModuleMap_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/a5ad/SpwRegisters_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwStream_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/a5ad/SpwProtocol_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwLink.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwRam.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwRecovClk.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwRecv.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/eda7/SpwXmit_fast_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/a803/SpwRecvFrontXor.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/a803/SpwRecvFront_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwReset.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/b243/SpwStream.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/eda7/SpwXmit_fast.vhd" \
"../../../bd/Test_Implementaiton/ipshared/9657/eda7/SyncDff.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_SpaceWire_light_AXI_0_2/sim/Test_Implementaiton_SpaceWire_light_AXI_0_2.vhd" \

vcom -work lib_pkg_v1_0_4  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/8c68/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_19  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/0a12/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_4  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1e5a/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_34  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/99f3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_18  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/6f54/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_33  -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3e1f/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_axi_dma_0_3/sim/Test_Implementaiton_axi_dma_0_3.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_clk_wiz_0_0/Test_Implementaiton_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_clk_wiz_0_0/Test_Implementaiton_clk_wiz_0_0.v" \

vlog -work generic_baseblocks_v2_1_2  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_32  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/676c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_31  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/2ccb/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_33  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ef26/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_5/sim/Test_Implementaiton_xbar_5.v" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_4/sim/Test_Implementaiton_xbar_4.v" \

vlog -work axi_protocol_converter_v2_1_32  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d59d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_1/sim/Test_Implementaiton_auto_pc_1.v" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_0/sim/Test_Implementaiton_auto_pc_0.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/Test_Implementaiton/sim/Test_Implementaiton.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

