module mux32(d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15, 
             d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31,
             s, y);

    parameter N =4 ;

    input logic [N-1:0] d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15, 
                        d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31;
    input logic [4:0] s;
    output logic [N-1:0] y;
    wire [N-1:0] a, b, c, d, e, f, g, h, i, j;

    mux4 #(.N(N)) mux4_A(
        .d0(d00),
        .d1(d01),
        .d2(d02),
        .d3(d03),
        .s(s[1:0]),
        .y(a)
    );

    mux4 #(.N(N)) mux4_B(
        .d0(d04),
        .d1(d05),
        .d2(d06),
        .d3(d07),
        .s(s[1:0]),
        .y(b)
    );

    mux4 #(.N(N)) mux4_C(
        .d0(d08),
        .d1(d09),
        .d2(d10),
        .d3(d11),
        .s(s[1:0]),
        .y(c)
    );

    mux4 #(.N(N)) mux4_D(
        .d0(d12),
        .d1(d13),
        .d2(d14),
        .d3(d15),
        .s(s[1:0]),
        .y(d)
    );

    mux4 #(.N(N)) mux4_E(
        .d0(d16),
        .d1(d17),
        .d2(d18),
        .d3(d19),
        .s(s[1:0]),
        .y(e)
    );

    mux4 #(.N(N)) mux4_F(
        .d0(d20),
        .d1(d21),
        .d2(d22),
        .d3(d23),
        .s(s[1:0]),
        .y(f)
    );

    mux4 #(.N(N)) mux4_G(
        .d0(d24),
        .d1(d25),
        .d2(d26),
        .d3(d27),
        .s(s[1:0]),
        .y(g)
    );

    mux4 #(.N(N)) mux4_H(
        .d0(d28),
        .d1(d29),
        .d2(d30),
        .d3(d31),
        .s(s[1:0]),
        .y(h)
    );

    mux4 #(.N(N)) mux4_I(
        .d0(a),
        .d1(b),
        .d2(c),
        .d3(d),
        .s(s[3:2]),
        .y(i)
    );

    mux4 #(.N(N)) mux4_J(
        .d0(e),
        .d1(f),
        .d2(g),
        .d3(h),
        .s(s[3:2]),
        .y(j)
    );

    mux2 #(.N(N)) mux2_A(
        .d0(i),
        .d1(j),
        .s(s[4]),
        .y(y)
    );
    

endmodule