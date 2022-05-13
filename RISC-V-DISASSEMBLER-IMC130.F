
: addispn_R,#_                                     original.mnemonic? @  not  if  0  exit  then
  `3f8#[5~4,9~6,2,3]3rd'2c                           00000000 =
  if (2   4  2  13p^  [12~11,10~7,6,5]>[5~4,9~6,2,3]  4p                                       ."  addispn_R,#"
                                                                                                  exit then 0 ;
: R+(sp+#)_
  `3f8#[5~4,9~6,2,3]3rd'2c                           00000000 =
  if (2   4  2  13p^  [12~11,10~7,6,5]>[5~4,9~6,2,3]  4p                                       ."  R+(sp+#)"
                                                                                                  exit then 0 ;
: fld_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[7~6]3rd'2c                       00002000 =
  if (2   4  2  12p^  9  7  13p^  [12~10,6~5]>[5~3,7~6]  4p                                    ."  fld_R,R,#"
                                                                                                  exit then 0 ;
: fR=(fR+#)d_
  `3f3#[5~3]3rs1'2#[7~6]3rd'2c                       00002000 =
  if (2   4  2  12p^  9  7  13p^  [12~10,6~5]>[5~3,7~6]  4p                                    ."  fR=(fR+#)d"
                                                                                                  exit then 0 ;
: fsd_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[7~6]3rs2'2c                      0000A000 =
  if (2   4  2  12p^  9  7  13p^  [12~10,6~5]>[5~3,7~6]  4p                                    ."  fsd_R,R,#"
                                                                                                  exit then 0 ;
: (fR+#)=fR,d_
  `3f3#[5~3]3rs1'2#[7~6]3rs2'2c                      0000A000 =
  if (2  9  7  12p^  [12~10,6~5]>[5~3,7~6]  3p  4  2  14p^                                     ."  (fR+#)=fR,d"
                                                                                                  exit then 0 ;
: lw_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[2,6]3rd'2c                       00004000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  lw_R,R,#"
                                                                                                  exit then 0 ;
: R=(R+#)_
  `3f3#[5~3]3rs1'2#[2,6]3rd'2c                       00004000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  R=(R+#)"
                                                                                                  exit then 0 ;
: flw_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[2,6]3rd'2c                       00006000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  flw_R,R,#"
                                                                                                  exit then 0 ;
: fR=(fR+#)_
  `3f3#[5~3]3rs1'2#[2,6]3rd'2c                       00006000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  fR=(fR+#)"
                                                                                                  exit then 0 ;
: sw_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[2,6]3rs2'2c                      0000C000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  sw_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R_
  `3f3#[5~3]3rs1'2#[2,6]3rs2'2c                      0000C000 =
  if (2    9  7  12p^   [12~10,6~5]>[5~3,2,6]  3p   4  2  14p^                                 ."  (R+#)=R"
                                                                                                  exit then 0 ;
: fsw_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[5~3]3rs1'2#[2,6]3rs2'2c                      0000E000 =
  if (2    4  2  12p^  9  7  13p^   [12~10,6~5]>[5~3,2,6]  4p                                  ."  fsw_R,R,#"
                                                                                                  exit then 0 ;
: (fR+#)=fR_
  `3f3#[5~3]3rs1'2#[2,6]3rs2'2c                      0000E000 =
  if (2    9  7  12p^   [12~10,6~5]>[5~3,2,6]  3p   4  2  14p^                                 ."  (fR+#)=fR"
                                                                                                  exit then 0 ;
: fldsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd#[4~3,8~6]2c                            00002002 =
  if (2   0b 7 13p^  [12,6~2]>[5,4~3,8~6]  4p                                                  ."  fldsp_R,#"
                                                                                                  exit then 0 ;
: fR=(rp+#)d_
  `3f1#[5]5rd#[4~3,8~6]2c                            00002002 =
  if (2   0b 7 13p^  [12,6~2]>[5,4~3,8~6]  4p                                                  ."  fR=(rp+#)d"
                                                                                                  exit then 0 ;
: ldsp_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd#[4~3,8~6]2c                            00006002 =
  if (2   0b 7 13p^  [12,6~2]>[5,4~3,8~6]  4p                                                  ."  ldsp_R,#"
                                                                                                  exit then 0 ;
: R=(rp+#)d_
  `3f1#[5]5rd#[4~3,8~6]2c                            00006002 =
  if (2   0b 7 13p^  [12,6~2]>[5,4~3,8~6]  4p                                                  ."  R=(rp+#)d"
                                                                                                  exit then 0 ;
: lwsp_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd#[4~2,7~6]2c                            00004002 =
  if (2   0b 7 13p  [12,6~2]>[5,4~2,7~6]  4p                                                   ."  lwsp_R,#"
                                                                                                  exit then 0 ;
: R=(rp+#)_
  `3f1#[5]5rd#[4~2,7~6]2c                            00004002 =
  if (2   0b 7 13p  [12,6~2]>[5,4~2,7~6]  4p                                                   ."  R=(rp+#)"
                                                                                                  exit then 0 ;
: flwsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd#[4~2,7~6]2c                            00006002 =
  if (2   0b 7 13p  [12,6~2]>[5,4~2,7~6]  4p                                                   ."  flwsp_R,#"
                                                                                                  exit then 0 ;
: fR=(rp+#)_
  `3f1#[5]5rd#[4~2,7~6]2c                            00006002 =
  if (2   0b 7 13p  [12,6~2]>[5,4~2,7~6]  4p                                                   ."  fR=(rp+#)"
                                                                                                  exit then 0 ;
: slli_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd5#[4~0]2c                               00000002 =
  if (2   0b  7  13p   [12,6~2]>[5,4~0]x  4p                                                   ."  slli_R,#"
                                                                                                  exit then 0 ;
: R<<#_
  `3f1#[5]5rd5#[4~0]2c                               00000002 =
  if (2   0b  7  13p   [12,6~2]>[5,4~0]x  4p                                                   ."  R<<#"
                                                                                                  exit then 0 ;
: li_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]5rd5#[4~0]2c                               00004001 =
  if (2   0b  7  13p   [12,6~2]>[5,4~0]x  4p                                                   ."  li_R,#"
                                                                                                  exit then 0 ;
: R=#_
  `3f1#[5]5rd5#[4~0]2c                               00004001 =
  if (2   0b  7  13p   [12,6~2]>[5,4~0]x  4p                                                   ."  R=#"
                                                                                                  exit then 0 ;
: addi_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3fx5rd5#[4~0]2c                                   00000001 =
  if (2   0b  7  13p  -[12,6~2]>[5,4~0]  4p                                                    ."  addi_R,#"
                                                                                                  exit then 0 ;
: R+#_
  `3fx5rd5#[4~0]2c                                   00000001 =
  if (2   0b  7  13p  -[12,6~2]>[5,4~0]  4p                                                    ."  R+#"
                                                                                                  exit then 0 ;
: subi_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3fx5rd5#[4~0]2c                                   00001001 =
  if (2   0b  7  13p  -[12,6~2]>[5,4~0]  4p                                                    ."  subi_R,#"
                                                                                                  exit then 0 ;
: R-#_
  `3fx5rd5#[4~0]2c                                   00001001 =
  if (2   0b  7  13p  -[12,6~2]>[5,4~0]  4p                                                    ."  R-#"
                                                                                                  exit then 0 ;
: srli_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]2c3rd'5#[4~0]2c                            00008001 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  srli_R,#"
                                                                                                  exit then 0 ;
: R>>#_
  `3f1#[5]2c3rd'5#[4~0]2c                            00008001 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  R>>#"
                                                                                                  exit then 0 ;
: srai_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]2c3rd'5#[4~0]2c                            00008401 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  srai_R,#"
                                                                                                  exit then 0 ;
: R>>#,a_
  `3f1#[5]2c3rd'5#[4~0]2c                            00008401 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  R>>#,a"
                                                                                                  exit then 0 ;
: andi_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1#[5]2c3rd'5#[4~0]2c                            00008801 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  andi_R,#"
                                                                                                  exit then 0 ;
: Rn#_
  `3f1#[5]2c3rd'5#[4~0]2c                            00008801 =
  if (2   0b  7  13p^   [12,6~2]>[5,4~0]  4p                                                   ."  Rn#"
                                                                                                  exit then 0 ;
: lui_R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1#[17]5rd5#[16~12]2c                            00006001 =
  if (2   0b  7  13p   [12,6~2]>[17,16~12]  4p                                                 ."  lui_R,#"
                                                                                                  exit then 0 ;
: R=#,u_
  `3f1#[17]5rd5#[16~12]2c                            00006001 =
  if (2   0b  7  13p   [12,6~2]>[17,16~12]  4p                                                 ."  R=#,u"
                                                                                                  exit then 0 ;
: jal_#_                                           original.mnemonic? @  not  if  0  exit  then
  `3f11#[11,4,9~8,10,6,7,3~1,5]2c                    00002001 =
  if (2     [12~2]>[11,4,9~8,10,6,7,3~1,5]  4p                                                 ."  jal_#"
                                                                                                  exit then 0 ;
: call_#_
  `3f11#[11,4,9~8,10,6,7,3~1,5]2c                    00002001 =
  if (2     [12~2]>[11,4,9~8,10,6,7,3~1,5]  4p                                                 ."  call_#"
                                                                                                  exit then 0 ;
: j_#_                                             original.mnemonic? @  not  if  0  exit  then
  `3f11#[11,4,9~8,10,6,7,3~1,5]2c                    0000A001 =
  if (2     [12~2]>[11,4,9~8,10,6,7,3~1,5]  4p                                                 ."  j_#"
                                                                                                  exit then 0 ;
: jmp_#_
  `3f11#[11,4,9~8,10,6,7,3~1,5]2c                    0000A001 =
  if (2     [12~2]>[11,4,9~8,10,6,7,3~1,5]  4p                                                 ."  jmp_#"
                                                                                                  exit then 0 ;
: sub_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00008C01 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  sub_R,R"
                                                                                                  exit then 0 ;
: R-R_
  `3f1c2c3rd'2c3rs2'2c                               00008C01 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  R-R"
                                                                                                  exit then 0 ;
: xor_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00008C21 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  xor_R,R"
                                                                                                  exit then 0 ;
: RxR_
  `3f1c2c3rd'2c3rs2'2c                               00008C21 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  RxR"
                                                                                                  exit then 0 ;
: or_R,R_                                          original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00008C41 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  or_R,R"
                                                                                                  exit then 0 ;
: RoR_
  `3f1c2c3rd'2c3rs2'2c                               00008C41 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  RoR"
                                                                                                  exit then 0 ;
: and_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00008C61 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  and_R,R"
                                                                                                  exit then 0 ;
: RnR_
  `3f1c2c3rd'2c3rs2'2c                               00008C61 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  RnR"
                                                                                                  exit then 0 ;
: subw_R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00009C01 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  subw_R,R"
                                                                                                  exit then 0 ;
: R-R,w_
  `3f1c2c3rd'2c3rs2'2c                               00009C01 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  R-R,w"
                                                                                                  exit then 0 ;
: addw_R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `3f1c2c3rd'2c3rs2'2c                               00009C21 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  addw_R,R"
                                                                                                  exit then 0 ;
: R+R,w_
  `3f1c2c3rd'2c3rs2'2c                               00009C21 =
  if (2    9  7  13p^   4  2  14p^                                                             ."  R+R,w"
                                                                                                  exit then 0 ;
: bnez_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c                   0000E001 =
  if (2   9 7 13p^  [12~10,6~2]>[8,4~3][7~6,2~1,5]  4p                                         ."  bnez_R,#"
                                                                                                  exit then 0 ;
: R<>#?_
  `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c                   0000E001 =
  if (2   9 7 13p^  [12~10,6~2]>[8,4~3][7~6,2~1,5]  4p                                         ."  R<>#?"
                                                                                                  exit then 0 ;
: beqz_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c                   0000C001 =
  if (2   9 7 13p^  [12~10,6~2]>[8,4~3][7~6,2~1,5]  4p                                         ."  beqz_R,#"
                                                                                                  exit then 0 ;
: R=#?_
  `3f3#[8,4~3]3rs1'5#[7~6,2~1,5]2c                   0000C001 =
  if (2   9 7 13p^  [12~10,6~2]>[8,4~3][7~6,2~1,5]  4p                                         ."  R=#?"
                                                                                                  exit then 0 ;
: jr_R_                                            original.mnemonic? @  not  if  0  exit  then
  `3f1?5rs15?2c                                      00008002 =
  if (2   0b  7  14p                                                                           ."  jr_R"
                                                                                                  exit then 0 ;
: jmp_R_
  `3f1?5rs15?2c                                      00008002 =
  if (2   0b  7  14p                                                                           ."  jmp_R"
                                                                                                  exit then 0 ;
: jalr_R_                                          original.mnemonic? @  not  if  0  exit  then
  `3f1?5rs15?2c                                      00009002 =
  if (2   0b  7  14p                                                                           ."  jalr_R"
                                                                                                  exit then 0 ;
: call_R_
  `3f1?5rs15?2c                                      00009002 =
  if (2   0b  7  14p                                                                           ."  call_R"
                                                                                                  exit then 0 ;
: mv_R,R_                                          original.mnemonic? @  not  if  0  exit  then
  `3f1c5rd5rs22c                                     00008002 =
  if (2   0b 7 13p  6  2  14p                                                                  ."  mv_R,R"
                                                                                                  exit then 0 ;
: R=R_
  `3f1c5rd5rs22c                                     00008002 =
  if (2   0b 7 13p  6  2  14p                                                                  ."  R=R"
                                                                                                  exit then 0 ;
: add_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `3f1c5rd5rs22c                                     00009002 =
  if (2   0b 7 13p  6  2  14p                                                                  ."  add_R,R"
                                                                                                  exit then 0 ;
: R+R_
  `3f1c5rd5rs22c                                     00009002 =
  if (2   0b 7 13p  6  2  14p                                                                  ."  R+R"
                                                                                                  exit then 0 ;
: fsdsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f6#[5~3,8~7]5rs22c                               0000A002 =
  if (2  6  2  13p   [12~7]>[5~3,8~7]  4p                                                      ."  fsdsp_R,#"
                                                                                                  exit then 0 ;
: (rp+#)=fR,d_
  `3f6#[5~3,8~7]5rs22c                               0000A002 =
  if (2    [12~7]>[5~3,8~7]  3p 6  2  14p                                                      ."  (rp+#)=fR,d"
                                                                                                  exit then 0 ;
: swsp_R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `3f6#[5~2,7~6]5rs22c                               0000C002 =
  if (2  6  2  13p   [12~7]>[5~2,7~6]  4p                                                      ."  swsp_R,#"
                                                                                                  exit then 0 ;
: (rp+#)=R_
  `3f6#[5~2,7~6]5rs22c                               0000C002 =
  if (2   [12~7]>[5~2,7~6]  3p   6  2  14p                                                     ."  (rp+#)=R"
                                                                                                  exit then 0 ;
: fswsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f6#[5~2,7~6]5rs22c                               0000E002 =
  if (2  6  2  13p   [12~7]>[5~2,7~6]  4p                                                      ."  fswsp_R,#"
                                                                                                  exit then 0 ;
: (rp+#)=fR_
  `3f6#[5~2,7~6]5rs22c                               0000E002 =
  if (2   [12~7]>[5~2,7~6]  3p   6  2  14p                                                     ."  (rp+#)=fR"
                                                                                                  exit then 0 ;
: nop_
  `16c                                               00000000 =
  if (2                                                                                        ."  nop"
                                                                                                  exit then 0 ;
: addi16sp_#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f1#[9][4,6,,8~7,5]2c                             00006101 =
  if (2   [12,6~2]>[9,4,6,8~7,5]   4p                                                          ."  addi16sp_#"
                                                                                                  exit then 0 ;
: sp+#*16_
  `3f1#[9][4,6,,8~7,5]2c                             00006101 =
  if (2   [12,6~2]>[9,4,6,8~7,5]   4p                                                          ."  sp+#*16"
                                                                                                  exit then 0 ;
: add_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  add_R,R,R"
                                                                                                  exit then 0 ;
: R=R+R_
  `7f5r5r3f5r7c                                      00000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R+R"
                                                                                                  exit then 0 ;
: sub_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      40000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  sub_R,R,R"
                                                                                                  exit then 0 ;
: R=R-R_
  `7f5r5r3f5r7c                                      40000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R-R"
                                                                                                  exit then 0 ;
: xor_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00004033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  xor_R,R,R"
                                                                                                  exit then 0 ;
: R=RxR_
  `7f5r5r3f5r7c                                      00004033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=RxR"
                                                                                                  exit then 0 ;
: or_R,R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00006033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  or_R,R,R"
                                                                                                  exit then 0 ;
: R=RoR_
  `7f5r5r3f5r7c                                      00006033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=RoR"
                                                                                                  exit then 0 ;
: and_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00007033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  and_R,R,R"
                                                                                                  exit then 0 ;
: R=RnR_
  `7f5r5r3f5r7c                                      00007033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=RnR"
                                                                                                  exit then 0 ;
: sll_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00001033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  sll_R,R,R"
                                                                                                  exit then 0 ;
: R=R<<R_
  `7f5r5r3f5r7c                                      00001033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R<<R"
                                                                                                  exit then 0 ;
: srl_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  srl_R,R,R"
                                                                                                  exit then 0 ;
: R=R>>R_
  `7f5r5r3f5r7c                                      00005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R>>R"
                                                                                                  exit then 0 ;
: sra_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      40005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  sra_R,R,R"
                                                                                                  exit then 0 ;
: R=R>>R,a_
  `7f5r5r3f5r7c                                      40005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R>>R,a"
                                                                                                  exit then 0 ;
: slt_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00002033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  slt_R,R,R"
                                                                                                  exit then 0 ;
: R=R<R_
  `7f5r5r3f5r7c                                      00002033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R<R"
                                                                                                  exit then 0 ;
: sltu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      00003033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  sltu_R,R,R"
                                                                                                  exit then 0 ;
: R=R<Ru_
  `7f5r5r3f5r7c                                      00003033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R<Ru"
                                                                                                  exit then 0 ;
: mul_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  mul_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R_
  `7f5r5r3f5r7c                                      02000033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R*R"
                                                                                                  exit then 0 ;
: mulh_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02001033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  mulh_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,h_
  `7f5r5r3f5r7c                                      02001033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R*R,h"
                                                                                                  exit then 0 ;
: mulsu_R,R,R_                                      original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02002033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  mulsu_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,su_
  `7f5r5r3f5r7c                                      02002033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R*R,su"
                                                                                                  exit then 0 ;
: mulu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02003033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  mulu_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,u_
  `7f5r5r3f5r7c                                      02003033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R*R,u"
                                                                                                  exit then 0 ;
: div_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02004033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  div_R,R,R"
                                                                                                  exit then 0 ;
: R=R/R_
  `7f5r5r3f5r7c                                      02004033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R/R"
                                                                                                  exit then 0 ;
: divu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  divu_R,R,R"
                                                                                                  exit then 0 ;
: R=R/R,u_
  `7f5r5r3f5r7c                                      02005033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R/R,u"
                                                                                                  exit then 0 ;
: rem_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02006033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  rem_R,R,R"
                                                                                                  exit then 0 ;
: R=R,R,rem_
  `7f5r5r3f5r7c                                      02006033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R,R,rem"
                                                                                                  exit then 0 ;
: remu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c                                      02007033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  remu_R,R,R"
                                                                                                  exit then 0 ;
: R=R,R,remu_
  `7f5r5r3f5r7c                                      02007033 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R,R,remu"
                                                                                                  exit then 0 ;
: subi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `1#11#5r3f5r7c                                     80000013 =
  if (4   0b  7  12p   13  0f  13p   1f  14 14p-[11:0]                                         ."  subi_R,R,#"
                                                                                                  exit then 0 ;
: R=R-#_
  `1#11#5r3f5r7c                                     80000013 =
  if (4   0b  7  12p   13  0f  13p   1f  14 14p-[11:0]                                         ."  R=R-#"
                                                                                                  exit then 0 ;
: addi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00000013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  addi_R,R,#"
                                                                                                  exit then 0 ;
: R=R+#_
  `12#5r3f5r7c                                       00000013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=R+#"
                                                                                                  exit then 0 ;
: xori_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00004013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  xori_R,R,#"
                                                                                                  exit then 0 ;
: R=Rx#_
  `12#5r3f5r7c                                       00004013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=Rx#"
                                                                                                  exit then 0 ;
: ori_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00006013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  ori_R,R,#"
                                                                                                  exit then 0 ;
: R=Ro#_
  `12#5r3f5r7c                                       00006013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=Ro#"
                                                                                                  exit then 0 ;
: andi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00007013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  andi_R,R,#"
                                                                                                  exit then 0 ;
: R=Rn#_
  `12#5r3f5r7c                                       00007013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=Rn#"
                                                                                                  exit then 0 ;
: slti_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00002013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  slti_R,R,#"
                                                                                                  exit then 0 ;
: R=R<#_
  `12#5r3f5r7c                                       00002013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=R<#"
                                                                                                  exit then 0 ;
: sltiu_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00003013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  sltiu_R,R,#"
                                                                                                  exit then 0 ;
: R=Ru<#_
  `12#5r3f5r7c                                       00003013 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=Ru<#"
                                                                                                  exit then 0 ;
: lb_M[R+#]_                                        original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00000003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  lb_M[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)b_
  `12#5r3f5r7c                                       00000003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=(R+#)b"
                                                                                                  exit then 0 ;
: lh_R,[R+#]_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00001003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  lh_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)h_
  `12#5r3f5r7c                                       00001003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=(R+#)h"
                                                                                                  exit then 0 ;
: lw_R,[R+#]_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00002003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  lw_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)_
  `12#5r3f5r7c                                       00002003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=(R+#)"
                                                                                                  exit then 0 ;
: lbu_R,[R+#]_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00004003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  lbu_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)bu_
  `12#5r3f5r7c                                       00004003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=(R+#)bu"
                                                                                                  exit then 0 ;
: lhu_R,[R+#]_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00005003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  lhu_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)hu_
  `12#5r3f5r7c                                       00005003 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=(R+#)hu"
                                                                                                  exit then 0 ;
: ecall_os_
  `12#5r3f5r7c                                       00000073 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  ecall_os"
                                                                                                  exit then 0 ;
: ebreak_debugger_
  `12#5r3f5r7c                                       00100073 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  ebreak_debugger"
                                                                                                  exit then 0 ;
: slli_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c                                      00001013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  slli_R,R,#"
                                                                                                  exit then 0 ;
: R=R<<#_
  `7f5s5r3f5r7c                                      00001013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R<<#"
                                                                                                  exit then 0 ;
: srli_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c                                      00005013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  srli_R,R,#"
                                                                                                  exit then 0 ;
: R=R>>#_
  `7f5s5r3f5r7c                                      00005013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R>>#"
                                                                                                  exit then 0 ;
: srai_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c                                      40005013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  srai_R,R,#"
                                                                                                  exit then 0 ;
: R=R>>#,a_
  `7f5s5r3f5r7c                                      40005013 =
  if (4   0b  7  12p   13  0f  13p   18  14  14p                                               ."  R=R>>#,a"
                                                                                                  exit then 0 ;
: sb_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c                           00000023 =
  if (4    18  14  12p  13  0f  13p  1f 19  0b  7  24p[1f:19|0b:7]                             ."  sb_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R,b_
  `7#[11:5]5r5r3f5#[4:0]7c                           00000023 =
  if (4   13  0f  12p  1f 19  0b  7  23p  18  14  14p                                          ."  (R+#)=R,b"
                                                                                                  exit then 0 ;
: sh_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c                           00001023 =
  if (4    18  14  12p  13  0f  13p  1f 19  0b  7  24p[1f:19|0b:7]                             ."  sh_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R,h_
  `7#[11:5]5r5r3f5#[4:0]7c                           00001023 =
  if (4   13  0f  12p  1f 19  0b  7  23p  18  14  14p                                          ."  (R+#)=R,h"
                                                                                                  exit then 0 ;
: sw_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c                           00002023 =
  if (4    18  14  12p  13  0f  13p  1f 19  0b  7  24p[1f:19|0b:7]                             ."  sw_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R_
  `7#[11:5]5r5r3f5#[4:0]7c                           00002023 =
  if (4   13  0f  12p  1f 19  0b  7  23p  18  14  14p                                          ."  (R+#)=R"
                                                                                                  exit then 0 ;
: beq_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00000063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  beq_R,R,#"
                                                                                                  exit then 0 ;
: R=R?,#_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00000063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R=R?,#"
                                                                                                  exit then 0 ;
: bne_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00001063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  bne_R,R,#"
                                                                                                  exit then 0 ;
: R<>R?,#_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00001063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R<>R?,#"
                                                                                                  exit then 0 ;
: blt_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00004063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  blt_R,R,#"
                                                                                                  exit then 0 ;
: R<R?,#_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00004063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R<R?,#"
                                                                                                  exit then 0 ;
: bge_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00005063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  bge_R,R,#"
                                                                                                  exit then 0 ;
: R>=R?,#_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00005063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R>=R?,#"
                                                                                                  exit then 0 ;
: bltu_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00006063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  bltu_R,R,#"
                                                                                                  exit then 0 ;
: R<R?,#u_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00006063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R<R?,#u"
                                                                                                  exit then 0 ;
: bgeu_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00007063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  bgeu_R,R,#"
                                                                                                  exit then 0 ;
: R>=R?,#u_
  `7#[12|10:5]5r5r3f5#[4:1|11]7c                     00007063 =
  if (4   13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]                                           ."  R>=R?,#u"
                                                                                                  exit then 0 ;
: lui_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                                           00000037 =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  lui_R,#"
                                                                                                  exit then 0 ;
: R=#,u_
  `20#5r7c                                           00000037 =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  R=#,u"
                                                                                                  exit then 0 ;
: auipc_#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                                           00000017 =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  auipc_#"
                                                                                                  exit then 0 ;
: pc+#,u_
  `20#5r7c                                           00000017 =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  pc+#,u"
                                                                                                  exit then 0 ;
: jal_#_                                            original.mnemonic? @  not  if  0  exit  then
  `20#12c                                            000000EF =
  if (4    14p[20|10:1|11|19:12]                                                               ."  jal_#"
                                                                                                  exit then 0 ;
: call_#_
  `20#12c                                            000000EF =
  if (4    14p[20|10:1|11|19:12]                                                               ."  call_#"
                                                                                                  exit then 0 ;
: jmp_#_                                            original.mnemonic? @  not  if  0  exit  then
  `20#12c                                            0000006F =
  if (4    14p[20|10:1|11|19:12]                                                               ."  jmp_#"
                                                                                                  exit then 0 ;
: jal_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                                           0000006F =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  jal_R,#"
                                                                                                  exit then 0 ;
: call_R+#_
  `20#5r7c                                           0000006F =
  if (2   0b  7  13p   1f  0c  14p                                                             ."  call_R+#"
                                                                                                  exit then 0 ;
: jalr_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c                                       00000067 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  jalr_R,R,#"
                                                                                                  exit then 0 ;
: R=pc+4;pc=R+#_
  `12#5r3f5r7c                                       00000067 =
  if (4   0b  7  12p   13  0f  13p   1f  14  14p[11:0]                                         ."  R=pc+4;pc=R+#"
                                                                                                  exit then 0 ;


























: dis  ( a' -- a'1 )
  addispn_R,#_                                   ?dup if + exit then
  R+(sp+#)_                                      ?dup if + exit then
  fld_R,R,#_                                     ?dup if + exit then
  fR=(fR+#)d_                                    ?dup if + exit then
  fsd_R,R,#_                                     ?dup if + exit then
  (fR+#)=fR,d_                                   ?dup if + exit then
  lw_R,R,#_                                      ?dup if + exit then
  R=(R+#)_                                       ?dup if + exit then
  flw_R,R,#_                                     ?dup if + exit then
  fR=(fR+#)_                                     ?dup if + exit then
  sw_R,R,#_                                      ?dup if + exit then
  (R+#)=R_                                       ?dup if + exit then
  fsw_R,R,#_                                     ?dup if + exit then
  (fR+#)=fR_                                     ?dup if + exit then
  fldsp_R,#_                                     ?dup if + exit then
  fR=(rp+#)d_                                    ?dup if + exit then
  ldsp_R,#_                                      ?dup if + exit then
  R=(rp+#)d_                                     ?dup if + exit then
  lwsp_R,#_                                      ?dup if + exit then
  R=(rp+#)_                                      ?dup if + exit then
  flwsp_R,#_                                     ?dup if + exit then
  fR=(rp+#)_                                     ?dup if + exit then
  slli_R,#_                                      ?dup if + exit then
  R<<#_                                          ?dup if + exit then
  li_R,#_                                        ?dup if + exit then
  R=#_                                           ?dup if + exit then
  addi_R,#_                                      ?dup if + exit then
  R+#_                                           ?dup if + exit then
  subi_R,#_                                      ?dup if + exit then
  R-#_                                           ?dup if + exit then
  srli_R,#_                                      ?dup if + exit then
  R>>#_                                          ?dup if + exit then
  srai_R,#_                                      ?dup if + exit then
  R>>#,a_                                        ?dup if + exit then
  andi_R,#_                                      ?dup if + exit then
  Rn#_                                           ?dup if + exit then
  lui_R,#_                                       ?dup if + exit then
  R=#,u_                                         ?dup if + exit then
  jal_#_                                         ?dup if + exit then
  call_#_                                        ?dup if + exit then
  j_#_                                           ?dup if + exit then
  jmp_#_                                         ?dup if + exit then
  sub_R,R_                                       ?dup if + exit then
  R-R_                                           ?dup if + exit then
  xor_R,R_                                       ?dup if + exit then
  RxR_                                           ?dup if + exit then
  or_R,R_                                        ?dup if + exit then
  RoR_                                           ?dup if + exit then
  and_R,R_                                       ?dup if + exit then
  RnR_                                           ?dup if + exit then
  subw_R,R_                                      ?dup if + exit then
  R-R,w_                                         ?dup if + exit then
  addw_R,R_                                      ?dup if + exit then
  R+R,w_                                         ?dup if + exit then
  bnez_R,#_                                      ?dup if + exit then
  R<>#?_                                         ?dup if + exit then
  beqz_R,#_                                      ?dup if + exit then
  R=#?_                                          ?dup if + exit then
  jr_R_                                          ?dup if + exit then
  jmp_R_                                         ?dup if + exit then
  jalr_R_                                        ?dup if + exit then
  call_R_                                        ?dup if + exit then
  mv_R,R_                                        ?dup if + exit then
  R=R_                                           ?dup if + exit then
  add_R,R_                                       ?dup if + exit then
  R+R_                                           ?dup if + exit then
  fsdsp_R,#_                                     ?dup if + exit then
  (rp+#)=fR,d_                                   ?dup if + exit then
  swsp_R,#_                                      ?dup if + exit then
  (rp+#)=R_                                      ?dup if + exit then
  fswsp_R,#_                                     ?dup if + exit then
  (rp+#)=fR_                                     ?dup if + exit then
  nop_                                           ?dup if + exit then
  addi16sp_#_                                    ?dup if + exit then
  sp+#*16_                                       ?dup if + exit then
  add_R,R,R_                                      ?dup if + exit then
  R=R+R_                                          ?dup if + exit then
  sub_R,R,R_                                      ?dup if + exit then
  R=R-R_                                          ?dup if + exit then
  xor_R,R,R_                                      ?dup if + exit then
  R=RxR_                                          ?dup if + exit then
  or_R,R,R_                                       ?dup if + exit then
  R=RoR_                                          ?dup if + exit then
  and_R,R,R_                                      ?dup if + exit then
  R=RnR_                                          ?dup if + exit then
  sll_R,R,R_                                      ?dup if + exit then
  R=R<<R_                                         ?dup if + exit then
  srl_R,R,R_                                      ?dup if + exit then
  R=R>>R_                                         ?dup if + exit then
  sra_R,R,R_                                      ?dup if + exit then
  R=R>>R,a_                                       ?dup if + exit then
  slt_R,R,R_                                      ?dup if + exit then
  R=R<R_                                          ?dup if + exit then
  sltu_R,R,R_                                     ?dup if + exit then
  R=R<Ru_                                         ?dup if + exit then
  mul_R,R,R_                                      ?dup if + exit then
  R=R*R_                                          ?dup if + exit then
  mulh_R,R,R_                                     ?dup if + exit then
  R=R*R,h_                                        ?dup if + exit then
  mulsu_R,R,R_                                    ?dup if + exit then
  R=R*R,su_                                       ?dup if + exit then
  mulu_R,R,R_                                     ?dup if + exit then
  R=R*R,u_                                        ?dup if + exit then
  div_R,R,R_                                      ?dup if + exit then
  R=R/R_                                          ?dup if + exit then
  divu_R,R,R_                                     ?dup if + exit then
  R=R/R,u_                                        ?dup if + exit then
  rem_R,R,R_                                      ?dup if + exit then
  R=R,R,rem_                                      ?dup if + exit then
  remu_R,R,R_                                     ?dup if + exit then
  R=R,R,remu_                                     ?dup if + exit then
  subi_R,R,#_                                     ?dup if + exit then
  R=R-#_                                          ?dup if + exit then
  addi_R,R,#_                                     ?dup if + exit then
  R=R+#_                                          ?dup if + exit then
  xori_R,R,#_                                     ?dup if + exit then
  R=Rx#_                                          ?dup if + exit then
  ori_R,R,#_                                      ?dup if + exit then
  R=Ro#_                                          ?dup if + exit then
  andi_R,R,#_                                     ?dup if + exit then
  R=Rn#_                                          ?dup if + exit then
  slti_R,R,#_                                     ?dup if + exit then
  R=R<#_                                          ?dup if + exit then
  sltiu_R,R,#_                                    ?dup if + exit then
  R=Ru<#_                                         ?dup if + exit then
  lb_M[R+#]_                                      ?dup if + exit then
  R=(R+#)b_                                       ?dup if + exit then
  lh_R,[R+#]_                                     ?dup if + exit then
  R=(R+#)h_                                       ?dup if + exit then
  lw_R,[R+#]_                                     ?dup if + exit then
  R=(R+#)_                                        ?dup if + exit then
  lbu_R,[R+#]_                                    ?dup if + exit then
  R=(R+#)bu_                                      ?dup if + exit then
  lhu_R,[R+#]_                                    ?dup if + exit then
  R=(R+#)hu_                                      ?dup if + exit then
  ecall_os_                                       ?dup if + exit then
  ebreak_debugger_                                ?dup if + exit then
  slli_R,R,#_                                     ?dup if + exit then
  R=R<<#_                                         ?dup if + exit then
  srli_R,R,#_                                     ?dup if + exit then
  R=R>>#_                                         ?dup if + exit then
  srai_R,R,#_                                     ?dup if + exit then
  R=R>>#,a_                                       ?dup if + exit then
  sb_R,R,#_                                       ?dup if + exit then
  (R+#)=R,b_                                      ?dup if + exit then
  sh_R,R,#_                                       ?dup if + exit then
  (R+#)=R,h_                                      ?dup if + exit then
  sw_R,R,#_                                       ?dup if + exit then
  (R+#)=R_                                        ?dup if + exit then
  beq_R,R,#_                                      ?dup if + exit then
  R=R?,#_                                         ?dup if + exit then
  bne_R,R,#_                                      ?dup if + exit then
  R<>R?,#_                                        ?dup if + exit then
  blt_R,R,#_                                      ?dup if + exit then
  R<R?,#_                                         ?dup if + exit then
  bge_R,R,#_                                      ?dup if + exit then
  R>=R?,#_                                        ?dup if + exit then
  bltu_R,R,#_                                     ?dup if + exit then
  R<R?,#u_                                        ?dup if + exit then
  bgeu_R,R,#_                                     ?dup if + exit then
  R>=R?,#u_                                       ?dup if + exit then
  lui_R,#_                                        ?dup if + exit then
  R=#,u_                                          ?dup if + exit then
  auipc_#_                                        ?dup if + exit then
  pc+#,u_                                         ?dup if + exit then
  jal_#_                                          ?dup if + exit then
  call_#_                                         ?dup if + exit then
  jmp_#_                                          ?dup if + exit then
  jal_R,#_                                        ?dup if + exit then
  call_R+#_                                       ?dup if + exit then
  jalr_R,R,#_                                     ?dup if + exit then
  R=pc+4;pc=R+#_                                  ?dup if + exit then
;

: dis10  ( a' -- a'1)  10 0 do  cr  dis loop ;

