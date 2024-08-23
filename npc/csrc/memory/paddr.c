/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:27:08
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-23 11:50:33
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/memory/paddr.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/paddr.h>
#include <verilator.h>

static uint8_t pmem[CONFIG_MSIZE] PG_ALIGN = {};
#ifdef CONFIG_MTRACE
static word_t mtrace_begin   = PMEM_LEFT;
static word_t mtrace_end	 = PMEM_RIGHT;
#endif

#ifdef CONFIG_MTRACE
#define MTRACE_LOG(mtrace_address, mtrace_length, mtrace_operation, mtrace_value) do { \
    log_write("m %#X\t%u\t%s\t%#X\n", mtrace_address, mtrace_length, mtrace_operation, mtrace_value); \
} while(0);
#endif

uint8_t* guest_to_host(paddr_t paddr) { return pmem + paddr - CONFIG_MBASE; }
paddr_t host_to_guest(uint8_t *haddr) { return haddr - pmem + CONFIG_MBASE; }

static word_t host_read(void* addr, int len) {
	switch (len) {
		case 0: return 0;
		case 1: return *(uint8_t  *)addr;
		case 2: return *(uint16_t *)addr;
		case 4: return *(uint32_t *)addr;
		default: Assert(0, "Read Data Wrong");
	}
}

static void host_write(void *addr, int len, word_t data) {
	switch (len) {
		case 0: return;
		case 1: *(uint8_t  *)addr = data; return;
		case 2: *(uint16_t *)addr = data; return;
		case 4: *(uint32_t *)addr = data; return;
		default: Assert(0, "Write Data Wrong");
	}
}

void init_mem() {
	memset(pmem, rand(), CONFIG_MSIZE);
	Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
}

extern "C" int unsigned pmem_read(unsigned int addr);
int unsigned pmem_read(unsigned int addr)
{
	word_t ret = host_read(guest_to_host(addr), 4);
	return ret;
}

extern "C" void pmem_write(unsigned int waddr, unsigned int wdata, unsigned char wmask);
void pmem_write(unsigned int waddr, unsigned int wdata, unsigned char wmask) {
	word_t data = 0;
	switch (wmask) {
	case 0b00000001: data = wdata & 0xF; break;
	case 0b00000011: data = wdata & 0xFF; break;
	case 0b00001111: data = wdata & 0xFFFF; break;
	case 0: break;
	
	default: break;
	}
	host_write(guest_to_host(waddr), 4, data);
}
