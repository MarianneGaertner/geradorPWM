library ieee;
use ieee.std_logic_1164.all;

entity tb_divisor_freq is
end tb_divisor_freq;


architecture behavior of tb_divisor_freq is

	component divisor_freq
		port(reset, clk_in: in std_logic;
			  div: in std_logic_vector(15 downto 0);
		     clk_out: out std_logic);
	end component;
	
	signal reset, clk_in: std_logic;
	signal div: std_logic_vector(15 downto 0);
	signal clk_out: std_logic;
	constant T : time := 20 ns;

begin

	L0: divisor_freq port map(reset, clk_in, div, clk_out);
	
	process
	begin
		clk_in <= '0';
		wait for T/2;
		clk_in <= '1';
		wait for T/2;
	end process;

	reset <= '0', '1' after T;
	
	--process
	--begin 
	--	reset <= '0';
	--	wait for 5*T;
	--	reset <= '1';
	--	wait;
	--end process;
	
	process
	begin
	--wait for 6*T;	
		
		div <= "0000000000000000";
		wait for 4*T;
		
		div <= "0000000000000001";
		wait for 8*T;
		
		div <= "0000000000000010";
		wait for 16*T;
		
		div <= "0000000000000011";
		wait for 32*T;
		
		div <= "0000000000000100";
		wait for 64*T;
		
		div <= "0000000000000101";
		wait for 128*T;
		
		div <= "0000000000000110";
		wait for 256*T;
		
		div <= "0000000000000111";
		wait for 512*T;
		
		
	assert false report "simulation completed" severity failure;
	
	
	end process;
	

end behavior;
