library verilog;
use verilog.vl_types.all;
entity RO is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable_i        : in     vl_logic;
        enable_o        : out    vl_logic;
        rnd             : out    vl_logic
    );
end RO;
