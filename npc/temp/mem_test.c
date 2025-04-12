/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2025-02-20 19:13:16
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-20 19:29:22
 * @FilePath: /ysyx-workbench/npc/temp/mem_test.c
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
#include "trap.h"
#define PSRAMBASE 0x80000000
#define PSRAMSIZE 0x20000000

void main() {
	volatile uint8_t* psram8 = (volatile uint8_t *) PSRAMBASE;
	volatile uint16_t* psram16 = (volatile uint16_t *) PSRAMBASE;
	volatile uint32_t* psram32 = (volatile uint32_t *) PSRAMBASE;
	volatile uint64_t* psram64 = (volatile uint64_t *) PSRAMBASE;
	// 8 bits
	for (size_t i = 0; i < 16; i++) 
		*(psram8 + i) = i;
	for (size_t i = 0; i < 16; i++)
		check(*(psram8 + i) == i);
	
	// 16 bits
	for (size_t i = 0; i < 16; i++)
		*(psram16 + i) = 2*i;
	for (size_t i = 0; i < 16; i++)
		check(*(psram16 + i) == 2*i);
	
	// 32 bits
	for (size_t i = 0; i < 16; i++)
		*(psram32 + i) = 4*i;
	for (size_t i = 0; i < 16; i++)
		check(*(psram32 + i) == 4*i);

	// 64 bits
	for (size_t i = 0; i < 16; i++)
		*(psram64 + i) = 8*i;
	for (size_t i = 0; i < 16; i++)
		check(*(psram64 + i) == 8*i);
}
