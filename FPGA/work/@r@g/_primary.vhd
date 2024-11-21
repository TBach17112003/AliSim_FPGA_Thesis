library verilog;
use verilog.vl_types.all;
entity RG is
    generic(
        A               : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        C               : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        G               : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        T               : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        prob_A          : in     vl_logic_vector(9 downto 0);
        prob_C          : in     vl_logic_vector(9 downto 0);
        prob_G          : in     vl_logic_vector(9 downto 0);
        prob_T          : in     vl_logic_vector(9 downto 0);
        result          : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of A : constant is 1;
    attribute mti_svvh_generic_type of C : constant is 1;
    attribute mti_svvh_generic_type of G : constant is 1;
    attribute mti_svvh_generic_type of T : constant is 1;
end RG;
