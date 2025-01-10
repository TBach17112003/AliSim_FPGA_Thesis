module Controller (
  input clk,
  input reset,
  output reg [2:0] pos_0, pos_1, pos_2, pos_3, pos_4, pos_5, pos_6, pos_7,
  output reg [31:0] nucl_alig_0, nucl_alig_1, nucl_alig_2, nucl_alig_3, nucl_alig_4, nucl_alig_5, nucl_alig_6, nucl_alig_7,
  output reg [159:0] matrix_P_0, matrix_P_1, matrix_P_2, matrix_P_3, matrix_P_4, matrix_P_5, matrix_P_6, matrix_P_7
);
  reg [194:0] memory [0:7];  // Mảng lưu dữ liệu nhị phân (1 phần tử, mỗi phần tử 34 bit)
  //reg [2:0] cycle_counter;
  // Tách dữ liệu đọc được
  initial begin
    $readmemb("output.txt", memory);  
  end
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // cycle_counter <= 0;
      pos_0 <= 3'bx;
      pos_1 <= 3'bx;
      pos_2 <= 3'bx;
      pos_3 <= 3'bx;
      pos_4 <= 3'bx;
      pos_5 <= 3'bx;
      pos_6 <= 3'bx;
      pos_7 <= 3'bx;
      nucl_alig_0 <= 32'bx;
      nucl_alig_1 <= 32'bx;
      nucl_alig_2 <= 32'bx;
      nucl_alig_3 <= 32'bx;
      nucl_alig_4 <= 32'bx;
      nucl_alig_5 <= 32'bx;
      nucl_alig_6 <= 32'bx;
      nucl_alig_7 <= 32'bx;
      matrix_P_0 <= 160'bx;
      matrix_P_1 <= 160'bx;
      matrix_P_2 <= 160'bx;
      matrix_P_3 <= 160'bx;
      matrix_P_4 <= 160'bx;
      matrix_P_5 <= 160'bx;
      matrix_P_6 <= 160'bx;
      matrix_P_7 <= 160'bx;
    end else begin
      {pos_0, nucl_alig_0, matrix_P_0} <= memory[0];
      {pos_1, nucl_alig_1, matrix_P_1} <= memory[1];  
      {pos_2, nucl_alig_2, matrix_P_2} <= memory[2]; 
      {pos_3, nucl_alig_3, matrix_P_3} <= memory[3]; 
      {pos_4, nucl_alig_4, matrix_P_4} <= memory[4]; 
      {pos_5, nucl_alig_5, matrix_P_5} <= memory[5]; 
      {pos_6, nucl_alig_6, matrix_P_6} <= memory[6]; 
      {pos_7, nucl_alig_7, matrix_P_7} <= memory[7]; 
    end
    // $display("Data[0]: %b\n", {pos, nucl_alig, matrix_P});
  end

endmodule