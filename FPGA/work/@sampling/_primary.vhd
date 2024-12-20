library verilog;
use verilog.vl_types.all;
entity Sampling is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        enable          : in     vl_logic;
        valid           : in     vl_logic;
        data            : in     vl_logic;
        data_8          : in     vl_logic_vector(7 downto 0);
        valid_o         : out    vl_logic;
        data_o          : out    vl_logic_vector(7 downto 0)
    );
end Sampling;
