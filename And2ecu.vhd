-- 22/05/2020 ---------- Enrique Moreno Roldán ---------- And2ecu.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity And2ecu is
	port(
			a_i: in std_logic;
			b_i: in std_logic;
			y_o: out std_logic	);		
end entity And2ecu;
	
	-------------------------------------------------

architecture FlujodeDatos of And2ecu is

begin

	y_o <= a_i and b_i;

end architecture FlujodeDatos;

----------------------------------------------------