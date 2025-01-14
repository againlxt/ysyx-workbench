/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-04 14:11:25
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-08 19:53:33
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/riscv/ysyxsoc/trm.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <klib-macros.h>
#include <string.h>

extern char _heap_start;
int main(const char *args);

extern char _mrom_start;
#define MROM_SIZE   (4 * 1024)
#define MROM_END    ((unsigned long)&_mrom_start + MROM_SIZE)

Area heap = RANGE(&_heap_start, MROM_END);
#ifndef MAINARGS
#define MAINARGS ""
#endif
# define npc_trap(code) asm volatile("mv a0, %0; ebreak" : :"r"(code))
static const char mainargs[] = MAINARGS;

#define UART_BASE 0x10000000L
#define UART_TX   0x0
void putch(char ch) {
    *(volatile char *)(UART_BASE + UART_TX) = ch;
}

void halt(int code) {
	npc_trap(code);
	while (1);
}

extern char _data_start [];
extern char _data_size [];
extern char _data_load_start [];

void _bootloader() {
    if (_data_start != _data_load_start)
        memcpy(_data_load_start, _data_start, (size_t) _data_size);
}

void _trm_init() {
    int ret = main(mainargs);
    halt(ret);
}
