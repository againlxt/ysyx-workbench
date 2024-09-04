/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 13:27:08
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-09-04 15:22:23
 * @FilePath: /ysyx-workbench/npc/csrc/memory/paddr.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <memory/paddr.h>
#include <isa/isa-def.h>
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

extern uint32_t npc_pc;

static void out_of_bound(paddr_t addr) {
	verlatorTfp->close();
  	panic("address = " FMT_PADDR " is out of bound of pmem [" FMT_PADDR ", " FMT_PADDR "] at pc = " FMT_WORD,
      addr, PMEM_LEFT, PMEM_RIGHT, npc_pc);
}

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
	memset(pmem, 0, CONFIG_MSIZE);
	Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
}

extern "C" int unsigned pmem_read(unsigned int addr);
int unsigned pmem_read(unsigned int addr)
{
	// 由于单周期处理器存在冒险问题且该存储器为异步读写存储器，会有一些瞬间的地址会不在正常地址范围内，需要忽略这些冒险的瞬间
	if (likely(in_pmem(addr))) {
		word_t ret = host_read(guest_to_host(addr), 4);
		#ifdef CONFIG_MTRACE
		if(mtrace_begin <= addr && addr <= mtrace_end)	MTRACE_LOG(addr, 4, "read", ret);
		#endif
		return ret;
	}
	if (addr == 0xa0000048) return get_time();
	
	// out_of_bound(addr);
	return 0;
}

extern "C" void pmem_write(unsigned int waddr, unsigned int wdata, unsigned char wmask);
void pmem_write(unsigned int waddr, unsigned int wdata, unsigned char wmask) {
	// 由于单周期处理器存在冒险问题且该存储器为异步读写存储器，会有一些瞬间的地址会不在正常地址范围内，需要忽略这些冒险的瞬间
	if (likely(in_pmem(waddr))) {
		word_t data = 0;
		size_t len = 0;
		switch (wmask) { 
			case 0b00000001: data = wdata & 0xFF; len=1; break;
			case 0b00000011: data = wdata & 0xFFFF; len=2; break;
			case 0b00001111: data = wdata & 0xFFFFFFFF; len=4; break;
			case 0: break;
			
			default: break;
		}
		host_write(guest_to_host(waddr), len, data);
		 #ifdef CONFIG_MTRACE
		if(mtrace_begin <= waddr && waddr <= mtrace_end)	MTRACE_LOG(waddr, 4, "write", data);
		#endif
		return;
	}
	if (waddr == 0xa00003f8) {
		putchar((int)wdata);
	}
	// out_of_bound(waddr);
}
