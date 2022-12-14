LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY counter_vhd_tst2 IS
END counter_vhd_tst2;

ARCHITECTURE counter_arch OF counter_vhd_tst2 IS


-- constants                                                 
-- signals                                                   
SIGNAL clk_50 :  std_logic;
SIGNAL in_freq : STD_LOGIC;
SIGNAL raz_n : STD_LOGIC :='0';
SIGNAL frq :  integer range 0 to 255;


COMPONENT counter2
	PORT (
	   clk_50 : in std_logic;
		in_freq : in std_logic;
		raz_n : in std_logic;
		frq : out integer range 0 to 255);
	
END COMPONENT;

constant frq_period: time := 20 ms; --100hz
constant clk_period: time := 20 ns;


BEGIN
	i1 : counter2
	PORT MAP (
-- list connections between master ports and signals
	clk_50 => clk_50,
	in_freq => in_freq,
	raz_n => raz_n,
	frq => frq
	);

clk_process : process 
		begin 
			clk_50 <= '0';
			wait for clk_period/2;
			clk_50 <= '1';
			wait for clk_period/2;
		end process;
		
frq_process : process
		begin 
			in_freq <= '0';
			wait for frq_period/2;
			in_freq <= '1';
			wait for frq_period/2;
		end process;
                    
                                         
END counter_arch;