//==== RO5 ====//
    module Ring_Oscillator_5  (
        //-= input control
        input wire clk,
        input wire rst,
        input wire enable_i,

        //-= output control
        output enable_o,
        output random_o
    );
    //==== WIRE DEFINE ====//
        wire Q_1, Q_2, Q_3, Q_4, Q_5;                   // Latch
        wire Q_EN_1, Q_EN_2, Q_EN_3, Q_EN_4, Q_EN_5;    // FF
        wire Syn_1, Syn_2, Syn_3, Syn_4;                // using for Syn

    //==== DFF-DLATCH_1 ====//
        D_flip_flop FF_1(
            .D(enable_i),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_1)
        );
        D_latch Inv_1 (
            .D(!Syn_1),
            .EN(Q_EN_1),
            .rst(enable_i),
            .Q(Q_1)
        );
    //==== DFF-DLATCH_2 ====//
        D_flip_flop FF_2(
            .D(Q_EN_1),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_2)
        );
        D_latch Inv_2 (
            .D(!Q_1),
            .EN(Q_EN_2),
            .rst(enable_i),
            .Q(Q_2)
        );
    //==== DFF-DLATCH_3 ====//
        D_flip_flop FF_3(
            .D(Q_EN_2),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_3)
        );
        D_latch Inv_3 (
            .D(!Q_2),
            .EN(Q_EN_3),
            .rst(enable_i),
            .Q(Q_3)
        );
    //==== DFF-DLATCH_4 ====//
        D_flip_flop FF_4(
            .D(Q_EN_3),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_4)
        );
        D_latch Inv_4 (
            .D(!Q_3),
            .EN(Q_EN_4),
            .rst(enable_i),
            .Q(Q_4)
        );
    //==== DFF-DLATCH_5 ====//
        D_flip_flop FF_5(
            .D(Q_EN_4),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_5)
        );
        D_latch Inv_5 (
            .D(!Q_4),
            .EN(Q_EN_5),
            .rst(enable_i),
            .Q(Q_5)
        );

    //==== DFF for Synchronize ====//
        D_flip_flop Syn_ff_1(
            .D(Q_5),
            .clk(clk),
            .rst(rst),
            .Q(Syn_1)
        );
        // D_flip_flop Syn_ff_2(
        //     .D(Syn_1),
        //     .clk(clk),
        //     .rst(rst),
        //     .Q(Syn_2)
        // );
        // D_flip_flop Syn_ff_3(
        //     .D(Syn_2),
        //     .clk(clk),
        //     .rst(rst),
        //     .Q(Syn_3)
        // );
        // D_flip_flop Syn_ff_4(
        //     .D(Syn_3),
        //     .clk(clk),
        //     .rst(rst),
        //     .Q(Syn_4)
        // );
    //==== Output ====//
        assign random_o = Syn_1;
        assign enable_o = Q_EN_5;

    endmodule

//==== RO7 ====//
    module Ring_Oscillator_7  (
        //-= input control
        input wire clk,
        input wire rst,
        input wire enable_i,

        //-= output control
        output enable_o,
        output random_o
    );
    //==== WIRE DEFINE ====//
        wire Q_1, Q_2, Q_3, Q_4, Q_5, Q_6, Q_7;                     // Latch
        wire Q_EN_1, Q_EN_2, Q_EN_3, Q_EN_4, Q_EN_5, Q_EN_6, Q_EN_7;// FF
        wire Syn_1, Syn_2;                                          // using for Syn

    //==== DFF-DLATCH_1 ====//
        D_flip_flop FF_1(
            .D(enable_i),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_1)
        );
        D_latch Inv_1 (
            .D(!Syn_1),
            .EN(Q_EN_1),
            .rst(enable_i),
            .Q(Q_1)
        );
    //==== DFF-DLATCH_2 ====//
        D_flip_flop FF_2(
            .D(Q_EN_1),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_2)
        );
        D_latch Inv_2 (
            .D(!Q_1),
            .EN(Q_EN_2),
            .rst(enable_i),
            .Q(Q_2)
        );
    //==== DFF-DLATCH_3 ====//
        D_flip_flop FF_3(
            .D(Q_EN_2),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_3)
        );
        D_latch Inv_3 (
            .D(!Q_2),
            .EN(Q_EN_3),
            .rst(enable_i),
            .Q(Q_3)
        );
    //==== DFF-DLATCH_4 ====//
        D_flip_flop FF_4(
            .D(Q_EN_3),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_4)
        );
        D_latch Inv_4 (
            .D(!Q_3),
            .EN(Q_EN_4),
            .rst(enable_i),
            .Q(Q_4)
        );
    //==== DFF-DLATCH_5 ====//
        D_flip_flop FF_5(
            .D(Q_EN_4),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_5)
        );
        D_latch Inv_5 (
            .D(!Q_4),
            .EN(Q_EN_5),
            .rst(enable_i),
            .Q(Q_5)
        );
    //==== DFF-DLATCH_6 ====//
        D_flip_flop FF_6(
            .D(Q_EN_5),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_6)
        );
        D_latch Inv_6 (
            .D(!Q_5),
            .EN(Q_EN_6),
            .rst(enable_i),
            .Q(Q_6)
        );
    //==== DFF-DLATCH_7 ====//
        D_flip_flop FF_7(
            .D(Q_EN_6),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_7)
        );
        D_latch Inv_7 (
            .D(!Q_6),
            .EN(Q_EN_7),
            .rst(enable_i),
            .Q(Q_7)
        );

    //==== DFF for Synchronize ====//
        D_flip_flop Syn_ff_1(
            .D(Q_7),
            .clk(clk),
            .rst(rst),
            .Q(Syn_1)
        );
        // D_flip_flop Syn_ff_2(
        //     .D(Syn_1),
        //     .clk(clk),
        //     .rst(rst),
        //     .Q(Syn_2)
        // );
    //==== Output ====//
        assign random_o = Syn_1;
        assign enable_o = Q_EN_7;

    endmodule

//==== RO9 ====//
    module Ring_Oscillator_9  (
        //-= input control
        input wire clk,
        input wire rst,
        input wire enable_i,

        //-= output control
        output enable_o,
        output random_o
    );
    //==== WIRE DEFINE ====//
        wire Q_1, Q_2, Q_3, Q_4, Q_5, Q_6, Q_7, Q_8, Q_9;                           // Latch
        wire Q_EN_1, Q_EN_2, Q_EN_3, Q_EN_4, Q_EN_5, Q_EN_6, Q_EN_7, Q_EN_8, Q_EN_9;// FF

    //==== DFF-DLATCH_1 ====//
        D_flip_flop FF_1(
            .D(enable_i),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_1)
        );
        D_latch Inv_1 (
            .D(!Syn_1),
            .EN(Q_EN_1),
            .rst(enable_i),
            .Q(Q_1)
        );
    //==== DFF-DLATCH_2 ====//
        D_flip_flop FF_2(
            .D(Q_EN_1),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_2)
        );
        D_latch Inv_2 (
            .D(!Q_1),
            .EN(Q_EN_2),
            .rst(enable_i),
            .Q(Q_2)
        );
    //==== DFF-DLATCH_3 ====//
        D_flip_flop FF_3(
            .D(Q_EN_2),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_3)
        );
        D_latch Inv_3 (
            .D(!Q_2),
            .EN(Q_EN_3),
            .rst(enable_i),
            .Q(Q_3)
        );
    //==== DFF-DLATCH_4 ====//
        D_flip_flop FF_4(
            .D(Q_EN_3),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_4)
        );
        D_latch Inv_4 (
            .D(!Q_3),
            .EN(Q_EN_4),
            .rst(enable_i),
            .Q(Q_4)
        );
    //==== DFF-DLATCH_5 ====//
        D_flip_flop FF_5(
            .D(Q_EN_4),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_5)
        );
        D_latch Inv_5 (
            .D(!Q_4),
            .EN(Q_EN_5),
            .rst(enable_i),
            .Q(Q_5)
        );
    //==== DFF-DLATCH_6 ====//
        D_flip_flop FF_6(
            .D(Q_EN_5),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_6)
        );
        D_latch Inv_6 (
            .D(!Q_5),
            .EN(Q_EN_6),
            .rst(enable_i),
            .Q(Q_6)
        );
    //==== DFF-DLATCH_7 ====//
        D_flip_flop FF_7(
            .D(Q_EN_6),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_7)
        );
        D_latch Inv_7 (
            .D(!Q_6),
            .EN(Q_EN_7),
            .rst(enable_i),
            .Q(Q_7)
        );
    //==== DFF-DLATCH_8 ====//
        D_flip_flop FF_8(
            .D(Q_EN_7),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_8)
        );
        D_latch Inv_8 (
            .D(!Q_7),
            .EN(Q_EN_8),
            .rst(enable_i),
            .Q(Q_8)
        );
    //==== DFF-DLATCH_9 ====//
        D_flip_flop FF_9(
            .D(Q_EN_8),
            .clk(clk),
            .rst(rst),
            .Q(Q_EN_9)
        );
        D_latch Inv_9 (
            .D(!Q_8),
            .EN(Q_EN_9),
            .rst(enable_i),
            .Q(Q_9)
        );

        D_flip_flop Syn_ff_1(
            .D(Q_9),
            .clk(clk),
            .rst(rst),
            .Q(Syn_1)
        );

    //==== Output ====//
        assign random_o = Syn_1;
        assign enable_o = Q_EN_9;

    endmodule

module RO (
    input clk,
    input rst,
    input enable_i,
    output enable_o,
    output rnd
);
//==== WIRE DEFINE ====//
wire enable_5_7, enable_7_9;
wire random_o_5, random_o_7, random_o_9;

Ring_Oscillator_5 RO_5 (
    .clk(clk),
    .rst(rst),
    .enable_i(enable_i),
    .enable_o(enable_5_7),
    .random_o(random_o_5)
);

Ring_Oscillator_7 RO_7 (
    .clk(clk),
    .rst(rst),
    .enable_i(enable_5_7),
    .enable_o(enable_7_9),
    .random_o(random_o_7)
);

Ring_Oscillator_9 RO_9 (
    .clk(clk),
    .rst(rst),
    .enable_i(enable_7_9),
    .enable_o(enable_o),
    .random_o(random_o_9)
);

assign rnd = random_o_5 ^ random_o_7 ^ random_o_9;
endmodule