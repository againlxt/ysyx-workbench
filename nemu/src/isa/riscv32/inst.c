/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include "local-include/reg.h"
#include <cpu/cpu.h>
#include <cpu/ifetch.h>
#include <cpu/decode.h>

#define R(i) gpr(i)
#define Mr vaddr_read
#define Mw vaddr_write

enum {
  TYPE_I, TYPE_U, TYPE_S, TYPE_J, TYPE_R, TYPE_B,
  TYPE_N, // none
};

#define src1R() do { *src1 = R(rs1); } while (0)
#define src2R() do { *src2 = R(rs2); } while (0)
#define immI() do { *imm = SEXT(BITS(i, 31, 20), 12); } while(0)
#define immU() do { *imm = SEXT(BITS(i, 31, 12), 20) << 12; } while(0)
#define immS() do { *imm = (SEXT(BITS(i, 31, 25), 7) << 5) | BITS(i, 11, 7); } while(0)
#define immJ() do { *imm = ((SEXT(BITS(i, 31, 31), 1) << 19) | BITS(i, 19, 12) << 11 | BITS(i, 20 , 20) << 10 | BITS(i , 30 , 21)) << 1; } while(0)
#define immB() do { *imm = ((SEXT(BITS(i, 31, 31), 1) << 11) | BITS(i, 7, 7) << 10 | BITS(i, 30 , 25) << 4 | BITS(i , 11 , 8)) << 1; } while(0)

#define Jal() do { R(rd) = s->pc + 4; s->dnpc = s->pc + imm; } while(0)
#define Jalr() do { word_t t = s->pc + 4; s->dnpc = (src1 + imm) &~ 1; R(rd) = t; } while(0)
#define Bne() do { s->dnpc = s->pc + ((src1 != src2) ? imm : 4); } while(0)
#define Beq() do { s->dnpc = s->pc + ((src1 == src2) ? imm : 4); } while(0)
#define Bge() do { s->dnpc = s->pc + (((int32_t)src1 >= (int32_t)src2) ? imm : 4); } while(0)
#define Bgeu() do { s->dnpc = s->pc + ((src1 >= src2) ? imm : 4); } while(0)
#define Blt() do { s->dnpc = s->pc + (((int32_t)src1 < (int32_t)src2) ? imm : 4); } while(0)
#define Bltu() do { s->dnpc = s->pc + ((src1 < src2) ? imm : 4); } while(0)
#define Mul() do { int32_t t1 = src1; int32_t t2 = src2; R(rd) = t1 * t2; } while(0)
#define Mulh() do { int64_t t1 = SEXT(src1, 32); int64_t t2 = SEXT(src2, 32); long long t = t1 * t2; R(rd) = t >> 32; } while(0)
#define Mulhu() do { uint64_t t1 = src1; uint64_t t2 = src2; long long t = t1 * t2; R(rd) = t >> 32; } while(0)
#define Div() do { \
	int32_t t1 = src1; \
	int32_t t2 = src2; \
	if(t2 != 0) R(rd) = t1 / t2; \
	else R(rd) = t1; \
} while(0)
#define Divu() do { \
	if(src2 != 0) R(rd) = src1 / src2; \
	else R(rd) = src1; \
} while(0)
#define Rem() do { \
	int32_t t1 = src1; \
	int32_t t2 = src2; \
	if(t2 != 0) R(rd) = t1 % t2; \
	else R(rd) = t1; \
} while(0)
#define Remu() do { \
	if(src2 != 0) R(rd) = src1 % src2; \
	else R(rd) = src1; \
} while(0)
#define Csrrc() do { \
  uint32_t t = csr(imm); \
  csr(imm) = t & (~src1); \
  R(rd) = t; \
} while (0)
#define Csrrci() do { \
  uint32_t t = csr(imm); \
  csr(imm) = t & (~BITS(s->isa.inst.val, 19, 15)); \
  R(rd) = t; \
} while (0)
#define Csrrs() do { \
  uint32_t t = csr(imm); \
  csr(imm) = t | src1; \
  R(rd) = t; \
} while (0)
#define Csrrsi() do { \
  uint32_t t = csr(imm); \
  csr(imm) = t | BITS(s->isa.inst.val, 19, 15); \
  R(rd) = t; \
} while (0)
#define Csrrw() do { \
  uint32_t t = csr(imm); \
  csr(imm) = src1; \
  R(rd) = t; \
} while (0)
#define Csrrwi() do { \
  uint32_t t = csr(imm); \
  csr(imm) = BITS(s->isa.inst.val, 19, 15); \
  R(rd) = t; \
} while (0)
#ifdef CONFIG_ETRACE
uint32_t Ecounter = 0;
#define Ecall() do { \
  csr(MEPC) = s->pc; \
  csr(MCAUSE) = 11; \
  Ecounter ++; \
	s->dnpc = isa_raise_intr(csr(MCAUSE), csr(MTVEC)); \
  log_write("e %#X:", s->pc); \
  for (uint32_t i = 0; i < Ecounter; i++) log_write("  "); \
  log_write("Ecall %#X\n", csr(MTVEC)); \
} while (0)
#define Mret() do { \
  s->dnpc = csr(MEPC); \
  csr(MSTATUS) = csr(MSTATUS); \
  log_write("e %#X:", s->pc); \
  for (uint32_t i = 0; i < Ecounter; i++) log_write("  "); \
  Ecounter --; \
  log_write("Mret %#X\n", csr(MEPC)); \
} while (0)
#else
#define Ecall() do { \
  csr(MEPC) = s->pc; \
  csr(MCAUSE) = 11; \
	s->dnpc = isa_raise_intr(csr(MCAUSE), csr(MTVEC)); \
} while (0)
#define Mret() do { \
  s->dnpc = csr(MEPC); \
  csr(MSTATUS) = csr(MSTATUS); \
} while (0)
#endif

word_t ftrace_function_call_flag = false;
word_t ftrace_ret_flag = false;

/* Pseudo-Instructions define */
#define Call() do {  \
	Jal(); \
	ftrace_function_call_flag = true; \
} while(0)
#define Callr() do {  \
	Jalr(); \
	ftrace_function_call_flag = true; \
} while(0)
#define Ret() do {  \
    Jalr(); \
    ftrace_ret_flag = true; \
} while(0)
/* Pseudo-Instructions define end */

static void decode_operand(Decode *s, int *rd, word_t *src1, word_t *src2, word_t *imm, int type);
static int decode_exec(Decode *s);
int isa_exec_once(Decode *s);

static void decode_operand(Decode *s, int *rd, word_t *src1, word_t *src2, word_t *imm, int type) {
  uint32_t i = s->isa.inst.val;
  int rs1 = BITS(i, 19, 15);
  int rs2 = BITS(i, 24, 20);
  *rd     = BITS(i, 11, 7);
  switch (type) {
    case TYPE_I: src1R();          immI(); break;
    case TYPE_U:                   immU(); break;
    case TYPE_S: src1R(); src2R(); immS(); break;
    case TYPE_J:                   immJ(); break;
    case TYPE_R: src1R(); src2R();         break;
    case TYPE_B: src1R(); src2R(); immB(); break;
  }
}

static int decode_exec(Decode *s) {
  int rd = 0;
  word_t src1 = 0, src2 = 0, imm = 0;
  s->dnpc = s->snpc;

#define INSTPAT_INST(s) ((s)->isa.inst.val)
#define INSTPAT_MATCH(s, name, type, ... /* execute body */ ) { \
  decode_operand(s, &rd, &src1, &src2, &imm, concat(TYPE_, type)); \
  __VA_ARGS__ ; \
}
  INSTPAT_START();
  /* RV Privileged */
  INSTPAT("??????? ????? ????? 011 ????? 11100 11", csrrc  , I, Csrrc());
  INSTPAT("??????? ????? ????? 111 ????? 11100 11", csrrci , I, Csrrci());
  INSTPAT("??????? ????? ????? 010 ????? 11100 11", csrrs  , I, Csrrs());
  INSTPAT("??????? ????? ????? 110 ????? 11100 11", csrrsi , I, Csrrsi());
  INSTPAT("??????? ????? ????? 001 ????? 11100 11", csrrw  , I, Csrrw());
  INSTPAT("??????? ????? ????? 101 ????? 11100 11", csrrwi , I, Csrrwi());
  INSTPAT("0000000 00000 00000 000 00000 11100 11", ecall  , I, Ecall());
  INSTPAT("0011000 00010 00000 000 00000 11100 11", mret   , R, Mret());

  INSTPAT("??????? ????? ????? ??? ????? 00101 11", auipc  , U, R(rd) = s->pc + imm);
  INSTPAT("??????? ????? ????? 000 ????? 01000 11", sb     , S, Mw(src1 + imm, 1, src2));   // store byte

  /* Pseudo-Instructions */
  INSTPAT("??????? ????? ????? ??? 00001 11011 11", jal    , J, Call());
  INSTPAT("??????? ????? 00001 000 00000 11001 11", ret    , I, Ret());
  INSTPAT("??????? ????? ????? 000 00001 11001 11", jalr   , I, Callr());
  
  /* Integer Register-Register Operations */
  INSTPAT("0000000 ????? ????? 000 ????? 01100 11", add    , R, R(rd) = src1 + src2);
  INSTPAT("0100000 ????? ????? 000 ????? 01100 11", sub    , R, R(rd) = src1 - src2);
  INSTPAT("0000000 ????? ????? 100 ????? 01100 11", xor    , R, R(rd) = src1 ^ src2);
  INSTPAT("0000000 ????? ????? 110 ????? 01100 11", or     , R, R(rd) = src1 | src2);
  INSTPAT("0000000 ????? ????? 111 ????? 01100 11", and    , R, R(rd) = src1 & src2);
  INSTPAT("0000000 ????? ????? 001 ????? 01100 11", sll    , R, R(rd) = src1 << src2);
  INSTPAT("0000000 ????? ????? 101 ????? 01100 11", srl    , R, R(rd) = src1 >> src2);
  INSTPAT("0100000 ????? ????? 101 ????? 01100 11", sra    , R, int32_t t = src1; R(rd) = t >> src2);
  INSTPAT("0000000 ????? ????? 010 ????? 01100 11", slt    , R, R(rd) = ((int32_t)src1 < (int32_t)src2) ? 1 : 0);
  INSTPAT("0000000 ????? ????? 011 ????? 01100 11", sltu   , R, R(rd) = (src1 < src2) ? 1 : 0);

  /* Integer Register-Immediate Instructions */
  INSTPAT("??????? ????? ????? 000 ????? 00100 11", addi   , I, R(rd) = src1 + imm);
  INSTPAT("??????? ????? ????? 010 ????? 00100 11", slti   , I, R(rd) = ((int32_t)src1 < (int32_t)imm) ? 1 : 0);
  INSTPAT("0000000 ????? ????? 011 ????? 00100 11", sltiu  , I, R(rd) = (src1 < imm) ? 1 : 0);
  INSTPAT("??????? ????? ????? 111 ????? 00100 11", andi   , I, R(rd) = src1 & imm);
  INSTPAT("??????? ????? ????? 110 ????? 00100 11", ori	   , I, R(rd) = src1 | SEXT(imm, 32));
  INSTPAT("??????? ????? ????? 100 ????? 00100 11", xori   , I, R(rd) = src1 ^ imm);
  INSTPAT("0000000 ????? ????? 001 ????? 00100 11", slli   , I, R(rd) = src1 << imm);
  INSTPAT("0000000 ????? ????? 101 ????? 00100 11", srli   , I, R(rd) = src1 >> imm);
  INSTPAT("0100000 ????? ????? 101 ????? 00100 11", srai   , I, int32_t t = src1; R(rd) = t >> BITS(imm, 4, 0));

  /* Load and Store Instructions */
  INSTPAT("??????? ????? ????? 010 ????? 01000 11", sw     , S, Mw(src1 + imm, 4, src2));   // store word
  INSTPAT("??????? ????? ????? 010 ????? 00000 11", lw     , I, R(rd) = SEXT(Mr(src1 + imm, 4), 32));
  INSTPAT("??????? ????? ????? 110 ????? 00000 11", lwu    , I, R(rd) = (uint32_t) Mr(src1 + imm, 4));
  INSTPAT("??????? ????? ????? 001 ????? 00000 11", lh     , I, int16_t t = Mr(src1 + imm, 2); R(rd) = SEXT(t, 32));
  INSTPAT("??????? ????? ????? 101 ????? 00000 11", lhu    , I, R(rd) = (uint16_t) Mr(src1 + imm, 2));
  INSTPAT("??????? ????? ????? 000 ????? 00000 11", lb     , I, int8_t t = Mr(src1 + imm, 1); R(rd) = SEXT(t, 32));
  INSTPAT("??????? ????? ????? 100 ????? 00000 11", lbu    , I, R(rd) = (uint8_t) Mr(src1 + imm, 1));
  INSTPAT("??????? ????? ????? 001 ????? 01000 11", sh     , S, Mw(src1 + imm, 2, src2));
  INSTPAT("??????? ????? ????? ??? ????? 01101 11", lui    , U, R(rd) = imm);

  /* Unconditional Jumps */
  INSTPAT("??????? ????? ????? ??? ????? 11011 11", jal    , J, Jal());
  INSTPAT("??????? ????? ????? 000 ????? 11001 11", jalr   , I, Jalr());

  /* Conditional Branches */
  INSTPAT("??????? ????? ????? 001 ????? 11000 11", bne    , B, Bne());
  INSTPAT("??????? ????? ????? 000 ????? 11000 11", beq    , B, Beq());
  INSTPAT("??????? ????? ????? 101 ????? 11000 11", bge    , B, Bge());
  INSTPAT("??????? ????? ????? 111 ????? 11000 11", bgeu   , B, Bgeu());
  INSTPAT("??????? ????? ????? 100 ????? 11000 11", blt    , B, Blt());
  INSTPAT("??????? ????? ????? 110 ????? 11000 11", bltu   , B, Bltu());

  /* RV32M */
  INSTPAT("0000001 ????? ????? 000 ????? 01100 11", mul    , R, Mul());
  INSTPAT("0000001 ????? ????? 001 ????? 01100 11", mulh   , R, Mulh());
  INSTPAT("0000001 ????? ????? 011 ????? 01100 11", mulh   , R, Mulhu());

  INSTPAT("0000001 ????? ????? 100 ????? 01100 11", div    , R, Div());
  INSTPAT("0000001 ????? ????? 101 ????? 01100 11", divu   , R, Divu());
  INSTPAT("0000001 ????? ????? 110 ????? 01100 11", rem    , R, Rem());
  INSTPAT("0000001 ????? ????? 111 ????? 01100 11", remu   , R, Remu()); 

  INSTPAT("0000000 00001 00000 000 00000 11100 11", ebreak , N, NEMUTRAP(s->pc, R(10))); // R(10) is $a0
  INSTPAT("??????? ????? ????? ??? ????? ????? ??", inv    , N, INV(s->pc));
  INSTPAT_END();

  R(0) = 0; // reset $zero to 0

  return 0;
}

int isa_exec_once(Decode *s) {
  s->isa.inst.val = inst_fetch(&s->snpc, 4);
  return decode_exec(s);
}
