-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- MuxN.vhd
-- Multiplexor generico con habilitacion

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity MuxN is

	generic(N 	: positive := 2);	
	
	port(	i_i    	: in std_logic_vector(2**N-1 downto 0);
			sel_i  	: in std_logic_vector(N-1 downto 0);
			ena_i    : in std_logic;
			y_o		: out std_logic			
			);	
			
end entity MuxN;
	
	-------------------------------------------------

architecture arquit of MuxN is

begin

		y_o <= i_i(to_integer(unsigned(sel_i))) and ena_i;
	

end architecture arquit;

----------------------------------------------------