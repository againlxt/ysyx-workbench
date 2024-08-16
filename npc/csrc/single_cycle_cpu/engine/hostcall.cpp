/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 07:39:47
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 07:50:29
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/engine/hostcall.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>
#include <utils.h>

void set_npc_state(int state, vaddr_t pc, int halt_ret) {
	npc_state.halt_pc 	= pc;
	npc_state.state 	= state;
	npc_state.halt_ret 	= halt_ret;
}
