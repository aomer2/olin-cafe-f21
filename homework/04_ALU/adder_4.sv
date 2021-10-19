/*
  a 4 bit adder daisy chaining 2
  2 bit adders
*/

module adder_4(a, b, c_in, sum, c_out);

input  wire [3:0] a, b;
input wire c_in;
output logic [3:0] sum;
output logic c_out;

wire carry;

adder_2 ADDER_A(
  .a(a[1:0]),
  .b(b[1:0]),
  .c_in(c_in),
  .sum(sum[1:0]),
  .c_out(carry)
);

adder_2 ADDER_B(
  .a(a[3:2]),
  .b(b[3:2]),
  .c_in(carry),
  .sum(sum[3:2]),
  .c_out(c_out)
);


endmodule