module Schedule (
  input wire clk,
  input wire reset,
  input wire [7:0] seed_ID,
  output reg [3:0] state
);


  // State encoding
  localparam S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011,
             S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111;

  reg [221:0] memory [0:1024];
  initial begin
    $readmemb("tree_convert.txt", memory);
    // memory[0] = 201'h0048D159E0C0000000000000000000000000000000000000000;
    // memory[1] = 201'h040000000131111111111111111111111111111111111111111;
    // memory[2] = 201'h080000000072222222222222222222222222222222222222222;
    // memory[3] = 201'h0C0000000003333333333333333333333333333333333333333;
    // memory[4] = 201'h1000000002E4444444444444444444444444444444444444444;
    // memory[5] = 201'h140000000005555555555555555555555555555555555555555;
    // memory[6] = 201'h180000000006666666666666666666666666666666666666666;
    // memory[7] = 201'h1C0000000007777777777777777777777777777777777777777;
  end
  

  reg [41:0] result [0:31];
  reg [221:0] pe_in1 [0:8];
  reg [221:0] pe_in2 [0:8];
  wire [221:0] pe_out1 [0:8];
  wire [221:0] pe_out2 [0:8];
  reg [4:0]address_store;
  reg [221:0] pe_5 [0:8];
  wire PE_is_using [0:8];
  wire PE_is_leaf [0:8];

  wire [221:0] child_11, child_22;
  wire [221:0] Father;
  wire [9:0] child_1, child_2;
  reg counter;
  reg Check;
  reg [1:0] counter_state;
  assign Father = memory[0];
  assign child_11 = memory[child_1];
  assign child_22 = memory[child_2];
  wire test;
  assign test = !PE_is_leaf[1] && !PE_is_leaf[4] && !PE_is_leaf[3] && !PE_is_leaf[8];
  //Khối dùng để nạp cây vào
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      counter <= 1;
    end else begin
      if (((PE_is_leaf[8] == 0) || (pe_out1[8] == 0)) && (counter == 0) && (child_1 != 0) && (counter_state == 2)) begin
        pe_in1[1] <= memory[child_1];
        counter <= 1;
        // Check = 0;
      end
      else if (counter == 2'd1 && (child_2 != 0) && (counter_state == 2)) begin
        pe_in1[1] <= memory[child_2];
        counter <= counter - 1;
      end
      else if (counter_state == 2) pe_in1[1] <= 0;
    end
  end

  //Khối dùng để đổi trạng thái
  integer i;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;  // Reset to initial state
      for (i = 0; i < 9; i = i + 1) begin
                pe_in1[i] <= 0;
                pe_in2[i] <= 0;
                pe_5[i] <= 0;
      end
      counter_state <= 2;
      Check <= 1;
      address_store <= 0;
    end else begin
      if (counter_state == 2) begin
        counter_state <= 0;
        case (state)
          S0: begin
            if (Check) state <= S1;
            if (pe_in1[8] == 0) begin
              pe_in1[8] <= Father;
              // pe_in1[0] <= Father;
            end
          end
          S1: begin
            if (Check) state <= S2;
            pe_in1[0] <= pe_out2[8];
            pe_in1[8] <= 0;
          end
          S2: begin
            state <= S3;
          //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
            //PE_0 - PE_1
            //PE_0 - PE_4
            //PE_1 - PE_4
            pe_in2[1] <= pe_out1[0];
            pe_in1[4] <= pe_out2[1];
            pe_in2[4] <= pe_out2[0];
            //PE_2 - PE_3
            pe_in2[3] <= pe_out1[2];
            //PE_6 - PE_8
            pe_in1[8] <= pe_out2[6];
            //PE_7 - PE_8
            pe_in2[8] <= pe_out1[7];
            //xóa giá trị trước đó
            pe_in1[0] <= 0;
            // if (counter == 0) pe_in1[1] <= 0;
            // pe_in1[2] <= 0;
            // pe_in1[3] <= 0;
            // pe_in1[4] <= 0;
            pe_in1[5] <= 0;
            pe_in1[6] <= 0;
            pe_in1[7] <= 0;
            // pe_in1[8] <= 0;
            //
            pe_in2[0] <= 0;
            // pe_in2[1] <= 0;
            pe_in2[2] <= 0;
            // pe_in2[3] <= 0;
            // pe_in2[4] <= 0;
            pe_in2[5] <= 0;
            pe_in2[6] <= 0;
            pe_in2[7] <= 0;
            // pe_in2[8] <= 0;
          end
          S3: begin
            // if (!(PE_is_leaf[1] && PE_is_leaf[4] && PE_is_leaf[3] && PE_is_leaf[8]))
            //   state <= S2;
            if (!PE_is_leaf[4] && !PE_is_leaf[3])
              state <= S4;
            else 
              state <= S2;
            Check <= 0;
          //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
            //PE_1 - PE_2
            pe_in2[2] <= pe_out1[1];
            //PE_3 - PE_6
            pe_in1[6] <= pe_out2[3];
            //PE_4 - PE_7
            pe_in2[7] <= pe_out2[4];
            //PE_8 - PE_9
          //   pe_in1[9] <= pe_out2[8];
            pe_in1[0] <= pe_out2[8];
            //xóa giá trị trước đó
            // pe_in1[0] <= 0;
            // if (counter == 1) pe_in1[1] <= 0;
            // pe_in1[2] <= 0;
            // pe_in1[3] <= 0;
            pe_in1[4] <= 0;
            pe_in1[5] <= 0;
            // pe_in1[6] <= 0;
            pe_in1[7] <= 0;
            pe_in1[8] <= 0;
            //
            pe_in2[0] <= 0;
            pe_in2[1] <= 0;
            // pe_in2[2] <= 0;
            pe_in2[3] <= 0;
            pe_in2[4] <= 0;
            pe_in2[5] <= 0;
            pe_in2[6] <= 0;
            // pe_in2[7] <= 0;
            pe_in2[8] <= 0;
            //Load value
            if ((PE_is_leaf[3] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in2[6] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
            else if((PE_is_leaf[4] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in1[7] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
            else if((PE_is_leaf[1] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in2[2] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
          end
          S4: begin
            if(PE_is_leaf[7]) state <= S3;
            else state <= S5;
          //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
            //PE_0 - PE_1
            //PE_0 - PE_4
            //PE_1 - PE_4
            pe_in2[1] <= pe_out1[0];
            pe_in1[4] <= pe_out2[1];
            pe_in2[4] <= pe_out2[0];
            //PE_2 - PE_3
            pe_in2[3] <= pe_out1[2];
            //PE_6 - PE_8
            pe_in1[8] <= pe_out2[6];
            //PE_7 - PE_9
          //   pe_in2[9] <= pe_out2[7];
            pe_in2[0] <= pe_out2[7];
            //xóa giá trị trước đó
            pe_in1[0] <= 0;
            // if (counter == 0) pe_in1[1] <= 0;
            // pe_in1[2] <= 0;
            // pe_in1[3] <= 0;
            // pe_in1[4] <= 0;
            pe_in1[5] <= 0;
            pe_in1[6] <= 0;
            pe_in1[7] <= 0;
            // pe_in1[8] <= 0;
            //
            // pe_in2[0] <= 0;
            // pe_in2[1] <= 0;
            pe_in2[2] <= 0;
            // pe_in2[3] <= 0;
            // pe_in2[4] <= 0;
            pe_in2[5] <= 0;
            pe_in2[6] <= 0;
            pe_in2[7] <= 0;
            pe_in2[8] <= 0;
          end
          S5: begin
            state <= S6;
          //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
            //PE_0 - PE_4
            pe_in2[4] <= pe_out2[0];
            //PE_1 - PE_2
            pe_in2[2] <= pe_out1[1];
            //PE_3 - PE_6
            pe_in1[6] <= pe_out2[3];
            //PE_4 - PE_7
            pe_in2[7] <= pe_out2[4];
            //PE_8 - PE_9
          //   pe_in1[9] <= pe_out2[8];
            pe_in1[0] <= pe_out2[8];
            //xóa giá trị trước đó
            // pe_in1[0] <= 0;
            // if (counter == 0) pe_in1[1] <= 0;
            // pe_in1[2] <= 0;
            // pe_in1[3] <= 0;
            pe_in1[4] <= 0;
            pe_in1[5] <= 0;
            // pe_in1[6] <= 0;
            pe_in1[7] <= 0;
            pe_in1[8] <= 0;
            //
            pe_in2[0] <= 0;
            pe_in2[1] <= 0;
            // pe_in2[2] <= 0;
            pe_in2[3] <= 0;
            // pe_in2[4] <= 0;
            pe_in2[5] <= 0;
            pe_in2[6] <= 0;
            // pe_in2[7] <= 0;
            pe_in2[8] <= 0;
            //Load value
            if ((PE_is_leaf[3] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in2[6] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
            else if((PE_is_leaf[4] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in1[7] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
            else if((PE_is_leaf[1] == 1) && (pe_5[0] != 0)) begin
              address_store <= address_store - 1;
              pe_in2[2] <= pe_5[address_store];
              pe_5[address_store] <= 0;
            end
          end
          S6: begin
            state <= S3;
          //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
            //PE_0 - PE_1
            //PE_0 - PE_4
            //PE_1 - PE_4
            pe_in2[1] <= pe_out1[0];
            pe_in1[4] <= pe_out2[1];
            pe_in2[4] <= pe_out2[0];
            //PE_2 - PE_3
            pe_in2[3] <= pe_out1[2];
            //PE_6 - PE_8
            pe_in1[8] <= pe_out2[6];
            //PE_7 - PE_8
            pe_in2[8] <= pe_out1[7];
            //PE_4 - PE_5
            pe_in2[5] = pe_out1[4];
            pe_5[address_store] <= pe_out1[4];
            address_store = address_store + 1;
            //xóa giá trị trước đó
            pe_in1[0] <= 0;
            // if (counter == 0) pe_in1[1] <= 0;
            // pe_in1[2] <= 0;
            // pe_in1[3] <= 0;
            // pe_in1[4] <= 0;
            pe_in1[5] <= 0;
            pe_in1[6] <= 0;
            pe_in1[7] <= 0;
            // pe_in1[8] <= 0;
            //
            // pe_in2[0] <= 0;
            // pe_in2[1] <= 0;
            pe_in2[2] <= 0;
            // pe_in2[3] <= 0;
            // pe_in2[4] <= 0;
            // pe_in2[5] <= 0;
            pe_in2[6] <= 0;
            pe_in2[7] <= 0;
          end
          // S7: begin
          //   state <= S2;
          // //   if (PE_is_leaf[0] == 0) pe_in1[1] <= matrix_child;
          //   //PE_1 - PE_2
          //   pe_in2[2] <= pe_out1[1];
          //   //PE_3 - PE_6
          //   pe_in1[6] <= pe_out2[3];
          //   //PE_4 - PE_7
          //   pe_in2[7] <= pe_out2[4];
          //   //PE_8 - PE_9
          // //   pe_in1[9] <= pe_out2[8];
          //   pe_in1[0] <= pe_out2[8];
          //   //PE_5 - PE_6
          //   ///////////////////////////////////////////////////
          //   pe_in2[6] <= pe_out1[5];
          //   //////////////////////////////////
          //   //xóa giá trị trước đó
          //   // pe_in1[0] <= 0;
          //   // if (counter == 0) pe_in1[1] <= 0;
          //   // pe_in1[2] <= 0;
          //   // pe_in1[3] <= 0;
          //   pe_in1[4] <= 0;
          //   pe_in1[5] <= 0;
          //   // pe_in1[6] <= 0;
          //   pe_in1[7] <= 0;
          //   pe_in1[8] <= 0;
          //   //
          //   pe_in2[0] <= 0;
          //   pe_in2[1] <= 0;
          //   // pe_in2[2] <= 0;
          //   pe_in2[3] <= 0;
          //   pe_in2[4] <= 0;
          //   pe_in2[5] <= 0;
          //   // pe_in2[6] <= 0;
          //   // pe_in2[7] <= 0;
          //   pe_in2[8] <= 0;
          // end
          default: state <= S0;
        endcase
      end
      else counter_state <= counter_state - 1;
    end
  end

//Khối dùng để lưu các lá
wire [41:0] result_2, result_5, result_7;
reg [4:0] counter_result;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 32; i = i + 1) begin
                result[i] <= 0;
      end
      counter_result <= 0;
      // result_2 <= 0;
      // result_5 <= 0;
      // result_7 <= 0;
    end else begin
        if (counter_state == 2) begin
            if (result_2 != 32'b0) begin
                result[result_2[41:32]] <= result_2;  
                counter_result = counter_result + 1;
            end 
            if (result_5 != 32'b0) begin
                result[result_5[41:32]] <= result_5;  
                counter_result = counter_result + 1;
            end 
            if (result_7 != 32'b0) begin
                result[result_7[41:32]] <= result_7;  
                counter_result = counter_result + 1;
            end
        end
    end
end
PEran Block_0 (
    .clk(clk),
    .reset(reset),
    .seed_ID(seed_ID),
    .in1(pe_in1[0]),
    .in2(pe_in2[0]),
    .out1(pe_out1[0]),
    .out2(pe_out2[0]),
    .child_1(child_1),
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
    .result(result_2),
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
    .result(result_5),
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
    .result(result_7),
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
    // .child_1(child_1),
    .child_2(child_2),
    .using(PE_is_using[8]),
    .leaf(PE_is_leaf[8])
);

endmodule
