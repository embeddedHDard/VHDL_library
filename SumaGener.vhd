-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- SumaGener.vhd
-- Sumador binario genérico de magnitudes N bits

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-------------------------------------------------

entity SumaGener is

	generic(N 	: positive := 3);	
	
	port(	a_i    	: in std_logic_vector(N-1 downto 0);
			b_i  		: in std_logic_vector(N-1 downto 0);
			ci_i		: in std_logic_vector(0 downto 0); -- acarreo de entrada
			co_o		: out std_logic;-- acarreo de salida
			y_o    	: out std_logic_vector(N-1 downto 0) );	
			
end entity SumaGener;
	
	-------------------------------------------------

architecture comportamiento of SumaGener is

signal auxSum : unsigned (N downto 0);

begin

	auxSum <= '0' & unsigned(a_i) + unsigned(b_i) + unsigned(ci_i);
	y_o 	 <= std_logic_vector (auxSum(N-1 downto 0));
	co_o 	 <= auxSum(N);
	

end architecture comportamiento;

----------------------------------------------------