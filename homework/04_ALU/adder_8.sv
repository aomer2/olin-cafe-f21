/*
  a 8 bit adder daisy chaining 2
  4 bit adders
*/

module adder_8(a, b, c_in, sum, c_out);

input  wire [7:0] a, b;
input wire c_in;
output logic [7:0] sum;
output logic c_out;

wire carry;

adder_4 ADDER_A(
  .a(a[3:0]),
  .b(b[3:0]),
  .c_in(c_in),
  .sum(sum[3:0]),
  .c_out(carry)
);

adder_4 ADDER_B(
  .a(a[7:4]),
  .b(b[7:4]),
  .c_in(carry),
  .sum(sum[7:4]),
  .c_out(c_out)
);


endmodule