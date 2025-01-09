library verilog;
use verilog.vl_types.all;
entity Schedule is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seed_ID         : in     vl_logic_vector(7 downto 0);
        state           : out    vl_logic_vector(3 downto 0)
    );
end Schedule;
