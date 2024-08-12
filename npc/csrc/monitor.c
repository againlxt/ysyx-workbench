/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 08:08:15
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-11 14:31:21
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/monitor.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <getopt.h>
#include "../../include/verilator.h"
#include "../../include/common.h"

static char *img_file = NULL;
static char *elf_file = NULL;
uint8_t *rom_buffer = NULL;
uint32_t rom_buffer_size = 0;

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
	Assert(rom_buffer == NULL, "ROM memory allocation failed\n");

	size_t result = fread(rom_buffer, sizeof(uint8_t), rom_buffer_size, img_file);
	Assert(result == rom_buffer_size, "ROM init failed");

	fclose(fp);
	return size;
}

static int parse_args(int argc, char *argv[]) {
  const struct option table[] = {
	{"elf"		, required_argument, NULL, 'e'},
    {"help"     , no_argument      , NULL, 'h'},
    {0          , 0                , NULL,  0 },
  };
  int o;
  while ( (o = getopt_long(argc, argv, "-bhl:d:p:e:", table, NULL)) != -1) {
    switch (o) {
	  case 'e':	elf_file = optarg; break;
      case 1: img_file = optarg; return 0;
      default:
        printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
		printf("\t-e,--elf=ELF			  input elf file\n");
        printf("\n");
        exit(0);
    }
  }
  return 0;
}

void init_monitor(int argc, char *argv[]) {
	/* Perform some global initialization. */

	/* Parse arguments. */
	parse_args(argc, argv);

	/* Load the image to memory. This will overwrite the built-in image. */
  	long img_size = load_img();
}
