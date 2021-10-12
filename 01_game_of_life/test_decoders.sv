`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_decoders;
  logic ena;
  logic [2:0] in;
  wire [7:0] out;

  decoder_3_to_8 UUT(ena, in, out);

  // logic [1:0] input_2_4;
  // wire [4:0] output_2_4;
  // decoder_1_to_2 UUT_2_4(
  //   .ena(ena),
  //   .in(input_2_4),
  //   .out(output_2_4)
  // );
  
  // always @(ena, output_2_4) begin
  //   if ((ena == 0) && (output_2_4 !== 4'b0)) begin
  //     $error("ena should turn off outputs!!!");
  //   end
  // end
  
  // initial begin : testing_1_2_decoder
  //   $dumpfile("decoders.vcd");
  //   $dumpvars(0, UUT_2_4);
  //   ena = 1;
  //   $display("[d2:4] ena in | out");
  //   for (int i = 0; i < 4; i = i + 1) begin
  //     input_2_4 = i[1:0];
  //     #1 $display("[d2:4] %1b %2b | %4b", ena, input_2_4, output_2_4);
  //   end

  //   ena = 0;
  //   for (int i = 0; i < 4; i = i + 1) begin
  //     input_2_4 = i[1:0];
  //     #1 $display("[d2:4] %1b %2b | %4b", ena, input_2_4, output_2_4);
  //   end
        
  //    $finish;      
    
  // end

  // logic input_1_2;
  // wire [1:0] output_1_2;
  // decoder_1_to_2 UUT_1_2(
  //   .ena(ena),
  //   .in(input_1_2),
  //   .out(output_1_2)
  // );
  
  // always @(ena, output_1_2) begin
  //   if ((ena == 0) && (output_1_2 !== 2'b0)) begin
  //     $error("ena should turn off outputs!!!");
  //   end
  // end
  
  // initial begin : testing_1_2_decoder
  //   $dumpfile("decoders.vcd");
  //   $dumpvars(0, UUT_1_2);
  //   ena = 1;
  //   $display("[d1:2] ena in | out");
  //   for (int i = 0; i < 2; i = i + 1) begin
  //     input_1_2 = i[0];
  //     #1 $display("[d1:2] %1b %1b | %2b", ena, input_1_2, output_1_2);
  //   end

  //   ena = 0;
  //   for (int i = 0; i < 2; i = i + 1) begin
  //     input_1_2 = i[0];
  //     #1 $display("[d1:2] %1b %1b | %2b", ena, input_1_2, output_1_2);
  //   end
        
  //    $finish;      
    
  // end

  
  initial begin
    // Collect waveforms
    $dumpfile("decoders.vcd");
    $dumpvars(0, UUT);
    
    ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 8; i = i + 1) begin
      in = i[2:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end

    ena = 0;
    for (int i = 0; i < 8; i = i + 1) begin
      in = i[2:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end
        
    $finish;      
	end
  

endmodule
