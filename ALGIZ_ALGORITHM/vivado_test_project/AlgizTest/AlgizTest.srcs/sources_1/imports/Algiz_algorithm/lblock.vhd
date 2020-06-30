---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY lblock IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128
    );

    PORT( 
        data_in    :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        data_out   : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF lblock IS

    CONSTANT VECTOR_SUB_SIZE : INTEGER := 8;

    COMPONENT rblock 
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( data_in    :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              data_out   : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    TYPE supportArray IS ARRAY(VECTOR_SIZE/VECTOR_SUB_SIZE DOWNTO 0) OF STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);

    SIGNAL support : supportArray;

BEGIN

    RBLOCK_gen : FOR i IN 0 TO ((VECTOR_SIZE/VECTOR_SUB_SIZE) - 1) GENERATE

        gen : rblock 
            GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
            PORT MAP( data_in => support(i), 
                      data_out => support(i + 1));

    END GENERATE RBLOCK_gen;

    support(0) <= data_in;
    data_out <= support(VECTOR_SIZE/VECTOR_SUB_SIZE);

END ARCHITECTURE;
---------------------------------------------------------------------------------
