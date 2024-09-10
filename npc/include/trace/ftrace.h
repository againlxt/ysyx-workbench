/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-19 14:56:37
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-19 16:05:24
 * @FilePath: /ysyx-workbench/npc/include/trace/ftrace.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __FTRACE_H__
#define __FTRACE_H__
#include <elf.h>

extern Elf32_Sym *find_func_call (vaddr_t next_pc);
extern char *find_string (Elf32_Sym *func);
extern uint32_t ftrace_call_depth;
#endif