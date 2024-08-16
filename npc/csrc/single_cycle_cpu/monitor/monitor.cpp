/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-14 14:26:56
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 15:31:53
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/monitor/monitor.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
#include <getopt.h>
#include <verilator.h>

static char *img_file = NULL;
uint8_t *rom_buffer = NULL;
uint32_t rom_buffer_size = 0;

void sdb_set_batch_mode();

static int parse_args(int argc, char *argv[]) {
	const struct option table[] = {
		{"batch"    , no_argument      , NULL, 'b'},
		{"help"     , 0 		       , NULL, 'h'},
		{0          , 0                , NULL,  0 },
	};
	int o;
	while ( (o = getopt_long(argc, argv, "-bhl:d:p:e:", table, NULL)) != -1) {
		switch (o) {
			case 'b': sdb_set_batch_mode(); break;
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
	Assert(ret == rom_buffer_size, "Read file failed\n");

	fclose(fp);
	return size;
}

void init_monitor(int argc, char *argv[]) {
	parse_args(argc, argv);

	load_img();
}
