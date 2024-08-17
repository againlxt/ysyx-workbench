/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:40:47
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-17 15:51:56
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/cpu/cpu-exec.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>
#include <verilator.h>
#include <utils.h>
#include <paddr.h>
#include <trace/trace.h>

VerilatedContext* verlatorContextp = nullptr;
VerilatedVcdC* verlatorTfp = nullptr;
Vtop* verilatorTop = nullptr;

extern uint8_t *rom_buffer;
extern uint32_t rom_buffer_size;

uint32_t npc_dnpc 	= 0x80000000;
uint32_t npc_pc 	= 0x80000000;
uint32_t base_addr 	= 0x80000000;
uint64_t g_nr_guest_inst = 0;

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

static void exec_once() {
	verilatorTop->clock = 0; step_and_dump_wave();
	verilatorTop->io_memData = vaddr_read(npc_pc, 4); verilatorTop->eval();
	verilatorTop->clock = 1; step_and_dump_wave();

	step_and_dump_wave();
	npc_pc		= verilatorTop->io_curPC; 
	npc_dnpc	= verilatorTop->io_nextPC;
	verilatorTop->io_npcState = npc_state.state;
	verilatorTop->eval();

#ifdef CONFIG_ITRACE
	char *p = logbuf;
	p += snprintf(p, sizeof(logbuf), FMT_WORD ":", npc_pc);
	int ilen = npc_dnpc - npc_pc;
	int i;
	uint8_t *inst = (uint8_t *)&s->isa.inst.val;
	for (i = ilen - 1; i >= 0; i --) {
		p += snprintf(p, 4, " %02x", inst[i]);
	}
	int ilen_max = MUXDEF(CONFIG_ISA_x86, 8, 4);
	int space_len = ilen_max - ilen;
	if (space_len < 0) space_len = 0;
	space_len = space_len * 3 + 1;
	memset(p, ' ', space_len);
	p += space_len;
#endif
}

static void execute(uint64_t n) {
	npc_pc		= verilatorTop->io_curPC; 
	npc_dnpc	= verilatorTop->io_nextPC;
	verilatorTop->io_npcState 		= npc_state.state;
	verilatorTop->eval();

	for(uint64_t i=0; i < n; i ++) {
		if(npc_state.state != NPC_RUNNING)	break;
		exec_once();
		
		#ifdef CONFIG_ITRACE
		new_irbn();
		#endif
		g_nr_guest_inst ++;
	}
}

static bool sim_init_flag = true;

void cpu_exec(uint64_t n) {

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
