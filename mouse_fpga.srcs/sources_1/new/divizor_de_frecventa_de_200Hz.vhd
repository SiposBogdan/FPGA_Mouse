LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

entity divizor_frecventa_de_200Hz is
    Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end divizor_frecventa_de_200Hz;

architecture behav of divizor_frecventa_de_200Hz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 124999 := 0;
begin
    process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = 124999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
         end if;
    end process;
    
    clk_out <= temporal;
end behav;