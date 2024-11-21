module PEran (
    input clk,
    input reset,
    input [31:0] nucl_alig,
    input [159:0] matrix_P,
    output [31:0] final_result
);
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
        .reset(reset), 
        .prob_A(selected_matrix_0[39:30]),
        .prob_C(selected_matrix_0[29:20]),
        .prob_G(selected_matrix_0[19:10]),
        .prob_T(selected_matrix_0[09:00]),
        .instance_ID(4'd0),
        .result(final_result[1:0])
    );
    RG M1(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_1[39:30]),
        .prob_C(selected_matrix_1[29:20]),
        .prob_G(selected_matrix_1[19:10]),
        .prob_T(selected_matrix_1[09:00]),
        .instance_ID(4'd1),
        .result(final_result[3:2])
    );
    RG M2(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_2[39:30]),
        .prob_C(selected_matrix_2[29:20]),
        .prob_G(selected_matrix_2[19:10]),
        .prob_T(selected_matrix_2[09:00]),
        .instance_ID(4'd2),
        .result(final_result[5:4])
    );
    RG M3(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_3[39:30]),
        .prob_C(selected_matrix_3[29:20]),
        .prob_G(selected_matrix_3[19:10]),
        .prob_T(selected_matrix_3[09:00]),
        .instance_ID(4'd3),
        .result(final_result[7:6])
    );
    RG M4(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_4[39:30]),
        .prob_C(selected_matrix_4[29:20]),
        .prob_G(selected_matrix_4[19:10]),
        .prob_T(selected_matrix_4[09:00]),
        .instance_ID(4'd4),
        .result(final_result[9:8])
    );
    RG M5(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_5[39:30]),
        .prob_C(selected_matrix_5[29:20]),
        .prob_G(selected_matrix_5[19:10]),
        .prob_T(selected_matrix_5[09:00]),
        .instance_ID(4'd5),
        .result(final_result[11:10])
    );
    RG M6(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_6[39:30]),
        .prob_C(selected_matrix_6[29:20]),
        .prob_G(selected_matrix_6[19:10]),
        .prob_T(selected_matrix_6[09:00]),
        .instance_ID(4'd6),
        .result(final_result[13:12])
    );
    RG M7(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_7[39:30]),
        .prob_C(selected_matrix_7[29:20]),
        .prob_G(selected_matrix_7[19:10]),
        .prob_T(selected_matrix_7[09:00]),
        .instance_ID(4'd7),
        .result(final_result[15:14])
    );
    RG M8(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_8[39:30]),
        .prob_C(selected_matrix_8[29:20]),
        .prob_G(selected_matrix_8[19:10]),
        .prob_T(selected_matrix_8[09:00]),
        .instance_ID(4'd8),
        .result(final_result[17:16])
    );
    RG M9(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_9[39:30]),
        .prob_C(selected_matrix_9[29:20]),
        .prob_G(selected_matrix_9[19:10]),
        .prob_T(selected_matrix_9[09:00]),
        .instance_ID(4'd9),
        .result(final_result[19:18])
    );
    RG M10(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_10[39:30]),
        .prob_C(selected_matrix_10[29:20]),
        .prob_G(selected_matrix_10[19:10]),
        .prob_T(selected_matrix_10[09:00]),
        .instance_ID(4'd10),
        .result(final_result[21:20])
    );
    RG M11(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_11[39:30]),
        .prob_C(selected_matrix_11[29:20]),
        .prob_G(selected_matrix_11[19:10]),
        .prob_T(selected_matrix_11[09:00]),
        .instance_ID(4'd11),
        .result(final_result[23:22])
    );
    RG M12(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_12[39:30]),
        .prob_C(selected_matrix_12[29:20]),
        .prob_G(selected_matrix_12[19:10]),
        .prob_T(selected_matrix_12[09:00]),
        .instance_ID(4'd12),
        .result(final_result[25:24])
    );
    RG M13(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_13[39:30]),
        .prob_C(selected_matrix_13[29:20]),
        .prob_G(selected_matrix_13[19:10]),
        .prob_T(selected_matrix_13[09:00]),
        .instance_ID(4'd13),
        .result(final_result[27:26])
    );
    RG M14(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_14[39:30]),
        .prob_C(selected_matrix_14[29:20]),
        .prob_G(selected_matrix_14[19:10]),
        .prob_T(selected_matrix_14[09:00]),
        .instance_ID(4'd14),
        .result(final_result[29:28])
    );
    RG M15(
        .clk(clk), 
        .reset(reset), 
        .prob_A(selected_matrix_15[39:30]),
        .prob_C(selected_matrix_15[29:20]),
        .prob_G(selected_matrix_15[19:10]),
        .prob_T(selected_matrix_15[09:00]),
        .instance_ID(4'd15),
        .result(final_result[31:30])
    );
endmodule