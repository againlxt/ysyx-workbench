/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 20:41:03
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-26 20:41:32
 * @FilePath: /ysyx-workbench/npc/csrc/device/memory.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>

extern "C" void mrom_read(int32_t addr, int32_t *data) { 
    *data = 0x00100073;
}