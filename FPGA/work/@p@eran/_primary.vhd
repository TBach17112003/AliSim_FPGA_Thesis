library verilog;
use verilog.vl_types.all;
entity PEran is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        nucl_alig       : in     vl_logic_vector(31 downto 0);
        matrix_P        : in     vl_logic_vector(159 downto 0);
        final_result    : out    vl_logic_vector(31 downto 0)
    );
end PEran;
