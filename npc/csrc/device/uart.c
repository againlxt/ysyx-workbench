/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-09 22:25:41
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-11 14:29:43
 * @FilePath: /ysyx-workbench/npc/csrc/device/uart.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>

extern "C" void uart(unsigned char chr);
void uart(unsigned char chr) {
    putchar(chr);
}

extern "C" void flash_read(int32_t addr, int32_t *data) { assert(0); }
extern "C" void mrom_read(int32_t addr, int32_t *data) { assert(0); }
