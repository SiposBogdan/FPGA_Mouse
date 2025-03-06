LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY numarator IS
  PORT (
    clk: in std_logic;
    up, down: in std_logic;
    reset: in std_logic;
    counterout1: out std_logic_vector (3 DOWNTO 0); -- Units place
    counterout2: out std_logic_vector (3 DOWNTO 0)  -- Tens place
  );
END numarator;

ARCHITECTURE Structural OF numarator IS
  SIGNAL numar: UNSIGNED(6 DOWNTO 0) := "0000000"; -- 7-bit counter (range 0-99)
BEGIN
  process(clk, reset)
  begin
    if reset = '1' then
      numar <= (others => '0');
    elsif falling_edge(clk) then
        if up = '1' and numar < 99 then
            numar <= numar + 1;
        elsif down = '1' and numar > 0 then
            numar <= numar - 1;
        end if;
    end if;
  end process;

  counterout1 <= std_logic_vector(resize(numar mod 10, 4));
  counterout2 <= std_logic_vector(resize((numar / 10) mod 10, 4));

END Structural;
