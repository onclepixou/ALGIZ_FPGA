---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY fblock IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128;
        KEY_SIZE : INTEGER := 256
    );

    PORT( 
        data_in :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        key_in  :  IN  STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
        key_out : OUT  STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 ) 
    );

END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF fblock IS

    COMPONENT lsxblock
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( data_in  : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              subkey   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    SIGNAL lsx_out : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );

BEGIN

    lsx1 : lsxblock
        GENERIC MAP(VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP ( data_in  => data_in ,
                   subkey   => key_in( KEY_SIZE - 1 DOWNTO VECTOR_SIZE ), 
                   data_out => lsx_out);

    key_out(KEY_SIZE - 1 DOWNTO VECTOR_SIZE) <= lsx_out XOR key_in(VECTOR_SIZE - 1 DOWNTO 0);
    key_out(VECTOR_SIZE - 1 DOWNTO 0) <= key_in(KEY_SIZE - 1 DOWNTO VECTOR_SIZE );

END ARCHITECTURE;
---------------------------------------------------------------------------------
