module random_module (
    input wire clk,
    input wire reset,
    input wire [10:0] seed,
    input wire [11:0] sum,
    output wire [11:0] random_output
);

    wire [32:0] rand_val;
    lfsr lfsr_inst (
        .clk(clk),
        .reset(reset),
        .seed(seed),
        .rand_val(rand_val)
    );
    //Chia lấy dư cho sum để có được giá trị random
    assign random_output = rand_val % (sum + 1'b1);

endmodule
