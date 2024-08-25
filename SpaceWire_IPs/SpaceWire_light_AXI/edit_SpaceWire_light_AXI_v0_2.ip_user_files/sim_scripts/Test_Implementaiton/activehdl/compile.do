transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_17
vlib activehdl/processing_system7_vip_v1_0_19
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_3
vlib activehdl/proc_sys_reset_v5_0_15
vlib activehdl/SPWIP
vlib activehdl/xlconcat_v2_1_6
vlib activehdl/generic_baseblocks_v2_1_2
vlib activehdl/axi_register_slice_v2_1_31
vlib activehdl/fifo_generator_v13_2_10
vlib activehdl/axi_data_fifo_v2_1_30
vlib activehdl/axi_crossbar_v2_1_32
vlib activehdl/lib_pkg_v1_0_4
vlib activehdl/lib_fifo_v1_0_19
vlib activehdl/lib_srl_fifo_v1_0_4
vlib activehdl/axi_datamover_v5_1_33
vlib activehdl/axi_sg_v4_1_18
vlib activehdl/axi_dma_v7_1_32
vlib activehdl/axi_protocol_converter_v2_1_31

vmap xilinx_vip activehdl/xilinx_vip
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_17 activehdl/axi_vip_v1_1_17
vmap processing_system7_vip_v1_0_19 activehdl/processing_system7_vip_v1_0_19
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_3 activehdl/lib_cdc_v1_0_3
vmap proc_sys_reset_v5_0_15 activehdl/proc_sys_reset_v5_0_15
vmap SPWIP activehdl/SPWIP
vmap xlconcat_v2_1_6 activehdl/xlconcat_v2_1_6
vmap generic_baseblocks_v2_1_2 activehdl/generic_baseblocks_v2_1_2
vmap axi_register_slice_v2_1_31 activehdl/axi_register_slice_v2_1_31
vmap fifo_generator_v13_2_10 activehdl/fifo_generator_v13_2_10
vmap axi_data_fifo_v2_1_30 activehdl/axi_data_fifo_v2_1_30
vmap axi_crossbar_v2_1_32 activehdl/axi_crossbar_v2_1_32
vmap lib_pkg_v1_0_4 activehdl/lib_pkg_v1_0_4
vmap lib_fifo_v1_0_19 activehdl/lib_fifo_v1_0_19
vmap lib_srl_fifo_v1_0_4 activehdl/lib_srl_fifo_v1_0_4
vmap axi_datamover_v5_1_33 activehdl/axi_datamover_v5_1_33
vmap axi_sg_v4_1_18 activehdl/axi_sg_v4_1_18
vmap axi_dma_v7_1_32 activehdl/axi_dma_v7_1_32
vmap axi_protocol_converter_v2_1_31 activehdl/axi_protocol_converter_v2_1_31

vlog -work xilinx_vip  -sv2k12 "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_17  -sv2k12 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/4d04/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_19  -sv2k12 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_processing_system7_0_1/sim/Test_Implementaiton_processing_system7_0_1.v" \

vcom -work lib_cdc_v1_0_3 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_15 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3a26/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/sim/Test_Implementaiton_rst_ps7_0_100M_2.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/hdl/SpaceWire_light_AXI.vhd" \

vcom -work SPWIP -93  \
"../../../bd/Test_Implementaiton/ipshared/20d9/a5ad/ModuleMap_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/a5ad/SpwRegisters_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwStream_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/a5ad/SpwProtocol_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwLink.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwRam.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwRecovClk.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwRecv.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/eda7/SpwXmit_fast_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/a803/SpwRecvFrontXor.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/a803/SpwRecvFront_pkg.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwReset.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/b243/SpwStream.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/eda7/SpwXmit_fast.vhd" \
"../../../bd/Test_Implementaiton/ipshared/20d9/eda7/SyncDff.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_SpaceWire_light_AXI_0_2/sim/Test_Implementaiton_SpaceWire_light_AXI_0_2.vhd" \

vlog -work xlconcat_v2_1_6  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/6120/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_xlconcat_0_0/sim/Test_Implementaiton_xlconcat_0_0.v" \

vlog -work generic_baseblocks_v2_1_2  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_31  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/92b2/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_10  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_30  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/9692/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_32  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/e9d8/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_3/sim/Test_Implementaiton_xbar_3.v" \

vcom -work lib_pkg_v1_0_4 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/8c68/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_19 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/0a12/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_4 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/1e5a/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_33 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/bf20/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_18 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/6f54/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_32 -93  \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/8830/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_axi_dma_0_3/sim/Test_Implementaiton_axi_dma_0_3.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_4/sim/Test_Implementaiton_xbar_4.v" \

vlog -work axi_protocol_converter_v2_1_31  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/3c06/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/ec67/hdl" "+incdir+../../../../edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ipshared/b28c/hdl" "+incdir+F:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_17 -l processing_system7_vip_v1_0_19 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l SPWIP -l xlconcat_v2_1_6 -l generic_baseblocks_v2_1_2 -l axi_register_slice_v2_1_31 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_30 -l axi_crossbar_v2_1_32 -l lib_pkg_v1_0_4 -l lib_fifo_v1_0_19 -l lib_srl_fifo_v1_0_4 -l axi_datamover_v5_1_33 -l axi_sg_v4_1_18 -l axi_dma_v7_1_32 -l axi_protocol_converter_v2_1_31 \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_0/sim/Test_Implementaiton_auto_pc_0.v" \
"../../../bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_1/sim/Test_Implementaiton_auto_pc_1.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Test_Implementaiton/sim/Test_Implementaiton.vhd" \

vlog -work xil_defaultlib \
"glbl.v"
