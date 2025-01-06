# 必答题

## 实现异常响应机制（已完成）

要实现`ecall`调用`isa_raise_intr()`函数返回异常运行地址。

- 在inst.c识别`ecall`命令和`csrrw`命令（不实现无法运行到ecall）
- 在识别到`ecall`命令时调用`isa_raise_intr()`返回异常地址给dnpc实现跳转
- 异常地址在`$(AM_HOME)/am/src/riscv/nemu/cte.c`中的cte_init中可以查看到异常地址已经被存入mtvec寄存器中

## 重新组织Context结构体（已完成）

### 任务

- 实现这一过程中的新指令, 详情请RTFM.
- 理解上下文形成的过程并RTFSC, 然后重新组织`abstract-machine/am/include/arch/$ISA-nemu.h` (如果你选择RISC-V, 则文件名为`riscv.h`) 中定义的`Context`结构体的成员, 使得这些成员的定义顺序和 `abstract-machine/am/src/$ISA/nemu/trap.S`中构造的上下文保持一致.

需要注意的是, 虽然我们目前暂时不使用上文提到的地址空间信息, 但你在重新组织`Context`结构体时仍然需要正确地处理地址空间信息的位置, 否则你可能会在PA4中遇到难以理解的错误.

实现之后, 你可以在`__am_irq_handle()`中通过`printf`输出上下文`c`的内容, 然后通过简易调试器观察触发自陷时的寄存器状态, 从而检查你的`Context`实现是否正确.

### 实现

新指令的实现没什么好说的。

第二个问题的答案主要在于trap.S的代码中，下面是trap.S的代码解读：

```assembly
#define concat_temp(x, y) x ## y
#define concat(x, y) concat_temp(x, y)
#define MAP(c, f) c(f)

#if __riscv_xlen == 32
#define LOAD  lw
#define STORE sw
#define XLEN  4
#else
#define LOAD  ld
#define STORE sd
#define XLEN  8
#endif

#define REGS_LO16(f) \
      f( 1)       f( 3) f( 4) f( 5) f( 6) f( 7) f( 8) f( 9) \
f(10) f(11) f(12) f(13) f(14) f(15)
#ifndef __riscv_e
#define REGS_HI16(f) \
                                    f(16) f(17) f(18) f(19) \
f(20) f(21) f(22) f(23) f(24) f(25) f(26) f(27) f(28) f(29) \
f(30) f(31)
#define NR_REGS 32
#else
#define REGS_HI16(f)
#define NR_REGS 16
#endif

#define REGS(f) REGS_LO16(f) REGS_HI16(f)

#define PUSH(n) STORE concat(x, n), (n * XLEN)(sp);
#define POP(n)  LOAD  concat(x, n), (n * XLEN)(sp);

#define CONTEXT_SIZE  ((NR_REGS + 3 + 1) * XLEN)
#define OFFSET_SP     ( 2 * XLEN)
#define OFFSET_CAUSE  ((NR_REGS + 0) * XLEN)
#define OFFSET_STATUS ((NR_REGS + 1) * XLEN)
#define OFFSET_EPC    ((NR_REGS + 2) * XLEN)

.align 3
.globl __am_asm_trap
__am_asm_trap:
  addi sp, sp, -CONTEXT_SIZE

  MAP(REGS, PUSH)

  csrr t0, mcause
  csrr t1, mstatus
  csrr t2, mepc

  STORE t0, OFFSET_CAUSE(sp)
  STORE t1, OFFSET_STATUS(sp)
  STORE t2, OFFSET_EPC(sp)

  # set mstatus.MPRV to pass difftest
  li a0, (1 << 17)
  or t1, t1, a0
  csrw mstatus, t1

  mv a0, sp
  jal __am_irq_handle

  LOAD t1, OFFSET_STATUS(sp)
  LOAD t2, OFFSET_EPC(sp)
  csrw mstatus, t1
  csrw mepc, t2

  MAP(REGS, POP)

  addi sp, sp, CONTEXT_SIZE
  mret
```

前面的宏定义先不关注，主要关注子程序`__am_asm_trap`。在该子程序中主要进行了一下几方面的代码：

1. 修改栈指针，至添加所有上下文后的栈顶。
2. 将普通系统寄存器数据压入栈中
3. 读取CSR数据并压入栈中
4. 修改mstatus的值
5. 函数参数指针（mv a0, sp）
6. 跳转到`__am_irq_handle`
7. 读出CSR数据
8. 读出普通系统寄存器数据
9. 恢复栈指针（出栈）
10. 返回

可以看到输入参数指针的地址为sp的地址（mv a0, sp），也就是栈顶，根据地址偏移量可得`Context`结构体的参数顺序应该为：通用寄存器、mcause、mstatus、mepc。剩下的`2 * XLEN`存储的就是地址。

## 理解上下文结构体的前世今生（已完成）

你会在`__am_irq_handle()`中看到有一个上下文结构指针`c`, `c`指向的上下文结构究竟在哪里? 这个上下文结构又是怎么来的? 具体地, 这个上下文结构有很多成员, 每一个成员究竟在哪里赋值的? `$ISA-nemu.h`, `trap.S`, 上述讲义文字, 以及你刚刚在NEMU中实现的新指令, 这四部分内容又有什么联系?

- C指向`Context`结构体的第一个成员
- 上下文结构对应了在`trap.s`中压入栈中的值
- 每一个变量的赋值是先将各个变量依序压入栈中，将c指向栈顶（mv a0, sp）后完成最终的赋值
- `riscv.h`定义了上下文结构；`trap.s`保存上下文、调用异常、恢复上下文的工作；`NEMU`实现的新指令提供了异常调用的硬件支持。

## 实现Etrace

只需要在ecall和mret时加入Etrace代码即可，没有什么难度。

# 选做题

## 特殊的原因? (建议二周目思考)

这些程序状态(x86的eflags, cs, eip; mips32的epc, status, cause; riscv32的mepc, mstatus, mcause)必须由硬件来保存吗? 能否通过软件来保存? 为什么?

## 让DiffTest支持异常响应机制 (已完成)

在初始化寄存器的时候，将mstatus寄存器初始化为了0x1800（/home/lxt/ysyx-workbench/nemu/src/isa/riscv32/init.c）

```c
static void restart() {
  /* Set the initial program counter. */
  cpu.pc = RESET_VECTOR;

  /* The zero register is always 0. */
  cpu.gpr[0] = 0;

  /* Init mstatus to 0x1800 to support difftest */
  extern uint32_t csrs[4096];
  csrs[0x300] = 0x1800;

}

void init_isa() {
  /* Load built-in image. */
  memcpy(guest_to_host(RESET_VECTOR), img, sizeof(img));

  /* Initialize this virtual computer system. */
  restart();
}
```



## 异常号的保存

x86通过软件来保存异常号, 没有类似cause的寄存器. mips32和riscv32也可以这样吗? 为什么?

## 对比异常处理与函数调用

我们知道进行函数调用的时候也需要保存调用者的状态: 返回地址, 以及calling convention中需要调用者保存的寄存器. 而CTE在保存上下文的时候却要保存更多的信息. 尝试对比它们, 并思考两者保存信息不同是什么原因造成的.
