module SRR (
    input wire clk,               // Tín hiệu clock
    input wire rst,               // Tín hiệu reset đồng bộ
    input wire enable,
    input wire load,              // Tín hiệu load dữ liệu
    input wire data_1,
    input wire [10:0] data_8,     // Dữ liệu 8 bit để load vào
    output reg [10:0] data_o    // Thanh ghi dịch phải 8 bit
);

    always @(posedge clk) begin
        if (rst) begin
            data_o <= 11'b1;    // Reset về giá trị 0
        end else if (load) begin
            data_o <= data_8; // Load dữ liệu vào thanh ghi
        end else if (enable) begin
            data_o <= {data_1, data_o[7:1]}; // Dịch phải, thêm data_1 vào bit MSB
        end else if (!enable) begin
            data_o <= {data_o[0] ^ data_o[6], data_o[10:1]};
        end
    end
endmodule
