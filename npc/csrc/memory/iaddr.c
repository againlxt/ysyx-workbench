/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-23 10:23:00
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-23 11:40:17
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/memory/iaddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/iaddr.h>
extern uint8_t* rom_buffer;

word_t iaddr_read(iaddr_t iaddr) {
		uint8_t* addr = rom_buffer + iaddr - CONFIG_MBASE;
	return (*(addr) + (*(addr+1) << 8) + (*(addr+2) << 16) + (*(addr+3) << 24));
}
