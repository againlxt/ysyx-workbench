/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-09-22 19:03:38
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-09-23 16:36:59
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/riscv/nemu/cte.c
 * @Description: 
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <am.h>
#include <riscv/riscv.h>
#include <klib.h>

static Context* (*user_handler)(Event, Context*) = NULL;

Context* __am_irq_handle(Context *c) {
  if (user_handler) {
    Event ev = {0};
    switch (c->mcause) {
      case 11:  ev.event = EVENT_YIELD; break; 
      default: ev.event = EVENT_ERROR; break;
    }

    c = user_handler(ev, c);
    assert(c != NULL);
  }

  return c;
}

extern void __am_asm_trap(void);

bool cte_init(Context*(*handler)(Event, Context*)) {
  // initialize exception entry
  asm volatile("csrw mtvec, %0" : : "r"(__am_asm_trap));

  // register event handler
  user_handler = handler;

  return true;
}

Context *kcontext(Area kstack, void (*entry)(void *), void *arg) {
  #define CONTEXT_SIZE (32 + 4 + 1) * 32
  // Store the stack top pointer of the next process in sp
  asm volatile("lw sp, 4(a0)");

  // Save context
  asm volatile("sw ra,4(sp)");
  asm volatile("sw gp,12(sp)");
  asm volatile("sw tp,16(sp)");
  asm volatile("sw t0,20(sp)");
  asm volatile("sw t1,24(sp)");
  asm volatile("sw t2,28(sp)");
  asm volatile("sw s0,32(sp)");
  asm volatile("sw s1,36(sp)");
  asm volatile("sw a0,40(sp)");
  asm volatile("sw a1,44(sp)");
  asm volatile("sw a2,48(sp)");
  asm volatile("sw a3,52(sp)");
  asm volatile("sw a4,56(sp)");
  asm volatile("sw a5,60(sp)");
  asm volatile("sw a6,64(sp)");
  asm volatile("sw a7,68(sp)");
  asm volatile("sw s2,72(sp)");
  asm volatile("sw s3,76(sp)");
  asm volatile("sw s4,80(sp)");
  asm volatile("sw s5,84(sp)");
  asm volatile("sw s6,88(sp)");
  asm volatile("sw s7,92(sp)");
  asm volatile("sw s8,96(sp)");
  asm volatile("sw s9,100(sp)");
  asm volatile("sw s10,104(sp)");
  asm volatile("sw s11,108(sp)");
  asm volatile("sw t3,112(sp)");
  asm volatile("sw t4,116(sp)");
  asm volatile("sw t5,120(sp)");
  asm volatile("sw t6,124(sp)");
  asm volatile("csrr t0,mcause");
  asm volatile("csrr t1,mstatus");
  asm volatile("csrr t2,mepc");
  asm volatile("sw t0,128(sp)");
  asm volatile("sw t1,132(sp)");
  asm volatile("sw t2,136(sp)");

  Context *context = (Context *) kstack.end;

  return context;
}

void yield() {
#ifdef __riscv_e
  asm volatile("li a5, -1; ecall");
#else
  asm volatile("li a7, -1; ecall");
#endif
}

bool ienabled() {
  return false;
}

void iset(bool enable) {
}
