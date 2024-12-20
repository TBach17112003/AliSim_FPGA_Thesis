module NeoRNG (
    input clk,
    input rst,
    input enable_i,
    input load,
    input [7:0] data_8,
    output valid_o,
    output [7:0] data_o
);
wire enable_o_1_2, rnd_1_2, valid_2_3, data_2_3;

RO m1 (
    .clk(clk),
    .rst(rst),
    .enable_i(enable_i),
    .enable_o(enable_o_1_2),
    .rnd(rnd_1_2)
);

De_Biasing m2 (
    .clk(clk),
    .rst(rst),
    .enable(enable_o_1_2),
    .rnd(rnd_1_2),
    .valid(valid_2_3),
    .data(data_2_3)
);
    
Sampling m3 (
    .clk(clk),
    .rst(rst),
    .load(load),
    .enable(enable_i),
    .valid(valid_2_3),
    .data(data_2_3),
    .data_8(data_8),
    .valid_o(valid_o),
    .data_o(data_o)
);
endmodule