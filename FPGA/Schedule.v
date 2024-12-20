module Schedule (
  input wire clk,
  input wire reset,
  input wire [7:0] seed_ID,
  output reg [2:0] state
);


  // State encoding
  localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,
             S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

  reg [197:0] memory [0:6];
  initial begin
    memory[0] = 198'h48D159E0C0000000000000000000000000000000000000000;
    memory[1] = 198'h0000000104444444444444444444444444444444444444447;
    memory[2] = 198'h0000000001111111111111111111111111111111111111111;
    memory[3] = 198'h0000000001111111111111111111111111111111111111111;
    memory[4] = 198'h00000002C4444444444444444444444444444444444444446;
    memory[5] = 198'h0000000001111111111111111111111111111111111111111;
    memory[6] = 198'h0000000001111111111111111111111111111111111111111;
  end

  // Array of Processing Element=
  reg [197:0] pe_in1 [0:8];
  reg [197:0] pe_in2 [0:8];
  wire [197:0] pe_out1 [0:8];
  wire [197:0] pe_out2 [0:8];
  wire PE_is_using [0:8];
  wire PE_is_leaf [0:8];

  wire [197:0] Father;
  wire [2:0] child_1, child_2;
  reg counter;
  reg Check;
  assign Father = memory[0];

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;  // Reset to initial state
    end else begin
      if (counter == 2'd1) begin
        pe_in1[1] = memory[child_2];
        counter = counter - 1;
      end
      if ((PE_is_leaf[8] == 0)) begin
        pe_in1[1] = memory[child_1];
        counter = 1;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;  // Reset to initial state
      Check <= 0;
    end else begin
    //     for (i = 0; i < 8; i = i + 1) begin
    //             pe_in1[i] <= 0;
    //             pe_in2[i] <= 0;
    //             pe_out1[i] <= 0;
    //             pe_out2[i] <= 0;
    //   end
      case (state)
        S0: begin
          if (Check) state <= S1;
          pe_in1[0] = Father;
        end
        S1: begin
          state <= S2;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_0 - PE_1
          //PE_0 - PE_4
          //PE_1 - PE_4
          pe_in2[1] = pe_out1[0];
          pe_in1[4] = pe_out2[1];
          pe_in2[4] = pe_out2[0];
          //PE_2 - PE_3
          pe_in2[3] = pe_out1[2];
          //PE_6 - PE_8
          pe_in1[8] = pe_out2[6];
          //PE_7 - PE_8
          pe_in2[8] = pe_out1[7];
        end
        S2: begin
          if (!PE_is_using[2] || !PE_is_using[5] || !PE_is_using[4] || !PE_is_using[0]) state <= S1;
          else if (PE_is_using[2] && PE_is_using[5] && PE_is_using[4] && PE_is_using[0]) state <= S3;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_1 - PE_2
          pe_in2[2] = pe_out1[1];
          //PE_3 - PE_6
          pe_in1[6] = pe_out2[3];
          //PE_4 - PE_7
          pe_in2[7] = pe_out2[4];
          //PE_8 - PE_9
        //   pe_in1[9] <= pe_out2[8];
          pe_in1[0] = pe_out2[8];
        end
        S3: begin
          if(PE_is_leaf[8]) state <= S1;
          else state <= S4;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_0 - PE_1
          //PE_0 - PE_4
          //PE_1 - PE_4
          pe_in2[1] = pe_out1[0];
          pe_in1[4] = pe_out2[1];
          pe_in2[4] = pe_out2[0];
          //PE_2 - PE_3
          pe_in2[3] = pe_out1[2];
          //PE_6 - PE_8
          pe_in1[8] = pe_out2[6];
          //PE_7 - PE_9
        //   pe_in2[9] <= pe_out2[7];
          pe_in2[0] = pe_out2[7];
        end
        S4: begin
          state <= S5;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_0 - PE_4
          pe_in2[4] = pe_out2[0];
          //PE_1 - PE_2
          pe_in2[2] = pe_out1[1];
          //PE_3 - PE_6
          pe_in1[6] = pe_out2[3];
          //PE_4 - PE_7
          pe_in2[7] = pe_out2[4];
          //PE_8 - PE_9
        //   pe_in1[9] <= pe_out2[8];
          pe_in1[0] = pe_out2[8];
        end
        S5: begin
          state <= S6;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_0 - PE_1
          //PE_0 - PE_4
          //PE_1 - PE_4
          pe_in2[1] = pe_out1[0];
          pe_in1[4] = pe_out2[1];
          pe_in2[4] = pe_out2[0];
          //PE_2 - PE_3
          pe_in2[3] = pe_out1[2];
          //PE_6 - PE_8
          pe_in1[8] = pe_out2[6];
          //PE_7 - PE_9
        //   pe_in2[9] <= pe_out2[7];
          pe_in2[0] = pe_out2[7];
          //PE_4 - PE_5
          pe_in2[5] = pe_out1[4];
        end
        S6: begin
          state <= S1;
        //   if (PE_is_leaf[0] == 0) pe_in1[1] = matrix_child;
          //PE_1 - PE_2
          pe_in2[2] = pe_out1[1];
          //PE_3 - PE_6
          pe_in1[6] = pe_out2[3];
          //PE_4 - PE_7
          pe_in2[7] = pe_out2[4];
          //PE_8 - PE_9
        //   pe_in1[9] <= pe_out2[8];
          pe_in1[0] = pe_out2[8];
          //PE_5 - PE_6
          pe_in2[6] = pe_out1[5];
        end
        S7: begin
          state <= S0;
        end
        default: state <= S0;
      endcase
    end
  end
// assign pe_in1[0]  = 
// assign pe_in2[0]  =
// assign pe_out1[0] =
// assign pe_out2[0] =
// assign pe_in1[1] =
// assign pe_in2[1] =
// assign pe_out1[1] =
// assign pe_out2[1] =
// assign pe_in1[2] =
// assign pe_in2[2] =
// assign pe_out1[2] =
// assign pe_out2[2] =
// assign pe_in1[3] =
// assign pe_in2[3] =
// assign pe_out1[3] =
// assign pe_out2[3] =
// assign pe_in1[4] =
// assign pe_in2[4] =
// assign pe_out1[4] =
// assign pe_out2[4] =
// assign pe_in1[5] =
// assign pe_in2[5] =
// assign pe_out1[5] =
// assign pe_out2[5] =
// assign pe_in1[6] =
// assign pe_in2[6] =
// assign pe_out1[6] =
// assign pe_out2[6] =
// assign pe_in1[7] =
// assign pe_in2[7] =
// assign pe_out1[7] =
// assign pe_out2[7] =
// assign pe_in1[8] =
// assign pe_in2[8] =
// assign pe_out1[8] =
// assign pe_out2[8] =

PEran Block_0 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[0]),
    .in2(pe_in2[0]),
    .out1(pe_out1[0]),
    .out2(pe_out2[0]),
    .child_1(child_1),
    .child_2(child_2),
    .using(PE_is_using[0]),
    .leaf(PE_is_leaf[0])
);
PEran Block_1 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[1]),
    .in2(pe_in2[1]),
    .out1(pe_out1[1]),
    .out2(pe_out2[1]),
    .using(PE_is_using[1]),
    .leaf(PE_is_leaf[1])
);
PEran Block_2 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[2]),
    .in2(pe_in2[2]),
    .out1(pe_out1[2]),
    .out2(pe_out2[2]),
    .using(PE_is_using[2]),
    .leaf(PE_is_leaf[2])
);
PEran Block_3 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[3]),
    .in2(pe_in2[3]),
    .out1(pe_out1[3]),
    .out2(pe_out2[3]),
    .using(PE_is_using[3]),
    .leaf(PE_is_leaf[3])
);
PEran Block_4 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[4]),
    .in2(pe_in2[4]),
    .out1(pe_out1[4]),
    .out2(pe_out2[4]),
    .using(PE_is_using[4]),
    .leaf(PE_is_leaf[4])
);
PEran Block_5 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[5]),
    .in2(pe_in2[5]),
    .out1(pe_out1[5]),
    .out2(pe_out2[5]),
    .using(PE_is_using[5]),
    .leaf(PE_is_leaf[5])
);
PEran Block_6 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[6]),
    .in2(pe_in2[6]),
    .out1(pe_out1[6]),
    .out2(pe_out2[6]),
    .using(PE_is_using[6]),
    .leaf(PE_is_leaf[6])
);
PEran Block_7 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[7]),
    .in2(pe_in2[7]),
    .out1(pe_out1[7]),
    .out2(pe_out2[7]),
    .using(PE_is_using[7]),
    .leaf(PE_is_leaf[7])
);
PEran Block_8 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[8]),
    .in2(pe_in2[8]),
    .out1(pe_out1[8]),
    .out2(pe_out2[8]),
    .using(PE_is_using[8]),
    .leaf(PE_is_leaf[8])
);
// PEran Block_9 (
//     .clk(clk),
//     .reset(reset),
//     .seed_ID(seed_ID),
//     .in1(pe_in1[9]),
//     .in2(pe_in2[9]),
//     .out1(pe_out1[9]),
//     .out2(pe_out2[9]),
//     .using(PE_is_using[9]),
//     .leaf(PE_is_leaf[9])
// );

endmodule
