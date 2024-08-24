/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-23 10:23:00
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-24 15:56:32
 * @FilePath: /ysyx-workbench/npc/csrc/memory/iaddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/iaddr.h>
#include <memory/paddr.h>

word_t iaddr_read(iaddr_t iaddr) {
		uint8_t* addr = guest_to_host(iaddr);
	return (*(addr) + (*(addr+1) << 8) + (*(addr+2) << 16) + (*(addr+3) << 24));
}
