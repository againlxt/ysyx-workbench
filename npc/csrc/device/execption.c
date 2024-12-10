/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-12-08 20:01:58
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-12-09 16:49:47
 * @FilePath: /ysyx-workbench/npc/csrc/device/execption.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>

extern "C" void axi_access_fault(unsigned resp) {
    assert(resp != 0 || resp != 1);
}
