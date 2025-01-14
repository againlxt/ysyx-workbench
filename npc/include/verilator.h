/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 10:38:36
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-11 16:45:57
 * @FilePath: /ysyx-workbench/npc/include/verilator.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#ifndef __VERILATOR_H__
#define __VERILATOR_H__

#include "verilated.h"
#include <verilated_vcd_c.h>
#include <svdpi.h>
#include <iostream>
#include "VysyxSoCFull.h"
#include "VysyxSoCFull___024root.h"

extern VysyxSoCFull* verilatorTop;

extern VerilatedContext* verlatorContextp;
#ifdef CONFIG_WAVE_TRACE
extern VerilatedVcdC* verlatorTfp;
#endif
extern uint32_t npc_dnpc;
extern uint32_t npc_pc;
extern uint32_t base_addr;

#define FREE_VERILATOR() { \
    delete verilatorTop; \
    delete verlatorContextp; \
}

#endif