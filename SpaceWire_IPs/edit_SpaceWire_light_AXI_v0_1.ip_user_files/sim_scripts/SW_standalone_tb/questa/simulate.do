onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib SW_standalone_tb_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {SW_standalone_tb.udo}

run 1000ns

quit -force
