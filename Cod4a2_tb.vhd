-- 09/06/2020 ---------- Enrique Moreno Roldan ---------- Cod4a2_tb.vhd
-- Codificador 4 entradas a 2 salidas con senial de grupo

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity Cod4a2_tb is	
end entity Cod4a2_tb;
	
-------------------------------------------------

architecture test of Cod4a2_tb is
  -------------------------------------------------
   component Cod4a2 is  
        port(  
			i_i	: in std_logic_vector(3 downto 0);
			y_o	: out std_logic_vector(1 downto 0)	;
			g_o	: out std_logic ); --Senial de grupo que indica que al menos hay una entrada activa
		end component Cod4a2;
	-------------------------------------------------
	signal i_t: std_logic_vector(3 downto 0) := "0000";
	signal y_t: std_logic_vector(1 downto 0);
	signal g_t: std_logic;

begin
  
  dut: Cod4a2 port map(i_i => i_t, y_o => y_t, g_o => g_t);
    
Prueba_Cod4a2: 
  
  process begin
    
          report "Verificando el decodificador"
          severity note; 
          
     for i in 0 to 15 loop
        
          i_t <= std_logic_vector(to_unsigned(i,4));

            wait for 1 ns;
            
            if i_t(3)='1' then
              
             assert y_t="11" 
                  report "Falla y_o para i_i=1xxx" & integer'image(i)                                                                    
                  severity failure;        
             assert g_t='1' 
                  report "Falla g_o para i_i=1xxx" & integer'image(i)                                                                    
                  severity failure;      
             
            elsif i_t(2)='1' then
              
              assert y_t="10" 
                  report "Falla y_o para i_i=01xx" & integer'image(i)                                                                    
                  severity failure;        
              assert g_t='1' 
                  report "Falla g_o para i_i=01xx" & integer'image(i)                                                                    
                  severity failure;    
            
           elsif i_t(1)='1'  then
          
             assert y_t="01" 
                  report "Falla y_o para i_i=001x" & integer'image(i)                                                                    
                  severity failure;        
             assert g_t='1' 
                  report "Falla g_o para i_i=001x" & integer'image(i)                                                                    
                  severity failure;      
             
            elsif i_t(0)='1' then
              
              assert y_t="00" 
                  report "Falla y_o para i_i=0001" & integer'image(i)                                                                    
                  severity failure;        
             assert g_t='1' 
                  report "Falla g_o para i_i=0001" & integer'image(i)                                                                    
                  severity failure;  
            else  
              assert y_t="00" 
                  report "Falla y_o para i_i=0000"                                                                  
                  severity failure;        
              assert g_t='1' 
                  report "Falla g_o para i_i=0000"                                                                   
                  severity failure;  
          end if;            
                                                      
    end loop; 
                                                      
          report "Verificacion con exito"
          severity note;
          wait;
    
  end process Prueba_Cod4a2;
end architecture test;

----------------------------------------------------


