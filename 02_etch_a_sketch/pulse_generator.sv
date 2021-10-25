/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle every N "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

logic [N-1:0] counter;
logic counter_comparator;
logic reset;
always_comb reset = rst | counter_comparator;

always_ff @(posedge clk) begin : counter_ff

  if (reset) begin
    counter <= 0;
  end
  else if (ena) begin
    counter <= counter + 1;
  end

  // if (rst) begin
  //   counter <= 0;
  // end else if (ena) begin
  //   if(counter_comparator) begin
  //     counter <= 0;
  //   end else begin
  //         counter <= counter + 1;
  //   end
  // end

end

// will catch errors if counter increments twice before checking
always_comb counter_comparator = counter >= (ticks -1);

always_comb out = ena & counter_comparator;


// always_comb begin
//   counter_comparator = counter == (ticks - 1);

//   out = ena & counter_comparator;

// end

logic tick_rst;
always_comb tick_rst = rst | counter_comparator;

always_ff @(posedge clk) begin : counter_logic
  if(tick_rst) begin
    counter <= 0;
  end else if (ena) begin
    // an equivalent: counter <= counter_comparator ? counter <= 0; counter <= counter + 1;

    if(counter_comparator) begin
      counter <= 0;
    end
    else begin
      counter <= counter + 1;
    end
  end
end

always_comb counter_comparator = counter >= (ticks -1);

always_comb out = counter_comparator & ena;

endmodule
