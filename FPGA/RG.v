module RG (
    input clk,
    input reset,
    input [9:0] prob_A,
    input [9:0] prob_C,
    input [9:0] prob_G,
    input [9:0] prob_T, 
    input [3:0] instance_ID,
    output reg [1:0] result      
);  
    parameter A = 2'b00, C = 2'b01, G = 2'b10, T = 2'b11;
    wire [11:0] random_val;
    // wire [11:0] probability_A, probability_C, probability_G, probability_T;

    //Không sử dụng lại để tính toán nên gán trực tiếp
    wire [11:0] probability_A = prob_A;
    wire [11:0] probability_C = prob_A + prob_C;
    wire [11:0] probability_G = prob_A + prob_C + prob_G;

    // Trường hợp 4 giá trị tối đa 10 bit là 1023 => 4092  => 11 bit 
    // Sử dụng phép chia lấy nguyên giá trị này để ra được giá trị random
    wire [11:0] probability_T = prob_A + prob_C + prob_G + prob_T;
    
    // Tạo seed bằng cách kết hợp giá trị P ban đầu của mỗi loài kết hợp với ID của các random
    wire [10:0] seed = (prob_A ^ prob_C ^ prob_G ^ prob_T) + instance_ID;

    random_module Raninst (
        .clk(clk),
        .reset(reset),
        .seed(seed),
        .sum(probability_T),
        .random_output(random_val)
    );
    
    always @(posedge clk) begin
        if (reset) begin
            result <= 2'b00;
        end
        else begin
            if (probability_T > 4093) begin
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
    end
endmodule

