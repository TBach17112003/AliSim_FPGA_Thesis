library verilog;
use verilog.vl_types.all;
entity counter_7bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inc             : in     vl_logic;
        count           : out    vl_logic_vector(6 downto 0)
    );
end counter_7bit;
