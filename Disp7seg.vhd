library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library MiBiblioteca;
use MiBiblioteca.Componentes.all;

--------------------------------------------------------------

entity Disp7seg is
	
	port(	a_i, b_i	 : in std_logic_vector(3 downto 0);
			modo_i	 : in std_logic;
			noBCD_o   : out std_logic;
			display0_o: out std_logic_vector(6 downto 0);	
			display1_o: out std_logic_vector(6 downto 0);
			display2_o: out std_logic_vector(6 downto 0);
			display3_o: out std_logic_vector(6 downto 0)	);	
			
end entity Disp7seg;
	
	-------------------------------------------------
	
	-- Los segmentos del display se activan en bajo, el LED en alto
	
architecture arquit of Disp7seg is

signal mayor		: std_logic;
signal menor		: std_logic;
signal co			: std_logic;
signal suma			: std_logic_vector(3 downto 0);
signal sumaBCD		: std_logic_vector(3 downto 0);
signal salcomp		: std_logic_vector(3 downto 0);
signal auxBCD		: std_logic;


begin

u1: component CompMagN   	generic map (N => 4)
									port map (a_i => a_i, b_i => b_i, may_o => mayor, men_o => menor); --no mapeo igu

u2: component SumaGener   	generic map (N => 4)
									port map (a_i => a_i, b_i => b_i, ci_i => "0", co_o => co, y_o => suma); 
									
u3: component Display7segP	generic map(N 	=> 4,  M => 7)
									port map (a_i => a_i, b_i => b_i, c_i => salcomp, d_i => sumaBCD, 
									display0_o => display0_o,display1_o => display1_o,display2_o => display2_o,
									display3_o => display3_o);
									
	salcomp <= a_i when mayor='1' and modo_i='1' else
				  b_i when menor='1' and modo_i='1' else
				  "1010";
				  
	auxBCD  <= '1' when suma > "1001" else '0';
	
	sumaBCD <= suma when auxBCD='0' and modo_i='0' else
				std_logic_vector(unsigned (suma)-10) when auxBCD='1' and co='0' and modo_i='0' else
				"1010";
	
	nobCD_o <= auxBCD;
	
								
end architecture arquit;