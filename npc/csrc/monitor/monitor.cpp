/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 14:26:56
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-23 17:19:32
 * @FilePath: /ysyx-workbench/npc/csrc/monitor/monitor.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
#include <getopt.h>
#include <verilator.h>
#include <isa/reg.h>
#include <memory/paddr.h>

static char *img_file = NULL;
static char *log_file = NULL;
static char *diff_so_file = NULL;
static char *elf_file = NULL;
static int difftest_port = 1234;
uint8_t *rom_buffer = NULL;
uint32_t rom_buffer_size = 0;

VerilatedContext* verlatorContextp = nullptr;
VerilatedVcdC* verlatorTfp = nullptr;
Vtop* verilatorTop = nullptr;

extern void sdb_set_batch_mode();
extern void init_log(const char *log_file);
extern void init_elf(const char *elf_file);
extern void init_disasm(const char *triple);
void init_difftest(char *ref_so_file, long img_size, int port);

static void step_and_dump_wave() {
    verilatorTop->eval();
    verlatorContextp->timeInc(1); // 时间增加
    verlatorTfp->dump(verlatorContextp->time());
}

static void welcome() {
  Log("Trace: %s", MUXDEF(CONFIG_TRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));
  IFDEF(CONFIG_TRACE, Log("If trace is enabled, a log file will be generated "
        "to record the trace. This may lead to a large log file. "
        "If it is not necessary, you can disable it in menuconfig"));
  Log("Build time: %s, %s", __TIME__, __DATE__);
  printf("Welcome to %s-NPC!\n", ANSI_FMT(str("riscv32e"), ANSI_FG_YELLOW ANSI_BG_RED));
  printf("For help, type \"help\"\n");
}

static int parse_args(int argc, char *argv[]) {
	const struct option table[] = {
		{"batch"    , no_argument      , NULL, 'b'},
		{"log"      , required_argument, NULL, 'l'},
		{"diff"     , required_argument, NULL, 'd'},
		{"port"     , required_argument, NULL, 'p'},
		{"elf"		, required_argument, NULL, 'e'},
		{"help"     , 0 		       , NULL, 'h'},
		{0          , 0                , NULL,  0 },
	};
	int o;
	while ( (o = getopt_long(argc, argv, "-bhl:d:p:e:", table, NULL)) != -1) {
		switch (o) {
			case 'b': sdb_set_batch_mode(); break;
			case 'p': sscanf(optarg, "%d", &difftest_port); break;
			case 'l': log_file = optarg; break;
			case 'd': diff_so_file = optarg; break;
			case 'e': elf_file = optarg; break;
			case 1:   img_file = optarg; return 0;
		default:
			printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
			printf("\t-b,--batch              run with batch mode\n");
			printf("\t-p,--port=PORT          run DiffTest with port PORT\n");
			printf("\t-d,--diff=REF_SO        run DiffTest with reference REF_SO\n");
			printf("\t-l,--log=FILE           output log to FILE\n");
			printf("\t-e,--elf=ELF			  input elf file\n");
			printf("\n");
			exit(0);
		}
	}
	return 0;
}

static long load_img() {
	if (img_file == NULL) {
		Log("No image is given. Use the default build-in image.");
		return 4096; // built-in image size
	}

	FILE *fp = fopen(img_file, "rb");
	Assert(fp, "Can not open '%s'", img_file);

	fseek(fp, 0, SEEK_END);
	long size = ftell(fp);

	Log("The image is %s, size = %ld", img_file, size);

	fseek(fp, 0, SEEK_SET);
	rom_buffer_size = size / sizeof(uint8_t);
	rom_buffer = (uint8_t *)malloc(rom_buffer_size * sizeof(uint8_t));
	Assert(rom_buffer != NULL, "ROM memory allocation failed\n");
	
	int ret = fread(rom_buffer, 1, rom_buffer_size, fp);
	Assert(ret == rom_buffer_size, "Read file failed\n");

	fclose(fp);
	return size;
}

static void init_npc() {
	verilatorTop->io_npcState 	= NPC_INIT;

	verilatorTop->reset 			= 1;
	verilatorTop->clock = 0; step_and_dump_wave();
	verilatorTop->clock = 1; step_and_dump_wave();
	verilatorTop->clock = 0; step_and_dump_wave();
	verilatorTop->clock = 1; step_and_dump_wave();
}

static void sim_init() {
    verlatorContextp = new VerilatedContext;
    verlatorTfp = new VerilatedVcdC;
    verilatorTop = new Vtop(verlatorContextp);
    verlatorContextp->traceEverOn(true);
    verilatorTop->trace(verlatorTfp, 1000);
    verlatorTfp->open("single_cycle_cpu.vcd");
}

static void init_reg() {
	for (size_t i = 0; i < REGS_SIZE; i++) {
		regsData[i] = (uint32_t*) grda(i);
	}
}

void init_monitor(int argc, char *argv[]) {
	parse_args(argc, argv);

	init_log(log_file);

	init_elf(elf_file);

	long img_size = load_img();

	init_mem();

	sim_init();
	
	init_npc();

	printf("1\n");

	IFDEF(CONFIG_ITRACE, init_disasm(
		"riscv32" "-pc-linux-gnu"
	));

	init_reg();

	init_difftest(diff_so_file, img_size, difftest_port);

	welcome();
}
