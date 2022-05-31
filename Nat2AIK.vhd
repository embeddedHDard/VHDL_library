-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- Nat2AIK.vhd
-- BCD natural to AIKEN
-- Los primeros 5 numeros (del 0 al 4) de BCD son los mismos en AIKEN
-- Los 5 últimos números de AIKEN son BCD natural + 6 (Del 10 al 15)

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity Nat2AIK is
	port(
			n_i: in std_logic_vector(3 downto 0);			
			a_o: out std_logic_vector(3 downto 0)	);		
end entity Nat2AIK;
	
	-------------------------------------------------

architecture conver of Nat2AIK is

signal auxY: std_logic_vector(7 downto 0);

begin

	a_o <= n_i when unsigned(n_i) < 5 else 
						 std_logic_vector(unsigned(n_i) + 6);
	

end architecture conver;

----------------------------------------------------