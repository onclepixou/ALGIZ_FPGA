---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------
-- Entity that generates subkeys from masterkey. Must be used in combination
-- with encryption/decryption. One keygen can be used with many blocks that
-- perform encryption/decryption
---------------------------------------------------------------------------------
ENTITY keygen IS 

    GENERIC (
        VECTOR_SIZE : INTEGER := 128;
        KEY_SIZE : INTEGER := 256
    );

    PORT(master_in  :  IN STD_LOGIC_VECTOR(KEY_SIZE - 1    DOWNTO 0 );
         Key01      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key02      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key03      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key04      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key05      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key06      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key07      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key08      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key09      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
         Key10      : OUT STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 )
    );

END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF keygen IS

    COMPONENT keygen_part
        GENERIC ( VECTOR_SIZE : INTEGER ;
                  KEY_SIZE    : INTEGER );
        PORT(Co1        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co2        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co3        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co4        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co5        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co6        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co7        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             Co8        :  IN STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
             master_in  :  IN STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
             master_out : OUT STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 ));
    END COMPONENT;

    SIGNAL KEY34  : STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
    SIGNAL KEY56  : STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
    SIGNAL KEY78  : STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );
    SIGNAL KEY910 : STD_LOGIC_VECTOR(KEY_SIZE - 1 DOWNTO 0 );

    SIGNAL Co01       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co02       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co03       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co04       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co05       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co06       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co07       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co08       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co09       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co10       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co11       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co12       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co13       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co14       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co15       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co16       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co17       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co18       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co19       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co20       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co21       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co22       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co23       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co24       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co25       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co26       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co27       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co28       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co29       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co30       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co31       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );
    SIGNAL Co32       : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0 );

BEGIN

    Key01 <= master_in(KEY_SIZE    - 1 DOWNTO VECTOR_SIZE );
    Key02 <= master_in(VECTOR_SIZE - 1 DOWNTO 0 );
    Key03 <= KEY34(KEY_SIZE    - 1 DOWNTO VECTOR_SIZE );
    Key04 <= KEY34(VECTOR_SIZE - 1 DOWNTO 0 ); 
    Key05 <= KEY56(KEY_SIZE    - 1 DOWNTO VECTOR_SIZE );
    Key06 <= KEY56(VECTOR_SIZE - 1 DOWNTO 0 ); 
    Key07 <= KEY78(KEY_SIZE    - 1 DOWNTO VECTOR_SIZE );
    Key08 <= KEY78(VECTOR_SIZE - 1 DOWNTO 0 ); 
    Key09 <= KEY910(KEY_SIZE    - 1 DOWNTO VECTOR_SIZE );
    Key10 <= KEY910(VECTOR_SIZE - 1 DOWNTO 0 ); 

    Co01        <= X"00000000000000000000000000000001";
    Co02        <= X"00000000000000000000000000000002";  
    Co03        <= X"00000000000000000000000000000003";  
    Co04        <= X"00000000000000000000000000000004";  
    Co05        <= X"00000000000000000000000000000005";  
    Co06        <= X"00000000000000000000000000000006";  
    Co07        <= X"00000000000000000000000000000007";  
    Co08        <= X"00000000000000000000000000000008";  
    Co09        <= X"00000000000000000000000000000009";
    Co10        <= X"0000000000000000000000000000000A";  
    Co11        <= X"0000000000000000000000000000000B";  
    Co12        <= X"0000000000000000000000000000000C";  
    Co13        <= X"0000000000000000000000000000000D";  
    Co14        <= X"0000000000000000000000000000000E";  
    Co15        <= X"0000000000000000000000000000000F";  
    Co16        <= X"00000000000000000000000000000010"; 
    Co17        <= X"00000000000000000000000000000011";
    Co18        <= X"00000000000000000000000000000012";  
    Co19        <= X"00000000000000000000000000000013";  
    Co20        <= X"00000000000000000000000000000014";  
    Co21        <= X"00000000000000000000000000000015";  
    Co22        <= X"00000000000000000000000000000016";  
    Co23        <= X"00000000000000000000000000000017";  
    Co24        <= X"00000000000000000000000000000018"; 
    Co25        <= X"00000000000000000000000000000019";
    Co26        <= X"0000000000000000000000000000001A";  
    Co27        <= X"0000000000000000000000000000001B";  
    Co28        <= X"0000000000000000000000000000001C";  
    Co29        <= X"0000000000000000000000000000001D";  
    Co30        <= X"0000000000000000000000000000001E";  
    Co31        <= X"0000000000000000000000000000001F";  
    Co32        <= X"00000000000000000000000000000020"; 

    gen1 : keygen_part
         GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE,
                      KEY_SIZE    => KEY_SIZE )
         PORT MAP( Co1 => Co01,
                   Co2 => Co02,
                   Co3 => Co03,
                   Co4 => Co04,
                   Co5 => Co05,
                   Co6 => Co06,
                   Co7 => Co07,
                   Co8 => Co08,
                   master_in  => master_in,
                   master_out => KEY34 );

    gen2 : keygen_part
    GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE,
                 KEY_SIZE    => KEY_SIZE )
    PORT MAP( Co1 => Co09,
              Co2 => Co10,
              Co3 => Co11,
              Co4 => Co12,
              Co5 => Co13,
              Co6 => Co14,
              Co7 => Co15,
              Co8 => Co16,
              master_in  => KEY34 ,
              master_out => KEY56 );

    gen3 : keygen_part
    GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE,
                 KEY_SIZE    => KEY_SIZE )
    PORT MAP( Co1 => Co17,
              Co2 => Co18,
              Co3 => Co19,
              Co4 => Co20,
              Co5 => Co21,
              Co6 => Co22,
              Co7 => Co23,
              Co8 => Co24,
              master_in  => KEY56 ,
              master_out => KEY78 );

    gen4 : keygen_part
    GENERIC MAP( VECTOR_SIZE => VECTOR_SIZE,
                 KEY_SIZE    => KEY_SIZE )
    PORT MAP( Co1 => Co25,
              Co2 => Co26,
              Co3 => Co27,
              Co4 => Co28,
              Co5 => Co29,
              Co6 => Co30,
              Co7 => Co31,
              Co8 => Co32,
              master_in  => KEY78 ,
              master_out => KEY910 );

END ARCHITECTURE;
---------------------------------------------------------------------------------
