LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY TopLevelCircuit IS
    PORT (
        clk: IN std_logic;
        reset: IN std_logic;
        PD: IN std_logic;
        PC: IN std_logic;
        invers: IN std_logic;
        is_left: OUT std_logic;
        an: OUT std_logic_vector(3 DOWNTO 0);
        seg: OUT std_logic_vector(6 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE Behavioral OF TopLevelCircuit IS

    -- Component Declarations
    COMPONENT PS2_READER IS
        PORT (
            clock: IN std_logic;
            reset: IN std_logic;
            PD: IN std_logic;
            PC: IN std_logic;
            buton_stanga: OUT std_logic;
            buton_dreapta: OUT std_logic
        );
    END COMPONENT;

    COMPONENT numarator IS
        PORT (
            clk: IN std_logic;
            up: IN std_logic;
            down: IN std_logic;
            reset: IN std_logic;
            counterout1: OUT std_logic_vector(3 DOWNTO 0);
            counterout2: OUT std_logic_vector(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT uc IS
        PORT (
            buton_stanga: IN std_logic;
            buton_dreapta: IN std_logic;
            reset: IN std_logic;
            invers: IN std_logic;
            clk: IN std_logic;
            is_left: OUT std_logic;
            up: OUT std_logic;
            down: OUT std_logic
        );
    END COMPONENT;

    COMPONENT ssd IS
        PORT (
            n1: IN std_logic_vector(3 DOWNTO 0);
            n2: IN std_logic_vector(3 DOWNTO 0);
            CLK: IN std_logic;
            Anod: OUT std_logic_vector(3 DOWNTO 0);
            Catod: OUT std_logic_vector(6 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT divizor_frecventa_de_200Hz IS
        PORT (
            clk_in : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    END COMPONENT;

    -- Signals for interconnecting components
    SIGNAL buton_stanga_signal: std_logic;
    SIGNAL buton_dreapta_signal: std_logic;
    SIGNAL up_signal: std_logic;
    SIGNAL down_signal: std_logic;
    SIGNAL n1_signal, n2_signal, n3_signal: std_logic_vector(3 DOWNTO 0);
    SIGNAL Anod_signal: std_logic_vector(3 DOWNTO 0);
    SIGNAL Catod_signal: std_logic_vector(6 DOWNTO 0);
    SIGNAL clk_out_signal: std_logic;

BEGIN

    -- Instantiate the components
    PS2_READER_INST: PS2_READER PORT MAP (
        PC => PC, 
        PD => PD, 
        reset => reset, 
        clock => clk, 
        buton_stanga => buton_stanga_signal, 
        buton_dreapta => buton_dreapta_signal
    );

    uc_INST: uc PORT MAP (
        buton_stanga => buton_stanga_signal, 
        buton_dreapta => buton_dreapta_signal, 
        reset => reset, 
        invers => invers, 
        clk => clk, 
        is_left => is_left, 
        up => up_signal, 
        down => down_signal
    );

    numarator_INST: numarator PORT MAP (
        clk => clk, 
        up => up_signal, 
        down => down_signal, 
        reset => reset, 
        counterout1 => n1_signal, 
        counterout2 => n2_signal
    );
--    divizor_frecventa_de_200Hz_INST: divizor_frecventa_de_200Hz Port Map(
--        clk_in => clk,
--        clk_out => clk_out_signal
--    );

    ssd_INST: ssd PORT MAP (
        n1 => n1_signal, 
        n2 => n2_signal, 
        CLK => clk, 
        Anod => an, 
        Catod => seg
    );
    
    
END Behavioral;

