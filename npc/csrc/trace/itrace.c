/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-08-17 15:16:22
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-17 16:56:30
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/trace/itrace.cpp
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <utils.h>
#include <trace/itrace.h>

#ifdef CONFIG_ITRACE

#define LOG_LENGTH 128
#define LOG_POOL_SIZE 20

typedef struct iringbufnode {
    char log[LOG_LENGTH];
    struct iringbufnode *next;
} IRBN;

static IRBN *log_pool[LOG_POOL_SIZE] = {};
static IRBN *head = NULL, *last = NULL;
static size_t ringbufcount = 0;

void new_irbn(const char *str) {
    char buf[LOG_LENGTH] = "";
    if (strlen(str) > LOG_LENGTH - 5) {
        fprintf(stderr, "Error: Log entry too long\n");
        return;
    }
    strcpy(buf, str);

    IRBN *node = (IRBN *)calloc(1, sizeof(IRBN));
    if (!node) {
        fprintf(stderr, "Error: Memory allocation failed\n");
        return;
    }
    strcpy(node->log, buf);

    if (ringbufcount == 0) {
        node->next = node;  // 初始环
        head = node;
        last = node;
        log_pool[0] = node;
    } else if (ringbufcount >= LOG_POOL_SIZE) {
        head = head->next;
        last->next = node;
        node->next = head;
        last = node;

        free(log_pool[ringbufcount % LOG_POOL_SIZE]);
        log_pool[ringbufcount % LOG_POOL_SIZE] = node;
    } else {
        last->next = node;
        node->next = head;
        last = node;
        log_pool[ringbufcount] = node;
    }

    ringbufcount++;
}

void iringbuf_log() {
    if (ringbufcount == 0) return;
    log_write("---------- Instruction Trace ----------\n");
    
    IRBN *node = head;
    size_t count = ringbufcount > LOG_POOL_SIZE ? LOG_POOL_SIZE : ringbufcount;
    
    for (size_t i = 0; i < count; i++) {
        log_write("%s\n", node->log);
        node = node->next;
    }
    log_write("----------------- End -----------------\n");

    // 释放内存
    for (size_t i = 0; i < count; i++) {
        IRBN *temp = head;
        head = head->next;
        free(temp);
    }

    // 重置指针
    head = NULL;
    last = NULL;
    ringbufcount = 0;
}

#endif
