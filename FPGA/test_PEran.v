`timescale 1ps/1ps
module PEran_tb;

    reg clk;
    reg reset;
    reg [31:0] nucl_alig;
    reg [159:0] matrix_P;
    wire [31:0] final_result;

    PEran P(
        .clk(clk),
        .reset(reset),
        .nucl_alig(nucl_alig),
        .matrix_P(matrix_P),
        .final_result(final_result)
    );    

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
        // nucl_alig = 32'b10101010110100101011010101101000;
        // matrix_P = 160'hFA00000000003E80000000000FA00000000003E8;
        // #20
        // nucl_alig = 32'b00000000000000000000000000000000;
        // matrix_P = 160'hFA00000000003E80000000000FA00000000003E8;
        // #20
        // nucl_alig = 32'b11111111111111111111111111111111;
        // matrix_P = 160'hFA00000000003E80000000000FA00000000003E8;
        // #20
        nucl_alig = 32'b01010001011001010010110101010101;
        matrix_P = 160';
        #100
        $stop;
    end

    always @(posedge clk) begin
        $display("At time %t: %b", $time, final_result);
    end

endmodule