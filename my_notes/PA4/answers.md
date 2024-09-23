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

在执行命令`make clean ARCH=riscv32-nemu`先初始化上下文，以schedule作为异常入口，调用cte_init（定义在）。

### 原理

`yield-os`与`CTE`中上下文切换的逻辑如下：在上一个异常结束时（恢复上下文之前），跳转到下一个异常。具体流程如下：

1. 创建内核线程上下文
2. 切换到下一个异常

可以发现这个逻辑与普通的异常执行逻辑并无区别。所以只需要在内核中执行和创建普通上下文一样的操作即可。普通的上下文包含如下信息：

1. 32个普通系统寄存器
2. mcause、mstatus、mepc
3. 地址空间

对于kcontext函数：

```c
Context *kcontext(Area kstack, void (*entry)(void *), void *arg);
```

对于32个普通系统寄存器中栈指针（sp寄存器）要指向`kstack.end`，CONTEXT_SIZE为`(32 + 3 + 1) * 32`。对于要切换的线程f：

```
static void f(void *arg)
```

a0寄存器要指向arg（暂时不用实现）。其他的保持。

对于CSR寄存器，mcause要改变为f对应的mcause，mstatus保持不变，不关心mepc（`context()`要求内核线程不能从`entry`返回, 否则其行为是未定义的）。



# 选做题

##  不同进程为什么需要使用不同的栈空间?

如果不同的进程共享同一个栈空间, 会发生什么呢?