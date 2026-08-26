library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_7bits is
	port(reset, clk: in std_logic;
		  y: out std_logic_vector(6 downto 0));
end contador_7bits;

architecture behavior of contador_7bits is
	
	signal count: unsigned(6 downto 0);

begin
	y <= std_logic_vector(count);

	process(clk, reset)
		begin
			if(reset ='0') then
				count <= (others => '0');
			elsif(rising_edge(clk)) then
				count <= count + 1;
			end if;	
	end process;

	 

end behavior;