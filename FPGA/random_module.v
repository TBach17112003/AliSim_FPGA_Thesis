module random_module (
    input wire clk,
    input wire reset,
    output wire [9:0] random_output
);

    wire [9:0] rand_val;
    lfsr lfsr_inst (
        .clk(clk),
        .reset(reset),
        .rand_val(rand_val)
    );

    assign random_output = rand_val % 1000;

endmodule
