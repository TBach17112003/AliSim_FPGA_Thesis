library verilog;
use verilog.vl_types.all;
entity SRR is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable          : in     vl_logic;
        load            : in     vl_logic;
        data_1          : in     vl_logic;
        data_8          : in     vl_logic_vector(10 downto 0);
        data_o          : out    vl_logic_vector(10 downto 0)
    );
end SRR;
