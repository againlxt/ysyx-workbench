/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-08 11:47:18
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 12:24:12
 * @FilePath: /ysyx-workbench/nemu/include/memory/mrom.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __MROM_H__
#define __MROM_H__

#include <common.h>

#define MROM_LEFT  ((paddr_t)CONFIG_MROMBASE)
#define MROM_RIGHT ((paddr_t)CONFIG_MROMBASE + CONFIG_MROMSIZE - 1)

void init_mrom();
bool in_mrom(word_t addr);
uint8_t* guest_to_host_mrom(word_t maddr);
word_t mrom_read(word_t addr);
void mrom_write(paddr_t addr, int len, word_t data);

#endif