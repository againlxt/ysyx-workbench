/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:34:16
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-25 14:57:22
 * @FilePath: /ysyx-workbench/npc/include/memory/paddr.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __MEMORY_PADDR_h__
#define __MEMORY_PADDR_H__

#include <common.h>

#define PMEM_LEFT  ((paddr_t)CONFIG_MBASE)
#define PMEM_RIGHT ((paddr_t)CONFIG_MBASE + CONFIG_MSIZE - 1)
#define RESET_VECTOR (PMEM_LEFT + CONFIG_PC_RESET_OFFSET)

static inline bool in_pmem(paddr_t addr) {
  return addr - CONFIG_MBASE < CONFIG_MSIZE;
}

void init_mem();
uint8_t* guest_to_host(paddr_t paddr);
paddr_t host_to_guest(uint8_t *haddr);

#endif
