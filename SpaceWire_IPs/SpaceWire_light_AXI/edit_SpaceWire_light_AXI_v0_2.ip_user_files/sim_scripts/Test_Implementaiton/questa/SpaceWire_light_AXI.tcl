

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "SpaceWire_light_AXI" "NUM_INSTANCES" "DEVICE_ID"  "C_AXI_Register_BASEADDR" "C_AXI_Register_HIGHADDR"
}
