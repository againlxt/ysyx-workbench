/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 15:22:10
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-19 15:07:35
 * @FilePath: /ysyx-workbench/npc/include/trace/trace.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __TRACE_H__
#define __TRACE_H__
#include <common.h>

#ifdef CONFIG_ITRACE
#include <trace/itrace.h>
#endif

#ifdef CONFIG_FTRACE
#include <trace/ftrace.h>
#endif

#endif
