/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:40:47
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-19 10:58:53
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
#include <isa/reg.h>
#include <iostream>
#include <cstdint>

#define MAX_INST_TO_PRINT 10

VerilatedContext* verlatorContextp = nullptr;
VerilatedVcdC* verlatorTfp = nullptr;
Vtop* verilatorTop = nullptr;

extern uint8_t *rom_buffer;
extern uint32_t rom_buffer_size;

char logbuf[128] = "";
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

// DPI-C
// Simulation exit
extern "C" void sim_exit();
void sim_exit() {
	NPCTRAP(npc_pc, 0);
	verilatorTop->io_npcState 		= npc_state.state; 

    step_and_dump_wave(); // 确保最后一步被记录
}

extern "C" svBitVecVal getCommond();
// DPI-C END

static void exec_once() {
	uint32_t npc_curPC  = npc_pc;
	uint32_t npc_snpc 	= npc_curPC + 4;
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
	p += snprintf(p, sizeof(logbuf), FMT_WORD ":", npc_curPC);
	int ilen = npc_snpc - npc_curPC;
	int i;
	svSetScope(svGetScopeFromName("TOP.top"));
	svBitVecVal cmd = getCommond();
	uint32_t npcCurCmd = (uint32_t) cmd;
	uint8_t *inst = reinterpret_cast<uint8_t*>(&npcCurCmd);
	for (i = ilen - 1; i >= 0; i --) {
		p += snprintf(p, 4, " %02x", inst[i]);
	}
	int ilen_max = 4;
	int space_len = ilen_max - ilen;
	if (space_len < 0) space_len = 0;
	space_len = space_len * 3 + 1;
	memset(p, ' ', space_len);
	p += space_len;

	void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
	disassemble(p, logbuf + sizeof(logbuf) - p,
    	MUXDEF(CONFIG_ISA_x86, npc_dnpc, npc_pc), (uint8_t *) &npcCurCmd, ilen);
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
		new_irbn(logbuf);
		#endif
		g_nr_guest_inst ++;
	}
}

void assert_fail_msg() {
#ifdef CONFIG_ITRACE
	iringbuf_log();
#endif
  	isa_reg_display();
}

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
		#ifdef CONFIG_ITRACE
		iringbuf_log();
		#endif
		// fall through
		
		default:
			break;
	}
}
