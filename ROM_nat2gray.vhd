-- 28/05/2020 ---------- Enrique Moreno Roldán ---------- ROM_nat2gray.vhd
-- Conversor de binario natural a gray de 4 bits implementado con una rom

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity ROM_nat2gray is

	generic(DIREC 	: positive := 4; -- 4 lineas por direccion
			  BITS 	: positive := 4  -- 4 bits por palabra
			  );	
	
	port(	dir_i    : in std_logic_vector(DIREC-1 downto 0);
			ena_i	 : in std_logic; 								-- 1 o 0 segun queramos sumar o restar
			dat_o  : out std_logic_vector(BITS-1 downto 0)
			);	
			
end entity ROM_nat2gray;
	
	-------------------------------------------------
	
	-- Modo 0 = suma, modo 1 = resta. Generamos overflow.

architecture arquit of ROM_nat2gray is

type rom_16x4 is array (0 to 15) of std_logic_vector(3 downto 0);

signal ROM: rom_16x4 := ("0000", -- dir 0 contenido 0 Según tabla gray 4 bits
								 "0001", -- dir 1 contenido 1 Según tabla gray 4 bits
								 "0011", -- dir 2 contenido 3 Según tabla gray 4 bits
								 "0010", -- dir 3 contenido 2 Según tabla gray 4 bits
								 "0110", -- dir 4 contenido 6 Según tabla gray 4 bits
								 "0111", -- .....
								 "0101",
								 "0100",
								 "1100",
								 "1101",
								 "1111",
								 "1110",
								 "1010",
								 "1011",
								 "1001",
								 "1000");
								 
								 

begin

dat_o <= ROM(to_integer(unsigned(dir_i)))when ena_i ='1' else "ZZZZ";

end architecture arquit;