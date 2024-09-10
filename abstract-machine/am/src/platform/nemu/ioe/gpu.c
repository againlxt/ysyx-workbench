/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-09-02 19:26:47
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/platform/nemu/ioe/gpu.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <nemu.h>
#include <riscv/riscv.h>
#include <stdio.h>

#define SYNC_ADDR (VGACTL_ADDR + 4)
#define SCREEN_W 400
#define SCREEN_H 300

void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
	*cfg = (AM_GPU_CONFIG_T) {
		.present = true, .has_accel = false,
		.width = SCREEN_W, .height = SCREEN_H,
		.vmemsz = SCREEN_H * SCREEN_W * 32
	};
}

void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
	int x = ctl->x, y = ctl->y, w = ctl->w, h = ctl->h;
	ctl->sync = *((uint32_t*) SYNC_ADDR) == 0 ? 0 : 1;
	uint32_t* fb = (uint32_t *) FB_ADDR;
	uint32_t* p = ctl->pixels;

	int index = 0;
	outl(SYNC_ADDR, ctl->sync);
	if (ctl->sync) {
		
		for (size_t i = y ; i < y + h; i++) {
			for (size_t j = x; j < w + x; j++) {
				*(fb + i*SCREEN_W + j) = p[index++];
			}
		}
	}
}

void __am_gpu_status(AM_GPU_STATUS_T *status) {
  	status->ready = true;
}

void __am_gpu_init() {
   int i;
   int w = io_read(AM_GPU_CONFIG).width;
   int h = io_read(AM_GPU_CONFIG).height;
   uint32_t *fb = (uint32_t *)(uintptr_t)FB_ADDR;
   for (i = 0; i < w * h; i ++) fb[i] = 0x00FFFFFF;
   outl(SYNC_ADDR, 1);
}
