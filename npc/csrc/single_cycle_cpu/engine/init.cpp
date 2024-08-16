/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:54:53
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-14 15:59:37
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/engine/init.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>

void sdb_mainloop();

void engine_start() {
#ifdef CONFIG_SDB
	sdb_mainloop();
#else
	cpu_exec(-1);
#endif
}