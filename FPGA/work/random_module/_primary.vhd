library verilog;
use verilog.vl_types.all;
entity random_module is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seed            : in     vl_logic_vector(9 downto 0);
        reseed_en       : in     vl_logic;
        random_output   : out    vl_logic_vector(9 downto 0)
    );
end random_module;
