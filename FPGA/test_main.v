`timescale 1ps/1ps
module test (
);
    reg clk;
    reg reset;
    wire [39:0] matrix_0;
    wire [39:0] matrix_1;
    wire [39:0] matrix_2;
    wire [39:0] matrix_3;
    wire [39:0] matrix_4;
    wire [39:0] matrix_5;
    wire [39:0] matrix_6;
    wire [39:0] matrix_7;
    wire [39:0] matrix_8;
    wire [39:0] matrix_9;
    wire [39:0] matrix_10;
    wire [39:0] matrix_11;
    wire [39:0] matrix_12;
    wire [39:0] matrix_13;
    wire [39:0] matrix_14;
    wire [39:0] matrix_15;

    main Top(
        .clk(clk),
        .reset(reset),
        .matrix_0 (matrix_0 ),
        .matrix_1 (matrix_1 ),
        .matrix_2 (matrix_2 ),
        .matrix_3 (matrix_3 ),
        .matrix_4 (matrix_4 ),
        .matrix_5 (matrix_5 ),
        .matrix_6 (matrix_6 ),
        .matrix_7 (matrix_7 ),
        .matrix_8 (matrix_8 ),
        .matrix_9 (matrix_9 ),
        .matrix_10(matrix_10),
        .matrix_11(matrix_11),
        .matrix_12(matrix_12),
        .matrix_13(matrix_13),
        .matrix_14(matrix_14),
        .matrix_15(matrix_15)
    );

    initial begin
        clk = 0;
        forever begin
            #10
            clk = ~clk;
        end
    end

    initial begin
        reset = 0;
        #20;
        reset = 1;
        #30
        $stop;
    end

    // Thêm $display để hiển thị kết quả
    always @(posedge clk) begin
        // Đợi một thời gian để mô-đun chạy
        $display("At time %t:", $time);
        $display("matrix_0 = %h", matrix_0);
        $display("matrix_1 = %h", matrix_1);
        $display("matrix_2 = %h", matrix_2);
        $display("matrix_3 = %h", matrix_3);
        $display("matrix_4 = %h", matrix_4);
        $display("matrix_5 = %h", matrix_5);
        $display("matrix_6 = %h", matrix_6);
        $display("matrix_7 = %h", matrix_7);
        $display("matrix_8 = %h", matrix_8);
        $display("matrix_9 = %h", matrix_9);
        $display("matrix_10 = %h", matrix_10);
        $display("matrix_11 = %h", matrix_11);
        $display("matrix_12 = %h", matrix_12);
        $display("matrix_13 = %h", matrix_13);
        $display("matrix_14 = %h", matrix_14);
        $display("matrix_15 = %h", matrix_15);
    end
endmodule