/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-08 11:39:28
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 12:22:42
 * @FilePath: /ysyx-workbench/nemu/src/memory/mrom.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>
#include <memory/mrom.h>

static uint8_t mrom[CONFIG_MROMSIZE] PG_ALIGN = {};

void init_mrom() {
    memset(mrom, 0, CONFIG_MROMSIZE);
}

bool in_mrom(word_t addr) {
    return addr - CONFIG_MROMBASE < CONFIG_MROMSIZE;
}

uint8_t* guest_to_host_mrom(word_t maddr) { return mrom + maddr - CONFIG_MROMBASE; }

static word_t host_read(void* addr, int len) {
  printf("1");
	switch (len) {
		case 1: return *(uint8_t  *)addr;
		case 2: return *(uint16_t *)addr;
		case 4: return *(word_t *)addr;
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

word_t mrom_read(word_t addr, int len) { 
    word_t data = host_read(guest_to_host_mrom(addr), len);
    return data;
}

void mrom_write(paddr_t addr, int len, word_t data) {
    host_write(guest_to_host_mrom(addr), len, data);
}
