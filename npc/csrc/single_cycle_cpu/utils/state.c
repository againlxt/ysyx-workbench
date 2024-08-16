/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-16 07:53:15
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 07:58:01
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/utils/state.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>

NPCState npc_state = { .state = NPC_STOP };

int is_exit_status_bad() {
	int good = (npc_state.state == NPC_END && npc_state.halt_ret == 0) ||
    	(npc_state.state == NPC_QUIT);
  	return !good;
}
