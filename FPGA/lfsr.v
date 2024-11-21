module lfsr (
    input wire clk,
    input wire reset,
    input wire [9:0] seed,    // External seed input
    input wire reseed_en,     // Reseed enable signal
    output reg [9:0] rand_val
);

    // Feedback logic for 10-bit LFSR with polynomial x^10 + x^7 + 1
    // parameter seed = 10'b1010101010;
    wire feedback = 0 | (seed[9] ^ seed[6]);
    always @(posedge clk) begin
        if (reset) begin
            rand_val <= 10'd1; // Initialize with a non-zero values
        end else if (reseed_en) begin
            rand_val <= seed;
        end else begin
            rand_val <= {rand_val[8:0], feedback}; // Shift and feedback
        end
    end

endmodule