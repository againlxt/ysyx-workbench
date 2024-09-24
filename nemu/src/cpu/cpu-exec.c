/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <cpu/cpu.h>
#include <cpu/decode.h>
#include <cpu/difftest.h>
#include <locale.h>
#include <elf.h>

/* The assembly code of instructions executed is only output to the screen
 * when the number of instructions executed is less than this value.
 * This is useful when you use the `si' command.
 * You can modify this value as you want.
 */
#define MAX_INST_TO_PRINT 10

CPU_state cpu = {};
uint64_t g_nr_guest_inst = 0;
uint64_t log_write_n = 0;
static uint64_t g_timer = 0; // unit: us
static bool g_print_step = false;

// my design of iringbufnode
#ifdef CONFIG_ITRACE

#define LOG_LENGTH 128
#define LOG_POOL_SIZE 200

typedef struct iringbufnode {
    char log[LOG_LENGTH];
    struct iringbufnode *next;
} IRBN;

static IRBN *log_pool[LOG_POOL_SIZE] = {};
static IRBN *head = NULL, *last = NULL;
static size_t ringbufcount = 0;

void new_irbn(const char *str) {
    char buf[LOG_LENGTH] = "";
    if (strlen(str) > LOG_LENGTH - 5) {
        fprintf(stderr, "Error: Log entry too long\n");
        return;
    }
    strcpy(buf, str);

    IRBN *node = (IRBN *)calloc(1, sizeof(IRBN));
    if (!node) {
        fprintf(stderr, "Error: Memory allocation failed\n");
        return;
    }
    strcpy(node->log, buf);

    if (ringbufcount == 0) {
        node->next = node;  // 初始环
        head = node;
        last = node;
        log_pool[0] = node;
    } else if (ringbufcount >= LOG_POOL_SIZE) {
        head = head->next;
        last->next = node;
        node->next = head;
        last = node;

        free(log_pool[ringbufcount % LOG_POOL_SIZE]);
        log_pool[ringbufcount % LOG_POOL_SIZE] = node;
    } else {
        last->next = node;
        node->next = head;
        last = node;
        log_pool[ringbufcount] = node;
    }

    ringbufcount++;
}

static void iringbuf_log() {
    if (ringbufcount == 0) return;
    log_write("---------- Instruction Trace ----------\n");
    
    IRBN *node = head;
    size_t count = ringbufcount > LOG_POOL_SIZE ? LOG_POOL_SIZE : ringbufcount;
    
    for (size_t i = 0; i < count; i++) {
        log_write("%s\n", node->log);
        node = node->next;
    }
    log_write("----------------- End -----------------\n");

    // 释放内存
    for (size_t i = 0; i < count; i++) {
        IRBN *temp = head;
        head = head->next;
        free(temp);
    }

    // 重置指针
    head = NULL;
    last = NULL;
    ringbufcount = 0;
}

#endif

//design end

void device_update();
/**
 * @description: define in utils/elf.c, used to check whether call a function.
 * @param {vaddr_t} next_pc
 * @return {*}
 */
#ifdef CONFIG_FTRACE
extern Elf32_Sym *find_func_call (vaddr_t next_pc);
extern char *find_string (Elf32_Sym *func);
extern word_t ftrace_function_call_flag;
extern word_t ftrace_ret_flag;
extern uint32_t ftrace_call_depth;
#endif

static void trace_and_difftest(Decode *_this, vaddr_t dnpc) {
#ifdef CONFIG_ITRACE_COND
  if (ITRACE_COND) { log_write("%s\n", _this->logbuf); }
#endif
  if (g_print_step) { IFDEF(CONFIG_ITRACE, puts(_this->logbuf)); }
  IFDEF(CONFIG_DIFFTEST, difftest_step(_this->pc, dnpc));

#ifdef CONFIG_FTRACE
	Elf32_Sym *ftrace_function_symbol = NULL;
	if(ftrace_function_call_flag == true) {
		ftrace_function_call_flag = false;
		ftrace_function_symbol = find_func_call(dnpc);
		log_write("f %#X: ", _this->pc);
		ftrace_call_depth ++;
		for (uint32_t i = 0; i < ftrace_call_depth; i++) { log_write("  "); }
    if(ftrace_function_symbol != NULL)
		  log_write("call [%s@%#X]\n", find_string(ftrace_function_symbol), ftrace_function_symbol->st_value);
    else
      log_write("call [UNKOWN@%#X]\n", dnpc);
	} else if (ftrace_ret_flag == true) {
		ftrace_ret_flag = false;
		ftrace_function_symbol = find_func_call(dnpc);
		log_write("f %#X: ", _this->pc);
		if(ftrace_call_depth >= 1) ftrace_call_depth --;
		for (uint32_t i = 0; i < ftrace_call_depth; i++) { log_write("  "); }
    if(ftrace_function_symbol != NULL)
		  log_write("ret [%s@%#X]\n", find_string(ftrace_function_symbol), ftrace_function_symbol->st_value);
    else
      log_write("ret [UNKOWN@%#X]\n", dnpc);
	} else { }
#endif
}

static void exec_once(Decode *s, vaddr_t pc) {
  s->pc = pc;
  s->snpc = pc;
  isa_exec_once(s);
  cpu.pc = s->dnpc;
#ifdef CONFIG_ITRACE
  char *p = s->logbuf;
  p += snprintf(p, sizeof(s->logbuf), FMT_WORD ":", s->pc);
  int ilen = s->snpc - s->pc;
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

#ifndef CONFIG_ISA_loongarch32r
  void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
  disassemble(p, s->logbuf + sizeof(s->logbuf) - p,
      MUXDEF(CONFIG_ISA_x86, s->snpc, s->pc), (uint8_t *)&s->isa.inst.val, ilen);
#else
  p[0] = '\0'; // the upstream llvm does not support loongarch32r
#endif
#endif
}

static void execute(uint64_t n) {
  Decode s;
  for (;n > 0; n --) {
    exec_once(&s, cpu.pc);
	#ifdef CONFIG_ITRACE
	new_irbn(s.logbuf);
	#endif
    g_nr_guest_inst ++;
    trace_and_difftest(&s, cpu.pc);
    if (nemu_state.state != NEMU_RUNNING) break;
    IFDEF(CONFIG_DEVICE, device_update());
  }
}

static void statistic() {
  IFNDEF(CONFIG_TARGET_AM, setlocale(LC_NUMERIC, ""));
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

/* Simulate how the CPU works. */
void cpu_exec(uint64_t n) {
  g_print_step = (n < MAX_INST_TO_PRINT);
  switch (nemu_state.state) {
    case NEMU_END: case NEMU_ABORT:
      printf("Program execution has ended. To restart the program, exit NEMU and run again.\n");
      return;
    default: nemu_state.state = NEMU_RUNNING;
  }

  uint64_t timer_start = get_time();

  execute(n);

  uint64_t timer_end = get_time();
  g_timer += timer_end - timer_start;

  switch (nemu_state.state) {
    case NEMU_RUNNING: nemu_state.state = NEMU_STOP; break;

    case NEMU_END: case NEMU_ABORT:
      Log("nemu: %s at pc = " FMT_WORD,
          (nemu_state.state == NEMU_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
           (nemu_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
            ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
          nemu_state.halt_pc);
      // fall through
    case NEMU_QUIT: statistic();
  }
}
