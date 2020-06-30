---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY top_level_encryption_tb IS 
END ENTITY;
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
ARCHITECTURE arch OF top_level_encryption_tb IS

    CONSTANT VECTOR_SIZE : INTEGER := 128;
    CONSTANT KEY_SIZE    : INTEGER := 256; 

    COMPONENT top_level_encryption  
        GENERIC (
            VECTOR_SIZE : INTEGER ;
            KEY_SIZE    : INTEGER  );
        PORT(plain      : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             master_key : IN  STD_LOGIC_VECTOR(KEY_SIZE    - 1 DOWNTO 0 );
             ciphertext : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    SIGNAL clk        : STD_LOGIC := '0';
    SIGNAL plain      : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
    SIGNAL master_key : STD_LOGIC_VECTOR(KEY_SIZE    - 1 DOWNTO 0);
    SIGNAL ciphertext : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);

BEGIN
    uut : top_level_encryption
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE,
                     KEY_SIZE    => KEY_SIZE )
        PORT MAP( plain      => plain,
                  master_key => master_key,
                  ciphertext => ciphertext);

    clk <= not clk after 10 ns;

    stim_proc : PROCESS
    BEGIN 

        plain <= X"1122334455667700ffeeddccbbaa9988";
        master_key <= X"8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef";
        wait;

    END PROCESS;

END ARCHITECTURE;
---------------------------------------------------------------------------------
