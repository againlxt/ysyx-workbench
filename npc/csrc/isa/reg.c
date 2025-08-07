/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 16:46:46
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 13:37:05
 * @FilePath: /ysyx-workbench/npc/csrc/isa/reg.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
#include <isa/reg.h>
#include <isa/isa-def.h>
uint32_t* regsData[REGS_SIZE] = {};
extern CPU_state cpu;

const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

void isa_reg_display() {
	printf("Reg display begin\n");
	printf("PC:\t%#x\n", cpu.pc);
	for (int i = 0; i < REGS_SIZE; i++) {
		printf("%s:\t%#x\n", regs[i], cpu.gpr[i]);
	}
	printf("MSTATUS:\t%#x\n", cpu.csr[MSTATUS]);
	printf("MCAUSE:\t%#x\n", cpu.csr[MCAUSE]);
	printf("MEPC:\t%#x\n", cpu.csr[MEPC]);
	printf("MTVEC:\t%#x\n", cpu.csr[MTVEC]);
	printf("Reg display end\n");
}
