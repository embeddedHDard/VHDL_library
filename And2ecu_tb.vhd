-- 09/06/2020 ---------- Enrique Moreno Roldan ---------- And2ecu_tb.vhd
-- Compuerta and de 2 entradas

library IEEE;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity And2ecu_tb is	
end entity And2ecu_tb;
	
-------------------------------------------------

architecture test of And2ecu_tb is
  -------------------------------------------------
  component And2ecu is
	port(
			a_i: in std_logic;
			b_i: in std_logic;
			y_o: out std_logic	);		
  end component And2ecu; 
	-------------------------------------------------
	signal a_t: std_logic := '0';
	signal b_t: std_logic := '0';
	signal y_t: std_logic;

begin
  
  dut: And2ecu port map(a_i => a_t, b_i => b_t, y_o => y_t);
    
Prueba_and2ecu: 
  
  process begin
    
          report "Verificando la compuerta Y de 2 entradas"
          severity note; 
          
          a_t <= '0';
          b_t <= '0';
          
          wait for 1 ns;          
          assert y_t='0' report "Falla para a_i=0 y b_i=0" severity failure;--Comprueba si el 
                                                      -- resultado es igual a 0 y sino, 
                                                      -- sale del programa con failure
          
          a_t <= '1';
          b_t <= '0';
          
          wait for 1 ns;          
          assert y_t='0' report "Falla para a_i=1 y b_i=0" severity failure;   
          
          a_t <= '0';
          b_t <= '1';
          
          wait for 1 ns;          
          assert y_t='0' report "Falla para a_i=0 y b_i=1" severity failure; 
          
          a_t <= '1';
          b_t <= '1';
          
          wait for 1 ns;          
          assert y_t='1' report "Falla para a_i=1 y b_i=1" severity failure;
          
          a_t <= '0';
          b_t <= '0';
          
          wait for 1 ns;          
          assert y_t='0' report "Falla para a_i=0 y b_i=0" severity failure;
          
          
          report "Verificacion con exito"
          severity note;
          wait;
    
  end process Prueba_and2ecu;
end architecture test;

----------------------------------------------------