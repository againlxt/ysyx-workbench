/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-12 22:30:44
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/riscv/npc/trm.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <stdio.h>
#include <klib-macros.h>

extern char _heap_start;
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (128 * 1024 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, PMEM_END);
#ifndef MAINARGS
#define MAINARGS ""
#endif
# define npc_trap(code) asm volatile("mv a0, %0; ebreak" : :"r"(code))
static const char mainargs[] = MAINARGS;

void putch(char ch) {
	putchar(ch);
}

void halt(int code) {
	npc_trap(code);
	while (1);
}

void _trm_init() {
  int ret = main(mainargs);
  halt(ret);
}
