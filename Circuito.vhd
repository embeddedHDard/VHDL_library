-- 01/06/2020 ---------- Enrique Moreno Roldán ---------- Circuito.vhd
-- Compuerta NOR genérica de N entradas

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library MiBiblioteca;
use MiBiblioteca.Componentes.all;

-------------------------------------------------

entity Circuito is
	
	port(	a_i, b_i, c_i, d_i   : in std_logic;
			u_o, v_o  				: out std_logic );	
			
end entity Circuito;
	
	-------------------------------------------------

architecture arquit of Circuito is

signal w: std_logic;

begin

u1: component CompNAND generic map(N => 2)
								port   map(entrada_i(1)=>b_i, entrada_i(0)=>a_i, salida_o => u_o);
u2: component CompNOR generic map(N => 2)
								port   map(entrada_i(1)=>b_i, entrada_i(0)=>b_i, salida_o => w);
u3: component CompNAND generic map(N => 3)
								port   map(entrada_i(2)=>w, entrada_i(1)=>c_i, entrada_i(0)=>d_i, salida_o => v_o);
								
end architecture arquit;