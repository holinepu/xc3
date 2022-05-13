\ http://re-eject.gbadev.org/files/ThumbRefV2-beta.pdf  cortex M0 instruction set
variable  +\?   variable  -?  cr .(   press \ to get 'each' instruction's disassembler, otherwise 'all'. )
cr  key  dup '\' = #if  +\?  on  #then  '' =  #if  -? on  #then
hex             include  hlaa12.f       include  inf.f   hex
VERSION#  ( 61400 )  decimal  420000  430000  between
#if    hex  54 ' hello 24 + c!    54 ' _MESSAGE 10 + c!   \ decimal --> hex
: B/W  FFFFFF       0  FGBG!  ;      : W/B  0       FFFFFF  FGBG!  ;    B/W
: MAXIZE.LIST   80  8E200 ( 320000 )   36    XCALL DROP  ;              MAXIZE.LIST
: yes.etc  [ '  _MEMIT literal ] is emit   [ ' _MTYPE literal ] is type   [ ' _MCRTAB literal ]  is  cr  ;
:  no.etc  [ ' drop    literal ] is emit   [ ' 2drop  literal ] is type   [ ' noop    literal ]  is  cr  ;
#else   : yes.etc  ;    :  no.etc  ;    hex
#then                   \  no.etc
0  value  (a)
0  value  (a')
0  value  (R)
0  value  (Rd)
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
0  value  (op.code)
0  value  <<byte>>
0  value  (?p)
0  value  (rel)
0  value  (b)
variable  original.mnemonic?
variable  cp'
create    cp0'  400000 allot    \ target memory image  4 Meg byte
: here'  ( -- a' )    cp'   @   ;
: allot' ( n -- )     cp'  +!   ;
: a'>a  ( a' -- a )   cp0' +    ;
:  8,   ( n -- )    c,  ;
: 16,   ( n -- )    w,  ;
:  8@   ( a -- n )  c@  ;
: 16@   ( a -- n )  w@  ;
: 24@   ( a -- n )   @  ffffff and ;  \ dup>r  16@  r> 2 +  c@  10000 *  +  ;
: 32@   ( a -- n )   @  ;
:  8!   ( n a -- )  c!  ;
: 16!   ( n a -- )  w!  ;
: 24!   ( n a -- )  >r  10000 /mod  r@ c!   r> 16!  ;
: 32!   ( n a -- )   !  ;
:  c!'  ( char a' -- )  a'>a   c!  ;
:  8!'  ( char a' -- )  a'>a   c!  ;
: 16!'  ( char a' -- )  a'>a  16!  ;
: 24!'  ( char a' -- )  a'>a  24!  ;
: 32!'  ( char a' -- )  a'>a    !  ;
:  c@'  ( a' -- char )  a'>a   c@  ;
:  8@'  ( a' -- char )  a'>a   c@  ;
: 16@'  ( a' -- char )  a'>a  16@  ;
: 24@'  ( a' -- char )  a'>a  24@  ;
: 32@'  ( a' -- char )  a'>a    @  ;
:  c,'  ( n -- )        here'   8!'  1 allot'  ;
:  8,'  ( n -- )        here'   8!'  1 allot'  ;
: 16,'  ( n -- )        here'  16!'  2 allot'  ;
: 24,'  ( n -- )        here'  24!'  3 allot'  ;
: 32,'  ( n -- )        here'  32!'  4 allot'  ;
\ ********************************************************
:  om ( -- )  original.mnemonic?  dup  @  if  off  else  on  then  ;
create    temp.mnemonic   40  allot
: .last.name  ( -- )  temp.mnemonic  count  type  ;    : .last.name-  ( -- )  temp.mnemonic  count  1-  swap 1+  swap  type  ;
: erase.temp.mnemonic  ( -- )  temp.mnemonic  40  erase  ;
: >temp.mnemonic  ( from len -- )  erase.temp.mnemonic  ( from len )  temp.mnemonic  place  ;
: ?y  ( x -- )  getxy  nip  gotoxy  ;
: :.mnem_0      cr  ." : "  .last.name  '_' emit  original.mnemonic? @
  if     3a ( 58 )  ?y  ." original.mnemonic? @  not  if  0  exit  then"  then   cr  2 ?y  ;
: :.mnem_\  ( -- )  cr  +\?  @  if  ."   "  else  ." : "  then  .last.name  '_' emit   original.mnemonic? @
  if     3a ( 58 )  ?y  +\?  @  if          else  ." original.mnemonic? @  not  if  0  exit  then"  then
  then                  +\?  @  if   3a ?y  ."   ?dup if + exit then "   no.etc   else  cr  2 ?y    then  ;
: :.mnem_  ( -- )       +\?  @  if :.mnem_\ else :.mnem_0 then  ;
: .n#  ( # n -- )   >r  0 <#  r@ 0 ?do # loop  #>  type  r>drop ;
: .x  1 .n#  ;  : .xx  2 .n#  ;  : .xxxx  4 .n#  ;    : .xxxxxxxx  8 .n#  ;  : .8#  8 .n#  ;
: emit.20~7f ( c -- )  dup 20 7f between not if drop  '.' then   emit  ;
: dump'.10 ( a' -- )  cr  dup .xxxxxxxx  10 bounds  2dup do  i 4 mod 0= if space then space  i c@' .xx   loop
  2 spaces do ( space ) i c@'  emit.20~7f  loop  ;
: dump'    ( a' len -- )  bounds do  i  10 mod 0= if  i dump'.10 then  10 +loop  ;  : du  ( a' -- )  fffffff0  and  40  dump'  ;
: .opcode  ( opcode -- )  35 ( 1d ) ( 29 ) ?y   .8#  space  ;
: #=ifn    ( opcode n -- )  swap  .opcode  ." = "  cr  ."   if ("  30 + emit  2 spaces  ;
: #=if0  0 #=ifn ;  : #=if1  1 #=ifn ;  : #=if2  2 #=ifn ; : #=if3  3 #=ifn ;  :  #=if4  4 #=ifn ; : #=if5  5 #=ifn ;
: xt0  ( -- )   cr  ( 62 )  2 ?y  ." exit then 0 ;"  yes.etc  cr ;
: 2^n       ( n -- n1 )   1  swap  lshift  ;        : n>nF  ( n -- nF )  1  swap   lshift  1-  ;
: n#.check  ( # n -- # )      >r  dup  0  r@ n>nF  between  0= if  ."  **** number should be 0 ~ " r@ n>nF  u. ." ****"  abort  then  r>drop ;
: nR'.check ( R' n -- R'-8 )  >r  dup  8  r@ n>nF  between  0= if  ."  **** number should be 8 ~ " r@ n>nF  u. ." ****"  abort  then  r>drop  8 - ;
: 5#.check  ( # -- # )  5  n#.check  ;  : 6#.check   ( # -- # )  6 n#.check  ;   : 8#.check  ( # -- # )  8 n#.check  ;   : 11#.check  ( # -- # ) 0b n#.check  ;
: 20#.check ( # -- # )  14 n#.check  ;
: 5R.check  ( R -- R )  5  n#.check  ;  : 2R.check   ( R -- R )  2 n#.check  ;   : 3R.check  ( R -- R )  3 n#.check  ;   :  4R.check  ( R -- R )  4 n#.check  ;
: 5R'.check ( R' -- R ) 5  n#.check  ;  : 2R'.check  ( R -- R )  2 n#.check  ;   : 3R'.check  ( R -- R )  3 n#.check  ;   :  4R'.check  ( R -- R )  4 n#.check  ;
: mnem"     ( -- )  .last.name   '"' emit  61 ( 50 ) ( 61 ) ?y ;
variable  .(.8a?     .(.8a?  on
variable   make.macro?
: .\.(      ( ---- )  make.macro? @  if   ." \ (  "   else  ."   (  "  then  ;
: (.12345678..55.66..........)     ( a -- )   .(.8a? @
  if  .\.(  dup  .xxxxxxxx  space  2  bounds  do  space  i  c@' .xx  loop  0c spaces ."  ) "  exit then 10 ?y  drop ;
: (.12345678..55.66.77.88....)     ( a -)
      .\.(  dup  .xxxxxxxx  space  4  bounds  do  space  i  c@' .xx  loop   6 spaces ."  ) " ;
: np  ( x -- )   ?y  8 u.r  ;    : 1p  26 np  ;    : 2p  30 np  ;    : 3p  3c np  ;   : 4p  46 np  ;
: 34y ( -- )  34  ?y         ;
: (2  ( a' -- 2 a' )  dup  (.12345678..55.66..........)  2  34y   2dup   to <<byte>>   to (a')  ;
: (4  ( a' -- 2 a' )  dup  (.12345678..55.66.77.88....)  4  34y   2dup   to <<byte>>   to (a')  ;
: max.min  ( n1 n2 -- max min )  2dup  max  -rot  min  ;
: ?~?.mask ( bit.n1 bit.n2 -- mask )   max.min  2>r   ffffffff  r> lshift   ffffffff  1f  r>  -  rshift  and  ;
: 4,?~?       ( a' ? ? -- n )   ?~?.mask  swap  <<byte>> 2 = if  16@'  else  32@'  then  and  ;
: a'@    (  -- @ )    (a')  32@'  ;
: ?~?>      ( a' n1 n0 -- n' )   to (n0)  to (n1)   a'@  to (op.code)   (a') (n1) (n0)  4,?~?  (n0)  rshift  ;
:  12p      ( a' n1 n2 -- )   2  to (?p)  ?~?>  2p  ;                 :  12p^      ( n1 n2 -- )   2  to (?p)  ?~?> 8 + 2p  ;
:  13p      ( a' n1 n2 -- )   3  to (?p)  ?~?>  3p  ;                 :  13p^      ( n1 n2 -- )   3  to (?p)  ?~?> 8 + 3p  ;
:  14p      ( a' n1 n2 -- )   4  to (?p)  ?~?>  4p  ;                 :  14p^      ( n1 n2 -- )   4  to (?p)  ?~?> 8 + 4p  ;
:  14p.8rel ( n1 n2 -- )      4  to (?p)  ?~?>  (a')  here' -  4p  ;  :  14p^.8rel ( n1 n2 -- )   4  to (?p)  ?~?>  (a')  here' -  4p  ;
: .."   ( -- )  5f ?y  '.' emit   '"'  emit  2 spaces  ;  : .0"  .."  ;  : .1"  .."  ;  : .2"  .."  ;  : .3"   .."  ;  : .4"  .."  ;
\ -------------------------------------------------------------------------------------------------------------
:  >?~?  ( n upper lower -- n1 )  nip  lshift  ;
 \ include  RISC-V-rvc-asm19k.F       include  RISC-V-rvc-dis19i.F       include  risc-v-rv32c-rename10.f
\ ----------------------------------------------------------------------------------------------------
:  2tuck  ( 1 2 3 4 -- 3 4 1 2 3 4 )  2dup  2>r  2swap  2r>  ;
:  2nip   ( 1 2 3 4 -- )  2swap  2drop  ;
:  2and   ( 1 2 3 4 -- )  rot    and    >r  and  r>  ;
:  2xor   ( 1 2 3 4 -- )  xor    and    >r  xor  r>  ;
:  2or    ( 1 2 3 4 -- )  or     and    >r  or   r>  ;
: -2rot   ( 1 2 3 4 5 6 -- 3 4 5 6 1 2 )    2>r  2swap  2r>  2swap  ;
code 2r>drop  add ebp , # 8  next end-code
: on/off  ( a -- )  dup  @  if   off  else   on  then  ;
VARIABLE  space/layer                  2  space/layer  !
: LAYER.ON                space/layer  @  space/layer  !  ;
: LAYER.OFF               space/layer  @  space/layer  !  ;
: S/L  ( n -- )                           space/layer  !  ;
: \.3f---    cr  layer.off  ."   \ "  4f  0  do  '-'  emit  loop  ;
: \.3f***    cr  layer.off  ."   \ "  4f  0  do  '*'  emit  loop  ;
variable  last.instruction.addr
:  all.ok?.off ;
 variable  upper.bit
 variable  lower.bit
 variable  target.n
:  >real.number  (   upper.bit lower.bit target.n -- # )    \  1e 19  5  >real.number
   target.n  !   lower.bit  !   upper.bit  !    (a')  32@'  1f ( 31 ) upper.bit @  -  dup>r  lshift    r>  lower.bit @  +   rshift  target.n  @  lshift  ;
:  real.number>  ( # upper.bit lower.bit target.n -- a.piece.of.code )
   target.n  !   lower.bit  !   upper.bit  !                1f ( 31 ) upper.bit @  -  dup>r  lshift    r>  lower.bit @  +   rshift  target.n  @  lshift  ;
:  n.bit.sign.extend  ( # n -- # )  dup>r  2^n  over  and  if  -1  r@  lshift  or  then  r>drop  ;
: 4+   4 +  ;
:  (.12345678..11.22.33.44.55.66.77.88.)1
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 8  bounds  do  space  i   c@' .xx            loop            ."  ) " ;
:  (.12345678..11223344..........)2
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 4  bounds  do  space  i  32@' .xxxxxxxx  4  +loop   9 spaces ."  ) " ;
:  (.12345678..11223344.55667788.)2
   ( a -)  cr  ."   ( " dup  .xxxxxxxx space 8  bounds  do  space  i  32@' .xxxxxxxx  4  +loop            ."  ) " ;
variable  long?     \ long?  on
variable  show.addr,data?      show.addr,data?   on
:  (.12345678..11.22.33.44.55.66.77.88.)   ( a' -- )    show.addr,data?  @  if  drop  exit  then
   long? @
   if    (.12345678..11.22.33.44.55.66.77.88.)1
   else  (.12345678..11223344.55667788.)2
   then  ;
:  (.12345678..11.22.33.44.............)1
   ( a -) ."   ( " dup  .xxxxxxxx space 4  bounds  do  space  i  c@' .xx  loop  0c spaces ."  ) " ;
:  lg   ( -- )   long?  dup  if  off  else  on  then  ;
:  (.12345678..11.22.33.44.............)  long? @
   if    (.12345678..11.22.33.44.............)1
   else  (.12345678..11223344..........)2
   then  ;
: BS  8 EMIT ;
: >?~?'   ( n n1 n2 -- n' )   nip  lshift  ;
: 1<<?-?1+./mod.swap.>?~?  ( n n1 n2 -- q n' )  2>r  1  2r@ -   1+  lshift  /mod  swap  2r>  >?~?'  ;
: >?~?+?~?               ( n n3 n2 n1 n0 -- n' )
  to (n0)   to (n1)   to (n2)   to (n3)    \  to (n)
  (n1) (n0)  1<<?-?1+./mod.swap.>?~?  >r
  (n3) (n2)  1<<?-?1+./mod.swap.>?~?  >r     abort" **** number too large ****"  r>  r>  +  ;
: ?~?+?~?>               ( a' n3 n2 n1 n0 -- n' )
  to (n0)   to (n1)   to (n2)   to (n3)  a'@  to (op.code)
  (a') (n1) (n0)  4,?~?                     (n0)    rshift
  (a') (n3) (n2)  4,?~?  (n2)  (n1)  -  1-  (n0) +  rshift  +  ;
:  21p  ( n1 n2 -- )  1  to (?p)  ?~?+?~?>   1p  ;
:  22p  ( n1 n2 -- )  2  to (?p)  ?~?+?~?>   2p  ;
:  23p  ( n1 n2 -- )  3  to (?p)  ?~?+?~?>   3p  ;
:  24p  ( n1 n2 -- )  4  to (?p)  ?~?+?~?>   4p  ;
variable  pc
:  count' ( a' -- a+1' n )   dup   1+      swap  c@'   ;
:  type'  ( a' n ------- )   swap  a'>a    swap  type  ;
:  ALIGN*4     ( n1 -- n2 )  3  +  ffffFFFC  and  ;
:  14p-[11:0]  ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or  abs  then  dup to (#) 4p  ;
:  14p[11:0]   ( n1 n2 -- )  4  to (?p)  ?~?>   dup 800 and   if  fffff000  or       then  dup to (#) 4p  ;
:  24p[1f:19|0b:7]  ( 1f 19 0b 7 -- )  4  to (?p)  ?~?+?~?>  0b  N.BIT.SIGN.EXTEND         dup to (#) 4p  ;
\ *************************************************************************************
\ : ,CALL_A'(RISC-V)  ( a' -- )    [20|10~1|11|19~12].CALL_A'>CODE 32,' ;
variable  last'                                 :  org  ( a' -- )  cp'  !  ;
: here'.align.2  ( -- )  here'  1+  FFFFFFFE  and  org  ;
: t: ( -- )   here'.align.2  last' @  32,'  ( lfa' )      here'  last'  !  ( new last' )
  >in  @   bl word count tuck ( len a len )  here'  a'>a  place  >in    !  \ nfa'
  1+  allot'  here'.align.2      \ adjusting here'                         \ cfa'
  create   here'   ,
  does>    @  32,'     ( dtc )  ;   \ ceForth
         \ @  ,CALL_A'(RISC-V)  ;
\ \s
comment:
\  cccc c### ##mm mddd
: `5c5#3m3d     ( a' -- a' opcode )  dup  16@'  f800  and  ;
:  5c5#3m3d:    ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_     ." `5c5#3m3d"    #=if2 ."  2  0  12p   5  3  13p  0a  6  14p"  .3"  mnem"  xt0
   does>    ( rd rm # a -- )   to (a)   8#.check  to  (#)    to (rm)     to (rd)
     (a)   @
     (rd)      2  0  >?~?  +
     (rm)      5  3  >?~?  +
     (#)      0a  6  >?~?  +
     16,'  ;
  original.mnemonic?  on     0000  5c5#3m3d:  lsl_R,R,#
  original.mnemonic?  off    0000  5c5#3m3d:  R=R<<#
  original.mnemonic?  on     0800  5c5#3m3d:  lsr_R,R,#
  original.mnemonic?  off    0800  5c5#3m3d:  R=R>>#
  original.mnemonic?  on     1000  5c5#3m3d:  asr_R,R,#
  original.mnemonic?  off    1000  5c5#3m3d:  R=R>>#,a
  cr
comment;
include  asm-xc2.f
include  dis-xc2.f
