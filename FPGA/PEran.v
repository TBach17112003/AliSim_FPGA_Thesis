module PEran (
    input clk,
    input reset,
    input [7:0] seed_ID,
    input [221:0] in1,
    input [221:0] in2,
    output [221:0] out1,
    output [221:0] out2,
    output [41:0] result,
    output [9:0] child_1, 
    output [9:0] child_2,
    output using,
    output leaf
    // output [31:0] final_result
);
    reg [1:0] counter; //đếm chu kỳ
    reg [3:0] instance_00, instance_01, instance_02, instance_03, instance_04, 
            instance_05, instance_06, instance_07, instance_08, instance_09, 
            instance_10, instance_11, instance_12, instance_13, instance_14, instance_15;
    wire [31:0] nucl_alig, final_result;
    wire [9:0] address;
    reg [9:0] child_11, child_22;
    // Khúc này chỉ để khiểm tra lấy cái in2 hay in1 thôi
    wire [159:0] matrix_P;
    assign address = ((in2[221:212] != 0) && (in2[211:180] == 0)) ? in2[221:212] 
                : ((in1[221:212] != 0) && (in1[211:180] == 0)) ? in1[221:212] 
                : (in2[221:212] != 0) ? in2[221:212]: (in1[221:212] != 0) ? in1[221:212] : 32'b0;
    assign nucl_alig = (in2[211:180] != 0) ? in2[211:180]: (in1[211:180] != 0) ? in1[211:180] : 32'b0;
    assign matrix_P = (in1[159:0] != 0) ? in1[159:0]: (in2[159:0] != 0) ? in2[159:0] : 160'b0;
    assign child_1 = ((in1[159:0] != 0) && ((in1[179:170] == 0) || (in1[169:160] == 0))) ? in1[179:170] : (in1[179:170] != 0) ? in1[179:170]: (in2[179:170] != 0) ? in2[179:170] : 3'b0;
    assign child_2 = ((in1[159:0] != 0) && ((in1[179:170] == 0) || (in1[169:160] == 0))) ? in1[169:160] : (in1[169:160] != 0) ? in1[169:160]: (in2[169:160] != 0) ? in2[169:160] : 3'b0;
    // assign child_2 = (in1[169:160] != 0) ? in1[169:160]: (in2[169:160] != 0) ? in2[169:160] : 3'b0;
    assign leaf = ((child_1 == 0) && (child_2 == 0)) ? 1 : 0;
    
    assign result = (leaf && (nucl_alig != 0) && (matrix_P == 0)) ? {address[9:0], nucl_alig[31:0]}: 32'b0;

    assign out1 = (result != 0) ? 0 :((final_result != 0) && (nucl_alig != 0) && (matrix_P != 0)) ? {address[9:0], final_result[31:0], child_11, child_22, 160'b0}
                : ((nucl_alig == 0) || (matrix_P == 0)) ? {address[9:0], nucl_alig[31:0], child_1[9:0], child_2[9:0], matrix_P[159:0]}
                :  0;

    assign out2 = (result != 0) ? 0 :((final_result != 0) && (nucl_alig != 0) && (matrix_P != 0)) ? {address[9:0], final_result[31:0], child_11, child_22, 160'b0}
                : ((nucl_alig == 0) || (matrix_P == 0)) ? {address[9:0], nucl_alig[31:0], child_1[9:0], child_2[9:0], matrix_P[159:0]}
                :  0;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 2'd0;
            instance_00 <= 4'b0000;
            instance_01 <= 4'b0001;
            instance_02 <= 4'b0010;
            instance_03 <= 4'b0011;
            instance_04 <= 4'b0100;
            instance_05 <= 4'b0101;
            instance_06 <= 4'b0110;
            instance_07 <= 4'b0111;
            instance_08 <= 4'b1000;
            instance_09 <= 4'b1001;
            instance_10 <= 4'b1010;
            instance_11 <= 4'b1011;
            instance_12 <= 4'b1100;
            instance_13 <= 4'b1101;
            instance_14 <= 4'b1110;
            instance_15 <= 4'b1111;
        end else begin
            // Đếm chu kỳ clock
            child_11 = child_1;
            child_22 = child_2;
            counter <= counter + 1;
            if (counter == 2'b10) begin
                instance_00 <= 4'b0000 + seed_ID[3:0];
                instance_01 <= 4'b0001 + seed_ID[7:4];
                instance_02 <= 4'b0010 + seed_ID[3:0];
                instance_03 <= 4'b0011 + seed_ID[7:4];
                instance_04 <= 4'b0100 + seed_ID[3:0];
                instance_05 <= 4'b0101 + seed_ID[7:4];
                instance_06 <= 4'b0110 + seed_ID[3:0];
                instance_07 <= 4'b0111 + seed_ID[7:4];
                instance_08 <= 4'b1000 + seed_ID[3:0];
                instance_09 <= 4'b1001 + seed_ID[7:4];
                instance_10 <= 4'b1010 + seed_ID[3:0];
                instance_11 <= 4'b1011 + seed_ID[7:4];
                instance_12 <= 4'b1100 + seed_ID[3:0];
                instance_13 <= 4'b1101 + seed_ID[7:4];
                instance_14 <= 4'b1110 + seed_ID[3:0];
                instance_15 <= 4'b1111 + seed_ID[7:4];
                counter <= 2'b0;
            end
            else begin
                instance_00 <= 4'b0000;
                instance_01 <= 4'b0001;
                instance_02 <= 4'b0010;
                instance_03 <= 4'b0011;
                instance_04 <= 4'b0100;
                instance_05 <= 4'b0101;
                instance_06 <= 4'b0110;
                instance_07 <= 4'b0111;
                instance_08 <= 4'b1000;
                instance_09 <= 4'b1001;
                instance_10 <= 4'b1010;
                instance_11 <= 4'b1011;
                instance_12 <= 4'b1100;
                instance_13 <= 4'b1101;
                instance_14 <= 4'b1110;
                instance_15 <= 4'b1111;
            end 
        end
    end
    wire clean = reset;
    //Nối dây từ khối PE đến các Random
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

    PE C0(
        //input
        .clk(clk),
        .reset(reset),
        .nucl_alig(nucl_alig),
        .matrix_P(matrix_P),
        //output
        .selected_matrix_0 (selected_matrix_0 ),
        .selected_matrix_1 (selected_matrix_1 ),
        .selected_matrix_2 (selected_matrix_2 ),
        .selected_matrix_3 (selected_matrix_3 ),
        .selected_matrix_4 (selected_matrix_4 ),
        .selected_matrix_5 (selected_matrix_5 ),
        .selected_matrix_6 (selected_matrix_6 ),
        .selected_matrix_7 (selected_matrix_7 ),
        .selected_matrix_8 (selected_matrix_8 ),
        .selected_matrix_9 (selected_matrix_9 ),
        .selected_matrix_10(selected_matrix_10),
        .selected_matrix_11(selected_matrix_11),
        .selected_matrix_12(selected_matrix_12),
        .selected_matrix_13(selected_matrix_13),
        .selected_matrix_14(selected_matrix_14),
        .selected_matrix_15(selected_matrix_15)
    );
    RG M0(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_0[39:30]),
        .prob_C(selected_matrix_0[29:20]),
        .prob_G(selected_matrix_0[19:10]),
        .prob_T(selected_matrix_0[09:00]),
        .instance_ID(instance_00),
        .result(final_result[1:0])
    );
    RG M1(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_1[39:30]),
        .prob_C(selected_matrix_1[29:20]),
        .prob_G(selected_matrix_1[19:10]),
        .prob_T(selected_matrix_1[09:00]),
        .instance_ID(instance_01),
        .result(final_result[3:2])
    );
    RG M2(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_2[39:30]),
        .prob_C(selected_matrix_2[29:20]),
        .prob_G(selected_matrix_2[19:10]),
        .prob_T(selected_matrix_2[09:00]),
        .instance_ID(instance_02),
        .result(final_result[5:4])
    );
    RG M3(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_3[39:30]),
        .prob_C(selected_matrix_3[29:20]),
        .prob_G(selected_matrix_3[19:10]),
        .prob_T(selected_matrix_3[09:00]),
        .instance_ID(instance_03),
        .result(final_result[7:6])
    );
    RG M4(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_4[39:30]),
        .prob_C(selected_matrix_4[29:20]),
        .prob_G(selected_matrix_4[19:10]),
        .prob_T(selected_matrix_4[09:00]),
        .instance_ID(instance_04),
        .result(final_result[9:8])
    );
    RG M5(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_5[39:30]),
        .prob_C(selected_matrix_5[29:20]),
        .prob_G(selected_matrix_5[19:10]),
        .prob_T(selected_matrix_5[09:00]),
        .instance_ID(instance_05),
        .result(final_result[11:10])
    );
    RG M6(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_6[39:30]),
        .prob_C(selected_matrix_6[29:20]),
        .prob_G(selected_matrix_6[19:10]),
        .prob_T(selected_matrix_6[09:00]),
        .instance_ID(instance_06),
        .result(final_result[13:12])
    );
    RG M7(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_7[39:30]),
        .prob_C(selected_matrix_7[29:20]),
        .prob_G(selected_matrix_7[19:10]),
        .prob_T(selected_matrix_7[09:00]),
        .instance_ID(instance_07),
        .result(final_result[15:14])
    );
    RG M8(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_8[39:30]),
        .prob_C(selected_matrix_8[29:20]),
        .prob_G(selected_matrix_8[19:10]),
        .prob_T(selected_matrix_8[09:00]),
        .instance_ID(instance_08),
        .result(final_result[17:16])
    );
    RG M9(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_9[39:30]),
        .prob_C(selected_matrix_9[29:20]),
        .prob_G(selected_matrix_9[19:10]),
        .prob_T(selected_matrix_9[09:00]),
        .instance_ID(instance_09),
        .result(final_result[19:18])
    );
    RG M10(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_10[39:30]),
        .prob_C(selected_matrix_10[29:20]),
        .prob_G(selected_matrix_10[19:10]),
        .prob_T(selected_matrix_10[09:00]),
        .instance_ID(instance_10),
        .result(final_result[21:20])
    );
    RG M11(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_11[39:30]),
        .prob_C(selected_matrix_11[29:20]),
        .prob_G(selected_matrix_11[19:10]),
        .prob_T(selected_matrix_11[09:00]),
        .instance_ID(instance_11),
        .result(final_result[23:22])
    );
    RG M12(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_12[39:30]),
        .prob_C(selected_matrix_12[29:20]),
        .prob_G(selected_matrix_12[19:10]),
        .prob_T(selected_matrix_12[09:00]),
        .instance_ID(instance_12),
        .result(final_result[25:24])
    );
    RG M13(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_13[39:30]),
        .prob_C(selected_matrix_13[29:20]),
        .prob_G(selected_matrix_13[19:10]),
        .prob_T(selected_matrix_13[09:00]),
        .instance_ID(instance_13),
        .result(final_result[27:26])
    );
    RG M14(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_14[39:30]),
        .prob_C(selected_matrix_14[29:20]),
        .prob_G(selected_matrix_14[19:10]),
        .prob_T(selected_matrix_14[09:00]),
        .instance_ID(instance_14),
        .result(final_result[29:28])
    );
    RG M15(
        .clk(clk), 
        .reset(clean), 
        .prob_A(selected_matrix_15[39:30]),
        .prob_C(selected_matrix_15[29:20]),
        .prob_G(selected_matrix_15[19:10]),
        .prob_T(selected_matrix_15[09:00]),
        .instance_ID(instance_15),
        .result(final_result[31:30])
    );
endmodule