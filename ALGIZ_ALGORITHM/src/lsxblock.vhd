---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY lsxblock IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128
    );

    PORT(
        data_in  : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        subkey   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        data_out : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
ARCHITECTURE arch OF lsxblock IS

    SIGNAL xblock_out : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
    SIGNAL sblock_out : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);

    COMPONENT xblock
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( a   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              k   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              x   : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT sblock
        GENERIC ( VECTOR_SIZE : INTEGER);
        PORT( data_in  : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
              data_out : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0));
    END COMPONENT;

    COMPONENT lblock 
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( data_in    :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              data_out   : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

BEGIN


    u1 : xblock
        GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE )
        PORT MAP( a => data_in,
                  k => subkey ,
                  x => xblock_out );

    u2 : sblock
        GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE )
        PORT MAP( data_in  => xblock_out,
                  data_out => sblock_out );

    u3 : lblock
        GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE )
        PORT MAP( data_in  => sblock_out,
                  data_out => data_out );

END ARCHITECTURE;
---------------------------------------------------------------------------------
