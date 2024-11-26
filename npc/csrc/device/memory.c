/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 20:41:03
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-26 21:25:56
 * @FilePath: /ysyx-workbench/npc/csrc/device/memory.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>
#include <memory/mrom.h>
static int32_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};

void init_mrom() {
    memset(mrom, 0, CONFIG_MROMSIZE);
	Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", MROM_LEFT, MROM_RIGHT);
}

int32_t* guest_to_host_mrom(int32_t maddr) { return mrom + (maddr - CONFIG_MROMBASE)/4; }

int32_t host_to_guest_mrom(int32_t *haddr) { return (haddr - mrom)*4 + CONFIG_MBASE; }

extern "C" void mrom_read(int32_t addr, int32_t *data) { 
    data = guest_to_host_mrom(addr);
}