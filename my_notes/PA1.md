# PA1

# RTFSC

## 优雅地退出

在cmd_q中将cpu.state切换为stop状态

```c
static int cmd_q(char *args) {
  nemu_state.state = NEMU_QUIT;
  return -1;
}
```

# 简易调试器

## 单步执行 si

通过strtok获取数字`n`，以`n`为参数调用`cpu_exec`

```c
static int cmd_si(char *args) {
  args = strtok(NULL, " ");
  uint64_t n;
  if (args == NULL) n = 1;
  else n = (uint64_t) strtoull(args, NULL, 10);
  
  cpu_exec(n);
  return 0;
}
```

## 打印程序状态 info

通过`strtok`函数获取后续参数

### info r

调用`isa_reg_display`函数，函数实现如下

```c
void isa_reg_display() {
  printf("Reg display begin\n");
  for (int i = 0; i < REGS_SIZE; i++)
  {
    printf("%s:\t%#x\n", regs[i], gpr(i));
  }
  printf("Reg display end\n");
}
```

### info w

调用`print_wp_pool`函数，函数实现如下：

```c
void print_wp_pool() {
  if(wp_pool_is_empty()) log_warn("wp_pool is empty!");
  for (WP *wp = head; wp != NULL; wp = wp->next) {
    print_wp(wp);
  }
}
```

其中监视点结构体如下：

```c
typedef struct watchpoint {
  int NO;
  struct watchpoint *next;

  char expr[128];
  int val;
} WP;
```

包括监视点对应表达式以及表达式的值。

## 表达式求值

包括`token`识别和表达式计算

### token识别 make_token

token种类如结构体数组rule[]中所示：

```c
enum
{
  TK_NOTYPE = 256,
  TK_REG,
  TK_HEX,
  TK_NUMBER,
  TK_NEGETIVE_NUMBER,
  TK_POINTER,
  TK_LBRACKET,
  TK_RBRACKET,
  TK_PLUS,
  TK_SUB,
  TK_MUL,
  TK_DIV,
  TK_EQ,
  TK_UNEQ,
  TK_AND,
  /* TODO: Add more token types */

};

static struct rule
{
  const char *regex;
  int token_type;
} rules[] = {

    /* TODO: Add more rules.
     * Pay attention to the precedence level of different rules.
     */

    {" +", TK_NOTYPE},     // spaces
    {"\\$[\\$0-9a-zA-Z][0-9a-zA-Z]", TK_REG}, // reg
    {"0[xX][0-9a-fA-F]+", TK_HEX}, // hexadecimal number
    {"[0-9]+", TK_NUMBER}, // number
    {"\\(", TK_LBRACKET},  // left bracket
    {"\\)", TK_RBRACKET},  // right bracket
    {"\\+", TK_PLUS},      // plus
    {"-", TK_SUB},         // sub
    {"\\*", TK_MUL},       // mul
    {"/", TK_DIV},         // div
    {"==", TK_EQ},         // equal
    {"!=", TK_UNEQ},       // unequal
    {"&&", TK_AND},        // and
};
```

token识别时调用函数`make_token（e）`，e为表达式字符串。先将rule表中数据记入到`regex_t`类型结构体数组`re[NR_REGEX]`中。然后使用`regexec`函数遍历rules数组匹配相应token。

识别出对应 token时要存入数组`tokens[nr_token]`中对于四则运算符、逻辑运算符、左右括号、等号、不等号等`token`只需要将`tokens[nr_token].type`设置成对应类型，并使用`strcpy`函数复制相印符号到tokens[nr_token].str中。十进制数字也类似，只不过是将相印数字复制。

对于十六进制数、寄存器类型则需要将其转换为对印十进制数再按十进制数类型存入`tokens中`。

特别的对于负数以及指针类型，需要在make_token结束后通过以下语句进行判断：

```c
  for (int i = 0; i < nr_token; i ++) {
    if (tokens[i].type == TK_MUL && (i == 0 || check_left_is_operator(i)) ) {
      tokens[i].type = TK_POINTER;
    }
    if (tokens[i].type == TK_SUB && (i == 0 || check_left_is_operator(i)) ) {
      tokens[i].type = TK_NEGETIVE_NUMBER;
    }
  }
```

### 计算 eval

eval采用递归的方式进行运算，先识别出中心运算符，在将中心运算符两边拆开，继续调用eval运算。

## 扫描内存 x N EXPR

使用`paddr_read`函数读取相印地址的值。



# 如何阅读手册

## selector

selector为逻辑地址中的一个字段，它用来找寻特定的`descriptor`。

selector由部分组成：

1. Index: 在`descriptor table`中寻找指定的`descriptor`的索引。
2. Table Indicator: 指定要找寻的`descriptor table`，GDT或LDT。
3. Requested Privilege Level: 在保护性机制中使用。

![Screenshot from 2024-05-11 11-16-59](/home/lxt/ysyx-workbench/my_answer/PA1.assets/Screenshot from 2024-05-11 11-16-59.png)

## PA1必答题

**画出`1+2+...+100`的程序状态机**

![PA1](/home/lxt/ysyx-workbench/my_answer/PA1.assets/PA1.png)

**理解基础设施**

**RTFM**

**riscv32有哪几种指令格式?** 

文档：The RISC-V Instruction Set Manual Volume I: Unprivileged Architecture Version 20240411

位置：2.2-2.3  pg23-pg25

**LUI指令的行为是什么？**

文档：The RISC-V Instruction Set Manual Volume I: Unprivileged Architecture Version 20240411

位置：2.4  pg27

**mstatus寄存器的结构是怎么样的？**

文档：The RISC-V Instruction Set Manual: Volume II: Privileged Architecture Version 20240411

位置：3.1.6 pg25

**shell命令**

1. `find`：搜索指定目录下的文件。`-type f`表示只搜索普通文件
2. `\( -name "*.c" -o -name "*.h" \)`：这部分是 `find` 命令的条件，用于指定搜索文件名以 `.c` 或 `.h` 结尾的文件。`-name "*.c"` 和 `-name "*.h"` 分别表示文件名以 `.c` 和 `.h` 结尾的文件。`\(` 和 `\)` 用于组合条件，并且 `-o` 表示逻辑或。
3. `| xargs grep -v '^$'`：find命令的输出通过管道传递给`xargs`将每个文件名作为参数传递给后面的命令。`grep -v '^$'` 则用于过滤掉空白行。`grep` 是一个文本搜索工具，`-v` 选项表示反向匹配，`'^$'` 是一个正则表达式，表示空白行。
4. `| wc -l`: 最后，通过管道将 `grep` 命令的输出传递给 `wc -l` 命令来统计非空白行的数量。`wc -l` 命令会计算输入中的行数。

不忽略空白行：

```shell
find ./ -type f -name "*.c" -o -name "*.h" | xargs cat | wc -l
```

忽略空白行：

```shell
find ./ -type f \( -name "*.c" -o -name "*.h" \) | xargs grep -v '^$' | wc -l
```

21339-20606=733

**RTFM**

`-Wall`：启用了GCC中的大多数警告。

`-Werror`：选项会将所有警告视为错误。

这两个结合使用可以强制要求代码没有任何警告，以确保代码的质量和稳定性。
