/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-05-18 10:02:30
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-07-16 15:50:28
 * @FilePath: /ysyx-workbench/nemu/include/sdb.h
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#ifndef __SDB_H__
#define __SDB_H__

#include <common.h>

#define LOG_BUF_LENGTH 64
#define IRINGBUF_SIZE 128  

void device_update();

typedef struct watchpoint {
  int NO;
  struct watchpoint *next;

  char expr[128];
  int32_t val;
} WP;

word_t expr(char *e, bool *success);

void init_wp_pool();
void new_wp();
void free_wp(uint32_t n);
void traverse_watchpoints();
void print_wp_pool();
void print_wp(WP *wp);

#endif
