/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:34:16
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-20 19:37:18
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

word_t vaddr_read(vaddr_t addr, int len);

word_t paddr_read(paddr_t addr, int len);

#endif
