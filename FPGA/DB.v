module De_Biasing (
    input clk,
    input rst,
    input wire enable,
    input wire rnd,

    output valid,
    output data
);

wire Q_1, Q_2, D_3, toggle;

D_flip_flop FF_1(
    .D(rnd),
    .clk(clk),
    .rst(rst),
    .Q(Q_1)
);

D_flip_flop FF_2(
    .D(Q_1),
    .clk(clk),
    .rst(rst),
    .Q(Q_2)
);
assign valid = (Q_1 ^ Q_2) & toggle;
assign data = Q_1;


assign D_3 = enable & !toggle;
D_flip_flop FF_3(
    .D(D_3),
    .clk(clk),
    .rst(rst),
    .Q(toggle)
);
endmodule