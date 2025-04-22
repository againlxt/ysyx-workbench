/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 20:41:03
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-03-18 18:59:53
 * @FilePath: /ysyx-workbench/npc/csrc/device/memory.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>
#include <memory/memory.h>
#include <memory/paddr.h>
#define FLASH_CTRL 0x10
#define FLASH_DIV 0x14
#define FLASH_SS 0x18
static uint8_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};
static uint8_t flash[CONFIG_FLASHSIZE] PG_ALIGN = {};
static uint8_t psram[CONFIG_PSRAMSIZE] PG_ALIGN = {};
static uint16_t sdram[4*8192*512] PG_ALIGN = {};

#ifdef CONFIG_MTRACE
#define MTRACE_LOG(mtrace_address, mtrace_length, mtrace_operation, mtrace_value) do { \
    log_write("m %#X\t%#X\t%s\t%#X\n", mtrace_address, mtrace_length, mtrace_operation, mtrace_value); \
} while(0);
#endif

void init_mrom() {
    memset(mrom, 0, CONFIG_MROMSIZE);
}

void init_flash() {
	memset(flash, 0, CONFIG_FLASHSIZE);
}

void init_psram() {
	memset(psram, 0, CONFIG_PSRAMSIZE);
}

uint8_t* guest_to_host_mrom(int32_t maddr) { return mrom + (maddr - CONFIG_MROMBASE); }
uint8_t* guest_to_host_flash(int32_t faddr) { return flash + faddr; }
uint8_t* guest_to_host_psram(int32_t addr) { return psram + addr; }

static word_t mrom_host_read(void* addr, int len) {
	switch (len) {
		case 0: return 0;
		case 1: return *(uint8_t  *)addr;
		case 2: return *(uint16_t *)addr;
		case 4: return *(uint32_t *)addr;
		default: Assert(0, "Read Data Wrong");
	}
}

static word_t flash_host_read(void* addr, int len) {
	switch (len) {
		case 0: return 0;
		case 1: return *(uint8_t *)addr;
		case 2: return (*(uint8_t *) addr << 8) + *((uint8_t *) addr + 1);
		case 4: return (*(uint8_t *) addr << 24) + (*((uint8_t *) addr + 1) << 16)
		+ (*((uint8_t *) addr + 2) << 8) + *((uint8_t *) addr + 3); 
		default: Assert(0, "Read Data Wrong");
	}
}

static word_t psram_host_read(void* addr, int len) {
	switch (len) {
		case 0: return 0;
		case 1: return *(uint8_t  *)addr;
		case 2: return *(uint16_t *)addr;
		case 4: return *(uint32_t *)addr;
		default: Assert(0, "Read Data Wrong");
	}	
}

static void psram_host_write(void *addr, uint8_t len, word_t data) {
	switch (len) {
		case 0: return;
		case 1: *(uint8_t  *)addr = data; return;
		case 2: *(uint16_t *)addr = data; return;
		case 4: *(uint32_t *)addr = data; return;
	}
}

extern "C" void mrom_read(int32_t addr, int32_t *data) { 
    *data = (int32_t) mrom_host_read(guest_to_host_mrom(addr), 4);
}

extern "C" void flash_read(int32_t addr, int32_t *data) {
	*data = flash_host_read(guest_to_host_flash(addr), 4);
}

extern "C" void psram_read(int32_t addr, int32_t *data) {
	*data = psram_host_read(guest_to_host_psram(addr), 4);
	#ifdef CONFIG_MTRACE
	MTRACE_LOG(addr, 4, "read", *data);	
	#endif
}

extern "C" void psram_write(int32_t addr, int8_t len, int32_t data) {
	psram_host_write(guest_to_host_psram(addr), len, data);
	#ifdef CONFIG_MTRACE
	MTRACE_LOG(addr, len, "write", data);	
	#endif
}

extern "C" void sdram_write(int16_t din, int8_t dqm, int16_t ra, int16_t ca, int8_t ba) {
	int addr = ba * 8192 * 512 + ra * 512 + ca;
	//printf("w:din: %hx dqm: %d ra: %hd ca: %hd ba: %d\n", din, dqm, ra, ca, ba);
	switch (dqm) {
		case 0b10: sdram[addr] = (uint16_t) ((din & 0x00ff) + (sdram[addr] & 0xff00)); break;
		case 0b01: sdram[addr] = (uint16_t) ((din & 0xff00) + (sdram[addr] & 0x00ff)); break;
		case 0b00: sdram[addr] = (uint16_t) din; break;
		case 0b11: break;
		default: break;
	}
	//printf("w:sdram: %hx\n", sdram[addr]);
}

extern "C" void sdram_read(int16_t *dout, int8_t dqm, int16_t ra, int16_t ca, int8_t ba) {
	*dout = sdram[ba*8192*512+ra*512+ca];
	//printf("r:data: %hx dqm: %d ra: %hd ca: %hd ba: %d\n", *dout, dqm, ra, ca, ba);
}
