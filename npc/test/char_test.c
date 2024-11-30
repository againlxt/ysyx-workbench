/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-11-26 17:36:19
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-11-30 21:07:09
 * @FilePath: /ysyx-workbench/npc/test/char_test.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#define UART_BASE 0x10000000L
#define UART_TX   0x0
void _start() {
  *(volatile char *)(UART_BASE + UART_TX) = 'A';
  *(volatile char *)(UART_BASE + UART_TX) = '\n';
  while (1);
}
