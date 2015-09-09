.main clear;

project compileall;

vsim -gui work.testbench_toptop;

add wave -position insertpoint  \
sim:/testbench_toptop/clk \
sim:/testbench_toptop/rst \
sim:/testbench_toptop/ps2d \
sim:/testbench_toptop/ps2c \
sim:/testbench_toptop/datos \
sim:/testbench_toptop/aux \
sim:/testbench_toptop/seg \
sim:/testbench_toptop/an \
sim:/testbench_toptop/led \
sim:/testbench_toptop/n \
sim:/testbench_toptop/rt \
sim:/testbench_toptop/i \
sim:/testbench_toptop/j \
sim:/testbench_toptop/x \
sim:/testbench_toptop/y \
sim:/testbench_toptop/z;

config wave -signalnamewidth 1;

run -all;