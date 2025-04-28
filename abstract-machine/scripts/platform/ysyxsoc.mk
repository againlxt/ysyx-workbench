AM_SRCS :=	riscv/ysyxsoc/trm.c \
			riscv/ysyxsoc/start.S \
			riscv/ysyxsoc/ioe.c \
            riscv/ysyxsoc/timer.c \
            riscv/ysyxsoc/input.c \
            riscv/ysyxsoc/cte.c \
            riscv/ysyxsoc/trap.S \
            platform/dummy/vme.c \
            platform/dummy/mpe.c

CFLAGS    += -fdata-sections -ffunction-sections
LDFLAGS   += -T $(AM_HOME)/scripts/platform/ysyxsoclinker.ld
LDFLAGS   += --gc-sections -e _start # 启用链接器的垃圾回收功能（GC, Garbage Collection），删除未使用的代码或数据段。

CFLAGS += -DMAINARGS=\"$(mainargs)\"
NPCFLAGS  += -l $(NPC_HOME)/build/npc-log.txt
NPCFLAGS  += -e $(IMAGE).elf
NPCFLAGS  += --diff $(NEMU_HOME)/build/riscv32-nemu-interpreter-so
.PHONY: $(AM_HOME)/am/src/riscv/ysyxsoc/trm.c

image: $(IMAGE).elf
	@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
	@echo + OBJCOPY "->" $(IMAGE_REL).bin
	@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin

run: image
	$(MAKE) -C $(NPC_HOME) sim ARGS="$(NPCFLAGS)" IMG=$(IMAGE).bin

gdb: image
	$(MAKE) -C $(NPC_HOME) gdb ARGS="$(NPCFLAGS)" IMG=$(IMAGE).bin
