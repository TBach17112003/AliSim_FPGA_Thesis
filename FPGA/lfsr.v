module lfsr (
    input wire clk,
    input wire reset,         // Reset the LFSR
    output reg [9:0] rand_val // 10-bit pseudo-random value
);

    // Define taps for a maximal-length LFSR (10-bit polynomial: x^10 + x^7 + 1)
    wire feedback = rand_val[9] ^ rand_val[6] ^ rand_val[3];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rand_val <= 10'b1; // Non-zero seed value
        end else begin
            // Shift and feedback
            rand_val <= {rand_val[8:0], feedback};
        end
    end

endmodule
