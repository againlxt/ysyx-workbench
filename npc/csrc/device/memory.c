/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 20:41:03
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-22 14:47:14
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

void init_mrom() {
    memset(mrom, 0, CONFIG_MROMSIZE);
	// Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", MROM_LEFT, MROM_RIGHT);
}

void init_flash() {
	memset(flash, 0, CONFIG_FLASHSIZE);
	// Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", FLASH_LEFT, FLASH_RIGHT);
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
}

extern "C" void psram_write(uint32_t addr, uint8_t len, uint32_t data) {
	psram_host_write(guest_to_host_psram(addr), len, data);
}
