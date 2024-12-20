`timescale 1ps/1ps
module main(
        
);  
    reg enable_i;
    reg load;
    reg [7:0] data_8;
    reg clk;
    reg reset;
    wire valid_o;
    wire [7:0] data_o;
    wire [2:0] pos_0, pos_1, pos_2, pos_3, pos_4, pos_5, pos_6, pos_7;
    wire [31:0] nucl_alig_0, nucl_alig_1, nucl_alig_2, nucl_alig_3, nucl_alig_4, nucl_alig_5, nucl_alig_6, nucl_alig_7;
    wire [159:0] matrix_P_0, matrix_P_1, matrix_P_2, matrix_P_3, matrix_P_4, matrix_P_5, matrix_P_6, matrix_P_7;
    wire [31:0] final_result_0, final_result_1, final_result_2, final_result_3, final_result_4, final_result_5, final_result_6, final_result_7;
    // Liên kết các khối
    NeoRNG RanNeo (
        .clk(clk),
        .rst(reset),
        .enable_i(enable_i),
        .load(load),
        .data_8(data_8),
        .valid_o(valid_o),
        .data_o(data_o)
    );
    Controller C (
        .clk(clk),
        .reset(reset),
        .pos_0(pos_0),
        .pos_1(pos_1),
        .pos_2(pos_2),
        .pos_3(pos_3),
        .pos_4(pos_4),
        .pos_5(pos_5),
        .pos_6(pos_6),
        .pos_7(pos_7),
        .nucl_alig_0(nucl_alig_0),
        .nucl_alig_1(nucl_alig_1),
        .nucl_alig_2(nucl_alig_2),
        .nucl_alig_3(nucl_alig_3),
        .nucl_alig_4(nucl_alig_4),
        .nucl_alig_5(nucl_alig_5),
        .nucl_alig_6(nucl_alig_6),
        .nucl_alig_7(nucl_alig_7),
        .matrix_P_0(matrix_P_0),
        .matrix_P_1(matrix_P_1),
        .matrix_P_2(matrix_P_2),
        .matrix_P_3(matrix_P_3),
        .matrix_P_4(matrix_P_4),
        .matrix_P_5(matrix_P_5),
        .matrix_P_6(matrix_P_6),
        .matrix_P_7(matrix_P_7)
    );
    PEran P0(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_0),
            .matrix_P(matrix_P_0),
            .seed_ID(data_o),
            .final_result(final_result_0)
    );
    PEran P1(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_1),
            .matrix_P(matrix_P_1),
            .seed_ID(data_o),
            .final_result(final_result_1)
    );   
    PEran P2(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_2),
            .matrix_P(matrix_P_2),
            .seed_ID(data_o),
            .final_result(final_result_2)
    );  
    PEran P3(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_3),
            .matrix_P(matrix_P_3),
            .seed_ID(data_o),
            .final_result(final_result_3)
    );
    PEran P4(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_4),
            .matrix_P(matrix_P_4),
            .seed_ID(data_o),
            .final_result(final_result_4)
    );
    PEran P5(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_5),
            .matrix_P(matrix_P_5),
            .seed_ID(data_o),
            .final_result(final_result_5)
    );   
    PEran P6(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_6),
            .matrix_P(matrix_P_6),
            .seed_ID(data_o),
            .final_result(final_result_6)
    );  
    PEran P7(
            .clk(clk),
            .reset(reset),
            .nucl_alig(nucl_alig_7),
            .matrix_P(matrix_P_7),
            .seed_ID(data_o),
            .final_result(final_result_7)
    ); 

   assign file = {final_result_0, final_result_1, final_result_2, final_result_3, final_result_4, final_result_5, final_result_6, final_result_7};
   initial begin
       clk = 0;
       forever begin
           #10 clk = ~clk;
       end
   end

   initial begin
       reset = 1;
       #5
       reset = 0;
       #400
       $stop;
   end

   always @(posedge clk) begin
       $display("Time: %t, nucl_alig_0: %b, final_result_0: %b", $time, nucl_alig_0, final_result_0);
       $display("Time: %t, nucl_alig_1: %b, final_result_1: %b", $time, nucl_alig_1, final_result_1);
       $display("Time: %t, nucl_alig_2: %b, final_result_2: %b", $time, nucl_alig_2, final_result_2);
       $display("Time: %t, nucl_alig_3: %b, final_result_3: %b", $time, nucl_alig_3, final_result_3);
       $display("Time: %t, nucl_alig_4: %b, final_result_4: %b", $time, nucl_alig_4, final_result_4);
       $display("Time: %t, nucl_alig_5: %b, final_result_5: %b", $time, nucl_alig_5, final_result_5);
       $display("Time: %t, nucl_alig_6: %b, final_result_6: %b", $time, nucl_alig_6, final_result_6);
       $display("Time: %t, nucl_alig_7: %b, final_result_7: %b\n", $time, nucl_alig_7, final_result_7);
   end
    // PEran P8(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_8),
    //         .matrix_P(matrix_P_8),
    //         .final_result(final_result_8)
    // );
    // PEran P9(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_9),
    //         .matrix_P(matrix_P_9),
    //         .final_result(final_result_9)
    // );   
    // PEran P10(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_10),
    //         .matrix_P(matrix_P_10),
    //         .final_result(final_result_10)
    // );  
    // PEran P11(
    //     .clk(clk),
    //     .reset(reset),
    //     .nucl_alig(nucl_alig_11),
    //     .matrix_P(matrix_P_11),
    //     .final_result(final_result_11)
    // );         
    // PEran P12(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_12),
    //         .matrix_P(matrix_P_12),
    //         .final_result(final_result_12)
    // );
    // PEran P13(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_13),
    //         .matrix_P(matrix_P_13),
    //         .final_result(final_result_13)
    // );   
    // PEran P14(
    //         .clk(clk),
    //         .reset(reset),
    //         .nucl_alig(nucl_alig_14),
    //         .matrix_P(matrix_P_14),
    //         .final_result(final_result_14)
    // );  
    // PEran P15(
    //     .clk(clk),
    //     .reset(reset),
    //     .nucl_alig(nucl_alig_15),
    //     .matrix_P(matrix_P_15),
    //     .final_result(final_result_15)
    // ); 

endmodule
