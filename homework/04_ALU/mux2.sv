module mux2(d0, d1, s, y);
    parameter N = 4;
    input logic [N-1:0] d0, d1;
    input logic s;
    output logic [N-1:0] y;

    assign y = s ? d1 : d0;
    
endmodule