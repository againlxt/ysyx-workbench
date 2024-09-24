# 必做题

## 实现上下文切换

### yield-os的工作机制

```c
#include <am.h>
#include <klib-macros.h>

#define STACK_SIZE (4096 * 8)
typedef union {
  uint8_t stack[STACK_SIZE];
  struct { Context *cp; };
} PCB;
static PCB pcb[2], pcb_boot, *current = &pcb_boot;

static void f(void *arg) {
  while (1) {
    putch("?AB"[(uintptr_t)arg > 2 ? 0 : (uintptr_t)arg]);
    for (int volatile i = 0; i < 100000; i++) ;
    yield();
  }
}

static Context *schedule(Event ev, Context *prev) {
  current->cp = prev;
  current = (current == &pcb[0] ? &pcb[1] : &pcb[0]);
  return current->cp;
}

int main() {
  cte_init(schedule);
  pcb[0].cp = kcontext((Area) { pcb[0].stack, &pcb[0] + 1 }, f, (void *)1L);
  pcb[1].cp = kcontext((Area) { pcb[1].stack, &pcb[1] + 1 }, f, (void *)2L);
  yield();
  panic("Should not reach here!");
}
```

我们需要实现的工作流程如下：

在执行命令`make clean ARCH=riscv32-nemu`先初始化上下文，以schedule作为异常入口，调用cte_init。初始化之后，将两个线程的上下文分别创建，并存入对应线程PCB的cp指针中。

调用yield后，先进入异常`schedule`中，根据`cte.c`中的代码：

```c
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
```

`schedule`会将下一个线程的上下文返回，而`__am_irq_handle`也会将该上下文作为返回值返回，返回后进入`__am_asm_trap`。接下来我们要根据这个返回的上下问调用`f`，`f`打印信息后会再次调用异常`__am_asm_trap`，而这次`schedule`会返回与上次不同的上下文，如此循环往复。

# 选做题

##  不同进程为什么需要使用不同的栈空间?（已解决）

如果不同的进程共享同一个栈空间, 会发生什么呢?

当进程A,B,C压栈进入同一个栈空间，当A需要弹出时，必定会影响BC在栈中存储的数据，而且当bc调用数据时先要弹出A，如此进程间的切换就不成立了。