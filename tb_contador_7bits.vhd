library ieee;
use ieee.std_logic_1164.all;

entity tb_contador_7bits is
end tb_contador_7bits;

architecture behavior of tb_contador_7bits is

	component contador_7bits
		port(reset, clk: in std_logic;
			  y: out std_logic_vector(6 downto 0));
	end component;
	
	signal reset, clk: std_logic;
	signal y: std_logic_vector(6 downto 0);
	constant T : time := 20 ns;
	
begin
	L0: contador_7bits port map(reset, clk, y);

	process
	begin
		clk <= '0';
		wait for T/2;
		clk <= '1';
		wait for T/2;
	end process;
	
	
	process
	begin
	
		reset <= '0';
      wait for T;
		
      reset <= '1';
		wait for 12*T;
		
		reset <= '0';
      wait for T;
		
      reset <= '1';
		wait for 10*T;
		
		assert false report "simulation completed" severity failure;
	end process;
	

end behavior;