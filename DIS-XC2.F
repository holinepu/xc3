
: lsl_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `5c5#3m3d                                          00000000 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  lsl_R,R,#"
  exit then 0 ;
: R=R<<#_
  `5c5#3m3d                                          00000000 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  R=R<<#"
  exit then 0 ;
: lsr_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `5c5#3m3d                                          00000800 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  lsr_R,R,#"
  exit then 0 ;
: R=R>>#_
  `5c5#3m3d                                          00000800 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  R=R>>#"
  exit then 0 ;
: asr_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `5c5#3m3d                                          00001000 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  asr_R,R,#"
  exit then 0 ;
: R=R>>#,a_
  `5c5#3m3d                                          00001000 =
  if (2   2  0  12p   5  3  13p  0a  6  14p                                                    ."  R=R>>#,a"
  exit then 0 ;


: dis ( a' -- a'+n )
  lsl_R,R,#_                                      ?dup if + exit then
  R=R<<#_                                         ?dup if + exit then
  lsr_R,R,#_                                      ?dup if + exit then
  R=R>>#_                                         ?dup if + exit then
  asr_R,R,#_                                      ?dup if + exit then
  R=R>>#,a_                                       ?dup if + exit then
;

