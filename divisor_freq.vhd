library ieee;
use ieee.std_logic_1164.all;

entity divisor_freq is
	port(reset, clk_in: in std_logic;
		  div: in std_logic_vector(15 downto 0);
		  clk_out: out std_logic);
end divisor_freq;


architecture behavior of divisor_freq is

	--INSTANCIAR COMPONENTES
	component mux8_1
		port(i0, i1, i2, i3, i4, i5, i6, i7: in std_logic;
			  sel: in std_logic_vector(15 downto 0);
		     y: out std_logic);
	end component;
	
	component contador_7bits
		port(reset, clk: in std_logic;
			  y: out std_logic_vector(6 downto 0));
	end component;

	-- DECLARAR SINAIS
	signal y_count: std_logic_vector(6 downto 0);
		
begin

	L0: contador_7bits port map(reset, clk_in, y_count);
	L1: mux8_1 port map(clk_in, y_count(0), y_count(1), y_count(2), y_count(3), y_count(4), y_count(5), y_count(6), div, clk_out);

end behavior;