/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 16:46:46
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 20:35:57
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/isa/reg.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
#include <isa/reg.h>

#define REGS_SIZE 32

const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

void isa_reg_display() {
	printf("Reg display begin\n");
	for (int i = 0; i < REGS_SIZE; i++)
	{
		printf("-----%d-----\n", i);
		printf("%s:\t%#x\n", regs[i], gpr(i));
	}
	printf("Reg display end\n");
}
