module decoder_3_to_8(ena, in, out);

  input wire ena;
  input wire [2:0] in;
  output logic [7:0] out;

  // input wire ena;
  // input wire [1:0] in;
  // output logic [3:0] out;

  // logic [1:0] enas;

  // decoder_2_to_4 U1_2_2(
  //   .ena(ena), 
  //   .in(in[1]), 
  //   .out(enas)
  // );

  // decoder_2_to_4 U1_2_1(
  //   .ena(enas[1]), 
  //   .in(in[0]), 
  //   .out(out[3:2])
  // );

  // decoder_2_to_4 U_0(
  //   .ena(enas[0]), 
  //   .in(in[0]), 
  //   .out(out[1:0])
  // );

  always_comb begin
    out[7] = ena & in[2] & in[1] & in[0];
    out[6] = ena & in[2] & in[1] & (~in[0]);
    out[5] = ena & in[2] & (~in[1]) & in[0];
    out[4] = ena & in[2] & (~in[1]) & (~in[0]);
    out[3] = ena & (~in[2]) & in[1] & in[0];
    out[2] = ena & (~in[2]) & in[1] & (~in[0]);
    out[1] = ena & (~in[2]) & (~in[1]) & in[0];
    out[0] = ena & (~in[2]) & (~in[1]) & (~in[0]);
  end

endmodule