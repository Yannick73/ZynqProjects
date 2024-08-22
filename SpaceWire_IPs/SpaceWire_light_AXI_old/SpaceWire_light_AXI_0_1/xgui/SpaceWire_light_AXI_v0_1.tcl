# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_static_text $IPINST -name "Description" -parent ${Page_0} -text {SpaceWire light AXI peripheral

Sysfreq: 	Main clock in Hz
Txclkfreq:	Transmit clock in Hz
Rxchunk:	Bits, that can be received per Sysfreq-clock
Rxfifosize Bits:	FIFO of size 2^n bits
Irq Block:	A set bit of this mask blocks the corresponding interrupt from triggering the IRQ pin

Controlling the device is done using the ControlRegister AXI bus and writing/reading the relevant registers.
Sending and Receiving data is done using AXI stream bus. To denote between data and control, a simple escape character scheme with 0x7D is used.}

  ipgui::add_param $IPINST -name "SYSFREQ"
  ipgui::add_param $IPINST -name "TXCLKFREQ"
  ipgui::add_param $IPINST -name "RXCHUNK" -widget comboBox
  ipgui::add_param $IPINST -name "RXFIFOSIZE_BITS"
  ipgui::add_param $IPINST -name "TXFIFOSIZE_BITS"
  ipgui::add_param $IPINST -name "IRQ_BLOCK"

}

proc update_PARAM_VALUE.IRQ_BLOCK { PARAM_VALUE.IRQ_BLOCK } {
	# Procedure called to update IRQ_BLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IRQ_BLOCK { PARAM_VALUE.IRQ_BLOCK } {
	# Procedure called to validate IRQ_BLOCK
	return true
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

proc update_PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH { PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH } {
	# Procedure called to update C_S_AXI_Stream_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH { PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXI_Stream_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH { PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_ControlRegister_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH { PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_ControlRegister_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ControlRegister_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ControlRegister_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ControlRegister_BASEADDR { PARAM_VALUE.C_S_AXI_ControlRegister_BASEADDR } {
	# Procedure called to update C_S_AXI_ControlRegister_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ControlRegister_BASEADDR { PARAM_VALUE.C_S_AXI_ControlRegister_BASEADDR } {
	# Procedure called to validate C_S_AXI_ControlRegister_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ControlRegister_HIGHADDR { PARAM_VALUE.C_S_AXI_ControlRegister_HIGHADDR } {
	# Procedure called to update C_S_AXI_ControlRegister_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ControlRegister_HIGHADDR { PARAM_VALUE.C_S_AXI_ControlRegister_HIGHADDR } {
	# Procedure called to validate C_S_AXI_ControlRegister_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_Stream_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_INTR_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_INTR_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S_AXI_INTR_DATA_WIDTH". Setting updated value from the model parameter.
set_property value 32 ${MODELPARAM_VALUE.C_S_AXI_INTR_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_INTR_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_INTR_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_S_AXI_INTR_ADDR_WIDTH". Setting updated value from the model parameter.
set_property value 5 ${MODELPARAM_VALUE.C_S_AXI_INTR_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_NUM_OF_INTR { MODELPARAM_VALUE.C_NUM_OF_INTR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_NUM_OF_INTR". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.C_NUM_OF_INTR}
}

proc update_MODELPARAM_VALUE.C_INTR_SENSITIVITY { MODELPARAM_VALUE.C_INTR_SENSITIVITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_INTR_SENSITIVITY". Setting updated value from the model parameter.
set_property value 0xFFFFFFFF ${MODELPARAM_VALUE.C_INTR_SENSITIVITY}
}

proc update_MODELPARAM_VALUE.C_INTR_ACTIVE_STATE { MODELPARAM_VALUE.C_INTR_ACTIVE_STATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_INTR_ACTIVE_STATE". Setting updated value from the model parameter.
set_property value 0xFFFFFFFF ${MODELPARAM_VALUE.C_INTR_ACTIVE_STATE}
}

proc update_MODELPARAM_VALUE.C_IRQ_SENSITIVITY { MODELPARAM_VALUE.C_IRQ_SENSITIVITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_IRQ_SENSITIVITY". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.C_IRQ_SENSITIVITY}
}

proc update_MODELPARAM_VALUE.C_IRQ_ACTIVE_STATE { MODELPARAM_VALUE.C_IRQ_ACTIVE_STATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "C_IRQ_ACTIVE_STATE". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.C_IRQ_ACTIVE_STATE}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ControlRegister_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ControlRegister_ADDR_WIDTH}
}

