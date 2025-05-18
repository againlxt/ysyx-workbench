#include <am.h>
#include <riscv/riscv.h>
#include <stdio.h>
#include <klib-macros.h>

#define SCREEN_W 640
#define SCREEN_H 480
#define VGA_BASE 0x21000000

void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
	*cfg = (AM_GPU_CONFIG_T) {
		.present = true, .has_accel = false,
		.width = SCREEN_W, .height = SCREEN_H,
		.vmemsz = SCREEN_H * SCREEN_W * 32
	};
}

void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
	int x = ctl->x, y   = ctl->y, w = ctl->w, h = ctl->h;
	uint32_t* p         = ctl->pixels;
    uint16_t* fb        = (uint16_t *) VGA_BASE;
	volatile int index = 0;
    for (size_t i = y ; i < y + h; i++) {
        for (size_t j = x; j < w + x; j++) {
            *(fb + i*SCREEN_W + j) = (uint16_t) ((((p[index]&0x00ff0000)>>8)&0x0f00) + 
                                                (((p[index]&0x0000ff00)>>4)&0x00f0) +
                                                ((p[index]&0x000000ff)&0x000f));
            index++;
        }
    }
}

void __am_gpu_status(AM_GPU_STATUS_T *status) {
  	status->ready = true;
}

void __am_gpu_init() {}
