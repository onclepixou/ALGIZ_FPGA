---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------
ENTITY sinvblock IS

    GENERIC(
        VECTOR_SIZE : INTEGER := 128
    );
    
    PORT(
        data_in  : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0)
    );

END ENTITY;

---------------------------------------------------------------------------------
ARCHITECTURE arch OF sinvblock IS
 
CONSTANT VECTOR_SUB_SIZE : INTEGER := 8;
    
COMPONENT piinvblock
GENERIC( N : INTEGER );
    PORT(
        data_in  : IN  STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
    );

END COMPONENT;

BEGIN 

    PIINVBLOCK_gen : FOR i IN 0 TO ((VECTOR_SIZE/VECTOR_SUB_SIZE) - 1) GENERATE

        gen : piinvblock 
            GENERIC MAP (N => VECTOR_SUB_SIZE)
            PORT MAP(   data_in(0)  => data_in(i * VECTOR_SUB_SIZE + 0 ),
                        data_in(1)  => data_in(i * VECTOR_SUB_SIZE + 1 ),
                        data_in(2)  => data_in(i * VECTOR_SUB_SIZE + 2 ),
                        data_in(3)  => data_in(i * VECTOR_SUB_SIZE + 3 ),
                        data_in(4)  => data_in(i * VECTOR_SUB_SIZE + 4 ),
                        data_in(5)  => data_in(i * VECTOR_SUB_SIZE + 5 ),
                        data_in(6)  => data_in(i * VECTOR_SUB_SIZE + 6 ),
                        data_in(7)  => data_in(i * VECTOR_SUB_SIZE + 7 ),

                        data_out(0) => data_out(i * VECTOR_SUB_SIZE + 0),
                        data_out(1) => data_out(i * VECTOR_SUB_SIZE + 1),
                        data_out(2) => data_out(i * VECTOR_SUB_SIZE + 2),
                        data_out(3) => data_out(i * VECTOR_SUB_SIZE + 3),
                        data_out(4) => data_out(i * VECTOR_SUB_SIZE + 4),
                        data_out(5) => data_out(i * VECTOR_SUB_SIZE + 5),
                        data_out(6) => data_out(i * VECTOR_SUB_SIZE + 6),
                        data_out(7) => data_out(i * VECTOR_SUB_SIZE + 7));

    END GENERATE PIINVBLOCK_gen;
---------------------------------------------------------------------------------
END ARCHITECTURE;