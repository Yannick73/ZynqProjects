transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+UART_Adder  -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_17 -L processing_system7_vip_v1_0_19 -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_4 -L lib_srl_fifo_v1_0_4 -L lib_cdc_v1_0_3 -L axi_uartlite_v2_0_35 -L proc_sys_reset_v5_0_15 -L generic_baseblocks_v2_1_2 -L fifo_generator_v13_2_10 -L axi_data_fifo_v2_1_30 -L axi_register_slice_v2_1_31 -L axi_protocol_converter_v2_1_31 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.UART_Adder xil_defaultlib.glbl

do {UART_Adder.udo}

run 1000ns

endsim

quit -force