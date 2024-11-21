`timescale 1ps/1ps

module PE_tb;

    // Định nghĩa tín hiệu
    reg clk;
    reg reset;
    reg [31:0] nucl_alig;
    reg [159:0] matrix_P;
    wire [39:0] selected_matrix_0;
    wire [39:0] selected_matrix_1;
    wire [39:0] selected_matrix_2;
    wire [39:0] selected_matrix_3;
    wire [39:0] selected_matrix_4;
    wire [39:0] selected_matrix_5;
    wire [39:0] selected_matrix_6;
    wire [39:0] selected_matrix_7;
    wire [39:0] selected_matrix_8;
    wire [39:0] selected_matrix_9;
    wire [39:0] selected_matrix_10;
    wire [39:0] selected_matrix_11;
    wire [39:0] selected_matrix_12;
    wire [39:0] selected_matrix_13;
    wire [39:0] selected_matrix_14;
    wire [39:0] selected_matrix_15;

    // Khởi tạo mô-đun PE
    PE uut (
        .clk(clk),
        .reset(reset),
        .nucl_alig(nucl_alig),
        .matrix_P(matrix_P),
        .selected_matrix_0(selected_matrix_0),
        .selected_matrix_1(selected_matrix_1),
        .selected_matrix_2(selected_matrix_2),
        .selected_matrix_3(selected_matrix_3),
        .selected_matrix_4(selected_matrix_4),
        .selected_matrix_5(selected_matrix_5),
        .selected_matrix_6(selected_matrix_6),
        .selected_matrix_7(selected_matrix_7),
        .selected_matrix_8(selected_matrix_8),
        .selected_matrix_9(selected_matrix_9),
        .selected_matrix_10(selected_matrix_10),
        .selected_matrix_11(selected_matrix_11),
        .selected_matrix_12(selected_matrix_12),
        .selected_matrix_13(selected_matrix_13),
        .selected_matrix_14(selected_matrix_14),
        .selected_matrix_15(selected_matrix_15)
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
        #20;
        $finish;  // Kết thúc mô phỏng sau 200 ps
    end

    // Cấp giá trị cho các tín hiệu đầu vào
    initial begin
        // Giá trị đầu vào cho nucl_alig và matrix_P
        nucl_alig = 32'b000110110001101100011011;  // Ví dụ giá trị 32 bit
        matrix_P = 160'h1000000001000000000200000000030000000004;  // Ví dụ giá trị 160 bi
    end

    // Hiển thị giá trị các selected_matrix sau mỗi chu kỳ đồng hồ
    always @(posedge clk) begin
        $display("At time %t:", $time);
        $display("matrix_0 = %h, matrix_1 = %h, matrix_2 = %h, matrix_3 = %h, matrix_4 = %h", selected_matrix_0, selected_matrix_1, selected_matrix_2, selected_matrix_3, selected_matrix_4);
        $display("matrix_5 = %h, matrix_6 = %h, matrix_7 = %h, matrix_8 = %h, matrix_9 = %h", selected_matrix_5, selected_matrix_6, selected_matrix_7, selected_matrix_8, selected_matrix_9);
        $display("matrix_10 = %h, matrix_11 = %h, matrix_12 = %h, matrix_13 = %h, matrix_14 = %h, matrix_15 = %h", selected_matrix_10, selected_matrix_11, selected_matrix_12, selected_matrix_13, selected_matrix_14, selected_matrix_15);
    end

endmodule
