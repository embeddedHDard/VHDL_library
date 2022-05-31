-- 22/05/2020 ---------- Enrique Moreno Roldán ---------- And2puntero.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity And2puntero is
	port(
			a_i: in std_logic;
			b_i: in std_logic;
			y_o: out std_logic	);		
end entity And2puntero;
	
	-------------------------------------------------

architecture FlujodeDatos of And2puntero is

	signal entradas	: std_logic_vector (1 downto 0);
	constant COLUMNA  : std_logic_vector (0 to 3) := "0001"; -- Columna de la tabla de verdad de salida aunque se escriba como fila

begin

	entradas <= b_i & a_i;
	y_o		<= COLUMNA(to_integer(unsigned(entradas))); -- Pasamos el valor de entradas a y b concatenado a entero sin signo
																		  --  para elegir el subindice correspondiente del vector columna
end architecture FlujodeDatos;

----------------------------------------------------