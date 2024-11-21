module RG (
    input clk,
    input reset,
    input [9:0] prob_A,
    input [9:0] prob_C,
    input [9:0] prob_G,
    input [9:0] prob_T, 
    output reg [1:0] result      
);
    wire [9:0] random_val;
    wire [9:0] probability_A, probability_C, probability_G, probability_T;

    parameter A = 2'b00, C = 2'b01, G = 2'b10, T = 2'b11;

    random_module Ran_inst(
        .clk(clk),
        .reset(reset),
        .random_output(random_val)
    );
    
    
    assign probability_A = prob_A;
    assign probability_C = prob_A + prob_C;
    assign probability_G = prob_A + prob_C + prob_G;
    assign probability_T = prob_A + prob_C + prob_G + prob_T;
    
    always @(posedge clk) begin
        if (reset) begin
            result <= 2'b00;
        end
        else begin
            // // Sinh giá trị ngẫu nhiên từ 0 đến 999
            // random_val <= $random % 1000;
            // // Đảm bảo tổng tỷ lệ không vượt quá 1000
            if (probability_T > 1000) begin
                result = 2'bx;
            end else begin
                if (random_val < probability_A)
                    result <= A;
                else if (random_val < probability_C)
                    result <= C;
                else if (random_val < probability_G)        
                    result <= G;
                else if (random_val < probability_T)
                    result <= T;
            end
        end
        // $display("random_val: %d, probability_A: %d, C: %d, G: %d, T: %d", 
        //     random_val, probability_A, probability_C, probability_G, probability_T);

    end
endmodule

