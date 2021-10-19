# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012 -y ./ -I ./
VVP=vvp
VIVADO=vivado -mode batch -source

# Look up .PHONY rules for Makefiles
.PHONY: clean submission remove_solutions

ADDERS=adder_1.sv adder_2.sv adder_4.sv adder_8.sv adder_16.sv add32.sv 
MUXES=mux2.sv mux4.sv mux32.sv

test_add32: test_add32.sv $(ADDERS)
	${IVERILOG} $^ -o test_add32.bin && ${VVP} test_add32.bin

test_mux32: test_mux32.sv $(MUXES)
	${IVERILOG} $^ -o test_mux32.bin && ${VVP} test_mux32.bin
