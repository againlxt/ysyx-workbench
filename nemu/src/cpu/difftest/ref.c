/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:26
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-05 17:56:04
 * @FilePath: /ysyx-workbench/nemu/src/cpu/difftest/ref.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
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

#include <isa.h>
#include <cpu/cpu.h>
#include <difftest-def.h>
#include <memory/paddr.h>
#define MSTATUS 0x300
#define MCAUSE  0x342
#define MEPC    0x341
#define MTVEC   0x305

__EXPORT void difftest_memcpy(paddr_t addr, void *buf, size_t n, bool direction) {
	assert(buf != NULL);
	uint8_t* dut = (uint8_t*) buf;

	if (direction == DIFFTEST_TO_DUT) {
		for (size_t i = 0; i < n; i++) { *(dut+i) = paddr_read((addr+i), 1); }
	}
	else {
		for (size_t i = 0; i < n; i++) { paddr_write(addr+i, 1, *(dut+i)); }
	}
}

static void regcpy(CPU_state* src, CPU_state* dest) {
	size_t size = MUXDEF(CONFIG_RVE, 16, 32);
	dest->pc = src->pc;
	for (size_t i = 0; i < size; i++) { dest->gpr[i] = src->gpr[i]; }
	dest->csr[MSTATUS] 	= src->csr[MSTATUS];
	dest->csr[MCAUSE]	= src->csr[MCAUSE];
	dest->csr[MEPC]		= src->csr[MEPC];
	dest->csr[MTVEC]	= src->csr[MTVEC];
}
/**
 * @description: 
 * @param {void} *dut 该参数为寄存器指针数组的指针
 * @param {bool} direction
 * @return {*}
 */
__EXPORT void difftest_regcpy(void *dut, bool direction) {
	assert(dut != NULL);
	CPU_state* dut_buf = (CPU_state*) dut;

	if (direction == DIFFTEST_TO_DUT) {
		regcpy(&cpu, dut_buf);
	}
	else {
		regcpy(dut_buf, &cpu);
	}
}

__EXPORT void difftest_exec(uint64_t n) {
	cpu_exec(n);
}

__EXPORT void difftest_raise_intr(word_t NO) {
}

__EXPORT void difftest_init(int port) {
  void init_mem();
  void init_isa();
  init_mem();
  /* Perform ISA dependent initialization. */
  init_isa();
}
