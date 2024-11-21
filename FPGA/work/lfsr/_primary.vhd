library verilog;
use verilog.vl_types.all;
entity lfsr is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rand_val        : out    vl_logic_vector(9 downto 0)
    );
end lfsr;
