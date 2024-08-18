/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 08:16:32
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-18 21:21:53
 * @FilePath: /ysyx-workbench/npc/include/debug.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __DEBUG_H__
#define __DEBUG_H__

#include <common.h>
#include <stdio.h>
#include <utils.h>

#define Log(format, ...) \
    _Log(ANSI_FMT("[%s:%d %s] " format, ANSI_FG_BLUE) "\n", \
        __FILE__, __LINE__, __func__, ## __VA_ARGS__)

#define Assert(cond, format, ...) \
  do { \
    if (!(cond)) { \
		fprintf(stderr, format "\n", ##__VA_ARGS__); \
		extern void assert_fail_msg(); \
      	assert_fail_msg(); \
    	assert(cond); \
    } \
  } while (0)

#define panic(format, ...) Assert(0, format, ## __VA_ARGS__)

#define TODO() panic("please implement me")

#endif
