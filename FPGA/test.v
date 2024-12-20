`timescale 1ps/1ps
module test_neoRNG ();
    
reg clk, rst, enable_i, load;
reg [7:0] data_8;
wire valid_o;
wire [7:0] data_o;

NeoRNG DUT (
    .clk(clk),
    .rst(rst),
    .enable_i(enable_i),
    .load(load),
    .data_8(data_8),
    .valid_o(valid_o),
    .data_o(data_o)
);

initial begin
    clk = 0;
    forever begin
        #10
        clk = ~clk;
    end
end

initial begin
    rst = 1;
    enable_i = 0;
    #20
    rst = 0;
    enable_i = 1;
    // load = 1;
    // data_8 = 8'b11110000;
    // #20
    // load = 0;
end

initial begin
    #2500
    $stop();
end

always @(posedge clk) begin
    $display("valid_o: %b/t data_o: %b", valid_o, data_o);
end

endmodule
//-= test_R
    module test_RO ();
        
    reg clk;
    reg rst;
    reg enable_i;

    //-= output control
    wire enable_o;
    wire random_o;

    Ring_Oscillator_5 tes (
        .clk(clk),
        .rst(rst),
        .enable_i(enable_i),
        .enable_o(enable_o),
        .random_o(random_o)
    );

    initial begin
        clk = 0;
        forever begin
            #10
            clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        enable_i = 0;
        #20
        rst = 0;
        enable_i = 1;
        // #100
        // enable_i = 0;
    end

    initial begin
        #2500
        $stop();
    end

    endmodule