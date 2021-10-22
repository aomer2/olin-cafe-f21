`timescale 1ns/1ps
`default_nettype none
module test_add32;

parameter N = 32;

int errors = 0;

logic [31:0] a, b;
logic c_in;
wire [31:0] sum;
wire c_out;

add32 UUT (.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));

// Some behavioural comb. logic that computes correct values.
logic [N+1:0] sum_and_carry;
logic correct_carry_out;
logic [N-1:0] correct_sum;

always_comb begin : behavioural_solution_logic
  sum_and_carry = a + b + c_in;
  correct_sum = sum_and_carry[N-1:0];
  correct_carry_out = |sum_and_carry[N+1:N];
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%d + %d  + %b = %d  + %b (%d+%b)", a, b, c_in, sum, c_out, correct_sum, correct_carry_out);
endtask

initial begin
  //$dumpfile("adder_n.vcd");
  //$dumpvars(0, UUT);
  
  $display("Specific interesting tests.");
  
  // Zero + zero 
  c_in = 0;
  a = 0;
  b = 0;
  #1 print_io();

  // Two + Two
  c_in = 0;
  a = 2;
  b = 2;
  #1 print_io();

  // -1 + -1
  c_in = 0;
  a = -1;
  b = 1;
  #1 print_io();

  // Overflow case with carry in.
  c_in = 1;
  a = (1 << (N-1)) -1;
  b = (1 << (N-1));
  #1 print_io();
  
  $display("Random testing.");
  for (int i = 0; i < 10; i = i + 1) begin : random_testing
    a = $random();
    b = $random();
    c_in = $random();
    #1 print_io();
  end
  if (errors !== 0) begin
    $display("---------------------------------------------------------------");
    $display("-- FAILURE                                                   --");
    $display("---------------------------------------------------------------");
    $display(" %d failures found, try again!", errors);
  end else begin
    $display("---------------------------------------------------------------");
    $display("-- SUCCESS                                                   --");
    $display("---------------------------------------------------------------");
  end
  $finish;
end

// Note: the triple === (corresponding !==) check 4-state (e.g. 0,1,x,z) values.
//       It's best practice to use these for checkers!
always @(a,b,c_in) begin
  assert(sum === correct_sum) else begin
    $display("  ERROR: sum should be %d, is %d", correct_sum, sum);
    errors = errors + 1;
  end
  assert(c_out === correct_carry_out) else begin
    $display("  ERROR: sum should be %d", correct_sum);
    errors = errors + 1;
  end
end

endmodule