module slt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;
logic signed [N-1:0] not_b;
wire c_out;
wire [N-1:0] diff;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into this folder and update the Makefile accordingly.

always_comb not_b = ~b;

adder_n #(.N(N)) add32(.a(a), .b(not_b), .c_in(1'd1), .c_out(c_out), .sum(diff));

//lways_comb out = (c_out & (a[N-1] & ~b[N-1])) | diff[N-1];
always_comb out = (c_out & (a[N-1] & ~b[N-1])) | (diff[N-1] & ~(~a[N-1] & b[N-1])) ;

endmodule