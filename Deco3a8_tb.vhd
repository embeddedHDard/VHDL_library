-- 09/06/2020 ---------- Enrique Moreno Roldan ---------- Deco3a8_tb.vhd
-- Decodificador 3 a 8

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity Deco3a8_tb is	
end entity Deco3a8_tb;
	
-------------------------------------------------

architecture test of Deco3a8_tb is
  -------------------------------------------------
  component Deco3a8 is  
        port(  a_i: in std_logic_vector(2 downto 0);
			         ena_i: in std_logic;
			         y_o: out std_logic_vector(7 downto 0)	);		
  end component Deco3a8;
	-------------------------------------------------
	signal a_t: std_logic_vector(2 downto 0) := "000";
	signal ena_t: std_logic := '1';
	signal y_t: std_logic_vector(7 downto 0);

begin
  
  dut: Deco3a8 port map(a_i => a_t, ena_i => ena_t, y_o => y_t);
    
Prueba_Deco3a8: 
  
  process begin
    
          report "Verificando el decodificador"
          severity note; 
          
          a_t <= "000";
          ena_t <= '0';
          
          wait for 1 ns;          
          assert y_t="00000000" report "Falla para a_i=000 y ena_i=0" severity failure;
          
          a_t <= "100";
          ena_t <= '1';
          
          wait for 1 ns;          
          assert y_t="00010000" report "Falla para a_i=100 y ena_i=1" severity failure;
          
          a_t <= "001";
          ena_t <= '1';
          
          wait for 1 ns;          
          assert y_t="00000010" report "Falla para a_i=001 y ena_i=1" severity failure;
          
          ena_t <= '1';
          
          for i in 0 to 7 loop
            
            a_t <= std_logic_vector(to_unsigned(i,3)); --Indice "i" indicado como entero y pasado a std_logic_vector
            wait for 1 ns;
            assert to_integer(unsigned(y_t))=2**i 
                  report "No activa la salida " & integer'image(i) & " con ena=1" -- El indice del bucle for 'i' no es ASCII,                                                                   
                  severity failure;         -- VHDL tiene un atributo que convierte el caracter 'i' en ascii llamado IMAGE
          end loop;                         -- construido como <tipo_de_dato'dato> y hay que concatenarlo con las cadenas de 
                                            -- caracteres que tiene a ambos lados
                                            
          ena_t <= '0';
          
          for i in 0 to 7 loop
            
            a_t <= std_logic_vector(to_unsigned(i,3)); --Indice "i" indicado como entero y pasado a std_logic_vector
            wait for 1 ns;
            assert to_integer(unsigned(y_t))=0 
                  report "No activa la salida " & integer'image(i) & " con ena=0"                                                                   
                  severity failure;        
          end loop;        
                                                      
          report "Verificacion con exito"
          severity note;
          wait;
    
  end process Prueba_Deco3a8;
end architecture test;

----------------------------------------------------
