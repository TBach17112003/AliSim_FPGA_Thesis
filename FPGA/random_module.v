module random_module (
    input wire clk,
    input wire reset,
    input wire [9:0] seed,
    input wire reseed_en,
    output wire [9:0] random_output
);

    wire [9:0] rand_val;
    lfsr lfsr_inst (
        .clk(clk),
        .reset(reset),
        .seed(seed),
        .reseed_en(reseed_en),
        .rand_val(rand_val)
    );

    assign random_output = rand_val % 1000;

endmodule
