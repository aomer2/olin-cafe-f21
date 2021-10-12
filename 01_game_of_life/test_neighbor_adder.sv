`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_decoders;
  logic [7:0] neighbors;
  wire [3:0] living_neighbors;

  neighbor_adder UUT(neighbors, living_neighbors);

  initial begin
    
    $display("neighbors | living_neighbors");
    for (int i = 0; i < 8; i = i + 1) begin
      neighbors = i[7:0];
      #1 $display("%8b | %4b", neighbors, living_neighbors);
    end
        
    $finish;      
	end

endmodule