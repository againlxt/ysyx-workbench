/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2025-02-20 19:13:16
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-20 19:29:22
 * @FilePath: /ysyx-workbench/npc/temp/mem_test.c
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
#include "trap.h"
#define SDRAMBASE 0xa0000000
#define SDRAMSIZE 0x1000

int main() {
	volatile uint8_t* sdram8 = (volatile uint8_t *) SDRAMBASE;
	volatile uint16_t* sdram16 = (volatile uint16_t *) SDRAMBASE;
	volatile uint32_t* sdram32 = (volatile uint32_t *) SDRAMBASE;
	volatile uint64_t* sdram64 = (volatile uint64_t *) SDRAMBASE;
	// 8 bits
	for (size_t i = SDRAMSIZE-1; i >= 0; i--) {
		*(sdram8 + i) = i & ((uint64_t) 0xff);
		if (i%(0x100000) == 0) {
			printf("Load:i=0x%lx!\n", i);
		}
	}
	for (size_t i = SDRAMSIZE-1; i >= 0; i--) {
		if (i == 0)
			printf("8Bits Check Begin!\n");
		check(*(sdram8 + i) == (i & ((uint64_t) 0xff)));
		if (i%(0x100000) == 0) {
			printf("Check:i=0x%lx!\n", i);
		}
	}
	printf("8Bits end\n");

	// 16 bits
	for (size_t i = 0; i < SDRAMSIZE/2; i++) {
		*(sdram16 + i) = (2*i) & ((uint64_t) 0xffff);
		if (i%(0x100000) == 0) {
			printf("Load:i=0x%lx!\n", i);
		}
	}
	for (size_t i = 0; i < SDRAMSIZE/2; i++) {
		if (i == 0)
			printf("16Bits Check Begin!\n");
		check(*(sdram16 + i) == ((2*i) & ((uint64_t) 0xffff)));
		if (i%(0x100000) == 0) {
			printf("Check:i=0x%lx!\n", i);
		}
	}
	printf("16Bits end\n");
	
	// 32 bits
	for (size_t i = 0; i < SDRAMSIZE/4; i++) {
		if (i%(0x100000) == 0) {
			printf("Load:i=0x%lx!\n", i);
		}
		*(sdram32 + i) = (4*i) & ((uint64_t) 0xffffffff);
	}
	for (size_t i = 0; i < SDRAMSIZE/4; i++) {
		if (i == 0)
			printf("32Bits Check Begin!\n");
		check(*(sdram32 + i) == ((4*i) & ((uint64_t) 0xffffffff)));
		if (i%(0x100000) == 0) {
			printf("Check:i=0x%lx!\n", i);
		}
	}
	printf("32Bits end\n");
	// 64 bits
	for (size_t i = 0; i < SDRAMSIZE/8; i++) {
		if (i%(0x100000) == 0) {
			printf("Load:i=0x%lx!\n", i);
		}
		*(sdram64 + i) = (8*i);
	}
	for (size_t i = 0; i < SDRAMSIZE/8; i++) {
		if (i == 0)
			printf("64Bits Check Begin!\n");
		check(*(sdram64 + i) == 8*i);
		if (i%(0x100000) == 0) {
			printf("Check:i=0x%lx!\n", i);
		}
	}
	printf("64Bits end\n");

	return 0;
}
