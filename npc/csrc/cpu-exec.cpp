/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 11:11:22
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-11 14:27:27
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/cpu-exec.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include "../../include/common.h"
#include "../../include/verilator.h"

extern "C" {
	extern uint8_t *rom_buffer;
	extern uint32_t rom_buffer_size;
}

// State
enum { NPC_RUNNING, NPC_STOP, NPC_END, NPC_ABORT, NPC_QUIT, NPC_INIT };

static VerilatedContext* contextp = nullptr;
static VerilatedVcdC* tfp = nullptr;
static Vtop* top = nullptr;

static uint32_t npc_pc 		= 0x80000000;
static uint32_t base_addr 	= 0x80000000;

typedef struct {
  int state;
} NPCState;
NPCState npc_state = { .state = NPC_STOP };

// Simulate stepping and record waveform
void step_and_dump_wave() {
    top->eval();
    contextp->timeInc(1); // 时间增加
    tfp->dump(contextp->time());
}

// Simulation Initialization
void sim_init() {
    contextp = new VerilatedContext;
    tfp = new VerilatedVcdC;
    top = new Vtop(contextp);
    contextp->traceEverOn(true);
    top->trace(tfp, 99); // 设置波形深度为99
    tfp->open("single_cycle_cpu.vcd");
}

// Simulation Exit
extern "C" void sim_exit();
void sim_exit() {
    step_and_dump_wave(); // 确保最后一步被记录
	top->io_npcState 	= NPC_END;
    tfp->close();
    delete top;
    delete tfp;
    delete contextp;
    exit(0);
}

static void init_rom() {

}

static void init_npc() {
	top->io_npcState 	= NPC_INIT;
	top->io_pcInput 	= npc_pc;
	top->io_memData 	= (*rom_buffer << 24) + (*(rom_buffer+1) << 16) +
	(*(rom_buffer+2) << 8) + *(rom_buffer+3);
	top->reset 			= 1;

	for (int i = 0; i < 2; ++i) {
        top->clock = 0; step_and_dump_wave();
		top->clock = 1; step_and_dump_wave();
    }
}

void cpu_exec() {
	sim_init();
	init_rom();
	init_npc();

	// RUNNING
	top->io_npcState 	= NPC_RUNNING;
	top->reset 			= 0;
	while (1) {
		top->clock = 0; step_and_dump_wave();
		top->clock = 1; step_and_dump_wave();
		npc_pc = top->io_nextPC;
		top->io_pcInput = npc_pc;
		top->io_memData =  
		(*rom_buffer+(npc_pc-base_addr) << 24) + (*(rom_buffer+(npc_pc-base_addr)+1) << 16) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 8) + *(rom_buffer+(npc_pc-base_addr)+3);
	}
	
}
