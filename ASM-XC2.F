
\  cccc c### ##mm mddd
: `5c5#3m3d     ( a' -- a' opcode )  dup  16@'  f800  and  ;
:  5c5#3m3d:    ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,
     :.mnem_       ." `5c5#3m3d"        #=if2 ."  2  0  12p   5  3  13p  0a  6  14p"  .3"  mnem"  xt0
   does>    ( rd rm # a -- )   to (a)   8#.check  to  (#)    to (rm)     to (rd)
            (a)   @
            (rd)      2  0  >?~?  +
            (rm)      5  3  >?~?  +
            (#)      0a  6  >?~?  +
            16,'   ;

  original.mnemonic?  on     0000  5c5#3m3d:  lsl_R,R,#
  original.mnemonic?  off    0000  5c5#3m3d:  R=R<<#
  original.mnemonic?  on     0800  5c5#3m3d:  lsr_R,R,#
  original.mnemonic?  off    0800  5c5#3m3d:  R=R>>#
  original.mnemonic?  on     1000  5c5#3m3d:  asr_R,R,#
  original.mnemonic?  off    1000  5c5#3m3d:  R=R>>#,a

