---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY rblock IS 

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
ARCHITECTURE arch OF rblock IS

    CONSTANT SUB_VECTOR_LENGTH : INTEGER := 8;

    COMPONENT GF2_mux_148
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_32
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_133
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_16
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_194
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_192
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_1
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    COMPONENT GF2_mux_251
        GENERIC( N : INTEGER );
        PORT( data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
              data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 ));
    END COMPONENT;

    SIGNAL mux_row_result : STD_LOGIC_VECTOR(VECTOR_SIZE - 1 DOWNTO 0);
    SIGNAL xor_result : STD_LOGIC_VECTOR(SUB_VECTOR_LENGTH - 1 DOWNTO 0);

BEGIN

    u0 : GF2_mux_1 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 7 DOWNTO 0 ),
                  data_out => mux_row_result( 7 DOWNTO 0));

    u1 : GF2_mux_148 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 15 DOWNTO 8 ),
                  data_out => mux_row_result( 15 DOWNTO 8));

    u2 : GF2_mux_32 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 23 DOWNTO 16 ),
                  data_out => mux_row_result( 23 DOWNTO 16));

    u3 : GF2_mux_133 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 31 DOWNTO 24 ),
                  data_out => mux_row_result( 31 DOWNTO 24));

    u4 : GF2_mux_16 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 39 DOWNTO 32 ),
                  data_out => mux_row_result( 39 DOWNTO 32));

    u5 : GF2_mux_194 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 47 DOWNTO 40 ),
                  data_out => mux_row_result( 47 DOWNTO 40));

    u6 : GF2_mux_192 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 55 DOWNTO 48 ),
                  data_out => mux_row_result( 55 DOWNTO 48));

    u7 : GF2_mux_1 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 63 DOWNTO 56 ),
                  data_out => mux_row_result( 63 DOWNTO 56));

    u8 : GF2_mux_251 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 71 DOWNTO 64 ),
                  data_out => mux_row_result( 71 DOWNTO 64));

    u9 : GF2_mux_1 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 79 DOWNTO 72 ),
                  data_out => mux_row_result( 79 DOWNTO 72));

    u10 : GF2_mux_192 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 87 DOWNTO 80 ),
                  data_out => mux_row_result( 87 DOWNTO 80));

    u11 : GF2_mux_194 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 95 DOWNTO 88 ),
                  data_out => mux_row_result( 95 DOWNTO 88));

    u12 : GF2_mux_16 
        GENERIC MAP( N => SUB_VECTOR_LENGTH )
        PORT MAP( data_in  => data_in( 103 DOWNTO 96 ),
                  data_out => mux_row_result( 103 DOWNTO 96));

    u13 : GF2_mux_133 
            GENERIC MAP( N => SUB_VECTOR_LENGTH )
            PORT MAP( data_in  => data_in( 111 DOWNTO 104 ),
                      data_out => mux_row_result( 111 DOWNTO 104));

    u14 : GF2_mux_32 
            GENERIC MAP( N => SUB_VECTOR_LENGTH )
            PORT MAP( data_in  => data_in( 119 DOWNTO 112 ),
                      data_out => mux_row_result( 119 DOWNTO 112));

    u15 : GF2_mux_148 
            GENERIC MAP( N => SUB_VECTOR_LENGTH )
            PORT MAP( data_in  => data_in( 127 DOWNTO 120 ),
                      data_out => mux_row_result( 127 DOWNTO 120));

    xor_result <= mux_row_result(   7 DOWNTO   0 ) xor
                  mux_row_result(  15 DOWNTO   8 ) xor
                  mux_row_result(  23 DOWNTO  16 ) xor
                  mux_row_result(  31 DOWNTO  24 ) xor
                  mux_row_result(  39 DOWNTO  32 ) xor
                  mux_row_result(  47 DOWNTO  40 ) xor
                  mux_row_result(  55 DOWNTO  48 ) xor
                  mux_row_result(  63 DOWNTO  56 ) xor
                  mux_row_result(  71 DOWNTO  64 ) xor
                  mux_row_result(  79 DOWNTO  72 ) xor
                  mux_row_result(  87 DOWNTO  80 ) xor
                  mux_row_result(  95 DOWNTO  88 ) xor
                  mux_row_result( 103 DOWNTO  96 ) xor
                  mux_row_result( 111 DOWNTO 104 ) xor
                  mux_row_result( 119 DOWNTO 112 ) xor
                  mux_row_result( 127 DOWNTO 120 ) ;

    data_out <= xor_result &
                data_in( 127 DOWNTO 120 ) &
                data_in( 119 DOWNTO 112 ) &
                data_in( 111 DOWNTO 104 ) &
                data_in( 103 DOWNTO  96 ) &
                data_in(  95 DOWNTO  88 ) &
                data_in(  87 DOWNTO  80 ) &
                data_in(  79 DOWNTO  72 ) &
                data_in(  71 DOWNTO  64 ) &
                data_in(  63 DOWNTO  56 ) &
                data_in(  55 DOWNTO  48 ) &
                data_in(  47 DOWNTO  40 ) &
                data_in(  39 DOWNTO  32 ) &
                data_in(  31 DOWNTO  24 ) &
                data_in(  23 DOWNTO  16 ) &
                data_in(  15 DOWNTO   8 );

END ARCHITECTURE;
---------------------------------------------------------------------------------
