library ieee;
use ieee.std_logic_1164.all;

entity tb_contador_Nbits is
end tb_contador_Nbits;

architecture behavior of tb_contador_Nbits is

	component contador_Nbits
		generic(N: integer:= 8);
		port(clk, reset: in std_logic;
		     max: in std_logic_vector(N-1 downto 0);
		     y: out std_logic_vector(N-1 downto 0));
	end component;
	
	
	constant T : time := 20 ns;
	constant N : integer := 8;

	signal clk, reset: std_logic;
	signal ycontador: std_logic_vector(N-1 downto 0);
	constant max: std_logic_vector(N-1 downto 0) := "00001010"; --10(dec)
	
begin

	L0: contador_Nbits generic map(N) port map(clk, reset, max, ycontador);
	
	
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
		wait for 2*T;
		
		reset <= '1';
		wait for 12*T;
		
		assert false report "simulation completed" severity failure;
	end process;
	
	

end behavior;