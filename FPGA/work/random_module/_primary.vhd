library verilog;
use verilog.vl_types.all;
entity random_module is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seed            : in     vl_logic_vector(10 downto 0);
        sum             : in     vl_logic_vector(11 downto 0);
        random_output   : out    vl_logic_vector(11 downto 0)
    );
end random_module;
