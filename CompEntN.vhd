-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- CompEntN.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity CompEntN is

	generic(N 	: positive := 4);	
	
	port(	a_i    : in std_logic_vector(N-1 downto 0);
			b_i  	 : in std_logic_vector(N-1 downto 0);
			may_o    : out std_logic;
			men_o		: out std_logic;
			igu_o    : out std_logic );	
			
end entity CompEntN;
	
	-------------------------------------------------

architecture arquit of CompEntN is

begin

 may_o <= '1' when signed (a_i) > signed (b_i) else '0';
 men_o <= '1' when signed (a_i) < signed (b_i) else '0';
 igu_o <= '1' when signed (a_i) = signed (b_i) else '0';
	

end architecture arquit;

----------------------------------------------------