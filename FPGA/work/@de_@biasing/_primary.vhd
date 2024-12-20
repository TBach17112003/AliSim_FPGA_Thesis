library verilog;
use verilog.vl_types.all;
entity De_Biasing is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable          : in     vl_logic;
        rnd             : in     vl_logic;
        valid           : out    vl_logic;
        data            : out    vl_logic
    );
end De_Biasing;
