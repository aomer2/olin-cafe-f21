# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -Wno-sensitivity-entire-vector -Wno-sensitivity-entire-array -g2012 -y ./ -I ./
VVP=vvp

# Look up .PHONY rules for Ma
.PHONY: clean submission

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml

test_debouncer: test_debouncer.sv debouncer.sv
	${IVERILOG} $^ -o test_debouncer.bin && ${VVP} test_debouncer.bin