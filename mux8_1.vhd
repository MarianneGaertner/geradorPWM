library ieee;
use ieee.std_logic_1164.all;

entity mux8_1 is
	port(i0, i1, i2, i3, i4, i5, i6, i7: in std_logic;
		  sel: in std_logic_vector(15 downto 0);
		  y: out std_logic);
end mux8_1;

architecture behavior of mux8_1 is

begin
	with sel select
		y <= i0 when "0000000000000000", 
			  i1 when "0000000000000001", 
			  i2 when "0000000000000010", 
			  i3 when "0000000000000011", 
			  i4 when "0000000000000100",
			  i5 when "0000000000000101", 
			  i6 when "0000000000000110",
			  i7 when others;

end behavior;