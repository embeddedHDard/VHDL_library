-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- MulGen.vhd
-- Multiplicador genérico de magnitudes N bits

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-------------------------------------------------

entity MulGen is

	generic(N 	: positive := 3);	
	
	port(	a_i    	: in std_logic_vector(N-1 downto 0);
			b_i  		: in std_logic_vector(N-1 downto 0);
			p_o    	: out std_logic_vector(2*N-1 downto 0) );	
			
end entity MulGen;
	
	-------------------------------------------------

architecture comportamiento of MulGen is

signal auxSum : unsigned (N downto 0);

begin

		p_o 	 <= std_logic_vector (signed(a_i)*signed(b_i));
		
end architecture comportamiento;

----------------------------------------------------