LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_Arith.All;
use ieee.std_logic_unsigned.All;

ENTITY uc IS
  PORT (
  	buton_stanga: in std_logic;
  	buton_dreapta: in std_logic;
  	reset: in std_logic;
  	invers: in std_logic;
	clk: in std_logic;
	is_left:out std_logic;
	up: out std_logic;
	down: out std_logic
    );
END uc;


ARCHITECTURE behav OF uc IS

BEGIN

	process(clk,reset)
	begin
	if reset = '1' then
	   up <= '0';
	   down <= '0';
	else
	if rising_edge(clk) then
		if invers = '1' then
			is_left <= '0';
			if buton_stanga = '1' then
				down <= '1';
			else
				down <= '0';	
			end if;
			
			if buton_dreapta = '1' then
				up <= '1';
			else
				up <= '0';	
			end if;
		else
			is_left <= '1';
			
			if buton_stanga = '1' then
				up <= '1';
			else
				up <= '0';	
			end if;
			
			if buton_dreapta = '1' then
				down <= '1';
			else
				down <= '0';	
			end if;
				
			end if;
	end if;
	end if;
	end process;

END behav;
