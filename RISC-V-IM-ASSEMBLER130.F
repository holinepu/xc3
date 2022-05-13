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
comment:
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
comment;
comment:
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
comment;

\ variable  upper.bit
\ variable  lower.bit
\ variable  target.n
\ ************************************************************************************************************
comment:
code   `7f5r5r3f5r7c'   ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `7f5r5r3f5r7c''  ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # ' cp0'.ram      \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # ' cp0'.flash    \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `7f5r5r3f5r7c'''  ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------
code   `????   ( a' MASK -- a' op.code )  pop  edx
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , edx               \  TnMASK
       and     ebx , eax               \
next   c;
\ ---------------------------------------------------------------------------

' cp0'.flash  99CA8  =     ' cp0'.ram  1A9CD4  =  and
#if
code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , # 0xfe00707f      \  TnFE00707F
       and     ebx , eax               \
next   c;

code   `7f5r5r3f5r7c''''  ( a' -- a' op.code )   push  ebx      mov  ebx , # 0xfe00707f      jmp ' `????   ( a' MASK -- a' op.code )
\ -------------------------------------------------------------------------
code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     ebx , eax
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # ' cp0'.ram      \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # ' cp0'.flash    \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , #  0xfe00707f     \  TnFE00707F
       and     ebx , eax               \
next   c;
\ --------------------------------------------------------------------------
code   `7f5r5r3f5r7c   ( a' -- a' op.code )
       push    ebx                     \  {dup}
       mov     eax , # 0x80000000      \  RAM.START
       cmp     eax , ebx
       jle     short @@1
       sub     ebx , # 0x80000000      \  RAM.START    eax
       add     ebx , # 0x1A9CD4        \  ' cp0'.ram        \  1A9CD4
       jmp     short @@2
@@1:   sub     ebx , # 0x20400000      \  FLASH.ROM.START
       add     ebx , # 0x99CA8         \  ' cp0'.flash      \  99CA8
@@2:   mov     ebx , [ebx] [edi]       \  {@}
       mov     eax , # 0xfe00707f      \  TnFE00707F
       and     ebx , eax               \
next   c;
\ --------------------------------------------------------------------------
comment;





\ ADD     Add
\ ADD Rd, Rs1, Rs2   ======   Rd=Rs1+Rs2

: `7f5r5r3f5r7c  ( a -- a op.code )   dup   32@'  fe00707f  and  ;
:  7f5r5r3f5r7c: ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `7f5r5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   18  14  14p"  .3"  mnem"  xt0
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
comment:
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
comment;
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

comment:
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

  (  20405CC8  37 01 00 80       )                              2     80000    R=#,u
  (  20405CCC  13 01 81 46       )                    2         2       468    R=R+#
  (  20405CD0  37 02 00 80       )                              4     80000    R=#,u
  (  20405CD4  13 02 82 26       )                    4         4       268    R=R+#
  (  20405CD8  EF C0 4F 93       )                  initflash                   \   7D  20401E0C
  (  20405CDC  37 43 00 80       )                              6     80004    R=#,u
  (  20405CE0  13 03 03 FF       )                    6         6        10    R=R-#
comment;

\ :  n.bit.sign.extend  ( # n -- # )  dup>r  2^n  over  and  if  -1  r@  lshift  or  then  r>drop  ;

\  12bit.sign.extend  ( # -- # )  dup  0b  2^n  and  if  fffff000  or  then  ;

:  20#[31:12]  ( a' -- n )  to (a')  1f  0c  0c   >real.number  ;
:  12#[31:20]  ( a' -- n )  to (a')  1f  14   0   >real.number  0b  n.bit.sign.extend  ;

:  @Rd         ( a' -- n )  to (a')  0b   7   0   >real.number  ;
:  @Rs1        ( a' -- n )  to (a')  13  0f   0   >real.number  ;
:  @Rs2        ( a' -- n )  to (a')  18  14   0   >real.number  ;

:  r=#.L_  ( a' -- a' 8 / a' 0 )  dup>r'  32@'     r@' 4+  32@'   2>r
   2r@    0000007f (   mask of R=#,u )   8000707f (   mask of R=R-# )  2and
          00000037 ( opcode of R=#,u )   80000013 ( opcode of R=R-# )  d=
   r@'     @Rd    r@' 4+  @Rs1   =  and
   r@' 4+  @Rd    r@' 4+  @Rs1   =  and
   if      r@'    20#[31:12]    r@' 4+  12#[31:20]  +
           r@'  (.12345678..11.22.33.44.55.66.77.88.)  34 ?y  ." R"  r@' @Rd  .  bs  ." ="  u.  r>'  8   2r>drop  exit
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

\ :  dm     dis.macro.instruction?  on/off  ;
:  dl     dis.long.number?        on/off  ;

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
comment:
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
                                   code  */
  (  204007F8  13 01 C1 FF       )                     R2-4
  (  204007FC  23 20 11 00       )                  (R2+0)=R1                                                   \
  (  20400800  13 01 C1 FF       )                  {push.r}
  (  20400808  83 21 02 00       )                  {drop}
  (  20400810  EF 10 50 19       )                  m*                          \   96  204021A4
  (  20400814  13 02 C2 FF       )                  {dup}
  (  2040081C  83 21 01 00       )                  {pop.r}
  (  20400824  EF 00 80 14       )                  m/mod                       \   1D  2040096C
  (  20400828  13 02 42 00       )                     R4+4
  (  2040082C  83 20 01 00       )                  R1=(R2+0)                                                   \
  (  20400830  13 01 41 00       )                     R2+4
  (  20400834  67 80 00 00       )                  ret
  \ *******************************************************************************
             .
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
comment;
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
:  12#5r3f5r7c: ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `12#5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   1f  14  14p[11:0]"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  12#.check  to (#)    5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    1f  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;




:  12#5r3f5r7c:'  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `12#5r3f5r7c"  #=if4 ."  0b  7  12p  1f  14  13p[11:0]  13  0f  14p "  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  12#.check  to (#)    5r.check  to (Rs1)   5r.check  to (Rd)
     (Rd)   0b   7       >?~?
     (Rs1)  13  0f       >?~?      +
     (#)    1f  14       >?~?      +
     (a)    @   ( op.code)         +
     32,'   here'  2  -  last.instruction.addr !   all.ok?.off  ;
\ ------------------------------------------------------------------------------------------------------------
: `1#11#5r3f5r7c  ( a -- a op.code )   dup   32@'  8000707f  and  ;
:  1#11#5r3f5r7c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `1#11#5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   1f  14 14p-[11:0]"  .3"  mnem"  xt0
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

\ :  subi_R,R,#  ( R R # -- ) negate           addi_R,R,#  ;
\ :  R=R-#       ( R R # -- ) negate                R=R+#  ;
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
\   original.mnemonic?  on         00000073  12#5r3f5r7c:  ecall_os
   original.mnemonic?  off        00000073  12#5r3f5r7c:  ecall_os

\   original.mnemonic?  on         00100073  12#5r3f5r7c:  ebreak_debugger
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
:  7f5s5r3f5r7c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `7f5s5r3f5r7c"  #=if4 ."  0b  7  12p   13  0f  13p   18  14  14p"  .3"  mnem"  xt0
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

: `7#[11:5]5r5r3f5#[4:0]7c        ( a -- a op.code )   dup   32@'  00707f  and  ;

:  7#[11:5]5r5r3f5#[4:0]7c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `7#[11:5]5r5r3f5#[4:0]7c"  #=if4 ."   18  14  12p  13  0f  13p  1f 19  0b  7  24p[1f:19|0b:7]"  .3"  mnem"  xt0
   does>    ( Rs1 Rs2 # a )  to (a)    12#.check  to (#)   5r.check  to (Rs2)   5r.check  to (Rs1)

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

:  7#[11:5]5r5r3f5#[4:0]7c:'  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `7#[11:5]5r5r3f5#[4:0]7c"  #=if4 ."  13  0f  12p  1f 19  0b  7  23p  18  14  14p"  .3"  mnem"  xt0
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

comment:
:  >real.number  ( upper.bit lower.bit target.n -- )  \  1e 19  5  >real.number
   target.n  !     lower.bit  !     upper.bit  !
   (a')  32@'  1f ( 31 ) upper.bit @  -  dup>r  lshift
   r>  lower.bit @  +   rshift  target.n  @  lshift  ;
comment;


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
   7    7  0b  >real.number   +  \  2*
   (a') 32@'  1f  2^n  and  if   fffff000  or   then  dup  to (#)  4 to <<byte>>  4p  ;

:  [12|10:5|4:1|11].check  ( # -- #' )
   here'  -  dup  -1000  0ffe  between  not  abort" *** # should be between -1000 and ffe ***"  \  0c  sign-extend
   ;                       \ 1 0000 0000 0000  -->      1000  --> -1000
                           \ 0 1111 1111 1110  -->      0ffe  -->  0ffe
   \  xxxx xxxx xxxx xxxx xxx1 0000 0000 0000  -->  ffff1000      -1000
   \  xxxx xxxx xxxx xxxx xxx0 1111 1111 1110  -->  0000fffe       0fff

:  44p  44p[12|10:5|4:1|11]   u.  ;   \ ????

comment:
:  ?~?>#     ( # high.bit low.bit -- #' )   >r  1f  swap  -  dup>r  lshift  2r>  +  rshift  ;
:  #>?~?     ( # high.bit low.bit -- )      >r  1f  swap  -  dup>r  lshift  r>  rshift  r> lshift  ;

:  ?~?>?~?   ( # 4 1  11 8 -- )  2>r  ?~?>#   2r>  #>?~?   ;
comment;   
\ 12  11  10  09  08  07  06  05  04  03  02  01  00
\  1   1   1   1   1   1   1   1   1   1   1   1   0
:  #[12|10:5|4:1|11]>[31|30:25|11:8|7]   ( # -- #' )  >r
   r@  0c 0c   1f 1f ?~?>?~?
   r@  0a  5   1e 19 ?~?>?~?  +
   r@   4  1   0b  8 ?~?>?~?  +
   r>  0b 0b    7  7 ?~?>?~?  +   ;

: `7#[12|10:5]5r5r3f5#[4:1|11]7c  ( a -- a op.code )   dup   32@'  0000707f  and  ;
:  7#[12|10:5]5r5r3f5#[4:1|11]7c:   ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `7#[12|10:5]5r5r3f5#[4:1|11]7c"  #=if4 ."  13 0f 12p  18 14 13p   44p[12|10:5|4:1|11] "  .2"  mnem"  xt0
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

comment:
imm[12|10:5] rs2 rs1 000 imm[4:1|11] 1100011 BEQ
imm[12|10:5] rs2 rs1 001 imm[4:1|11] 1100011 BNE
imm[12|10:5] rs2 rs1 100 imm[4:1|11] 1100011 BLT
imm[12|10:5] rs2 rs1 101 imm[4:1|11] 1100011 BGE
imm[12|10:5] rs2 rs1 110 imm[4:1|11] 1100011 BLTU
imm[12|10:5] rs2 rs1 111 imm[4:1|11] 1100011 BGEU
comment;
\ ************************************************************************************************************
\ ************************************************************************************************************
\ ************************************************************************************************************
\ 31 30 29 28*27 26 25 24*23 22 21 20*19 18 17 16*15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------------------------------------------------------- -------------- --------------------
\         imm[31:12]                                                 rd             opcode            U-type
\         20#                                                        5r             7c
\ ************************************************************************************************************* 
\ (  20405CC8  37 01 00 80       )                              2     80000    R=#,u
\ (  20405CCC  13 01 81 46       )                    2         2       468    R=R+#
\ *************************************************************************************************************
:  20#[31:12].check  ( # -- # )  20#.check  ;

: `20#5r7c  ( a -- a op.code )   dup   32@'  0000007f  and  ;
:  20#5r7c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `20#5r7c"  #=if2 ."  0b  7  13p   1f  0c  14p"  .2"  mnem"  xt0
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
\ :  20#[20|10:1|11|19:12].check  ( # -- # )   here'  -   fffff  and  20#.check  ;


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
 
\ :  a'>[20|10:1|11|19:12]   ( a' -- )   \  call_#  ====  call_a'
\    here' -  14 ( 20 )  14 ( 20 )  ?~?>
\
 
comment:
variable   #>name?     #>name?   on

:  #>name  ( a' -- )   #>name?  @  not  if  drop   exit    then
   CFA'>N(RISC-V)  if  N>NFA'(RISC-V)*  if  count' 1f and  type'  then  then  ;
comment;

defer  _#>name


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

:  [20|10:1|11|19:12]   ( a' -- a'1 )  to (a')     \  call_#    20405D48  [20|10:1|11|19:12]  20402848
   1e  15   1  >real.number
   14  14  0b  >real.number   +
   13  0c  0c  >real.number   +
   (a')  32@'  1f  2^n  and  if   fff00000  or  then  dup to (#)  (a')  +   ;  \   4 to <<byte>>  4p  ;

:  ."_text.0a.0"  ( a' -- a'1 / a' )
   dup    [20|10:1|11|19:12]   20402AD0  ( run time instruction of ." )   =   \ 20402AD0  ( run time instruction of ." )   =
   if     cr   ."   ( "  dup  .xxxxxxxx  2 spaces  dup 32@' .xxxxxxxx  space  dup  4  +  count'  1+ >r 1- r>  bounds
          do   space  i  c@' .xx   loop  ."  )"
          cr   32 ?y  ."   ."  '"'  emit  space  dup  4  +  count'  dup>r  type'  r>  +  5 ( 4 ) +  align*4
          '"'  emit    exit
   then   ; 

:  dis.."_   ( a' -- a' n / a' 0 )   dup  dup>r   ."_text.0a.0"  r>   -   ;
\ ************************************************************************************************************
: `20#12c  ( a -- a op.code )   dup   32@'   fff  and  ;
:  20#12c:    ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create  dup  ,    :.mnem_ ." `20#12c"  #=if4 ."   14p[20|10:1|11|19:12]"  .1"  mnem"  xt0
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

comment:
imm[31:12] rd 0110111 LUI
imm[31:12] rd 0010111 AUIPC
imm[20|10:1|11|19:12] rd 1101111 JAL
imm[11:0] rs1 000 rd 1100111 JALR
comment;

\s
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ RV32C  compressed Extension
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ ----------- -------------- -------------- -----
\  funct4        rd/rs1            rs2      opcode            CR-type
\    4f            5r              5r        2c
\  f  f  f  f  r  r  r  r  r  r  r  r  r  r  c  c             4f5r5r2c
\  1  1  1  1* 0  0  0  0* 0  0  0  0* 0  0  1  1             f003     mask
\
\  1  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0           8002     c.jr_R,R
\  1  0  0  1* 0  0  0  0* 0  0  0  0* 0  0  1  0           9002     c.jalr_R,R
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0           8002     c.mv_R,R
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0           8002     c.srai_R,R
\  1  0  0  1  0  0  0  0  0  0  0  0  0  0  1  0           9002     c.ebreak_R,R
\ -------------------------------------------------------------------------------------------------------------
: `4f5r5r2c  ( a -- a op.code )   dup   16@'  f003  and  ;
:  4f5r5r2c:   ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `4f5r5r2c"  #=if2 ."  0b  7  13p  6  2  14p"  .2"  mnem"  xt0
   does>    ( Rd Rs2 a )  to (a)  5r.check  to (Rs2)   5r.check  to (Rd)
     (Rd)   6    2   >?~?
     (#)    0b   7   >?~?    +
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         8002  4f5r5r2c:  c.jr_R,R
   original.mnemonic?  off        8002  4f5r5r2c:  jmp.R

   original.mnemonic?  on         9002  4f5r5r2c:  c.jalr_R
   original.mnemonic?  off        9002  4f5r5r2c:  jmp.R.Link

   original.mnemonic?  on         8002  4f5r5r2c:  c.mv_R,R
   original.mnemonic?  off        8002  4f5r5r2c:  R=R

   original.mnemonic?  on         8002  4f5r5r2c:  c.srai_R,R
   original.mnemonic?  off        8002  4f5r5r2c:  R>>R,a

   original.mnemonic?  on         9002  4f5r5r2c:  c.andi_R,R
   original.mnemonic?  off        9002  4f5r5r2c:  RnR
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
:  11#[12:2].check  ;

\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -- -------------- -------------- -----
\  funct3   i    rd/rs1        imm[6:2]      opcode            CI-type
\    3f     1#     5r              5#        2c
\  f  f  f  #  r  r  r  r  r  #  #  #  #  #  c  c             3f1#5r5#2c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             c001     c.beqz_R,#
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.bnez_R,#
\  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             0001     c.srli_R,#
\  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             2001     c.srai_R,#
\  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             4001     c.andi_R,#
\ -------------------------------------------------------------------------------------------------------------
:  24p[12:10,6:2]   24p  ;

: `3f1#5r5#2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f1#5r5#2c:   ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f1#5r5#2c"  #=if2 ."  9  7 13p  0c 0a  6  2  24p[12:10,6:2]"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   5r.check  to (Rd)  11#[12:2].check  to (#)
     (Rd)   9    7               >?~?
     (#)    0c  0a   6   2   >?~?+?~?  +
     (a)    @    ( op.code)            +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c001  3f1#5r5#2c:  c.beqz_R,#
   original.mnemonic?  off        c001  3f1#5r5#2c:  R=#?

   original.mnemonic?  on         e001  3f1#5r5#2c:  c.bnez_#
   original.mnemonic?  off        e001  3f1#5r5#2c:  R<>#?

   original.mnemonic?  on         0001  3f1#5r5#2c:  c.srli_#
   original.mnemonic?  off        0001  3f1#5r5#2c:  R>>#

   original.mnemonic?  on         2001  3f1#5r5#2c:  c.srai_R,#
   original.mnemonic?  off        2001  3f1#5r5#2c:  R>>#,a

   original.mnemonic?  on         4001  3f1#5r5#2c:  c.andi_R,#
   original.mnemonic?  off        4001  3f1#5r5#2c:  Rn#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- ----------------- -------------- -----
\  funct3        imm[12:7]         rs2      opcode            CSS-type
\    3f            6#              5r        2c
\
\  f  f  f  #  #  #  #  #  #  r  r  r  r  r  c  c             3f6#5r2c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  1  0             c002     c.cwsp_R,#
\ -------------------------------------------------------------------------------------------------------------
: `3f6#5r2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f6#5r2c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f6#5r2c"  #=if2 ."   0c  7  13p   6  2  14p "  .2"  mnem"  xt0
   does>    ( # r a )  to (a)  5r.check  to (Rs2)    6#.check  to (#)
     (#)    0c  7    >?~?
     (Rs2)  6   2    >?~?     +
     (a)    @    ( op.code)   +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c002  3f6#5r2c:  c.cwsp_R,#
   original.mnemonic?  off        c002  3f6#5r2c:  (sp+#*4)=R
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- ----------------------- -------- -----
\  funct4        imm[12:5}            rd'  opcode             CIW-type
\    3f            8#                 3r    2c
\  f  f  f  #  #  #  #  #  #  #  #  r  r  r  c  c             3f8#3r2c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  0  0  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             0000     c.addi4spn_R,sp+#*4   addi rd', sp, 4*imm
\ -------------------------------------------------------------------------------------------------------------
: `3f8#3r2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f8#3r2c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f8#3r2c"  #=if2 ."  4  2 13p   0c 5 14p"  .2"  mnem"  xt0
   does>    ( r # a )  to (a)   3r.check  to (Rd)  8#.check  to (#)
     (Rd)   4   2    >?~?
     (#)    0c   5   >?~?    +
     (a)    @    ( op.code)  +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         0000  3f8#3r2c:  c.addi4spn_R,sp+#*4
   original.mnemonic?  off        0000  3f8#3r2c:  R=sp+#*4
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
:  14p[12:2]   14p  ;

\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----             Load Word
\  funct3 imm[12:10]  rs1'    imm    rd'    opcode            CL-type
\    3f      3#       3r      2#     3r      2c               3f3#3r2#3r2c
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  0  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             4000     c.lw_R,#
\ -------------------------------------------------------------------------------------------------------------
: `3f3#3r2#3r2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#3r2#3r2c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f3#3r2#3r2c"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   0a   6   2       >?~?+?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         4000  3f3#3r2#3r2c:  c.lw_R,#
   original.mnemonic?  off        4000  3f3#3r2#3r2c:  R=#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  funct3 imm[12:10] rs1/rd1' imm    rd'    opcode            CS-type        Store Word
\    3f      3#       3r      2#     3r      2c               3f3#3r2#3r2c
\  f  f  f  #  #  #  r  r  r  #  #  r  r  r  c  c             3f3#3r2#3r2c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\
\  1  1  0  0* 0  0  0  0* 0  0  0  0* 0  0  0  0             c000     c.sw_R,R,#      sw  rs1・, (4*imm)(rs2・)
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             e001     c.and_R,R,#     and rd・, rd・, rs2・
\  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1             c001     c.or_R,R,#      or  rd・, rd・, rs2・
\  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  1             a001     c.xor_R,R,#     xor rd・, rd・, rs2・
\  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1             8001     c.sub_R,R,#     sub rd・, rd・, rs2・
\ -------------------------------------------------------------------------------------------------------------
: `3f3#3r2#3r2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#3r2#3r2c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f3#3r2#3r2c"  #=if4 ."  4 2 12p   9 7 13p   0c 0a 6 5 24p"  .3"  mnem"  xt0
   does>    ( Rd Rs1 # a )  to (a)  5#.check  to (#)   3r.check   to (Rs1)   3r.check  to (Rd)
     (Rd)   4   2   >?~?
     (Rs1)  9   7   >?~?                 +
     (#)    0c   0a   6   5   >?~?+?~?   +
     (a)    @    ( op.code)              +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c000  3f3#3r2#3r2c:  c.sw_R,R,#
   original.mnemonic?  off        c000  3f3#3r2#3r2c:  R=#?

   original.mnemonic?  on         e001  3f3#3r2#3r2c:  c.and_R,R,#
   original.mnemonic?  off        e001  3f3#3r2#3r2c:  R=#?

   original.mnemonic?  on         c001  3f3#3r2#3r2c:  c.or_R,R,#
   original.mnemonic?  off        c001  3f3#3r2#3r2c:  R=#?

   original.mnemonic?  on         a001  3f3#3r2#3r2c:  c.xor_R,R,#
   original.mnemonic?  off        a001  3f3#3r2#3r2c:  R=#?

   original.mnemonic?  on         8001  3f3#3r2#3r2c:  c.sub_R,R,#
   original.mnemonic?  off        8001  3f3#3r2#3r2c:  R=#?
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------- -------- ----- -------- -----
\  funct3 imm[12:10]  rs1'     imm[6:2]     opcode            CB-type
\    3f      3#       3r          5#         2c               3f3#[12:10]3r5#[6:2]2c
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
: `3f3#[12:10]3r5#[6:2]2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f3#[12:10]3r5#[6:2]2c:  ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f3#[12:10]3r5#[6:2]2c"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   0a   6   2       >?~?+?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         c001  3f3#[12:10]3r5#[6:2]2c:  c.beqz_R,#
   original.mnemonic?  off        c001  3f3#[12:10]3r5#[6:2]2c:  R=#?

   original.mnemonic?  on         e001  3f3#[12:10]3r5#[6:2]2c:  c.bnez_#
   original.mnemonic?  off        e001  3f3#[12:10]3r5#[6:2]2c:  R<>#?

   original.mnemonic?  on         0001  3f3#[12:10]3r5#[6:2]2c:  c.srli_#
   original.mnemonic?  off        0001  3f3#[12:10]3r5#[6:2]2c:  R>>#

   original.mnemonic?  on         2001  3f3#[12:10]3r5#[6:2]2c:  c.srai_R,#
   original.mnemonic?  off        2001  3f3#[12:10]3r5#[6:2]2c:  R>>#,a

   original.mnemonic?  on         4001  3f3#[12:10]3r5#[6:2]2c:  c.andi_R,#
   original.mnemonic?  off        4001  3f3#[12:10]3r5#[6:2]2c:  Rn#
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ 15 14 13 12*11 10 09 08*07 06 05 04*03 02 01 00
\ -------- -------------------------------- -----
\  funct3       offset[12:2]                opcode            CJ-type
\    3f            11#[12:2]                  2c              3f11#[12:2]2c
\  f  f  f  #  #  #  #  #  #  #  #  #  #  #  c  c
\  1  1  1  0* 0  0  0  0* 0  0  0  0* 0  0  1  1             e003     mask
\  1  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             a001     c.j_#
\  0  0  1  0* 0  0  0  0* 0  0  0  0* 0  0  0  1             2001     c.jal_#
\ -------------------------------------------------------------------------------------------------------------
: `3f11#[12:2]2c  ( a -- a op.code )   dup   16@'  e003  and  ;
:  3f11#[12:2]2c:   ( opcode -- )     >in @   bl word count  >temp.mnemonic   >in  !
   create   dup  ,    :.mnem_ ." `3f11#[12:2]2c"  #=if2 ."  0c  2  14p[12:2]"  .1"  mnem"  xt0
   does>    ( # a )  to (a)    11#[12:2].check  to (#)
     (#)    0c   2       >?~?
     (a)    @    ( op.code)       +
     16,'   ;
\ -------------------------------------------------------------------------------------------------------------
   original.mnemonic?  on         a001  3f11#[12:2]2c:  c.j_#
   original.mnemonic?  off        a001  3f11#[12:2]2c:  jmp_#

   original.mnemonic?  on         2001  3f11#[12:2]2c:  c.jal_#
   original.mnemonic?  off        2001  3f11#[12:2]2c:  R=R+R
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************
\ *************************************************************************************************************

\s













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
\ comment;




















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
