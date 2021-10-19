/*
  a 16 bit adder daisy chaining 2
  8 bit adders
*/

module adder_16(a, b, c_in, sum, c_out);

input  wire [15:0] a, b;
input wire c_in;
output logic [15:0] sum;
output logic c_out;

wire carry;

adder_8 ADDER_A(
  .a(a[7:0]),
  .b(b[7:0]),
  .c_in(c_in),
  .sum(sum[7:0]),
  .c_out(carry)
);

adder_8 ADDER_B(
  .a(a[15:8]),
  .b(b[15:8]),
  .c_in(carry),
  .sum(sum[15:8]),
  .c_out(c_out)
);


endmodule