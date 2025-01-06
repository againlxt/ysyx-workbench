# AM和NEMU的Makefile文件解读

## AM与NEMU中间的参数传递

## bin文件生成

在`$(AM_HOME)/scripts/platform`目录下的nemu.mk文件中有关于bin文件生成的代码，如下：

```makefile
image: $(IMAGE).elf
	@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
	@echo + OBJCOPY "->" $(IMAGE_REL).bin
	@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin
```

先看依赖文件`$(IMAGE).elf`是如何生成的

### 依赖

#### $(IMAGE).elf生成

关于变量`$(IMAGE)`有如下代码：

```makefile
IMAGE_REL = build/$(NAME)-$(ARCH)
IMAGE     = $(abspath $(IMAGE_REL))
```



在`$(AM_HOME)`目录下的Makefile文件有关于`$(IMAGE).elf`生成的代码，如下：

```makefile
### Rule (link): objects (`*.o`) and libraries (`*.a`) -> `IMAGE.elf`, the final ELF binary to be packed into image (ld)
$(IMAGE).elf: $(OBJS) am $(LIBS)
	@echo + LD "->" $(IMAGE_REL).elf
	@$(LD) $(LDFLAGS) -o $(IMAGE).elf --start-group $(LINKAGE) --end-group
```

同样的先看依赖文件，这些文件也在该Makefile文件下：

##### 依赖

```makefile
...
OBJS      = $(addprefix $(DST_DIR)/, $(addsuffix .o, $(basename $(SRCS))))
...
LIBS     := $(sort $(LIBS) am klib) # lazy evaluation ("=") causes infinite recursions
# gpt代码解析如下
# LIBS := $(sort $(LIBS) am klib) 使用即时求值 := 来避免无限递归问题，同时确保在定义时就将 LIBS 固定为排序后的结果。这使得Makefile更稳定，避免了由于变量自身引用引发的递归计算问题
...
$(LIBS): %:
	@$(MAKE) -s -C $(AM_HOME)/$* archive
...
```

`OBJS`可以得出结论其为`$(DST_DIR)/$(SRCS).o`，对于我来说也就是位于`./build/riscv32-nemu`下的所有.o文件，`.`指的是执行make命令的目录。

关于`LIBS`，在`LIBS`为空时，会对`LIBS`、`am`、`klib`进行排序，结果为`am klib`。

`$(LIBS): %:`: 这部分表示对于 `$(LIBS)` 中的每一个库文件，都会应用后面的命令。`%` 是一个通配符，它匹配 `$(LIBS)` 中的每一个库文件名。

`@$(MAKE) -s -C $(AM_HOME)/$* archive`: 这条命令表示在每个库文件对应的目录中执行 `make archive` 命令。

- `@`: 这个符号表示不打印这条命令本身，仅打印命令的输出。
- `$(MAKE)`: 这是调用 `make` 命令。
- `-s`: 这个选项表示静默模式，不输出执行的命令，只输出命令的结果。
- `-C $(AM_HOME)/$*`: 这个选项表示在目录 `$(AM_HOME)/$*` 中执行命令。`$*` 会被替换为通配符 `%` 所匹配的库文件名。
- `archive`: 这是要在目标目录中执行的 `make` 目标。

**示例**

假设 `$(LIBS)` 包含以下库文件：

```
makefile
复制代码
LIBS := lib1 lib2 lib3
```

然后 `$(MAKE) -s -C $(AM_HOME)/lib1 archive` 会在目录 `$(AM_HOME)/lib1` 中执行 `make archive`，以此类推，对于 `lib2` 和 `lib3` 也是如此。



##### 生成逻辑

现在来看`$(IMAGE).elf`的生成逻辑

第一条命令：

```makefile
@echo + LD "->" $(IMAGE_REL).elf
@$(LD) $(LDFLAGS) -o $(IMAGE).elf --start-group $(LINKAGE) --end-group
```

`$(LD)`是一个交叉编译器，`-o`选项的功能是指定输出文件，这条语句的意思是：

`@$(LD) $(LDFLAGS) -o $(IMAGE).elf --start-group $(LINKAGE) --end-group`：

- 这是实际的链接命令。
- `$(LD)` 是链接器命令，根据前面的定义应该是 `$(CROSS_COMPILE)ld`。
- `$(LDFLAGS)` 是链接器的选项，用于指定链接时的各种标志和参数。
- `-o $(IMAGE).elf` 指定生成的输出文件名为 `$(IMAGE).elf`。
- `--start-group $(LINKAGE) --end-group` 包围了 `$(LINKAGE)`，这通常用于指定要链接的库文件或者对象文件列表，`--start-group` 和 `--end-group` 会告诉链接器将其内部的目标文件链接起来。

其中`$(LINKAGE)`代表的东西如下：

```makefile
LINKAGE   = $(OBJS) \
  $(addsuffix -$(ARCH).a, $(join \
    $(addsuffix /build/, $(addprefix $(AM_HOME)/, $(LIBS))), \
    $(LIBS) ))
```

`$(OBJS)`前面已经说明过，是.o文件的集合

后面一段生成的就是类似`am-riscv32-nemu.a`的文件名。

也就是说，`$(IMAGE).elf`文件是`./build/riscv32-nemu`下所有.o文件和`./build`下`$(LIBS)-riscv32-nemu.a`文件的一个映像文件。

### 生成逻辑

```makefile
@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
@echo + OBJCOPY "->" $(IMAGE_REL).bin
@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin
```

第一条代码是将`$(IMAGE).elf`反汇编生成的汇编代码输出到`$(IMAGE).txt`

第二条是输出到命令行代表执行了这部分命令

## 执行`make ARCH=riscv32-nemu ALL=dummy run`时makefile的工作流程

### cpu-tests目录下的Makefile

在cpu-tests目录下的Makefile源码如下所示：

```makefile
ALL = $(basename $(notdir $(shell find tests/. -name "*.c")))

all: $(addprefix Makefile., $(ALL))
	@echo "test list [$(words $(ALL)) item(s)]:" $(ALL)

$(ALL): %: Makefile.%

Makefile.%: tests/%.c latest
	@/bin/echo -e "NAME = $*\nSRCS = $<\ninclude $${AM_HOME}/Makefile" > $@
	@if make -s -f $@ ARCH=$(ARCH) $(MAKECMDGOALS); then \
		printf "[%14s] $(COLOR_GREEN)PASS$(COLOR_NONE)\n" $* >> $(RESULT); \
	else \
		printf "[%14s] $(COLOR_RED)***FAIL***$(COLOR_NONE)\n" $* >> $(RESULT); \
	fi
	-@rm -f Makefile.$*

run: all
	@cat $(RESULT)
	@rm $(RESULT)

gdb: all

clean:
	rm -rf Makefile.* build/
```

输入命令`make ARCH=riscv32-nemu ALL=dummy run -nB`会输出一下日志：

```shell
rm -rf Makefile.* build/
/bin/echo -e "NAME = dummy\nSRCS = tests/dummy.c\ninclude ${AM_HOME}/Makefile" > Makefile.dummy
if make -s -f Makefile.dummy ARCH=riscv32-nemu clean run; then \
        printf "[%14s] \033[1;32mPASS\033[0m\n" dummy >> .result; \
else \
        printf "[%14s] \033[1;31m***FAIL***\033[0m\n" dummy >> .result; \
fi
rm -f Makefile.dummy
echo "test list [1 item(s)]:" dummy
cat .result
rm .result
```

也就是在运行该命令时会建立一个临时的Makefile文件，也就是Makefile.dummy，该文件包含的东西如下：

```makefile
NAME = dummy
SRCS = tests/dummy.c
include ${AM_HOME}/Makefile
```

之后的一条命令

```shell
make -s -f Makefile.dummy ARCH=riscv32-nemu clean run
```

- `-s`：安静模式，抑制大部分输出
- `-f`：使用临时生成的Makefile文件

解析来我们再来看AM中的Makefile文件是如何运行的。

### AM中的Makefile

可以看到这里执行的命令有两条`clean`和`run`

`clean`的运行逻辑如下：

```Makefile
clean:
	rm -rf Makefile.html $(WORK_DIR)/build/
.PHONY: clean
```

`run`的运行逻辑在nemu.mk中，因为我们指定了`ARCH=riscv32-nemu`

```makefile
image: $(IMAGE).elf
	@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
	@echo + OBJCOPY "->" $(IMAGE_REL).bin
	@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin

run: image
	$(MAKE) -C $(NEMU_HOME) ISA=$(ISA) run ARGS="$(NEMUFLAGS)" IMG=$(IMAGE).bin
```

`image`的生成前文已经讲述，接下来我们关注`run`的部分

- `-c`能够指定运行make的文件夹，在这里也就是指定make命令运行在nemu文件夹下
- `ARGS="$(NEMUFLAGS)" IMG=$(IMAGE).bin`设置了环境变量`ARGS`、`IMG`

### NEMU的Makefile

可以看到只执行了run一条规则，而run规则定义在nemu的native.mk中，native.mk的源码如下：

```makefile
-include $(NEMU_HOME)/../Makefile
include $(NEMU_HOME)/scripts/build.mk

include $(NEMU_HOME)/tools/difftest.mk

compile_git:
	$(call git_commit, "compile NEMU")
$(BINARY):: compile_git

# Some convenient rules

override ARGS ?= --log=$(BUILD_DIR)/nemu-log.txt
override ARGS += $(ARGS_DIFF)

# Command to execute NEMU
IMG ?=
NEMU_EXEC := $(BINARY) $(ARGS) $(IMG)

run-env: $(BINARY) $(DIFF_REF_SO)

run: run-env
	$(call git_commit, "run NEMU")
	$(NEMU_EXEC)

gdb: run-env
	$(call git_commit, "gdb NEMU")
	gdb -s $(BINARY) --args $(NEMU_EXEC)

clean-tools = $(dir $(shell find ./tools -maxdepth 2 -mindepth 2 -name "Makefile"))
$(clean-tools):
	-@$(MAKE) -s -C $@ clean
clean-tools: $(clean-tools)
clean-all: clean distclean clean-tools

.PHONY: run gdb run-env clean-tools clean-all $(clean-tools)
```

`run`规则执行前，需要执行`run-env`规则，`run-env`规则如下：

```makefile
run-env: $(BINARY) $(DIFF_REF_SO)
```

`$(BINARY)`定义在build.mk下：

```makefile
.DEFAULT_GOAL = app

# Add necessary options if the target is a shared library
ifeq ($(SHARE),1)
SO = -so
CFLAGS  += -fPIC -fvisibility=hidden
LDFLAGS += -shared -fPIC
endif

WORK_DIR  = $(shell pwd)
BUILD_DIR = $(WORK_DIR)/build

INC_PATH := $(WORK_DIR)/include $(INC_PATH)
OBJ_DIR  = $(BUILD_DIR)/obj-$(NAME)$(SO)
BINARY   = $(BUILD_DIR)/$(NAME)$(SO)

# Compilation flags
ifeq ($(CC),clang)
CXX := clang++
else
CXX := g++
endif
LD := $(CXX)
INCLUDES = $(addprefix -I, $(INC_PATH))
CFLAGS  := -O2 -MMD -Wall -Werror $(INCLUDES) $(CFLAGS)
LDFLAGS := -O2 $(LDFLAGS)

OBJS = $(SRCS:%.c=$(OBJ_DIR)/%.o) $(CXXSRC:%.cc=$(OBJ_DIR)/%.o)

# Compilation patterns
$(OBJ_DIR)/%.o: %.c
	@echo + CC $<
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c -o $@ $<
	$(call call_fixdep, $(@:.o=.d), $@)

$(OBJ_DIR)/%.o: %.cc
	@echo + CXX $<
	@mkdir -p $(dir $@)
	@$(CXX) $(CFLAGS) $(CXXFLAGS) -c -o $@ $<
	$(call call_fixdep, $(@:.o=.d), $@)

# Depencies
-include $(OBJS:.o=.d)

# Some convenient rules

.PHONY: app clean

app: $(BINARY)

$(BINARY):: $(OBJS) $(ARCHIVES)
	@echo + LD $@
	@$(LD) -o $@ $(OBJS) $(LDFLAGS) $(ARCHIVES) $(LIBS)

clean:
	-rm -rf $(BUILD_DIR)
```

`$(BINARY)`为`BINARY   = $(BUILD_DIR)/$(NAME)$(SO)`，即可执行程序。

`$(ARGS)`根据AM中`nemu.mk`的输入为`NEMUFLAGS += -l $(shell dirname $(IMAGE).elf)/nemu-log.txt`，即主函数的输入参数。

`$(IMG)`根据AM中`nemu.mk`的输入为`$(IMAGE).bin`，根据之前的分析可得为`dummy-riscv32-nemu.bin`。

## 完成AM批处理模式启动NEMU的练习

阅读nemu中的代码`nemu_main.c`、`monitor.c`如下：

```c
#include <common.h>

void init_monitor(int, char *[]);
void am_init_monitor();
void engine_start();
int is_exit_status_bad();

int main(int argc, char *argv[]) {
  /* Initialize the monitor. */
#ifdef CONFIG_TARGET_AM
  am_init_monitor();
#else
  init_monitor(argc, argv);
#endif

  /* Start engine. */
  engine_start();

  return is_exit_status_bad();
}
```

```c
#include <isa.h>
#include <memory/paddr.h>

void init_rand();
void init_log(const char *log_file);
void init_mem();
void init_difftest(char *ref_so_file, long img_size, int port);
void init_device();
void init_sdb();
void init_disasm(const char *triple);

static void welcome() {
  Log("Trace: %s", MUXDEF(CONFIG_TRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));
  IFDEF(CONFIG_TRACE, Log("If trace is enabled, a log file will be generated "
        "to record the trace. This may lead to a large log file. "
        "If it is not necessary, you can disable it in menuconfig"));
  Log("Build time: %s, %s", __TIME__, __DATE__);
  printf("Welcome to %s-NEMU!\n", ANSI_FMT(str(__GUEST_ISA__), ANSI_FG_YELLOW ANSI_BG_RED));
  printf("For help, type \"help\"\n");
}

#ifndef CONFIG_TARGET_AM
#include <getopt.h>

void sdb_set_batch_mode();

static char *log_file = NULL;
static char *diff_so_file = NULL;
static char *img_file = NULL;
static int difftest_port = 1234;

static long load_img() {
  if (img_file == NULL) {
    Log("No image is given. Use the default build-in image.");
    return 4096; // built-in image size
  }

  FILE *fp = fopen(img_file, "rb");
  Assert(fp, "Can not open '%s'", img_file);

  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);

  Log("The image is %s, size = %ld", img_file, size);

  fseek(fp, 0, SEEK_SET);
  int ret = fread(guest_to_host(RESET_VECTOR), size, 1, fp);
  assert(ret == 1);

  fclose(fp);
  return size;
}

static int parse_args(int argc, char *argv[]) {
  const struct option table[] = {
    {"batch"    , no_argument      , NULL, 'b'},
    {"log"      , required_argument, NULL, 'l'},
    {"diff"     , required_argument, NULL, 'd'},
    {"port"     , required_argument, NULL, 'p'},
    {"help"     , no_argument      , NULL, 'h'},
    {0          , 0                , NULL,  0 },
  };
  int o;
  while ( (o = getopt_long(argc, argv, "-bhl:d:p:", table, NULL)) != -1) {
    switch (o) {
      case 'b': sdb_set_batch_mode(); break;
      case 'p': sscanf(optarg, "%d", &difftest_port); break;
      case 'l': log_file = optarg; break;
      case 'd': diff_so_file = optarg; break;
      case 1: img_file = optarg; return 0;
      default:
        printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
        printf("\t-b,--batch              run with batch mode\n");
        printf("\t-l,--log=FILE           output log to FILE\n");
        printf("\t-d,--diff=REF_SO        run DiffTest with reference REF_SO\n");
        printf("\t-p,--port=PORT          run DiffTest with port PORT\n");
        printf("\n");
        exit(0);
    }
  }
  return 0;
}

void init_monitor(int argc, char *argv[]) {
  /* Perform some global initialization. */

  /* Parse arguments. */
  parse_args(argc, argv);

  /* Set random seed. */
  init_rand();

  /* Open the log file. */
  init_log(log_file);

  /* Initialize memory. */
  init_mem();

  /* Initialize devices. */
  IFDEF(CONFIG_DEVICE, init_device());

  /* Perform ISA dependent initialization. */
  init_isa();

  /* Load the image to memory. This will overwrite the built-in image. */
  long img_size = load_img();

  /* Initialize differential testing. */
  init_difftest(diff_so_file, img_size, difftest_port);

  /* Initialize the simple debugger. */
  init_sdb();

#ifndef CONFIG_ISA_loongarch32r
  IFDEF(CONFIG_ITRACE, init_disasm(
    MUXDEF(CONFIG_ISA_x86,     "i686",
    MUXDEF(CONFIG_ISA_mips32,  "mipsel",
    MUXDEF(CONFIG_ISA_riscv,
      MUXDEF(CONFIG_RV64,      "riscv64",
                               "riscv32"),
                               "bad"))) "-pc-linux-gnu"
  ));
#endif

  /* Display welcome message. */
  welcome();
}
#else // CONFIG_TARGET_AM
static long load_img() {
  extern char bin_start, bin_end;
  size_t size = &bin_end - &bin_start;
  Log("img size = %ld", size);
  memcpy(guest_to_host(RESET_VECTOR), &bin_start, size);
  return size;
}

void am_init_monitor() {
  init_rand();
  init_mem();
  init_isa();
  load_img();
  IFDEF(CONFIG_DEVICE, init_device());
  welcome();
}
#endif
```

根据`monitor.c`中函数`static int parse_args(int argc, char *argv[])`可得，当输入main函数输入参数含有`-b`时nemu便启动批处理模式。

# 源码