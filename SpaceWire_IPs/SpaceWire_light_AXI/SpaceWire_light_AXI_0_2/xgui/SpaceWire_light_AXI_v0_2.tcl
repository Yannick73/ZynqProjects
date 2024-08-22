# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "C_AXI_Register_BASEADDR"
  ipgui::add_param $IPINST -name "C_AXI_Register_HIGHADDR"
  set SYSFREQ [ipgui::add_param $IPINST -name "SYSFREQ"]
  set_property tooltip {Main clock frequency of the core} ${SYSFREQ}
  set TXCLKFREQ [ipgui::add_param $IPINST -name "TXCLKFREQ"]
  set_property tooltip {Clock frequency of the transmitter. Needs to be the same, or multiple, of the transmitting bitrate.} ${TXCLKFREQ}
  set RXCHUNK [ipgui::add_param $IPINST -name "RXCHUNK" -widget comboBox]
  set_property tooltip {The number of bits, that can be received per main core clock.} ${RXCHUNK}
  set RXFIFOSIZE_BITS [ipgui::add_param $IPINST -name "RXFIFOSIZE_BITS"]
  set_property tooltip {Adress size of the RX FIFO. FIFO size is 2^bits.} ${RXFIFOSIZE_BITS}
  set TXFIFOSIZE_BITS [ipgui::add_param $IPINST -name "TXFIFOSIZE_BITS"]
  set_property tooltip {Adress size of the TX FIFO. FIFO size is 2^bits.} ${TXFIFOSIZE_BITS}

}

proc update_PARAM_VALUE.RXCHUNK { PARAM_VALUE.RXCHUNK } {
	# Procedure called to update RXCHUNK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RXCHUNK { PARAM_VALUE.RXCHUNK } {
	# Procedure called to validate RXCHUNK
	return true
}

proc update_PARAM_VALUE.RXFIFOSIZE_BITS { PARAM_VALUE.RXFIFOSIZE_BITS } {
	# Procedure called to update RXFIFOSIZE_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RXFIFOSIZE_BITS { PARAM_VALUE.RXFIFOSIZE_BITS } {
	# Procedure called to validate RXFIFOSIZE_BITS
	return true
}

proc update_PARAM_VALUE.SYSFREQ { PARAM_VALUE.SYSFREQ } {
	# Procedure called to update SYSFREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYSFREQ { PARAM_VALUE.SYSFREQ } {
	# Procedure called to validate SYSFREQ
	return true
}

proc update_PARAM_VALUE.TXCLKFREQ { PARAM_VALUE.TXCLKFREQ } {
	# Procedure called to update TXCLKFREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TXCLKFREQ { PARAM_VALUE.TXCLKFREQ } {
	# Procedure called to validate TXCLKFREQ
	return true
}

proc update_PARAM_VALUE.TXFIFOSIZE_BITS { PARAM_VALUE.TXFIFOSIZE_BITS } {
	# Procedure called to update TXFIFOSIZE_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TXFIFOSIZE_BITS { PARAM_VALUE.TXFIFOSIZE_BITS } {
	# Procedure called to validate TXFIFOSIZE_BITS
	return true
}

proc update_PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH { PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH } {
	# Procedure called to update C_AXI_StreamOut_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH { PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH } {
	# Procedure called to validate C_AXI_StreamOut_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_StreamOut_START_COUNT { PARAM_VALUE.C_AXI_StreamOut_START_COUNT } {
	# Procedure called to update C_AXI_StreamOut_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_StreamOut_START_COUNT { PARAM_VALUE.C_AXI_StreamOut_START_COUNT } {
	# Procedure called to validate C_AXI_StreamOut_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_AXI_Register_DATA_WIDTH { PARAM_VALUE.C_AXI_Register_DATA_WIDTH } {
	# Procedure called to update C_AXI_Register_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_Register_DATA_WIDTH { PARAM_VALUE.C_AXI_Register_DATA_WIDTH } {
	# Procedure called to validate C_AXI_Register_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_Register_ADDR_WIDTH { PARAM_VALUE.C_AXI_Register_ADDR_WIDTH } {
	# Procedure called to update C_AXI_Register_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_Register_ADDR_WIDTH { PARAM_VALUE.C_AXI_Register_ADDR_WIDTH } {
	# Procedure called to validate C_AXI_Register_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_Register_BASEADDR { PARAM_VALUE.C_AXI_Register_BASEADDR } {
	# Procedure called to update C_AXI_Register_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_Register_BASEADDR { PARAM_VALUE.C_AXI_Register_BASEADDR } {
	# Procedure called to validate C_AXI_Register_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_AXI_Register_HIGHADDR { PARAM_VALUE.C_AXI_Register_HIGHADDR } {
	# Procedure called to update C_AXI_Register_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_Register_HIGHADDR { PARAM_VALUE.C_AXI_Register_HIGHADDR } {
	# Procedure called to validate C_AXI_Register_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH { PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH } {
	# Procedure called to update C_AXI_StreamIn_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH { PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH } {
	# Procedure called to validate C_AXI_StreamIn_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH { MODELPARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_AXI_StreamOut_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_StreamOut_START_COUNT { MODELPARAM_VALUE.C_AXI_StreamOut_START_COUNT PARAM_VALUE.C_AXI_StreamOut_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_StreamOut_START_COUNT}] ${MODELPARAM_VALUE.C_AXI_StreamOut_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_AXI_Register_DATA_WIDTH { MODELPARAM_VALUE.C_AXI_Register_DATA_WIDTH PARAM_VALUE.C_AXI_Register_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_Register_DATA_WIDTH}] ${MODELPARAM_VALUE.C_AXI_Register_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_Register_ADDR_WIDTH { MODELPARAM_VALUE.C_AXI_Register_ADDR_WIDTH PARAM_VALUE.C_AXI_Register_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_Register_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_AXI_Register_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH { MODELPARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_AXI_StreamIn_TDATA_WIDTH}
}

