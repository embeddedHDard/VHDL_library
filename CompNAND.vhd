-- 01/06/2020 ---------- Enrique Moreno Roldán ---------- CompNAND.vhd
-- Compuerta CompNAND genérica de N entradas

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity CompNAND is

	generic(N 	: positive := 4);	
	
	port(	entrada_i    : in std_logic_vector(N-1 downto 0);
			salida_o  : out std_logic );	
			
end entity CompNAND;
	
	-------------------------------------------------

architecture arquit of CompNAND is

begin

NORgenerica:
	process (entrada_i)
			variable aux : std_logic;
	begin
		aux := '0';
		
		for i in N-1 downto 0 loop		
				if entrada_i(i)='0' then
				
				aux:= '1';
				
				-- No se usa else para poder generar memoria
				
				end if;		
		end loop;
		salida_o <= aux;
	
	end process NORgenerica;

end architecture arquit;