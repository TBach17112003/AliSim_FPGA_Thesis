`timescale 1ps/1ps

module RG_tb;

    // Định nghĩa tín hiệu
    reg clk;
    reg reset;
    reg [9:0] prob_A;
    reg [9:0] prob_C;
    reg [9:0] prob_G;
    reg [9:0] prob_T;
    wire [1:0] result;

    // Khởi tạo mô-đun RG
    RG uut (
        .clk(clk),
        .reset(reset),
        .prob_A(prob_A),
        .prob_C(prob_C),
        .prob_G(prob_G),
        .prob_T(prob_T),
        .result(result)
    );

    // Khởi tạo xung đồng hồ
    initial begin
        clk = 0;
        forever begin
            #10 clk = ~clk;  // Tạo chu kỳ đồng hồ 20 ps
        end
    end

    // Cấp tín hiệu reset
    initial begin
        reset = 1;
        #5 reset = 0;  // Reset được bật trong 5 ps đầu tiên
        #300;
        $finish;  // Kết thúc mô phỏng sau 200 ps
    end

    // Cấp giá trị cho các tín hiệu đầu vào
    initial begin
        // Cấp giá trị tỷ lệ xác suất cho A, C, G, T là 100% (1000)
        // prob_A = 10'd1000;  // 100% cho A
        // prob_C = 10'd1000;  // 100% cho C
        // prob_G = 10'd1000;  // 100% cho G
        // prob_T = 10'd1000;  // 100% cho T

        // Đợi reset xong và sau đó thay đổi giá trị nucl_alig và matrix_P
        #10;
        // In giá trị kết quả
        // Thử với tỷ lệ 100% cho tất cả
        #10;
        prob_A = 10'd1000;
        prob_C = 10'd0;
        prob_G = 10'd0;
        prob_T = 10'd0;

        #20;
        prob_A = 10'd0;
        prob_C = 10'd1000;
        prob_G = 10'd0;
        prob_T = 10'd0;

        #20;
        prob_A = 10'd0;
        prob_C = 10'd0;
        prob_G = 10'd1000;
        prob_T = 10'd0;

        #20;
        prob_A = 10'd0;
        prob_C = 10'd0;
        prob_G = 10'd0;
        prob_T = 10'd1000;

        #20;
        // Thử các trường hợp khác
        prob_A = 10'd250;
        prob_C = 10'd250;
        prob_G = 10'd250;
        prob_T = 10'd250;
        #20;
    end
    always @(posedge clk) begin
        $display("At time %t: result = %b (prob_A = %d, prob_C = %d, prob_G = %d, prob_T = %d)\n"
        , $time, result, prob_A, prob_C, prob_G, prob_T);
    end
    
endmodule
