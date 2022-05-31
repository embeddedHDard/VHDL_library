-- 26/05/2020 ---------- Enrique Moreno Roldán ---------- BintoGray.vhd
-- Cóodigo Gray a Binario natural 

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity BintoGray is 

	generic(N 	: integer := 4);	
	
	port(	g_i    : in std_logic_vector(N-1 downto 0);
			b_o  	 : out std_logic_vector(N-1 downto 0)
			);	
			
end entity BintoGray;
	
	-------------------------------------------------

architecture arquit of BintoGray is

		signal baux : std_logic_vector(N-1 downto 0);

begin

		baux(N-1) 				<= g_i(N-1);
		baux(N-2 downto 0)   <= baux(N-1 downto 1) xor g_i(N-2 downto 0); 

		b_o <= baux;

end architecture arquit;

----------------------------------------------------