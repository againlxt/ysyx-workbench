/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:54:53
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 10:29:02
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/engine/init.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>

void sdb_mainloop();

void engine_start() {
#if CONFIG_SDB_MODE == 1
	sdb_mainloop();
#else 
	cpu_exec(0xffffffffffffffff);
#endif
}