/*
 * @Author: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @Date: 2024-10-02 10:52:03
 * @LastEditors: 23060306-Lei Xiao Tian leixiaotian434@gmail.com
 * @LastEditTime: 2024-10-05 20:29:55
 * @FilePath: /ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c
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
      case 11: ev.event = EVENT_YIELD; c->mepc +=4; break; 
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

  Context *context = (Context *) (kstack.end - sizeof(Context));
  memset(context, 0, sizeof(Context));
  context->gpr[10] = (intptr_t) arg;
  context->mepc = (intptr_t) entry;
  context->mstatus = 0x1800;
  context->mcause = 0xB;

  return context;
}

void yield() {
  asm volatile("li a5, -1; ecall");
}

bool ienabled() {
  return false;
}

void iset(bool enable) {
}
