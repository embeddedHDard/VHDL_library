-- 28/05/2020 ---------- Enrique Moreno Roldán ---------- DecoN.vhd
-- Decodificador genérico de 8 bits con habilitacion activa en alto

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity DecoN is

	generic(N 	: positive := 3);	
	
	port(	a_i    : in std_logic_vector(N-1 downto 0);			
			ena_i	 : in std_logic; 								-- 1 o 0 segun queramos sumar o restar
			y_o  : out std_logic_vector(2**N-1 downto 0)
			);	
			
end entity DecoN;
	
	-------------------------------------------------	
	
architecture proceso of DecoN is


begin

process (a_i, ena_i) 
begin

		y_o 									  <= (others=>'0');

		y_o (to_integer(unsigned(a_i))) <= ena_i;

end process;


end architecture proceso;