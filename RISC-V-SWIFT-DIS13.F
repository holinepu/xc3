
: add_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   add_R,R,R"
                                                                                                  exit then 0 ;
: R=R+R_
  `7f5r5r3f5r7c              00000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R+R"
                                                                                                  exit then 0 ;
: sub_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              40000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sub_R,R,R"
                                                                                                  exit then 0 ;
: R=R-R_
  `7f5r5r3f5r7c              40000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R-R"
                                                                                                  exit then 0 ;
: xor_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   xor_R,R,R"
                                                                                                  exit then 0 ;
: R=RxR_
  `7f5r5r3f5r7c              00004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RxR"
                                                                                                  exit then 0 ;
: or_R,R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   or_R,R,R"
                                                                                                  exit then 0 ;
: R=RoR_
  `7f5r5r3f5r7c              00006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RoR"
                                                                                                  exit then 0 ;
: and_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   and_R,R,R"
                                                                                                  exit then 0 ;
: R=RnR_
  `7f5r5r3f5r7c              00007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RnR"
                                                                                                  exit then 0 ;
: sll_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sll_R,R,R"
                                                                                                  exit then 0 ;
: R=R<<R_
  `7f5r5r3f5r7c              00001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<<R"
                                                                                                  exit then 0 ;
: srl_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srl_R,R,R"
                                                                                                  exit then 0 ;
: R=R>>R_
  `7f5r5r3f5r7c              00005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>R"
                                                                                                  exit then 0 ;
: sra_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              40005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sra_R,R,R"
                                                                                                  exit then 0 ;
: R=R>>R,a_
  `7f5r5r3f5r7c              40005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>R,a"
                                                                                                  exit then 0 ;
: slt_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   slt_R,R,R"
                                                                                                  exit then 0 ;
: R=R<R_
  `7f5r5r3f5r7c              00002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<R"
                                                                                                  exit then 0 ;
: sltu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              00003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sltu_R,R,R"
                                                                                                  exit then 0 ;
: R=R<Ru_
  `7f5r5r3f5r7c              00003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<Ru"
                                                                                                  exit then 0 ;
: mul_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mul_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R_
  `7f5r5r3f5r7c              02000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R"
                                                                                                  exit then 0 ;
: mulh_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulh_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,h_
  `7f5r5r3f5r7c              02001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,h"
                                                                                                  exit then 0 ;
: mulsu_R,R,R_                                      original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulsu_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,su_
  `7f5r5r3f5r7c              02002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,su"
                                                                                                  exit then 0 ;
: mulu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulu_R,R,R"
                                                                                                  exit then 0 ;
: R=R*R,u_
  `7f5r5r3f5r7c              02003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,u"
                                                                                                  exit then 0 ;
: div_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   div_R,R,R"
                                                                                                  exit then 0 ;
: R=R/R_
  `7f5r5r3f5r7c              02004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R/R"
                                                                                                  exit then 0 ;
: divu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   divu_R,R,R"
                                                                                                  exit then 0 ;
: R=R/R,u_
  `7f5r5r3f5r7c              02005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R/R,u"
                                                                                                  exit then 0 ;
: rem_R,R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   rem_R,R,R"
                                                                                                  exit then 0 ;
: R=R,R,rem_
  `7f5r5r3f5r7c              02006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R,R,rem"
                                                                                                  exit then 0 ;
: remu_R,R,R_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5r5r3f5r7c              02007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   remu_R,R,R"
                                                                                                  exit then 0 ;
: R=R,R,remu_
  `7f5r5r3f5r7c              02007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R,R,remu"
                                                                                                  exit then 0 ;
: subi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `1#11#5r3f5r7c             80000013 = if (4  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]      ."   subi_R,R,#"
                                                                                                  exit then 0 ;
: R=R-#_
  `1#11#5r3f5r7c             80000013 = if (4  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]      ."   R=R-#"
                                                                                                  exit then 0 ;
: addi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00000013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   addi_R,R,#"
                                                                                                  exit then 0 ;
: R=R+#_
  `12#5r3f5r7c               00000013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=R+#"
                                                                                                  exit then 0 ;
: xori_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00004013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   xori_R,R,#"
                                                                                                  exit then 0 ;
: R=Rx#_
  `12#5r3f5r7c               00004013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Rx#"
                                                                                                  exit then 0 ;
: ori_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00006013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ori_R,R,#"
                                                                                                  exit then 0 ;
: R=Ro#_
  `12#5r3f5r7c               00006013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Ro#"
                                                                                                  exit then 0 ;
: andi_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00007013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   andi_R,R,#"
                                                                                                  exit then 0 ;
: R=Rn#_
  `12#5r3f5r7c               00007013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Rn#"
                                                                                                  exit then 0 ;
: slti_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00002013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   slti_R,R,#"
                                                                                                  exit then 0 ;
: R=R<#_
  `12#5r3f5r7c               00002013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=R<#"
                                                                                                  exit then 0 ;
: sltiu_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00003013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   sltiu_R,R,#"
                                                                                                  exit then 0 ;
: R=Ru<#_
  `12#5r3f5r7c               00003013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Ru<#"
                                                                                                  exit then 0 ;
: lb_M[R+#]_                                        original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00000003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lb_M[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)b_
  `12#5r3f5r7c               00000003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)b"
                                                                                                  exit then 0 ;
: lh_R,[R+#]_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00001003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lh_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)h_
  `12#5r3f5r7c               00001003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)h"
                                                                                                  exit then 0 ;
: lw_R,[R+#]_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00002003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lw_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)_
  `12#5r3f5r7c               00002003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)"
                                                                                                  exit then 0 ;
: lbu_R,[R+#]_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00004003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lbu_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)bu_
  `12#5r3f5r7c               00004003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)bu"
                                                                                                  exit then 0 ;
: lhu_R,[R+#]_                                      original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00005003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lhu_R,[R+#]"
                                                                                                  exit then 0 ;
: R=(R+#)hu_
  `12#5r3f5r7c               00005003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)hu"
                                                                                                  exit then 0 ;
: ecall_os_                                         original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00000073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ecall_os"
                                                                                                  exit then 0 ;
: ecall_os_
  `12#5r3f5r7c               00000073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ecall_os"
                                                                                                  exit then 0 ;
: ebreak_debugger_                                  original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00100073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ebreak_debugger"
                                                                                                  exit then 0 ;
: ebreak_debugger_
  `12#5r3f5r7c               00100073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ebreak_debugger"
                                                                                                  exit then 0 ;
: slli_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c              00001013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   slli_R,R,#"
                                                                                                  exit then 0 ;
: R=R<<#_
  `7f5s5r3f5r7c              00001013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<<#"
                                                                                                  exit then 0 ;
: srli_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c              00005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srli_R,R,#"
                                                                                                  exit then 0 ;
: R=R>>#_
  `7f5s5r3f5r7c              00005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>#"
                                                                                                  exit then 0 ;
: srai_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7f5s5r3f5r7c              40005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srai_R,R,#"
                                                                                                  exit then 0 ;
: R=R>>#,a_
  `7f5s5r3f5r7c              40005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>#,a"
                                                                                                  exit then 0 ;
: sb_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c   00000023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sb_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R,b_
  `7#[11:5]5r5r3f5#[4:0]7c   00000023 = if (4  13  0f  12p  1f 19  0b  7  23p  18  14  14p       ."   (R+#)=R,b"
                                                                                                  exit then 0 ;
: sh_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c   00001023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sh_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R,h_
  `7#[11:5]5r5r3f5#[4:0]7c   00001023 = if (4  13  0f  12p  1f 19  0b  7  23p  18  14  14p       ."   (R+#)=R,h"
                                                                                                  exit then 0 ;
: sw_R,R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `7#[11:5]5r5r3f5#[4:0]7c   00002023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sw_R,R,#"
                                                                                                  exit then 0 ;
: (R+#)=R_
  `7#[11:5]5r5r3f5#[4:0]7c   00002023 = if (4  13  0f  12p  1f 19  0b  7  23p[][]  18  14  14p       ."   (R+#)=R"
                                                                                                  exit then 0 ;
: beq_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00000063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   beq_R,R,#"
                                                                                                  exit then 0 ;
: R=R?,#_
  `7#[]5r5r3f5#[]7c          00000063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R=R?,#"
                                                                                                  exit then 0 ;
: bne_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00001063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bne_R,R,#"
                                                                                                  exit then 0 ;
: R<>R?,#_
  `7#[]5r5r3f5#[]7c          00001063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<>R?,#"
                                                                                                  exit then 0 ;
: blt_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00004063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   blt_R,R,#"
                                                                                                  exit then 0 ;
: R<R?,#_
  `7#[]5r5r3f5#[]7c          00004063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<R?,#"
                                                                                                  exit then 0 ;
: bge_R,R,#_                                        original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00005063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bge_R,R,#"
                                                                                                  exit then 0 ;
: R>=R?,#_
  `7#[]5r5r3f5#[]7c          00005063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R>=R?,#"
                                                                                                  exit then 0 ;
: bltu_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00006063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bltu_R,R,#"
                                                                                                  exit then 0 ;
: R<R?,#u_
  `7#[]5r5r3f5#[]7c          00006063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<R?,#u"
                                                                                                  exit then 0 ;
: bgeu_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `7#[]5r5r3f5#[]7c          00007063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bgeu_R,R,#"
                                                                                                  exit then 0 ;
: R>=R?,#u_
  `7#[]5r5r3f5#[]7c          00007063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R>=R?,#u"
                                                                                                  exit then 0 ;
: lui_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   lui_R,#"
                                                                                                  exit then 0 ;
: R=#,u_
  `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   R=#,u"
                                                                                                  exit then 0 ;
: auipc_#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   auipc_#"
                                                                                                  exit then 0 ;
: R=pc+#,u_
  `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   R=pc+#,u"
                                                                                                  exit then 0 ;
: lui_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   lui_R,#"
                                                                                                  exit then 0 ;
: R=#,u_
  `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   R=#,u"
                                                                                                  exit then 0 ;
: auipc_#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   auipc_#"
                                                                                                  exit then 0 ;
: pc+#,u_
  `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   pc+#,u"
                                                                                                  exit then 0 ;
: jal_#_                                            original.mnemonic? @  not  if  0  exit  then
  `20#12c                    000000EF = if (4   14p[20|10:1|11|19:12]                            ."   jal_#"
                                                                                                  exit then 0 ;
: call_#_
  `20#12c                    000000EF = if (4   14p[20|10:1|11|19:12]                            ."   call_#"
                                                                                                  exit then 0 ;
: jmp_#_                                            original.mnemonic? @  not  if  0  exit  then
  `20#12c                    0000006F = if (4   14p[20|10:1|11|19:12]                            ."   jmp_#"
                                                                                                  exit then 0 ;
: jal_R,#_                                          original.mnemonic? @  not  if  0  exit  then
  `20#5r7c                   0000006F = if (4  0b  7  13p   14p[20|10:1|11|19:12]                ."   jal_R,#"
                                                                                                  exit then 0 ;
: call_R+#_
  `20#5r7c                   0000006F = if (4  0b  7  13p   14p[20|10:1|11|19:12]                ."   call_R+#"
                                                                                                  exit then 0 ;
: jalr_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `12#5r3f5r7c               00000067 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   jalr_R,R,#"
                                                                                                  exit then 0 ;
: R=pc+4;pc=R+#_
  `12#5r3f5r7c               00000067 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=pc+4;pc=R+#"
                                                                                                  exit then 0 ;
: c.mv_R,R_                                         original.mnemonic? @  not  if  0  exit  then
  `4f5r5r2o                  00008002 = if (2  0b  7  13p  6  2  14p                             ."   c.mv_R,R"
                                                                                                  exit then 0 ;
: c.R=R_
  `4f5r5r2o                  00008002 = if (2  0b  7  13p  6  2  14p                             ."   c.R=R"
                                                                                                  exit then 0 ;
: c.add_R,R_                                        original.mnemonic? @  not  if  0  exit  then
  `4f5r5r2o                  00009002 = if (2  0b  7  13p  6  2  14p                             ."   c.add_R,R"
                                                                                                  exit then 0 ;
: c.R+R_
  `4f5r5r2o                  00009002 = if (2  0b  7  13p  6  2  14p                             ."   c.R+R"
                                                                                                  exit then 0 ;
: c.srli_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o       00008001 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.srli_R,#"
                                                                                                  exit then 0 ;
: c.R<<R,a_
  `3f#[5]2c3r'#[4:0]2o       00008001 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.R<<R,a"
                                                                                                  exit then 0 ;
: c.srai_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o       00008401 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.srai_R,#"
                                                                                                  exit then 0 ;
: c.R>>R,a_
  `3f#[5]2c3r'#[4:0]2o       00008401 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.R>>R,a"
                                                                                                  exit then 0 ;
: c.andi_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f#[5]2c3r'#[4:0]2o       00008801 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.andi_R,#"
                                                                                                  exit then 0 ;
: c.Rn#_
  `3f#[5]2c3r'#[4:0]2o       00008801 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.Rn#"
                                                                                                  exit then 0 ;
: c.jr_R_                                           original.mnemonic? @  not  if  0  exit  then
  `4f5r5c2o                  00008002 = if (2  0b  7  14p                                        ."   c.jr_R"
                                                                                                  exit then 0 ;
: c.jmp.R_
  `4f5r5c2o                  00008002 = if (2  0b  7  14p                                        ."   c.jmp.R"
                                                                                                  exit then 0 ;
: c.jalr_R_                                         original.mnemonic? @  not  if  0  exit  then
  `4f5r5c2o                  00009002 = if (2  0b  7  14p                                        ."   c.jalr_R"
                                                                                                  exit then 0 ;
: c.jmp.R.Link_
  `4f5r5c2o                  00009002 = if (2  0b  7  14p                                        ."   c.jmp.R.Link"
                                                                                                  exit then 0 ;
: _
  `16c                       00009002 = if (2                                                    ."   "
                                                                                                  exit then 0 ;
: c.beqz_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f[]rs1'[7:6|]2o          0000C001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.beqz_R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f[]rs1'[7:6|]2o          0000C001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.bnez_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f[]rs1'[7:6|]2o          0000E001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.bnez_#"
                                                                                                  exit then 0 ;
: c.R<>#?_
  `3f[]rs1'[7:6|]2o          0000E001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.R<>#?"
                                                                                                  exit then 0 ;
: c.swsp_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f.imm[5:2|7:6].rs2.2o    0000C002 = if (2   6  2  13p   [5:2|7:6]_14p                        ."   c.swsp_R,#"
                                                                                                  exit then 0 ;
: c.(sp+#*4)=R_
  `3f.imm[5:2|7:6].rs2.2o    0000C002 = if (2   6  2  13p   [5:2|7:6]_14p                        ."   c.(sp+#*4)=R"
                                                                                                  exit then 0 ;
: c.addi4spn_R,sp+#*4_                              original.mnemonic? @  not  if  0  exit  then
  `3f.nz[5:4|9:6|2|3]rd'2o   00000000 = if (2  4  2 13p   [5:4|9:6|2|3]_14p                      ."   c.addi4spn_R,sp+#*4"
                                                                                                  exit then 0 ;
: c.R=sp+#*4_
  `3f.nz[5:4|9:6|2|3]rd'2o   00000000 = if (2  4  2 13p   [5:4|9:6|2|3]_14p                      ."   c.R=sp+#*4"
                                                                                                  exit then 0 ;
: c.lw_R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f.nz[5:4|9:6|2|3]rd'2o   00004000 = if (2  0c  2  14p[12:2]                                  ."   c.lw_R,#"
                                                                                                  exit then 0 ;
: c.R=#_
  `3f.nz[5:4|9:6|2|3]rd'2o   00004000 = if (2  0c  2  14p[12:2]                                  ."   c.R=#"
                                                                                                  exit then 0 ;
: c.sw_R,#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f.nz[5:4|9:6|2|3]rd'2o   0000C000 = if (2  0c  2  14p[12:2]                                  ."   c.sw_R,#"
                                                                                                  exit then 0 ;
: c.R=#_
  `3f.nz[5:4|9:6|2|3]rd'2o   0000C000 = if (2  0c  2  14p[12:2]                                  ."   c.R=#"
                                                                                                  exit then 0 ;
: c.sw_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.sw_R,R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.and_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.and_R,R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.or_R,R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.or_R,R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.xor_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.xor_R,R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.sub_R,R,#_                                      original.mnemonic? @  not  if  0  exit  then
  `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.sub_R,R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.beqz_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                  ."   c.beqz_R,#"
                                                                                                  exit then 0 ;
: c.R=#?_
  `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                  ."   c.R=#?"
                                                                                                  exit then 0 ;
: c.bnez_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                  ."   c.bnez_#"
                                                                                                  exit then 0 ;
: c.R<>#?_
  `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                  ."   c.R<>#?"
                                                                                                  exit then 0 ;
: c.srli_#_                                         original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                  ."   c.srli_#"
                                                                                                  exit then 0 ;
: c.R>>#_
  `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                  ."   c.R>>#"
                                                                                                  exit then 0 ;
: c.srai_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                  ."   c.srai_R,#"
                                                                                                  exit then 0 ;
: c.R>>#,a_
  `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                  ."   c.R>>#,a"
                                                                                                  exit then 0 ;
: c.andi_R,#_                                       original.mnemonic? @  not  if  0  exit  then
  `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                  ."   c.andi_R,#"
                                                                                                  exit then 0 ;
: c.Rn#_
  `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                  ."   c.Rn#"
                                                                                                  exit then 0 ;
: c.j_#_                                            original.mnemonic? @  not  if  0  exit  then
  `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                  ."   c.j_#"
                                                                                                  exit then 0 ;
: c.jmp_#_
  `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                  ."   c.jmp_#"
                                                                                                  exit then 0 ;
: c.jal_#_                                          original.mnemonic? @  not  if  0  exit  then
  `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                  ."   c.jal_#"
                                                                                                  exit then 0 ;
: c.call_#_
  `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                  ."   c.call_#"
                                                                                                  exit then 0 ;


























































































































variable  depth.in
variable  dis.addr

: dis  ( a' -- a'1 )

  depth   depth.in  !      dup  dis.addr  !

  add_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   add_R,R,R"
                                                                                                  \ exit then 0 ;
  R=R+R_
  ?dup if + exit then \ `7f5r5r3f5r7c              00000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R+R"
                                                                                                  \ exit then 0 ;
  sub_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              40000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sub_R,R,R"
                                                                                                  \ exit then 0 ;
  R=R-R_
  ?dup if + exit then \ `7f5r5r3f5r7c              40000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R-R"
                                                                                                  \ exit then 0 ;
  xor_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   xor_R,R,R"
                                                                                                  \ exit then 0 ;
  R=RxR_
  ?dup if + exit then \ `7f5r5r3f5r7c              00004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RxR"
                                                                                                  \ \ exit then 0 ;
  or_R,R,R_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   or_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=RoR_
  ?dup if + exit then \ `7f5r5r3f5r7c              00006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RoR"
                                                                                                  \ \ exit then 0 ;
  and_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   and_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=RnR_
  ?dup if + exit then \ `7f5r5r3f5r7c              00007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=RnR"
                                                                                                  \ \ exit then 0 ;
  sll_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sll_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R<<R_
  ?dup if + exit then \ `7f5r5r3f5r7c              00001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<<R"
                                                                                                  \ \ exit then 0 ;
  srl_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srl_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R>>R_
  ?dup if + exit then \ `7f5r5r3f5r7c              00005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>R"
                                                                                                  \ \ exit then 0 ;
  sra_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              40005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sra_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R>>R,a_
  ?dup if + exit then \ `7f5r5r3f5r7c              40005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>R,a"
                                                                                                  \ \ exit then 0 ;
  slt_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   slt_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R<R_
  ?dup if + exit then \ `7f5r5r3f5r7c              00002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<R"
                                                                                                  \ \ exit then 0 ;
  sltu_R,R,R_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              00003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   sltu_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R<Ru_
  ?dup if + exit then \ `7f5r5r3f5r7c              00003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<Ru"
                                                                                                  \ \ exit then 0 ;
  mul_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mul_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R*R_
  ?dup if + exit then \ `7f5r5r3f5r7c              02000033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R"
                                                                                                  \ \ exit then 0 ;
  mulh_R,R,R_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulh_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R*R,h_
  ?dup if + exit then \ `7f5r5r3f5r7c              02001033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,h"
                                                                                                  \ \ exit then 0 ;
  mulsu_R,R,R_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulsu_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R*R,su_
  ?dup if + exit then \ `7f5r5r3f5r7c              02002033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,su"
                                                                                                  \ \ exit then 0 ;
  mulu_R,R,R_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   mulu_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R*R,u_
  ?dup if + exit then \ `7f5r5r3f5r7c              02003033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R*R,u"
                                                                                                  \ \ exit then 0 ;
  div_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   div_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R/R_
  ?dup if + exit then \ `7f5r5r3f5r7c              02004033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R/R"
                                                                                                  \ \ exit then 0 ;
  divu_R,R,R_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   divu_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R/R,u_
  ?dup if + exit then \ `7f5r5r3f5r7c              02005033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R/R,u"
                                                                                                  \ \ exit then 0 ;
  rem_R,R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   rem_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R,R,rem_
  ?dup if + exit then \ `7f5r5r3f5r7c              02006033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R,R,rem"
                                                                                                  \ \ exit then 0 ;
  remu_R,R,R_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5r5r3f5r7c              02007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   remu_R,R,R"
                                                                                                  \ \ exit then 0 ;
  R=R,R,remu_
  ?dup if + exit then \ `7f5r5r3f5r7c              02007033 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R,R,remu"
                                                                                                  \ \ exit then 0 ;
  subi_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `1#11#5r3f5r7c             80000013 = if (4  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]      ."   subi_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R-#_
  ?dup if + exit then \ `1#11#5r3f5r7c             80000013 = if (4  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]      ."   R=R-#"
                                                                                                  \ \ exit then 0 ;
  addi_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00000013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   addi_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R+#_
  ?dup if + exit then \ `12#5r3f5r7c               00000013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=R+#"
                                                                                                  \ \ exit then 0 ;
  xori_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00004013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   xori_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=Rx#_
  ?dup if + exit then \ `12#5r3f5r7c               00004013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Rx#"
                                                                                                  \ \ exit then 0 ;
  ori_R,R,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00006013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ori_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=Ro#_
  ?dup if + exit then \ `12#5r3f5r7c               00006013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Ro#"
                                                                                                  \ \ exit then 0 ;
  andi_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00007013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   andi_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=Rn#_
  ?dup if + exit then \ `12#5r3f5r7c               00007013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Rn#"
                                                                                                  \ \ exit then 0 ;
  slti_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00002013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   slti_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R<#_
  ?dup if + exit then \ `12#5r3f5r7c               00002013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=R<#"
                                                                                                  \ \ exit then 0 ;
  sltiu_R,R,#_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00003013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   sltiu_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=Ru<#_
  ?dup if + exit then \ `12#5r3f5r7c               00003013 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=Ru<#"
                                                                                                  \ \ exit then 0 ;
  lb_M[R+#]_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00000003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lb_M[R+#]"
                                                                                                  \ \ exit then 0 ;
  R=(R+#)b_
  ?dup if + exit then \ `12#5r3f5r7c               00000003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)b"
                                                                                                  \ \ exit then 0 ;
  lh_R,[R+#]_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00001003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lh_R,[R+#]"
                                                                                                  \ \ exit then 0 ;
  R=(R+#)h_
  ?dup if + exit then \ `12#5r3f5r7c               00001003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)h"
                                                                                                  \ \ exit then 0 ;
  lw_R,[R+#]_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00002003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lw_R,[R+#]"
                                                                                                  \ \ exit then 0 ;
  R=(R+#)_
  ?dup if + exit then \ `12#5r3f5r7c               00002003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)"
                                                                                                  \ \ exit then 0 ;
  lbu_R,[R+#]_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00004003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lbu_R,[R+#]"
                                                                                                  \ \ exit then 0 ;
  R=(R+#)bu_
  ?dup if + exit then \ `12#5r3f5r7c               00004003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)bu"
                                                                                                  \ \ exit then 0 ;
  lhu_R,[R+#]_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00005003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   lhu_R,[R+#]"
                                                                                                  \ \ exit then 0 ;
  R=(R+#)hu_
  ?dup if + exit then \ `12#5r3f5r7c               00005003 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=(R+#)hu"
                                                                                                  \ \ exit then 0 ;
  ecall_os_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00000073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ecall_os"
                                                                                                  \ \ exit then 0 ;
  ecall_os_
  ?dup if + exit then \ `12#5r3f5r7c               00000073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ecall_os"
                                                                                                  \ \ exit then 0 ;
  ebreak_debugger_                                  \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00100073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ebreak_debugger"
                                                                                                  \ \ exit then 0 ;
  ebreak_debugger_
  ?dup if + exit then \ `12#5r3f5r7c               00100073 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   ebreak_debugger"
                                                                                                  \ \ exit then 0 ;
  slli_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5s5r3f5r7c              00001013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   slli_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R<<#_
  ?dup if + exit then \ `7f5s5r3f5r7c              00001013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R<<#"
                                                                                                  \ \ exit then 0 ;
  srli_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5s5r3f5r7c              00005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srli_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R>>#_
  ?dup if + exit then \ `7f5s5r3f5r7c              00005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>#"
                                                                                                  \ \ exit then 0 ;
  srai_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7f5s5r3f5r7c              40005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   srai_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R>>#,a_
  ?dup if + exit then \ `7f5s5r3f5r7c              40005013 = if (4  0b  7  12p   13  0f  13p   18  14  14p            ."   R=R>>#,a"
                                                                                                  \ \ exit then 0 ;
  sb_R,R,#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00000023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sb_R,R,#"
                                                                                                  \ \ exit then 0 ;
  (R+#)=R,b_
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00000023 = if (4  13  0f  12p  1f 19  0b  7  23p  18  14  14p       ."   (R+#)=R,b"
                                                                                                  \ \ exit then 0 ;
  sh_R,R,#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00001023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sh_R,R,#"
                                                                                                  \ \ exit then 0 ;
  (R+#)=R,h_
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00001023 = if (4  13  0f  12p  1f 19  0b  7  23p  18  14  14p       ."   (R+#)=R,h"
                                                                                                  \ \ exit then 0 ;
  sw_R,R,#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00002023 = if (4   18  14  12p  13  0f  13p  1f 19  0b  7  24p[][]  ."   sw_R,R,#"
                                                                                                  \ \ exit then 0 ;
  (R+#)=R_
  ?dup if + exit then \ `7#[11:5]5r5r3f5#[4:0]7c   00002023 = if (4  13  0f  12p  1f 19  0b  7  23p  18  14  14p       ."   (R+#)=R"
                                                                                                  \ \ exit then 0 ;
  beq_R,R,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00000063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   beq_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=R?,#_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00000063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R=R?,#"
                                                                                                  \ \ exit then 0 ;
  bne_R,R,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00001063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bne_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R<>R?,#_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00001063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<>R?,#"
                                                                                                  \ \ exit then 0 ;
  blt_R,R,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00004063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   blt_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R<R?,#_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00004063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<R?,#"
                                                                                                  \ \ exit then 0 ;
  bge_R,R,#_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00005063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bge_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R>=R?,#_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00005063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R>=R?,#"
                                                                                                  \ \ exit then 0 ;
  bltu_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00006063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bltu_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R<R?,#u_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00006063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R<R?,#u"
                                                                                                  \ \ exit then 0 ;
  bgeu_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00007063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   bgeu_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R>=R?,#u_
  ?dup if + exit then \ `7#[]5r5r3f5#[]7c          00007063 = if (4  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11]        ."   R>=R?,#u"
                                                                                                  \ \ exit then 0 ;
  lui_R,#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   lui_R,#"
                                                                                                  \ \ exit then 0 ;
  R=#,u_
  ?dup if + exit then \ `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   R=#,u"
                                                                                                  \ \ exit then 0 ;
  auipc_#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   auipc_#"
                                                                                                  \ \ exit then 0 ;
  R=pc+#,u_
  ?dup if + exit then \ `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   R=pc+#,u"
                                                                                                  \ \ exit then 0 ;
  lui_R,#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   lui_R,#"
                                                                                                  \ \ exit then 0 ;
  R=#,u_
  ?dup if + exit then \ `20#5r7c                   00000037 = if (2  0b  7  13p   1f  0c  14p                          ."   R=#,u"
                                                                                                  \ \ exit then 0 ;
  auipc_#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   auipc_#"
                                                                                                  \ \ exit then 0 ;
  pc+#,u_
  ?dup if + exit then \ `20#5r7c                   00000017 = if (2  0b  7  13p   1f  0c  14p                          ."   pc+#,u"
                                                                                                  \ \ exit then 0 ;
  jal_#_                                            \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#12c                    000000EF = if (4   14p[20|10:1|11|19:12]                            ."   jal_#"
                                                                                                  \ \ exit then 0 ;
  call_#_
  ?dup if + exit then \ `20#12c                    000000EF = if (4   14p[20|10:1|11|19:12]                            ."   call_#"
                                                                                                  \ \ exit then 0 ;
  jmp_#_                                            \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#12c                    0000006F = if (4   14p[20|10:1|11|19:12]                            ."   jmp_#"
                                                                                                  \ \ exit then 0 ;
  jal_R,#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `20#5r7c                   0000006F = if (4  0b  7  13p   14p[20|10:1|11|19:12]                ."   jal_R,#"
                                                                                                  \ \ exit then 0 ;
  call_R+#_
  ?dup if + exit then \ `20#5r7c                   0000006F = if (4  0b  7  13p   14p[20|10:1|11|19:12]                ."   call_R+#"
                                                                                                  \ \ exit then 0 ;
  jalr_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `12#5r3f5r7c               00000067 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   jalr_R,R,#"
                                                                                                  \ \ exit then 0 ;
  R=pc+4;pc=R+#_
  ?dup if + exit then \ `12#5r3f5r7c               00000067 = if (4  0b  7  12p   13  0f  13p   1f  14  14p[11:0]      ."   R=pc+4;pc=R+#"
                                                                                                  \ \ exit then 0 ;
  c.mv_R,R_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `4f5r5r2o                  00008002 = if (2  0b  7  13p  6  2  14p                             ."   c.mv_R,R"
                                                                                                  \ \ exit then 0 ;
  c.R=R_
  ?dup if + exit then \ `4f5r5r2o                  00008002 = if (2  0b  7  13p  6  2  14p                             ."   c.R=R"
                                                                                                  \ \ exit then 0 ;
  c.add_R,R_                                        \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `4f5r5r2o                  00009002 = if (2  0b  7  13p  6  2  14p                             ."   c.add_R,R"
                                                                                                  \ \ exit then 0 ;
  c.R+R_
  ?dup if + exit then \ `4f5r5r2o                  00009002 = if (2  0b  7  13p  6  2  14p                             ."   c.R+R"
                                                                                                  \ \ exit then 0 ;
  c.srli_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008001 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.srli_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R<<R,a_
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008001 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.R<<R,a"
                                                                                                  \ \ exit then 0 ;
  c.srai_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008401 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.srai_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R>>R,a_
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008401 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.R>>R,a"
                                                                                                  \ \ exit then 0 ;
  c.andi_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008801 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.andi_R,#"
                                                                                                  \ \ exit then 0 ;
  c.Rn#_
  ?dup if + exit then \ `3f#[5]2c3r'#[4:0]2o       00008801 = if (2  9  7  13p   [5][4:0]_14p                          ."   c.Rn#"
                                                                                                  \ \ exit then 0 ;
  c.jr_R_                                           \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `4f5r5c2o                  00008002 = if (2  0b  7  14p                                        ."   c.jr_R"
                                                                                                  \ \ exit then 0 ;
  c.jmp.R_
  ?dup if + exit then \ `4f5r5c2o                  00008002 = if (2  0b  7  14p                                        ."   c.jmp.R"
                                                                                                  \ \ exit then 0 ;
  c.jalr_R_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `4f5r5c2o                  00009002 = if (2  0b  7  14p                                        ."   c.jalr_R"
                                                                                                  \ \ exit then 0 ;
  c.jmp.R.Link_
  ?dup if + exit then \ `4f5r5c2o                  00009002 = if (2  0b  7  14p                                        ."   c.jmp.R.Link"
                                                                                                  \ \ exit then 0 ;
  _
  ?dup if + exit then \ `16c                       00009002 = if (2                                                    ."   "
                                                                                                  \ \ exit then 0 ;
  c.beqz_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f[]rs1'[7:6|]2o          0000C001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.beqz_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f[]rs1'[7:6|]2o          0000C001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.bnez_#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f[]rs1'[7:6|]2o          0000E001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.bnez_#"
                                                                                                  \ \ exit then 0 ;
  c.R<>#?_
  ?dup if + exit then \ `3f[]rs1'[7:6|]2o          0000E001 = if (2  9  7  13p   [8|4:3][7:6|2:1|5]_14p                ."   c.R<>#?"
                                                                                                  \ \ exit then 0 ;
  c.swsp_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f.imm[5:2|7:6].rs2.2o    0000C002 = if (2   6  2  13p   [5:2|7:6]_14p                        ."   c.swsp_R,#"
                                                                                                  \ \ exit then 0 ;
  c.(sp+#*4)=R_
  ?dup if + exit then \ `3f.imm[5:2|7:6].rs2.2o    0000C002 = if (2   6  2  13p   [5:2|7:6]_14p                        ."   c.(sp+#*4)=R"
                                                                                                  \ \ exit then 0 ;
  c.addi4spn_R,sp+#*4_                              \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   00000000 = if (2  4  2 13p   [5:4|9:6|2|3]_14p                      ."   c.addi4spn_R,sp+#*4"
                                                                                                  \ \ exit then 0 ;
  c.R=sp+#*4_
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   00000000 = if (2  4  2 13p   [5:4|9:6|2|3]_14p                      ."   c.R=sp+#*4"
                                                                                                  \ \ exit then 0 ;
  c.lw_R,#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   00004000 = if (2  0c  2  14p[12:2]                                  ."   c.lw_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#_
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   00004000 = if (2  0c  2  14p[12:2]                                  ."   c.R=#"
                                                                                                  \ \ exit then 0 ;
  c.sw_R,#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   0000C000 = if (2  0c  2  14p[12:2]                                  ."   c.sw_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#_
  ?dup if + exit then \ `3f.nz[5:4|9:6|2|3]rd'2o   0000C000 = if (2  0c  2  14p[12:2]                                  ."   c.R=#"
                                                                                                  \ \ exit then 0 ;
  c.sw_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.sw_R,R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#3r2#3r2o              0000C000 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.and_R,R,#_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.and_R,R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#3r2#3r2o              0000E001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.or_R,R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.or_R,R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#3r2#3r2o              0000C001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.xor_R,R,#_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.xor_R,R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#3r2#3r2o              0000A001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.sub_R,R,#_                                      \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.sub_R,R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#3r2#3r2o              00008001 = if (4  4 2 12p   9 7 13p   0c 0a 6 5 24p                 ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.beqz_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                  ."   c.beqz_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R=#?_
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    0000C001 = if (2  0c  2  14p[12:2]                                  ."   c.R=#?"
                                                                                                  \ \ exit then 0 ;
  c.bnez_#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                  ."   c.bnez_#"
                                                                                                  \ \ exit then 0 ;
  c.R<>#?_
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    0000E001 = if (2  0c  2  14p[12:2]                                  ."   c.R<>#?"
                                                                                                  \ \ exit then 0 ;
  c.srli_#_                                         \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                  ."   c.srli_#"
                                                                                                  \ \ exit then 0 ;
  c.R>>#_
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00000001 = if (2  0c  2  14p[12:2]                                  ."   c.R>>#"
                                                                                                  \ \ exit then 0 ;
  c.srai_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                  ."   c.srai_R,#"
                                                                                                  \ \ exit then 0 ;
  c.R>>#,a_
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00002001 = if (2  0c  2  14p[12:2]                                  ."   c.R>>#,a"
                                                                                                  \ \ exit then 0 ;
  c.andi_R,#_                                       \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                  ."   c.andi_R,#"
                                                                                                  \ \ exit then 0 ;
  c.Rn#_
  ?dup if + exit then \ `3f3#[12:10]3r5#[6:2]2o    00004001 = if (2  0c  2  14p[12:2]                                  ."   c.Rn#"
                                                                                                  \ \ exit then 0 ;
  c.j_#_                                            \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                  ."   c.j_#"
                                                                                                  \ \ exit then 0 ;
  c.jmp_#_
  ?dup if + exit then \ `3f11#[12:2]2o             0000A001 = if (2  0c  2  14p[12:2]                                  ."   c.jmp_#"
                                                                                                  \ \ exit then 0 ;
  c.jal_#_                                          \ original.mnemonic? @  not  if  0  exit  then
  ?dup if + exit then \ `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                  ."   c.jal_#"
                                                                                                  \ \ exit then 0 ;
  c.call_#_
  ?dup if + exit then \ `3f11#[12:2]2o             00002001 = if (2  0c  2  14p[12:2]                                  ."   c.call_#"
                                                                                                  \ \ exit then 0 ;
\  dup  dis.addr  @  =  if  ."   (  ????????????????            )"    2  +  then   ;
   dup  dis.addr  @  =  if   dup (.12345678..55.66..........)   2  +  then   ;



