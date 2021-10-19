/*
  a 32 bit adder daisy chaining 2
  16 bit adders
*/

module add32(a, b, c_in, sum, c_out);

input  wire [31:0] a, b;
input wire c_in;
output logic [31:0] sum;
output logic c_out;

wire carry;

adder_16 ADDER_A(
  .a(a[15:0]),
  .b(b[15:0]),
  .c_in(c_in),
  .sum(sum[15:0]),
  .c_out(carry)
);

adder_16 ADDER_B(
  .a(a[31:16]),
  .b(b[31:16]),
  .c_in(carry),
  .sum(sum[31:16]),
  .c_out(c_out)
);


endmodule