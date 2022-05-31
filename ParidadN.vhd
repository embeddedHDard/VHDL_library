-- 28/05/2020 ---------- Enrique Moreno Roldán ---------- ParidadN.vhd
-- cálculo paridad de un número como XOR de los bits de la entrada

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity ParidadN is

	generic(N 	: positive := 3);	
	
	port(	a_i    : in std_logic_vector(N-1 downto 0);
			pp_o    : out std_logic;
			pi_o    : out std_logic );	
			
end entity ParidadN;
	
	-------------------------------------------------
	

architecture arquit of ParidadN is


begin

Arbol: process (a_i) is

variable aux: std_logic; -- Solo tienen vida dentro de los procesos, 


begin

		aux:=a_i(0);

		for i in 1 to N-1 loop --en vhdl no hace falta declarar el indice
		
		aux:=aux xor a_i(i);
		
		end loop;

		pp_o <= not aux;
		pi_o <= aux;

end process Arbol;


end architecture arquit;