/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-04 19:30:26
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-04 19:32:38
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
