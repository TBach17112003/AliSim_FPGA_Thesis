`timescale 1ps/1ps
module test_Schedule (
);
    reg clk;
    reg reset;
    reg [7:0] seed_ID;
    wire [2:0] state;

    Schedule TOP (
        .clk(clk),
        .reset(reset),
        .seed_ID(seed_ID),
        .state(state)
    );

    initial begin
       clk = 0;
       forever begin
           #10 clk = ~clk;
       end
   end

   initial begin
       seed_ID = 0;
       reset = 1;
       #20
       reset = 0;
       #400
       $stop;
   end
   always @(posedge clk) begin
       $display("Time: %t, state: %b", $time, state);
   end
endmodule