-- 22/05/2020 ---------- Enrique Moreno Roldán ---------- Deco3a8.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Deco3a8 is
	port(
			a_i: in std_logic_vector(2 downto 0);
			ena_i: in std_logic;
			y_o: out std_logic_vector(7 downto 0)	);		
end entity Deco3a8;
	
	-------------------------------------------------

architecture Tabla of Deco3a8 is

signal auxY: std_logic_vector(7 downto 0);

begin

	with a_i select	
			
			auxY <= 	"00000001" when "000",
						"00000010" when "001",
						"00000100" when "010",
						"00001000" when "011",
						"00010000" when "100",			
						"00100000" when "101",
						"01000000" when "110",
						"10000000" when "111",
						"00000000" when others;
						
			y_o <= auxY when ena_i = '1' else (others => '0');
	

end architecture Tabla;

----------------------------------------------------