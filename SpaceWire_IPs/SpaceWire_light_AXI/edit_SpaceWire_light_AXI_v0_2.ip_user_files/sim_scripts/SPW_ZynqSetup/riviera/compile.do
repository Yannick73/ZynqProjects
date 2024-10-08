transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/SPWIP
vlib riviera/lib_pkg_v1_0_4
vlib riviera/fifo_generator_v13_2_10
vlib riviera/lib_fifo_v1_0_19
vlib riviera/lib_srl_fifo_v1_0_4
vlib riviera/lib_cdc_v1_0_3
vlib riviera/axi_datamover_v5_1_34
vlib riviera/axi_sg_v4_1_18
vlib riviera/axi_dma_v7_1_33
vlib riviera/generic_baseblocks_v2_1_2
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_32
vlib riviera/axi_data_fifo_v2_1_31
vlib riviera/axi_crossbar_v2_1_33
vlib riviera/axi_vip_v1_1_18
vlib riviera/processing_system7_vip_v1_0_20
vlib riviera/proc_sys_reset_v5_0_15
vlib riviera/axi_protocol_converter_v2_1_32

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap SPWIP riviera/SPWIP
vmap lib_pkg_v1_0_4 riviera/lib_pkg_v1_0_4
vmap fifo_generator_v13_2_10 riviera/fifo_generator_v13_2_10
vmap lib_fifo_v1_0_19 riviera/lib_fifo_v1_0_19
vmap lib_srl_fifo_v1_0_4 riviera/lib_srl_fifo_v1_0_4
vmap lib_cdc_v1_0_3 riviera/lib_cdc_v1_0_3
vmap axi_datamover_v5_1_34 riviera/axi_datamover_v5_1_34
vmap axi_sg_v4_1_18 riviera/axi_sg_v4_1_18
vmap axi_dma_v7_1_33 riviera/axi_dma_v7_1_33
vmap generic_baseblocks_v2_1_2 riviera/generic_baseblocks_v2_1_2
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_32 riviera/axi_register_slice_v2_1_32
vmap axi_data_fifo_v2_1_31 riviera/axi_data_fifo_v2_1_31
vmap axi_crossbar_v2_1_33 riviera/axi_crossbar_v2_1_33
vmap axi_vip_v1_1_18 riviera/axi_vip_v1_1_18
vmap processing_system7_vip_v1_0_20 riviera/processing_system7_vip_v1_0_20
vmap proc_sys_reset_v5_0_15 riviera/proc_sys_reset_v5_0_15
vmap axi_protocol_converter_v2_1_32 riviera/axi_protocol_converter_v2_1_32

vlog -work xilinx_vip  -incr "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"F:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd" \

vcom -work SPWIP -93  -incr \
"../../../bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/a5ad/SpwRegisters_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/a5ad/SpwProtocol_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwLink.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecovClk.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecv.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFront_pkg.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd" \
"../../../bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_SpaceWire_light_AXI_0_0/sim/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.vhd" \

vcom -work lib_pkg_v1_0_4 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/8c68/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_19 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/0a12/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_4 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/1e5a/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_34 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/99f3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_18 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/6f54/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_33 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3e1f/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_axi_dma_0_0/sim/SPW_ZynqSetup_axi_dma_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_2  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_32  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/676c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_31  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/2ccb/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_33  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ef26/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_xbar_0/sim/SPW_ZynqSetup_xbar_0.v" \

vlog -work axi_vip_v1_1_18  -incr "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/1f8d/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_20  -incr "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_processing_system7_0_0/sim/SPW_ZynqSetup_processing_system7_0_0.v" \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_xbar_1/sim/SPW_ZynqSetup_xbar_1.v" \

vcom -work proc_sys_reset_v5_0_15 -93  -incr \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3a26/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_rst_ps7_0_100M_0/sim/SPW_ZynqSetup_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_clk_wiz_0_0/SPW_ZynqSetup_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_clk_wiz_0_0/SPW_ZynqSetup_clk_wiz_0_0.v" \

vlog -work axi_protocol_converter_v2_1_32  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d59d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/d47c/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/3242" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l SPWIP -l lib_pkg_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l lib_cdc_v1_0_3 -l axi_datamover_v5_1_34 -l axi_sg_v4_1_18 -l axi_dma_v7_1_33 -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_32 -l axi_data_fifo_v2_1_31 -l axi_crossbar_v2_1_33 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l proc_sys_reset_v5_0_15 -l axi_protocol_converter_v2_1_32 \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_auto_pc_0/sim/SPW_ZynqSetup_auto_pc_0.v" \
"../../../bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_auto_pc_1/sim/SPW_ZynqSetup_auto_pc_1.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SPW_ZynqSetup/sim/SPW_ZynqSetup.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

