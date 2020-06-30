---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY xblock IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128
    );

    PORT( 
        a   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        k   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        x   : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ) 
    );

END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF xblock IS

BEGIN

    x <= (k xor a);

END ARCHITECTURE;
---------------------------------------------------------------------------------
