module D_flip_flop (
    input wire D,         // Data input
    input wire clk,       // Clock input
    input wire rst,       // Reset input (active low)
    output reg Q          // Output (latched state)
);

    always @(posedge clk) begin
        if (rst)
            Q <= 0;      // Asynchronous reset
        else
            Q <= D;      // On rising clock edge, latch D into Q
    end

endmodule
