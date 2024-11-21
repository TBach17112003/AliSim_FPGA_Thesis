module lfsr (
    input wire clk,
    input wire rst,
    input wire [9:0] seed,    // External seed input
    input wire reseed_en,     // Reseed enable signal
    output reg [9:0] rand_val
);

    // Feedback logic for 10-bit LFSR with polynomial x^10 + x^7 + 1
    wire feedback = rand_val[9] ^ rand_val[6];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rand_val <= 10'b1; // Initialize with a non-zero value
        end else if (reseed_en) begin
            rand_val <= seed;  // Reseed with external value
        end else begin
            rand_val <= {rand_val[8:0], feedback}; // Shift and feedback
        end
    end

endmodule