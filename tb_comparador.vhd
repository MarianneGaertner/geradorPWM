library ieee;
use ieee.std_logic_1164.all;

entity tb_comparador is
end tb_comparador;

architecture behavior of tb_comparador is

	component comparador
		generic(N: integer:= 8);
		port(D: in std_logic_vector(N-1 downto 0);
			  y_contador: in std_logic_vector(N-1 downto 0);
		     y: out std_logic);
	end component;
	
	constant T : time := 20 ns;
	constant N : integer := 8;
	signal D, y_contador: std_logic_vector(N-1 downto 0);
	signal y_pwm: std_logic;
	

begin

	L0: comparador generic map(N) port map(D, y_contador, y_pwm);
	
	process
	begin
	
		D <= "00000101";--5(dec)
		y_contador <= "00000000"; --0
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000000!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000001"; --1
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000001!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000010";--2
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000010!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000011"; --3
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000011!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000100"; --4
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000100!" severity error;

		D <= "00000101";--5(dec)
		y_contador <= "00000101";
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00000101!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000110"; --6
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00000110!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000111"; --7
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00000111!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00001000"; --8
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00001000!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00001001"; --9
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00001001!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00001010"; --10
		wait for T;
		assert (y_pwm = '0') report "Resposta errada para a entrada 00001010!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000000"; --0
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000000!" severity error;
		
		D <= "00000101";--5(dec)
		y_contador <= "00000001"; --1
		wait for T;
		assert (y_pwm = '1') report "Resposta errada para a entrada 00000001!" severity error;
		
		wait;
		
		end process;


end behavior;
