/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-09-01 15:24:21
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/platform/nemu/ioe/input.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <nemu.h>
#include <riscv/riscv.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
	int code = (uint32_t)inl(KBD_ADDR);
	if(KEYDOWN_MASK < code) {
		kbd->keycode = code - KEYDOWN_MASK;
		kbd->keydown = 1;
	}
	else {
		kbd->keycode = code;
		kbd->keydown = 0;
	}
}
