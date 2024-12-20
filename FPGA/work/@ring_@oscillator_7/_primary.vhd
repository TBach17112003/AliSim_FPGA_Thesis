library verilog;
use verilog.vl_types.all;
entity Ring_Oscillator_7 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable_i        : in     vl_logic;
        enable_o        : out    vl_logic;
        random_o        : out    vl_logic
    );
end Ring_Oscillator_7;
