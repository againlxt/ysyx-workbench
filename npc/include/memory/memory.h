/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 19:52:30
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-25 02:12:57
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
#define FLASH_LEFT ((paddr_t)CONFIG_FLASHBASE)
#define FLASH_RIGHT ((paddr_t)CONFIG_FLASHBASE + CONFIG_FLASHSIZE - 1)

void init_mrom();
void init_flash();
void init_psram();
uint8_t* guest_to_host_mrom(int32_t maddr);
uint8_t* guest_to_host_flash(int32_t faddr);

#endif