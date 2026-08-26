library ieee;
use ieee.std_logic_1164.all;

entity tb_mux8_1 is
end tb_mux8_1;

architecture behavior of tb_mux8_1 is

	component mux8_1
		port(i0, i1, i2, i3, i4, i5, i6, i7: in std_logic;
			  sel: in std_logic_vector(15 downto 0);
		     y: out std_logic);
	end component;
	
	signal i0, i1, i2, i3, i4, i5, i6, i7: std_logic;
	signal sel: std_logic_vector(15 downto 0);
	signal y: std_logic;

begin

	L0: mux8_1 port map(i0, i1, i2, i3, i4, i5, i6, i7, sel, y);
	
	process
		constant periodo: time:=20 ns;
		
	begin
	
		i0 <= '1';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000000";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i0" severity error;
		
		i0 <= '0';
		i1 <= '1'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000001";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i1" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '1';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000010";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i2" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '1'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000011";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i3" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '1'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000100";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i4" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '1'; 
		i6 <= '0'; 
		i7 <= '0';
		sel <= "0000000000000101";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i5" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '1'; 
		i7 <= '0';
		sel <= "0000000000000110";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i6" severity error;
		
		i0 <= '0';
		i1 <= '0'; 
		i2 <= '0';
		i3 <= '0'; 
		i4 <= '0'; 
		i5 <= '0'; 
		i6 <= '0'; 
		i7 <= '1';
		sel <= "0000000000000111";
		wait for periodo;
		assert(y = '1') report "Resposta errada para i7" severity error;
		
		wait;

	end process;

end behavior;