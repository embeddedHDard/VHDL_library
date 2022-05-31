-- 22/05/2020 ---------- Enrique Moreno Roldán ---------- Cod4a2.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Cod4a2 is
	port(
			i_i	: in std_logic_vector(3 downto 0);
			y_o	: out std_logic_vector(1 downto 0)	;
			g_o	: out std_logic --Señal de grupo que indica que al menos hay una entrada activa
			
			);		
end entity Cod4a2;
	
	-------------------------------------------------

	-- La entrada 3 es la de mayor prioridad
	-- G=1 hay al menos una entrada activa
	
	
architecture Tabla of Cod4a2 is



begin

		y_o <= 	"11" when i_i(3) = '1' else -- La ponemos primera por tema prioridad, adecuada para prioridad
					"10" when i_i(2) = '1' else
					"01" when i_i(1) = '1' else
					"00";
					
		g_o <= i_i(3) or i_i(2) or i_i(1) or i_i(0);

end architecture Tabla;

----------------------------------------------------