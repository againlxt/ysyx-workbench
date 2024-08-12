/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 08:08:28
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-11 14:28:23
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/init.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include "../../include/common.h"

extern "C" {
	void cpu_exec();
}

void engine_start() {
	cpu_exec();
}
