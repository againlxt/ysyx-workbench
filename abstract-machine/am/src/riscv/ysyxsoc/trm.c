/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-04 14:11:25
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-03-02 16:13:20
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/riscv/ysyxsoc/trm.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <klib-macros.h>
#include <string.h>
#include <stdio.h>

extern char _heap_start;
extern char _heap_end;
int main(const char *args);

extern char _mrom_start;
#define MROM_SIZE   (4 * 1024)
#define MROM_END    ((unsigned long)&_mrom_start + MROM_SIZE)

Area heap = RANGE(&_heap_start, &_heap_end);
#ifndef MAINARGS
#define MAINARGS ""
#endif
# define npc_trap(code) asm volatile("mv a0, %0; ebreak" : :"r"(code))
static const char mainargs[] = MAINARGS;

#define UART16550_BASE 0x10000000
#define UART16550_RBR_THR_DLL   (0x0 + UART16550_BASE)
#define UART16550_IER_DLM 		(0x1 + UART16550_BASE)
#define UART16550_IIR_FCR 		(0x2 + UART16550_BASE)
#define UART16550_LCR 			(0x3 + UART16550_BASE)
#define UART16550_MCR 			(0x4 + UART16550_BASE)
#define UART16550_LSR 			(0x5 + UART16550_BASE)
#define UART16550_MSR 			(0x6 + UART16550_BASE)
void putch(char ch) {
    while ((*(volatile uint8_t *) UART16550_LSR & 0x20) == 0) {}
	*(volatile uint8_t *) UART16550_RBR_THR_DLL = ch;
}

void halt(int code) {
	npc_trap(code);
	while (1);
}

extern uint8_t _data_load_start;  // .data 段加载地址（ROM 中）
extern uint8_t _data_start;       // .data 段运行地址（RAM 中）
extern uint8_t _data_end;         // .data 段结束地址（RAM 中）

extern uint8_t _text_load_start;  // .text 段加载地址（ROM 中）
extern uint8_t _text_start;       // .text 段运行地址（RAM 中）
extern uint8_t _text_end;         // .text 段结束地址（RAM 中）

extern uint8_t _bss_start;        /* .bss 段起始地址 */
extern uint8_t _bss_end;          /* .bss 段结束地址 */

void _trm_init();

__attribute__((section(".entry.boot"))) static void *_boot_memcpy(void *out, const void *in, size_t n) {
    // 将void*转换为char*以进行指针运算
    unsigned char *cout = (unsigned char *)out;
    const unsigned char *cin = (const unsigned char *)in;

    // 检查内存重叠
    if ((cout < cin && cout + n > cin) || (cin < cout && cin + n > cout)) {
        panic("Memory conflicts!");
    } else {
        // 复制内存内容
        for (size_t i = 0; i < n; i++) {
            cout[i] = cin[i];
        }
    }

    return out;
}

__attribute__((section(".entry.boot"))) void _bootloader() {
	if (&_text_start != &_text_load_start) {
        _boot_memcpy(&_text_start, &_text_load_start, &_text_end - &_text_start);
	}
    if (&_data_start != &_data_load_start) {
        _boot_memcpy(&_data_start, &_data_load_start, &_data_end - &_data_start);
	}
	_trm_init();
}

static void uart16550_init() {
	/* Set the Line Control Register to the desired line control parameters. Set bit 7 to ‘1’
to allow access to the Divisor Latches. */
	*(volatile uint8_t *) UART16550_LCR 			= 0x80;
	/* Set the Divisor Latches, MSB first, LSB next. */
	*(volatile uint8_t *) UART16550_IER_DLM 		= 0x00;
	*(volatile uint8_t *) UART16550_RBR_THR_DLL 	= 0x01;
	/* Set bit 7 of LCR to ‘0’ to disable access to Divisor Latches. At this time the
transmission engine starts working and data can be sent and received.  */
	*(volatile uint8_t *) UART16550_LCR 			= 0x00;
	/* Set the FIFO trigger level. Generally, higher trigger level values produce less
interrupt to the system, so setting it to 14 bytes is recommended if the system
responds fast enough. */
	*(volatile uint8_t *) UART16550_IIR_FCR 		= 0xC7;
}
static void hello() {
	uint32_t mvendorid=0, marchid=0;
	asm volatile("csrr %0, mvendorid" : "=r"(mvendorid));
	asm volatile("csrr %0, marchid" : "=r"(marchid));
	for (size_t i = 0; i < 4; i++) {
		putch((char) (mvendorid >> ((3-i)*8)));
	}
	printf("_%u\n", marchid);
}

void _trm_init() {
	uart16550_init();
	hello();
    int ret = main(mainargs);
    halt(ret);
}
