library ieee;
use ieee.std_logic_1164.all;

entity gerador_PWM is
	generic(N : integer := 8);
	port(D: in std_logic_vector(N-1 downto 0);
		  max: in std_logic_vector(N-1 downto 0);
		  reset: in std_logic;
		  clk_in: in std_logic;
		  div: in std_logic_vector(15 downto 0);
		  y_pwm: out std_logic);
end gerador_PWM;

architecture behavior of gerador_PWM is

	component divisor_freq
		port(reset, clk_in: in std_logic;
			  div: in std_logic_vector(15 downto 0);
		     clk_out: out std_logic);
	end component;
	
	
	component contador_Nbits
		generic(N: integer:= 8);
		port(clk, reset: in std_logic;
			  max: in std_logic_vector(N-1 downto 0);
		     y: out std_logic_vector(N-1 downto 0));
	end component;
	
	component comparador
		generic(N: integer:= 8);
		port(D: in std_logic_vector(N-1 downto 0);
		     y_contador: in std_logic_vector(N-1 downto 0);
		     y: out std_logic);
	end component;
	
	signal clk_out: std_logic;
	signal ycontador: std_logic_vector(N-1 downto 0);

begin
	L0: divisor_freq port map(reset, clk_in, div, clk_out);
	L1: contador_Nbits generic map(N) port map(clk_out, reset, max, ycontador);
	L2: comparador generic map(N) port map(D, ycontador, y_pwm);
	
end behavior;
