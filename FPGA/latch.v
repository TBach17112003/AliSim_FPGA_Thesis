module D_latch (
    input wire D,        // D input (data input)
    input wire EN,       // Enable input (latch enable)
    input wire rst,    // Reset input (asynchronous reset)
    output reg Q         // Q output (latched output)
);

    // Process for D-latch with reset
    always @ (D or EN or !rst) begin
        if (!rst)        // If reset is active (high)
            Q = 0;        // Reset the latch, set Q to 0
        else if (EN) 
            Q = D;        // If Enable is high, latch the value of D
    end

endmodule
