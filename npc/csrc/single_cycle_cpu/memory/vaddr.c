/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:26:58
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-20 17:10:57
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/memory/vaddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/paddr.h>

word_t vaddr_read(vaddr_t addr, int len) {
	return paddr_read(addr, len);
}
