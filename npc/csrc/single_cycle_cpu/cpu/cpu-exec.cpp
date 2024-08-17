/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:40:47
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 20:49:25
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/cpu/cpu-exec.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>
#include <verilator.h>
#include <utils.h>

VerilatedContext* verlatorContextp = nullptr;
VerilatedVcdC* verlatorTfp = nullptr;
Vtop* verilatorTop = nullptr;

extern uint8_t *rom_buffer;
extern uint32_t rom_buffer_size;

static uint32_t npc_pc 		= 0x80000000;
static uint32_t base_addr 		= 0x80000000;

// temp
static uint execute_quit = 0;
// temp end 

// Simulate stepping and record waveform
void step_and_dump_wave() {
    verilatorTop->eval();
    verlatorContextp->timeInc(1); // 时间增加
    verlatorTfp->dump(verlatorContextp->time());
}

// Simulation Init
static void sim_init(uint32_t deepth) {
    verlatorContextp = new VerilatedContext;
    verlatorTfp = new VerilatedVcdC;
    verilatorTop = new Vtop(verlatorContextp);
    verlatorContextp->traceEverOn(true);
    verilatorTop->trace(verlatorTfp, deepth);
    verlatorTfp->open("single_cycle_cpu.vcd");
}

// Simulation exit
extern "C" void sim_exit();
void sim_exit() {
	NPCTRAP(npc_pc, 0);
	verilatorTop->io_npcState 		= npc_state.state; 

    step_and_dump_wave(); // 确保最后一步被记录
}

static void init_npc() {
	verilatorTop->io_npcState 	= NPC_INIT;

	verilatorTop->reset 			= 1;
	verilatorTop->clock = 0; step_and_dump_wave();
	verilatorTop->clock = 1; step_and_dump_wave();
	verilatorTop->clock = 0; step_and_dump_wave();
	verilatorTop->clock = 1; step_and_dump_wave();
}

static void execute(uint64_t n) {
	verilatorTop->io_npcState 		= npc_state.state;	

	for(uint64_t i=0; i < n; i ++) {
		if(npc_state.state != NPC_RUNNING)	break;

		verilatorTop->io_memData =  
		(*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
		verilatorTop->io_npcState = npc_state.state;
		
		verilatorTop->clock = 0; step_and_dump_wave();

		verilatorTop->io_memData =  
		(*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
		
		npc_pc = verilatorTop->io_nextPC;
		verilatorTop->io_pcInput = npc_pc;
		verilatorTop->io_npcState = npc_state.state;

		verilatorTop->clock = 1; step_and_dump_wave();
	}
}

static bool sim_init_flag = true;

void cpu_exec(uint64_t n) {
	/*
	if(sim_init_flag == true) {
		sim_init(99);
		init_npc();
		sim_init_flag = false;
	}
	*/

	switch (npc_state.state) {
		case NPC_END: case NPC_ABORT:
			printf("Program execution has ended. To restart the program, exit NEMU and run again.\n");
			return;
		
		default: npc_state.state = NPC_RUNNING;
	}

	verilatorTop->reset 			= 0;
	execute(n);
	switch (npc_state.state) {
		case NPC_RUNNING: npc_state.state = NPC_STOP; break;

		case NPC_END: case NPC_ABORT:
		Log("npc: %s at pc = " FMT_WORD,
			(npc_state.state == NPC_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
			(npc_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
				ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
			npc_state.halt_pc);
		FREE_VERILATOR();
		// fall through
		
		default:
			break;
	}
}
