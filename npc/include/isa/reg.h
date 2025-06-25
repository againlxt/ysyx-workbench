/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 17:05:21
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 10:37:30
 * @FilePath: /ysyx-workbench/npc/include/isa/reg.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __REG_H__
#define __REG_H__
#include <macro.h>
#include <verilator.h>

#define MSTATUS 0x300
#define MCAUSE  0x342
#define MEPC    0x341
#define MTVEC   0x305

#define REGS_SIZE 16

#ifdef CONFIG_SOC
#define gpr(i) \
    ((i) == 0  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_0  : \
    (i) == 1  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_1  : \
    (i) == 2  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_2  : \
    (i) == 3  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_3  : \
    (i) == 4  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_4  : \
    (i) == 5  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_5  : \
    (i) == 6  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_6  : \
    (i) == 7  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_7  : \
    (i) == 8  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_8  : \
    (i) == 9  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_9  : \
    (i) == 10 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_10 : \
    (i) == 11 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_11 : \
    (i) == 12 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_12 : \
    (i) == 13 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_13 : \
    (i) == 14 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_14 : \
    (i) == 15 ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__riscv32BaseReg__DOT__riscv32BaseReg_15 : 0)

#define csr(i) \
    ((i) == MEPC    ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__csrReg__DOT__mepcReg    : \
    (i) == MSTATUS  ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__csrReg__DOT__mstatusReg : \
    (i) == MCAUSE   ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__csrReg__DOT__mcauseReg  : \
    (i) == MTVEC    ? verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__csrReg__DOT__mtvecReg   : 0)
#else
#define gpr(i) \
    ((i) == 0  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_0  : \
    (i) == 1  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_1  : \
    (i) == 2  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_2  : \
    (i) == 3  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_3  : \
    (i) == 4  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_4  : \
    (i) == 5  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_5  : \
    (i) == 6  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_6  : \
    (i) == 7  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_7  : \
    (i) == 8  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_8  : \
    (i) == 9  ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_9  : \
    (i) == 10 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_10 : \
    (i) == 11 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_11 : \
    (i) == 12 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_12 : \
    (i) == 13 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_13 : \
    (i) == 14 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_14 : \
    (i) == 15 ? verilatorTop->rootp->top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_15 : 0)

#define csr(i) \
    ((i) == MSTATUS ? verilatorTop->rootp->top__DOT__csrReg__DOT__mstatusReg  : \
    (i) == MCAUSE   ? verilatorTop->rootp->top__DOT__csrReg__DOT__mcauseReg  : \
    (i) == MEPC     ? verilatorTop->rootp->top__DOT__csrReg__DOT__mepcReg  : \
    (i) == MTVEC    ? verilatorTop->rootp->top__DOT__csrReg__DOT__mtvecReg  : 0)
#endif

void isa_reg_display();

static inline int check_reg_idx(int idx) {
	assert(idx >= 0 && idx < MUXDEF(CONFIG_RVE, 16, 32));
	return idx;
}

static inline const char* reg_name(int idx) {
	extern const char* regs[];
	return regs[check_reg_idx(idx)];
}

#endif
