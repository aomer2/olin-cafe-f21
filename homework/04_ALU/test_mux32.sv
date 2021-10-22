`timescale 1ns/1ps
`default_nettype none
module test_mux32;

parameter N = 32;

int errors = 0;

logic [N-1:0] d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15, 
              d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31;
logic [4:0] s;
logic [N-1:0] y;

mux32 #(.N(N)) UUT(.d00(d00), .d01(d01), .d02(d02), .d03(d03), .d04(d04), .d05(d05), .d06(d06), .d07(d07), .d08(d08), .d09(d09), 
                   .d10(d10), .d11(d11), .d12(d12), .d13(d13), .d14(d14), .d15(d15), .d16(d16), .d17(d17), .d18(d18), .d19(d19), 
                   .d20(d20), .d21(d21), .d22(d22), .d23(d23), .d24(d24), .d25(d25), .d26(d26), .d27(d27), .d28(d28), .d29(d29), 
                   .d30(d30), .d31(d31), .s(s), .y(y));

task check_output(input [N-1:0] d);
    $display("Testing %d", d);
    assert(d == y) else begin
    $display("  ERROR: output should be %d, is %d", d, y);
    errors = errors + 1;
  end
endtask

initial begin
    d00 = $random(); 
    d01 = $random(); 
    d02 = $random(); 
    d03 = $random(); 
    d04 = $random(); 
    d05 = $random(); 
    d06 = $random(); 
    d07 = $random(); 
    d08 = $random(); 
    d09 = $random(); 
    d10 = $random(); 
    d11 = $random(); 
    d12 = $random(); 
    d13 = $random(); 
    d14 = $random(); 
    d15 = $random(); 
    d16 = $random(); 
    d17 = $random(); 
    d18 = $random(); 
    d19 = $random(); 
    d20 = $random(); 
    d21 = $random(); 
    d22 = $random(); 
    d23 = $random(); 
    d24 = $random(); 
    d25 = $random(); 
    d26 = $random(); 
    d27 = $random(); 
    d28 = $random(); 
    d29 = $random(); 
    d30 = $random(); 
    d31 = $random(); 
    
    s = 5'b00000;
    #1 check_output(d00);

    s = 5'b00001;
    #1 check_output(d01);

    s = 5'b00010;
    #1 check_output(d02);

    s = 5'b00011;
    #1 check_output(d03);
    
    s = 5'b00100;
    #1 check_output(d04);
    
    s = 5'b00101;
    #1 check_output(d05);
    
    s = 5'b00110;
    #1 check_output(d06);
    
    s = 5'b00111;
    #1 check_output(d07);
    
    s = 5'b01000;
    #1 check_output(d08);

    s = 5'b01001;
    #1 check_output(d09);

    s = 5'b01010;
    #1 check_output(d10);

    s = 5'b01011;
    #1 check_output(d11);
    
    s = 5'b01100;
    #1 check_output(d12);
    
    s = 5'b01101;
    #1 check_output(d13);
    
    s = 5'b01110;
    #1 check_output(d14);
    
    s = 5'b01111;
    #1 check_output(d15);
    
    s = 5'b10000;
    #1 check_output(d16);

    s = 5'b10001;
    #1 check_output(d17);

    s = 5'b10010;
    #1 check_output(d18);

    s = 5'b10011;
    #1 check_output(d19);
    
    s = 5'b10100;
    #1 check_output(d20);
    
    s = 5'b10101;
    #1 check_output(d21);
    
    s = 5'b10110;
    #1 check_output(d22);
    
    s = 5'b10111;
    #1 check_output(d23);
    
    s = 5'b11000;
    #1 check_output(d24);

    s = 5'b11001;
    #1 check_output(d25);

    s = 5'b11010;
    #1 check_output(d26);

    s = 5'b11011;
    #1 check_output(d27);
    
    s = 5'b11100;
    #1 check_output(d28);
    
    s = 5'b11101;
    #1 check_output(d29);
    
    s = 5'b11110;
    #1 check_output(d30);
    
    s = 5'b11111;
    #1 check_output(d31);
    

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

endmodule;