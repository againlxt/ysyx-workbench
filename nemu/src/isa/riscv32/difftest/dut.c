/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:26
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-07-25 14:01:47
 * @FilePath: /ysyx-workbench/nemu/src/isa/riscv32/difftest/dut.c
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
#include <cpu/difftest.h>
#include "../local-include/reg.h"

bool isa_difftest_checkregs(CPU_state *ref_r, vaddr_t pc) {
	for (size_t i = 0; i < 32; i++) {
		if (ref_r->gpr[check_reg_idx(i)] != gpr(i)){
			printf("------- Difftest begin -------\n");
			printf("Diff %#X\t\n", pc);
			printf("ref-reg:\t%#X\n", ref_r->gpr[check_reg_idx(i)]);
			printf("reg  %s:\t%#X\n", reg_name(i), gpr(i));
			printf("------------- end ------------\n");
			return false;
		}
	}
	
  	return true;
}

void isa_difftest_attach() {
}
