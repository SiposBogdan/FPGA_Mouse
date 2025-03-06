
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_Arith.All;
use ieee.std_logic_unsigned.All;

ENTITY ssd IS
  PORT (
  	n1 : in std_logic_vector (3 downto 0);
  	n2 : in std_logic_vector (3 downto 0);
  	CLK :  in std_logic;
  	Anod : out std_logic_vector (3 downto 0);
  	Catod : out std_logic_vector (6 downto 0)

  	--pozitie : out std_logic_vector (2 downto 0)
  
    );
END ssd;


ARCHITECTURE behav OF ssd IS

signal cat : std_logic_vector (6 downto 0) := "0000000";
signal an : std_logic_vector (3 downto 0) := "0000";


signal digit : std_logic_vector (3 downto 0) := "0000";
signal cnt : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
signal sel : STD_LOGIC_VECTOR(2 downto 0);


BEGIN


	counter : process(clk) 
    begin
        if rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;

    sel <= cnt(16 downto 14);

    muxCat : process(sel, n1, n2)
    begin
        case sel is
            when "000" => digit <= n1;
            when "001" => digit <= n2;
            when others => digit <= (others => 'X');
        end case;
    end process;

    muxAn : process(sel)
    begin
        case sel is
            when "000" => anod <= "1110";
            when "001" => anod <= "1101";
            when "010" => anod <= "1011";
            when others => anod <= (others => 'X');
        end case;
    end process;

    with digit SELect
        catod <= "1000000" when "0000",   -- 0
               "1111001" when "0001",   -- 1
               "0100100" when "0010",   -- 2
               "0110000" when "0011",   -- 3
               "0011001" when "0100",   -- 4
               "0010010" when "0101",   -- 5
               "0000010" when "0110",   -- 6
               "1111000" when "0111",   -- 7
               "0000000" when "1000",   -- 8
               "0010000" when "1001",   -- 9
               (others => '1') when others;


END behav;
