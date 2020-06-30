---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY keygen_part IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128;
        KEY_SIZE : INTEGER := 256
    );

    PORT(Co1        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co2        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co3        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co4        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co5        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co6        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co7        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Co8        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         master_in  :  IN STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
         master_out : OUT STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF keygen_part IS

    COMPONENT lblock 
        GENERIC ( VECTOR_SIZE : INTEGER );
        PORT( data_in    :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              data_out   : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT fblock  
        GENERIC ( VECTOR_SIZE : INTEGER ;
                  KEY_SIZE    : INTEGER );
        PORT( data_in :  IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              key_in  :  IN  STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
              key_out : OUT  STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    CONSTANT INPUT_NB : INTEGER := 8;
    TYPE FARRAY_128  IS ARRAY(INPUT_NB - 1  DOWNTO 0) OF STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
    TYPE FARRAY_256  IS ARRAY(INPUT_NB DOWNTO 0) OF STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0);
    SIGNAL f_in  : FARRAY_128;
    SIGNAL f_key : FARRAY_256;

BEGIN

    l1 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co1, 
                  data_out => f_in(0));
    
    l2 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co2, 
                  data_out => f_in(1));

    l3 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co3, 
                  data_out => f_in(2));

    l4 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co4, 
                  data_out => f_in(3));

    l5 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co5, 
                  data_out => f_in(4));
          
    l6 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co6, 
                  data_out => f_in(5));
          
    l7 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co7, 
                  data_out => f_in(6));
          
    l8 : lblock
        GENERIC MAP (VECTOR_SIZE => VECTOR_SIZE)
        PORT MAP( data_in  => Co8, 
                  data_out => f_in(7));

    FBLOCK_gen : FOR i IN 0 TO (INPUT_NB - 1) GENERATE
        gen : fblock 
            GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE ,
                         KEY_SIZE => KEY_SIZE )
            PORT MAP( data_in => f_in(i),
                      key_in  => f_key(i),
                      key_out => f_key(i + 1));  
    END GENERATE FBLOCK_gen;

    f_key(0) <= master_in;
    master_out <= f_key(INPUT_NB);

END ARCHITECTURE;
---------------------------------------------------------------------------------
