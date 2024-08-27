/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-01-15 09:47:31
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-27 10:18:18
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/platform/nemu/ioe/timer.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <nemu.h>
#include <riscv/riscv.h>

void __am_timer_init() {
	outl(RTC_ADDR, 0);
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  	uptime->us = inl(RTC_ADDR) + ((uint64_t) inl(RTC_ADDR + 4) << 32);
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
