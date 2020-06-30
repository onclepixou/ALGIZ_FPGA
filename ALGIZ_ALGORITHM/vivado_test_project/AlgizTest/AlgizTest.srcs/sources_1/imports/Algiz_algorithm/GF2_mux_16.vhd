---------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ENTITY GF2_mux_16 IS
    GENERIC(
        N : INTEGER := 8
    );

    PORT(
       data_in  :  IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0 );
       data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0 )
    );
END ENTITY;
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
ARCHITECTURE arch OF GF2_mux_16 IS

SIGNAL integer_input : INTEGER RANGE 0 TO 2**N - 1;

BEGIN

integer_input <= TO_INTEGER(UNSIGNED(data_in));

WITH integer_input SELECT

    data_out <= STD_LOGIC_VECTOR(TO_UNSIGNED( 0, N)) WHEN   0,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 16, N)) WHEN   1,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 32, N)) WHEN   2,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 48, N)) WHEN   3,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 64, N)) WHEN   4,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 80, N)) WHEN   5,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 96, N)) WHEN   6,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 112, N)) WHEN   7,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 128, N)) WHEN   8,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 144, N)) WHEN   9,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 160, N)) WHEN   10,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 176, N)) WHEN   11,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 192, N)) WHEN   12,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 208, N)) WHEN   13,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 224, N)) WHEN   14,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 240, N)) WHEN   15,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 195, N)) WHEN   16,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 211, N)) WHEN   17,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 227, N)) WHEN   18,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 243, N)) WHEN   19,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 131, N)) WHEN   20,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 147, N)) WHEN   21,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 163, N)) WHEN   22,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 179, N)) WHEN   23,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 67, N)) WHEN   24,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 83, N)) WHEN   25,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 99, N)) WHEN   26,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 115, N)) WHEN   27,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 3, N)) WHEN   28,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 19, N)) WHEN   29,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 35, N)) WHEN   30,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 51, N)) WHEN   31,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 69, N)) WHEN   32,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 85, N)) WHEN   33,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 101, N)) WHEN   34,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 117, N)) WHEN   35,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 5, N)) WHEN   36,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 21, N)) WHEN   37,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 37, N)) WHEN   38,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 53, N)) WHEN   39,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 197, N)) WHEN   40,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 213, N)) WHEN   41,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 229, N)) WHEN   42,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 245, N)) WHEN   43,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 133, N)) WHEN   44,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 149, N)) WHEN   45,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 165, N)) WHEN   46,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 181, N)) WHEN   47,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 134, N)) WHEN   48,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 150, N)) WHEN   49,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 166, N)) WHEN   50,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 182, N)) WHEN   51,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 198, N)) WHEN   52,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 214, N)) WHEN   53,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 230, N)) WHEN   54,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 246, N)) WHEN   55,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 6, N)) WHEN   56,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 22, N)) WHEN   57,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 38, N)) WHEN   58,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 54, N)) WHEN   59,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 70, N)) WHEN   60,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 86, N)) WHEN   61,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 102, N)) WHEN   62,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 118, N)) WHEN   63,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 138, N)) WHEN   64,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 154, N)) WHEN   65,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 170, N)) WHEN   66,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 186, N)) WHEN   67,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 202, N)) WHEN   68,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 218, N)) WHEN   69,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 234, N)) WHEN   70,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 250, N)) WHEN   71,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 10, N)) WHEN   72,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 26, N)) WHEN   73,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 42, N)) WHEN   74,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 58, N)) WHEN   75,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 74, N)) WHEN   76,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 90, N)) WHEN   77,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 106, N)) WHEN   78,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 122, N)) WHEN   79,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 73, N)) WHEN   80,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 89, N)) WHEN   81,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 105, N)) WHEN   82,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 121, N)) WHEN   83,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 9, N)) WHEN   84,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 25, N)) WHEN   85,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 41, N)) WHEN   86,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 57, N)) WHEN   87,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 201, N)) WHEN   88,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 217, N)) WHEN   89,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 233, N)) WHEN   90,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 249, N)) WHEN   91,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 137, N)) WHEN   92,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 153, N)) WHEN   93,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 169, N)) WHEN   94,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 185, N)) WHEN   95,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 207, N)) WHEN   96,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 223, N)) WHEN   97,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 239, N)) WHEN   98,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 255, N)) WHEN   99,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 143, N)) WHEN   100,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 159, N)) WHEN   101,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 175, N)) WHEN   102,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 191, N)) WHEN   103,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 79, N)) WHEN   104,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 95, N)) WHEN   105,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 111, N)) WHEN   106,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 127, N)) WHEN   107,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 15, N)) WHEN   108,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 31, N)) WHEN   109,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 47, N)) WHEN   110,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 63, N)) WHEN   111,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 12, N)) WHEN   112,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 28, N)) WHEN   113,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 44, N)) WHEN   114,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 60, N)) WHEN   115,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 76, N)) WHEN   116,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 92, N)) WHEN   117,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 108, N)) WHEN   118,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 124, N)) WHEN   119,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 140, N)) WHEN   120,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 156, N)) WHEN   121,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 172, N)) WHEN   122,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 188, N)) WHEN   123,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 204, N)) WHEN   124,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 220, N)) WHEN   125,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 236, N)) WHEN   126,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 252, N)) WHEN   127,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 215, N)) WHEN   128,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 199, N)) WHEN   129,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 247, N)) WHEN   130,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 231, N)) WHEN   131,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 151, N)) WHEN   132,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 135, N)) WHEN   133,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 183, N)) WHEN   134,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 167, N)) WHEN   135,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 87, N)) WHEN   136,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 71, N)) WHEN   137,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 119, N)) WHEN   138,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 103, N)) WHEN   139,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 23, N)) WHEN   140,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 7, N)) WHEN   141,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 55, N)) WHEN   142,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 39, N)) WHEN   143,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 20, N)) WHEN   144,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 4, N)) WHEN   145,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 52, N)) WHEN   146,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 36, N)) WHEN   147,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 84, N)) WHEN   148,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 68, N)) WHEN   149,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 116, N)) WHEN   150,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 100, N)) WHEN   151,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 148, N)) WHEN   152,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 132, N)) WHEN   153,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 180, N)) WHEN   154,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 164, N)) WHEN   155,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 212, N)) WHEN   156,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 196, N)) WHEN   157,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 244, N)) WHEN   158,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 228, N)) WHEN   159,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 146, N)) WHEN   160,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 130, N)) WHEN   161,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 178, N)) WHEN   162,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 162, N)) WHEN   163,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 210, N)) WHEN   164,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 194, N)) WHEN   165,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 242, N)) WHEN   166,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 226, N)) WHEN   167,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 18, N)) WHEN   168,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 2, N)) WHEN   169,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 50, N)) WHEN   170,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 34, N)) WHEN   171,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 82, N)) WHEN   172,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 66, N)) WHEN   173,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 114, N)) WHEN   174,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 98, N)) WHEN   175,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 81, N)) WHEN   176,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 65, N)) WHEN   177,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 113, N)) WHEN   178,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 97, N)) WHEN   179,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 17, N)) WHEN   180,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 1, N)) WHEN   181,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 49, N)) WHEN   182,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 33, N)) WHEN   183,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 209, N)) WHEN   184,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 193, N)) WHEN   185,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 241, N)) WHEN   186,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 225, N)) WHEN   187,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 145, N)) WHEN   188,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 129, N)) WHEN   189,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 177, N)) WHEN   190,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 161, N)) WHEN   191,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 93, N)) WHEN   192,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 77, N)) WHEN   193,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 125, N)) WHEN   194,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 109, N)) WHEN   195,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 29, N)) WHEN   196,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 13, N)) WHEN   197,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 61, N)) WHEN   198,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 45, N)) WHEN   199,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 221, N)) WHEN   200,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 205, N)) WHEN   201,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 253, N)) WHEN   202,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 237, N)) WHEN   203,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 157, N)) WHEN   204,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 141, N)) WHEN   205,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 189, N)) WHEN   206,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 173, N)) WHEN   207,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 158, N)) WHEN   208,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 142, N)) WHEN   209,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 190, N)) WHEN   210,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 174, N)) WHEN   211,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 222, N)) WHEN   212,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 206, N)) WHEN   213,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 254, N)) WHEN   214,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 238, N)) WHEN   215,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 30, N)) WHEN   216,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 14, N)) WHEN   217,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 62, N)) WHEN   218,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 46, N)) WHEN   219,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 94, N)) WHEN   220,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 78, N)) WHEN   221,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 126, N)) WHEN   222,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 110, N)) WHEN   223,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 24, N)) WHEN   224,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 8, N)) WHEN   225,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 56, N)) WHEN   226,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 40, N)) WHEN   227,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 88, N)) WHEN   228,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 72, N)) WHEN   229,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 120, N)) WHEN   230,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 104, N)) WHEN   231,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 152, N)) WHEN   232,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 136, N)) WHEN   233,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 184, N)) WHEN   234,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 168, N)) WHEN   235,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 216, N)) WHEN   236,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 200, N)) WHEN   237,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 248, N)) WHEN   238,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 232, N)) WHEN   239,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 219, N)) WHEN   240,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 203, N)) WHEN   241,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 251, N)) WHEN   242,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 235, N)) WHEN   243,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 155, N)) WHEN   244,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 139, N)) WHEN   245,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 187, N)) WHEN   246,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 171, N)) WHEN   247,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 91, N)) WHEN   248,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 75, N)) WHEN   249,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 123, N)) WHEN   250,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 107, N)) WHEN   251,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 27, N)) WHEN   252,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 11, N)) WHEN   253,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 59, N)) WHEN   254,
                STD_LOGIC_VECTOR(TO_UNSIGNED( 43, N)) WHEN   255;
END ARCHITECTURE;
---------------------------------------------------------------------------------