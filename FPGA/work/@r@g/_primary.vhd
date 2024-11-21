library verilog;
use verilog.vl_types.all;
entity RG is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        prob_A          : in     vl_logic_vector(9 downto 0);
        prob_C          : in     vl_logic_vector(9 downto 0);
        prob_G          : in     vl_logic_vector(9 downto 0);
        prob_T          : in     vl_logic_vector(9 downto 0);
        result          : out    vl_logic_vector(1 downto 0)
    );
end RG;
