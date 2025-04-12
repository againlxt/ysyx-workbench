/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 14:47:50
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-18 20:47:56
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/utils/log.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */

#include <common.h>

extern uint64_t g_nr_guest_inst;

FILE *log_fp = NULL;

void init_log(const char *log_file) {
  log_fp = stdout;
  if (log_file != NULL) {
    FILE *fp = fopen(log_file, "w");
    Assert(fp, "Can not open '%s'", log_file);
    log_fp = fp;
  }
  Log("Log is written to %s", log_file ? log_file : "stdout");
}

bool log_enable() {
  return MUXDEF(CONFIG_TRACE, (g_nr_guest_inst >= CONFIG_TRACE_START) &&
         (g_nr_guest_inst <= CONFIG_TRACE_END), false);
}
