library verilog;
use verilog.vl_types.all;
entity PE is
    generic(
        A               : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        C               : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        G               : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        T               : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        nucl_alig       : in     vl_logic_vector(31 downto 0);
        matrix_P        : in     vl_logic_vector(159 downto 0);
        selected_matrix_0: out    vl_logic_vector(39 downto 0);
        selected_matrix_1: out    vl_logic_vector(39 downto 0);
        selected_matrix_2: out    vl_logic_vector(39 downto 0);
        selected_matrix_3: out    vl_logic_vector(39 downto 0);
        selected_matrix_4: out    vl_logic_vector(39 downto 0);
        selected_matrix_5: out    vl_logic_vector(39 downto 0);
        selected_matrix_6: out    vl_logic_vector(39 downto 0);
        selected_matrix_7: out    vl_logic_vector(39 downto 0);
        selected_matrix_8: out    vl_logic_vector(39 downto 0);
        selected_matrix_9: out    vl_logic_vector(39 downto 0);
        selected_matrix_10: out    vl_logic_vector(39 downto 0);
        selected_matrix_11: out    vl_logic_vector(39 downto 0);
        selected_matrix_12: out    vl_logic_vector(39 downto 0);
        selected_matrix_13: out    vl_logic_vector(39 downto 0);
        selected_matrix_14: out    vl_logic_vector(39 downto 0);
        selected_matrix_15: out    vl_logic_vector(39 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of A : constant is 1;
    attribute mti_svvh_generic_type of C : constant is 1;
    attribute mti_svvh_generic_type of G : constant is 1;
    attribute mti_svvh_generic_type of T : constant is 1;
end PE;
