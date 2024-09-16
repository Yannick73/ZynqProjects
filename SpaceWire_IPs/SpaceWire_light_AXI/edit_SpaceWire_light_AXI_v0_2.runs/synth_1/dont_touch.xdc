# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/SPW_mainclk.xdc

# XDC: new/SPW_pins.xdc

# Block Designs: bd/Test_Implementaiton/Test_Implementaiton.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton || ORIG_REF_NAME==Test_Implementaiton} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_processing_system7_0_1/Test_Implementaiton_processing_system7_0_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_processing_system7_0_1 || ORIG_REF_NAME==Test_Implementaiton_processing_system7_0_1} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/Test_Implementaiton_rst_ps7_0_100M_2.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2 || ORIG_REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_SpaceWire_light_AXI_0_2/Test_Implementaiton_SpaceWire_light_AXI_0_2.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_SpaceWire_light_AXI_0_2 || ORIG_REF_NAME==Test_Implementaiton_SpaceWire_light_AXI_0_2} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_3/Test_Implementaiton_xbar_3.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_xbar_3 || ORIG_REF_NAME==Test_Implementaiton_xbar_3} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_0/Test_Implementaiton_auto_pc_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_auto_pc_0 || ORIG_REF_NAME==Test_Implementaiton_auto_pc_0} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_ps7_0_axi_periph_1/Test_Implementaiton_ps7_0_axi_periph_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_ps7_0_axi_periph_1 || ORIG_REF_NAME==Test_Implementaiton_ps7_0_axi_periph_1} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_axi_dma_0_3/Test_Implementaiton_axi_dma_0_3.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_axi_dma_0_3 || ORIG_REF_NAME==Test_Implementaiton_axi_dma_0_3} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_xbar_4/Test_Implementaiton_xbar_4.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_xbar_4 || ORIG_REF_NAME==Test_Implementaiton_xbar_4} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_1/Test_Implementaiton_auto_pc_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_auto_pc_1 || ORIG_REF_NAME==Test_Implementaiton_auto_pc_1} -quiet] -quiet

# IP: bd/Test_Implementaiton/ip/Test_Implementaiton_axi_mem_intercon_1/Test_Implementaiton_axi_mem_intercon_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==Test_Implementaiton_axi_mem_intercon_1 || ORIG_REF_NAME==Test_Implementaiton_axi_mem_intercon_1} -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_processing_system7_0_1/Test_Implementaiton_processing_system7_0_1.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==Test_Implementaiton_processing_system7_0_1 || ORIG_REF_NAME==Test_Implementaiton_processing_system7_0_1} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/Test_Implementaiton_rst_ps7_0_100M_2_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2 || ORIG_REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_rst_ps7_0_100M_2/Test_Implementaiton_rst_ps7_0_100M_2.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2 || ORIG_REF_NAME==Test_Implementaiton_rst_ps7_0_100M_2} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_0/Test_Implementaiton_auto_pc_0_ooc.xdc

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_axi_dma_0_3/Test_Implementaiton_axi_dma_0_3.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==Test_Implementaiton_axi_dma_0_3 || ORIG_REF_NAME==Test_Implementaiton_axi_dma_0_3} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_axi_dma_0_3/Test_Implementaiton_axi_dma_0_3_clocks.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==Test_Implementaiton_axi_dma_0_3 || ORIG_REF_NAME==Test_Implementaiton_axi_dma_0_3} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/ip/Test_Implementaiton_auto_pc_1/Test_Implementaiton_auto_pc_1_ooc.xdc

# XDC: f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/Test_Implementaiton/Test_Implementaiton_ooc.xdc