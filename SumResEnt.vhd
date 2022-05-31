-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- SumResEnt.vhd
-- Sumador y restador genérico de números enteros de N bits

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity SumResEnt is

	generic(N 	: positive := 3);	
	
	port(	a_i    : in std_logic_vector(N-1 downto 0);
			b_i  	 : in std_logic_vector(N-1 downto 0);
			mod_i	 : in std_logic; 								-- 1 o 0 segun queramos sumar o restar
			sal_o  : out std_logic_vector(N-1 downto 0);
			v_o    : out std_logic );	
			
end entity SumResEnt;
	
	-------------------------------------------------
	
	-- Modo 0 = suma, modo 1 = resta. Generamos overflow.

architecture arquit of SumResEnt is

signal aux: std_logic_vector(N-1 downto 0);

begin

aux <= std_logic_vector(signed(a_i) + signed(b_i)) when mod_i = '0' 
		 else 		
		 std_logic_vector(signed(a_i) - signed(b_i));
	
v_o <= (not aux(N-1) and a_i(N-1) and b_i(N-1)) or 
		 (aux(N-1) and not a_i(N-1) and not b_i(N-1)) when mod_i = '0' -- Cálculo overflow con los ultimos bits de cada operando
		  else
		 (not aux(N-1) and a_i(N-1) and not b_i(N-1)) or 
		 (aux(N-1) and not a_i(N-1) and b_i(N-1));

sal_o <= aux;
end architecture arquit;

----------------------------------------------------