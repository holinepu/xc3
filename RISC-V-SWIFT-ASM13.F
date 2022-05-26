\ http://re-eject.gbadev.org/files/ThumbRefV2-beta.pdf  cortex M0 instruction set
\ from  D:\win32for\RISC-V-ASSEMBLER139+PCTF+ASM31e.F  --> RISC-V-swift-ASM10.f
\ pctf119.f
\ https://sourceforge.net/projects/win32forth/files/latest/download          win32Forth 6.15.05
hex
create       r'.stack       100 allot
variable     r'.counter
: >r'     4  r'.counter     +!   r'.stack     r'.counter    @  +  !  ;
: r@'                            r'.stack     r'.counter    @  +  @  ;
: r>'                            r'.stack     r'.counter    @  +  @     -4  r'.counter  +!  ;
: dup>r'     dup    >r'      ;
: r>drop'    r>'    drop     ;
: r+!'       r>'    +   >r'  ;

create       r''.stack      100 allot
variable     r''.counter
: >r''    4  r''.counter    +!   r''.stack    r''.counter   @  +  !  ;
: r@''                           r''.stack    r''.counter   @  +  @  ;
: r>''                           r''.stack    r''.counter   @  +  @     -4  r''.counter   +!  ;
: dup>r''    dup    >r''    ;
: r>drop''   r>''   drop    ;
: r+!''      r>''   +       >r''  ;

create       r'''.stack     100 allot
variable     r'''.counter
: >r'''   4  r'''.counter   +!   r'''.stack   r'''.counter  @  +  !  ;
: r@'''                          r'''.stack   r'''.counter  @  +  @  ;
: r>'''                          r'''.stack   r'''.counter  @  +  @     -4  r'''.counter  +!  ;
: dup>r'''   dup    >r'''   ;
: r>drop'''  r>'''  drop    ;
: r+!'''     r>'''  +       >r'''  ;
\ ----------------------------------------------------------------------------------------



HEX
variable  swiftForth?    \  swiftForth?  on
cr  .( **** press space key to execute swiftForth otherwise win32Forth ****)
          swiftForth?     key  20 ( space key )  =
[if]      on
[else]    off
[then]


swiftForth?  @
[if]
: upc  UPPER  ;

: between  ( a b -- f )  1+  within  ;

: ascii>digit  ( ascii.0~f -- n -1 / ascii 0 )  upper
  dup  41  46  between  if  37 -  -1  exit  then
  dup  30  39  between  if  30 -  -1  exit  then  0  ;

:  enter.8n      ( -- n)     0
   BEGIN      KEY   DUP  0D  =   over  20  =  or  \  space === enter
       IF     DROP  EXIT
       THEN   upc ( base @ )  ascii>digit     \ digit ???
       IF     SWAP  base @  *   +
       ELSE   DROP
       THEN
   AGAIN  ;


:  .NAME  ( cfa -- )  >name  count  type  ;

:  .id(cfa)   ( cfa -- )   .NAME  ;

:  getxy   ( -- x y )  GET-XY   ;
:  gotoxy  ( x y -- )  AT-XY    ;

 \ :  ?y  ( x -- )    getxy  nip  gotoxy  ;   \  win32Forth
   :  ?y  ( x -- )   get-xy  nip   at-xy  ;   \ swaiftForth
[else]
VERSION#   ( 61400 )  decimal  420000  430000  between   hex
  [if]     ( #if )     20  ' .s  79  +  c!    ' u.r ' .s  54  +   !    \  h is removed from .s  \ .r is replaced by u.r  \ win32for 4.2.671
  [else]   ( #else )   20  ' .s  75  +  c!    ' u.r ' .s  50  +   !    \  h is removed from .s  \ .r is replaced by u.r  \ win32for 6.15.05
  [then]   ( #then )

VERSION#   ( 61400 )  decimal  420000  430000  between   hex
  [if]     ( #if )
: STRING>CFA            ( ADDR$ LENGTH ... CFA -1/ 2954 0 )   \ TEMP1$   31 32 33 34 xx xx xx ....
  FIND-BUFFER  PLACE  FIND-BUFFER  ?UPPERCASE      (FIND)  ;  \          ||
  [else]   ( #else )
: STRING>CFA             ( ADDR$ LENGTH ... CFA -1/ 2954 0 )   \ TEMP1$   31 32 33 34 xx xx xx ....
  FIND-BUFFER PLACE  FIND-BUFFER  ?UPPERCASE   CAPS-FIND   ;  \ designed by Albert (FIND) ;
  [then]   ( #then )

20  '  .smax  4  +  !   \  20 was 8
:  .id(cfa)  ( cfa -- )  >name  nfa-count  1f  and  type  ;
:  ?y  ( x -- )    getxy  nip  gotoxy  ;   \  win32Forth

:  enter.8n      ( -- n)     0
   BEGIN      KEY   DUP  0D  =   over  20  =  or  \  space === enter
       IF     DROP  EXIT
       THEN   upc   base @  digit     \ digit ??? in swiftForth
       IF     SWAP  base @  *   +
       ELSE   DROP
       THEN
   AGAIN  ;
[then]

:  2tuck  ( 1 2 3 4 -- 3 4 1 2 3 4 )  2dup  2>r  2swap  2r>  ;
:  2nip   ( 1 2 3 4 -- )  2swap  2drop  ;

:  2xor   ( 1 2 3 4 -- 1 0 )  rot  xor  >r  xor  r>  ;  \ ^
:  2or    ( 1 2 3 4 -- 3 6 )  rot  or   >r  or   r>  ;  \ |
:  2and   ( 1 2 3 4 -- 1 0 )  rot  and  >r  and  r>  ;  \ &

:  00h   0  ;
:  01h   1  ;
:  02h   2  ;
:  03h   3  ;
:  04h   4  ;
:  05h   5  ;
:  06h   6  ;
:  07h   7  ;
:  08h   8  ;
:  09h   9  ;

variable  cfa.of.----

:  ---- ;

swiftForth?  @
[if]    here
[else]  '  ----
[then]     ----  cfa.of.----  !

      '  ----  ,        \     ----'                ,     \  ,jmp   \   0
      '  ----  ,        \     dump.all             ,     \  ,jmp   \   1  ctrl A
(     '  ----  ,     )  '     binary               ,     \  ,jmp   \   2  ctrl B
(     '  ----  ,     )  '     2/                   ,     \  ,jmp   \   3  ctrl C
(     '  ----  ,     )  '     decimal              ,     \  ,jmp   \   4  ctrl D
      '  ----  ,        \     erase.rom.700~77f    ,     \  ,jmp   \   5  ctrl E
      '  ----  ,        \     ----'                ,     \  ,jmp   \   6  ctrl F
(     '  ----  ,     )  '     >=                   ,     \  ,jmp   \   7  ctrl G
(     '  ----  ,     )  '     hex                  ,     \  ,jmp   \   8  ctrl H
(     '  ----  ,     )  '     ---- ( QUERY-INTERPRET )     ,     \  ,jmp   \   9  ctrl I
      '  ----  ,        \     ----'                ,     \  ,jmp   \  0a  ctrl J
      '  ----  ,        \     ----'                ,     \  ,jmp   \  0b  ctrl K
(     '  ----  ,     )  '     <=                   ,     \  ,jmp   \  0c  ctrl L
      '  ----  ,        \     ----    ( CR )       ,     \  ,jmp   \  0d  ctrl M
(     '  ----  ,     )  '     negate               ,     \  ,jmp   \  0e  ctrl N
(     '  ----  ,     )  '    dnegate               ,     \  ,jmp   \  0f  ctrl O
(     '  ----  ,     )  '    dnegate ( ?????? )    ,     \  ,jmp   \  10  ctrl P
      '  ----  ,        \     ----'                ,     \  ,jmp   \  11  ctrl Q
      '  ----  ,        \     ----'                ,     \  ,jmp   \  12  ctrl R
      '  ----  ,        \     !.rom.7xx            ,     \  ,jmp   \  13  ctrl S
      '  ----  ,        \     test                 ,     \  ,jmp   \  14  ctrl T
      '  ----  ,        \     ----'                ,     \  ,jmp   \  15  ctrl U
      '  ----  ,        \     ----'                ,     \  ,jmp   \  16  ctrl V
      '  ----  ,        \     !.rom                ,     \  ,jmp   \  17  ctrl W
      '  ----  ,        \     ----'                ,     \  ,jmp   \  18  ctrl X
      '  ----  ,        \     ----'                ,     \  ,jmp   \  19  ctrl Y
      '  ----  ,        \     ----'                ,     \  ,jmp   \  1a  ctrl Z
(     '  ----  ,     )  '     quit                 ,     \  ,jmp   \  1b  ctrl esc
      '  ----  ,        \     ----'                ,     \  ,jmp   \  1c  ctrl \
      '  ----  ,        \     ----'                ,     \  ,jmp   \  1d  ctrl ]
      '  ----  ,        \     ----'                ,     \  ,jmp   \  1e
      '  ----  ,        \     ----'                ,     \  ,jmp   \  1f
      '  ----  ,        \     ----    ( SPACE )    ,     \  ,jmp   \  20
(     '  ----  ,     )  '     !                    ,     \  ,jmp   \  21   !
      '  ----  ,        \     ----'                ,     \  ,jmp   \  22   "
      '  ----  ,        \     ----'                ,     \  ,jmp   \  23
      '  ----  ,        \     ----'                ,     \  ,jmp   \  24   $
      '  ----  ,        \     ----'                ,     \  ,jmp   \  25   %
      '  ----  ,        \     ----'                ,     \  ,jmp   \  26   &
(     '  ----  ,     )  '     ---- ( '_INTERPRET ) ,     \  ,jmp   \  27   '      ' name
      '  ----  ,        \     >r                   ,     \  ,jmp   \  28   (
      '  ----  ,        \     r>                   ,     \  ,jmp   \  29   )
(     '  ----  ,     )  '     *                    ,     \  ,jmp   \  2a   *
(     '  ----  ,     )  '     +                    ,     \  ,jmp   \  2b   +
      '  ----  ,        \     ----'                ,     \  ,jmp   \  2c   ,
(     '  ----  ,     )  '     -                    ,     \  ,jmp   \  2d   -
(     '  ----  ,     )  '     .                    ,     \  ,jmp   \  2e   .
(     '  ----  ,     )  '     /                    ,     \  ,jmp   \  2f   /

(     '  ----  ,     )  '     00h                  ,     \  ,jmp   \  30   0
(     '  ----  ,     )  '     01h                  ,     \  ,jmp   \  31   1
(     '  ----  ,     )  '     02h                  ,     \  ,jmp   \  32   2
(     '  ----  ,     )  '     03h                  ,     \  ,jmp   \  33   3
(     '  ----  ,     )  '     04h                  ,     \  ,jmp   \  34   4
(     '  ----  ,     )  '     05h                  ,     \  ,jmp   \  35   5
(     '  ----  ,     )  '     06h                  ,     \  ,jmp   \  36   6
(     '  ----  ,     )  '     07h                  ,     \  ,jmp   \  37   7
(     '  ----  ,     )  '     08h                  ,     \  ,jmp   \  38   8
(     '  ----  ,     )  '     09h                  ,     \  ,jmp   \  39   9
(     '  ----  ,     )  '     ----                 ,     \  ,jmp   \  3a   :
(     '  ----  ,     )  '     ----                 ,     \  ,jmp   \  3b   ;
(     '  ----  ,     )  '     <                    ,     \  ,jmp   \  3c   <    <
(     '  ----  ,     )  '     =                    ,     \  ,jmp   \  3d   =    =
(     '  ----  ,     )  '     >                    ,     \  ,jmp   \  3e   >    >
(     '  ----  ,     )  '     ?                    ,     \  ,jmp   \  3f   ?    ?

(     '  ----  ,     )  '     @                    ,     \  ,jmp   \  40   @    @
(     '  ----  ,     )  '     abort                ,     \  ,jmp   \  41   A
(     '  ----  ,     )  '     EXECUTE              ,     \  ,jmp   \  42   B   branch
(     '  ----  ,     )  '     .S                   ,     \  ,jmp   \  43   C   content of data stack
(     '  ----  ,     )  '     ENTER.8n             ,     \  ,jmp   \  44   D
(     '  ----  ,     )  '     ENTER.8n             ,     \  ,jmp   \  45   E
      '  ----  ,        \     file                 ,     \  ,jmp   \  46   F
(     '  ----  ,     )  '     >=                   ,     \  ,jmp   \  47   G
      '  ----  ,        \     help                 ,     \  ,jmp   \  48   H
(     '  ----  ,     )  '     2nip                 ,     \  ,jmp   \  49   I
      '  ----  ,        \     ----'                ,     \  ,jmp   \  4a   J
      '  ----  ,        \     ----'                ,     \  ,jmp   \  4b   K
(     '  ----  ,     )  '     <=                   ,     \  ,jmp   \  4c   L
(     '  ----  ,     )  '     Max                  ,     \  ,jmp   \  4d   M
(     '  ----  ,     )  '     2AnD                 ,     \  ,jmp   \  4e   N
(     '  ----  ,     )  '     2oR                  ,     \  ,jmp   \  4f   O    2or

(     '  ----  ,     )  '     2drop                ,     \  ,jmp   \  50   P    2drop
      '  ----  ,        \    -2rot                 ,     \  ,jmp   \  51   Q   -2rot
(     '  ----  ,     )  '     2rot                 ,     \  ,jmp   \  52   R    2rot
(     '  ----  ,     )  '     2swap                ,     \  ,jmp   \  53   S    2swap
(     '  ----  ,     )  '     2tuck                ,     \  ,jmp   \  54   T    2tuck
(     '  ----  ,     )  '     2dup                 ,     \  ,jmp   \  55   U    2dup
(     '  ----  ,     )  '     2over                ,     \  ,jmp   \  56   V    2over
(     '  ----  ,     )  '     between ( words )    ,     \  ,jmp   \  57   W
(     '  ----  ,     )  '     2xOR                 ,     \  ,jmp   \  58   X    2xor
      '  ----  ,        \     ----'                ,     \  ,jmp   \  59   Y
      '  ----  ,        \     ----'                ,     \  ,jmp   \  5a   Z
      '  ----  ,        \     c@.reg               ,     \  ,jmp   \  5b   [
      '  ----  ,        \     ----'                ,     \  ,jmp   \  5c   \
      '  ----  ,        \     c!.reg               ,     \  ,jmp   \  5d   ]
      '  ----  ,        \     ----'                ,     \  ,jmp   \  5e   ^
(     '  ----  ,     )  '     d-                   ,     \  ,jmp   \  5f   _

(     '  ----  ,     )  '     EXECUTE              ,     \  ,jmp   \  60   `
(     '  ----  ,     )  '     QUIT                 ,     \  ,jmp   \  61   a
(     '  ----  ,     )  '     EXECUTE              ,     \  ,jmp   \  62   b
(     '  ----  ,     )  '     .S                   ,     \  ,jmp   \  63   c
(     '  ----  ,     )  '     ENTER.8n             ,     \  ,jmp   \  64   d
(     '  ----  ,     )  '     ENTER.8n             ,     \  ,jmp   \  65   e
      '  ----  ,        \     file                 ,     \  ,jmp   \  66   f
(     '  ----  ,     )  '     >=                   ,     \  ,jmp   \  67   g    >=     greater than
      '  ----  ,        \     help                 ,     \  ,jmp   \  48   H    help
(     '  ----  ,     )  '     nip                  ,     \  ,jmp   \  69   i    nip
      '  ----  ,        \     ----'                ,     \  ,jmp   \  6a   j
      '  ----  ,        \     ----'                ,     \  ,jmp   \  6b   k
(     '  ----  ,     )  '     <=                   ,     \  ,jmp   \  6c   l    <=     lower than
(     '  ----  ,     )  '     mIN                  ,     \  ,jmp   \  6d   m    min
(     '  ----  ,     )  '     aNd                  ,     \  ,jmp   \  6e   n    aNd
(     '  ----  ,     )  '     Or                   ,     \  ,jmp   \  6f   o    Or

(     '  ----  ,     )  '     droP                 ,     \  ,jmp   \  70   p    droP
(     '  ----  ,     )  '    -ROT                  ,     \  ,jmp   \  71   q   -Rot
(     '  ----  ,     )  '     Rot                  ,     \  ,jmp   \  72   r    Rot
(     '  ----  ,     )  '     Swap                 ,     \  ,jmp   \  73   s    Swap
(     '  ----  ,     )  '     Tuck                 ,     \  ,jmp   \  74   t   Tuck
(     '  ----  ,     )  '     dUp                  ,     \  ,jmp   \  75   u    dUp
(     '  ----  ,     )  '     oVer                 ,     \  ,jmp   \  76   v    oVer
(     '  ----  ,     )  '     within  ( words )    ,     \  ,jmp   \  77   w    words
(     '  ----  ,     )  '     xor                  ,     \  ,jmp   \  78   x    xor
      '  ----  ,        \     *d                   ,     \  ,jmp   \  79   y    *d        8bit*8bit=16bit
(     '  ----  ,     )  '     um*                  ,     \  ,jmp   \  7a   z    um*      u16bit*u16bit=u32bit
      '  ----  ,        \     d*                   ,     \  ,jmp   \  7b   {    d*       u16bit*u16bit=u16bit
(     '  ----  ,     )  '     d+                   ,     \  ,jmp   \  7c   |    d+
      '  ----  ,        \     d/                   ,     \  ,jmp   \  7d   }    d/  ( 16bit 16bit -- 16bit )  ( nL nH dL dH -- qL qH )
      '  ----  ,        \     2>r                  ,     \  ,jmp   \  7e   ~    2>r
      '  ----  ,        \     2r>                  ,     \  ,jmp   \  7f       2r>   ctrl <-  backspace

variable  xx
swiftForth?  @
[if]      1
[else]   0b
[then]   xx   !

: ascii>addr  ( ascii.code -- a )    4  *   cfa.of.----  @  +  xx @  +  fffffffc  and  ;
: ascii>cfa      ( ascii.code -- cfa )  ascii>addr  @  ;

: pctF     BEGIN  cr  .s  KEY  ascii>cfa  execute  AGAIN  ;
: tF  pctF  ;   \ pico Farad   nF  uF  mF
\ ============================================================================
:  emit*  ( ch -- )  dup>r  if  r@   1  1f  between  if   ." ctrl "  r@  40 +  emit  else   r@   emit   then   else  ." null  "  then  r>drop   ;
//
:  help   ( -- )  20  0
   do       cr    80   0
     do     i ?y   i   j +   3 .r   2  spaces    i   j +   emit*  2  spaces   i   j  +   ascii>cfa  .id(cfa)   20
     +loop
   loop     cr  ;

:  >pctf  ( cfa ascii -- )  ascii>addr  !  ;

  '  help    'h'  >pctf
  '  help    'H'  >pctf

  '  here    'H'  >pctf
  '  ,       ','  >pctf



  '  xor     '^'  >pctf
  '  or      '|'  >pctf
  '  and     '&'  >pctf

  '  mod     '%'  >pctf

  '  0=      'Z'  >pctf



\ '  Asysst    1 ( ctrl_A )   cfa>n.in.xKEY
\ '  Forth     6 ( ctrl_F )   cfa>n.in.xKEY
\ =======================================================================================================
0  value  pc'
:  pc'+1  ( -- )    pc'  1+  to  pc'  ;

:  byte.code.processor  ( -- )
   begin  pc'  c@  ascii>addr  @  ( cfa )  execute  pc'+1  pc' c@  0=
   until  ;

:  16@   ( a -- n )   w@  ;
:  16,   ( n -- )     w,  ;
:  lit'  ( -- n )     pc' 1+  16@  pc' 3 + to pc'  ;

\ : xc,   xram  c,  
:  <pc'>    ']'   c,  ;
:  <lit>    '['   c,  ;
:  <dup>    'u'   c,  ;
:  <drop>   'p'   c,  ;
:  <swap>   's'   c,  ;
:  <over>   'v'   c,  ;
:  <rot>    'r'   c,  ;
:  <exit>    0    c,  ;

:  <ctrl_S>  13   c,  ;

:  a>pc  ( a -- )  to  pc'  ;
'  a>pc                14  >pctf    \ ctrl_T

here  to  pc'
'[' c, 6789 16,   'u' c,    'p' c,   'u' c,  '[' c,  1234 16,   0 c,
<lit>  6789 16,  <dup>   <drop>     <dup>    <lit>   1234 16,   <exit>

' byte.code.processor  'y'  >pctf
' byte.code.processor  'Y'  >pctf

' lit'                 '['  >pctf
' pc'                  ']'  >pctf

  help  \  pctf





\ asm31.f

hex           \  include  hlaa12.f
variable  cp'
create    cp0'  10000 allot
: here'  ( -- a' )    cp'   @   ;
: org    ( a' -- )    cp'   !   ;
: allot' ( n -- )     cp'  +!   ;
: a'>a  ( a' -- a )   cp0'  +   ;
: a>a'  ( a -- a' )   cp0'  -   ;

:  8,   ( n -- )    c,  ;
: 16,   ( n -- )    w,  ;
: 32,   ( n -- )     ,  ;

:  8@   ( a -- n )  c@  ;
: 16@   ( a -- n )  w@  ;
: 32@   ( a -- n )   @  ;

:  8!   ( n a -- )  c!  ;
: 16!   ( n a -- )  w!  ;
: 32!   ( n a -- )   !  ;
                               
:  c!'  ( char a' -- )  a'>a   c!  ;
:  8!'  ( char a' -- )  a'>a   c!  ;
: 16!'  ( char a' -- )  a'>a  16!  ;
: 32!'  ( char a' -- )  a'>a    !  ;

:  c@'  ( a' -- char )  a'>a   c@  ;
:  8@'  ( a' -- char )  a'>a   c@  ;
: 16@'  ( a' -- char )  a'>a  16@  ;
: 32@'  ( a' -- char )  a'>a    @  ;

:  c,'  ( n -- )  here'   8!'  1 allot'  ;
:  8,'  ( n -- )  here'   8!'  1 allot'  ;
: 16,'  ( n -- )  here'  16!'  2 allot'  ;
: 32,'  ( n -- )  here'  32!'  4 allot'  ;

\ code 1234->3412  ( 1234 -- 3412 )  XCHG BH,  BL   NEXT C;  \ flip
: 1234->3412   ( 1234 -- 3412 )  ffff  and  100 /mod  swap 100 *  +  ;
: 16,^   ( n -- )  1234->3412  16,'    ;
: ?y     ( x -- )  getxy  nip  gotoxy  ;

\ ' dump  28  +  @  4 = [if]  ( #if )  9  ' dump  28  +  !  [then]   ( #then )  \ 4.2.6xx only
: 10.dump'  ( a' -- )   dup>r  a'>a  10  dump   0 ?y  r> 9 u.r  60 ?y ;
: align*4   ( a' -- a'1 )   3 +  fffffffc  and  ;
: align.10  ( a' -- a'1 )  0f +  fffffff0  and  ;
: dump'     ( a' len -- )  align.10  >r  fffffff0  and  r>   bounds
  ?do    i  10.dump'   10
  +loop  cr    ;
\ ********************************************************
0  value  (a)
0  value  (a')
0  value  (R)
0  value  (Rd)
0  value  (Rd')
0  value  (Rm)
0  value  (Rn)
0  value  (Rs)
0  value  (Rs1)
0  value  (Rs2)
0  value  (#)
0  value  (n0)
0  value  (n1)
0  value  (n2)
0  value  (n3)
0  value  (n4)
0  value  (n5)
0  value  (n6)
0  value  (op.code)
0  value  <<byte>>
0  value  (?p)
0  value  (rel)
0  value  (b)
variable  original.mnemonic?
\ ********************************************************
: >?~?'   ( n n1 n2 -- n' )   nip  lshift  ;

: 1<<?-?1+./mod.swap.>?~?  ( n n1 n2 -- q n' )  2>r  1  2r@ -   1+  lshift  /mod  swap  2r>  >?~?'  ; 

: >?~?   ( n upper lower -- n1 )  nip  lshift  ;
: >?~?+?~?               ( n n3 n2 n1 n0 -- n' )
  to (n0)   to (n1)   to (n2)   to (n3)    \  to (n)
  (n1) (n0)  1<<?-?1+./mod.swap.>?~?  >r
  (n3) (n2)  1<<?-?1+./mod.swap.>?~?  >r     abort" **** number too large ****"  r>  r>  +  ;




\ fedc ba98 7654 3210
\ cccc c### ##mm mddd
: 5c5#3m3d:   ( opcode -- )
  create  ,
  does>   ( Rd Rm # a )  to (a)  to (#)  to (Rm)  to (Rd)
  (a)     @
  (Rd)    2   0   >?~?  +
  (Rm)    5   3   >?~?  +
  (#)    0a   6   >?~?  +
  16,'    ;

  original.mnemonic?  on     0000  5c5#3m3d:  lsl_R,R,#
  original.mnemonic?  off    0000  5c5#3m3d:  R=R<<#

  original.mnemonic?  on     0800  5c5#3m3d:  lsr_R,R,#
  original.mnemonic?  off    0800  5c5#3m3d:  R=R>>#

  original.mnemonic?  on     1000  5c5#3m3d:  asr_R,R,#
  original.mnemonic?  off    1000  5c5#3m3d:  R=R>>#,a

\  here'   1  2  3   R=R<<#   3  4  5   lsr_R,R,#  0  1  2   R=R>>#,a   10 dump'
\ ********************************************************
\ ********************************************************
\ ********************************************************
comment:
  warning   off
variable      original.mnemonic?
:  om ( -- )  original.mnemonic?  dup  @  if  off  else  on  then  ;

create    temp.mnemonic'''   40  allot
: .last.name    last @  count  ( nfa-count )   type  ; \ ???
: .last.name    temp.mnemonic  count  type  ; \ last @  name> ( nfa> ) cfa>cfa'  cfa'>.id  drop  (  nfa-count  type ) ;
: erase.temp.mnemonic  ( -- )  temp.mnemonic  40  erase  ;
: >temp.mnemonic  ( from len -- )  erase.temp.mnemonic  ( from len )  dup  temp.mnemonic  c!   temp.mnemonic 1+  swap  cmove  ;
: >temp.mnemonic  ( from len -- )  erase.temp.mnemonic  ( from len )  temp.mnemonic  place  ;

: :.mnem_''''  ( -- )  cr  ." : "     .last.name  '_' emit   original.mnemonic? @
  if     34 ( 30 ) ?y  ." original.mnemonic? @  not  if  0  exit  then"
  then   cr  2 ?y  ;
comment;

: .8#        ( n ... )  0 <#  # # # #  # # # #  #>  type  ;
: .xxxxxxxx  ( n ... )  0 <#  # # # #  # # # #  #>  type  ;
: .xxxxxxx   ( n ... )  0 <#  # # # #  # # #    #>  type  ;
: .xxxxxx    ( n ... )  0 <#  # # # #  # #      #>  type  ;
: .xxxxx     ( n ... )  0 <#  # # # #  #        #>  type  ;
: .xxxx      ( n ... )  0 <#  # # # #          #>  type  ;
: .xxx       ( n ... )  0 <#  # # #            #>  type  ;
: .xx        ( n ... )  0 <#  # #              #>  type  ;
: .x         ( n ... )  0 <#  #                #>  type  ;

: .8#'       ( n -- )  1d ( 29 ) ?y   .8#  space  ;

:  #=if1     .8#'  ." = if (1 "  ;
:  #=if2     .8#'  ." = if (2 "  ;
:  #=if3     .8#'  ." = if (3 "  ;
:  #=if4     .8#'  ." = if (4 "  ;

:  .'"'    '"'  emit  ;
variable  n"?    \  n"?  on   \ 0"  1"  2"  3"  4"  --->  ."
n"?  @
[if]  ( #if )
:    .0"      5f ?y  ."   0"      .'"'     space   ;
:    .1"      5f ?y  ."   1"      .'"'     space   ;
:    .2"      5f ?y  ."   2"      .'"'     space   ;
:    .3"      5f ?y  ."   3"      .'"'     space   ;
:    .4"      5f ?y  ."   4"      .'"'     space   ;
[else]   ( #else )
:    .0"      5f ?y  ."   ."      .'"'     space   ;
:    .1"      5f ?y  ."   ."      .'"'     space   ;
:    .2"      5f ?y  ."   ."      .'"'     space   ;
:    .3"      5f ?y  ."   ."      .'"'     space   ;
:    .4"      5f ?y  ."   ."      .'"'     space   ;
[then]   ( #then )

: xt0 ( -- )  cr  62 ?y   ." exit then 0 ;"  ;
\ :  xt0     cr  +\?   @  if     else  62  ?y  ." exit then 0 ;"  then  yes.etc  ;

:  5#.check  ( # -- # )  dup  0      1f   between   0=    abort"  **** # should be 0 ~ 1f ****"  ;
:  6#.check  ( # -- # )  dup  0      3f   between   0=    abort"  **** # should be 0 ~ 3f ****"  ;
:  8#.check  ( # -- # )  dup  0      ff   between   0=    abort"  **** # should be 0 ~ ff ****"  ;
:  8#*4.check  ( # -- # )  4 / dup  0      ff   between   0=    abort"  **** # should be 0 ~ ff*4  ****"  ;
: 20#.CHECK  ( # -- # )  dup  0  0FFFFF   BETWEEN   NOT   ABORT"  # RANGE IS NOT  0 ~ FFFFF "    ;
: mnem"  ( -- )  66 ?y .last.name   '"' emit    ;
variable   (4?      (4?  on
: >?~?     ( n n1 n2 -- n' )   nip  lshift  ;
variable   h.mode                \  1  h.mode  !
variable   make.macro?
variable  .b=1?
: .b=1    .b=1? @  if  ."  b=1"  then ;

variable  .(.8a?     .(.8a?  on
: .XXXXxxxx  ( N ... )  0 <#  # # # # # # # #  #>  TYPE  ;
: .xxxxxxxx(h)    h.mode @  0<>  if  drop  (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a          0f          between  if  7 spaces  '0' emit   .x         (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a0         0ff         between  if  6 spaces  '0' emit   .xx        (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a00        0fff        between  if  5 spaces  '0' emit   .xxx       (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a000       0ffff       between  if  4 spaces  '0' emit   .xxxx      (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a0000      0fffff      between  if  3 spaces  '0' emit   .xxxxx     (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a00000     0ffffff     between  if  2 spaces  '0' emit   .xxxxxx    (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a000000    0fffffff    between  if    space   '0' emit   .xxxxxxx   (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
   dup  0a0000000   0ffffffff   between  if            '0' emit   .xxxxxxxx  (4?    @ if else 50 (4?    @ if drop else ?y then then exit   then
                             ( getxy >r 3 - r> gotoxy )            9  u.r    (4?    @ if else 50 (4?    @ if drop else ?y then then  ;

: .\.(      ( ---- )  make.macro? @  if   ." \ (  "   else  ."   (  "  then  ;

: (.12345678..55.............)    ( a -)  .(.8a? @  if  .\.(  dup  .xxxxxxxx  space  1  bounds  do  space  i  c@' .xx  loop 0f spaces ."  ) " exit then 10 ?y  drop ;
: (.12345678..55.66..........)    ( a -)  .(.8a? @  if  .\.(  dup  .xxxxxxxx  space  2  bounds  do  space  i  c@' .xx  loop 0c spaces ."  ) " exit then 10 ?y  drop ;
: (.12345678..55.66.77.......)    ( a -)  .(.8a? @  if  .\.(  dup  .xxxxxxxx  space  3  bounds  do  space  i  c@' .xx  loop  9 spaces ."  ) " exit then 10 ?y  drop ;
: (.12345678..55.66.77.88....)    ( a -)  .(.8a? @  if  .\.(  dup  .xxxxxxxx  space  4  bounds  do  space  i  c@' .xx  loop  6 spaces ."  ) " exit then 10 ?y  drop ;

: 3p  ( -- )  3c  ?y  8 u.r  ;
: 4p  ( -- )  46  ?y  8 u.r  ;
: 34y ( -- )  34  ?y         ;

: 1p  ( n -- )  28 ?y   8 u.r  ;
: 2p  ( n -- )  32 ?y   8 u.r  ;
: 3p  ( n -- )  3c ?y   8 u.r  ;
: 4p  ( n -- )  46 ?y   8 u.r  ;   \ 37

: (1  ( a' -- 2 a' )  dup  (.12345678..55.............)    1  34y   2dup   to <<byte>>   to (a')  ;
: (2  ( a' -- 2 a' )  dup  (.12345678..55.66..........)    2  34y   2dup   to <<byte>>   to (a')  ;
: (3  ( a' -- 2 a' )  dup  (.12345678..55.66.77.......)    3  34y   2dup   to <<byte>>   to (a')  ;
: (4  ( a' -- 2 a' )  dup  (.12345678..55.66.77.88....)    4  34y   2dup   to <<byte>>   to (a')  ;

: max.min  ( n1 n2 -- max min )  2dup  max  -rot  min  ;

: ?~?.mask ( bit.n1 bit.n2 -- mask )   max.min  2>r   ffffffff  r> lshift   ffffffff  1f  r>  -  rshift  and  ;

: 4,?~?    ( a' ? ? -- n )   ?~?.mask  swap  <<byte>> 2 = if  16@'  else  32@'  then  and  ;

: a'@      (  -- n )    (a')  32@'  ;
                    
: ?~?>      ( a' n1 n0 -- n' )   to (n0)   to (n1)   a'@  to (op.code)
  (a') (n1) (n0)  4,?~?  (n0)  rshift     ;

: ?~?+?~?>               ( a'                   n3 n2 n1 n0 -- n' )
  to (n0)   to (n1)   to (n2)   to (n3)                                                               a'@  to (op.code)
  (a') (n1) (n0)  4,?~?                     (n0)    rshift
  (a') (n3) (n2)  4,?~?  (n2)  (n1)  -  1-  (n0) +  rshift  +  ; 

: ?~?+?~?+?~?>           ( a'             n5 n4 n3 n2 n1 n0 -- n' )
  to (n0)   to (n1)   to (n2)   to (n3)   to (n4)   to (n5)                                           a'@  to (op.code)
  (a') (n1) (n0)  4,?~?  (n0)               rshift
  (a') (n3) (n2)  4,?~?  (n2)  (n1)  -  1-  rshift  +
  (a') (n5) (n4)  4,?~?  (n2)  (n1)  -  1-  rshift  (n4)  (n3)  -  1-  rshift  +  ;

:  11p      ( n1 n2 -- )   1  to (?p)  ?~?>  1p  ;
:  12p      ( n1 n2 -- )   2  to (?p)  ?~?>  2p  ;
:  13p      ( n1 n2 -- )   3  to (?p)  ?~?>  3p  ;
:  14p      ( n1 n2 -- )   4  to (?p)  ?~?>  4p  ;
:  14p^     ( n1 n2 -- )   4  to (?p)  ?~?>  1234->3412     4p  ;
:  14p.8rel ( n1 n2 -- )   4  to (?p)  ?~?>  (a')  here' -  4p  ;


:  11p>#  ( n1 n2 -- )  1  to (?p)  ?~?>  dup  to (#)   1p  ;
:  12p>#  ( n1 n2 -- )  2  to (?p)  ?~?>  dup  to (#)   2p  ;
:  13p>#  ( n1 n2 -- )  3  to (?p)  ?~?>  dup  to (#)   3p  ;
:  14p>#  ( n1 n2 -- )  4  to (?p)  ?~?>  dup  to (#)   4p  ;

:  11p#   ( n1 n2 -- )  1  to (?p)  ?~?>  dup  to (#)   1p  ;
:  12p#   ( n1 n2 -- )  2  to (?p)  ?~?>  dup  to (#)   2p  ;
:  13p#   ( n1 n2 -- )  3  to (?p)  ?~?>  dup  to (#)   3p  ;
:  14p#   ( n1 n2 -- )  4  to (?p)  ?~?>  dup  to (#)   4p  ; 

:  11p1   ( n1 n2 -- )  1  to (?p)  ?~?>  dup  to (Rs1) 1p  ;
:  12p1   ( n1 n2 -- )  2  to (?p)  ?~?>  dup  to (Rs1) 2p  ;
:  13p1   ( n1 n2 -- )  3  to (?p)  ?~?>  dup  to (Rs1) 3p  ;
:  14p1   ( n1 n2 -- )  4  to (?p)  ?~?>  dup  to (Rs1) 4p  ;

:  11p2   ( n1 n2 -- )  1  to (?p)  ?~?>  dup  to (Rs2) 1p  ;
:  12p2   ( n1 n2 -- )  2  to (?p)  ?~?>  dup  to (Rs2) 2p  ;
:  13p2   ( n1 n2 -- )  3  to (?p)  ?~?>  dup  to (Rs2) 3p  ;
:  14p2   ( n1 n2 -- )  4  to (?p)  ?~?>  dup  to (Rs2) 4p  ;

:  11pd   ( n1 n2 -- )  1  to (?p)  ?~?>  dup  to (Rd)  1p  ;
:  12pd   ( n1 n2 -- )  2  to (?p)  ?~?>  dup  to (Rd)  2p  ;
:  13pd   ( n1 n2 -- )  3  to (?p)  ?~?>  dup  to (Rd)  3p  ;
:  14pd   ( n1 n2 -- )  4  to (?p)  ?~?>  dup  to (Rd)  4p  ;



:  14p[11:0]   ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup  4p  ;
:  14p-[11:0]  ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup  4p  ;

:  14p[11:0]   ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup to (#) 4p  ;
:  14p-[11:0]  ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup to (#) 4p  ;

:  13p[11:0]   ( n1 n2 -- )  3  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup to (#) 3p  ;
:  13p-[11:0]  ( n1 n2 -- )  3  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup to (#) 3p  ;


:  14p#[11:0]   ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup to (#) 4p  ;
:  14p#-[11:0]  ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup to (#) 4p  ;

:  13p#[11:0]   ( n1 n2 -- )  3  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup to (#) 3p  ;
:  13p#-[11:0]  ( n1 n2 -- )  3  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup to (#) 3p  ;


:  21p  ( n1 n2 -- )  1  to (?p)  ?~?+?~?>              1p  ;
:  22p  ( n1 n2 -- )  2  to (?p)  ?~?+?~?>              2p  ;
:  23p  ( n1 n2 -- )  3  to (?p)  ?~?+?~?>              3p  ;
:  24p  ( n1 n2 -- )  4  to (?p)  ?~?+?~?>              4p  ;


:  23p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  dup to (#)  3p  ;
:  24p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  dup to (#)  4p  ;

:  2^n  ( n -- )  1 swap lshift  ;
:  n.bit.sign.extend  ( # n -- # )  dup>r  2^n  over  and  if  -1  r@  lshift  or  then  r> drop ( r>drop )  ;


: 23p[][]  ( 23p[1f:19|0b:7] )   ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  0b  N.BIT.SIGN.EXTEND  dup to (#)  3p  ;
: 24p[][]  ( 24p[1f:19|0b:7] )   ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  0b  N.BIT.SIGN.EXTEND  dup to (#)  4p  ;
\ 2021.12.18

:  31p  ( n1 n2 -- )  1  to (?p)  ?~?+?~?+?~?>          1p  ;
:  32p  ( n1 n2 -- )  2  to (?p)  ?~?+?~?+?~?>          2p  ;
:  33p  ( n1 n2 -- )  3  to (?p)  ?~?+?~?+?~?>          3p  ;
:  34p  ( n1 n2 -- )  4  to (?p)  ?~?+?~?+?~?>          4p  ;





variable  disassem.number.stack.counter
create    disassem.number.stack      4 4 * allot
: and!    ( n a -- )  dup>r   @   and   r>  !  ;

: >disassem.number.stack   ( n -- )   4 disassem.number.stack.counter +!  0c  disassem.number.stack.counter  and!  disassem.number.stack  disassem.number.stack.counter  @ +  !  ;
:  disassem.number.stack>  ( -- n )   disassem.number.stack  disassem.number.stack.counter  @ +  @  -4 disassem.number.stack.counter +!  0c  disassem.number.stack.counter  and!   ;
\ '  disassem.number.stack>  is  _disassem.number.stack>
\ ' >disassem.number.stack   is  _>disassem.number.stack


: 1p  ( n1 n2 -- )  (4?  @  if  <<byte>>  1  =  if  24  else  24  then  ?y  dup >DISASSEM.NUMBER.STACK  .xxxxXXXX(H) else  drop  then  ;
: 2p  ( n1 n2 -- )  (4?  @  if  <<byte>>  2  =  if  2e  else  2e  then  ?y  dup >DISASSEM.NUMBER.STACK  .xxxxXXXX(H) else  drop  then  ;
: 3p  ( n1 n2 -- )  (4?  @  if  <<byte>>  3  =  if  38  else  38  then  ?y  dup >DISASSEM.NUMBER.STACK  .xxxxXXXX(H) else  drop  then  ;
: 4p  ( n1 n2 -- )  (4?  @  if  <<byte>>  4  =  if  42  else  42  then  ?y  dup >DISASSEM.NUMBER.STACK  .xxxxXXXX(H) else  drop  then  ;

:  21p  ( n1 n2 -- )  1  to (?p)  ?~?+?~?>              1p  ;
:  22p  ( n1 n2 -- )  2  to (?p)  ?~?+?~?>              2p  ;
:  23p  ( n1 n2 -- )  3  to (?p)  ?~?+?~?>              3p  ;
:  24p  ( n1 n2 -- )  4  to (?p)  ?~?+?~?>              4p  ;

\  fedc ba98 7654 3210
\  #### #### cccc cccc
: `8#8c     ( a' -- a' opcode )  dup  16@'  00ff  and  ;   \ dup  32@'  00ff  and  ;  \  dup c@'  ;
:  8#8c:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_       ." `8#8c"        #=if2 ."             0f  8  14p"  .1"   mnem"  xt0
   does>    ( # a )   to (a)   8#.check  to  (#)
     (a)  @
     (#)       0f  8  >?~?  +
     16,'   ;

original.mnemonic?  on    00A9    8#8c:   adc_a,#
original.mnemonic?  off   00A9    8#8c:   a+#+c
original.mnemonic?  off   00A9    8#8c:   a+#+
original.mnemonic?  off   00A9    8#8c:   a+#+y

: adc_a,#_                                          original.mnemonic? @  not  if  0  exit  then
  `8#8c                      000000A9 = if (2             0f  8  14p                           ."   adc_a,#"
                                                                                                  exit then 0 ;
: a+#+c_
  `8#8c                      000000A9 = if (2             0f  8  14p                           ."   a+#+c"
                                                                                                  exit then 0 ;
\ -------------------------------------------------------------------------------------------------------------
: dis'   ( a' -- a'1 )  dup to (a')
  adc_a,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit  then \ `8#8c                      000000A9 = if (2             0f  8  14p                           1" adc_a,#"
                                                                                                 \ exit then 0 ;
  a+#+c_
  ?dup if + exit  then \ `8#8c                      000000A9 = if (2             0f  8  14p                           1" a+#+c"
                                                                                                 \ exit then 0 ;
;

: dis  ( a' -- a'1 )  cr  dup>r  dis'  dup  r>  =  if  2 +  then  ;

\  88 a+#+c
\  12a9  16,'   34a9 16,'    56a9 16,'   78a9 16,'

\ 0  dis'   dis'    dis'    dis'
\ *******************************************************************
\ variable  last'
variable  1st.t:?        1st.t:?  on
: here'.align.2  ( -- )  here' 1+ fffffffe and cp' !  ;

\ : t: ( -- )
\  1st.t:?  @  if   0  1st.t:?  off  else  last'  @   then  32,'  \ lfa'
\  here'  last'  !      \ new last'
\  bl word count tuck ( len a len )    here'  a'>a   place        \ nfa'
\  1+  allot'  here'.align.2  ;   \ adjusting here'               \ cfa'

:  r0=#      ;
:  call_r0   ;
:  call_24#  ;

: ,call.cfa'  ( cfa' -- )  here'  over  - abs  7fffff ( 24# )  >  \ stc
  if     r0=#    call_r0
  else   call_24#
  then   ;
                                       \      4AFC
VARIABLE   OP.CODE.OF.CALL       F000D000  OP.CODE.OF.CALL  !

: 0~15<->16~31       DUP  10 RSHIFT SWAP   10 LSHIFT  +  ;

: 24#>5..10#2.j.j11#   ( 24# --> 5.s10#2.j.j11# )   >r
\        r@   00800000  and  ( s   )   if           04000000  else              0     then    \  s
         r@   00800000  and  ( s   )   3 lshift                                               \  s
         r@   00800000  and  ( s   )
if       r@   00400000  and  ( I1  )   if  ( s=1 I1=1 )                      2000  +  then    \  s=1  J1
         r@   00200000  and  ( I2  )   if  ( s=1 I2=1 )                       800  +  then    \  s=1  J2
else     r@   00400000  and  ( I1  )   if  ( s=0 I1=1 )  else  ( s=0 I1=0 )  2000  +  then    \  s=0  J1
         r@   00200000  and  ( I2  )   if  ( s=0 I2=1 )  else  ( s=0 I2=0 )   800  +  then    \  s=0  J2
then     r@   001ff800  and  ( 10# )   5 lshift   +
         r>   000007ff  and  ( 11# )              +    ;

: 4+   4 +  ;
: 24REL.CHECK.CM4       HERE' 4+ - DUP  F8000001  7FFFFFF BETWEEN NOT ABORT" **** relative jump should be within 24# ****" 2/ ;

: ,CALL.CFA' ( cfa' -- )   >R R> 24REL.CHECK.CM4  24#>5..10#2.J.J11# OP.CODE.OF.CALL @ + 0~15<->16~31 32,' ;

: t: ( -- )
  1st.t:?  @  if   0  1st.t:?  off  else  last'  @   then  32,'  \ lfa'
  here'  last'  !      \ new last'
  >in  @  ( >r )
  bl word count tuck ( len a len )    here'  a'>a   place        \ nfa'
  1+  allot'  here'.align.2      \ adjusting here'               \ cfa'
  ( r> )  >in  !
  create   here'   ,
  does> \  @  32,'         ( dtc )  ;   \ ceForth
           @   ,call.cfa'  ( stc )  ;   \ cortex M0/M3  eForth

: count'  ( a' -- a'+1 len )   dup 1+  swap  c@'  ;
: type'   ( a' len -- )  >r  a'>a  r>  type  ;

: words'  ( -- )    last'   @
  begin   cr   dup  count'  1f  and  type'
          dup  4 -  32@'  0<>
  while   4  -  32@'
  repeat  drop  ;

: words'1  ( -- )    last'   @
  begin   cr   dup  4  -  dup  ."   ( lfa'= ) "  9 u.r   32@'  ."  (  "  0c u.r   ."  ) org  t:  "
          dup  count'  1f  and  type'
          dup  4 -  32@'  0<>
  while        4 -  32@'
  repeat  drop  ;

: get.total.word  ( -- n )   0 >r  last'  @
  begin    dup  4 -  32@'  0<>
  while    r> 1+  >r   4  -  32@'
  repeat   drop   r>   ?dup  if  1+  then  ;

variable  #n.word                        

: align.2  ( n -- n' )  1+  fffffffe  and  ;

: nfa'>cfa'  ( nfa' -- cfa' )  count' 1f  and  +  1+  align.2  ;

variable  next.lfa'
: cfa'.to.next.lfa'/here'   ( cfa' -- next.lfa'/here' )  >r  last'  @
  begin   dup   4  -  next.lfa'  !
          dup   4  -  32@'  0<>
  while   dup   nfa'>cfa'  r@  =
    if    dup   last'  @   =
       if       r>  2drop  here'         exit
       else     r>  2drop  next.lfa'  @  exit
       then
    else  4  -  32@'
    then
  repeat  r>drop  ;

: nth.nfa'  ( n -- nfa' -1 / 0 )   0 >r  last' @
  begin  over  r@  =   if    nip  r>drop  -1   exit  then
         r> 1+ >r  4 - 32@'  dup   0=
  until  r>drop  2drop   0  ;

: nth.cfa'  ( n -- cfa' -1 / 0 )  nth.nfa'  if   nfa'>cfa'  -1   else  0 then  ;

: nfa'>nth  ( nfa' -- n -1 / 0 )  0 >r  last' @
  begin  2dup  =   if    2drop  r>  -1   exit  then
         r> 1+ >r  4 - 32@'  dup   0=
  until  r>drop  2drop   0  ;

: cfa'>nfa'  ( cfa' -- nfa' -1 / 0 )  0  swap  get.total.word   0
  do     i   nth.cfa'
    if   over  =  if   2drop   i  nth.nfa'  leave  then
    then
  loop   0=  if  0  else  -1  then  ;

: cfa'>nth  ( cfa' -- nth )  cfa'>nfa'  if  nfa'>nth  else  0  then  ;

: nth>lfa'  ( nth -- lfa' )   nth.nfa'  4  -  ;

: .body  ( cfa' -- )   dup  cfa'.to.next.lfa'/here'  >r  begin  cr  dis  dup  r@  >=  until  r>  2drop  ;

: words'5  ( -- )     0   get.total.word
  ?do         last'   @                         #n.word  off
      begin   #n.word @     i  =             1  #n.word  +!
        if    cr   ."   \"  dup  4  -  dup   9 u.r   32@'   0c u.r
              cr   ."   \"  dup  9  u.r    dup  count'  1f  and   2dup  2>r   ."    "
              over 1-  over 1+  ( 2dup )   bounds  do  space  i c@'  .xx  loop
              cr  30 ?y  ." t:  "  type'   2r>  +  1+  align.2    drop \ .body
        then  dup  4 -  32@'  0<>
      while        4 -  32@'
      repeat  drop   -1
  +loop   ;

0
[if]
  0e  last'  !
  0a  org
  t:  hjjh       12  adc_a,#
  t:  hhhhj      34  adc_a,#
  t:  ghghghgh   56  adc_a,#
  t:  ghghghgh   78  adc_a,#
                            jokklk
  0 99 dump'    words'5
[then]                   
\ *******************************************************************
\ *******************************************************************
\ *******************************************************************
\ *******************************************************************
\ *******************************************************************
\ *******************************************************************


variable  show.addr,data?      show.addr,data?   on
variable  long?     \ long?  on

:  (.12345678..11.22.33.44.............)1
   ( a -) ."   ( " dup  .xxxxxxxx space 4  bounds  do  space  i  c@' .xx  loop  0c spaces ."  ) " ;

:  (.12345678..11.22.33.44.55.66.77.88.)1
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 8  bounds  do  space  i  c@' .xx  loop            ."  ) " ;


:  (.12345678..11223344..........)2
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 4  bounds  do  space  i  32@' .xxxxxxxx  4  +loop   9 spaces ."  ) " ;

:  (.12345678..11223344.55667788.)2
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 8  bounds  do  space  i  32@' .xxxxxxxx  4  +loop            ."  ) " ;



:  (.12345678..11.22.33.44.55.66.77.88.)   ( a' -- )    show.addr,data?  @
   if      long? @  if  (.12345678..11.22.33.44.55.66.77.88.)1  else  (.12345678..11223344.55667788.)2  then
   then    ;


:  (.12345678..11.22.33.44.............)  long? @  if  (.12345678..11.22.33.44.............)1  else  (.12345678..11223344..........)2  then  ;


VARIABLE  space/layer                  2  space/layer  !
: LAYER.ON                space/layer  @  space/layer  !  ;
: LAYER.OFF               space/layer  @  space/layer  !  ;

\ variable  (4?
: \.3f---        (4?    @  if        cr    layer.off  ."   \ "  4f  0 ?do  '-'  emit  loop  then  ;
: \.3f***        (4?    @  if        cr    layer.off  ."   \ "  4f  0 ?do  '*'  emit  loop  then  ;






\ RISC-Vassembler139.f

\ https://github.com/jameslzhu/riscv-card/blob/master/riscv-card.pdf
\ https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

\ **************************************************************************************
\ **************************************************************************************
\ **************************************************************************************
\ comment:       \ RISC-v 32I

\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         funct7            rs2             rs1        funct3        rd             opcode            R-type
\         7f                5r              5r         3f            5r             7c             7f5r5r3f5r7c
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------- -------------- -------- -------------- --------------------
\         imm[11:0]                         rs1        funct3        rd             opcode            I-type
\         12#                               5r         3f            5r             7c             12#5r3f5r7c
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         imm[11:5]         rs2             rs1        funct3    imm[4:0]           opcode            S -type
\         7#                5r              5r         3f            5#             7c             7#[11:5]5r5r3f5#[4:0]7c
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         imm[12|10:5]      rs2             rs1        funct3    imm[4:1|11]        opcode            B-type
\          7#               5r              5r         3f            5#             7c             7#[12|10:5]5r5r3f5#[4:1|11]7c
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------------------------------- -------------- --------------------
\         imm[31:12]                                                 rd             opcode            U-type
\         20#                                                        5r             7c             20#[31:12]5r7c
\ *************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------------------------------- -------------- --------------------
\         imm[20|10:1|11|19:12]                                      rd             opcode            J-type
\         20#                                                        5r             7c             20#[20|10:1|11|19:12]5r7c
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ ************************************************************************************************************
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         funct7            rs2             rs1        funct3        rd             opcode            R-type
\         7f                5r              5r         3f            5r             7c              7f5r5r3f5r7c
\  f  f  f  f  f  f  f  r  r  r  r  r  r  r  r  r  r  f  f  f  r  r  r  r  r  c  c  c  c  c  c  c
\  1  1  1  1* 1  1  1  0* 0  0  0  0* 0  0  0  0* 0  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1     fe00707f  mask
\ --------------------------------------------------------------------------------------------------------------------
\  0  0  0  0  0  0  0                                0  0  0                 0  1  1  0  0  1  1     00000003  add
\  0  1  0  0  0  0  0                                0  0  0                 0  1  1  0  0  1  1     40000003  sub
\  0  0  0  0  0  0  0                                1  0  0                 0  1  1  0  0  1  1     00004003  xor

\  0  0  0  0  0  0  0                                1  1  0                 0  1  1  0  0  1  1     00006003  or
\  0  0  0  0  0  0  0                                1  1  1                 0  1  1  0  0  1  1     00007003  and
\  0  0  0  0  0  0  0                                0  0  1                 0  1  1  0  0  1  1     00001003  sll

\  0  0  0  0  0  0  0                                1  0  1                 0  1  1  0  0  1  1     00005003  srl
\  0  1  0  0  0  0  0                                1  0  1                 0  1  1  0  0  1  1     40005003  sra
\
\  x  x  x  x  x  x  x                                0  1  0                 0  1  1  0  0  1  1     00002033  slt
\  x  x  x  x  x  x  x                                0  1  1                 0  1  1  0  0  1  1     00003033  sltu
\ --------------------------------------------------------------------------------------------------------------------
\  multiply extention
\
\  0  0  0  0  0  0  1                                0  0  0                 0  1  1  0  0  1  1     02000003  mul
\  0  0  0  0  0  0  1                                0  0  1                 0  1  1  0  0  1  1     02001003  mulh
\  0  0  0  0  0  0  1                                0  1  0                 0  1  1  0  0  1  1     02002003  mulsu
\  0  0  0  0  0  0  1                                0  1  1                 0  1  1  0  0  1  1     02003003  mulu
\  0  0  0  0  0  0  1                                1  0  0                 0  1  1  0  0  1  1     02004003  div
\  0  0  0  0  0  0  1                                1  0  1                 0  1  1  0  0  1  1     02005003  divu
\  0  0  0  0  0  0  1                                1  1  0                 0  1  1  0  0  1  1     02006003  rem
\  0  0  0  0  0  0  1                                1  1  1                 0  1  1  0  0  1  1     02007003  remu
0 [if]  {  ( comment: )
   original.mnemonic?  on         02000033  7f5r5r3f5r7c:     mul_R,R,R
   original.mnemonic?  off        02001033  7f5r5r3f5r7c:    mulh_R,R,R
   original.mnemonic?  on         02002033  7f5r5r3f5r7c:   mulsu_R,R,R
   original.mnemonic?  off        02003033  7f5r5r3f5r7c:    mulu_R,R,R
   original.mnemonic?  on         02004033  7f5r5r3f5r7c:     div_R,R,R
   original.mnemonic?  off        02005033  7f5r5r3f5r7c:    divu_R,R,R
   original.mnemonic?  on         02006033  7f5r5r3f5r7c:     rem_R,R,R
   original.mnemonic?  off        02007033  7f5r5r3f5r7c:    remu_R,R,R
\ RV32M Multiply Extension
Inst Name FMT Opcode F3 F7 Description (C)
mul MUL R 0110011 0x0 0x01 rd = (rs1 * rs2)[31:0]
mulh MUL High R 0110011 0x1 0x01 rd = (rs1 * rs2)[63:32]
mulsu MUL High (S) (U) R 0110011 0x2 0x01 rd = (rs1 * rs2)[63:32]
mulu MUL High (U) R 0110011 0x3 0x01 rd = (rs1 * rs2)[63:32]
div DIV R 0110011 0x4 0x01 rd = rs1 / rs2
divu DIV (U) R 0110011 0x5 0x01 rd = rs1 / rs2
rem Remainder R 0110011 0x6 0x01 rd = rs1 % rs2
remu Remainder (U) R 0110011 0x7 0x01 rd = rs1 % rs2
[then]  ( comment; )
0 [if]   { ( comment: ) 
0000000 rs2 rs1 000 rd 0110011 ADD
0100000 rs2 rs1 000 rd 0110011 SUB
0000000 rs2 rs1 001 rd 0110011 SLL
0000000 rs2 rs1 010 rd 0110011 SLT
0000000 rs2 rs1 011 rd 0110011 SLTU
0000000 rs2 rs1 100 rd 0110011 XOR
0000000 rs2 rs1 101 rd 0110011 SRL
0100000 rs2 rs1 101 rd 0110011 SRA
0000000 rs2 rs1 110 rd 0110011 OR
0000000 rs2 rs1 111 rd 0110011 AND
[then]  ( comment; )

variable  upper.bit
variable  lower.bit
variable  target.n
\ ************************************************************************************************************
0 [if]  {  ( comment: )
code   `7f5r5r3f5r7c'   ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `7f5r5r3f5r7c''  ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # ' cp0'.ram      \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # ' cp0'.flash    \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `7f5r5r3f5r7c'''  ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `????   ( a' MASK -- a' op.code )  pop  edx
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , edx               \  TnMASK
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------

' cp0'.flash  99CA8  =     ' cp0'.ram  1A9CD4  =  and

code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , # 0xfe00707f      \  TnFE00707F
       and     ebx , eax               \
next   c;

code   `7f5r5r3f5r7c''''  ( a' -- a' op.code )   push  ebx      mov  ebx , # 0xfe00707f      jmp ' `????   ( a' MASK -- a' op.code )
\ -------------------------------------------------------------------------
code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # ' cp0'.ram      \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # ' cp0'.flash    \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ --------------------------------------------------------------------------
code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  dup
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  @
       mov     eax , # 0xfe00707f      \  TnFE00707F
       and     ebx , eax               \
next   c;
-------------------------------------------------------------------------
}  ( comment; )
[then]
: 3r.check ;
: 5r.check ;

variable  last.instruction.addr
: all.ok?.off  ;







\ ADD     Add
\ ADD Rd, Rs1, Rs2   ======   Rd=Rs1+Rs2

: `7f5r5r3f5r7c   ( a -- a op.code )   dup   32@'  fe00707f  and  ;
:  7f5r5r3f5r7c:  ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,
     :.mnem_ ." `7f5r5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   18  14  14p"  .3"  mnem"  xt0
   does>    ( Rd Rs1 Rs2 a )  to (a)    5r.check  to (Rs2)   5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (Rs2)  18  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ ------------------------------------------------------------------------------------
\  format R
   original.mnemonic?  on         00000033  7f5r5r3f5r7c:  add_R,R,R
   original.mnemonic?  off        00000033  7f5r5r3f5r7c:  R=R+R
                                                                      
   original.mnemonic?  on         40000033  7f5r5r3f5r7c:  sub_R,R,R
   original.mnemonic?  off        40000033  7f5r5r3f5r7c:  R=R-R

   original.mnemonic?  on         00004033  7f5r5r3f5r7c:  xor_R,R,R
   original.mnemonic?  off        00004033  7f5r5r3f5r7c:  R=RxR

   original.mnemonic?  on         00006033  7f5r5r3f5r7c:  or_R,R,R
   original.mnemonic?  off        00006033  7f5r5r3f5r7c:  R=RoR

   original.mnemonic?  on         00007033  7f5r5r3f5r7c:  and_R,R,R
   original.mnemonic?  off        00007033  7f5r5r3f5r7c:  R=RnR

   original.mnemonic?  on         00001033  7f5r5r3f5r7c:  sll_R,R,R
   original.mnemonic?  off        00001033  7f5r5r3f5r7c:  R=R<<R

   original.mnemonic?  on         00005033  7f5r5r3f5r7c:  srl_R,R,R
   original.mnemonic?  off        00005033  7f5r5r3f5r7c:  R=R>>R

   original.mnemonic?  on         40005033  7f5r5r3f5r7c:  sra_R,R,R
   original.mnemonic?  off        40005033  7f5r5r3f5r7c:  R=R>>R,a

   original.mnemonic?  on         00002033  7f5r5r3f5r7c:  slt_R,R,R
   original.mnemonic?  off        00002033  7f5r5r3f5r7c:  R=R<R

   original.mnemonic?  on         00003033  7f5r5r3f5r7c:  sltu_R,R,R
   original.mnemonic?  off        00003033  7f5r5r3f5r7c:  R=R<Ru
                                           
\ 0000000 rs2 rs1 000 rd 0110011 ADD
\ 0100000 rs2 rs1 000 rd 0110011 SUB
\ 0000000 rs2 rs1 001 rd 0110011 SLL
\ 0000000 rs2 rs1 010 rd 0110011 SLT
\ 0000000 rs2 rs1 011 rd 0110011 SLTU
\ 0000000 rs2 rs1 100 rd 0110011 XOR
\ 0000000 rs2 rs1 101 rd 0110011 SRL
\ 0100000 rs2 rs1 101 rd 0110011 SRA
\ 0000000 rs2 rs1 110 rd 0110011 OR
\ 0000000 rs2 rs1 111 rd 0110011 AND
\ --------------------------------------------------------------------------------------
\ multiply extention
0 [if]   { ( comment: ) 
\ RV32M Multiply Extension
Inst Name FMT Opcode F3 F7 Description (C)
mul MUL R 0110011 0x0 0x01 rd = (rs1 * rs2)[31:0]
mulh MUL High R 0110011 0x1 0x01 rd = (rs1 * rs2)[63:32]
mulsu MUL High (S) (U) R 0110011 0x2 0x01 rd = (rs1 * rs2)[63:32]
mulu MUL High (U) R 0110011 0x3 0x01 rd = (rs1 * rs2)[63:32]
div DIV R 0110011 0x4 0x01 rd = rs1 / rs2
divu DIV (U) R 0110011 0x5 0x01 rd = rs1 / rs2
rem Remainder R 0110011 0x6 0x01 rd = rs1 % rs2
remu Remainder (U) R 0110011 0x7 0x01 rd = rs1 % rs2
[then] \ } ( comment; ) 
   original.mnemonic?  on         02000033  7f5r5r3f5r7c:     mul_R,R,R
   original.mnemonic?  off        02000033  7f5r5r3f5r7c:         R=R*R

   original.mnemonic?  on         02001033  7f5r5r3f5r7c:    mulh_R,R,R
   original.mnemonic?  off        02001033  7f5r5r3f5r7c:         R=R*R,h

   original.mnemonic?  on         02002033  7f5r5r3f5r7c:   mulsu_R,R,R
   original.mnemonic?  off        02002033  7f5r5r3f5r7c:         R=R*R,su

   original.mnemonic?  on         02003033  7f5r5r3f5r7c:    mulu_R,R,R
   original.mnemonic?  off        02003033  7f5r5r3f5r7c:         R=R*R,u

   original.mnemonic?  on         02004033  7f5r5r3f5r7c:     div_R,R,R
   original.mnemonic?  off        02004033  7f5r5r3f5r7c:         R=R/R

   original.mnemonic?  on         02005033  7f5r5r3f5r7c:    divu_R,R,R
   original.mnemonic?  off        02005033  7f5r5r3f5r7c:         R=R/R,u

   original.mnemonic?  on         02006033  7f5r5r3f5r7c:     rem_R,R,R
   original.mnemonic?  off        02006033  7f5r5r3f5r7c:         R=R,R,rem

   original.mnemonic?  on         02007033  7f5r5r3f5r7c:    remu_R,R,R
   original.mnemonic?  off        02007033  7f5r5r3f5r7c:         R=R,R,remu
\ --------------------------------------------------------------------------------------
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------- -------------- -------- -------------- --------------------
\         imm[11:0]                         rs1        funct3        rd             opcode            I-type
\         12#                               5r         3f            5r             7c              12#5r3f5r7c
\ ************************************************************************************************************
\  #  #  #  #  #  #  #  #  #  #  #  #  r  r  r  r  r  f  f  f  r  r  r  r  r  c  c  c  c  c  c  c
\  0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0* 0  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1     0000707f  mask
\                                   1           1  1                    1  1        1        1  1
\                                1
\                             1
\  0  0  0  0  0  0  0                                0  0  0                 0  0  1  0  0  1  1     00000013  addi
\  0  1  0  0  0  0  0                                0  0  0                 0  0  1  0  0  1  1     40000013  subi ????
\  0  0  0  0  0  0  0                                1  0  0                 0  0  1  0  0  1  1     00004013  xori
\  0  0  0  0  0  0  0                                1  0  1                 0  0  1  0  0  1  1     00005013  ori
\  0  0  0  0  0  0  0                                1  1  1                 0  0  1  0  0  1  1     00007013  andi


\  0  0  0  0  0  0  0   s  s  s  s  s                0  0  1                 0  0  1  0  0  1  1     00001013  slli
\  0  0  0  0  0  0  0   s  s  s  s  s                0  1  0                 0  0  1  0  0  1  1     00002013  srli
\  0  1  0  0  0  0  0   s  s  s  s  s                0  1  1                 0  0  1  0  0  1  1     40003013  srai  \


\  x  x  x  x  x  x  x                                0  1  0                 0  0  1  0  0  1  1     40002013  slti
\  x  x  x  x  x  x  x                                0  1  1                 0  0  1  0  0  1  1     00003013  sltui

\ imm[11:0]      --rs1-010 --rd--001 0011   SLTI
\ imm[11:0] rs1 111 rd 0010011 ANDI

\ {  ( comment: )
:  2and  ( d1 d2 -- d3 )   >r  rot  and  swap  r>  and  ;
:  2or   ( d1 d2 -- d3 )   >r  rot   or  swap  r>   or  ;
:  2xor  ( d1 d2 -- d3 )   >r  rot  xor  swap  r>  xor  ;

variable  upper.bit
variable  lower.bit
variable  target.n

:  >real.number  ( upper.bit lower.bit target.n -- # )  \  1e 19  5  >real.number
   target.n  !     lower.bit  !     upper.bit  !
   (a')  32@'  1f ( 31 ) upper.bit @  -  dup>r  lshift
   r>  lower.bit @  +   rshift  target.n  @  lshift  ;



:  real.number>  ( # upper.bit lower.bit target.n -- a.piece.of.code )
   target.n  !     lower.bit  !     upper.bit  !
               1f ( 31 ) upper.bit @  -  dup>r  lshift
   r>  lower.bit @  +   rshift  target.n  @  lshift  ;
0 [if]   {
  (  20405CC8  37 01 00 80       )                              2     80000    R=#,u
  (  20405CCC  13 01 81 46       )                    2         2       468    R=R+#
  (  20405CD0  37 02 00 80       )                              4     80000    R=#,u
  (  20405CD4  13 02 82 26       )                    4         4       268    R=R+#
  (  20405CD8  EF C0 4F 93       )                  initflash                   \   7D  20401E0C
  (  20405CDC  37 43 00 80       )                              6     80004    R=#,u
  (  20405CE0  13 03 03 FF       )                    6         6        10    R=R-#
[then]  \ } ( comment; )


\  12bit.sign.extend  ( # -- # )  dup  0b  2^n  and  if  fffff000  or  then  ;

:  20#[31:12]  ( a' -- n )  to (a')  1f  0c  0c   >real.number  ;
:  12#[31:20]  ( a' -- n )  to (a')  1f  14   0   >real.number  0b  n.bit.sign.extend  ;

:  @Rd         ( a' -- n )  to (a')  0b   7   0   >real.number  ;
:  @Rs1        ( a' -- n )  to (a')  13  0f   0   >real.number  ;
:  @Rs2        ( a' -- n )  to (a')  18  14   0   >real.number  ;

:  bs  ;

:  r=#.L_  ( a' -- a' 8 / a' 0 )  dup>r'  32@'     r@' 4+  32@'   2>r
   2r@    0000007f (   mask of R=#,u )   8000707f (   mask of R=R-# )  2and
          00000037 ( opcode of R=#,u )   80000013 ( opcode of R=R-# )  d=
   r@'     @Rd    r@' 4+  @Rs1   =  and
   r@' 4+  @Rd    r@' 4+  @Rs1   =  and
   if      r@'    20#[31:12]    r@' 4+  12#[31:20]  +
           r@'  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." R"  r@' @Rd  .  bs  ." ="  u.  r>'  8   2r> drop  exit
   then
   2r>    0000007f (   mask of R=#,u )  0000707f (   mask of R=R+# )  2and
          00000037 ( opcode of R=#,u )  00000013 ( opcode of R=R+# )  d=
   r@'     @Rd    r@' 4+  @Rs1   =  and
   r@' 4+  @Rs1   r@' 4+  @Rd    =  and
   if      r@'    20#[31:12]    r@' 4+  12#[31:20]  +
           r@'  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." R"  r@' @Rd  .  bs  ." ="  u.  r>'  8   exit
   then    r>'     0   ;

:  ret_  ( a' -- a' 4 / a' 0 )  dup 32@'  8067  =  if  dup  (.12345678..11.22.33.44.............)  34 ?y  ." ret"  \.3F---  4  exit  then  0  ;

variable  dis.push.R/pop.R?            dis.push.R/pop.R?       on
variable  dis.long.number?             dis.long.number?        on
variable  dis.macro.instruction?       dis.macro.instruction?  on

:  dm     dis.macro.instruction?  dup  @  if  off  else  on  then  ;
:  dl     dis.long.number?        dup  @  if  off  else  on  then  ;

:  all.off  ( -- )   dis.macro.instruction?  off    dis.long.number?  off   dis.push.R/pop.R?  off  ;
:  ao   all.off  ;

:  dis.macro.instruction ( a' -- a' 8 / a' 0 )  >r
   r@      32@'  FFC20213  =
   r@  4+  32@'  00322023  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {dup}"    r>  8  exit  then
   r@      32@'  00022183  =
   r@  4+  32@'  00420213  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {drop}"   r>  8  exit  then
   r@      32@'  ffc10113  =
   r@  4+  32@'  00312023  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {push.r}" r>  8  exit  then
   r@      32@'  00012183  =
   r@  4+  32@'  00410113  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {pop.r}"  r>  8  exit  then  r>  0  ;

\  r@      32@'  FFC10113  =
\  r@  4+  32@'  00410113  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {push.R}" r>  8  exit  then  r>  0  ;
\  r@      32@'  00012183  =
\  r@  4+  32@'  00410113  =  and  if  r@  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." {pop.R}"  r>  8  exit  then  r>  0  ;
\
0 [if]   { ( comment: ) 
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         funct7            rs2             rs1        funct3        rd             opcode            R-type
\         7f                5r              5r         3f            5r             7c              7f5r5r3f5r7c
\           0           0           1           1           2           0           2           3
\                           rs2=1           rs1=2                    Rd=0
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         imm[11:5]         rs2             rs1        funct3    imm[4:0]           opcode            -type
\         7#                5r              5r         3f            5#             7c              7#[12|10:5]5r5r3f5#[4:1|11]7c
\                                                     f  f  f                 c  c  c  c  c  c  c
\                                                     1  1  1*            *0  1  1  1* 1  1  1  1     0000707f
\ ************************************************************************************************************
\           0           0           1           1           2           0           2           3
\                           rs2=1           rs1=2                    Rd=0
\  1  1  1  1* 1  1  1  0* 0  0  0  0* 1  1  1  1* 1  1  1  1* 1  1  1  1* 1  1  1  1* 1  1  1  1*
\           F           E           0           F           F           F           F           F

:  dis.push.R_  ( a' -- a' 8 / a' 0 )   >r
   r@      32@'  FFC10113  ( R2-4 )       =
   r@  4+  32@'  FE0FFFFF  and  00012023  =  and    \ (R2+R0)=Rn
   if       r@   (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." push.R"  r@  4+  @Rs2  .  bs   r>  8   exit
   then     r>   0   ;
  \ -------------------------------------------------------------------------------
\ : dis.pop.R_  ( a' -- a' 8 / a' 0 )
\ ************************************************************************************************************
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------- -------------- -------- -------------- --------------------
\         imm[11:0]                         rs1        funct3        rd             opcode            I-type
\         12#                               5r         3f            5r             7c              12#5r3f5r7c
\ ************************************************************************************************************
\  #  #  #  #  #  #  #  #  #  #  #  #  r  r  r  r  r  f  f  f  r  r  r  r  r  c  c  c  c  c  c  c
\  0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0* 0  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1     0000707f  mask
\           0           0           0           1           2           0           8           3
\  0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  1* 0  0  1  0* 0  0  0  0* 1  0  0  0* 0  0  1  1*
\           #=0                             Rs1=2                    Rd=1        Rd=(Rs1+#)    R1=(R2+0)
\
\  original.mnemonic?  on         00002003  12#5r3f5r7c:  lw_R,[R+#]
\  original.mnemonic?  off        00002003  12#5r3f5r7c:  R=(R+#)
\ ************************************************************************************************************
[then] \ } ( comment; ) 
:  dis.push.R_   ( a' -- a' 8 / a' 0 )   >r
   r@      32@'  FFC10113  ( R2-4 )       =
   r@  4+  32@'  FE0FFFFF  and  00012023  =    and    \ (R2+R0)=Rn
   if       r@   (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." push.R"  r@  4+  @Rs2  .  bs   r>  8   exit
   then     r>   0   ;

:  dis.pop.R_    ( a' -- a' 8 / a' 0 )   >r
   r@  4+  32@'  00410113  ( R2+4 )       =
   r@      32@'  FFFFF07F  and  00012003  =    and    \ Rn=(R2+0)
   if       r@   (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." pop.R"   r@      @Rd   .  bs   r>  8   exit
   then     r>   0   ;

\ :{  push.r    ffc10113  32,'   00312023  32,'  };
\               R3=(R2)          R2-4
\               t=(rp)           rp-4
\  :{  pop.r    00012183  32,'   00410113  32,'  };
\ ************************************************************************************************************
\  : 14p[11:0]   14p  ;  \ sign extend ???
:  12#.check.signed  ( # -- # )  dup  -800  7ff  between  not  abort" **** 12# should be between -800 ~ 7ff ****"  fff  and  ;

:  12#.check         ( # -- # )  12#.check.signed   ;

: `12#5r3f5r7c  ( a -- a op.code )   dup   32@'  0000707f  and  ;
:  12#5r3f5r7c:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `12#5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   1f  14  14p[11:0]"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  12#.check  to (#)    5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    1f  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;




:  12#5r3f5r7c:'   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,   
     :.mnem_ ." `12#5r3f5r7c"  #=if4 ."  0b  7  12p  1f  14  13p[11:0]  13  0f  14p "  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  12#.check  to (#)    5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    1f  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ ------------------------------------------------------------------------------------------------------------
: `1#11#5r3f5r7c  ( a -- a op.code )   dup   32@'  8000707f  and  ;
:  1#11#5r3f5r7c:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `1#11#5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  12#.check  to (#)    5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    1f  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

   original.mnemonic?  on         80000013  1#11#5r3f5r7c:  subi_R,R,#
   original.mnemonic?  off        80000013  1#11#5r3f5r7c:  R=R-#
\ ------------------------------------------------------------------------------------------------------------
\  format  I
   original.mnemonic?  on         00000013  12#5r3f5r7c:  addi_R,R,#
   original.mnemonic?  off        00000013  12#5r3f5r7c:  R=R+#

\  original.mnemonic?  on         40000013  12#5r3f5r7c:  subi_R,R,#    ?????????
\  original.mnemonic?  off        40000013  12#5r3f5r7c:  R=R-#         ?????????

:  12.bit.sign.extend  ( # -- )   fffff000  or  1+  ;

:  subi_R,R,#  ( R R # -- ) negate           addi_R,R,#  ;
:  R=R-#       ( R R # -- ) negate                R=R+#  ;
:  R-#         ( R # -- ) ( negate ) >r  dup  r>  R=R-#  ;   \ was ???
:  R+#         ( R # -- )            >r  dup  r>  R=R+#  ;
:  R=#         ( R # -- )            >r   0   r>  R=R+#  ;
\  R=R         ( R R -- )                 0       R=R>># ;   \ ok  but not suggested.
\  R=R         ( R R -- )                 0       R=R+R  ;   \ ok  but not suggested.
\  R=R         ( R R -- )                 0       R=R-R  ;   \ ok  but not suggested.
:  R=R         ( R R -- )                 0       R=R+#  ;   \ ok  much clear.
:  R=-#        ( R # -- )            >r   0   r>  R=R-#  ;
:  R=-R        ( R R -- )            >r   0   r>  R=R-R  ;

   original.mnemonic?  on         00004013  12#5r3f5r7c:  xori_R,R,#
   original.mnemonic?  off        00004013  12#5r3f5r7c:  R=Rx#

:  Rx#         ( R # -- )            >r   0   r>  R=Rx#  ;
:  Rx-#        ( R # -- )    negate  >r   0   r>  Rx#    ;
:  RxR         ( R R -- )            >r  dup  r>  R=RxR  ;

\  imm[11:0] rs1 000 rd 0010011 ADDI
\  imm[11:0] rs1 010 rd 0010011 SLTI
\  imm[11:0] rs1 011 rd 0010011 SLTIU
\  imm[11:0] rs1 100 rd 0010011 XORI
\  imm[11:0] rs1 110 rd 0010011 ORI
\  imm[11:0] rs1 111 rd 0010011 ANDI

\  imm[11:0] rs1 110 rd 0010011 ORI
\  #### #### #### rrrr r110 rrrr r0010011
\  0000 0000 0000 0000 0110 0000 00010011   00006013
   original.mnemonic?  on         00006013  12#5r3f5r7c:  ori_R,R,#
   original.mnemonic?  off        00006013  12#5r3f5r7c:  R=Ro#

:  Ro#    ( R # -- )           >r  dup  r>  R=Ro#  ;
:  Ro-#   ( R # -- )   negate  >r  dup  r>  R=Ro#  ;
:  RoR    ( R R -- )           >r  dup  r>  R=RoR  ;

   original.mnemonic?  on         00007013  12#5r3f5r7c:  andi_R,R,#
   original.mnemonic?  off        00007013  12#5r3f5r7c:  R=Rn#

:  Rn#    ( R # -- )           >r  dup  r>  R=Rn#  ;
:  Rn-#   ( R # -- )   negate  >r  dup  r>  R=Rn#  ;
:  RnR    ( R R -- )           >r  dup  r>  R=RnR  ;

   original.mnemonic?  on         00002013  12#5r3f5r7c:  slti_R,R,#
   original.mnemonic?  off        00002013  12#5r3f5r7c:  R=R<#

   original.mnemonic?  on         00003013  12#5r3f5r7c:  sltiu_R,R,#
   original.mnemonic?  off        00003013  12#5r3f5r7c:  R=Ru<#
\ ----------------------------------------------------------------------------------
\ **********************************************************************************
\ **********************************************************************************
   original.mnemonic?  on         00000003  12#5r3f5r7c:  lb_M[R+#]
                                                                    \ ??????
   original.mnemonic?  off        00000003  12#5r3f5r7c:  R=(R+#)b
                                                                    \ ??????    
   original.mnemonic?  on         00001003  12#5r3f5r7c:  lh_R,[R+#]
   original.mnemonic?  off        00001003  12#5r3f5r7c:  R=(R+#)h

   original.mnemonic?  on         00002003  12#5r3f5r7c:  lw_R,[R+#]
   original.mnemonic?  off        00002003  12#5r3f5r7c:  R=(R+#)

   original.mnemonic?  on         00004003  12#5r3f5r7c:  lbu_R,[R+#]
   original.mnemonic?  off        00004003  12#5r3f5r7c:  R=(R+#)bu

   original.mnemonic?  on         00005003  12#5r3f5r7c:  lhu_R,[R+#]
   original.mnemonic?  off        00005003  12#5r3f5r7c:  R=(R+#)hu

\  imm[11:0] rs1 000 rd 0000011 LB
\  imm[11:0] rs1 001 rd 0000011 LH
\  imm[11:0] rs1 010 rd 0000011 LW
\  imm[11:0] rs1 100 rd 0000011 LBU
\  imm[11:0] rs1 101 rd 0000011 LHU
\ **********************************************************************************
\ **********************************************************************************

\ -----------------------------------------------------------------------------------
   original.mnemonic?  on         00000073  12#5r3f5r7c:  ecall_os
   original.mnemonic?  off        00000073  12#5r3f5r7c:  ecall_os

   original.mnemonic?  on         00100073  12#5r3f5r7c:  ebreak_debugger
   original.mnemonic?  off        00100073  12#5r3f5r7c:  ebreak_debugger

\  000000000000 00000 000 00000 1110011 ECALL
\  0000 0000 0000 0000 0000 0000 0111 0011      00000073  ECALL

\  000000000001 00000 000 00000 1110011 EBREAK
\  0000 0000 0001 0000 0000 0000 0111 0011      00100073  EBREAK
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         funct7         shamt              rs1        funct3        rd             opcode            R-type
\         7f              5s                5r         3f            5r             7c              7f5s5r3f5r7c
\  f  f  f  f  f  f  f  s  s  s  s  s  r  r  r  r  r  f  f  f  r  r  r  r  r  c  c  c  c  c  c  c   7f5s5r3f5r7c
\  1  1  1  1* 1  1  1  0* 0  0  0  0* 0  0  0  0* 0  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1     fe00707f  mask
\ --------------------------------------------------------------------------------------------------------------------
\  0  0  0  0  0  0  0  s  s  s  s  s                 0  0  1                 0  0  1  0  0  1  1     00001013  slli
\  0  0  0  0  0  0  0  s  s  s  s  s                 1  0  1                 0  0  1  0  0  1  1     00005013  srli
\  0  1  0  0  0  0  0  s  s  s  s  s                 1  0  1                 0  0  1  0  0  1  1     40005013  srai
\ ************************************************************************************************************
: 5s.check  ( # -- # )  dup  0  1f  between  not  abort" **** shift amount (shamt) should be 0 ~ 1f ****"  ;

: `7f5s5r3f5r7c  ( a -- a op.code )   dup   32@'  fe00707f  and  ;
:  7f5s5r3f5r7c:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `7f5s5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   18  14  14p"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)    5s.check  to (#)   5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    18  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ ------------------------------------------------------------------------------------
   original.mnemonic?  on         00001013  7f5s5r3f5r7c:  slli_R,R,#
   original.mnemonic?  off        00001013  7f5s5r3f5r7c:  R=R<<#

   original.mnemonic?  on         00005013  7f5s5r3f5r7c:  srli_R,R,#
   original.mnemonic?  off        00005013  7f5s5r3f5r7c:  R=R>>#

   original.mnemonic?  on         40005013  7f5s5r3f5r7c:  srai_R,R,#
   original.mnemonic?  off        40005013  7f5s5r3f5r7c:  R=R>>#,a

\   ? <----- 0
\  0100000 shamt rs1 101 rd 0010011 SRAI
\  0100 000 shamt rs1 101 rd 0010011 SRAI   7f5s5r3f5r7c     \ 40005013
\  ffff fffs ssss rrrr rfff rrrr rccc cccc  7f5s5r3f5r7c
\  0000 0000 0000 0000 0101 0000 00010011   0005013
\  0000000 shamt rs1 001 rd 0010011 SLLI
\  0000000 shamt rs1 101 rd 0010011 SRLI
\  0100000 shamt rs1 101 rd 0010011 SRAI    
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------------------- -------------- -------------- -------- -------------- --------------------
\         imm[11:5]         rs2             rs1        funct3    imm[4:0]           opcode            -type
\         7#                5r              5r         3f            5#             7c              7#[12|10:5]5r5r3f5#[4:1|11]7c
\                                                     f  f  f                 c  c  c  c  c  c  c
\                                                     1  1  1*            *0  1  1  1* 1  1  1  1     0000707f
\ ************************************************************************************************************
\  :  23p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  dup to (#)  3p  ;
\  :  24p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  dup to (#)  4p  ;
\
\  :  23p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  dup to (#)  3p  ;
\  :  24p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  dup to (#)  4p  ;

\  :  23p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  dup to (#)  3p  ;
\  :  24p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  dup to (#)  4p  ;
\ :  23p>#            ( 1f 19 0b 7 -- )  3  to (?p)  ?~?+?~?>  dup to (#)  3p  ;
\ :  24p>#            ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  dup to (#)  4p  ;

: `7#[11:5]5r5r3f5#[4:0]7c  ( a -- a op.code )   dup   32@'  00707f  and  ;
: `7#[11:5]5r5r3f5#[4:0]7c        ( a -- a op.code )   dup   32@'  00707f  and  ;

:  7#[11:5]5r5r3f5#[4:0]7c:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `7#[11:5]5r5r3f5#[4:0]7c"  #=if4 ."   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]"  .3"  mnem"  xt0
   does>    ( Rs1 Rs2 # a )  to (a)    12#.check  to (#)   5r.check  to (Rs2)   5r.check  to (Rs1)

     (Rs1)  13  0f         >?~?
     (#)    1f  19  0b  7  >?~?+?~?  +
     (Rs2)  18  14         >?~?      +
     (a)    @   ( op.code)           +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

:  7#[11:5]5r5r3f5#[4:0]7c:'   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  , 
     :.mnem_ ." `7#[11:5]5r5r3f5#[4:0]7c"  #=if4 ."  13  0f  12p  1f 19  0b  7  23p[1f:19|0b:7]  18  14  14p"  .3"  mnem"  xt0
   does>    ( Rs1 # Rs2 a )  to (a)    5r.check  to (Rs2)   12#.check  to (#)   5r.check  to (Rs1)
     (Rs1)  13  0f         >?~?
     (#)    1f  19  0b  7  >?~?+?~?  +
     (Rs2)  18  14         >?~?      +
     (a)    @   ( op.code)           +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

\ : [11:5|4:0]
\ : ?~?>                   ( a' n1 n0 -- n' )
\  to (n0)   to (n1)         a'@  to (op.code)
\  (a') (n1) (n0)  4,?~?  (n0)               rshift     ;
\ ------------------------------------------------------------------------------
:  [31:25|11:7]  ( -- # )   1f ( 31 )  25 ( 19 )  4  >real.number   0b ( 11 ) 7  0  >real.number  +   ;

:  7#[11:5]5r5r3f5#[4:0]7c:'  ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `7#[11:5]5r5r3f5#[4:0]7c"  #=if4 ."  13  0f  12p  1f 19  0b  7  23p  18  14  14p"  .3"  mnem"  xt0
   does>    ( Rs1 # Rs2 a )  to (a)    5r.check  to (Rs2)   12#.check  to (#)   5r.check  to (Rs1)
     (Rs1)  13  0f         >?~?
     (#)    1f  19  0b  7  >?~?+?~?  +
     (Rs2)  18  14         >?~?      +
     (a)    @   ( op.code)           +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

   original.mnemonic?  on         00000023  7#[11:5]5r5r3f5#[4:0]7c:   sb_R,R,#
   original.mnemonic?  off        00000023  7#[11:5]5r5r3f5#[4:0]7c:'  (R+#)=R,b

   original.mnemonic?  on         00001023  7#[11:5]5r5r3f5#[4:0]7c:   sh_R,R,#
   original.mnemonic?  off        00001023  7#[11:5]5r5r3f5#[4:0]7c:'  (R+#)=R,h

   original.mnemonic?  on         00002023  7#[11:5]5r5r3f5#[4:0]7c:   sw_R,R,#
   original.mnemonic?  off        00002023  7#[11:5]5r5r3f5#[4:0]7c:'  (R+#)=R

\ imm[11:5] rs2 rs1 000 imm[4:0] 0100011 SB
\ imm[11:5] rs2 rs1 001 imm[4:0] 0100011 SH
\ imm[11:5] rs2 rs1 010 imm[4:0] 0100011 SW
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************ 
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 0c 0a 09 08 07 06 05                                        04 03 02 01 0b
\ 12 10 09 08 07 06 05                                        04 03 02 01 11
\ 1f 1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\           0           0           0           1          C            8           6           3
\  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  0  0  1  0  0  0  0  1  1  0  0  0  1  1
\ -------------------- -------------- -------------- -------- -------------- --------------------
\   imm[12|10:5]           rs2             rs1        funct3   imm[4:1|11]        opcode            B-type
\    7#[12|10:5]           5r              5r          3f       5#[4:1|11]          7c      7#[12|10:5]5r5r3f5#[4:1|11]7c
\
0 [if]   { ( comment: ) 
  (  204012D4  63 C8 01 00       )                  R3<R0?,0

variable  upper.bit
variable  lower.bit
variable  target.n

:  >real.number  ( upper.bit lower.bit target.n -- )  \  1e 19  5  >real.number
   target.n  !     lower.bit  !     upper.bit  !
   (a')  32@'  lower.bit @  rshift  1f ( 31 ) upper.bit @  -  dup>r  lshift    r>  rshift  target.n  @  lshift  ;

:  find.highest.bit  ( -- )   ;

:  44p[12|10:5|4:1|11]   ( -- # )
   1e  19   5  >real.number
   0b   8   1  >real.number   +
   7    7  0b  >real.number   +     2*
   (a') 32@'   1f  2^n  and  if   fffff800  or  negate  1+  then   ;
[then] \ } ( comment; ) 
\ 12 10 09 08 07 06 05                                        04 03 02 01 11
\ :  44p[12|10:5|4:1|11]   ( -- )
\    1f 1f 0c   1e 19 5   0b 8 1   7 7 0b   4  pairs  ;
\
\    10 5  4 1  11 11   3  pairs   1f  2^n   a'@  if  fffff800  or  then  ;
\
\                                                           1*           *           *              1000
\                                                            *    1  1  1* 1  1  1   *               7e0
\                                                            *           *          1* 1  1  1        1e
\                                                            * 1         *           *               800
\ ************************************************************************************************************
\ :  44p[12|10:5|4:1|11]       12 12  11 11  10 5  4 1  ?~?+?~?+?~?+?~?>   ;   \ ????
\ :  44p[12|10:5|4:1|11]    11 11  10 5  4 1  ?~?+?~?+?~?>   (a')@  0<  if  negate1+  then  ;   \ ????
\ :  44p[12|10:5|4:1|11]     4 1  ?~?>   (a')@  0<  if  fffff800  or  negate  1+  then  ;   \ ????

0 [if]   { ( comment: ) 
:  >real.number  ( upper.bit lower.bit target.n -- )  \  1e 19  5  >real.number
   target.n  !     lower.bit  !     upper.bit  !
   (a')  32@'  1f ( 31 ) upper.bit @  -  dup>r  lshift
   r>  lower.bit @  +   rshift  target.n  @  lshift  ;
[then] \ } ( comment; )


:  [12|10:5|4:1|11]   ( -- # )   \  (a') has to be defined before.
   1e  19   5  >real.number
   0b   8   1  >real.number   +
   7    7  0b  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fffff000  or   then   ;

:  .jmp.to.addr ( -- )   (a')  [12|10:5|4:1|11]   +  66 ?y  ." \ " 8 u.r  ;

:  find.highest.bit  ( -- )  ;

:  44p[12|10:5|4:1|11]   ( -- # )
   1e  19   5  >real.number
   0b   8   1  >real.number   +
   7    7  0b  >real.number   +     2*
   (a') 32@'  1f  2^n  and  if   fffff800 ( sign-extend )  or  negate  1+  then  dup  to (#)  4 to <<byte>>  4p  ;

:  44p[12|10:5|4:1|11]   ( -- # )
   1e  19   5  >real.number
   0b   8   1  >real.number   +
   7    7  0b  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fffff000  or   then  dup  to (#)  4 to <<byte>>  4p  ;

:  [12|10:5|4:1|11].check  ( # -- #' )
   here'  -  dup  -1000  0ffe  between  not  abort" *** # should be between -1000 and ffe ***"  \  0c  sign-extend
   ;                       \ 1 0000 0000 0000  -->      1000  --> -1000
                           \ 0 1111 1111 1110  -->      0ffe  -->  0ffe
   \  xxxx xxxx xxxx xxxx xxx1 0000 0000 0000  -->  ffff1000      -1000
   \  xxxx xxxx xxxx xxxx xxx0 1111 1111 1110  -->  0000fffe       0fff

:  44p  44p[12|10:5|4:1|11]   u.  ;   \ ????

:  ?~?>#     ( # high.bit low.bit -- #' )   >r  1f  swap  -  dup>r  lshift  2r>  +  rshift  ;
:  #>?~?     ( # high.bit low.bit -- )      >r  1f  swap  -  dup>r  lshift  r>  rshift  r> lshift  ;

:  ?~?>?~?   ( # 4 1  11 8 -- )  2>r  ?~?>#   2r>  #>?~?   ;



                                                     \ 12  11  10  09  08  07  06  05  04  03  02  01  00
: #[12|10:5|4:1|11]>[31|30:25|11:8|7]   ( # -- #' )  \  1   1   1   1   1   1   1   1   1   1   1   1   0
     (#)  1000  and   0c rshift   1f 1f >?~?   +
     (#)   7e0  and    5 rshift   1e 19 >?~?   +
     (#)    1e  and    1 rshift   0b  8 >?~?   +
     (#)   800  and   0b rshift    7  7 >?~?   +   ;


:  #[12|10:5|4:1|11]>[31|30:25|11:8|7]   ( # -- #' )  >r
   r@  0c 0c   1f 1f ?~?>?~?
   r@  0a  5   1e 19 ?~?>?~?  +
   r@   4  1   0b  8 ?~?>?~?  +
   r>  0b 0b    7  7 ?~?>?~?  +   ;

\ : `7#[12|10:5]5r5r3f5#[4:1|11]7c  ( a -- a op.code )   dup   32@'  0000707f  and  ;
: `7#[]5r5r3f5#[]7c  ( a -- a op.code )   dup   32@'  0000707f  and  ;
:  7#[12|10:5]5r5r3f5#[4:1|11]7c:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `7#[]5r5r3f5#[]7c "  #=if4 ."  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11] "  .2"  mnem"  xt0
   does>  ( Rs2 Rs1 # a )  to (a)  [12|10:5|4:1|11].check ( 13#.check ) to (#)   5r.check  to (Rs1)    5r.check  to (Rs2)
     (Rs1)  18  14       >?~?
     (Rs2)  13  0f       >?~?                  +
\    (#)    1f 1f  1e 19  0b 8  7 7  >?~?+?~?+?~?+?~?  +     \ ??????????
     (#)  1000  and   0c rshift   1f 1f >?~?   +
     (#)   7e0  and    5 rshift   1e 19 >?~?   +
     (#)    1e  and    1 rshift   0b  8 >?~?   +
     (#)   800  and   0b rshift    7  7 >?~?   +
     (a)    @   ( op.code )                    +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ ************************************************************************************************************
   original.mnemonic?  on         00000063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  beq_R,R,#
   original.mnemonic?  off        00000063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R=R?,#

   original.mnemonic?  on         00001063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  bne_R,R,#
   original.mnemonic?  off        00001063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R<>R?,#

   original.mnemonic?  on         00004063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  blt_R,R,#
   original.mnemonic?  off        00004063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R<R?,#

   original.mnemonic?  on         00005063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  bge_R,R,#
   original.mnemonic?  off        00005063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R>=R?,#

   original.mnemonic?  on         00006063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  bltu_R,R,#
   original.mnemonic?  off        00006063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R<R?,#u

   original.mnemonic?  on         00007063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  bgeu_R,R,#
   original.mnemonic?  off        00007063  7#[12|10:5]5r5r3f5#[4:1|11]7c:  R>=R?,#u

0 [if]   { ( comment: )
imm[12|10:5] rs2 rs1 000 imm[4:1|11] 1100011 BEQ
imm[12|10:5] rs2 rs1 001 imm[4:1|11] 1100011 BNE
imm[12|10:5] rs2 rs1 100 imm[4:1|11] 1100011 BLT
imm[12|10:5] rs2 rs1 101 imm[4:1|11] 1100011 BGE
imm[12|10:5] rs2 rs1 110 imm[4:1|11] 1100011 BLTU
imm[12|10:5] rs2 rs1 111 imm[4:1|11] 1100011 BGEU
[then]  \ }( comment; ) 
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------------------------------- -------------- --------------------
\         imm[31:12]                                                 rd             opcode            U-type
\         20#                                                        5r             7c
\ *************************************************************************************************************
:  20#[31:12].check  ( # -- # )  20#.check  ;

: `20#5r7c  ( a -- a op.code )   dup   32@'  0000007f  and  ;
:  20#5r7c:        ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  , 
     :.mnem_ ." `20#5r7c"  #=if2 ."  0b  7  13p   1f  0c  14p"  .2"  mnem"  xt0
   does>    ( Rd # a )   to (a)    20#[31:12].check  to (#)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (#)    1f  0c       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

   original.mnemonic?  on         00000037  20#5r7c:  lui_R,#
   original.mnemonic?  off        00000037  20#5r7c:  R=#,u

   original.mnemonic?  on         00000017  20#5r7c:  auipc_#
   original.mnemonic?  off        00000017  20#5r7c:  R=pc+#,u

\ (  20405CC8  37 01 00 80       )                              2     80000    R=#,u
\ (  20405CCC  13 01 81 46       )                    2         2       468    R=R+#
\  imm[31:12] rd 0110111 LUI
\  imm[31:12] rd 0010111 AUIPC
\ *************************************************************************************************************
:  20#[31:12].check  ( # -- # )  20#.check  ;

: `20#5r7c  ( a -- a op.code )   dup   32@'  0000007f  and  ;
:  20#5r7c:       ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  , 
     :.mnem_ ." `20#5r7c"  #=if2 ."  0b  7  13p   1f  0c  14p"  .2"  mnem"  xt0
   does>    ( Rd # a )   to (a)    20#[31:12].check  to (#)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (#)    1f  0c       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

   original.mnemonic?  on         00000037  20#5r7c:  lui_R,#
   original.mnemonic?  off        00000037  20#5r7c:  R=#,u

   original.mnemonic?  on         00000017  20#5r7c:  auipc_#
   original.mnemonic?  off        00000017  20#5r7c:  pc+#,u

\  imm[31:12] rd 0110111 LUI
\  imm[31:12] rd 0010111 AUIPC
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------------------------------- -------------- --------------------
\ 20 10 09 08 07 06 05 04 03 02 01 11 19 18 17 16 15 14 13 12
\         imm[20|10:1|11|19:12]                                      rd             opcode            J-type
\         20#[20|10:1|11|19:12]                                      5r             7c       20#[20|10:1|11|19:12]5r7c
\
\                                   1* 0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0    100000
\                                    *           *           *    1  1  1* 1  1  1  1* 1  1  1  0       7fe
\                                    *           *           * 1  0  0  0* 0  0  0  0* 0  0  0  0       800
\                                    * 1  1  1  1* 1  1  1  1*           *           *                ff000
\ ************************************************************************************************************
:  20#[20|10:1|11|19:12].check  ( # -- # )   here'  -   fffff  and  20#.check  ;


:  20#[20|10:1|11|19:12].check  ( # -- # )   here'  -  1fffff  and  dup  0 1fffff  between  not abort" *** # should be between 0 ~ 1fffff ***"  ;

:  [20|10:1|11|19:12].call_a'>code  ( a' -- code )  \  20402848  [20|10:1|11|19:12].call_a'>code  B01FC0EF  <---
   here'  -  ( offset )  >r
   r@  0a  1   15  real.number>
   r@  0b  0b  14  real.number>  +
   r@  13  0c  0c  real.number>  +
   r>  0<                      
   if     80000000  +    \  or
   then   0ef       +  ;

:  ,call_a'(risc-v)  ( a'  -- )   [20|10:1|11|19:12].call_a'>code   32,'  ;

:  [20|10:1|11|19:12].a'>call_#   ( a' -- # )  to (a')   \  20405D48  [20|10:1|11|19:12].a'>call_#  20402848
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +
   (a')  32@'  1f  2^n  and  if   fff00000  or  then  dup to (#)  (a')  +   ;  \   4 to <<byte>>  4p  ;

:  [20|10:1|11|19:12]   ( a' -- a'1 )  to (a')     \  call_#    20405D48  [20|10:1|11|19:12]  20402848
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +
   (a')  32@'  1f  2^n  and  if   fff00000  or  then  dup to (#)  (a')  +   ;  \   4 to <<byte>>  4p  ;

variable  pc
\ :  a'>[20|10:1|11|19:12]   ( a' -- )   \  call_#  ====  call_a'
\    here' -  14 ( 20 )  14 ( 20 )  ?~?>
\
:  14p[20|10:1|11|19:12]   ( -- )
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fff00000  or  then  dup  to (#)  4 to <<byte>>  (a')  +  dup  pc !   4p  ;

0 [if]   { ( comment: ) 
variable   #>name?     #>name?   on

:  #>name  ( a' -- )   #>name?  @  not  if  drop   exit    then
   CFA'>N(RISC-V)  if  N>NFA'(RISC-V)*  if  count' 1f and  type'  then  then  ;
[then]  \ }( comment; ) 

defer  _#>name


:  14p[20|10:1|11|19:12]   ( -- )
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fff00000  or  then  dup  to (#)  (#)  _#>name
   4 to <<byte>>  (a')  +  dup  pc !   4p  ;

:  14p[20|10:1|11|19:12]   ( -- )
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fff00000  or  then  dup  to (#)  5a ?y  (#)  (a')  +  _#>name
   4 to <<byte>>  (a')  +  dup  pc !   4p  ;

variable  #>name?      #>name?  on

:  14p[20|10:1|11|19:12]   ( -- )
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fff00000  or  then  dup  to (#)    #>name? @  if  5a ?y  (#)  (a')  +  _#>name  then
   4 to <<byte>>  (a')  +  dup  pc !   4p  ;
\ ************************************************************************************************************
:  ."_""    ( -- )   '"'  emit  ;
:  ."_."    ( -- )   '.'  emit  ;
:  ."_."_"  ( -- )   '.'  emit  '"'  emit   20  emit  ;

\  ."_text.0a.0"  ( a' -- a'1 | a' )


:  ."_text.0a.0"  ( a' -- a'1 / a' )
   dup    [20|10:1|11|19:12]   20402AD0  ( run time instruction of ." )   =   \ 20402AD0  ( run time instruction of ." )   =
   if     cr   ."   ( "  dup  .xxxxxxxx  2 spaces  dup 32@' .xxxxxxxx  space  dup  4  +  count'  1+ >r 1- r>  bounds
          do   space  i  c@' .xx   loop  ."  )"
          cr   32 ?y  ."   ."  '"'  emit  space  dup  4  +  count'  dup>r  type'  r>  +  5 ( 4 ) +  align*4      '"'  emit    exit
   then   ;

\ '   _."_text.0a.0"   is  ."_text.0a.0"

:  dis.."_   ( a' -- a' n / a' 0 )       dup>r   [20|10:1|11|19:12]   20402AD0   =
   if    r@  (.12345678..11.22.33.44.55.66.77.88.)
         34 ?y  ."_."_"  r@  4+  count'  dup>r'  type'  ."_""  r>   r>'  5  +  align*4  exit
   then  r>  0  ;

:  dis.."_   ( a' -- a' n / a' 0 )   dup  dup>r   ."_text.0a.0"  r>   -   ;
\ ************************************************************************************************************
: `20#5r7c  ( a -- a op.code )   dup   32@'   7f  and  ;
:  20#5r7c:         ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,   
     :.mnem_ ." `20#5r7c"  #=if4 ."  0b  7  13p   14p[20|10:1|11|19:12]"  .2"  mnem"  xt0
   does>    ( Rd # a )  to (a)   20#[20|10:1|11|19:12].check  to (#)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (#)    100000 and  14  rshift   1f  1f  >?~?   +
     (#)       7fe and   1  rshift   1e  15  >?~?   +
     (#)       800 and  0b  rshift   14  14  >?~?   +
     (#)     ff000 and  0c  rshift   13  0c  >?~?   +
     (a)    @   ( op.code)                          +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ -----------------------------------------------------------------------------------
: `20#12c  ( a -- a op.code )   dup   32@'   fff  and  ;
:  20#12c:        ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `20#12c"  #=if4 ."   14p[20|10:1|11|19:12]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)   20#[20|10:1|11|19:12].check  to (#)
     (Rd)   0b   7       >?~?
     (#)    100000 and  14  rshift   1f  1f  >?~?   +
     (#)       7fe and   1  rshift   1e  15  >?~?   +
     (#)       800 and  0b  rshift   14  14  >?~?   +
     (#)     ff000 and  0c  rshift   13  0c  >?~?   +
     (a)    @   ( op.code)                          +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

: `20#12c  ( a -- a op.code )   dup   32@'   fff  and  ;
:  20#12c:      ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,  
     :.mnem_ ." `20#12c"  #=if4 ."   14p[20|10:1|11|19:12]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)   20#[20|10:1|11|19:12].check  to (#)
\    (Rd)   0b   7       >?~?
     (#)     80000 and  14  rshift   1f  1f  >?~? \ +  \ 20:20    14
     (#)       7fe and   1  rshift   1e  15  >?~?   +  \ 10:01     1
     (#)       800 and  0b  rshift   14  14  >?~?   +  \ 11:11    0b
     (#)     ff000 and  0c  rshift   13  0c  >?~?   +  \ 19:12    0c
\    (#)   1f 1f  1e 15  14 14  13 0c  >?~?+?~?+?~?+?~? +
     (a)    @   ( op.code)                          +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;


: `20#12c  ( a -- a op.code )   dup   32@'   fff  and  ;
:  20#12c:          ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create  dup  ,   
     :.mnem_ ." `20#12c"  #=if4 ."   14p[20|10:1|11|19:12]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)   20#[20|10:1|11|19:12].check  to (#)
\    (Rd)   0b   7       >?~?
     (#)     14 14   1f  1f  ?~?>?~? \ +  \ 20:20    14
     (#)     0a  1   1e  15  ?~?>?~?   +  \ 10:01     1
     (#)     0b 0b   14  14  ?~?>?~?   +  \ 11:11    0b
     (#)     13 0c   13  0c  ?~?>?~?   +  \ 19:12    0c
\    (#)   1f 1f  1e 15  14 14  13 0c  >?~?+?~?+?~?+?~? +
     (a)    @   ( op.code)                          +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;

   original.mnemonic?  on         000000ef   20#12c:  jal_#
   original.mnemonic?  off        000000ef   20#12c:  call_#
                                                \   ' call_#  is  _call_#
\ ------------------------------------------------------------------------------------
   original.mnemonic?  on         0000006f   20#12c:  jmp_#

   original.mnemonic?  on         0000006f  20#5r7c:  jal_R,#
   original.mnemonic?  off        0000006f  20#5r7c:  call_R+#

\  original.mnemonic?  on         00000003  20#5r7c:  jalr_R,#
\  original.mnemonic?  off        00000003  20#5r7c:  pc=R+#

   original.mnemonic?  on         00000067  12#5r3f5r7c:  jalr_R,R,#
   original.mnemonic?  off        00000067  12#5r3f5r7c:  R=pc+4;pc=R+#

0 [if]   { ( comment: ) 
imm[31:12] rd 0110111 LUI
imm[31:12] rd 0010111 AUIPC
imm[20|10:1|11|19:12] rd 1101111 JAL
imm[11:0] rs1 000 rd 1100111 JALR
[then]  \ }( comment; ) 

















































  20 ( 32 ) value 32/64.bit

: #[u:l]  ( upper lower -- n )        >r >r
  (#)  32/64.bit r> - dup>r  lshift   r> r> +  1-  rshift  ;
\ (#)  32/64.bit 5  - dup>r  lshift   r> 3  +  1-  rshift  ;


: #[5:3]  ( -- n )   (#)  32/64.bit 5 - dup>r  lshift   r> 3 +  1-  rshift  ;

: #[5:3]  ( -- n )   5  3  #[u:l]  ;
: #[2:2]  ( -- n )   2  2  #[u:l]  ;
: #[6:6]  ( -- n )   6  6  #[u:l]  ;

: #[4:0]  ( -- n )   4  0  #[u:l]  ;

: #[4:3]  ( -- n )   4  3  #[u:l]  ;
: #[7:6]  ( -- n )   7  6  #[u:l]  ;
: #[2:1]  ( -- n )   2  1  #[u:l]  ;

: #[5:2]  ( -- n )   5  2  #[u:l]  ;
: #[5:4]  ( -- n )   5  4  #[u:l]  ;
: #[9:6]  ( -- n )   9  6  #[u:l]  ;



0 [if]   { ( comment: ) 

hex
  code   #[n]  ( # n -- n )
    mov  eax , 20   \ 32
    sub  eax , ebx
    mov  ecx , eax
    pop  ebx
    shl  ebx , al
    add  ecx , eax
    mov  eax , # 1
    sub  ecx , eax
    shr  ebx , cl
  next   c;

[then]  \ } ( comment; )

: #[n]   ( a -- b )   dup  #[u:l]  ;

: #[0]   ( -- n )     0  #[n]  ;
: #[1]   ( -- n )     1  #[n]  ;
: #[2]   ( -- n )     2  #[n]  ;
: #[3]   ( -- n )     3  #[n]  ;
: #[4]   ( -- n )     4  #[n]  ;
: #[5]   ( -- n )     5  #[n]  ;
: #[6]   ( -- n )     6  #[n]  ;
: #[7]   ( -- n )     7  #[n]  ;
: #[8]   ( -- n )     8  #[n]  ;
: #[9]   ( -- n )     9  #[n]  ;
: #[10]  ( -- n )    0a  #[n]  ;
: #[11]  ( -- n )    0b  #[n]  ;
: #[12]  ( -- n )    0c  #[n]  ;
: #[13]  ( -- n )    0d  #[n]  ;
: #[14]  ( -- n )    0e  #[n]  ;
: #[15]  ( -- n )    0f  #[n]  ;

: [5:3][2|6]      ( -- # )
  #[5:3]      3 lshift
  #[2]        2 lshift   +
  #[6]        6 lshift   +  ;

: [5:3][2|6]/4    ( -- # )  [5:3][2|6]    4 /  ;

: #[5:3]#[2|6]    ( -- # )  #[5:3] 3 lshift    #[2] 2 lshift   +   #[6] 6 lshift   +  ;
: #[5:3]#[2|6]/4  ( -- # )  #[5:3]#[2|6]  4 /  ;


\ ****************************************************************************************************
\ 2020.2.15

variable  R32C?             R32C?  ON
          R32C?  @
[if]  \ #if
\ \s
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ RV32C  compressed Extension
\  1   2    3   4   5   6   7   8
\  CI  CSS  CL  CS  CJ  CR  CB  CIW
\  V   V    V   V   V   V   V   V
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------- -------------- -------------- -----
\  funct4        rd/rs1            rs2      opcode            CR-type        6
\    4f            5r              5r        2o
\  f  f  f  f  r  r  r  r  r  r  r  r  r  r  c  c             4f5r5r2o
\
\  1  1  1  1* 0  0  0  0* 0  0  0  0* 0  0  1  1             f003    mask
\  1  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0             8002    c.mv_R,R
\  1  0  0  1* 0  0  0  0* 0  0  0  0* 0  0  1  0             9002    c.add_R,R
\ -------------------------------------------------------------------------------------------------------------
: `4f5r5r2o  ( a -- a op.code )   dup   16@'  f003  and  ;
:  4f5r5r2o:       ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  , 
     :.mnem_ ." `4f5r5r2o"  #=if2 ."  0b  7  13p  6  2  14p"  .2"  mnem"  xt0
   does>    ( Rd Rs2 a )  to (a)  5r.check  to (Rs2)   5r.check  to (Rd)
     (Rd)   6    2   >?~?
     (#)    0b   7   >?~?    +
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8002  4f5r5r2o:  c.mv_R,R
   original.mnemonic?  off        8002  4f5r5r2o:  c.R=R

   original.mnemonic?  on         9002  4f5r5r2o:  c.add_R,R
   original.mnemonic?  off        9002  4f5r5r2o:  c.R+R

\ : R=R  ( R R -- )  c.R=R  ;
\ : R+R  ( R R -- )  c.R+R  ;
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- ----- ----- ----------------- -----
\  funct3 #[5] c c   rd'/rs1'   nzimm[4:0]   opcode       ??? CR-type(rd/rs1=2c.rd'/rs1';rs2=nzimm[4:0])        6
\    3f   #[5] 2c     3r'           #[4:0]   2o               3f.nz#[5].2c.3r'.nz#[4:0].2o
\
\  f  f  f  #* c  c  r  r* r  #  #  #  #  #  c  c             3f#[5]2c3r'#[4:0]2o
\  1  1  1  0* 1  1  0  0* 0  1  1  1* 1  1  1  1             ec7f     mask
\
\  1  0  0  ?* 0  0  0  0  0  ?  ?  ?  ?  ?  0  1             8001     c.srli_R,R    c.R<<R,a
\  1  0  0  ?* 0  1  0  0  0  ?  ?  ?  ?  ?  0  1             8401     c.srai_R,R    c.R>>R,a
\ -------------------------------------------------------------------------------------------------------------
\  14P ( -- )     4 to (?P) ?~?> 4P ;
: _14P ( n --)    4 to (?P)      4P ;

: [5][4:0]_14p  ( -- )   #[5] 5 lshift  #[4:0]  +  _14p  ;



\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- ----- ----- ----------------- -----
\  funct3 #[5] c c   rd'/rs1'     imm[4:0]   opcode           CR-type(rd/rs1=2c.rd'/rs1';rs2=nzimm[4:0])        6
\    3f   #[5] 2c     3r'           #[4:0]   2o               3f.nz#[5].2c.3r'.nz#[4:0].2o
\
\  f  f  f  #* c  c  r  r* r  #  #  #  #  #  c  c             3f#[5]2c3r'#[4:0]2o.nz#
\  1  1  1  0* 1  1  0  0* 0  1  1  1* 1  1  1  1             ec7f     mask
\
\  1  0  0  ?* 1  0  0  0* 0  ?  ?  ?* ?  ?  0  1             8801     c.andi_R,#    c.Rn#
\ -------------------------------------------------------------------------------------------------------------
: 6#.check.nz#  ( # -- # )  dup  1 1f between not abort" **** # must be 1 ~ 1F **** "  ;
: `3f#[5]2c3r'#[4:0]2o:  ( a -- a op.code )   dup   16@'  f003  and  ;
:  3f#[5]2c3r'#[4:0]2o:nz#   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `3f#[5]2c3r'#[4:0]2o"  #=if2 ."  9  7  13p   [5][4:0]_14p "  .2"  mnem"  xt0
   does>    ( Rd'/Rs1' # a )  to (a)  6#.check.nz#  to (#)   3r.check  to (Rd)
     (Rd)       9    7   >?~?           \ 2^6=64  64 bit system
     #[5]      0c   0c   >?~?  +
     #[4:0]     5    2   >?~?  +
     (a)    @   ( op.code)     +
     16,'   ;
\ *************************************************************************************************************
: `3f#[5]2c3r'#[4:0]2o    ( a -- a op.code )   dup   16@'  f003  and  ;
:  3f#[5]2c3r'#[4:0]2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f#[5]2c3r'#[4:0]2o"  #=if2 ."  9  7  13p   [5][4:0]_14p "  .2"  mnem"  xt0
   does>    ( Rd'/Rs1' # a )  to (a)  6#.check  to (#)   3r.check  to (Rd)
     (Rd)       9    7   >?~?           \ 2^6=64  64 bit system
     #[5]      0c   0c   >?~?  +
     #[4:0]     5    2   >?~?  +
     (a)    @   ( op.code)     +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8001  3f#[5]2c3r'#[4:0]2o:nz#  c.srli_R,#
   original.mnemonic?  off        8001  3f#[5]2c3r'#[4:0]2o:nz#  c.R<<R,a

   original.mnemonic?  on         8401  3f#[5]2c3r'#[4:0]2o:nz#  c.srai_R,#
   original.mnemonic?  off        8401  3f#[5]2c3r'#[4:0]2o:nz#  c.R>>R,a
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8801  3f#[5]2c3r'#[4:0]2o:     c.andi_R,#
   original.mnemonic?  off        8801  3f#[5]2c3r'#[4:0]2o:     c.Rn#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------- -------------- -------------- -----
\  funct4        rd/rs1       0  0  0  0  0  opcode         CR-type(rs2=0)        6
\    4f            5r              5c        2o             4f5r5c2o
\  f  f  f  f* r  r  r  r* r  c  c  c  c  c  o  o
\  1  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1           f07f   mask
\
\  1  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0           8002     c.jr_R
\  1  0  0  1* 0  0  0  0* 0  0  0  0* 0  0  1  0           9002     c.jalr_R
\ ----------- -------------- -------------- -----
: `4f5r5c2o  ( a -- a op.code )   dup   16@'  f07f  and  ;
:  4f5r5c2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `4f5r5c2o"  #=if2 ."  0b  7  14p"  .1"  mnem"  xt0
   does>    ( Rs1 a )  to (a)  5r.check  to (Rs1)
     (Rs1) 0b    7   >?~?
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8002  4f5r5c2o:  c.jr_R
   original.mnemonic?  off        8002  4f5r5c2o:  c.jmp.R

   original.mnemonic?  on         9002  4f5r5c2o:  c.jalr_R
   original.mnemonic?  off        9002  4f5r5c2o:  c.jmp.R.Link
\ *************************************************************************************************************
\ *************************************************************************************************************
: `16c   ( a -- a op.code )   dup   16@'  ;
:  16C:_GENE      :.MNEM_ ." `16c" #=if2 ."  " .1" MNEM"  XT0 ;
:  16C:  CREATE   DUP ,   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
           16C:_GENE
         DOES>   @ 16,' ;


\  1  0  0  1  0  0  0  0  0  0  0  0  0  0  1  0           9002     c.ebreak
    9002   16c:  c.ebreak
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
:  11#[12:2].check  ;

: signed.6#.check  ( # -- # )  -20  1f  between  not  abort" **** 6# must be between -20 ~ 1f ****"  ;
0  value  (rs1')

: [8|4:3][7:6|2:1|5]   ( -- # )
     #[8]     8 lshift
     #[4:3]   3 lshift
     #[7:6]   6 lshift
     #[2:1]   1 lshift
     #[5]     5 lshift  ;

: [8|4:3][7:6|2:1|5]_14p  ( -- # )   [8|4:3][7:6|2:1|5]  _14p  ;

: `3f[]rs1'[7:6|]2o    :  ( a -- a op.code )   dup   16@'  f003  and  ;
:  3f[8|4:3]rs1'[7:6|2:1|5]2o:  ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f[]rs1'[7:6|]2o    "  #=if2 ."  9  7  13p   [8|4:3][7:6|2:1|5]_14p "  .2"  mnem"  xt0
   does>    ( rs1' # a )  to (a)  signed.6#.check  to (#)   3r.check  to (rs1')
     (rs1')     9    7   >?~?           \ 2^6=64  64 bit system
     #[8]      0c   0c   >?~?  +
     #[4:3]    0b   0a   >?~?  +
     #[7:6]     6    5   >?~?  +
     #[2:1]     4    3   >?~?  +
     #[5]       2    2   >?~?  +
     (a)    @   ( op.code)     +
     16,'   ;
\ -----------------------------------------------------------------------------------------------------
\ 15    14    13    12*   11    10    09    08*   07    06    05    04*   03    02    01    00
\ --------------    --------------    --------------    --------------------------    --------
\  f     f     f    offset[8|4:3]           rs1'        offset[7:6|2:1|5]              op.code
\  1     1     0        os[8|4:3]           rs1'            os[7:6|2:1|5]              0     1   c.beqz_R,#
\  1     1     1        os[8|4:3]           rs1'            os[7:6|2:1|5]              0     1   c.bnez_R,#
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c001  3f[8|4:3]rs1'[7:6|2:1|5]2o:  c.beqz_R,#
   original.mnemonic?  off        c001  3f[8|4:3]rs1'[7:6|2:1|5]2o:  c.R=#?

   original.mnemonic?  on         e001  3f[8|4:3]rs1'[7:6|2:1|5]2o:  c.bnez_#
   original.mnemonic?  off        e001  3f[8|4:3]rs1'[7:6|2:1|5]2o:  c.R<>#?

\  111 offset[8|4:3] rs1' offset[7:6|2:1|5] 01    C.BNEZ



\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- -------------- -------------- -----
\  funct3   i    rd/rs1        imm[6:2]      opcode            CI-type    1
\    3f     1#     5r              5#        2o
\  f  f  f  #  r  r  r  r  r  #  #  #  #  #  c  c             3f1#5r5#2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             c001     c.beqz_R,#
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.bnez_R,#
\ -------------------------------------------------------------------------------------------------------------
:  24p[12:10,6:2]   24p  ;

: `3f1#5r5#2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f1#5r5#2o:       ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `3f1#5r5#2o"  #=if2 ."  9  7 13p  0c 0a  6  2  24p[12:10,6:2]"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   5r.check  to (Rd)  11#[12:2].check  to (#)
     (Rd)   9    7               >?~?
     (#)    0c  0a   6   2   >?~?+?~?  +
     (a)    @    ( op.code)            +
     16,'   ;
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- ----------------- -------------- -----
\  funct3    imm[5:3|8:6]          rs2      opcode            CSS-type   2
\    3f            6#              5r        2o        3f.imm[5:2|7:6].rs2.2o    C.SWSP

\  1  0  1 imm[5:3|8:6]            rs2       1  0      C.FSDSP
\  1  1  1 imm[5:3|8:6]            rs2       1  0      C.SDSP

\  1  1  0 imm[5:2|7:6]            rs2       1  0      C.SWSP

\   110 imm[5:2|7:6] rs2 10 C.SWSP
\   111 imm[5:3|8:6] rs2 10 C.SDSP

: [5:2|7:6]   ( -- # )
     #[5:2]   3 lshift
     #[7:6]   6 lshift  +  ;

: [5:2|7:6]_14p  ( -- )   [5:2|7:6]  _14p  ;

: `3f.imm[5:2|7:6].rs2.2o   ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f.imm[5:2|7:6].rs2.2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `3f.imm[5:2|7:6].rs2.2o "  #=if2 ."   6  2  13p   [5:2|7:6]_14p "  .2"  mnem"  xt0
   does>    ( rs2 # a )  to (a)   6#.check  to (#)    5r.check  to (Rs2)
     (Rs2)      6   2    >?~?
\    (#)        0c  7    >?~?
\    [5:2|7:6]>?~?+?~?
     #[5:2]     0c  9    >?~?     +
     #[7:6]     8   7    >?~?     +
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c002  3f.imm[5:2|7:6].rs2.2o:  c.swsp_R,#
   original.mnemonic?  off        c002  3f.imm[5:2|7:6].rs2.2o:  c.(sp+#*4)=R

\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- ----------------- -------------- -----
\  funct3    imm[5:3|8:6]          rs2      opcode            CSS-type   2
\  f  f  f  #  #  #  #  #  #  r  r  r  r  r  c  c             3f6#5r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\ -------------------------------------------------------------------------------------------------------------
: `3f6#5r2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f6#5r2o:       ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f6#5r2o"  #=if2 ."   0c  7  13p   6  2  14p "  .2"  mnem"  xt0
   does>    ( # r a )  to (a)  5r.check  to (Rs2)    6#.check  to (#)
     (#)    0c  7    >?~?
     (Rs2)  6   2    >?~?     +
     (a)    @    ( op.code)   +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- ----------------------- -------- -----
\  funct4        imm[12:5}            rd'  opcode             CIW-type     8
\    3f            8#                 3r    2o                3f.nz[5:4|9:6|2|3]rd'2o
\  f  f  f  #  #  #  #  #  #  #  #  r  r  r  c  c             3f8#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             0000     c.addi4spn_R,sp+#*4   addi rd', sp, 4*imm
\  f  f  f  nzimm[5:4|9:6|2|3]          nzimm[5:4|9:6|2|3]
\  0  0  0  nzimm[5:4|9:6|2|3]      rd'      0  0     C.ADDI4SPN
\  000 nzimm[5:4|9:6|2|3] rd' 00   C.ADDI4SPN
\  3f.nz[5:4|9:6|2|3]rd'2o    C.ADDI4SPN


\ -------------------------------------------------------------------------------------------------------------
: `3f8#3r2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f8#3r2o:        ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `3f8#3r2o"  #=if2 ."  4  2 13p   0c 5 14p"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   3r.check  to (Rd)  8#.check  to (#)
     (Rd)   4   2    >?~?
     (#)    0c   5   >?~?    +
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
:  [5:4|9:6|2|3]   ( -- # )
     #[5:4]   3 lshift
     #[9:6]   6 lshift  +
     #[2]     1 lshift  +
     #[3]     5 lshift  +  ;

:  [5:4|9:6|2|3]_14p  ( -- )   [5:4|9:6|2|3]  _14p  ;
\ -------------------------------------------------------------------------------------------------------------
: `3f.nz[5:4|9:6|2|3]rd'2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f.nz[5:4|9:6|2|3]rd'2o:  ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,  
     :.mnem_ ." `3f.nz[5:4|9:6|2|3]rd'2o"  #=if2 ."  4  2 13p   [5:4|9:6|2|3]_14p"  .2"  mnem"  xt0
   does>    ( rd' # a )  to (a)   3r.check  to (Rd)  8#*4.check  to (#)
     (Rd')     4   2   >?~?
\    (#)       0c  5   >?~?    +
     #[5:4]    0c  0b  >?~?    +
     #[9:6]    0a  7   >?~?    +
     #[2]      6   6   >?~?    +
     #[3]      5   5   >?~?    +
     (a)    @    ( op.code)    +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         0000  3f.nz[5:4|9:6|2|3]rd'2o:  c.addi4spn_R,sp+#*4
   original.mnemonic?  off        0000  3f.nz[5:4|9:6|2|3]rd'2o:  c.R=sp+#*4
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
:  14p[12:2]   14p  ;

\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----             Load Word
\  funct3 imm[12:10]  rs1'    imm    rd'    opcode            CL-type       3
\    3f      3#       3r      2#     3r      2o               3f3#3r2#3r2o
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  0  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             4000     c.lw_R,#
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,#

\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  f  f  f imm[5:3]  r  r  r #[2|6] r  r  r  c  c   3f[5:3]rs1'[2|6]rd'2o
\  0  1  0  #[5:3]    rs1'   #[2|6]   rd'    0  0   4000   C.LW

\  1  1  0  #[5:3]    rs1'   #[2|6]   rs2'   0  0   c000   C.SW

\  3f[5:3]rs1'[2|6]rd'2o
\  010 imm[5:3] rs1' imm[2|6] rd'  00     C.LW
\  110 imm[5:3] rs1' imm[2|6] rs2' 00     C.SW
\ -------------------------------------------------------------------------------------------------------------
: `3f3#3r2#3r2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#3r2#3r2o:     ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f3#3r2#3r2o"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( rd' # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   0a   6   2       >?~?+?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
\ -------------------------------------------------------------------------------------------------------------
: `3f.nz[5:4|9:6|2|3]rd'2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f.nz[5:4|9:6|2|3]rd'2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f.nz[5:4|9:6|2|3]rd'2o"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( rd' # a )  to (a)    8#*4.check  to (#)      3r.check  to  (rd')
     (rd')  4    2            >?~?
     (#)    0c   0a   6   2   >?~?+?~?
     (a)    @    ( op.code)   +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         4000  3f.nz[5:4|9:6|2|3]rd'2o:  c.lw_R,#
   original.mnemonic?  off        4000  3f.nz[5:4|9:6|2|3]rd'2o:  c.R=#

   original.mnemonic?  on         c000  3f.nz[5:4|9:6|2|3]rd'2o:  c.sw_R,#
   original.mnemonic?  off        c000  3f.nz[5:4|9:6|2|3]rd'2o:  c.R=#   
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  funct3 imm[12:10] rs1/rd1' imm    rd'    opcode            CS-type        Store Word    4
\    3f      3#       3r      2#     3r      2o               3f3#3r2#3r2o
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,R,#      sw  rs1・, (4*imm)(rs2・)
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.and_R,R,#     and rd・, rd・, rs2・
\  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             c001     c.or_R,R,#      or  rd・, rd・, rs2・
\  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             a001     c.xor_R,R,#     xor rd・, rd・, rs2・
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             8001     c.sub_R,R,#     sub rd・, rd・, rs2・
\ -------------------------------------------------------------------------------------------------------------
: `3f3#3r2#3r2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#3r2#3r2o:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  , 
     :.mnem_ ." `3f3#3r2#3r2o"  #=if4 ."  4 2 12p   9 7 13p   0c 0a 6 5 24p"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  5#.check  to (#)   3r.check   to (Rs1)   3r.check  to (Rd)
     (Rd)   4   2            >?~?
     (Rs1)  9   7            >?~?       +
     (#)    0c  0a   6   5   >?~?+?~?   +
     (a)    @    ( op.code)             +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c000  3f3#3r2#3r2o:  c.sw_R,R,#
   original.mnemonic?  off        c000  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         e001  3f3#3r2#3r2o:  c.and_R,R,#
   original.mnemonic?  off        e001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         c001  3f3#3r2#3r2o:  c.or_R,R,#
   original.mnemonic?  off        c001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         a001  3f3#3r2#3r2o:  c.xor_R,R,#
   original.mnemonic?  off        a001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         8001  3f3#3r2#3r2o:  c.sub_R,R,#
   original.mnemonic?  off        8001  3f3#3r2#3r2o:  c.R=#?
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
0 [if]   { ( comment: ) 

: #[u:l]   ( upper lower -- n )       >r >r
  (#)  32/64.bit r> - dup>r  lshift   r> r> +  1-  rshift  ;
\ (#)  32/64.bit 5  - dup>r  lshift   r> 3  +  1-  rshift  ;


: (#)5:3  ( -- n )   (#)  32/64.bit 5 - dup>r  lshift   r> 3 +  1-  rshift  ;

: (#)5:3  ( -- n )   5  3  #[u:l]  ;
: (#)2:2  ( -- n )   2  2  #[u:l]  ;
: (#)6:6  ( -- n )   6  6  #[u:l]  ;

: [5:3][2|6]    ( -- # )   (#)5:3 3 lshift   (#)2:2 2 lshift   +   (#)6:6 6 lshift   +  ;
: [5:3][2|6]/4  ( -- # )   [5:3][2|6]  4/  ;


: imm[5:3]+imm[2|6]_>?~?+?~?+?~?  ( -- # )
   (#)5:3   0c  0a  >?~?
   (#)2:2   6    6  >?~?    +
   (#)6:6   5    5  >?~?    +  ;

` 3f..imm[5:3].rs1'.imm[2|6].rs2'.2o   ( a -- a op.code )   dup   16@'  e003  and  ;
: 3f..imm[5:3].rs1'.imm[2|6].rs2'.2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f1#5r5#2o"  #=if2 ."  9 7 12p  4 2 13p  imm[5:3]+imm[2|6]_14p "  .3"  mnem"  xt0
   does>    ( rs1' rs2' # a )  to (a)   5#*4.check  to (#)   rs2'.check  to (rs2')  rs1'.check  to (rs1')
     (Rs1')   9    7            >?~?
     (Rs2')   4    2            >?~?
\    (#)      imm[5:3]+imm[2|6]_>?~?+?~?+?~?  +
     (#)5:3   0c  0a            >?~?          +
     (#)2:2   6    6            >?~?          +
     (#)6:6   5    5            >?~?          +
     (a)      @    ( op.code)                 +
     16,'     ;

: `3f1#5r5#2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f1#5r5#2o:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f1#5r5#2o"  #=if2 ."  9  7 13p  0c 0a  6  2  24p[12:10,6:2]"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   5r.check  to (Rd)  11#[12:2].check  to (#)
     (Rd)   9    7               >?~?
     (#)    0c  0a   6   2   >?~?+?~?  +
     (a)    @    ( op.code)            +
     16,'   ;








[then]  \ } ( comment; ) 





\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  funct3 imm[12:10]  rs1'     imm[6:2]     opcode            CB-type    7
\    3f      3#       3r          5#         2o               3f3#[12:10]3r5#[6:2]2o
\  f  f  f  #  #  #  r  r  r  #  #  #  #  #  c  c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             c001     c.beqz_R,#
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.bnez_R,#
\  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             0001     c.srli_R,#
\  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             2001     c.srai_R,#
\  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             4001     c.andi_R,#

\ funct3 imm rd・/rs1・ imm rs2・ op CS-type
\ funct3 imm rs1・ imm op CB-type
\ -------------------------------------------------------------------------------------------------------------
: `3f3#[12:10]3r5#[6:2]2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#[12:10]3r5#[6:2]2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f3#[12:10]3r5#[6:2]2o"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( Rd # a )  to (a)    11#[12:2].check  to (#)   3r.check  to (Rd)
     (#)    0c   0a   6   2       >?~?+?~?
     (rd)   9    7                >?~?       +
     (a)    @    ( op.code)                  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c001  3f3#[12:10]3r5#[6:2]2o:  c.beqz_R,#
   original.mnemonic?  off        c001  3f3#[12:10]3r5#[6:2]2o:  c.R=#?

   original.mnemonic?  on         e001  3f3#[12:10]3r5#[6:2]2o:  c.bnez_#
   original.mnemonic?  off        e001  3f3#[12:10]3r5#[6:2]2o:  c.R<>#?

   original.mnemonic?  on         0001  3f3#[12:10]3r5#[6:2]2o:  c.srli_#
   original.mnemonic?  off        0001  3f3#[12:10]3r5#[6:2]2o:  c.R>>#

   original.mnemonic?  on         2001  3f3#[12:10]3r5#[6:2]2o:  c.srai_R,#
   original.mnemonic?  off        2001  3f3#[12:10]3r5#[6:2]2o:  c.R>>#,a

   original.mnemonic?  on         4001  3f3#[12:10]3r5#[6:2]2o:  c.andi_R,#
   original.mnemonic?  off        4001  3f3#[12:10]3r5#[6:2]2o:  c.Rn#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------------------------------- -----
\  funct3       offset[12:2]                opcode            CJ-type   5
\    3f            11#[12:2]                  2o              3f11#[12:2]2o
\  f  f  f  #  #  #  #  #  #  #  #  #  #  #  c  c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\  1  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             a001     c.j_#
\  0  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             2001     c.jal_#
\ -------------------------------------------------------------------------------------------------------------
: `3f11#[12:2]2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f11#[12:2]2o:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,   
     :.mnem_ ." `3f11#[12:2]2o"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   2       >?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         a001  3f11#[12:2]2o:  c.j_#
   original.mnemonic?  off        a001  3f11#[12:2]2o:  c.jmp_#

   original.mnemonic?  on         2001  3f11#[12:2]2o:  c.jal_#
   original.mnemonic?  off        2001  3f11#[12:2]2o:  c.call_#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************

[then]  \ #then


swiftForth?  @
[if]         \\
[else]       \s
[then]












:  R+R   ( r1 r2 -- )  >r  dup  r>  R=R+R  ;

\ **************************************************************************************
\ **************************************************************************************
\ the disassembler is generated automatically
: add_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00000003 = if (4  0b  7  12p   13  0f  13p   18  14  14p          3" add_R,R,R"
                                                                                                  exit then 0 ;

: R=R+R_
  `7f5r5r3f5r7c              00000003 = if (4  0b  7  12p   13  0f  13p   18  14  14p          3" R=R+R"
                                                                                                  exit then 0 ;

\ **************************************************************************************
\ the simulator is generated automatically
: add_R,R,R_simulate                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00000003 = if (4  0b  7  12p   13  0f  13p   18  14  14p          execute"add_R,R,R"
                                                                                                  exit then 0 ;

: R=R+R_simulate
  `7f5r5r3f5r7c              00000003 = if (4  0b  7  12p   13  0f  13p   18  14  14p          execute"R=R+R"
                                                                                                  exit then 0 ;

: execute"add_R,R,R   to (Rs2)  to (Rs1)  to (Rd)  (Rs1) (Rs2) +   to (Rd)  ;
\ }  ( comment; ) 














RV32I Base Instruction Set

imm[31:12] rd 0110111 LUI
imm[31:12] rd 0010111 AUIPC
imm[20|10:1|11|19:12] rd 1101111 JAL
imm[11:0] rs1 000 rd 1100111 JALR
imm[12|10:5] rs2 rs1 000 imm[4:1|11] 1100011 BEQ
imm[12|10:5] rs2 rs1 001 imm[4:1|11] 1100011 BNE
imm[12|10:5] rs2 rs1 100 imm[4:1|11] 1100011 BLT
imm[12|10:5] rs2 rs1 101 imm[4:1|11] 1100011 BGE
imm[12|10:5] rs2 rs1 110 imm[4:1|11] 1100011 BLTU
imm[12|10:5] rs2 rs1 111 imm[4:1|11] 1100011 BGEU
imm[11:0] rs1 000 rd 0000011 LB
imm[11:0] rs1 001 rd 0000011 LH
imm[11:0] rs1 010 rd 0000011 LW
imm[11:0] rs1 100 rd 0000011 LBU
imm[11:0] rs1 101 rd 0000011 LHU
imm[11:5] rs2 rs1 000 imm[4:0] 0100011 SB
imm[11:5] rs2 rs1 001 imm[4:0] 0100011 SH
imm[11:5] rs2 rs1 010 imm[4:0] 0100011 SW
imm[11:0] rs1 000 rd 0010011 ADDI
imm[11:0] rs1 010 rd 0010011 SLTI
imm[11:0] rs1 011 rd 0010011 SLTIU
imm[11:0] rs1 100 rd 0010011 XORI
imm[11:0] rs1 110 rd 0010011 ORI
imm[11:0] rs1 111 rd 0010011 ANDI
0000000 shamt rs1 001 rd 0010011 SLLI
0000000 shamt rs1 101 rd 0010011 SRLI
0100000 shamt rs1 101 rd 0010011 SRAI   \ ok
0000000 rs2 rs1 000 rd 0110011 ADD
0100000 rs2 rs1 000 rd 0110011 SUB
0000000 rs2 rs1 001 rd 0110011 SLL
0000000 rs2 rs1 010 rd 0110011 SLT
0000000 rs2 rs1 011 rd 0110011 SLTU
0000000 rs2 rs1 100 rd 0110011 XOR
0000000 rs2 rs1 101 rd 0110011 SRL
0100000 rs2 rs1 101 rd 0110011 SRA
0000000 rs2 rs1 110 rd 0110011 OR
0000000 rs2 rs1 111 rd 0110011 AND
0000 pred succ 00000 000 00000 0001111 FENCE
0000 0000 0000 00000 001 00000 0001111 FENCE.I
000000000000 00000 000 00000 1110011 ECALL
000000000001 00000 000 00000 1110011 EBREAK
csr rs1 001 rd 1110011 CSRRW
csr rs1 010 rd 1110011 CSRRS
csr rs1 011 rd 1110011 CSRRC
csr zimm 101 rd 1110011 CSRRWI
csr zimm 110 rd 1110011 CSRRSI
csr zimm 111 rd 1110011 CSRRCI


\ RV32I Base Instruction Set
\ ***********************************************************************************
\ imm[31:12] rd 0110111 LUI
\ imm[31:12]                rd   011 0111   LUI
\ #### #### #### #### #### rrrr rccc cccc   20#[31:12]5r7c
\ 0000 0000 0000 0000 0000 0000 0111 1111   0000007f  mask
\ -----------------------------------------------------------------------------
\ imm[31:12] rd 0110111 LUI
\ #### #### #### #### #### rrrr rccc cccc   20#[31:12]5r7c
\ 0000 0000 0000 0000 0000 0000 0011 0111   00000037  opcode   LUI

\ imm[31:12] rd 0010111 AUIPC
\ #### #### #### #### #### rrrr rccc cccc   20#[31:12]5r7c
\ 0000 0000 0000 0000 0000 0000 0001 0111   00000017  opcode   AUIPC
\ ***********************************************************************************
\ ***********************************************************************************
\ #### #### #### #### #### rrrr rccc cccc   20#[20|10:1|11|19:12]5r7c
\ 0000 0000 0000 0000 0000 0000 0111 1111   0000007f  mask
\ -----------------------------------------------------------------------------------
\ imm[20|10:1|11|19:12] rd 1101111 JAL
\ 0000 0000 0000 0000 0000 0000 0110 1111   0000006f  opcode   JAL
\ ***********************************************************************************
\ ***********************************************************************************
\ #### #### #### rrrr rfff rrrr rccc cccc   12#[11:0]5r3f5r7c
\ 0000 0000 0000 0000 0000 0000 0111 1111   0000007f   mask
\ -----------------------------------------------------------------------------------
\ imm[11:0]      --rs1-000 --rd--110 0111   JALR
\ 0000 0000 0000 0000 0000 0000 0110 0111   00000067   opcode   JALR

\ imm[11:0]      --rs1-000 --rd--000 0011   LB
\ 0000 0000 0000 0000 0000 0000 0000 0011   00000003   opcode   LB

\ imm[11:0]      --rs1-001 --rd--000 0011   LH
\ 0000 0000 0000 0000 0001 0000 0000 0011   00001003   opcode   LH

\ imm[11:0]      --rs1-010 --rd--000 0011   LW
\ 0000 0000 0000 0000 0010 0000 0000 0011   00002003   opcode   LW

\ imm[11:0]      --rs1-100 --rd--000 0011   LBU
\ 0000 0000 0000 0000 0100 0000 0000 0011   00004003   opcode   LBU

\ imm[11:0]      --rs1-101 --rd--000 0011   LHU
\ 0000 0000 0000 0000 0101 0000 0000 0011   00005003   opcode   LHU

\ imm[11:0]      --rs1-000 --rd--001 0011   ADDI
\ 0000 0000 0000 0000 0000 0000 0001 0011   00000013   opcode   ADDI

\ imm[11:0]      --rs1-010 --rd--001 0011   SLTI
\ 0000 0000 0000 0000 0010 0000 0001 0011   00002013   opcode   SLTI

\ imm[11:0]      --rs1-011 --rd--001 0011   SLTIU
\ 0000 0000 0000 0000 0101 0000 0000 0011   00005003   opcode   SLTIU

\ imm[11:0]      --rs1-100 --rd--001 0011   XORI
\ 0000 0000 0000 0000 0100 0000 0000 0011   00004003   opcode   XORI

\ imm[11:0]      --rs1-110 --rd--001 0011   ORI
\ 0000 0000 0000 0000 0110 0000 0000 0011   00006003   opcode   ORI

\ imm[11:0]      --rs1-111 --rd--001 0011   ANDI
\ 0000 0000 0000 0000 0111 0000 0000 0011   00007003   opcode   ANDI
\ ***********************************************************************************
\ ***********************************************************************************
\ #### ###r rrrr rrrr rfff #### #ccc cccc            7#[12|10:5]5r5r3f5#[4:1|11]7c
\ 0000 0000 0000 0000 0111 0000 0111 1111   0000707f   mask
\ -----------------------------------------------------------------------------------
\ imm[12|10:5] rs2 rs1 000 imm[4:1|11] 1100011 BEQ
\ #### ###--rs2- -rs1--000 #### #110 0011      BEQ
\ 0000 0000 0000 0000 0000 0000 0110 0011   00000063   opcode   BEQ

\ imm[12|10:5] rs2 rs1 001 imm[4:1|11] 1100011 BNE
\ #### ###--rs2- -rs1--000 #### #110 0011
\ 0000 0000 0000 0000 0001 0000 0110 0011   00001063   opcode   BNE

\ imm[12|10:5] rs2 rs1 100 imm[4:1|11] 1100011 BLT
\ #### ###--rs2- -rs1--100 #### #110 0011
\ 0000 0000 0000 0000 0100 0000 0110 0011   00004063   BLT

\ imm[12|10:5] rs2 rs1 101 imm[4:1|11] 1100011 BGE
\ #### ###--rs2- -rs1--101 #### #110 0011
\ 0000 0000 0000 0000 0101 0000 0110 0011   00005063   BGE

\ imm[12|10:5] rs2 rs1 110 imm[4:1|11] 1100011 BLTU
\ #### ###--rs2- -rs1--110 #### #110 0011
\ 0000 0000 0000 0000 0110 0000 0110 0011   00006063   BLTU

\ imm[12|10:5] rs2 rs1 111 imm[4:1|11] 1100011 BGEU
\ #### ###--rs2- -rs1--111 #### #110 0011
\ 0000 0000 0000 0000 0111 0000 0110 0011   00007063   BGEU
\ ***********************************************************************************
\ ***********************************************************************************
\ imm[11:5] rs2 rs1 000 imm[4:0] 0100011 SB
\ #### ###--rs2- -rs1--000 #### #010 0011
\ 0000 0000 0000 0000 0000 0000 0010 0011   00000013   SB

\ imm[11:5] rs2 rs1 001 imm[4:0] 0100011 SH
\ #### ###--rs2- -rs1--001 #### #010 0011
\ 0000 0000 0000 0000 0001 0000 0010 0011   00001023   SH

\ imm[11:5] rs2 rs1 010 imm[4:0] 0100011 SW
\ #### ###--rs2- -rs1--010 #### #010 0011
\ 0000 0000 0000 0000 0010 0000 0010 0011   00002023   SW
\ ***********************************************************************************
\ ***********************************************************************************
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5s5r3f5r7c
\ 1111 1110 0000 0000 0111 0000 0111 1111   fe00707f   mask
\ -----------------------------------------------------------------------------------
\ 0000000 shamt rs1 001 rd 0010011 SLLI
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5s5r3f5r7c
\ 0000 0000 0000 0000 0001 0000 0001 0011   00001013   SLLI

\ 0000000 shamt rs1 101 rd 0010011 SRLI
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5s5r3f5r7c
\ 0000 0000 0000 0000 0101 0000 0001 0011   00005013

\ 0100000 shamt rs1 101 rd 0010011 SRAI
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5s5r3f5r7c
\ 0100 0000 0000 0000 0101 0000 0001 0011   40005013

\ 0000000 rs2 rs1 000 rd 0110011 ADD
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0000 0000 0001 0011   00000033

\ 0100000 rs2 rs1 000 rd 0110011 SUB
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0100 0000 0000 0000 0000 0000 0001 0011   40001013

\ 0000000 rs2 rs1 001 rd 0110011 SLL
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0001 0000 0001 0011   00001013

\ 0000000 rs2 rs1 010 rd 0110011 SLT
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0010 0000 0001 0011   00002013

\ 0000000 rs2 rs1 011 rd 0110011 SLTU
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0011 0000 0001 0011   00003013

\ 0000000 rs2 rs1 100 rd 0110011 XOR
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0100 0000 0001 0011   00004013

\ 0000000 rs2 rs1 101 rd 0110011 SRL
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0101 0000 0001 0011   00005013

\ 0100000 rs2 rs1 101 rd 0110011 SRA
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0100 0000 0000 0000 0101 0000 0001 0011   40005013

\ 0000000 rs2 rs1 110 rd 0110011 OR
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0110 0000 0001 0011   00006013

\ 0000000 rs2 rs1 111 rd 0110011 AND
\ ffff fffs ssss -rs1--fff rrrr rccc cccc   7f5r5r3f5r7c
\ 0000 0000 0000 0000 0111 0000 0001 0011   00007013
\ ***********************************************************************************
\ ***********************************************************************************
\ 0000 pred succ 00000 000 00000 0001111 FENCE
\ cccc pppp ssss cccc cccc cccc cccc cccc    4c4p4s20c:
\ 0000 0000 0000 0000 0000 0000 0000 1111    0000000f   FENCE
\ ***********************************************************************************
\ ***********************************************************************************
\ 0000 0000 0000 00000 001 00000 0001111 FENCE.I
\ cccc cccc cccc cccc cccc cccc cccc cccc    32c:
\ 0000 0000 0000 0000 0001 0000 0000 1111    0000100F

\ 000000000000 00000 000 00000 1110011 ECALL
\ cccc cccc cccc cccc cccc cccc cccc cccc    32c:
\ 0000 0000 0000 0000 0000 0000 0111 0011    00000073   ECALL

\ 00000000 0001 00000 000 00000 1110011 EBREAK
\ cccc cccc cccc cccc cccc cccc cccc cccc    32c:
\ 0000 0000 0001 0000 0000 0000 0111 0011    00100073   EBREAK
\ ***********************************************************************************
\ ***********************************************************************************
\ csr rs1 001 rd 1110011 CSRRW
\                <rs1->001 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0001 0000 0111 0011    00001073     CSRRW

\ csr rs1 010 rd 1110011 CSRRS
\                <rs1->010 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0010 0000 0111 0011    00002073

\ csr rs1 011 rd 1110011 CSRRC
\                <rs1->011 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0011 0000 0111 0011    00003073

\ csr zimm 101 rd 1110011 CSRRWI
\                <rs1->101 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0101 0000 0111 0011    00005073

\ csr zimm 110 rd 1110011 CSRRSI
\                <rs1->110 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0110 0000 0111 0011    00006073

\ csr zimm 111 rd 1110011 CSRRCI
\                <rs1->111 <-rd-><--7c-->    12csr5r3f5r7c:
\ ------csr----- rrrr rfff rrrr rccc cccc
\ 0000 0000 0000 0000 0111 0000 0111 0011    00007073
\ ***********************************************************************************
\ ***********************************************************************************

\s


     c.lwsp       0010  CI   10
     c.swsp       0110  CSS   10
     c.lw         0010  CL   00
     c.sw         0110  CS   00
     c.j          0101  CJ   01
     c.jal        0001  CJ   01
     c.jr         1000  CR   10
     c.jalr       1001  CR   10
     c.beqz       0110  CB   01
     c.bnez       0111  CB   01
     c.li         0010  CI   01
     c.lui        0011  CI   01
     c.addi       0000  CI   01
     c.addi16sp   0011  CI   01
     c.addi4spn   0000  CIW   00
     c.slli       0000  CI   10
     c.srli       0100x00 CB 01
     c.srai       0100x01 CB 01
     c.andi       0100x10 CB 01
     c.mv         1000   CR  10
     c.add        1001   CR  10
     c.and        10001111 CS 01
     c.or         10001110 CS 01
     c.xor        10001101 CS 01
     c.sub        10001100 CS 01
     c.nop        0000     CI 01
     c.ebreak     1001   CR  10


CR-type    4F   rd/rs1   rs2
CI          #   rd/rs1  5#
CSS        6#   rs2
CIW        8#   rd'
CL         3#   rs1'    2#  rd'
CS         3#   rd/rs1  2#  rs2'
CB         3#   rs1'    5#
CJ        11#

CR-type    4f  5rd/rs1   5rs2  2op
CI         3f   #   5rd/rs1  5#  2op
CSS        3f  6#   5rs2          2op
CIW        3f  8#   3rd'         2op
CL         3f  3#   3rs1'    2#  3rd'    2op
CS         3f  3#   5rd/rs1  2#  3rs2'    2op
CB         3f  3#   3rs1'    5#           2op
CJ         3f  11#                        2op


CR-type    4f.5rd/rs1.5rs2.2op      ffff 0000 0000 00cc
CI-type    3f.1#.5rd/rs1.5#.2op     ffff 0000 0000 00cc
CSS-type   3f.6#.5rs2.2op
CIW-type   3f.8#.3rd'.2op
CL-type    3f.3#.3rs1'.2#.3rd'.2op
CS-type    3f.3#.5rd/rs1.2#.3rs2'.2op
CB-type    3f.3#.3rs1'.5#.2op
CJ-type    3f.11#.2op




CR-type    4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc
CI-type    3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc
CSS-type   3f.6#.5rs2.2op                fff# #### #SSS SScc
CIW-type   3f.8#.3rd'.2op                fff# #### ###d ddcc
CL-type    3f.3#.3rs1'.2#.3rd'.2op       fff# ##ss s##d ddcc

CS-type    3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc
CB-type    3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc
CJ-type    3f.11#.2op                    fff# #### #### ##cc


                function     op  type

::  c.swsp     ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  010       0 0000 000 00  10

::  c.swsp     ( CSS-type 3f.6#.5rs2.2op                fff# #### #SSS SScc )  110       0 0000 000 00  10

::  c.lw       ( CIW-type 3f.8#.3rd'.2op                fff# ##ss s##d ddcc )  010       0 0000 000 00   00

::  c.sw       ( CS-type  3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc )  110       0 0000 000 00   00

::  c.j        ( CJ-type  3f.11#.2op                    fff# #### #### ##cc )  101       0 0000 000 00   01
::  c.jal      ( CJ-type  3f.11#.2op                    fff# #### #### ##cc )  001       0 0000 000 00   01

::  c.jr       ( CR-type  4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc )  1000        0000 000 00   10
::  c.jalr     ( CR-type  4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc )  1001        0000 000 00   10

::  c.beqz     ( CB-type  3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc )  110       0 0000 000 00   01
::  c.bnez     ( CB-type  3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc )  111       0 0000 000 00   01

::  c.li       ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  010       0 0000 000 00   01
::  c.lui      ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  011       0 0000 000 00   01
::  c.addi     ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  000       0 0000 000 00   01
::  c.addi16sp ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  011       0 0000 000 00   01

::  c.addi4spn ( CIW-type 3f.8#.3rd'.2op                fff# #### ###d ddcc )  000       0 0000 000 00   01
::  c.slli     ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  000       0 0000 000 00   10

::  c.srli     ( CB-type  3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc )  100x00    0 0000 000 00   01
::  c.srai     ( CB-type  3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc )  100x01    0 0000 000 00   01
::  c.andi     ( CB-type  3f.3#.3rs1'.5#.2op            fff# ##ss s### ##cc )  100x10    0 0000 000 00   10

::  c.mv       ( CR-type  4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc )  1000        0000 000 00   10
::  c.add      ( CR-type  4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc )  1001        0000 000 00   01

::  c.and      ( CS-type  3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc )  10001111  0 0000 000 00   01
::  c.or       ( CS-type  3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc )  10001110  0 0000 000 00   01
::  c.xor      ( CS-type  3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc )  10001101  0 0000 000 00   01
::  c.sub      ( CS-type  3f.3#.3rd'/rs1'.2#.3rs2'.2op  fff# ##dd d##s sscc )  10001100  0 0000 000 00   01

::  c.nop      ( CI-type  3f.1#.5rd/rs1.5#.2op          fff# DDDD D### ##cc )  000       0 0000 000 00   01

::  c.ebreak   ( CR-type  4f.5rd/rs1.5rs2.2op           ffff DDDD DSSS SScc )  1001        0000 000 00   10
\ ---------------------------------------------------------------------------------------
     c.lwsp      010      CI   10
     c.swsp      110      CSS  10
     c.lw        010      CL   00
     c.sw        110      CS   00
     c.j         101      CJ   01
     c.jal       001      CJ   01
     c.jr        1000     CR   10
     c.jalr      1001     CR   10
     c.beqz      110      CB   01
     c.bnez      111      CB   01
     c.li        010      CI   01
     c.lui       011      CI   01
     c.addi      000      CI   01
     c.addi16sp  011      CI   01
     c.addi4spn  000      CIW  00
     c.slli      000      CI   10
     c.srli      100x00   CB   01
     c.srai      100x01   CB   01
     c.andi      100x10   CB   01
     c.mv        1000     CR   10
     c.add       1001     CR   10
     c.and       0001111  CS   01
     c.or        0001110  CS   01
     c.xor       0001101  CS   01
     c.sub       0001100  CS   01
     c.nop       000      CI   01
     c.ebreak    1001     CR   10




https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-1.pdf    86/117








\ -------------------------------------------------------------------------------------------------------------------
\ 16 bit op.code    R32C
\ -------------------------------------------------------------------------------------------------------------------
\ {  ( comment: ) 
: c.jr_R_                                         original.mnemonic? @  not  if  0  exit  then
  `4f5r5c2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" c.jr_R"
                                                                                                  exit then 0 ;
: c.jmp_R_
  `4f5r5c2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" c.jmp_R"
                                                                                                  exit then 0 ;
: c.jalr_R_                                         original.mnemonic? @  not  if  0  exit  then
  `4f5r5c2o                  00009002 = if (2  0b  7  13p  6  2  14p                           2" c.jalr_R"
                                                                                                  exit then 0 ;
: c.jmp_R.Link_
  `4f5r5c2o                  00009002 = if (2  0b  7  13p  6  2  14p                           2" c.jmp_R.Link"
                                                                                                  exit then 0 ;
: c.mv_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" c.mv_R,R"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=R isn't unique
: c.R=R_
  `3f#[5]2c3r'#[4:0]2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" R=R"
                                                                                                  exit then 0 ;
: c.srai_R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" c.srai_R,R"
                                                                                                  exit then 0 ;
: c.R>>R,a_
  `3f#[5]2c3r'#[4:0]2o                  00008002 = if (2  0b  7  13p  6  2  14p                           2" R>>R,a"
                                                                                                  exit then 0 ;
: c.andi_R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o                  00009002 = if (2  0b  7  13p  6  2  14p                           2" c.andi_R,R"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: RNR isn't unique
: c.RnR_
  `3f#[5]2c3r'#[4:0]2o                  00009002 = if (2  0b  7  13p  6  2  14p                           2" RnR"
                                                                                                  exit then 0 ;
: c.beqz_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f1#5r5#2o                0000C001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" c.beqz_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f1#5r5#2o                0000C001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" R=#?"
                                                                                                  exit then 0 ;
: c.bnez_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1#5r5#2o                0000E001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" c.bnez_#"
                                                                                                  exit then 0 ;
: c.R<>#?_
  `3f1#5r5#2o                0000E001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" R<>#?"
                                                                                                  exit then 0 ;
: c.srli_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1#5r5#2o                00000001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" c.srli_#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R>># isn't unique
: c.R>>#_
  `3f1#5r5#2o                00000001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" R>>#"
                                                                                                  exit then 0 ;
: c.srai_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f1#5r5#2o                00002001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" c.srai_R,#"
                                                                                                  exit then 0 ;
: c.R>>#,a_
  `3f1#5r5#2o                00002001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" R>>#,a"
                                                                                                  exit then 0 ;
: c.andi_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f1#5r5#2o                00004001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" c.andi_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: RN# isn't unique
: c.Rn#_
  `3f1#5r5#2o                00004001 = if (2  9  7 13p  0c 0a  6  2  24p[12:10,6:2]           2" Rn#"
                                                                                                  exit then 0 ;
: c.cwsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f6#5r2o                  0000C002 = if (2   0c  7  13p   6  2  14p                         2" c.cwsp_R,#"
                                                                                                  exit then 0 ;
: c.(sp+#*4)=R_
  `3f6#5r2o                  0000C002 = if (2   0c  7  13p   6  2  14p                         2" (sp+#*4)=R"
                                                                                                  exit then 0 ;
: c.addi4spn_R,sp+#*4_                              original.mnemonic? @  not  if  0  exit  then
  `3f8#3r2o                  00000000 = if (2  4  2 13p   0c 5 14p                             2" c.addi4spn_R,sp+#*4"
                                                                                                  exit then 0 ;
: c.R=sp+#*4_
  `3f8#3r2o                  00000000 = if (2  4  2 13p   0c 5 14p                             2" R=sp+#*4"
                                                                                                  exit then 0 ;
: c.lw_R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              00004000 = if (2  0c  2  14p[12:2]                                1" c.lw_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=# isn't unique
: c.R=#_
  `3f3#3r2#3r2o              00004000 = if (2  0c  2  14p[12:2]                                1" R=#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: `3F3#3R2#3R2o isn't unique
\ from file: risc-v10.f word: 3F3#3R2#3R2o: isn't unique
: c.sw_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" c.sw_R,R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" R=#?"
                                                                                                  exit then 0 ;
: c.and_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" c.and_R,R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" R=#?"
                                                                                                  exit then 0 ;
: c.or_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" c.or_R,R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" R=#?"
                                                                                                  exit then 0 ;
: c.xor_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" c.xor_R,R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" R=#?"
                                                                                                  exit then 0 ;
: c.sub_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" c.sub_R,R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p               3" R=#?"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: C.BEQZ_R,# isn't unique
: c.beqz_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                1" c.beqz_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=#? isn't unique
: c.R=#?_
  `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                1" R=#?"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: C.BNEZ_# isn't unique
: c.bnez_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                1" c.bnez_#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R<>#? isn't unique
: c.R<>#?_
  `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                1" R<>#?"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: C.SRLI_# isn't unique
: c.srli_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                1" c.srli_#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R>># isn't unique
: c.R>>#_
  `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                1" R>>#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: C.SRAI_R,# isn't unique
: c.srai_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                1" c.srai_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R>>#,A isn't unique
: c.R>>#,a_
  `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                1" R>>#,a"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: C.ANDI_R,# isn't unique
: c.andi_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                1" c.andi_R,#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: RN# isn't unique
: c.Rn#_
  `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                1" Rn#"
                                                                                                  exit then 0 ;
: c.j_#_                                            original.mnemonic? @  not  if  0  exit  then
  `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                1" c.j_#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: JMP_# isn't unique
: c.jmp_#_
  `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                1" jmp_#"
                                                                                                  exit then 0 ;
: c.jal_#_                                          original.mnemonic? @  not  if  0  exit  then
  `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                1" c.jal_#"
                                                                                                  exit then 0 ;
\ from file: risc-v10.f word: R=R+R isn't unique
: c.call_#_
  `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                1" call_#"
                                                                                                  exit then 0 ;
\ }  ( comment; ) 





000.nzimm[5:4|9:6|2|3].rd'.00   C.ADDI4SPN
3f .nzimm[5:4|9:6|2|3].rd'2o


001imm[5:3]rs1'imm[7:6]rd'00   C.FLD
3f imm[5:3]rs1'imm[7:6]rd'2o


010imm[5:3]rs1'imm[2|6]rd'00   C.LW
3f imm[5:3]rs1'imm[2|6]rd'2o


011 imm[5:3]rs1'imm[7:6]rd'00 C.LD
3f  imm[5:3]rs1'imm[7:6]rd'2o



101 imm[5:3] rs1' imm[7:6] rs2' 00 C.FSD
3f imm[5:3]rs1'imm[7:6]rd'2o

110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW


111 imm[5:3] rs1' imm[7:6] rs2' 00 C.SD
3f imm[5:3]rs1'imm[7:6]rd'2o

000 0 0 0 01 C.NOP

000 nzimm[5] rs1/rd<>0 nzimm[4:0] 01 C.ADDI
3f  nzimm[5] rs1/rd<>0 nzimm[4:0] 2o


001 imm[5] rs1/rd<>0 imm[4:0] 01 C.ADDIW
3f  imm[5] rs1/rd<>0 imm[4:0] 2o


010 imm[5] rs1/rd<>0 imm[4:0] 01 C.LI
3f  imm[5] rs1/rd<>0 imm[4:0] 2o


011 nzimm[9] 2     nzimm[4|6|8:7|5] 01 C.ADDI16SP
3f  nzimm[9] 00010 nzimm[4|6|8:7|5] 2o

011 nzimm[17] rs1/rd<>{0,2} nzimm[16:12] 01 C.LUI
3f  nzimm[17] rs1/rd<>{0,2} nzimm[16:12] 2o


100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
3f  nzimm[5] 00 rs1'/rd' nzimm[4:0] 2o


100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI
3f  nzimm[5] 00 rs1'/rd' nzimm[4:0] 2o


100 imm[5] 10 rs1'/rd' imm[4:0] 01 C.ANDI
3f  imm[5] 10 rs1'/rd' imm[4:0] 2o


100 0 11 rs1'/rd' 00 rs2' 01 C.SUB
3f  0 11 rs1'/rd' 00 rs2' 2o


100 0 11 rs1'/rd' 01 rs2' 01 C.XOR
100 0 11 rs1'/rd' 01 rs2' 2o


100 0 11 rs1'/rd' 10 rs2' 01 C.OR
100 0 11 rs1'/rd' 10 rs2' 2o


100 0 11 rs1'/rd' 11 rs2' 01 C.AND
100 0 11 rs1'/rd' 11 rs2' 2o


100 1 11 rs1'/rd' 00 rs2' 01 C.SUBW
100 0 11 rs1'/rd' 00 rs2' 2o


100 1 11 rs1'/rd' 01 rs2' 01 C.ADDW
100 0 11 rs1'/rd' 01 rs2' 2o


101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J
3f  offset[11|4|9:8|10|6|7|3:1|5] 2o


110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ
3f  offset[8|4:3] rs1' offset[7:6|2:1|5] 2o















000.nzimm[5:4|9:6|2|3].rd'.00   C.ADDI4SPN
3f .nzimm[5:4|9:6|2|3].rd'2o


001imm[5:3]rs1'imm[7:6]rd'00   C.FLD
3f imm[5:3]rs1'imm[7:6]rd'2o


010imm[5:3]rs1'imm[2|6]rd'00   C.LW
3f imm[5:3]rs1'imm[2|6]rd'2o


011 imm[5:3]rs1'imm[7:6]rd'00 C.LD
3f  imm[5:3]rs1'imm[7:6]rd'2o



101 imm[5:3] rs1' imm[7:6] rs2' 00 C.FSD
3f imm[5:3]rs1'imm[7:6]rd'2o








110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW
3f  imm[5:3] rs1' imm[2|6] rs2' 2o


\ 110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW

20 ( 32 ) value 32/64.bit

: #[u:l]   ( upper lower -- n )       >r >r
  (#)  32/64.bit r> - dup>r  lshift   r> r> +  1-  rshift  ;
\ (#)  32/64.bit 5  - dup>r  lshift   r> 3  +  1-  rshift  ;


: (#)5:3  ( -- n )   (#)  32/64.bit 5 - dup>r  lshift   r> 3 +  1-  rshift  ;

: (#)5:3  ( -- n )   5  3  #[u:l]  ;
: (#)2:2  ( -- n )   2  2  #[u:l]  ;
: (#)6:6  ( -- n )   6  6  #[u:l]  ;


: imm[5:3]+imm[2|6]_>?~?+?~?+?~?  ( -- # )
   (#)5:3   0c  0a  >?~?
   (#)2:2   6    6  >?~?    +
   (#)6:6   5    5  >?~?    +  ;



` 3f..imm[5:3].rs1'.imm[2|6].rs2'.2o   ( a -- a op.code )   dup   16@'  e003  and  ;
: 3f..imm[5:3].rs1'.imm[2|6].rs2'.2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f1#5r5#2o"  #=if2 ."  9 7 12p  3 2 13p  imm[5:3]+imm[2|6]_14p "  .3"  mnem"  xt0
   does>    ( rs1' rs2' # a )  to (a)   5#*4.check  to (#)   rs2'.check  to (rs2')  rs1'.check  to (rs1')
     (Rs1')   9    7            >?~?
     (Rs2')   4    2            >?~?
\    (#)      imm[5:3]+imm[2|6]_>?~?+?~?+?~?  +
     (#)5:3   0c  0a            >?~?          +
     (#)2:2   6    6            >?~?          +
     (#)6:6   5    5            >?~?          +
     (a)      @    ( op.code)                 +
     16,'     ;

: `3f1#5r5#2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f1#5r5#2o:         ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f1#5r5#2o"  #=if2 ."  9  7 13p  0c 0a  6  2  24p[12:10,6:2]"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   5r.check  to (Rd)  11#[12:2].check  to (#)
     (Rd)   9    7               >?~?
     (#)    0c  0a   6   2   >?~?+?~?  +
     (a)    @    ( op.code)            +
     16,'   ;









111 imm[5:3] rs1' imm[7:6] rs2' 00 C.SD
3f  imm[5:3] rs1' imm[7:6] rs2' 2o

000 0 0 0 01 C.NOP



000 nzimm[5] rs1/rd<>0 nzimm[4:0] 01 C.ADDI
3f  nzimm[5] rs1/rd<>0 nzimm[4:0] 2o


001 imm[5] rs1/rd<>0 imm[4:0] 01 C.ADDIW
3f  imm[5] rs1/rd<>0 imm[4:0] 2o
010 imm[5] rs1/rd<>0 imm[4:0] 01 C.LI
3f  imm[5] rs1/rd<>0 imm[4:0] 2o


011 nzimm[9] 2     nzimm[4|6|8:7|5] 01 C.ADDI16SP
3f  nzimm[9] 00010 nzimm[4|6|8:7|5] 2o

011 nzimm[17] rs1/rd<>{0,2} nzimm[16:12] 01 C.LUI
3f  nzimm[17] rs1/rd<>{0,2} nzimm[16:12] 2o


100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
3f  nzimm[5] 00 rs1'/rd' nzimm[4:0] 2o


100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI
3f  nzimm[5] 00 rs1'/rd' nzimm[4:0] 2o


100 imm[5] 10 rs1'/rd' imm[4:0] 01 C.ANDI
3f  imm[5] 10 rs1'/rd' imm[4:0] 2o


100 0 11 rs1'/rd' 00 rs2' 01 C.SUB
3f  0 11 rs1'/rd' 00 rs2' 2o


100 0 11 rs1'/rd' 01 rs2' 01 C.XOR
100 0 11 rs1'/rd' 01 rs2' 2o


100 0 11 rs1'/rd' 10 rs2' 01 C.OR
100 0 11 rs1'/rd' 10 rs2' 2o


100 0 11 rs1'/rd' 11 rs2' 01 C.AND
100 0 11 rs1'/rd' 11 rs2' 2o


100 1 11 rs1'/rd' 00 rs2' 01 C.SUBW
100 0 11 rs1'/rd' 00 rs2' 2o


100 1 11 rs1'/rd' 01 rs2' 01 C.ADDW
100 0 11 rs1'/rd' 01 rs2' 2o


101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J
3f  offset[11|4|9:8|10|6|7|3:1|5] 2o


110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ
3f  offset[8|4:3] rs1' offset[7:6|2:1|5] 2o









CHAPTER 5. THE RISC-V COMPRESSED ISA EXTENSION 72
Instruction Format Base Instruction Meaning
C.ADD CR add rd, rd, rs2 Add registers
C.ADDI CI addi rd, rd, imm[5:0] Increment register
C.ADDI16SP CI addi x2, x2, imm[9:4] Adjust stack pointer
C.ADDI4SPN CIW addi rd0, x2, imm[9:2] Compute address of stack variable
C.ADDIW CI addiw rd, rd, imm[5:0] Increment 32-bit register (RV64)
C.ADDW CR addw rd, rd, rs2 Add 32-bit registers (RV64)
C.AND CS and rd0, rd0, rs20 Bitwise AND registers
C.ANDI CI andi rd0, rd0, imm[5:0] Bitwise AND immediate
C.BEQZ CB beq rs10, x0, offset[8:1] Branch if zero
C.BNEZ CB bne rs10, x0, offset[8:1] Branch if nonzero
C.EBREAK CR ebreak Breakpoint
C.FLD CL fld rd0, offset[7:3](rs10) Load double float
C.FLDSP CI fld rd, offset[8:3](x2) Load double float, stack
C.FLW CL flw rd0, offset[6:2](rs10) Load single float (RV32)
C.FLWSP CI flw rd, offset[7:2](x2) Load single float, stack (RV32)
C.FSD CL fsd rs20, offset[7:3](rs10) Store double float
C.FSDSP CSS fsd rs2, offset[8:3](x2) Store double float to stack
C.FSW CL fsw rs20, offset[6:2](rs10) Store single float (RV32)
C.FSWSP CSS fsw rs2, offset[7:2](x2) Store single float to stack (RV32)
C.J CJ jal x0, offset[11:1] Jump
C.JAL CJ jal x1, offset[11:1] Jump and link (RV32)
C.JALR CR jalr x1, rs1, 0 Jump and link register
C.JR CR jalr x0, rs1, 0 Jump register
C.LD CL ld rd0, offset[7:3](rs10) Load double-word (RV64)
C.LDSP CI ld rd, offset[8:3](x2) Load double-word, stack (RV64)
C.LI CI addi rd, x0, imm[5:0] Load immediate
C.LUI CI lui rd, imm[17:12] Load upper immediate
C.LW CL lw rd0, offset[6:2](rs10) Load word
C.LWSP CI lw rd, offset[7:2](x2) Load word, stack
C.MV CR add rd, x0, rs2 Copy register
C.OR CS or rd0, rd0, rs20 Bitwise OR registers
C.SD CL sd rs20, offset[7:3](rs10) Store double-word (RV64)
C.SDSP CSS sd rs2, offset[8:3](x2) Store double-word to stack (RV64)
C.SLLI CI slli rd, rd, imm[5:0] Shift left, immediate
C.SRAI CB srai rd0, rd0, imm[5:0] Arithmetic shift right, immediate
C.SRLI CB srli rd0, rd0, imm[5:0] Logical shift right, immediate
C.SUB CS sub rd0, rd0, rs20 Subtract registers
C.SUBW CS subw rd0, rd0, rs20 Subtract 32-bit registers (RV64)
C.SW CL sw rs20, offset[6:2](rs10) Store word
C.SWSP CSS sw rs2, offset[7:2](x2) Store word to stack
C.XOR CS xor rd0, rd0, rs20 Bitwise XOR registers
Table 5.3: RV32C and RV64C instructi





000 nzimm[5:4|9:6|2|3] rd0 00 C.ADDI4SPN
001 imm[5:3] rs10
imm[7:6] rd0 00 C.FLD
010 imm[5:3] rs10
imm[2|6] rd0 00 C.LW
011 imm[5:3] rs10
imm[7:6] rd0 00 C.LD
101 imm[5:3] rs10
imm[7:6] rs20 00 C.FSD
110 imm[5:3] rs10
imm[2|6] rs20 00 C.SW
111 imm[5:3] rs10
imm[7:6] rs20 00 C.SD
000 0 0 0 01 C.NOP
000 nzimm[5] rs1/rd6=0 nzimm[4:0] 01 C.ADDI
001 imm[5] rs1/rd6=0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd6=0 imm[4:0] 01 C.LI
011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP
011 nzimm[17] rs1/rd6={0, 2} nzimm[16:12] 01 C.LUI
100 nzimm[5] 00 rs10/rd0 nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs10/rd0 nzimm[4:0] 01 C.SRAI
100 imm[5] 10 rs10/rd0
imm[4:0] 01 C.ANDI
100 0 11 rs10/rd0 00 rs20 01 C.SUB
100 0 11 rs10/rd0 01 rs20 01 C.XOR
100 0 11 rs10/rd0 10 rs20 01 C.OR
100 0 11 rs10/rd0 11 rs20 01 C.AND
100 1 11 rs10/rd0 00 rs20 01 C.SUBW
100 1 11 rs10/rd0 01 rs20 01 C.ADDW
101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J
110 offset[8|4:3] rs10 offset[7:6|2:1|5] 01 C.BEQZ


111 offset[8|4:3] rs10 offset[7:6|2:1|5] 01 C.BNEZ
000 nzimm[5] rd6=0 nzimm[4:0] 10 C.SLLI
001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP
010 imm[5] rd6=0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd6=0 imm[4:3|8:6] 10 C.LDSP
100 0 rs16=0 0 10 C.JR
100 0 rd6=0 rs26=0 10 C.MV
100 1 0 0 10 C.EBREAK
100 1 rs16=0 0 10 C.JALR
100 1 rd6=0 rs26=0 10 C.ADD
101 imm[5:3|8:6] rs2 10 C.FSDSP
110 imm[5:2|7:6] rs2 10 C.SWSP
111 imm[5:3|8:6] rs2 10 C.SDSP










000 nzimm[5:4|9:6|2|3] rd0 00 C.ADDI4SPN


001 imm[5:3] rs10 imm[7:6] rd0 00 C.FLD
010 imm[5:3] rs10 imm[2|6] rd0 00 C.LW
011 imm[5:3] rs10 imm[7:6] rd0 00 C.LD


101 imm[5:3] rs10 imm[7:6] rs20 00 C.FSD
110 imm[5:3] rs10 imm[2|6] rs20 00 C.SW
111 imm[5:3] rs10 imm[7:6] rs20 00 C.SD


000 0 0 0 01 C.NOP


000 nzimm[5] rs1/rd6=0 nzimm[4:0] 01 C.ADDI


001 imm[5] rs1/rd6=0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd6=0 imm[4:0] 01 C.LI



011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP


011 nzimm[17] rs1/rd6={0, 2} nzimm[16:12] 01 C.LUI


100 nzimm[5] 00 rs1'/rd0 nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs1'/rd0 nzimm[4:0] 01 C.SRAI


100 imm[5] 10 rs10/rd'imm[4:0] 01 C.ANDI


100 0 11 rs10/rd0 00 rs20 01 C.SUB
100 0 11 rs10/rd0 01 rs20 01 C.XOR
100 0 11 rs10/rd0 10 rs20 01 C.OR
100 0 11 rs10/rd0 11 rs20 01 C.AND
100 1 11 rs10/rd0 00 rs20 01 C.SUBW
100 1 11 rs10/rd0 01 rs20 01 C.ADDW


101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J


110 offset[8|4:3] rs10 offset[7:6|2:1|5] 01 C.BEQZ
111 offset[8|4:3] rs10 offset[7:6|2:1|5] 01 C.BNEZ


000 nzimm[5] rd6=0 nzimm[4:0] 10 C.SLLI


001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP


010 imm[5] rd6=0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd6=0 imm[4:3|8:6] 10 C.LDSP



100 0 rs16=0 0 10 C.JR
100 1 rs16=0 0 10 C.JALR


100 0 rd6=0 rs26=0 10 C.MV
100 1 rd6=0 rs26=0 10 C.ADD


100 1 0 0 10 C.EBREAK


101 imm[5:3|8:6] rs2 10 C.FSDSP
110 imm[5:2|7:6] rs2 10 C.SWSP
111 imm[5:3|8:6] rs2 10 C.SDSP



















000 nzimm[5:4|9:6|2|3] rd' 00 C.ADDI4SPN


001 imm[5:3] rs1' imm[7:6] rd' 00 C.FLD
010 imm[5:3] rs1' imm[2|6] rd' 00 C.LW
011 imm[5:3] rs1' imm[7:6] rd' 00 C.LD


101 imm[5:3] rs1' imm[7:6] rs20 00 C.FSD
110 imm[5:3] rs1' imm[2|6] rs20 00 C.SW
111 imm[5:3] rs1' imm[7:6] rs20 00 C.SD


000 0 0 0 01 C.NOP


000 nzimm[5] rs1/rd'<>0 nzimm[4:0] 01 C.ADDI


001 imm[5] rs1/rd'<>0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd'<>0 imm[4:0] 01 C.LI



011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP


011 nzimm[17] rs1/rd6={0, 2} nzimm[16:12] 01 C.LUI


100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI


100 imm[5] 10 rs1'/rd'imm[4:0] 01 C.ANDI


100 0 11 rs1'/rd' 00 rs20 01 C.SUB
100 0 11 rs1'/rd' 01 rs20 01 C.XOR
100 0 11 rs1'/rd' 10 rs20 01 C.OR
100 0 11 rs1'/rd' 11 rs20 01 C.AND
100 1 11 rs1'/rd' 00 rs20 01 C.SUBW
100 1 11 rs1'/rd' 01 rs20 01 C.ADDW


101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J


110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ
111 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BNEZ


000 nzimm[5] rd'<>0 nzimm[4:0] 10 C.SLLI


001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP


010 imm[5] rd'<>0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd'<>0 imm[4:3|8:6] 10 C.LDSP



100 0 rs16=0 0 10 C.JR
100 1 rs16=0 0 10 C.JALR


100 0 rd'<>0 rs2<>0 10 C.MV
100 1 rd'<>0 rs2<>0 10 C.ADD


100 1 0 0 10 C.EBREAK


101 imm[5:3|8:6] rs2 10 C.FSDSP
110 imm[5:2|7:6] rs2 10 C.SWSP
111 imm[5:3|8:6] rs2 10 C.SDSP






























000 nzimm[5:4|9:6|2|3] rd' 00 C.ADDI4SPN
001 imm[5:3] rs1' imm[7:6] rd' 00 C.FLD
010 imm[5:3] rs1' imm[2|6] rd' 00 C.LW
011 imm[5:3] rs1' imm[7:6] rd' 00 C.LD
101 imm[5:3] rs1' imm[7:6] rs2' 00 C.FSD
110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW
111 imm[5:3] rs1' imm[7:6] rs2' 00 C.SD
000 0 0 0 01 C.NOP
000 nzimm[5] rs1/rd<>0 nzimm[4:0] 01 C.ADDI
001 imm[5] rs1/rd<>0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd<>0 imm[4:0] 01 C.LI
011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP
011 nzimm[17] rs1/rd<>{0, 2} nzimm[16:12] 01 C.LUI
100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI
100 imm[5] 10 rs1'/rd' imm[4:0] 01 C.ANDI
100 0 11 rs1'/rd' 00 rs2' 01 C.SUB
100 0 11 rs1'/rd' 01 rs2' 01 C.XOR
100 0 11 rs1'/rd' 10 rs2' 01 C.OR
100 0 11 rs1'/rd' 11 rs2' 01 C.AND
100 1 11 rs1'/rd' 00 rs2' 01 C.SUBW
100 1 11 rs1'/rd' 01 rs2' 01 C.ADDW
101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J
110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ


111 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BNEZ
000 nzimm[5] rd<>0 nzimm[4:0] 10 C.SLLI
001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP
010 imm[5] rd<>0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd<>0 imm[4:3|8:6] 10 C.LDSP
100 0 rs1<>0 0 10 C.JR
100 0 rd<>0 rs2<>0 10 C.MV
100 1 0 0 10 C.EBREAK
100 1 rs1<>0 0 10 C.JALR
100 1 rd<>0 rs2<>0 10 C.ADD
101 imm[5:3|8:6] rs2 10 C.FSDSP
110 imm[5:2|7:6] rs2 10 C.SWSP
111 imm[5:3|8:6] rs2 10 C.SDSP


















000 nzimm[5:4|9:6|2|3] rd' 00 C.ADDI4SPN


001 imm[5:3] rs1' imm[7:6] rd' 00 C.FLD
011 imm[5:3] rs1' imm[7:6] rd' 00 C.LD


101 imm[5:3] rs1' imm[7:6] rs2' 00 C.FSD
111 imm[5:3] rs1' imm[7:6] rs2' 00 C.SD


110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW
010 imm[5:3] rs1' imm[2|6] rd'  00 C.LW


000 0 0 0 01 C.NOP
100 1 0 0 10 C.EBREAK


000 nzimm[5] rs1/rd<>0 nzimm[4:0] 01 C.ADDI

001 imm[5] rs1/rd<>0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd<>0 imm[4:0] 01 C.LI


100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI



011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP


011 nzimm[17] rs1/rd<>{0, 2} nzimm[16:12] 01 C.LUI


100 imm[5] 10 rs1'/rd' imm[4:0] 01 C.ANDI


100 0 11 rs1'/rd' 00 rs2' 01 C.SUB
100 0 11 rs1'/rd' 01 rs2' 01 C.XOR
100 0 11 rs1'/rd' 10 rs2' 01 C.OR
100 0 11 rs1'/rd' 11 rs2' 01 C.AND
100 1 11 rs1'/rd' 00 rs2' 01 C.SUBW
100 1 11 rs1'/rd' 01 rs2' 01 C.ADDW


101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J


110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ
111 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BNEZ



000 nzimm[5] rd<>0 nzimm[4:0] 10 C.SLLI


001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP


010 imm[5] rd<>0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd<>0 imm[4:3|8:6] 10 C.LDSP


100 0 rs1<>0 0 10 C.JR
100 1 rs1<>0 0 10 C.JALR


100 0 rd<>0 rs2<>0 10 C.MV
100 1 rd<>0 rs2<>0 10 C.ADD



101 imm[5:3|8:6] rs2 10 C.FSDSP
111 imm[5:3|8:6] rs2 10 C.SDSP



110 imm[5:2|7:6] rs2 10 C.SWSP







































  20 ( 32 ) value 32/64.bit

: #[u:l]  ( upper lower -- n )        >r >r
  (#)  32/64.bit r> - dup>r  lshift   r> r> +  1-  rshift  ;
\ (#)  32/64.bit 5  - dup>r  lshift   r> 3  +  1-  rshift  ;


: #[5:3]  ( -- n )   (#)  32/64.bit 5 - dup>r  lshift   r> 3 +  1-  rshift  ;

: #[5:3]  ( -- n )   5  3  #[u:l]  ;
: #[2:2]  ( -- n )   2  2  #[u:l]  ;
: #[6:6]  ( -- n )   6  6  #[u:l]  ;

: #[4:0]  ( -- n )   4  0  #[u:l]  ;

: #[4:3]  ( -- n )   4  3  #[u:l]  ;
: #[7:6]  ( -- n )   7  6  #[u:l]  ;
: #[2:1]  ( -- n )   2  1  #[u:l]  ;

: #[5:2]  ( -- n )   5  2  #[u:l]  ;
: #[5:4]  ( -- n )   5  4  #[u:l]  ;
: #[9:6]  ( -- n )   9  6  #[u:l]  ;






\ : 32C:_gene    :.MNEM_ ." `32c" #=if4 ."  " .1" MNEM" 4XT0 ;
: 16C:_GENE      :.MNEM_ ." `16c" #=if2 ."  " .1" MNEM"  XT0 ;
: 16C:         ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
  CREATE  DUP ,
    16C:_GENE
  DOES>   @ 16,' ;




\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
: 16C:  CREATE  DUP ,        :.MNEM_ ." `16c" #=if2 ."  " .1" MNEM"  XT0
        DOES>   @   16,' ;
\ ----------------------------------------------------------------------------------------
  original.mnemonic? on         0001  16c:  c.nop
  original.mnemonic? off        0001  16c:  c.nop

  original.mnemonic? on         9002  16c:  c.ebreak
  original.mnemonic? off        9002  16c:  c.ebreak

0 [if]   { ( comment: ) 
000 0 0 0 01 C.NOP       \ 0000 0000 0000 0001      0001
100 1 0 0 10 C.EBREAK    \ 1001 0000 0000 0010      9002
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------- -------------- -------------- -----
\  funct4        rd/rs1       0  0  0  0  0  opcode         CR-type(rs2=0)        6
\    4f            5r              5c        2o             4f5r5c2o
\  f  f  f  f* r  r  r  r* r  c  c  c  c  c  o  o
\  1  1  1  1* 0  0  0  0* 0  1  1  1* 1  1  1  1           f07f   mask
\
\  1  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0           8002     c.jr_R
\  1  0  0  1* 0  0  0  0* 0  0  0  0* 0  0  1  0           9002     c.jalr_R
\ ----------- -------------- -------------- -----
: `4f5r5c2o  ( a -- a op.code )   dup   16@'  f07f  and  ;
:  4f5r5c2o:     ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `4f5r5c2o"  #=if2 ."  0b  7  14p"  .1"  mnem"  xt0
   does>    ( Rs1 a )  to (a)  5r.check  to (Rs1)
     (Rs1) 0b    7   >?~?
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8002  4f5r5c2o:  c.jr_R
   original.mnemonic?  off        8002  4f5r5c2o:  c.jmp.R

   original.mnemonic?  on         9002  4f5r5c2o:  c.jalr_R
   original.mnemonic?  off        9002  4f5r5c2o:  c.jmp.R.Link

0 [if]   { ( comment: ) 
100 0 rs1<>0 0 10 C.JR
100 1 rs1<>0 0 10 C.JALR
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------- -------------- -------------- -----
\  funct4        rd/rs1            rs2      opcode            CR-type        6
\    4f            5r              5r        2o
\  f  f  f  f  r  r  r  r  r  r  r  r  r  r  c  c             4f5r5r2o
\
\  1  1  1  1* 0  0  0  0* 0  0  0  0* 0  0  1  1             f003    mask
\  1  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0             8002    c.mv_R,R
\  1  0  0  1* 0  0  0  0* 0  0  0  0* 0  0  1  0             9002    c.add_R,R
\ -------------------------------------------------------------------------------------------------------------
: `4f5r5r2o  ( a -- a op.code )   dup   16@'  f003  and  ;
:  4f5r5r2o:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `4f5r5r2o"  #=if2 ."  0b  7  13p  6  2  14p"  .2"  mnem"  xt0
   does>    ( Rd Rs2 a )  to (a)  5r.check  to (Rs2)   5r.check  to (Rd)
     (Rd)   6    2   >?~?
     (#)    0b   7   >?~?    +
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8002  4f5r5r2o:  c.mv_R,R
   original.mnemonic?  off        8002  4f5r5r2o:  c.R=R

   original.mnemonic?  on         9002  4f5r5r2o:  c.add_R,R
   original.mnemonic?  off        9002  4f5r5r2o:  c.R+R

: R=R  ( R R -- )  c.R=R  ;
: R+R  ( R R -- )  c.R+R  ;

0 [if]   { ( comment: ) 
100 0 rd<>0 rs2<>0 10 C.MV
100 1 rd<>0 rs2<>0 10 C.ADD
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------------------------------- -----
\  funct3       offset[12:2]                opcode            CJ-type   5
\    3f            11#[12:2]                  2o              3f11#[12:2]2o
\  f  f  f  #  #  #  #  #  #  #  #  #  #  #  c  c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\  1  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             a001     c.j_#
\  0  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             2001     c.jal_#
\ -------------------------------------------------------------------------------------------------------------
: `3f11#[12:2]2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f11#[12:2]2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f11#[12:2]2o"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   2       >?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         a001  3f11#[12:2]2o:  c.j_#
   original.mnemonic?  off        a001  3f11#[12:2]2o:  c.jmp_#

0 [if]   { ( comment: ) 
101 offset[11|4|9:8|10|6|7|3:1|5] 01 C.J
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  funct3 imm[12:10] rs1/rd1' imm    rd'    opcode            CS-type        Store Word    4
\    3f      3#       3r      2#     3r      2o               3f3#3r2#3r2o
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,R,#      sw  rs1・, (4*imm)(rs2・)
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.and_R,R,#     and rd・, rd・, rs2・
\  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             c001     c.or_R,R,#      or  rd・, rd・, rs2・
\  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             a001     c.xor_R,R,#     xor rd・, rd・, rs2・
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             8001     c.sub_R,R,#     sub rd・, rd・, rs2・
\ -------------------------------------------------------------------------------------------------------------
: `3f3#3r2#3r2o  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#3r2#3r2o:    ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f3#3r2#3r2o"  #=if4 ."  4 2 12p   9 7 13p   0c 0a 6 5 24p"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  5#.check  to (#)   3r.check   to (Rs1)   3r.check  to (Rd)
     (Rd)   4   2            >?~?
     (Rs1)  9   7            >?~?       +
     (#)    0c  0a   6   5   >?~?+?~?   +
     (a)    @    ( op.code)             +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c000  3f3#3r2#3r2o:  c.sw_R,R,#
   original.mnemonic?  off        c000  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         e001  3f3#3r2#3r2o:  c.and_R,R,#
   original.mnemonic?  off        e001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         c001  3f3#3r2#3r2o:  c.or_R,R,#
   original.mnemonic?  off        c001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         a001  3f3#3r2#3r2o:  c.xor_R,R,#
   original.mnemonic?  off        a001  3f3#3r2#3r2o:  c.R=#?

   original.mnemonic?  on         8001  3f3#3r2#3r2o:  c.sub_R,R,#
   original.mnemonic?  off        8001  3f3#3r2#3r2o:  c.R=#?




\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
: `6c3r2c3r2o  ( a' -- a' op.code )   dup   16@'  FC63  and  ;
:  6c3r2c3r2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `6c3r2c3r2o"  #=if4 ."  9  7  13p   4  2  14p "  .2"  mnem"  xt0
   does>    ( Rd'/Rs1' Rs2' a )  to (a)  3r.check   to (Rs2')   3r.check  to (Rd'/Rs1')
     (Rd'/Rs1')   9   7            >?~?
     (Rs2')       4   2            >?~?  +
     (a)    @    ( op.code)              +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
 original.mnemonic?  on      8C01  6c3r2c3r2o:  C.SUB
 original.mnemonic?  off     8C01  6c3r2c3r2o:  C.R-R

 original.mnemonic?  on      8C21  6c3r2c3r2o:  C.XOR
 original.mnemonic?  off     8C21  6c3r2c3r2o:  C.RxR

 original.mnemonic?  on      8C41  6c3r2c3r2o:  C.OR
 original.mnemonic?  off     8C41  6c3r2c3r2o:  C.RoR

 original.mnemonic?  on      8C61  6c3r2c3r2o:  C.AND
 original.mnemonic?  off     8C61  6c3r2c3r2o:  C.RnR

 original.mnemonic?  on      9C01  6c3r2c3r2o:  C.SUBW
 original.mnemonic?  off     9C01  6c3r2c3r2o:  C.R-R,w

 original.mnemonic?  on      9C21  6c3r2c3r2o:  C.ADDW
 original.mnemonic?  off     9C21  6c3r2c3r2o:  C.R+R,w

0 [if]   { ( comment: ) 
100 0 11 rs1'/rd' 00 rs2' 01 C.SUB     8c01
100 0 11 rs1'/rd' 01 rs2' 01 C.XOR     8c21
100 0 11 rs1'/rd' 10 rs2' 01 C.OR      8c41
100 0 11 rs1'/rd' 11 rs2' 01 C.AND     8c61
100 1 11 rs1'/rd' 00 rs2' 01 C.SUBW    9c01
100 1 11 rs1'/rd' 01 rs2' 01 C.ADDW    9c21
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- ----- -------- ----- -------- -----
\  funct3  [5] c  c rs1/rd1' [4:0]   rd'    opcode            CS-type        Store Word    4
\    3f      3#       3r      2#     3r      2o               3f3#3r2#3r2o
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,R,#      sw  rs1・, (4*imm)(rs2・)
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.and_R,R,#     and rd・, rd・, rs2・
\  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             c001     c.or_R,R,#      or  rd・, rd・, rs2・
\  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             a001     c.xor_R,R,#     xor rd・, rd・, rs2・
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             8001     c.sub_R,R,#     sub rd・, rd・, rs2・
\ -------------------------------------------------------------------------------------------------------------
: `3f[5]2c3r[4:0]2o  ( a' -- a' op.code )   dup   16@'  e003  and  ;
:  3f[5]2c3r[4:0]2o:  ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f[5]2c3r[4:0]2o"  #=if4 ."  9 7 13p   0c 0c 6 2 24p"  .2"  mnem"  xt0
   does>    ( Rd'/Rs1' # a )  to (a)  6#.check  to (#)   3r.check   to (Rd'/Rs1')
     (Rd'/Rs1')  9   7          >?~?
     (#)         0c  0c  6  2   >?~?+?~?  +
     (a)    @    ( op.code)               +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on      8803  3f[5]2c3r[4:0]2o:  c.andi_R,#6
   original.mnemonic?  off     8803  3f[5]2c3r[4:0]2o:  c.Rn#

0 [if]   { ( comment: ) 
100 imm[5] 10 rs1'/rd' imm[4:0] 01 C.ANDI    8803
[then]  \ } ( comment; ) 
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- ----- -------- ----- -------- -----
\  funct3  [5] c  c rs1/rd1' [4:0]   rd'    opcode            CS-type        Store Word    4
\    3f      3#       3r      2#     3r      2o               3f3#3r2#3r2o
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2o
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,R,#      sw  rs1・, (4*imm)(rs2・)
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.and_R,R,#     and rd・, rd・, rs2・
\  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             c001     c.or_R,R,#      or  rd・, rd・, rs2・
\  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             a001     c.xor_R,R,#     xor rd・, rd・, rs2・
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             8001     c.sub_R,R,#     sub rd・, rd・, rs2・
\ -------------------------------------------------------------------------------------------------------------
: `3f[5]5r[4:0]2o  ( a' -- a' op.code )   dup   16@'  e003  and  ;
:  3f[5]5r[4:0]2o:   ( opcode -- )  >in @ ( >r )  bl word count  >temp.mnemonic ( r> ) >in  !
   create   dup  ,
     :.mnem_ ." `3f[5]5r[4:0]2o"  #=if4 ."  9 7 13p   0c 0c 6 2 24p"  .2"  mnem"  xt0
   does>    ( Rd # a )  to (a)  6#.check  to (#)   5r.check   to (Rd)
     (Rd'/Rs1')  9   7          >?~?
     (#)         0c  0c  6  2   >?~?+?~?  +
     (a)    @    ( op.code)               +
     16,'   ;

 original.mnemonic?  on     0002  3f[5]5r[4:0]2o  c.slli_R,#
 original.mnemonic?  off    0002  3f[5]5r[4:0]2o  c.R<<#

0 [if]   {  ( comment: )
000 nzimm[5] rd<>0 nzimm[4:0] 10   C.SLLI
}  ( comment; )
[then]
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************







000 nzimm[5:4|9:6|2|3] rd' 00 C.ADDI4SPN
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************

001 imm[5:3] rs1' imm[7:6] rd' 00 C.FLD
011 imm[5:3] rs1' imm[7:6] rd' 00 C.LD
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************


101 imm[5:3] rs1' imm[7:6] rs2' 00 C.FSD
111 imm[5:3] rs1' imm[7:6] rs2' 00 C.SD
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************


110 imm[5:3] rs1' imm[2|6] rs2' 00 C.SW
010 imm[5:3] rs1' imm[2|6] rd'  00 C.LW
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************




000 nzimm[5] rs1/rd<>0 nzimm[4:0] 01 C.ADDI
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************

001 imm[5] rs1/rd<>0 imm[4:0] 01 C.ADDIW
010 imm[5] rs1/rd<>0 imm[4:0] 01 C.LI
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************


100 nzimm[5] 00 rs1'/rd' nzimm[4:0] 01 C.SRLI
100 nzimm[5] 01 rs1'/rd' nzimm[4:0] 01 C.SRAI
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************



011 nzimm[9] 2 nzimm[4|6|8:7|5] 01 C.ADDI16SP
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************


011 nzimm[17] rs1/rd<>{0, 2} nzimm[16:12] 01 C.LUI
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************





110 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BEQZ
111 offset[8|4:3] rs1' offset[7:6|2:1|5] 01 C.BNEZ
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************




001 imm[5] rd imm[4:3|8:6] 10 C.FLDSP
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************


010 imm[5] rd<>0 imm[4:2|7:6] 10 C.LWSP
011 imm[5] rd<>0 imm[4:3|8:6] 10 C.LDSP
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************



101 imm[5:3|8:6] rs2 10 C.FSDSP
111 imm[5:3|8:6] rs2 10 C.SDSP
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************



110 imm[5:2|7:6] rs2 10 C.SWSP
\ ****************************************************************************************
\ ****************************************************************************************
\ ****************************************************************************************

\s

