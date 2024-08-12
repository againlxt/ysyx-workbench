/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-09 19:02:48
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-11 14:29:22
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/npc-main.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include "../../include/common.h"

int main(int argc, char *argv[]) {
	init_monitor(argc, argv);

	/* Start engine. */
	engine_start();
}
