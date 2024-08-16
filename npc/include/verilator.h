/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-11 10:38:36
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-16 08:19:24
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
#include "Vtop.h"

extern Vtop* verilatorTop;

void step_and_dump_wave();
void sim_init();

#define FREE_VERILATOR() { \
	verlatorTfp->close(); \
    delete verilatorTop; \
    delete verlatorTfp; \
    delete verlatorContextp; \
}

#endif