/* 
    an adder that we can daisy chain ripple carry adders
*/

module neighbor_adder(neighbors, living_neighbors);

    input logic [7:0] neighbors;
    output logic [3:0] living_neighbors;

    wire [2:0] sum1a, sum1b, sum1c, sum1d;
    wire [3:0] sum2a, sum2b;

    //adder gives us living_neighbors

    // 1 bit adders
    adder_n #(.N(1)) adder_1bit_a (
        .a(neighbors[0]), 
        .b(neighbors[1]), 
        .c_in(1'b0), 
        .sum(sum1a[0]), 
        .c_out(sum1a[1])
        );
    adder_n #(.N(1)) adder_1bit_b (
        .a(neighbors[2]), 
        .b(neighbors[3]), 
        .c_in(1'b0), 
        .sum(sum1b[0]), 
        .c_out(sum1b[1])
        );
    adder_n #(.N(1)) adder_1bit_c (
        .a(neighbors[4]), 
        .b(neighbors[5]), 
        .c_in(1'b0), 
        .sum(sum1c[0]), 
        .c_out(sum1c[1])
        );
    adder_n #(.N(1)) adder_1bit_d (
        .a(neighbors[6]), 
        .b(neighbors[7]), 
        .c_in(1'b0), 
        .sum(sum1d[0]), 
        .c_out(sum1d[1])
        );

    //2 bit adders
    adder_n #(.N(2)) adder_2bit_a (
        .a(sum1a), 
        .b(sum1b), 
        .c_in(1'b0), 
        .sum(sum2a[1:0]), 
        .c_out(sum2a[2])
        );
    adder_n #(.N(2)) adder_2bit_b (
        .a(sum1c), 
        .b(sum1d), 
        .c_in(1'b0), 
        .sum(sum2b[1:0]), 
        .c_out(sum2b[2])
        );

    //3 bit adder
    adder_n #(.N(3)) adder_3bit_a (
        .a(sum2a), 
        .b(sum2b), 
        .c_in(1'b0), 
        .sum(living_neighbors[2:0]), 
        .c_out(living_neighbors[3])
        );

endmodule