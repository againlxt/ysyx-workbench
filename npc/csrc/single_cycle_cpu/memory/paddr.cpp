/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:27:08
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-17 14:30:55
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/memory/paddr.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <paddr.h>
#include <config/config.h>

#ifdef CONFIG_MTRACE
static word_t mtrace_begin   = PMEM_LEFT;
static word_t mtrace_end	 = PMEM_RIGHT;
#endif

#ifdef CONFIG_MTRACE
#define MTRACE_LOG(mtrace_address, mtrace_length, mtrace_operation, mtrace_value) do { \
    log_write("m %#X\t%u\t%s\t%#X\n", mtrace_address, mtrace_length, mtrace_operation, mtrace_value); \
} while(0);
#endif

extern uint8_t* rom_buffer;

uint8_t* guest_to_host(paddr_t paddr) { return rom_buffer + paddr - CONFIG_MBASE; }

static word_t host_read(uint8_t* addr, int len) {
	switch (len) {
		case 1: return (uint8_t ) (*addr);
		case 2: return (uint16_t) (*(addr) + *(addr+1) << 8);
		case 4: return (uint32_t) (*(addr) + (*(addr+1) << 8) + (*(addr+2) << 16) + (*(addr+3) << 24));;
		default: return 0;
	}
}

word_t paddr_read(paddr_t addr, int len)
{
	word_t ret = host_read(guest_to_host(addr), len);
	return ret;
}
