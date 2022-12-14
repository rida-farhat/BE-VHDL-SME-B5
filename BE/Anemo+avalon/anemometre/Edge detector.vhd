Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity edge_detector is
	port(
		clk, f_in : in std_logic;
		edge : out std_logic);
end edge_detector;

architecture arc of edge_detector is
	signal etat : std_logic_vector (1 downto 0) := "00";
begin 
	process(clk) is
	begin	
		if rising_edge(clk) then
			if etat = "00" then
				if f_in = '1' then
					etat <= "11";
					edge <= '1';
				end if;
			end if;
			if etat = "11" then
				etat <= "10";
				edge <= '0';
			end if;
			if etat = "10" then
				if f_in = '0' then
					etat <= "00";
					edge <= '0';
				end if;
			end if;
		end if;
	end process;

end arc;
