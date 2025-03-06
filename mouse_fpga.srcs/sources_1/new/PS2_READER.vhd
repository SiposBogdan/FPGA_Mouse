LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_Arith.All;
use ieee.std_logic_unsigned.All;


entity PS2_READER is
    port (
        clock : in std_logic;
        reset : in std_logic;
        PD : in std_logic;
        PC : in std_logic;
        buton_stanga : out std_logic;
        buton_dreapta : out std_logic
    );
end PS2_READER;

architecture Behavioral of PS2_READER is
    signal biti_mouse : std_logic_vector(42 downto 0) := (others => '0');
    signal numar_biti_dati_mouse : std_logic_vector(5 downto 0) := (others => '0');
    signal plin : std_logic;
    signal stanga_apasat : std_logic := '0';
    signal dreapta_apasat : std_logic := '0';
 
begin
	--NUMARARE BITI
    process (reset, PC)
    begin
        if reset = '1' then
            numar_biti_dati_mouse <= (others => '0');
        elsif falling_edge(PC) then
            if numar_biti_dati_mouse < 42 then
                numar_biti_dati_mouse <= numar_biti_dati_mouse + 1;
            else
                numar_biti_dati_mouse <= (others => '0');
            end if;
        end if;
    end process;

    process (PC, reset)
    begin
        plin <= '0';
        if reset = '1' then
            biti_mouse <= (others => '0');
        elsif falling_edge(PC) then
            biti_mouse <= biti_mouse(41 downto 0) & PD;
            if numar_biti_dati_mouse = 42 then
                plin <= '1';
            end if;
        end if;
    end process;

    process (clock)
    begin
        if rising_edge(clock) then    
            buton_stanga <= '0';
            buton_dreapta <= '0';
            
            if plin = '1' then

                if biti_mouse(41) = '1' and stanga_apasat = '0' then
                    buton_stanga <= '1';
                elsif biti_mouse(40) = '1' and dreapta_apasat = '0' then
                    buton_dreapta <= '1';
                end if;
                stanga_apasat <= biti_mouse(41);
                dreapta_apasat <= biti_mouse(40);
            end if;    
        end if;
    end process;
end Behavioral;

