-- 09/06/2020 ---------- Enrique Moreno Roldan ---------- Mux4_tb.vhd
-- Multiplexor 4 canales 2 de seleccion

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity Mux4_tb is	
end entity Mux4_tb;
	
-------------------------------------------------

architecture test of Mux4_tb is
  -------------------------------------------------
  component Mux4 is  
        port(  
			         i_i	: in std_logic_vector(3 downto 0);
		          	sel_i	: in std_logic_vector(1 downto 0);
		          	y_o	: out std_logic						);			
  end component Mux4;
	-------------------------------------------------
	signal i_t: std_logic_vector(3 downto 0) := "0000";
	signal sel_t: std_logic_vector(1 downto 0) := "00";
	signal y_t: std_logic;

begin
  
  dut: Mux4 port map(i_i => i_t, sel_i => sel_t, y_o => y_t);
    
Prueba_Mux4: 
  
  process begin
    
          report "Verificando el decodificador"
          severity note; 
          
     for j in 0 to 15 loop
        
          i_t <= std_logic_vector(to_unsigned(j,4));
          
          for i in 0 to 3 loop
            
            sel_t <= std_logic_vector(to_unsigned(i,2)); --Indice "i" indicado como entero y pasado a std_logic_vector
            wait for 1 ns;
            assert y_t=i_t(i) 
                  report "Falla para sel" & integer'image(i) & "e i= "  & integer'image(j)-- Los indices i y j no son ASCII,                                                                   
                  severity failure;         -- VHDL tiene un atributo que convierte el caracter 'i' en ascii llamado IMAGE
          end loop;                         -- construido como <tipo_de_dato'dato> y hay que concatenarlo con las cadenas de 
                                            -- caracteres que tiene a ambos lados
                                            
    end loop; 
                                                      
          report "Verificacion con exito"
          severity note;
          wait;
    
  end process Prueba_Mux4;
end architecture test;

----------------------------------------------------

