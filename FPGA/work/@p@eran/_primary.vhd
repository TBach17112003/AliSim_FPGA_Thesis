library verilog;
use verilog.vl_types.all;
entity PEran is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seed_ID         : in     vl_logic_vector(7 downto 0);
        in1             : in     vl_logic_vector(221 downto 0);
        in2             : in     vl_logic_vector(221 downto 0);
        out1            : out    vl_logic_vector(221 downto 0);
        out2            : out    vl_logic_vector(221 downto 0);
        result          : out    vl_logic_vector(41 downto 0);
        child_1         : out    vl_logic_vector(9 downto 0);
        child_2         : out    vl_logic_vector(9 downto 0);
        using           : out    vl_logic;
        leaf            : out    vl_logic
    );
end PEran;
