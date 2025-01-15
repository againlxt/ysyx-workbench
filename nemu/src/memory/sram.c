/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-08 11:52:15
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 12:06:53
 * @FilePath: /ysyx-workbench/nemu/src/memory/sram.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>

static uint8_t sram[CONFIG_SRAMSIZE] PG_ALIGN = {};

void init_sram() {
    memset(sram, 0, CONFIG_SRAMSIZE);
}

bool in_sram(word_t addr) {
    return addr - CONFIG_SRAMBASE < CONFIG_SRAMSIZE;
}

uint8_t* guest_to_host_sram(word_t saddr) { return sram + saddr - CONFIG_SRAMSIZE; }
word_t host_to_guest_sram(uint8_t *saddr) { return saddr - sram + CONFIG_SRAMBASE; }

static inline word_t host_read(void* addr, int len) {
	switch (len) {
		case 1: return *(uint8_t  *)addr;
		case 2: return *(uint16_t *)addr;
		case 4: return *(uint32_t *)addr;
		default: Assert(0, "Read Data Wrong");
	}
}

static inline void host_write(void *addr, int len, word_t data) {
  switch (len) {
    case 1: *(uint8_t  *)addr = data; return;
    case 2: *(uint16_t *)addr = data; return;
    case 4: *(uint32_t *)addr = data; return;
    default: Assert(0, "Write Data Wrong");
  }
}

word_t sram_read(word_t addr, int len) { 
    word_t data = host_read(guest_to_host_sram(addr), len);
    return data;
}

void sram_write(paddr_t addr, int len, word_t data) {
    host_write(guest_to_host_sram(addr), len, data);
}
