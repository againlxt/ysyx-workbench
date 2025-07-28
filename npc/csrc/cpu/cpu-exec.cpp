/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 15:40:47
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-16 11:52:08
 * @FilePath: /ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <cpu/cpu.h>
#include <cpu/difftest.h>
#include <verilator.h>
#include <utils.h>
#include <trace/trace.h>
#include <isa/reg.h>
#include <isa/isa-def.h>
#include <iostream>
#include <cstdint>
#include <elf.h>
#ifdef CONFIG_NVBOARD
#include <nvboard.h>
#endif

#define MAX_INST_TO_PRINT 10
uint64_t g_nr_guest_inst = 0;
static uint64_t g_timer = 0;
static bool g_print_step = false;
CPU_state cpu = {};

char logbuf[128] = "";
#ifdef CONFIG_SOC
uint32_t npc_dnpc 	= CONFIG_FLASHBASE;
uint32_t npc_pc 	= CONFIG_FLASHBASE;
uint32_t base_addr 	= CONFIG_FLASHBASE;
#else
uint32_t npc_dnpc 	= CONFIG_MBASE;
uint32_t npc_pc 	= CONFIG_MBASE;
uint32_t base_addr 	= CONFIG_MBASE;
#endif

word_t ftrace_function_call_flag;
word_t ftrace_ret_flag;

static void step_and_dump_wave();

// DPI-C
/* Preformence Counter */
static uint64_t cycle_counter = 0;
#ifdef CONFIG_PERFORMANCE_COUNTER_ENABLE
enum PerformanceCounterType {
	OTHER = 0, JUMP, STROE, LOAD, CAL, CSR, IFUGETINST, LSUGETDATA, EXUFINCAL ,
	ICACHE_ACCESS_TIME, ICACHE_MISS_PENALTY
};
static double other_counter = 0;
static double jump_counter = 0;
static double stroe_counter = 0;
static double load_counter = 0;
static double cal_counter = 0;
static double csr_counter = 0;
static double ifu_get_inst_cnt = 0;
static double lsu_get_data_cnt = 0;
static double lsu_get_data_num = 0;
static double exu_fin_cal_cnt = 0;
static double icache_access_time_cnt = 0;
static double icache_access_num = 0;
static double icache_miss_penalty_cnt = 0;
static double icache_miss_num = 0;
static double icache_hit_rate = 0;
static double icache_miss_rate = 0;
extern "C" void performence_cnt_record(int cnttype, int data) {
	switch (cnttype) {
		case OTHER: other_counter ++; 		break;
		case JUMP: 	jump_counter ++; 		break;
		case STROE:	stroe_counter ++; 		break;
		case LOAD: 	load_counter ++; 		break;
		case CAL: 	cal_counter ++;			break;
		case CSR: 	csr_counter ++; 		break;
		case IFUGETINST:
			ifu_get_inst_cnt += data;		break;
		case LSUGETDATA:
			lsu_get_data_num += 1;
			lsu_get_data_cnt += data;		break;
		case EXUFINCAL:
			exu_fin_cal_cnt  += data;		break;
		case ICACHE_ACCESS_TIME:
			icache_access_time_cnt 	+= data; 
			icache_access_num 		+= 1; 	break;
		case ICACHE_MISS_PENALTY:
			icache_miss_penalty_cnt += data;
			icache_miss_num 		+= 1;	break;
		default: Log("Unknow Type!"); assert(0);
	}
}
static void performence_cnt_display() {
	icache_hit_rate = (icache_access_num/(icache_access_num+icache_miss_num));
	icache_miss_rate = (icache_miss_num/(icache_access_num+icache_miss_num));
	Log("================ Performence Counter Display =================");
	Log("The average memory access latency of the LSU: %0.2lf", lsu_get_data_cnt/lsu_get_data_num);
	Log("proportion JUMP  |  Store  |  Load  |  Cal  |  Csr  |  Other");
	Log("           %0.2lf%%   %0.2lf%%   %0.2lf%%   %0.2lf%%   %0.2lf%%   %0.2lf%%", 100*jump_counter/g_nr_guest_inst, 100*stroe_counter/g_nr_guest_inst,
	100*load_counter/g_nr_guest_inst, 100*cal_counter/g_nr_guest_inst, 100*csr_counter/g_nr_guest_inst, 100*other_counter/g_nr_guest_inst);
	Log("proportion IFUGetInst  |  LSUGetData  |  EXUFinCal");
	Log("           %0.2lf%%           %0.2lf%%         %0.2lf%%", 100*ifu_get_inst_cnt/cycle_counter, 100*lsu_get_data_cnt/cycle_counter, 100*exu_fin_cal_cnt/cycle_counter);
	Log("Icache hit rate: %0.2lf | Icache AMAT: %0.2lf | Icache Miss Penalty: %0.2lf", icache_hit_rate, 
	(icache_access_time_cnt + icache_miss_rate * icache_miss_penalty_cnt)/(icache_access_num+icache_miss_num), icache_miss_penalty_cnt/icache_miss_num);
	Log("============== Performence Counter Display End ===============");
}
#else
extern "C" void performence_cnt_record(int cnttype, int data) {}
#endif
// Simulation exit
extern "C" void sim_exit();
void sim_exit() {
	NPCTRAP(npc_pc, gpr(10));

    step_and_dump_wave(); // 确保最后一步被记录
	Log("total cycle = %lu", cycle_counter);
	Log("total inst  = %lu", g_nr_guest_inst);
	Log("IPC         = %lf", (double) ((double) g_nr_guest_inst/ (double)cycle_counter));
	Log("CPI         = %lf", (double) ((double) cycle_counter/ (double)g_nr_guest_inst));
	IFDEF(CONFIG_PERFORMANCE_COUNTER_ENABLE, performence_cnt_display());
}

extern "C" void set_ftrace_function_call_flag(); 
void set_ftrace_function_call_flag() {
	ftrace_function_call_flag = true;
}

extern "C" void set_ftrace_ret_flag();
void set_ftrace_ret_flag() {
	ftrace_ret_flag = true;
}

extern "C" svBitVecVal getCommond();
extern "C" svBitVecVal get_cur_pc();
extern "C" svBitVecVal get_next_pc();
// DPI-C END

// Simulate stepping and record waveform
static void step_and_dump_wave() {
    verilatorTop->eval();
	#ifdef CONFIG_WAVE_TRACE
	if (((npc_pc >= CONFIG_WAVE_EREA_BEGIN) & (npc_pc < CONFIG_WAVE_EREA_END)) /*& (!((npc_pc >= 0x0f000000) & (npc_pc < 0x0f002000)))*/) {
		verlatorContextp->timeInc(1); // 时间增加
		verlatorTfp->dump(verlatorContextp->time());
	}
	#endif
	#ifdef CONFIG_NVBOARD
	if(verilatorTop->clock == 1) nvboard_update();
	#endif
}

static void trace_and_difftest() {
#ifdef CONFIG_ITRACE
	/*if (!((npc_pc >= 0x0f000000) & (npc_pc < 0x0f002000)))*/
		log_write("%s\n", logbuf);
#endif
  	if (g_print_step) { IFDEF(CONFIG_ITRACE, puts(logbuf)); }
	IFDEF(CONFIG_DIFFTEST, difftest_step(npc_pc, npc_dnpc));

#ifdef CONFIG_FTRACE
	Elf32_Sym *ftrace_function_symbol = NULL;
	if(ftrace_function_call_flag == true) {
	} else if (ftrace_ret_flag == true) {
		ftrace_ret_flag = false;
		ftrace_function_symbol = find_func_call(npc_dnpc);
		log_write("f %#X: ", npc_pc);
		if(ftrace_call_depth >= 1) ftrace_call_depth --;
		for (uint32_t i = 0; i < ftrace_call_depth; i++) { log_write("  "); }
		if(ftrace_function_symbol != NULL)
		  	log_write("ret [%s@%#X]\n", find_string(ftrace_function_symbol), ftrace_function_symbol->st_value);
		else
			log_write("ret [UNKOWN@%#X]\n", npc_dnpc);
	} else { }
#endif
}

static void set_dut_cpu_regs(vaddr_t pc) {
  cpu.pc  = pc;
  for (size_t i = 0; i < REGS_SIZE; i++) {
    cpu.gpr[i] = gpr(i);
  }
  cpu.csr[MSTATUS]  = csr(MSTATUS);
  cpu.csr[MCAUSE]   = csr(MCAUSE);
  cpu.csr[MEPC]     = csr(MEPC);
  cpu.csr[MTVEC]    = csr(MTVEC);
}

static void clk_up() {
	verilatorTop->clock = 1; step_and_dump_wave();
	cycle_counter ++;
}

static void clk_down() {
	verilatorTop->clock = 0; step_and_dump_wave();
}

static void exec_once() {
	#ifdef CONFIG_TRACE
	uint32_t npc_curPC  = npc_pc;
	uint32_t npc_snpc 	= npc_curPC + 4;
	#endif

	clk_down();
	uint32_t loop_counter = 0;
	while (
	#ifdef CONFIG_SOC
	!(verilatorTop->rootp->ysyxSoCFull__DOT__asic__DOT__cpu__DOT__cpu__DOT__wbu__DOT__wb_end)
	#else
	!(verilatorTop->rootp->top__DOT__wbu__DOT__validPC2Reg && verilatorTop->rootp->top__DOT__pc__DOT__wbu2PCReadyReg)
	#endif
	) {
		clk_up();
		clk_down();
		#ifdef CONFIG_LOOP_CHECK_ENABLE
		if ((loop_counter ++) >= CONFIG_LOOP_NUM) {
			printf("\n");
			sim_exit();
			Log("npc: %s at pc = " FMT_WORD,
			(npc_state.state == NPC_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
			(npc_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
				ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
			npc_state.halt_pc);
			FREE_VERILATOR();
			#ifdef CONFIG_WAVE_TRACE
			verlatorTfp->close();
			delete verlatorTfp;
			#endif
			assert(0);
		}
		#endif
	}
	#ifdef CONFIG_ITRACE
	char *p = logbuf;
	p += snprintf(p, sizeof(logbuf), FMT_WORD ":", npc_curPC);
	int ilen = npc_snpc - npc_curPC;
	int i;
	#ifdef CONFIG_SOC
	svSetScope(svGetScopeFromName("TOP.ysyxSoCFull.asic.cpu.cpu.wbu.getCmd"));
	#else
	svSetScope(svGetScopeFromName("TOP.top.wbu.getCmd"));
	#endif
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
		npc_pc, (uint8_t *) &npcCurCmd, ilen);

	new_irbn(logbuf);
	#endif
	clk_up();

	#ifdef CONFIG_SOC
	svSetScope(svGetScopeFromName("TOP.ysyxSoCFull.asic.cpu.cpu.getCurPC"));
	#else
	svSetScope(svGetScopeFromName("TOP.top.getCurPC"));	
	#endif
	npc_pc		= get_cur_pc();
	#ifdef CONFIG_SOC
	svSetScope(svGetScopeFromName("TOP.ysyxSoCFull.asic.cpu.cpu.getNextPC"));
	#else
	svSetScope(svGetScopeFromName("TOP.top.getNextPC"));	
	#endif
	npc_dnpc	= get_next_pc();
	trace_and_difftest();
}

static void execute(uint64_t n) {
	#ifdef CONFIG_SOC
	svSetScope(svGetScopeFromName("TOP.ysyxSoCFull.asic.cpu.cpu.getCurPC"));
	#else
	svSetScope(svGetScopeFromName("TOP.top.getCurPC"));	
	#endif	
	npc_pc		= get_cur_pc(); 
	#ifdef CONFIG_SOC
	svSetScope(svGetScopeFromName("TOP.ysyxSoCFull.asic.cpu.cpu.getNextPC"));
	#else
	svSetScope(svGetScopeFromName("TOP.top.getNextPC"));	
	#endif
	npc_dnpc	= get_next_pc();	
	verilatorTop->eval();

	for(uint64_t i=0; i < n; i ++) {
		if(npc_state.state != NPC_RUNNING)	break;
		exec_once();
		#ifdef CONFIG_ITRACE
		#endif
		g_nr_guest_inst ++;
	}
}

static void statistic() {
	setlocale(LC_NUMERIC, "");
	#define NUMBERIC_FMT MUXDEF(CONFIG_TARGET_AM, "%", "%'") PRIu64
	Log("host time spent = " NUMBERIC_FMT " us", g_timer);
	Log("total guest instructions = " NUMBERIC_FMT, g_nr_guest_inst);
	if (g_timer > 0) Log("simulation frequency = " NUMBERIC_FMT " inst/s", g_nr_guest_inst * 1000000 / g_timer);
	else Log("Finish running in less than 1 us and can not calculate the simulation frequency");
}

void assert_fail_msg() {
#ifdef CONFIG_ITRACE
	iringbuf_log();
#endif
  	isa_reg_display();
	statistic();
}

void cpu_exec(uint64_t n) {
	g_print_step = (n < MAX_INST_TO_PRINT);
	switch (npc_state.state) {
		case NPC_END: case NPC_ABORT:
			printf("Program execution has ended. To restart the program, exit NEMU and run again.\n");
			return;
		
		default: npc_state.state = NPC_RUNNING;
	}

	uint64_t timer_start = get_time();

	verilatorTop->reset = 0; step_and_dump_wave();
	execute(n);

	uint64_t timer_end = get_time();
  	g_timer += timer_end - timer_start;

	switch (npc_state.state) {
		case NPC_RUNNING: npc_state.state = NPC_STOP; break;

		case NPC_END: case NPC_ABORT:
		Log("npc: %s at pc = " FMT_WORD,
			(npc_state.state == NPC_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
			(npc_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
				ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
			npc_state.halt_pc);
		FREE_VERILATOR();
		#ifdef CONFIG_WAVE_TRACE
		verlatorTfp->close();
		delete verlatorTfp;
		#endif
		#ifdef CONFIG_ITRACE
		iringbuf_log();
		#endif
		#ifdef CONFIG_NVBOARD
		nvboard_quit();
		#endif
		
		case NPC_QUIT:  statistic(); break;
		default:
			break;
	}
}
