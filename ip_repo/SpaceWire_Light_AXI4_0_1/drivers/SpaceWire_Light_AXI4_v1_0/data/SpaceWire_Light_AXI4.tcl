

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "SpaceWire_Light_AXI4" "NUM_INSTANCES" "DEVICE_ID"  "C_AXI_registers_BASEADDR" "C_AXI_registers_HIGHADDR"
}
