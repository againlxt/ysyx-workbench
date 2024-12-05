/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-05-17 15:10:01
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-05 16:53:27
 * @FilePath: /ysyx-workbench/nemu/src/isa/riscv32/reg.c
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
#include "local-include/reg.h"

#define REGS_SIZE MUXDEF(CONFIG_RVE, 16, 32)
const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

void isa_reg_display() {
  printf("Reg display begin\n");
  printf("%s:\t%#x\n", "pc", cpu.pc);
  for (int i = 0; i < REGS_SIZE; i++) {
    printf("%s:\t%#x\n", regs[i], gpr(i));
  }
  printf("%s:\t%#x\n", "mepc", csr(MEPC));
  printf("%s:\t%#x\n", "mstatus", csr(MSTATUS));
  printf("%s:\t%#x\n", "mcause", csr(MCAUSE));
  printf("Reg display end\n");
}

word_t isa_reg_str2val(const char *s, bool *success) {
  for (int i = 0; i < REGS_SIZE; i++) {
    if (strcmp(s, regs[i]) == 0) {
      *success = true;
      return gpr(i);
    }
  }
  char mepc[3] = "me";
  char mstatus[3] = "ms";
  char mcause[3] = "mc";
  if (strcmp(s, mepc) == 0) {
    *success = true;
    return csr(MEPC);
  }
  else if (strcmp(s, mstatus) == 0) {
    *success = true;
    return csr(MSTATUS);
  }
  else if (strcmp(s, mcause) == 0) {
    *success = true;
    return csr(MCAUSE);
  }
  return 0;
}
