/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-05 20:00:11
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-12 22:39:33
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/sim_main.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include "verilated.h"
#include <verilated_vcd_c.h>
#include <svdpi.h>
#include <iostream>
#include "Vtop.h"
#include "../../include/common.h"
#include "../../include/debug.h"
#include <getopt.h>
#include <unistd.h>

// 全局变量
VerilatedContext* contextp = nullptr;
VerilatedVcdC* tfp = nullptr;
Vtop* top = nullptr;

enum { NPC_RUNNING, NPC_STOP, NPC_END, NPC_ABORT, NPC_QUIT, NPC_INIT };
static uint32_t npc_pc 		= 0x80000000;
static uint32_t base_addr 	= 0x80000000;
typedef struct {
  int state;
} NPCState;
NPCState npc_state = { .state = NPC_STOP };

// ROM 指令集
static unsigned int rom[128] = {
    0x00128913, // addi s2, t0, 1
    0x00228913, // addi s2, t0, 2
    0x00328913, // addi s2, t0, 3
    0x00428913, // addi s2, t0, 4
    0x00100073  // ebreak
};

// 仿真步进并记录波形
void step_and_dump_wave() {
    top->eval();
    contextp->timeInc(1); // 时间增加
    tfp->dump(contextp->time());
}

// 仿真初始化
void sim_init() {
    contextp = new VerilatedContext;
    tfp = new VerilatedVcdC;
    top = new Vtop(contextp);
    contextp->traceEverOn(true);
    top->trace(tfp, 99); // 设置波形深度为99
    tfp->open("single_cycle_cpu.vcd");
}

// 仿真退出
extern "C" void sim_exit();
void sim_exit() {
    step_and_dump_wave(); // 确保最后一步被记录
    tfp->close();
    delete top;
    delete tfp;
    delete contextp;
    exit(0);
}

static char *img_file = NULL;
uint8_t *rom_buffer = NULL;
uint32_t rom_buffer_size = 0;

static int parse_args(int argc, char *argv[]) {
	const struct option table[] = {
		{"help"     , 0 		       , NULL, 'h'},
		{0          , 0                , NULL,  0 },
	};
	int o;
	while ( (o = getopt_long(argc, argv, "-bhl:d:p:e:", table, NULL)) != -1) {
		switch (o) {
		case 1: img_file = optarg; return 0;
		default:
			printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
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

	Log("The image is %s, size = %ld\n", img_file, size);

	fseek(fp, 0, SEEK_SET);
	rom_buffer_size = size / sizeof(uint8_t);
	rom_buffer = (uint8_t *)malloc(rom_buffer_size * sizeof(uint8_t));
	Assert(rom_buffer != NULL, "ROM memory allocation failed\n");
	
	int ret = fread(rom_buffer, 1, rom_buffer_size, fp);
	Assert(ret != rom_buffer_size, "Read file failed\n");

	fclose(fp);
	return size;
}

static void init_npc() {
	top->io_npcState 	= NPC_INIT;
	top->io_pcInput 	= npc_pc;
	top->io_memData 	= (*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
	(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
	top->reset 			= 1;

	for (int i = 0; i < 2; ++i) {
        top->clock = 0; step_and_dump_wave();
		top->clock = 1; step_and_dump_wave();
    }
}

// 主函数
int main(int argc, char *argv[]) {
	parse_args(argc, argv);
	load_img();
	sim_init();	
	init_npc();

	// RUNNING
	top->io_npcState 	= NPC_RUNNING;
	top->reset 			= 0;
	top->clock = 0; step_and_dump_wave();
	top->io_memData =  
		(*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
	npc_pc = top->io_nextPC;
	top->io_pcInput = npc_pc;
	top->io_memData =  
		(*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
	top->clock = 1; step_and_dump_wave();
	
	for (int i = 0; i < 30; i++) {
		top->clock = 0; step_and_dump_wave();

		top->io_memData =  
		(*(rom_buffer+(npc_pc-base_addr))) + (*(rom_buffer+(npc_pc-base_addr)+1) << 8) +
		(*(rom_buffer+(npc_pc-base_addr)+2) << 16) + (*(rom_buffer+(npc_pc-base_addr)+3) << 24);
		
		npc_pc = top->io_nextPC;
		top->io_pcInput = npc_pc;

		top->clock = 1; step_and_dump_wave();
	}

    sim_exit();
    return 0;

}
