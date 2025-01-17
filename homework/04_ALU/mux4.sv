module mux4(d0, d1, d2, d3, s, y);
    parameter N = 4;
    input logic [N-1:0] d0, d1, d2, d3;
    input logic [1:0] s;
    output logic [N-1:0]y;

    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);
    
endmodule