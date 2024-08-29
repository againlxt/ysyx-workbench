/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-29 20:14:10
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/platform/nemu/ioe/timer.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <nemu.h>
#include <riscv/riscv.h>
#include <stdio.h>

void __am_timer_init() {
	io_write(AM_TIMER_RTC, 0, 0, 0, 0, 0, 1900);
	io_write(AM_TIMER_UPTIME, 0);
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  	uptime->us = io_read(AM_TIMER_UPTIME).us;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
