library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pos_0           : out    vl_logic_vector(2 downto 0);
        pos_1           : out    vl_logic_vector(2 downto 0);
        pos_2           : out    vl_logic_vector(2 downto 0);
        pos_3           : out    vl_logic_vector(2 downto 0);
        pos_4           : out    vl_logic_vector(2 downto 0);
        pos_5           : out    vl_logic_vector(2 downto 0);
        pos_6           : out    vl_logic_vector(2 downto 0);
        pos_7           : out    vl_logic_vector(2 downto 0);
        nucl_alig_0     : out    vl_logic_vector(31 downto 0);
        nucl_alig_1     : out    vl_logic_vector(31 downto 0);
        nucl_alig_2     : out    vl_logic_vector(31 downto 0);
        nucl_alig_3     : out    vl_logic_vector(31 downto 0);
        nucl_alig_4     : out    vl_logic_vector(31 downto 0);
        nucl_alig_5     : out    vl_logic_vector(31 downto 0);
        nucl_alig_6     : out    vl_logic_vector(31 downto 0);
        nucl_alig_7     : out    vl_logic_vector(31 downto 0);
        matrix_P_0      : out    vl_logic_vector(159 downto 0);
        matrix_P_1      : out    vl_logic_vector(159 downto 0);
        matrix_P_2      : out    vl_logic_vector(159 downto 0);
        matrix_P_3      : out    vl_logic_vector(159 downto 0);
        matrix_P_4      : out    vl_logic_vector(159 downto 0);
        matrix_P_5      : out    vl_logic_vector(159 downto 0);
        matrix_P_6      : out    vl_logic_vector(159 downto 0);
        matrix_P_7      : out    vl_logic_vector(159 downto 0)
    );
end Controller;
