# 理解一条指令在nemu中的运行过程

在输入`si n`指令后，nemu会调用cpu_exec指令模拟CPU运行。

其代码如下：

```c
void cpu_exec(uint64_t n) {
  g_print_step = (n < MAX_INST_TO_PRINT);
  switch (nemu_state.state) {
    case NEMU_END: case NEMU_ABORT:
      printf("Program execution has ended. To restart the program, exit NEMU and run again.\n");
      return;
    default: nemu_state.state = NEMU_RUNNING;
  }

  uint64_t timer_start = get_time();

  execute(n);

  uint64_t timer_end = get_time();
  g_timer += timer_end - timer_start;

  switch (nemu_state.state) {
    case NEMU_RUNNING: nemu_state.state = NEMU_STOP; break;

    case NEMU_END: case NEMU_ABORT:
      Log("nemu: %s at pc = " FMT_WORD,
          (nemu_state.state == NEMU_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
           (nemu_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
            ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
          nemu_state.halt_pc);
      // fall through
    case NEMU_QUIT: statistic();
  }
}
```

先通过switch语句判断当前nemu状态是否处于结束状态，如果为结束状态则会打印结束信息并退出。如果不为结束状态则会将状态默认为运行状态。

之后该函数会使用输入的参数`n`调用函数`execute`。

函数代码如下：

```c
static void execute(uint64_t n) {
  Decode s;
  for (;n > 0; n --) {
    exec_once(&s, cpu.pc);
    g_nr_guest_inst ++;
    trace_and_difftest(&s, cpu.pc);
    if (nemu_state.state != NEMU_RUNNING) break;
    IFDEF(CONFIG_DEVICE, device_update());
  }
}
```

关于Decode结构体：

```c
typedef struct Decode {
  vaddr_t pc;	// 当前运行的PC地址
  vaddr_t snpc; // static next pc
  vaddr_t dnpc; // dynamic next pc
  ISADecodeInfo isa;	//标识当前操作系统
  IFDEF(CONFIG_ITRACE, char logbuf[128]);	//代码追踪时使用
} Decode;
```

再来看函数`exec_once`

```c
static void exec_once(Decode *s, vaddr_t pc) {
  s->pc = pc;
  s->snpc = pc;
  isa_exec_once(s);
  cpu.pc = s->dnpc;
  ...
}
```

后面部分主要是代码追踪的作用。

先看前半部分代码先将当前pc和静态pc都赋值为cpu.pc即当前pc地址，然后调用`isa_exec_once`，最后将cpu.pc赋值为动态pc地址。

关于`isa_exec_once`函数：

```c
int isa_exec_once(Decode *s) {
  s->isa.inst.val = inst_fetch(&s->snpc, 4);
  return decode_exec(s);
}
```

第一行代码主要实现取址功能较为简单。

后执行译码功能调用`decode_exec`函数，该函数代码如下：

```c
static int decode_exec(Decode *s) {
  int rd = 0;	// 操作数寄存器号码
  word_t src1 = 0, src2 = 0, imm = 0;	// 两个源操作数和立即数
  s->dnpc = s->snpc;

#define INSTPAT_INST(s) ((s)->isa.inst.val)
#define INSTPAT_MATCH(s, name, type, ... /* execute body */ ) { \
  decode_operand(s, &rd, &src1, &src2, &imm, concat(TYPE_, type)); \
  __VA_ARGS__ ; \
}

  INSTPAT_START();
  INSTPAT("??????? ????? ????? ??? ????? 00101 11", auipc  , U, R(rd) = s->pc + imm);
  INSTPAT("??????? ????? ????? 100 ????? 00000 11", lbu    , I, R(rd) = Mr(src1 + imm, 1));
  INSTPAT("??????? ????? ????? 000 ????? 01000 11", sb     , S, Mw(src1 + imm, 1, src2));

  INSTPAT("0000000 00001 00000 000 00000 11100 11", ebreak , N, NEMUTRAP(s->pc, R(10))); // R(10) is $a0
  INSTPAT("??????? ????? ????? ??? ????? ????? ??", inv    , N, INV(s->pc));
  INSTPAT_END();

  R(0) = 0; // reset $zero to 0

  return 0;
}
```

将宏`INSTPAT_START`、`INSTPAT`、`INSTPAT_END`展开

```c
{ const void ** __instpat_end = &&__instpat_end_;
do {
  uint64_t key, mask, shift;
  pattern_decode("??????? ????? ????? ??? ????? 00101 11", 38, &key, &mask, &shift);
  if ((((uint64_t)s->isa.inst.val >> shift) & mask) == key) {
    {
      decode_operand(s, &rd, &src1, &src2, &imm, TYPE_U);
      R(rd) = s->pc + imm;
    }
    goto *(__instpat_end);
  }
} while (0);
// ...
__instpat_end_: ; }
```

其中`patter_decode`模式匹配译码函数声明如下：

```c
static inline void pattern_decode(const char *str, int len,
    uint64_t *key, uint64_t *mask, uint64_t *shift) {
  uint64_t __key = 0, __mask = 0, __shift = 0;
#define macro(i) \
  if ((i) >= len) goto finish; \
  else { \
    char c = str[i]; \
    if (c != ' ') { \
      Assert(c == '0' || c == '1' || c == '?', \
          "invalid character '%c' in pattern string", c); \
      __key  = (__key  << 1) | (c == '1' ? 1 : 0); \
      __mask = (__mask << 1) | (c == '?' ? 0 : 1); \
      __shift = (c == '?' ? __shift + 1 : 0); \
    } \
  }
```

`pattern_decode`能够计算出输入字符串匹配的字段（key）、掩码（mask）、以及最高位距离第一个有效字符的位移（shift）。在这之后的if语句通过将命令位移后与掩码相与的形式可以检查是否匹配相应字段。

所以`decode_exec`实际上就是遍历所有格式，来判断该命令是哪条命令。

至此函数`exec_once`运行完毕。

## 个人认为可改进的点

在译码时有遍历命令格式来匹配命令的行为，个人认为可以设置一个计数器来记录下所有命令的使用次数，隔一段时间或者隔一定的运行次数来根据使用命令次数的多少来对命令列表重新排序，这样可能能够改善一定的性能。

# 完成RISCV32M

为通过测试

mul-longlong

recursion
