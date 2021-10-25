/* 
    a 1 bit adder that we can daisy chain ripple carry adders
*/

module adder_1(a, b, c_in, sum, c_out);

    input wire a, b, c_in;
    output logic sum, c_out;

    always_comb begin : adder_gates
        c_out = (~c_in & a & b) |
                (c_in & ~a & b) |
                (c_in & a & b) |
                (c_in & a & ~b);
        
        sum = (~c_in & (a ^ b)) |
              (c_in & (a ~^ b));
    end

endmodule