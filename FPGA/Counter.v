module counter_7bit (
    input wire clk,          // Tín hiệu clock
    input wire rst,          // Tín hiệu reset đồng bộ
    input wire inc,
    output reg [6:0] count   // Giá trị đếm 7 bit
);
    always @(posedge clk) begin
        if (rst) begin
            count <= 7'b0;    // Đặt lại giá trị đếm về 0 khi reset
        end else if (inc) begin
            count <= count + 1; // Đếm lên
        end
    end
endmodule
