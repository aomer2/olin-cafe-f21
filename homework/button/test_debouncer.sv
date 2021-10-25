`timescale 1ns / 1ps

module test_debouncer;

parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.

logic clk, rst;
logic bouncy_in;

logic debounced_out;

debouncer #(.BOUNCE_TICKS(100)) UUT (
    .clk(clk), .rst(rst), .bouncy_in(bouncy_in),
    .debounced_out(debounced_out)
);

always #(CLK_PERIOD_NS/2) clk = ~clk;

int bounces, delay;

initial begin
    $dumpfile("debouncer.vcd");
    $dumpvars(0,UUT);

    //initialize all of our vars
    clk = 0;
    rst = 1;

    bouncy_in = 0;

    //use neg edge to change things so that its safe to sample on posedge
    //repeat to make sure reset
    repeat (2) @(negedge clk);
    rst = 0;

    //simulation of bounce
    //set up bouncing behavior - range of times bounce will range from
    bounces = ($random % 20) + 10;
    for(int i = 0; i < bounces; i = i + 1) begin
        delay = ($random % 1) + 1;
        #(delay) bouncy_in = $random;
    end

    repeat (10) @(posedge clk);

    $finish;
end


endmodule