module PE (
    input clk,
    input reset,
    input [31:0] nucl_alig,
    input [159:0] matrix_P,
    output [39:0] selected_matrix_0,
    output [39:0] selected_matrix_1,
    output [39:0] selected_matrix_2,
    output [39:0] selected_matrix_3,
    output [39:0] selected_matrix_4,
    output [39:0] selected_matrix_5,
    output [39:0] selected_matrix_6,
    output [39:0] selected_matrix_7,
    output [39:0] selected_matrix_8,
    output [39:0] selected_matrix_9,
    output [39:0] selected_matrix_10,
    output [39:0] selected_matrix_11,
    output [39:0] selected_matrix_12,
    output [39:0] selected_matrix_13,
    output [39:0] selected_matrix_14,
    output [39:0] selected_matrix_15
);
    parameter A = 2'b00, C = 2'b01, G = 2'b10, T = 2'b11;
    integer i;
    reg [1:0] nucl_group; // Nhóm 2 bit tạm thời để xử lý
    reg [39:0] selected_matrix_internal [0:15];
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset tất cả output về 0
            for (i = 0; i < 16; i = i + 1) begin
                selected_matrix_internal[i] <= 40'b0;
            end
        end else if ((nucl_alig != 0) && (matrix_P != 0)) begin
            // Xử lý từng nhóm 2 bit của nucl_alig
            for (i = 0; i < 16; i = i + 1) begin
                nucl_group = nucl_alig[i*2 +: 2]; // Lấy nhóm 2 bit từ nucl_alig
                // $display("nucl  %b\n", nucl_group);
                case (nucl_group)
                    A: selected_matrix_internal[i] <= matrix_P[159:120];
                    C: selected_matrix_internal[i] <= matrix_P[119:80];
                    G: selected_matrix_internal[i] <= matrix_P[79:40];
                    T: selected_matrix_internal[i] <= matrix_P[39:0];
                    default: selected_matrix_internal[i] <= 40'bx; // Trường hợp không mong muốn
                endcase
            end
        end
    end
    // Lấy ra các Prob theo từng vị trí Nucl nếu thiết kế chuỗi dài hơn có thể tăng số lượng ở đây
    assign selected_matrix_0 = selected_matrix_internal[0];
    assign selected_matrix_1 = selected_matrix_internal[1];
    assign selected_matrix_2 = selected_matrix_internal[2];
    assign selected_matrix_3 = selected_matrix_internal[3];
    assign selected_matrix_4 = selected_matrix_internal[4];
    assign selected_matrix_5 = selected_matrix_internal[5];
    assign selected_matrix_6 = selected_matrix_internal[6];
    assign selected_matrix_7 = selected_matrix_internal[7];
    assign selected_matrix_8 = selected_matrix_internal[8];
    assign selected_matrix_9 = selected_matrix_internal[9];
    assign selected_matrix_10 = selected_matrix_internal[10];
    assign selected_matrix_11 = selected_matrix_internal[11];
    assign selected_matrix_12 = selected_matrix_internal[12];
    assign selected_matrix_13 = selected_matrix_internal[13];
    assign selected_matrix_14 = selected_matrix_internal[14];
    assign selected_matrix_15 = selected_matrix_internal[15];
endmodule