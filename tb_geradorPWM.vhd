library ieee;
use ieee.std_logic_1164.all;

entity tb_geradorPWM is
end tb_geradorPWM;

architecture behavior of tb_geradorPWM is

	constant T : time := 20 ns;
	constant N : integer := 8;

	component gerador_PWM
		generic(N : integer := 8);
		port(D: in std_logic_vector(N-1 downto 0);
			  max: in std_logic_vector(N-1 downto 0);
			  reset: in std_logic;
			  clk_in: in std_logic;
			  div: in std_logic_vector(15 downto 0);
			  y_pwm: out std_logic);
	end component;
	
	signal D, max: std_logic_vector(N-1 downto 0);
	signal reset, clk_in, y_pwm: std_logic;
	signal div: std_logic_vector(15 downto 0);

begin

	L0: gerador_PWM generic map(N) port map(D, max, reset, clk_in, div, y_pwm);
	
	process
	begin
		clk_in <= '0';
		wait for T/2;
		clk_in <= '1';
		wait for T/2;
	end process;
	
	reset <= '0', '1' after T;
	
	process
	begin
		
		D <= (others => '0');
		max <= "01100100";--100
		div <= "0000000000000000";
		wait for 4*T; 
						
		D <= "00000000";--0
		wait for 404*T;
		
		D <= "00011001";--25
		wait for 404*T;
		
		D <= "00110010";--50
		wait for 404*T;
		
		D <= "01011010";--90 
		wait for 404*T;
		
		D <= "01100100";--100
		wait for 404*T;
	
  
   assert false report "Simulation completed" severity failure;
	
	end process;
	

end behavior;