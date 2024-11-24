module lfsr (
    input wire clk,
    input wire reset,
    input wire [10:0] seed,
    output reg [32:0] rand_val
);
    // Kết quả random_val có số lượng bit gấp 3 lần để gia tăng tính random
    // Feedback chia thành từng cụm mỗi cụm 11 bit, XOR(9,6) của từng cụm
    wire feedback_0 = rand_val[9] ^ rand_val[6];
    wire feedback_1 = rand_val[19] ^ rand_val[16];
    wire feedback_2 = rand_val[29] ^ rand_val[26];
    reg first = 1'b1;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rand_val <= 33'd1; // Khởi tạo khác 0
            first <= 1'b1;  // Dùng cho trường hợp chỉ nhận seed một lần (Cả cây phân loài dùng chung 1 seed)
            // Có thể thiết kế mỗi nhóm nhận vào sẽ nuôi một seed khác nhau
        end else if (first== 1) begin
            // Trộn giá trị Seed kết hợp với id của mỗi khối Random
            if ((seed !== 11'bx) & (seed != 11'd0)) begin
                rand_val[10:0] <= seed;
                rand_val[21:11] <= ~seed;
                rand_val[32:22] <= {seed[0], seed[1], seed[2], seed[3], seed[4], 
                                    seed[5], seed[6], seed[7], seed[8], seed[9], seed[10]};
                first <= 1'b0;
            end
        end else if (!first) begin
            // Shift feedback riêng của từng cụm
            rand_val <= {rand_val[32:22], feedback_2, rand_val[21:11], feedback_1, 
                         rand_val[10:0], feedback_0};
        end
    end

endmodule
