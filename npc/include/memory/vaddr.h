/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-20 19:36:52
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-20 19:37:20
 * @FilePath: /ysyx-workbench/npc/include/memory/vaddr.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */

#ifndef __MEMORY_VADDR_H__
#define __MEMORY_VADDR_H__

#include <common.h>

word_t vaddr_read(vaddr_t addr, int len);
void vaddr_write(vaddr_t addr, int len, word_t data);

#endif
