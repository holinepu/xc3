\ https://t.me/c/1445095419/2177    RISC-V- 16 BIT ISA

0  value  (Rd')
0  value  (Rs')
0  value  (Rs1')
0  value  (Rs2') 



:  3Rd.check     3R.check  ;
:  3Rs.check     3R.check  ;

:  3Rs1.check    3R.check  ;
:  3Rs2.check    3R.check  ;

:  5Rd.check     5R.check  ;
:  5Rs1.check    5R.check  ;

:  3Rd'.check   3R'.check  ;
:  3Rs'.check   3R'.check  ;

:  3Rs1'.check  3R'.check  ;
:  3Rs2'.check  3R'.check  ;

:  5Rd'.check   5R'.check  ;
:  5Rs2'.check  5R'.check  ;

\ :  11#.check   11#.check  ;


:  ?>?       ( n a b -- n1 )  >r  2^n  and  if  r>  2^n  else  r>drop  0  then  ;
:  ?~?>#     ( # high.bit low.bit -- #' )   >r  1f  swap  -  dup>r  lshift  2r>  +  rshift  ;
:  #>?~?     ( # high.bit low.bit -- )      >r  1f  swap  -  dup>r  lshift  r>  rshift  r> lshift  ;
:  ?~?>?~?   ( # 4 1  11 8 -- )  2>r  ?~?>#   2r>  #>?~?   ;

:  [5~4,9~6,2,3]>[12~11,10~7,6,5]     ( # -- #' )  >r
   r@   5  4   0c  0b    ?~?>?~?
   r@   9  6   0a   7    ?~?>?~?  +
   r@      2   6           ?>?    +
   r>      3   5           ?>?    +   ;

:  [12~11,10~7,6,5]>[5~4,9~6,2,3]     ( a' n -- a' # )    dup  16@'  >r
   r@    0c  0b   5  4   ?~?>?~?
   r@    0a   7   9  6   ?~?>?~?  +
   r@         6   2        ?>?    +
   r>         5   3        ?>?    +   ;

: `3f8#[5~4,9~6,2,3]3rd'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f8#[5~4,9~6,2,3]3rd'2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f8#[5~4,9~6,2,3]3rd'2c"  #=if2 ."  4  2  13p^  [12~11,10~7,6,5]>[5~4,9~6,2,3]  4p"  .2"   mnem"  xt0
   does>    ( Rd' # a )   to (a)   8#.check  to  (#)    3Rd'.check  to  (Rd')
     (a)    @
     (Rd')  4   2   >?~?                      +
     (#)    [5~4,9~6,2,3]>[12~11,10~7,6,5]    +
     16,'   ;

    original.mnemonic?  on         0000  3f8#[5~4,9~6,2,3]3rd'2c:   addispn_R,#
    original.mnemonic?  off        0000  3f8#[5~4,9~6,2,3]3rd'2c:   R+(sp+#)
    original.mnemonic?  off        0000  3f8#[5~4,9~6,2,3]3rd'2c:   R+(rp+#)

                                                     :  R+(sp)  0  R+(sp+#)  ;
                                                     :  R+(rp)  0  R+(rp+#)  ;
\ =============================================================================================
\  3f3#[5~3]3rs'2#[7~6]3rd'2c         fld_R,R,#  fsd_R,R,#    fldsp_R,R,#   lw_Rd',Rs',#     flwsp_R,R,#

:  [5~3,7~6]>[12~10,6~5]    ( # -- #' )  >r
   r@   5  3  0c  0a    ?~?>?~?
   r>   7  6   6   5    ?~?>?~?  +  ;

:  [12~10,6~5]>[5~3,7~6]    ( a' n -- a' # )    dup  16@'  >r
   r@    0c  0a   5  3   ?~?>?~?
   r>     6   5   7  6   ?~?>?~?  +   ;

: `3f3#[5~3]3rs1'2#[7~6]3rd'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[7~6]3rd'2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[7~6]3rd'2c"   #=if2 ."  4  2  12p^  9  7  13p^  [12~10,6~5]>[5~3,7~6]  4p"  .3"   mnem"  xt0
   does>    ( Rd' Rs1' # a )   to (a)   5#.check  to  (#)   3Rs'.check  to  (Rs1')     3Rd'.check  to  (Rd')
     (a)      @
     (Rd')    4   2     >?~?          +
     (Rs1')   9   7     >?~?          +
     (#)      [5~3,7~6]>[12~10,6~5]   +
     16,'  ;

  original.mnemonic?  on                  2000  3f3#[5~3]3rs1'2#[7~6]3rd'2c:   fld_R,R,#
  original.mnemonic?  off                 2000  3f3#[5~3]3rs1'2#[7~6]3rd'2c:   fR=(fR+#)d
\ =============================================================================================
: `3f3#[5~3]3rs1'2#[7~6]3rs2'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[7~6]3rs2'2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[7~6]3rs2'2c"   #=if2 ."  4  2  12p^  9  7  13p^  [12~10,6~5]>[5~3,7~6]  4p"  .3"   mnem"  xt0
   does>    ( rs2' Rs1' # a )   to (a)   5#.check  to  (#)   3Rs'.check  to  (Rs1')     3rs2'.check  to  (Rs2')
     (a)      @
     (rs2')   4   2     >?~?          +
     (Rs1')   9   7     >?~?          +
     (#)      [5~3,7~6]>[12~10,6~5]   +
     16,'  ;

\ : `3f3#[5~3]3rs1'2#[7~6]3rs2'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[7~6]3rs2'2c:' ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[7~6]3rs2'2c"  #=if2 ." 9  7  12p^  [12~10,6~5]>[5~3,7~6]  3p  4  2  14p^"  .3"   mnem"  xt0
   does>    ( rs2' Rs' # a )   to (a)   5#.check  to  (#)   3Rs'.check  to  (Rs1')     3rs2'.check  to  (Rs2')
     (a)      @
     (rs2')   4   2     >?~?          +
     (Rs1')   9   7     >?~?          +
     (#)      [5~3,7~6]>[12~10,6~5]   +
     16,'  ;

  original.mnemonic?  on                  a000  3f3#[5~3]3rs1'2#[7~6]3rs2'2c:   fsd_R,R,#
  original.mnemonic?  off                 a000  3f3#[5~3]3rs1'2#[7~6]3rs2'2c:'  (fR+#)=fR,d
\ =============================================================================================
:  [5~3,2,6]>[12~10,6~5]   ( # -- #' )  >r
   r@     5   3   0c  0a   ?~?>?~?
   r@         2    6         ?>?    +
   r>         6    5         ?>?    +    ;

:  [12~10,6~5]>[5~3,2,6]   ( a' n -- a' # )    dup  16@'  >r
   r@    0c  0a    5   3   ?~?>?~?
   r@         6    2         ?>?    +
   r>         5    6         ?>?    +    ;

:  [12~10,6~5]>[5~3,2,6]   ( a' n -- a' # )    dup  16@'  >r
   r@    0c  0a    5   3   ?~?>?~?
   r@         6    2         ?>?    +
   r>         5    6         ?>?    +    ;

: `3f3#[5~3]3rs1'2#[2,6]3rd'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[2,6]3rd'2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[2,6]3rd'2c"   #=if2 ."   4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p"  .3"   mnem"  xt0
   does>    ( Rd' Rs' # a )   to (a)   5#.check  to  (#)    3Rs1'.check  to  (Rs1')   3Rd'.check  to  (Rd')
     (a)      @
     (Rd')    4  2   >?~?             +
     (Rs1')   9  7   >?~?             +
     (#)      [5~3,2,6]>[12~10,6~5]   +
     16,'     ;

  original.mnemonic?  on                  4000  3f3#[5~3]3rs1'2#[2,6]3rd'2c:  lw_R,R,#
  original.mnemonic?  off                 4000  3f3#[5~3]3rs1'2#[2,6]3rd'2c:  R=(R+#)
                                                                :  R=(R)  0  R=(R+#)  ;

  original.mnemonic?  on                  6000  3f3#[5~3]3rs1'2#[2,6]3rd'2c:  flw_R,R,#
  original.mnemonic?  off                 6000  3f3#[5~3]3rs1'2#[2,6]3rd'2c:  fR=(fR+#)
                                                              :  fR=(fR)  0  fR=(fR+#)  ;
\ =============================================================================================
: `3f3#[5~3]3rs1'2#[2,6]3rs2'2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[2,6]3rs2'2c"   #=if2 ."   4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p"  .3"   mnem"  xt0
   does>    ( rs2' Rs' # a )   to (a)   5#.check  to  (#)    3Rs1'.check  to  (Rs1')   3rs2'.check  to  (Rs2')
     (a)      @
     (Rs2')   4  2   >?~?             +
     (Rs1')   9  7   >?~?             +
     (#)      [5~3,2,6]>[12~10,6~5]   +
     16,'     ;

\ : `3f3#[5~3]3rs1'2#[2,6]3rs2'2c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:'  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[5~3]3rs1'2#[2,6]3rs2'2c"   #=if2 ."   9  7  12p^   [12~10,6~5]>[5~3,2,6]  3p   4  2  14p^ "  .3"   mnem"  xt0
   does>    ( Rs1' # Rs2' a )   to (a)   3Rs2'.check  to  (Rs2')   5#.check  to  (#)    3Rs1'.check  to  (Rs1')
     (a)      @
     (Rs1')   9  7   >?~?             +
     (Rs2')   4  2   >?~?             +
     (#)      [5~3,2,6]>[12~10,6~5]   +
     16,'     ;

  original.mnemonic?  on                  c000  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:   sw_R,R,#
  original.mnemonic?  off                 c000  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:'  (R+#)=R
                                                          :  (R)=R    0 swap   (R+#)=R  ;
  original.mnemonic?  on                  e000  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:   fsw_R,R,#
  original.mnemonic?  off                 e000  3f3#[5~3]3rs1'2#[2,6]3rs2'2c:'  (fR+#)=fR
\ =============================================================================================
\ =============================================================================================
\ =============================================================================================
\  3f1#[5]3rs'5#[4~3,8~6]3rd'2c         fldsp_R,R,#   lw_Rd',Rs',#     flwsp_R,R,#

:  [5,4~3,8~6]>[12,6~2]    ( # -- #' )  >r
   r@         5   0c            ?>?
   r@    4    3    6    5     ?~?>?~?  +
   r>    8    6    4    2     ?~?>?~?  +  ;

:  [12,6~2]>[5,4~3,8~6]     ( a' n -- a' # )   dup  16@'  >r
   r@        0c    5            ?>?
   r@    6    5    4    3     ?~?>?~?  +
   r>    4    2    8    6     ?~?>?~?  +  ;

: `3f1#[5]5rd#[4~3,8~6]2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[5]5rd#[4~3,8~6]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_ ." `3f1#[5]5rd#[4~3,8~6]2c"   #=if2 ."  0b 7 13p^  [12,6~2]>[5,4~3,8~6]  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )   to (a)   5#.check  to  (#)       5rd.check  to  (Rd)
     (a)  @
     (Rd)    0b   7     >?~?         +
     (#)     [5,4~3,8~6]>[12,6~2]    +
     16,'    ;

  original.mnemonic?  on              2002   3f1#[5]5rd#[4~3,8~6]2c:   fldsp_R,#
  original.mnemonic?  off             2002   3f1#[5]5rd#[4~3,8~6]2c:   fR=(rp+#)d

  original.mnemonic?  on              6002   3f1#[5]5rd#[4~3,8~6]2c:   ldsp_R,#
  original.mnemonic?  off             6002   3f1#[5]5rd#[4~3,8~6]2c:   R=(rp+#)d
\ =============================================================================================
:  [5,4~2,7~6]>[12,6~2]    ( # -- #' )  >r
   r@         5   0c            ?>?
   r@    4    2    6    4     ?~?>?~?  +
   r>    7    6    3    2     ?~?>?~?  +  ;

:  [12,6~2]>[5,4~2,7~6]     ( a' n -- a' # )    dup  16@'  >r
   r@        0c    5            ?>?
   r@    6    4    4    2     ?~?>?~?  +
   r>    3    2    7    6     ?~?>?~?  +  ;

: `3f1#[5]5rd#[4~2,7~6]2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[5]5rd#[4~2,7~6]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_ ." `3f1#[5]5rd#[4~2,7~6]2c"   #=if2 ."  0b 7 13p  [12,6~2]>[5,4~2,7~6]  4p "  .2"   mnem"  xt0
   does>    ( Rd # a )   to (a)   5#.check ( *4 )  to  (#)       5rd.check  to  (Rd)
     (a)  @
     (Rd)    0b   7     >?~?         +
     (#)     [5,4~2,7~6]>[12,6~2]    +
     16,'    ;


  original.mnemonic?  on              4002   3f1#[5]5rd#[4~2,7~6]2c:   lwsp_R,#
  original.mnemonic?  off             4002   3f1#[5]5rd#[4~2,7~6]2c:   R=(rp+#)
                                                         : R=(rp)  0  R=(rp+#)  ;
  original.mnemonic?  on              6002   3f1#[5]5rd#[4~2,7~6]2c:   flwsp_R,#
  original.mnemonic?  off             6002   3f1#[5]5rd#[4~2,7~6]2c:   fR=(rp+#)
\ =============================================================================================
\  3f1#[5]5rd5#[4~0]2c               addi_Rd,#    li_Rd,#       lui_Rd,#
\  3f1#[5]5rd'5#[4~0]2c        srli_Rd,#     srai_Rd,#     andi_R,#    slli_R,#

:  [5,4~0]>[12,6~2]     ( # -- #' )  >r
   r@      5   0c         ?>?
   r>   4  0   6   2    ?~?>?~?   +   ;

\ :  2's  ( # -- #1 )  negate  ;

: -[5,4~0]>[12,6~2]     ( # -- #' )  negate  >r
   r@      5   0c         ?>?
   r>   4  0   6   2    ?~?>?~?   +   ;

:  [12,6~2]>[5,4~0]     ( a' n -- a' # )    dup  16@'  >r
   r@     0c   5          ?>?
   r>   6  2   4   0    ?~?>?~?   +   ;

:  6#.sign.extend   ( n -- n1 )  dup  20  and  if   ffffffc0  or  then  ;

:  [12,6~2]>[5,4~0]x  ( a' -- a' # )  [12,6~2]>[5,4~0]   6#.sign.extend   ;


:  -[12,6~2]>[5,4~0]     ( a' n -- a' # )    dup  16@'  >r
   r@     0c   5          ?>?
   r>   6  2   4   0    ?~?>?~?   +   6#.sign.extend   abs  ;

: `3f1#[5]5rd5#[4~0]2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[5]5rd5#[4~0]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1#[5]5rd5#[4~0]2c"   #=if2 ."  0b  7  13p   [12,6~2]>[5,4~0]x  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )    to (a)   5#.check  to  (#)    5Rd.check   to (Rd)
     (a)    @
     (Rd)   0b  7   >?~?        +
     (#)    [5,4~0]>[12,6~2]    +
     16,'   ;

   original.mnemonic?  on          0002  3f1#[5]5rd5#[4~0]2c:   slli_R,#
   original.mnemonic?  off         0002  3f1#[5]5rd5#[4~0]2c:   R<<#

   original.mnemonic?  on          4001  3f1#[5]5rd5#[4~0]2c:   li_R,#
   original.mnemonic?  off         4001  3f1#[5]5rd5#[4~0]2c:   R=#
\ =============================================================================================
: `3fx5rd5#[4~0]2c   ( a' -- a' opcode )  dup  16@'  f003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3fx5rd5#[4~0]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3fx5rd5#[4~0]2c"   #=if2 ."  0b  7  13p  -[12,6~2]>[5,4~0]  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )    to (a)   5#.check  to  (#)    5Rd.check   to (Rd)
     (a)    @
     (Rd)   0b  7   >?~?        +
     (#)   -[5,4~0]>[12,6~2]    +
     16,'   ;



: `3fx5rd5#[4~0]2c   ( a' -- a' opcode )  dup  16@'  f003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3fx5rd5#[4~0]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3fx5rd5#[4~0]2c"   #=if2 ."  0b  7  13p  -[12,6~2]>[5,4~0]  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )    to (a)   5#.check  to  (#)    5Rd.check   to (Rd)
     (a)    @
     (Rd)   0b  7   >?~?        +
     (#)   -[5,4~0]>[12,6~2]    +
     16,'   ;

: bit  ( b -- n )  2^n  and  ;

: `3fx5rd5#[4~0]2c   ( a' -- a' opcode )  dup  16@'  f003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3fx5rd5#[4~0]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3fx5rd5#[4~0]2c"   #=if2 ."  0b  7  13p  -[12,6~2]>[5,4~0]  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )    to (a)   5#.check  to  (#)    5Rd.check   to (Rd)
     (a)    @                         dup 0c bit  >r
     (Rd)   0b  7   >?~?        +
     (#)    [5,4~0]>[12,6~2]    or    r>  if   1000  or  then
     16,'   ;





   original.mnemonic?  on          0001  3fx5rd5#[4~0]2c:   addi_R,#
   original.mnemonic?  off         0001  3fx5rd5#[4~0]2c:   R+#

   original.mnemonic?  on          1001  3fx5rd5#[4~0]2c:   subi_R,#
   original.mnemonic?  off         1001  3fx5rd5#[4~0]2c:   R-#
\  --------------------------------------------------------------------------------------------
: `3f1#[5]2c3rd'5#[4~0]2c   ( a' -- a' opcode )  dup  16@'  ec03  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[5]2c3rd'5#[4~0]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1#[5]2c3rd'5#[4~0]2c"   #=if2 ."  9 7  13p^   [12,6~2]>[5,4~0]  4p"  .2"   mnem"  xt0
   does>    ( Rd' # a )   to (a)   6#.check  to  (#)    3rd'.check  to (Rd')
     (a)    @
     (Rd)   9   7   >?~?        +
     (#)    [5,4~0]>[12,6~2]    +
     16,'   ;
   original.mnemonic?  on          8001  3f1#[5]2c3rd'5#[4~0]2c:   srli_R,#
   original.mnemonic?  off         8001  3f1#[5]2c3rd'5#[4~0]2c:   R>>#

   original.mnemonic?  on          8401  3f1#[5]2c3rd'5#[4~0]2c:   srai_R,#
   original.mnemonic?  off         8401  3f1#[5]2c3rd'5#[4~0]2c:   R>>#,a

   original.mnemonic?  on          8801  3f1#[5]2c3rd'5#[4~0]2c:   andi_R,#
   original.mnemonic?  off         8801  3f1#[5]2c3rd'5#[4~0]2c:   Rn#
\ =============================================================================================
:  [17,16~12]>[12,6~2]     ( # -- #' )  >r
   r@       11   0c         ?>?
   r>   10  0c    6   2   ?~?>?~?   +   ;

:  [12,6~2]>[17,16~12]     ( a' -- a' # )  dup  16@'  >r
   r@       5   0c          ?>?
   r>   6   2   10   0c   ?~?>?~?   +   ;

: `3f1#[17]5rd5#[16~12]2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[17]5rd5#[16~12]2c:  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1#[17]5rd5#[16~12]2c"   #=if2 ."  0b  7  13p   [12,6~2]>[17,16~12]  4p"  .2"   mnem"  xt0
   does>    ( Rd # a )   to (a)   5#.check  to  (#)    5Rd.check  to (Rd)
     (a)    @
     (Rd)   0b  7   >?~?          +
     (#)    [17,16~12]>[12,6~2]   +
     16,'   ;

   original.mnemonic?  on          6001  3f1#[17]5rd5#[16~12]2c:   lui_R,#
   original.mnemonic?  off         6001  3f1#[17]5rd5#[16~12]2c:   R=#,u
\ =============================================================================================
: bit.n=0?   ( # n -- f )   2^n  and  ;

:  [11,4,9~8,10,6,7,3~1,5]>[12~2]    ( # -- #' )  >r
   r@        0b   0c         ?>?
   r@         4   0b         ?>?     +
   r@     9   8   0a   9   ?~?>?~?   +
   r@        0a    8         ?>?     +
   r@         6    7         ?>?     +
   r@         7    6         ?>?     +
   r@     3   1    5   3   ?~?>?~?   +                  
   r>         5    2         ?>?     +   dup 0b bit.n=0?   if  fffff000  or  then  (a') +  2 + ;
                                                   \
:  [12~2]>[11,4,9~8,10,6,7,3~1,5]     ( a' n -- a' # )    dup  16@'  >r
   r@        0c   0b         ?>?
   r@        0b    4         ?>?     +
   r@    0a   9    9   8   ?~?>?~?   +
   r@         8   0a         ?>?     +
   r@         7    6         ?>?     +
   r@         6    7         ?>?     +
   r@     5   3    3   1   ?~?>?~?   +
   r>         2    5         ?>?     +   dup 0b  bit.n=0?  if  fffff000  or  then  (a') +  ;

: `3f11#[11,4,9~8,10,6,7,3~1,5]2c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f11#[11,4,9~8,10,6,7,3~1,5]2c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f11#[11,4,9~8,10,6,7,3~1,5]2c"   #=if2 ."    [12~2]>[11,4,9~8,10,6,7,3~1,5]  4p"  .1"   mnem"  xt0
   does>    ( # a )   to (a)   11#.check  to  (#)
     (a)    @
     (#)    [11,4,9~8,10,6,7,3~1,5]>[12~2]   +
     16,'   ;

     original.mnemonic?  on         2001   3f11#[11,4,9~8,10,6,7,3~1,5]2c:   jal_#
     original.mnemonic?  off        2001   3f11#[11,4,9~8,10,6,7,3~1,5]2c:   call_#

     original.mnemonic?  on         a001   3f11#[11,4,9~8,10,6,7,3~1,5]2c:   j_#
     original.mnemonic?  off        a001   3f11#[11,4,9~8,10,6,7,3~1,5]2c:   jmp_#
\ =============================================================================================
\  3f1c2c3rd'2c3rs2'2c        sub_Rd',Rs'  xor_Rd',Rs'    or_Rd',Rs'    and_Rd',Rs'  subw_Rd',Rs'   addw_Rd',Rs'   subw_Rd',Rs'
: `3f1c2c3rd'2c3rs2'2c    ( a' -- a' opcode )  dup  16@'  fc63  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1c2c3rd'2c3rs2'2c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1c2c3rd'2c3rs2'2c"   #=if2 ."   9  7  13p^   4  2  14p^"  .2"   mnem"  xt0
   does>    ( Rd' Rs' a )   to (a)   5Rs2'.check  to  (Rs2')     3Rd'.check  to  (Rd')
     (a)      @
     (Rd')    9   7   >?~?      +
     (Rs2')   4   2   >?~?      +
     16,'   ;

     original.mnemonic?  on          8c01   3f1c2c3rd'2c3rs2'2c:   sub_R,R
     original.mnemonic?  off         8c01   3f1c2c3rd'2c3rs2'2c:   R-R

     original.mnemonic?  on          8c21   3f1c2c3rd'2c3rs2'2c:   xor_R,R
     original.mnemonic?  off         8c21   3f1c2c3rd'2c3rs2'2c:   RxR

     original.mnemonic?  on          8c41   3f1c2c3rd'2c3rs2'2c:   or_R,R
     original.mnemonic?  off         8c41   3f1c2c3rd'2c3rs2'2c:   RoR

     original.mnemonic?  on          8c61   3f1c2c3rd'2c3rs2'2c:   and_R,R
     original.mnemonic?  off         8c61   3f1c2c3rd'2c3rs2'2c:   RnR
\ ---------------------------------------------------------------------------------------------
     original.mnemonic?  on          9c01   3f1c2c3rd'2c3rs2'2c:   subw_R,R
     original.mnemonic?  off         9c01   3f1c2c3rd'2c3rs2'2c:   R-R,w

     original.mnemonic?  on          9c21   3f1c2c3rd'2c3rs2'2c:   addw_R,R
     original.mnemonic?  off         9c21   3f1c2c3rd'2c3rs2'2c:   R+R,w
\ =============================================================================================
:  [8,4~3][7~6,2~1,5]>[12~10,6~2]    ( # -- #' )  >r
   r@         8   0c         ?>?
   r@     4   3   0b  0a   ?~?>?~?   +
   r@     7   6    6   5   ?~?>?~?   +
   r@     2   1    4   3   ?~?>?~?   +
   r>         5    2         ?>?     +   ;

:  [12~10,6~2]>[8,4~3][7~6,2~1,5]    ( a' n -- a' # )    dup  16@'  >r
   r@        0c    8         ?>?
   r@    0b  0a    4   3   ?~?>?~?   +
   r@     6   5    7   6   ?~?>?~?   +
   r@     4   3    2   1   ?~?>?~?   +
   r>         2    5         ?>?     +   ;

\  3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c      bnez_R,#      beqz_R,#
: `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c"  #=if2 ."  9 7 13p^  [12~10,6~2]>[8,4~3][7~6,2~1,5]  4p" .2"   mnem"  xt0
   does>    ( Rs1' # a )   to (a)   3Rs1'.check  to  (Rs1')
     (a)      @
     (Rs1')   9   7   >?~?                 +
     (#)   [8,4~3][7~6,2~1,5]>[12~10,6~2]  +
     16,'   ;

   original.mnemonic?  on          e001   3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c:   bnez_R,#
   original.mnemonic?  off         e001   3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c:   R<>#?

   original.mnemonic?  on          c001   3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c:   beqz_R,#
   original.mnemonic?  off         c001   3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c:   R=#?
\ =============================================================================================
\  3f1?5rs15?2c  jr_R    jalr_R
: `3f1?5rs15?2c   ( a' -- a' opcode )  dup  16@'  f07f  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1?5rs15?2c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1?5rs15?2c"  #=if2 ."  0b  7  14p" .1"   mnem"  xt0
   does>    ( Rs1 a )   to (a)    5Rs1.check  to  (Rs1)
     (a)      @
     (Rs1)    0b  7  >?~?    +
     16,'   ;

   original.mnemonic?  on                8002  3f1?5rs15?2c:   jr_R
   original.mnemonic?  off               8002  3f1?5rs15?2c:   jmp_R

   original.mnemonic?  on                9002  3f1?5rs15?2c:   jalr_R
   original.mnemonic?  off               9002  3f1?5rs15?2c:   call_R
\ =============================================================================================
\  3f1c5rd5rs22c     mv_R,R,#
: `3f1c5rd5rs22c    ( a' -- a' opcode )  dup  16@'  F003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1c5rd5rs22c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1c5rd5rs22c  "  #=if2 ."  0b 7 13p  6  2  14p   "   .2"   mnem"  xt0
   does>    ( Rd Rs2 a )   to (a)   3Rs2.check  to  (Rs2)    3Rd.check  to  (Rd)
     (a)      @
     (Rd)    0b   7   >?~?   +
     (Rs2)    6   2   >?~?   +
     16,'   ;

   original.mnemonic?  on          8002   3f1c5rd5rs22c:   mv_R,R
   original.mnemonic?  off         8002   3f1c5rd5rs22c:   R=R

   original.mnemonic?  on          9002   3f1c5rd5rs22c:   add_R,R
   original.mnemonic?  off         9002   3f1c5rd5rs22c:   R+R
\ =============================================================================================
:  [5~3,8~7]>[12~7]       ( # -- #' )  >r
   r@     5   3   0c  0a  ?~?>?~?
   r>     8   7    9   8  ?~?>?~?   +   ;

:  [12~7]>[5~3,8~7]       ( a' n -- a' # )    dup  16@'  >r
   r@    0c  0a   5   3   ?~?>?~?
   r>     9   8   8   7   ?~?>?~?   +   ;

\  3f6#[5~3,8~7]5rs22c     fsdsp_R,#    fswsp_R,#
: `3f6#[5~3,8~7]5rs22c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f6#[5~3,8~7]5rs22c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f6#[5~3,8~7]5rs22c"  #=if2 ." 6  2  13p   [12~7]>[5~3,8~7]  4p" .2"   mnem"  xt0
   does>    ( Rs2 # a )   to (a)   3Rs2.check  to  (Rs2)    6#.check  to  (#)
     (a)      @
     (Rs2)    6   2   >?~?       +
     (#)      [5~3,8~7]>[12~7]   +
     16,'   ;

\  3f6#[5~3,8~7]5rs22c     fsdsp_R,#    fswsp_R,#
\ : `3f6#[5~3,8~7]5rs22c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f6#[5~3,8~7]5rs22c:'   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f6#[5~3,8~7]5rs22c"  #=if2 ."   [12~7]>[5~3,8~7]  3p 6  2  14p  " .2"   mnem"  xt0
   does>    ( Rs2 # a )   to (a)   3Rs2.check  to  (Rs2)    6#.check  to  (#)
     (a)      @
     (Rs2)    6   2   >?~?       +
     (#)      [5~3,8~7]>[12~7]   +
     16,'   ;

   original.mnemonic?  on          a002   3f6#[5~3,8~7]5rs22c:   fsdsp_R,#
   original.mnemonic?  off         a002   3f6#[5~3,8~7]5rs22c:'  (rp+#)=fR,d
\ =============================================================================================  
:  [5~2,7~6]>[12~7]        ( # -- #' )  >r
   r@     5   2   0c   9   ?~?>?~?
   r>     7   6    8   7   ?~?>?~?   +   ;

:  [12~7]>[5~2,7~6]        ( a' n -- a' # )    dup  16@'  >r
   r@    0c   9    5   2   ?~?>?~?
   r>     8   7    7   6   ?~?>?~?   +   ;

\  3f6#[5~2,7~6]5rs22c     fsdsp_R,#    fswsp_R,#
: `3f6#[5~2,7~6]5rs22c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f6#[5~2,7~6]5rs22c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f6#[5~2,7~6]5rs22c"  #=if2 ." 6  2  13p   [12~7]>[5~2,7~6]  4p" .2"   mnem"  xt0
   does>    ( Rs2 # a )   to (a)   6#.check  to  (#)    3Rs2.check  to  (Rs2)
     (Rs2)    6   2   >?~?       +
     (#)      [5~2,7~6]>[12~7]   +
     16,'   ;

\  3f6#[5~2,7~6]5rs22c     fsdsp_R,#    fswsp_R,#
\ : `3f6#[5~2,7~6]5rs22c    ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f6#[5~2,7~6]5rs22c:'  ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f6#[5~2,7~6]5rs22c"  #=if2 ."  [12~7]>[5~2,7~6]  3p   6  2  14p  " .2"   mnem"  xt0
   does>    ( # Rs2 a )   to (a)   3Rs2.check  to  (Rs2)   6#.check  to  (#)
     (a)      @
     (Rs2)    6   2   >?~?       +
     (#)      [5~2,7~6]>[12~7]   +
     16,'   ;

   original.mnemonic?  on          c002   3f6#[5~2,7~6]5rs22c:   swsp_R,#
   original.mnemonic?  off         c002   3f6#[5~2,7~6]5rs22c:'  (rp+#)=R
                                            :  (rp)=R  0  swap  (rp+#)=R  ;
   original.mnemonic?  on          e002   3f6#[5~2,7~6]5rs22c:   fswsp_R,#
   original.mnemonic?  off         e002   3f6#[5~2,7~6]5rs22c:'  (rp+#)=fR
\ =============================================================================================
\  16c:   nop
: `16c    ( a' -- a' opcode )  dup  16@'  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  16c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `16c"  #=if2 ."               "     .0"   mnem"  xt0
   does>    ( a )   to (a)
     (a)      @
     16,'   ;

(  original.mnemonic?  on   )      0000   16c:   nop
\  original.mnemonic?  off         0000   16c:   nop
\ =============================================================================================
:  [9,4,6,8~7,5]>[12,6~2]   ( # -- #' )  >r
   r@         9    0c         ?>?
   r@         4     6         ?>?     +
   r@         6     5         ?>?     +
   r@     8   7     4   3   ?~?>?~?   +
   r>         5     2         ?>?     +   ;

:  [12,6~2]>[9,4,6,8~7,5]   ( a' n -- a' # )     dup  16@'  >r
   r@        0c     9         ?>?
   r@         6     4         ?>?     +
   r@         5     6         ?>?     +
   r@     4   3     8   7   ?~?>?~?   +
   r>         2     5         ?>?     +   ;

\  3f1#[9][4,6,,8~7,5]2c     addi16sp_#
: `3f1#[9][4,6,,8~7,5]2c   ( a' -- a' opcode )  dup  16@'  e003  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  3f1#[9][4,6,,8~7,5]2c:   ( opcode -- )  >in @  bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_  ." `3f1#[9][4,6,,8~7,5]2c"  #=if2 ."  [12,6~2]>[9,4,6,8~7,5]   4p" .1"   mnem"  xt0
   does>    ( Rs2 # a )   to (a)    6#.check  to  (#)
     (a)      @
     (#)      [9,4,6,8~7,5]>[12,6~2]   +
     16,'   ;
   original.mnemonic?  on      6101  3f1#[9][4,6,,8~7,5]2c:  addi16sp_#
   original.mnemonic?  off     6101  3f1#[9][4,6,,8~7,5]2c:  sp+#*16
   original.mnemonic?  off     6101  3f1#[9][4,6,,8~7,5]2c:  rp+#*16


