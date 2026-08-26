library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparador is
	generic(N: integer:= 16);
	port(D: in std_logic_vector(N-1 downto 0);
		  y_contador: in std_logic_vector(N-1 downto 0);
		  y: out std_logic);
end comparador;


architecture behavior of comparador is
	--signal aux, s_D: unsigned(N-1 downto 0);
	
begin
	
	y <= '1' when (unsigned(y_contador) < unsigned(D)) else
		  '0';
	

end behavior;