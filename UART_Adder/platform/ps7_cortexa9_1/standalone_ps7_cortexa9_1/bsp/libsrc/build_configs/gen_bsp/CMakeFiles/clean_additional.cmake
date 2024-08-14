# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "F:\\Xilinx\\Projects\\UART_Adder\\platform\\ps7_cortexa9_1\\standalone_ps7_cortexa9_1\\bsp\\include\\sleep.h"
  "F:\\Xilinx\\Projects\\UART_Adder\\platform\\ps7_cortexa9_1\\standalone_ps7_cortexa9_1\\bsp\\include\\xiltimer.h"
  "F:\\Xilinx\\Projects\\UART_Adder\\platform\\ps7_cortexa9_1\\standalone_ps7_cortexa9_1\\bsp\\include\\xtimer_config.h"
  "F:\\Xilinx\\Projects\\UART_Adder\\platform\\ps7_cortexa9_1\\standalone_ps7_cortexa9_1\\bsp\\lib\\libxiltimer.a"
  )
endif()
