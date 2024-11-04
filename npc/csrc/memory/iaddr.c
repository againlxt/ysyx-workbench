/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-23 10:23:00
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-10-21 19:24:14
 * @FilePath: /ysyx-workbench/npc/csrc/memory/iaddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/paddr.h>


extern "C" int unsigned iaddr_read(int unsigned iaddr);
int unsigned iaddr_read(int unsigned iaddr) {
	uint8_t* addr = guest_to_host(iaddr);
	return (*(addr) + (*(addr+1) << 8) + (*(addr+2) << 16) + (*(addr+3) << 24));
}
