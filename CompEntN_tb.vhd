-- 15/06/2020 ---------- Enrique Moreno Roldan ---------- CompEntN_tb.vhd
-- Comparador enteros N bits

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity CompEntN_tb is	
end entity CompEntN_tb;
	
-------------------------------------------------

architecture test of CompEntN_tb is
  -------------------------------------------------
  component CompEntN is
    
  generic (N 	: positive := 4);
	port(	a_i    : in std_logic_vector(N-1 downto 0);
			  b_i  	 : in std_logic_vector(N-1 downto 0);
			  may_o    : out std_logic;
			  men_o		  : out std_logic;
			  igu_o    : out std_logic );	
  end component CompEntN; 
	-------------------------------------------------
	signal a_t: std_logic_vector(3 downto 0):= "0000";
	signal b_t: std_logic_vector(3 downto 0):= "0000";
	signal may_t    :  std_logic;
	signal men_t		  :  std_logic;
	signal igu_t    :  std_logic;	
	type tabla1 is array (0 to 9) of std_logic_vector(3 downto 0);
	type tabla2 is array (0 to 9) of std_logic;
	
	constant estimulo_a  : tabla1 := ("0000",
	                                 "0001",
	                                 "0010",
	                                 "0011",
	                                 "0100",
	                                 "1011",
	                                 "1100",
	                                 "1101",
	                                 "1110",
	                                 "1111");
	constant estimulo_b  : tabla1 := ("0000",
	                                 "0010",
	                                 "0001",
	                                 "0000",
	                                 "0111",
	                                 "1111",
	                                 "1111",
	                                 "1000",
	                                 "1010",
	                                 "1001");
	                

begin
  
  dut: CompEntN generic map (N => 4)
                port map(a_i => a_t, b_i => b_t, may_o => may_t, men_o => men_t, igu_o => igu_t);
    
Prueba_CompEntN: 
  
  process begin
    
        report "Probando comparaciones de 4 enteros"
        severity note; 
          
        for i in tabla1'range loop -- el atributo range sustituye a 0 to 9. Asociado a objetos
            
            a_t <= estimulo_a(i);  
            b_t <= estimulo_b(i);  
                    
          wait for 1 ns;          
                                         
        end loop;  
        
        wait;                                                     
  
  end process Prueba_CompEntN;
end architecture test;


