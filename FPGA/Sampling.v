module Sampling (
    input clk,
    input rst,
    input load,
    input enable,
    input valid,
    input data,
    input [7:0] data_8,
    output valid_o,
    output [7:0] data_o
);
wire [6:0] count;
wire sclr = (!enable | count[6]) | rst;
wire [7:0] data_out;
wire data_1_i = data ^ data_out[0] ^ data_out[6];
counter_7bit Count_0 (
    .clk(clk),
    .rst(sclr),
    .inc(valid),
    .count(count)
);
SRR LFSR (
    .clk(clk),
    .rst(sclr),
    .enable(valid),
    .load(load),
    .data_1(data_1_i),
    .data_8(data_8),
    .data_o(data_out)
);

assign data_o = data_out;
assign valid_o = count[6];
endmodule