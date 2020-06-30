---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------
-- This Entity uses a keygen and an encryption block to perform an encryption.
-- Here for the sake of the example the keygen is used by an unique encryption 
-- block but in reality one keygen will give key for numerous encryption blocks
---------------------------------------------------------------------------------
ENTITY top_level_encryption IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128;
        KEY_SIZE    : INTEGER := 256
    );

    PORT(
        plain      : IN  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
        master_key : IN  STD_LOGIC_VECTOR(KEY_SIZE    - 1 DOWNTO 0 );
        ciphertext : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
ARCHITECTURE arch OF top_level_encryption IS

    COMPONENT keygen
        GENERIC ( VECTOR_SIZE : INTEGER ;
                  KEY_SIZE    : INTEGER );
        PORT( master_in  :  IN STD_LOGIC_VECTOR(KEY_SIZE    - 1 DOWNTO 0 );
              Key01      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key02      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key03      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key04      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key05      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key06      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key07      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key08      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key09      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
              Key10      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT encryptionblock  
        GENERIC ( VECTOR_SIZE  : INTEGER );
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
              data_out  : OUT  STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    SIGNAL K1  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K2  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K3  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K4  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K5  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K6  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K7  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K8  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K9  : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL K10 : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );

BEGIN

    u1 : keygen
        GENERIC MAP( VECTOR_SIZE  => VECTOR_SIZE,
                     KEY_SIZE     => KEY_SIZE ) 
        PORT MAP( master_in  => master_key,
                  Key01      => K1,
                  Key02      => K2,
                  Key03      => K3,
                  Key04      => K4,
                  Key05      => K5,
                  Key06      => K6,
                  Key07      => K7,
                  Key08      => K8,
                  Key09      => K9,
                  Key10      => K10);

    u2 : encryptionblock
        GENERIC MAP( VECTOR_SIZE  => VECTOR_SIZE )
        PORT MAP( data_in  => plain,
                  subkey01 => K1,
                  subkey02 => K2,
                  subkey03 => K3,
                  subkey04 => K4,
                  subkey05 => K5,
                  subkey06 => K6,
                  subkey07 => K7,
                  subkey08 => K8,
                  subkey09 => K9,
                  subkey10 => K10,
                  data_out => ciphertext);

END ARCHITECTURE;
---------------------------------------------------------------------------------
