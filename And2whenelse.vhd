-- 22/05/2020 ---------- Enrique Moreno Roldán ---------- And2whenelse.vhd
-- Compuerta and de 2 entradas seleccionadas con when else

library IEEE;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity And2whenelse is
	port(
			a_i: in std_logic;
			b_i: in std_logic;
			y_o: out std_logic	);		
end entity And2whenelse;
	
	-------------------------------------------------

architecture FlujodeDatos of And2whenelse is

	signal entradas: std_logic_vector (1 downto 0);

begin
	
	entradas <= b_i & a_i;
	
	with entradas select
	
	y_o <= '1' when "11",
			 --'0' when "01"|"10"|"00",
			 '0' when others;


end architecture FlujodeDatos;

----------------------------------------------------