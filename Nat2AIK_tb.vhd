-- 15/06/2020 ---------- Enrique Moreno Roldan ---------- And2ecu_tb.vhd
-- Natural a AIK

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------

entity Nat2AIK_tb is	
end entity Nat2AIK_tb;
	
-------------------------------------------------

architecture test of Nat2AIK_tb is
  -------------------------------------------------
  component Nat2AIK is
	port(
			n_i: in std_logic_vector(3 downto 0);			
			a_o: out std_logic_vector(3 downto 0)	);	
  end component Nat2AIK; 
	-------------------------------------------------
	signal n_t: std_logic_vector(3 downto 0) := "0000";
	signal a_t: std_logic_vector(3 downto 0);
	
	type tabla is array (0 to 9) of std_logic_vector(3 downto 0);
	constant TABLA_AIKEN : tabla := ("0000",
	                                 "0001",
	                                 "0010",
	                                 "0011",
	                                 "0100",
	                                 "1011",
	                                 "1100",
	                                 "1101",
	                                 "1110",
	                                 "1111");
	                

begin
  
  dut: Nat2AIK port map(n_i => n_t,a_o => a_t);
    
Prueba_Nat2AIK: 
  
  process begin
    
        report "Probando el conversor de BCD natural a BCD Aiken"
        severity note; 
          
        for i in tabla'range loop -- el atributo range sustituye a 0 to 9. Asociado a objetos
            
            n_t <= std_logic_vector(to_unsigned (i,4));  
                    
          wait for 1 ns;          
          assert  a_t = TABLA_AIKEN(i)
          report "Falla para " &integer'image(to_integer(unsigned(n_t))) -- image es otro atributo
          severity warning;                                              -- para pasarlo a imprimible
        end loop;                                                        -- con tipo de dato entero

        report "Prueba con exito"
        severity note;  
        wait;
  
  end process Prueba_Nat2AIK;
end architecture test;

