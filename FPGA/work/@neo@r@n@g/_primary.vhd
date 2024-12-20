library verilog;
use verilog.vl_types.all;
entity NeoRNG is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable_i        : in     vl_logic;
        load            : in     vl_logic;
        data_8          : in     vl_logic_vector(7 downto 0);
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0)
    );
end NeoRNG;
