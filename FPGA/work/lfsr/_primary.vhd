library verilog;
use verilog.vl_types.all;
entity lfsr is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seed            : in     vl_logic_vector(10 downto 0);
        rand_val        : out    vl_logic_vector(32 downto 0)
    );
end lfsr;
