# Prefix-adder-subractor

This repo consists of a iverilog code for the implementation of a Parallel adder-subractor.
The lib.v file has the midules for the basic gates.
prefix.v is the main module which has the implementaion of the adder.
tb_pre.v is the testbench written for the prefix module.
To run:
iverilog -o temp lib.v prefix.v tb_pre.v
vvp temp
gtkwave tbpre.vcd
