/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 17:05:21
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-24 14:37:58
 * @FilePath: /ysyx-workbench/npc/include/isa/reg.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __REG_H__
#define __REG_H__
#include <macro.h>
#include <verilator.h>

#define REGS_SIZE 16

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
