/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 19:52:30
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-26 20:22:23
 * @FilePath: /ysyx-workbench/npc/include/memory/mrom.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __MROM_H__
#define __MROM_H__

#include <common.h>

#define CONFIG_MROMBASE 0x20000000
#define CONFIG_MROMSIZE 0x00000fff
#define MROM_LEFT  ((paddr_t)CONFIG_MROMBASE)
#define MROM_RIGHT ((paddr_t)CONFIG_MROMBASE + CONFIG_MROMSIZE - 1)

void init_mrom();
int32_t* guest_to_host_mrom(int32_t maddr);
int32_t host_to_guest_mrom(int32_t *haddr);

#endif