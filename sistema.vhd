library ieee;
use ieee.std_logic_1164.all;

entity sistema is
	port(KEY: in std_logic_vector(3 downto 0);
			CLOCK_50: in std_logic;
			LEDG: out std_logic_vector(8 downto 0);
			GPIO: out std_logic_vector(35 downto 0));
end sistema;

architecture behavior of sistema is

	component microcontrolador 
		port (
			clk_clk                                    : in  std_logic                    := '0'; --                                 clk.clk
			pinos_saida_div_external_connection_export : out std_logic_vector(15 downto 0);        -- pinos_saida_div_external_connection.export
			pinos_saida_max_external_connection_export : out std_logic_vector(15 downto 0);        -- pinos_saida_max_external_connection.export
			pinos_saidad_external_connection_export    : out std_logic_vector(15 downto 0);        --    pinos_saidad_external_connection.export
			reset_reset_n                                : in  std_logic                     := '0'  --                               reset.reset_n
			);
	end component;
	
	component gerador_PWM
		generic(N : integer := 16);
		port(D: in std_logic_vector(N-1 downto 0);
			  max: in std_logic_vector(N-1 downto 0);
			  reset: in std_logic;
			  clk_in: in std_logic;
			  div: in std_logic_vector(15 downto 0);
			  y_pwm: out std_logic);
	end component;
	
	constant N: integer := 16;
	signal d, max: std_logic_vector(N-1 downto 0);
	signal div: std_logic_vector(15 downto 0);
	signal y_pwm: std_logic;

begin

	L0: microcontrolador port map(CLOCK_50, div, max, d, KEY(0));
	L1: gerador_PWM generic map(N) port map(d, max, KEY(0), CLOCK_50, div, y_pwm);
	
	LEDG(0) <= y_pwm;
	GPIO(0) <= y_pwm;

end behavior;
