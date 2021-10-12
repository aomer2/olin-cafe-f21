module decoder_2_to_4(ena, in, out);

  input wire ena;
  input wire [1:0] in;
  output logic [3:0] out;

  // logic [1:0] enas;

  // decoder_1_to_2 U1_2_2(
  //   .ena(ena), 
  //   .in(in[1]), 
  //   .out(enas)
  // );

  // decoder_1_to_2 U1_2_1(
  //   .ena(enas[1]), 
  //   .in(in[0]), 
  //   .out(out[3:2])
  // );

  // decoder_1_to_2 U1_2_0(
  //   .ena(enas[0]), 
  //   .in(in[0]), 
  //   .out(out[1:0])
  // );

  always_comb begin
    out[3] = ena & in[1] & in[0];
    out[2] = ena & in[1] & (~in[0]);
    out[1] = ena & (~in[1]) & in[0];
    out[0] = ena & (~in[1]) & (~in[0]);
  end

endmodule