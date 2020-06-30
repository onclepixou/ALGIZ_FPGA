---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------
-- Entity that performs Algiz Decryption. This must be used with a keygen
-- entity to provide subkeys.
---------------------------------------------------------------------------------
ENTITY decryptionblock IS 

    GENERIC (
        VECTOR_SIZE  : INTEGER := 128
    );

    PORT( data_in   :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey01  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey02  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey03  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey04  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey05  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey06  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey07  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey08  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey09  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          subkey10  :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
          data_out  : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
ARCHITECTURE arch OF decryptionblock IS

    CONSTANT CHAIN_LENGTH : INTEGER := 9;
    CONSTANT KEY_NB       : INTEGER := 10;

    COMPONENT sinvlinvxblock
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( data_in  : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              subkey   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT xblock  
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( a   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              k   : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              x   : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    TYPE IOARRAY  IS ARRAY(CHAIN_LENGTH  DOWNTO 0) OF STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
    TYPE KEYARRAY IS ARRAY(KEY_NB - 1  DOWNTO 0) OF STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);

    SIGNAL ios : IOARRAY;
    SIGNAL keys : KEYARRAY;

BEGIN

    SINVLINVXBLOCK_gen : FOR i IN 0 TO (CHAIN_LENGTH - 1) GENERATE

        gen : sinvlinvxblock 
            GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
            PORT MAP( data_in  => ios(i),
                      subkey   => keys(KEY_NB - i - 1), 
                      data_out => ios(i + 1));

    END GENERATE SINVLINVXBLOCK_gen;

    U10 : xblock
        GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE )
        PORT MAP( a => ios(CHAIN_LENGTH ),
                  k => subkey01 ,
                  x => data_out );

    ios(0) <= data_in;

    keys(0) <= subkey01;    
    keys(1) <= subkey02;
    keys(2) <= subkey03;
    keys(3) <= subkey04;
    keys(4) <= subkey05;
    keys(5) <= subkey06;
    keys(6) <= subkey07;
    keys(7) <= subkey08;
    keys(8) <= subkey09;
    keys(9) <= subkey10;

END ARCHITECTURE;
---------------------------------------------------------------------------------
