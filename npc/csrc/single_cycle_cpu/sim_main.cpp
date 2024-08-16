/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-05 20:00:11
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 08:25:34
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/sim_main.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
void engine_start();
void init_monitor(int argc, char *argv[]);
int is_exit_status_bad();

// 主函数
int main(int argc, char *argv[]) {
	
	init_monitor(argc, argv);

	engine_start();
	
    return is_exit_status_bad();

}
