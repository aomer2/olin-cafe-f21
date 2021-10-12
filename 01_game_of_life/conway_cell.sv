`default_nettype none

module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
  input wire clk;
  input wire rst;
  input wire ena;

  input wire state_0;
  output logic state_d;
  output logic state_q;

  input wire [7:0] neighbors;
  logic [3:0] living_neighbors;
  logic d1, d2;

  neighbor_adder UUT(neighbors, living_neighbors);
  
  always_ff @(posedge clk) begin : state_ff
    // if (rst) state_q <= 1'b0;
    // else if (ena) state_q <= state_d;
    if(rst) begin // create a mux
      state_q <= state_0;
    end
    else if (ena) begin
      state_q <= state_d;
    end
    else begin // This is not required, "default" else case
      state_q <= state_q; // hold current value
    end
  end

  always_comb begin : next_state
    d1 = (~state_q) & (~living_neighbors[3]) & (~living_neighbors[2]) & living_neighbors[1] & living_neighbors[0];
    d2 = state_q & (~living_neighbors[3]) & (~living_neighbors[2]) & living_neighbors[1];
    state_d = (d1 | d2); // & ena & (~rst); not needed since if statement in ff
  end

endmodule