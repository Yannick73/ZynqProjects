# -- ================================================================================ --
# -- NEORV32 - Vivado IP Packaging + Customization GUI Setup                          --
# -- -------------------------------------------------------------------------------- --
# -- This scripts packages the entire processor as Vivado IP module including a fancy --
# -- customization GUI. See the NEORV32 Datasheet & User Guide for more information.  --
# -- -------------------------------------------------------------------------------- --
# -- The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              --
# -- Copyright (c) NEORV32 contributors.                                              --
# -- Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  --
# -- Licensed under the BSD-3-Clause license, see LICENSE for details.                --
# -- SPDX-License-Identifier: BSD-3-Clause                                            --
# -- ================================================================================ --


# **************************************************************
# Global configuration
# **************************************************************
set neorv32_home ../..
set ip_top neorv32_vivado_ip
set ip_logo docs/figures/neorv32_logo_riscv_small.png
set outputdir neorv32_vivado_ip_work
set cur_dir [file normalize .]


# **************************************************************
# Create empty (!) output/working directory
# **************************************************************
file mkdir $outputdir
set files [glob -nocomplain "$outputdir/*"]
if {[llength $files] != 0} {
  puts "DELETING ALL FILES in $outputdir"
  file delete -force {*}[glob -directory $outputdir *];
}


# **************************************************************
# Create Vivado project
# **************************************************************
create_project "neorv32-ip" $outputdir
#set_property target_language VHDL [current_project]


# **************************************************************
# Import HDL source files
# **************************************************************

# read and process NEORV32 SoC file list
set file_list_file [read [open "$neorv32_home/rtl/file_list_soc.f" r]]
set file_list [string map [list "NEORV32_RTL_PATH_PLACEHOLDER" "$neorv32_home/rtl"] $file_list_file]
puts "NEORV32 source files:"
puts $file_list
add_files $file_list
set_property library neorv32 [get_files $file_list]

# IP top module
add_file $neorv32_home/rtl/system_integration/$ip_top.vhd
set_property top $ip_top [current_fileset]

update_compile_order -fileset sources_1


# **************************************************************
# Package as IP block
# **************************************************************
ipx::package_project -root_dir $outputdir/packaged_ip -vendor NEORV32 -library user -taxonomy /UserIP -import_files -set_current true -force
set_property company_url https://github.com/stnolting/neorv32 [ipx::current_core]
set_property description "The NEORV32 RISC-V Processor" [ipx::current_core]


# **************************************************************
# Set configuration dependencies: Interfaces
# **************************************************************
set_property enablement_dependency {$axi4_stream_en = true}      [ipx::get_ports s0_axis_*    -of_objects [ipx::current_core]]
set_property enablement_dependency {$axi4_stream_en = true}      [ipx::get_ports s1_axis_*    -of_objects [ipx::current_core]]
set_property enablement_dependency {$on_chip_debugger_en = true} [ipx::get_ports jtag_*       -of_objects [ipx::current_core]]
set_property enablement_dependency {$xip_en = true}              [ipx::get_ports xip_*        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_gpio_en = true}          [ipx::get_ports gpio_i       -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_gpio_en = true}          [ipx::get_ports gpio_o       -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_uart0_en = true}         [ipx::get_ports uart0_*      -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_uart1_en = true}         [ipx::get_ports uart1_*      -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_spi_en = true}           [ipx::get_ports spi_*        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_sdi_en = true}           [ipx::get_ports sdi_*        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_twi_en = true}           [ipx::get_ports twi_*        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_onewire_en = true}       [ipx::get_ports onewire_*    -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_pwm_en = true}           [ipx::get_ports pwm_o        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_cfs_en = true}           [ipx::get_ports cfs_*        -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_neoled_en = true}        [ipx::get_ports neoled_o     -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_mtime_en = true}         [ipx::get_ports mtime_time_o -of_objects [ipx::current_core]]
set_property enablement_dependency {$xirq_en = true}             [ipx::get_ports xirq_i       -of_objects [ipx::current_core]]
set_property enablement_dependency {$io_mtime_en = false}        [ipx::get_ports mtime_irq_i  -of_objects [ipx::current_core]]


# **************************************************************
# Configuration GUI: General
# **************************************************************
set_property display_name {Clock frequency (Hz)}                                   [ipgui::get_guiparamspec -name "CLOCK_FREQUENCY"       -component [ipx::current_core]]
set_property tooltip      {Frequency of the clk signal in Hz}                      [ipgui::get_guiparamspec -name "CLOCK_FREQUENCY"       -component [ipx::current_core]]
set_property display_name {HART ID}                                                [ipgui::get_guiparamspec -name "HART_ID"               -component [ipx::current_core]]
set_property tooltip      {For mhartid CSR}                                        [ipgui::get_guiparamspec -name "HART_ID"               -component [ipx::current_core]]
set_property display_name {JEDEC ID}                                               [ipgui::get_guiparamspec -name "JEDEC_ID"              -component [ipx::current_core]]
set_property tooltip      {For JTAG tap identification and mvendorid CSR}          [ipgui::get_guiparamspec -name "JEDEC_ID"              -component [ipx::current_core]]
set_property display_name {On-Chip Debugger}                                       [ipgui::get_guiparamspec -name "ON_CHIP_DEBUGGER_EN"   -component [ipx::current_core]]
set_property display_name {AXI4-Lite (XBUS) timeout}                               [ipgui::get_guiparamspec -name "XBUS_TIMEOUT"          -component [ipx::current_core]]
set_property tooltip      {Max number of clock cycles before AXI access times out} [ipgui::get_guiparamspec -name "XBUS_TIMEOUT"          -component [ipx::current_core]]
set_property display_name {AXI4-Lite cache (XBUS)}                                 [ipgui::get_guiparamspec -name "XBUS_CACHE_EN"         -component [ipx::current_core]]
set_property display_name {AXI4-Lite cache (XBUS) number of blocks}                [ipgui::get_guiparamspec -name "XBUS_CACHE_NUM_BLOCKS" -component [ipx::current_core]]
set_property display_name {AXI4-Lite cache (XBUS) block size}                      [ipgui::get_guiparamspec -name "XBUS_CACHE_BLOCK_SIZE" -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                          [ipgui::get_guiparamspec -name "XBUS_CACHE_BLOCK_SIZE" -component [ipx::current_core]]
set_property display_name {AXI4-Stream source and sink}                            [ipgui::get_guiparamspec -name "AXI4_STREAM_EN"        -component [ipx::current_core]]
set_property display_name {AXI4-Stream input FIFO depth}                           [ipgui::get_guiparamspec -name "IO_SLINK_RX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}                 [ipgui::get_guiparamspec -name "IO_SLINK_RX_FIFO"      -component [ipx::current_core]]
set_property display_name {AXI4-Stream output FIFO depth}                          [ipgui::get_guiparamspec -name "IO_SLINK_TX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}                 [ipgui::get_guiparamspec -name "IO_SLINK_TX_FIFO"      -component [ipx::current_core]]

ipgui::add_group -name {General} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]] -display_name {General}
ipgui::move_group -component [ipx::current_core] -order  0 [ipgui::get_groupspec    -name "General"               -component [ipx::current_core]] -parent [ipgui::get_pagespec  -name "Page 0"  -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  0 [ipgui::get_guiparamspec -name "CLOCK_FREQUENCY"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  1 [ipgui::get_guiparamspec -name "HART_ID"               -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  2 [ipgui::get_guiparamspec -name "JEDEC_ID"              -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  3 [ipgui::get_guiparamspec -name "ON_CHIP_DEBUGGER_EN"   -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  4 [ipgui::get_guiparamspec -name "XBUS_TIMEOUT"          -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  5 [ipgui::get_guiparamspec -name "XBUS_CACHE_EN"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  6 [ipgui::get_guiparamspec -name "XBUS_CACHE_NUM_BLOCKS" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  7 [ipgui::get_guiparamspec -name "XBUS_CACHE_BLOCK_SIZE" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  8 [ipgui::get_guiparamspec -name "AXI4_STREAM_EN"        -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  9 [ipgui::get_guiparamspec -name "IO_SLINK_RX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 10 [ipgui::get_guiparamspec -name "IO_SLINK_TX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "General" -component [ipx::current_core]]


# **************************************************************
# Configuration GUI: CPU
# **************************************************************
set_property display_name {RISC-V C ISA extension}                         [ipgui::get_guiparamspec -name "RISCV_ISA_C"         -component [ipx::current_core]]
set_property tooltip      {Compressed instructions}                        [ipgui::get_guiparamspec -name "RISCV_ISA_C"         -component [ipx::current_core]]
set_property display_name {RISC-V E ISA extension}                         [ipgui::get_guiparamspec -name "RISCV_ISA_E"         -component [ipx::current_core]]
set_property tooltip      {Reduced register file size (16 registers only)} [ipgui::get_guiparamspec -name "RISCV_ISA_E"         -component [ipx::current_core]]
set_property display_name {RISC-V M ISA extension}                         [ipgui::get_guiparamspec -name "RISCV_ISA_M"         -component [ipx::current_core]]
set_property tooltip      {Integer multiplication and division hardware}   [ipgui::get_guiparamspec -name "RISCV_ISA_M"         -component [ipx::current_core]]
set_property display_name {RISC-V U ISA extension}                         [ipgui::get_guiparamspec -name "RISCV_ISA_U"         -component [ipx::current_core]]
set_property tooltip      {Less-privileged user-mode}                      [ipgui::get_guiparamspec -name "RISCV_ISA_U"         -component [ipx::current_core]]
set_property display_name {RISC-V Zalrsc ISA extension}                    [ipgui::get_guiparamspec -name "RISCV_ISA_Zalrsc"    -component [ipx::current_core]]
set_property tooltip      {Atomic reservation-set instructions}            [ipgui::get_guiparamspec -name "RISCV_ISA_Zalrsc"    -component [ipx::current_core]]
set_property display_name {RISC-V Zba ISA extension}                       [ipgui::get_guiparamspec -name "RISCV_ISA_Zba"       -component [ipx::current_core]]
set_property tooltip      {Shifted-add bit-manipulation instructions}      [ipgui::get_guiparamspec -name "RISCV_ISA_Zba"       -component [ipx::current_core]]
set_property display_name {RISC-V Zbb ISA extension}                       [ipgui::get_guiparamspec -name "RISCV_ISA_Zbb"       -component [ipx::current_core]]
set_property tooltip      {Basic bit-manipulation instructions}            [ipgui::get_guiparamspec -name "RISCV_ISA_Zbb"       -component [ipx::current_core]]
set_property display_name {RISC-V Zfinx ISA extension}                     [ipgui::get_guiparamspec -name "RISCV_ISA_Zfinx"     -component [ipx::current_core]]
set_property tooltip      {Embedded FPU}                                   [ipgui::get_guiparamspec -name "RISCV_ISA_Zfinx"     -component [ipx::current_core]]
set_property display_name {RISC-V Zihpm ISA extension}                     [ipgui::get_guiparamspec -name "RISCV_ISA_Zihpm"     -component [ipx::current_core]]
set_property tooltip      {Hardware performance monitors (HPMs)}           [ipgui::get_guiparamspec -name "RISCV_ISA_Zihpm"     -component [ipx::current_core]]
set_property display_name {HPM counters}                                   [ipgui::get_guiparamspec -name "HPM_NUM_CNTS"        -component [ipx::current_core]]
set_property tooltip      {Numer of hardware performance monitor counters} [ipgui::get_guiparamspec -name "HPM_NUM_CNTS"        -component [ipx::current_core]]
set_property display_name {HPM width}                                      [ipgui::get_guiparamspec -name "HPM_CNT_WIDTH"       -component [ipx::current_core]]
set_property tooltip      {Counter width in bits}                          [ipgui::get_guiparamspec -name "HPM_CNT_WIDTH"       -component [ipx::current_core]]
set_property display_name {RISC-V Zicntr ISA extension}                    [ipgui::get_guiparamspec -name "RISCV_ISA_Zicntr"    -component [ipx::current_core]]
set_property tooltip      {Base counters (cycles and instructions)}        [ipgui::get_guiparamspec -name "RISCV_ISA_Zicntr"    -component [ipx::current_core]]
set_property display_name {RISC-V Zicond ISA extension}                    [ipgui::get_guiparamspec -name "RISCV_ISA_Zicond"    -component [ipx::current_core]]
set_property tooltip      {Conditional-move instructions}                  [ipgui::get_guiparamspec -name "RISCV_ISA_Zicond"    -component [ipx::current_core]]
set_property display_name {RISC-V Zmmul ISA extension}                     [ipgui::get_guiparamspec -name "RISCV_ISA_Zmmul"     -component [ipx::current_core]]
set_property tooltip      {Integer multiplication-only hardware}           [ipgui::get_guiparamspec -name "RISCV_ISA_Zmmul"     -component [ipx::current_core]]
set_property display_name {NEORV32 Zxcfu ISA extension}                    [ipgui::get_guiparamspec -name "RISCV_ISA_Zxcfu"     -component [ipx::current_core]]
set_property tooltip      {Custom-instructions unit}                       [ipgui::get_guiparamspec -name "RISCV_ISA_Zxcfu"     -component [ipx::current_core]]
set_property display_name {RISC-V Zbkb ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkb"      -component [ipx::current_core]]
set_property tooltip      {Bit manipulation instructions for cryptography} [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkb"      -component [ipx::current_core]]
set_property display_name {RISC-V Zbkc ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkc"      -component [ipx::current_core]]
set_property tooltip      {Carry-less multiply instr. for cryptography}    [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkc"      -component [ipx::current_core]]
set_property display_name {RISC-V Zbkx ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkx"      -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - crossbar permutations}   [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkx"      -component [ipx::current_core]]
set_property display_name {RISC-V Zbs ISA extension}                       [ipgui::get_guiparamspec -name "RISCV_ISA_Zbs"       -component [ipx::current_core]]
set_property tooltip      {Single-bit bit-manipulation instructions}       [ipgui::get_guiparamspec -name "RISCV_ISA_Zbs"       -component [ipx::current_core]]
set_property display_name {RISC-V Zknd ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zknd"      -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - NIST AES decryption}     [ipgui::get_guiparamspec -name "RISCV_ISA_Zknd"      -component [ipx::current_core]]
set_property display_name {RISC-V Zkne ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zkne"      -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - NIST AES encryption}     [ipgui::get_guiparamspec -name "RISCV_ISA_Zkne"      -component [ipx::current_core]]
set_property display_name {RISC-V Zknh ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zknh"      -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - NIST hash functions}     [ipgui::get_guiparamspec -name "RISCV_ISA_Zknh"      -component [ipx::current_core]]
set_property display_name {RISC-V Zksed ISA extension}                     [ipgui::get_guiparamspec -name "RISCV_ISA_Zksed"     -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - ShangMi block cyphers}   [ipgui::get_guiparamspec -name "RISCV_ISA_Zksed"     -component [ipx::current_core]]
set_property display_name {RISC-V Zksh ISA extension}                      [ipgui::get_guiparamspec -name "RISCV_ISA_Zksh"      -component [ipx::current_core]]
set_property tooltip      {Scalar cryptographic - ShangMi hash functions}  [ipgui::get_guiparamspec -name "RISCV_ISA_Zksh"      -component [ipx::current_core]]
set_property display_name {DSP-based multiplier}                           [ipgui::get_guiparamspec -name "FAST_MUL_EN"         -component [ipx::current_core]]
set_property display_name {Barrel shifter}                                 [ipgui::get_guiparamspec -name "FAST_SHIFT_EN"       -component [ipx::current_core]]
set_property display_name {FF-based register file with full HW reset}      [ipgui::get_guiparamspec -name "REGFILE_HW_RST"      -component [ipx::current_core]]
set_property display_name {PMP regions}                                    [ipgui::get_guiparamspec -name "PMP_NUM_REGIONS"     -component [ipx::current_core]]
set_property tooltip      {Number of physical memory protection regions}   [ipgui::get_guiparamspec -name "PMP_NUM_REGIONS"     -component [ipx::current_core]]
set_property display_name {PMP minimal granularity}                        [ipgui::get_guiparamspec -name "PMP_MIN_GRANULARITY" -component [ipx::current_core]]
set_property tooltip      {In bytes (min 4 bytes)}                         [ipgui::get_guiparamspec -name "PMP_MIN_GRANULARITY" -component [ipx::current_core]]
set_property display_name {Enable PMP TOR mode}                            [ipgui::get_guiparamspec -name "PMP_TOR_MODE_EN"     -component [ipx::current_core]]
set_property tooltip      {Top-of-region}                                  [ipgui::get_guiparamspec -name "PMP_TOR_MODE_EN"     -component [ipx::current_core]]
set_property display_name {Enable PMP NA2 and NAPOT modes}                 [ipgui::get_guiparamspec -name "PMP_NAP_MODE_EN"     -component [ipx::current_core]]
set_property tooltip      {Naturally-aligned-power-of-two}                 [ipgui::get_guiparamspec -name "PMP_NAP_MODE_EN"     -component [ipx::current_core]]

ipgui::add_group -name {CPU Configuration} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]] -display_name {CPU Configuration}
ipgui::move_group -component [ipx::current_core] -order  1 [ipgui::get_groupspec    -name "CPU Configuration"   -component [ipx::current_core]] -parent [ipgui::get_pagespec  -name "Page 0"            -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  0 [ipgui::get_guiparamspec -name "RISCV_ISA_C"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  1 [ipgui::get_guiparamspec -name "RISCV_ISA_E"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  2 [ipgui::get_guiparamspec -name "RISCV_ISA_M"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  3 [ipgui::get_guiparamspec -name "RISCV_ISA_U"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  4 [ipgui::get_guiparamspec -name "RISCV_ISA_Zalrsc"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  5 [ipgui::get_guiparamspec -name "RISCV_ISA_Zba"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  6 [ipgui::get_guiparamspec -name "RISCV_ISA_Zbb"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  7 [ipgui::get_guiparamspec -name "RISCV_ISA_Zfinx"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  8 [ipgui::get_guiparamspec -name "RISCV_ISA_Zihpm"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  9 [ipgui::get_guiparamspec -name "HPM_NUM_CNTS"        -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 10 [ipgui::get_guiparamspec -name "HPM_CNT_WIDTH"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 11 [ipgui::get_guiparamspec -name "RISCV_ISA_Zicntr"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 12 [ipgui::get_guiparamspec -name "RISCV_ISA_Zicond"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 13 [ipgui::get_guiparamspec -name "RISCV_ISA_Zmmul"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 14 [ipgui::get_guiparamspec -name "RISCV_ISA_Zxcfu"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 15 [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkb"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 16 [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkc"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 17 [ipgui::get_guiparamspec -name "RISCV_ISA_Zbkx"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 18 [ipgui::get_guiparamspec -name "RISCV_ISA_Zbs"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 19 [ipgui::get_guiparamspec -name "RISCV_ISA_Zknd"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 20 [ipgui::get_guiparamspec -name "RISCV_ISA_Zkne"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 21 [ipgui::get_guiparamspec -name "RISCV_ISA_Zknh"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 22 [ipgui::get_guiparamspec -name "RISCV_ISA_Zksed"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 23 [ipgui::get_guiparamspec -name "RISCV_ISA_Zksh"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 24 [ipgui::get_guiparamspec -name "FAST_MUL_EN"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 25 [ipgui::get_guiparamspec -name "FAST_SHIFT_EN"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 26 [ipgui::get_guiparamspec -name "REGFILE_HW_RST"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 27 [ipgui::get_guiparamspec -name "PMP_NUM_REGIONS"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 28 [ipgui::get_guiparamspec -name "PMP_MIN_GRANULARITY" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 29 [ipgui::get_guiparamspec -name "PMP_TOR_MODE_EN"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 30 [ipgui::get_guiparamspec -name "PMP_NAP_MODE_EN"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "CPU Configuration" -component [ipx::current_core]]


# **************************************************************
# Configuration GUI: Memory System
# **************************************************************
set_property display_name {Internal instruction memory (IMEM)}                   [ipgui::get_guiparamspec -name "MEM_INT_IMEM_EN"      -component [ipx::current_core]]
set_property display_name {Internal instruction memory size}                     [ipgui::get_guiparamspec -name "MEM_INT_IMEM_SIZE"    -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                        [ipgui::get_guiparamspec -name "MEM_INT_IMEM_SIZE"    -component [ipx::current_core]]
set_property display_name {Internal data memory (DMEM)}                          [ipgui::get_guiparamspec -name "MEM_INT_DMEM_EN"      -component [ipx::current_core]]
set_property display_name {Internal data memory size}                            [ipgui::get_guiparamspec -name "MEM_INT_DMEM_SIZE"    -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                        [ipgui::get_guiparamspec -name "MEM_INT_DMEM_SIZE"    -component [ipx::current_core]]
set_property display_name {CPU instruction cache (ICACHE)}                       [ipgui::get_guiparamspec -name "ICACHE_EN"            -component [ipx::current_core]]
set_property display_name {CPU instruction cache (ICACHE) number of blocks}      [ipgui::get_guiparamspec -name "ICACHE_NUM_BLOCKS"    -component [ipx::current_core]]
set_property display_name {CPU instruction cache (ICACHE) block size}            [ipgui::get_guiparamspec -name "ICACHE_BLOCK_SIZE"    -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                        [ipgui::get_guiparamspec -name "ICACHE_BLOCK_SIZE"    -component [ipx::current_core]]
set_property display_name {CPU data cache (DCACHE)}                              [ipgui::get_guiparamspec -name "DCACHE_EN"            -component [ipx::current_core]]
set_property display_name {CPU data cache (DCACHE) number of blocks}             [ipgui::get_guiparamspec -name "DCACHE_NUM_BLOCKS"    -component [ipx::current_core]]
set_property display_name {CPU data cache (DCACHE) block size}                   [ipgui::get_guiparamspec -name "DCACHE_BLOCK_SIZE"    -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                        [ipgui::get_guiparamspec -name "DCACHE_BLOCK_SIZE"    -component [ipx::current_core]]
set_property display_name {Execute in-place module (XIP)}                        [ipgui::get_guiparamspec -name "XIP_EN"               -component [ipx::current_core]]
set_property display_name {Execute in-place module (XIP) cache}                  [ipgui::get_guiparamspec -name "XIP_CACHE_EN"         -component [ipx::current_core]]
set_property display_name {Execute in-place module (XIP) cache number of blocks} [ipgui::get_guiparamspec -name "XIP_CACHE_NUM_BLOCKS" -component [ipx::current_core]]
set_property display_name {Execute in-place module (XIP) cache block size}       [ipgui::get_guiparamspec -name "XIP_CACHE_BLOCK_SIZE" -component [ipx::current_core]]
set_property tooltip      {In bytes (use a power of two)}                        [ipgui::get_guiparamspec -name "XIP_CACHE_BLOCK_SIZE" -component [ipx::current_core]]
set_property display_name {Internal bootloader}                                  [ipgui::get_guiparamspec -name "INT_BOOTLOADER_EN"    -component [ipx::current_core]]
set_property tooltip {Start interactive bootloader console after reset}          [ipgui::get_guiparamspec -name "INT_BOOTLOADER_EN"    -component [ipx::current_core]]

ipgui::add_group -name {Memory System} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]] -display_name {Memory System}
ipgui::move_group -component [ipx::current_core] -order  2 [ipgui::get_groupspec    -name "Memory System"        -component [ipx::current_core]] -parent [ipgui::get_pagespec  -name "Page 0"        -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  0 [ipgui::get_guiparamspec -name "MEM_INT_IMEM_EN"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  1 [ipgui::get_guiparamspec -name "MEM_INT_IMEM_SIZE"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  2 [ipgui::get_guiparamspec -name "MEM_INT_DMEM_EN"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  3 [ipgui::get_guiparamspec -name "MEM_INT_DMEM_SIZE"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  4 [ipgui::get_guiparamspec -name "ICACHE_EN"            -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  5 [ipgui::get_guiparamspec -name "ICACHE_NUM_BLOCKS"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  6 [ipgui::get_guiparamspec -name "ICACHE_BLOCK_SIZE"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  7 [ipgui::get_guiparamspec -name "DCACHE_EN"            -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  8 [ipgui::get_guiparamspec -name "DCACHE_NUM_BLOCKS"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  9 [ipgui::get_guiparamspec -name "DCACHE_BLOCK_SIZE"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 10 [ipgui::get_guiparamspec -name "XIP_EN"               -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 11 [ipgui::get_guiparamspec -name "XIP_CACHE_EN"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 12 [ipgui::get_guiparamspec -name "XIP_CACHE_NUM_BLOCKS" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 13 [ipgui::get_guiparamspec -name "XIP_CACHE_BLOCK_SIZE" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 14 [ipgui::get_guiparamspec -name "INT_BOOTLOADER_EN"    -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory System" -component [ipx::current_core]]


# **************************************************************
# Configuration GUI: Peripherals
# **************************************************************
set_property display_name {External interrupt controller (XIRQ)}                [ipgui::get_guiparamspec -name "XIRQ_EN"               -component [ipx::current_core]]
set_property display_name {External interrupt controller (XIRQ) channels}       [ipgui::get_guiparamspec -name "XIRQ_NUM_CH"           -component [ipx::current_core]]
set_property display_name {General-Purpose Input/Output (GPIO) controller}      [ipgui::get_guiparamspec -name "IO_GPIO_EN"            -component [ipx::current_core]]
set_property display_name {General-purpose (GPIO) inputs}                       [ipgui::get_guiparamspec -name "IO_GPIO_IN_NUM"        -component [ipx::current_core]]
set_property display_name {General-purpose (GPIO) outputs}                      [ipgui::get_guiparamspec -name "IO_GPIO_OUT_NUM"       -component [ipx::current_core]]
set_property display_name {Machine timer (MTIME)}                               [ipgui::get_guiparamspec -name "IO_MTIME_EN"           -component [ipx::current_core]]
set_property display_name {Primary UART (UART0)}                                [ipgui::get_guiparamspec -name "IO_UART0_EN"           -component [ipx::current_core]]
set_property display_name {Primary UART (UART0) RX FIFO depth}                  [ipgui::get_guiparamspec -name "IO_UART0_RX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_UART0_RX_FIFO"      -component [ipx::current_core]]
set_property display_name {Primary UART (UART0) TX FIFO depth}                  [ipgui::get_guiparamspec -name "IO_UART0_TX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_UART0_TX_FIFO"      -component [ipx::current_core]]
set_property display_name {Secondary UART (UART1)}                              [ipgui::get_guiparamspec -name "IO_UART1_EN"           -component [ipx::current_core]]
set_property display_name {Secondary UART (UART1) RX FIFO depth}                [ipgui::get_guiparamspec -name "IO_UART1_RX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_UART1_RX_FIFO"      -component [ipx::current_core]]
set_property display_name {Secondary UART (UART1) TX FIFO depth}                [ipgui::get_guiparamspec -name "IO_UART1_TX_FIFO"      -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_UART1_TX_FIFO"      -component [ipx::current_core]]
set_property display_name {SPI host controller (SPI)}                           [ipgui::get_guiparamspec -name "IO_SPI_EN"             -component [ipx::current_core]]
set_property display_name {SPI host controller (SPI) FIFO depth}                [ipgui::get_guiparamspec -name "IO_SPI_FIFO"           -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_SPI_FIFO"           -component [ipx::current_core]]
set_property display_name {SPI device controller (SDI)}                         [ipgui::get_guiparamspec -name "IO_SDI_EN"             -component [ipx::current_core]]
set_property display_name {SPI device controller (SDI) FIFO depth}              [ipgui::get_guiparamspec -name "IO_SDI_FIFO"           -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_SDI_FIFO"           -component [ipx::current_core]]
set_property display_name {Two-Wire/I2C Interface (TWI)}                        [ipgui::get_guiparamspec -name "IO_TWI_EN"             -component [ipx::current_core]]
set_property display_name {Two-Wire/I2C Interface (TWI) FIFO depth}             [ipgui::get_guiparamspec -name "IO_TWI_FIFO"           -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_TWI_FIFO"           -component [ipx::current_core]]
set_property display_name {Pulse-Width Moduleation (PWM) controller}            [ipgui::get_guiparamspec -name "IO_PWM_EN"             -component [ipx::current_core]]
set_property display_name {Pulse-Width Moduleation (PWM) channels}              [ipgui::get_guiparamspec -name "IO_PWM_NUM_CH"         -component [ipx::current_core]]
set_property display_name {Watchdog timer (WDT)}                                [ipgui::get_guiparamspec -name "IO_WDT_EN"             -component [ipx::current_core]]
set_property display_name {True-Random-Number Generator (TRNG)}                 [ipgui::get_guiparamspec -name "IO_TRNG_EN"            -component [ipx::current_core]]
set_property display_name {True-Random-Number Generator (TRNG) FIFO depth}      [ipgui::get_guiparamspec -name "IO_TRNG_FIFO"          -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_TRNG_FIFO"          -component [ipx::current_core]]
set_property display_name {Custom Functions Subsystem (CFS)}                    [ipgui::get_guiparamspec -name "IO_CFS_EN"             -component [ipx::current_core]]
set_property display_name {Custom Functions Subsystem (CFS) configuration word} [ipgui::get_guiparamspec -name "IO_CFS_CONFIG"         -component [ipx::current_core]]
set_property display_name {Custom Functions Subsystem (CFS) input port width}   [ipgui::get_guiparamspec -name "IO_CFS_IN_SIZE"        -component [ipx::current_core]]
set_property display_name {Custom Functions Subsystem (CFS) output port width}  [ipgui::get_guiparamspec -name "IO_CFS_OUT_SIZE"       -component [ipx::current_core]]
set_property display_name {Smart LED Interface (NEOLED)}                        [ipgui::get_guiparamspec -name "IO_NEOLED_EN"          -component [ipx::current_core]]
set_property display_name {Smart LED Interface (NEOLED) FIFO depth}             [ipgui::get_guiparamspec -name "IO_NEOLED_TX_FIFO"     -component [ipx::current_core]]
set_property tooltip      {Number of entries (use a power of two)}              [ipgui::get_guiparamspec -name "IO_NEOLED_TX_FIFO"     -component [ipx::current_core]]
set_property display_name {General Purpose Timer (GPTMR)}                       [ipgui::get_guiparamspec -name "IO_GPTMR_EN"           -component [ipx::current_core]]
set_property display_name {1-Wire (ONEWIRE) controller}                         [ipgui::get_guiparamspec -name "IO_ONEWIRE_EN"         -component [ipx::current_core]]
set_property display_name {Direct Memory Access (DMA) controller}               [ipgui::get_guiparamspec -name "IO_DMA_EN"             -component [ipx::current_core]]
set_property display_name {Cyclic Redundancy Check (CRC) Unit}                  [ipgui::get_guiparamspec -name "IO_CRC_EN"             -component [ipx::current_core]]

ipgui::add_group -name {Peripherals} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]] -display_name {Peripherals}
ipgui::move_group -component [ipx::current_core] -order  3 [ipgui::get_groupspec    -name "Peripherals"           -component [ipx::current_core]] -parent [ipgui::get_pagespec  -name "Page 0"      -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  0 [ipgui::get_guiparamspec -name "IO_GPIO_EN"            -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  1 [ipgui::get_guiparamspec -name "IO_GPIO_IN_NUM"        -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  2 [ipgui::get_guiparamspec -name "IO_GPIO_OUT_NUM"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  3 [ipgui::get_guiparamspec -name "IO_MTIME_EN"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  4 [ipgui::get_guiparamspec -name "IO_UART0_EN"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  5 [ipgui::get_guiparamspec -name "IO_UART0_RX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  6 [ipgui::get_guiparamspec -name "IO_UART0_TX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  7 [ipgui::get_guiparamspec -name "IO_UART1_EN"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  8 [ipgui::get_guiparamspec -name "IO_UART1_RX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order  9 [ipgui::get_guiparamspec -name "IO_UART1_TX_FIFO"      -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 10 [ipgui::get_guiparamspec -name "IO_SPI_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 11 [ipgui::get_guiparamspec -name "IO_SPI_FIFO"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 12 [ipgui::get_guiparamspec -name "IO_SDI_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 13 [ipgui::get_guiparamspec -name "IO_SDI_FIFO"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 14 [ipgui::get_guiparamspec -name "IO_TWI_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 15 [ipgui::get_guiparamspec -name "IO_TWI_FIFO"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 16 [ipgui::get_guiparamspec -name "IO_PWM_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 17 [ipgui::get_guiparamspec -name "IO_PWM_NUM_CH"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 18 [ipgui::get_guiparamspec -name "IO_WDT_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 19 [ipgui::get_guiparamspec -name "IO_TRNG_EN"            -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 20 [ipgui::get_guiparamspec -name "IO_TRNG_FIFO"          -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 21 [ipgui::get_guiparamspec -name "IO_CFS_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 22 [ipgui::get_guiparamspec -name "IO_CFS_CONFIG"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 23 [ipgui::get_guiparamspec -name "IO_CFS_IN_SIZE"        -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 24 [ipgui::get_guiparamspec -name "IO_CFS_OUT_SIZE"       -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 25 [ipgui::get_guiparamspec -name "IO_NEOLED_EN"          -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 26 [ipgui::get_guiparamspec -name "IO_NEOLED_TX_FIFO"     -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 27 [ipgui::get_guiparamspec -name "IO_GPTMR_EN"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 28 [ipgui::get_guiparamspec -name "IO_ONEWIRE_EN"         -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 29 [ipgui::get_guiparamspec -name "IO_DMA_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 30 [ipgui::get_guiparamspec -name "XIRQ_EN"               -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 31 [ipgui::get_guiparamspec -name "XIRQ_NUM_CH"           -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 32 [ipgui::get_guiparamspec -name "IO_CRC_EN"             -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Peripherals" -component [ipx::current_core]]


# **************************************************************
# Configuration GUI: IP logo
# **************************************************************
ipx::add_file_group -type utility {} [ipx::current_core]
ipx::add_file ../../$neorv32_home/$ip_logo [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]
set_property type image [ipx::get_files ../../$neorv32_home/$ip_logo -of_objects [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]]
set_property type LOGO  [ipx::get_files ../../$neorv32_home/$ip_logo -of_objects [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]]

ipx::add_file_group -type gui_icon {} [ipx::current_core]
ipx::add_file ../../$neorv32_home/$ip_logo [ipx::get_file_groups xilinx_coreguiicon -of_objects [ipx::current_core]]
set_property type image [ipx::get_files ../../$neorv32_home/$ip_logo -of_objects [ipx::get_file_groups xilinx_coreguiicon -of_objects [ipx::current_core]]]
set_property type LOGO  [ipx::get_files ../../$neorv32_home/$ip_logo -of_objects [ipx::get_file_groups xilinx_coreguiicon -of_objects [ipx::current_core]]]


# **************************************************************
# Finalize and add to IP repository
# **************************************************************
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]

set_property ip_repo_paths $cur_dir/$outputdir/packaged_ip [current_project]
update_ip_catalog

close_project
