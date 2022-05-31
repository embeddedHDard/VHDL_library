-- 15/06/2020 ---------- Enrique Moreno Roldan ---------- BintoGray_tb.vhd
-- Pasando de Gray a Binario

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity BintoGray_tb is	
end entity BintoGray_tb;
	
-------------------------------------------------

architecture test of BintoGray_tb is
  -------------------------------------------------
  component BintoGray is
    
  generic (N 	: positive := 4);
	port(	 g_i    : in std_logic_vector(N-1 downto 0);
			   b_o  	 : out std_logic_vector(N-1 downto 0)
			);	
  end component BintoGray; 
	-------------------------------------------------
	signal g_t: std_logic_vector(3 downto 0):= "0000";
	signal b_t: std_logic_vector(3 downto 0);	
	type tabla1 is array (0 to 15) of std_logic_vector(3 downto 0);	
	
	constant tabla_gray  : tabla1 := ("0000","0001","0011","0010",
	                                  "0110","0111","0101","0100",
	                                  "1100","1101","1111","1110",
	                                  "1010","1011","1001","1000");
	
begin
  
  dut: BintoGray generic map (N => 4)
                 port map(g_i => g_t, b_o => b_t);
    
Prueba_BintoGray: 
  
  process begin
    
        report "Probando el conversor de gray a binario"
        severity note; 
          
        for i in tabla1'range loop -- el atributo range sustituye a 0 to 9. Asociado a objetos
            
          g_t <= tabla_gray(i);                     
          wait for 1 ns;   
          
          assert b_t = std_logic_vector(to_unsigned(i,4));
          report "Falla para " & integer'image(to_integer(unsigned(g_t)))--stdlogicvector no imprimible pasado a intero sin signo
          severity warning;            
                                         
        end loop;  
        
        report "Prueba con exito"
        severity note;
        wait;                                                     
  
  end process Prueba_BintoGray;
end architecture test;


