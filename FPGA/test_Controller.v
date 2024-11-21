`timescale 1ns/1ps

module Controller_tb;
  // Tín hiệu kết nối tới mô-đun Controller
  reg clk;
  reg reset;
  wire [2:0] pos;
  wire [31:0] nucl_alig;
  wire [159:0] matrix_P;

  // Khởi tạo mô-đun Controller
  Controller M1 (
    .clk(clk),
    .reset(reset),
    .pos(pos),
    .nucl_alig(nucl_alig),
    .matrix_P(matrix_P)
  );

  // Tạo tín hiệu đồng hồ (50MHz - chu kỳ 20ns)
  always #10 clk = ~clk;

  // Testbench chính
  initial begin
    // Khởi tạo tín hiệu
    clk = 0;
    reset = 0;

    // Hiển thị tiêu đề cột cho mô phỏng
    $display("Time\tReset\tPos\tNucl_Alig\tMatrix_P");

    // Reset mô-đun
    reset = 1;
    #20;
    reset = 0;

    // Chạy mô phỏng trong 160 ns (đủ để kiểm tra 8 chu kỳ)
    #180;

    // Kết thúc mô phỏng
    $finish;
  end

  // In giá trị output tại mỗi chu kỳ
  always @(posedge clk) begin
    $display("%0dns\t%b\t%b\t%h\t%h", $time, reset, pos, nucl_alig, matrix_P);
  end
endmodule