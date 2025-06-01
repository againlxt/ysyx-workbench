/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 14:26:56
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2025-02-28 11:16:50
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
#include <memory/memory.h>
#ifdef CONFIG_NVBOARD
#include <nvboard.h>
#endif

static char *img_file = NULL;
static char *log_file = NULL;
static char *diff_so_file = NULL;
static char *elf_file = NULL;
static int difftest_port = 1234;

VerilatedContext* verlatorContextp = nullptr;
VysyxSoCFull* verilatorTop = nullptr;
#ifdef CONFIG_WAVE_TRACE
VerilatedVcdC* verlatorTfp = nullptr;
#endif
#ifdef CONFIG_NVBOARD
void nvboard_bind_all_pins(VysyxSoCFull* top);
#endif

extern void sdb_set_batch_mode();
extern void init_log(const char *log_file);
extern void init_elf(const char *elf_file);
#ifdef CONFIG_ITRACE
extern void init_disasm(const char *triple);
#endif
void init_difftest(char *ref_so_file, long img_size, int port);

static void step_and_dump_wave() {
    verilatorTop->eval();
	#ifdef CONFIG_WAVE_TRACE
    verlatorContextp->timeInc(1); // 时间增加
    verlatorTfp->dump(verlatorContextp->time());
	#endif
	#ifdef CONFIG_NVBOARD
	if(verilatorTop->clock == 1) nvboard_update();
	#endif
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
	int ret = fread(guest_to_host_flash(0), size, 1, fp);
	assert(ret == 1);

	fclose(fp);
	return size;
}

static void init_npc() {
	verilatorTop->reset = 1; step_and_dump_wave();
	for (size_t i = 0; i < 20; i++) {
		verilatorTop->clock = 0; step_and_dump_wave();
		verilatorTop->clock = 1; step_and_dump_wave();
	}
}

static void sim_init() {
    verlatorContextp = new VerilatedContext;
    verilatorTop = new VysyxSoCFull(verlatorContextp);
	#ifdef CONFIG_WAVE_TRACE
	verlatorTfp = new VerilatedVcdC;
    verlatorContextp->traceEverOn(true);
    verilatorTop->trace(verlatorTfp, 1000);
    verlatorTfp->open("soc_cpu.vcd");
	#endif
}

void init_monitor(int argc, char *argv[]) {
	parse_args(argc, argv);

	init_log(log_file);
	init_elf(elf_file);
	init_mem();
	init_mrom();
	init_flash();
	init_psram();

	long img_size = load_img();

	sim_init();
	#ifdef CONFIG_NVBOARD
	nvboard_bind_all_pins(verilatorTop);
	nvboard_init();
	#endif
	init_npc();

	IFDEF(CONFIG_ITRACE, init_disasm(
		"riscv32" "-pc-linux-gnu"
	));

	init_difftest(diff_so_file, img_size, difftest_port);

	welcome();
}
