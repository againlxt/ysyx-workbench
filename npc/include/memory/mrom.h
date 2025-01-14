/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 19:52:30
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 12:29:51
 * @FilePath: /ysyx-workbench/npc/include/memory/mrom.h
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
uint8_t* guest_to_host_mrom(int32_t maddr);

#endif