AM_SRCS :=	riscv/ysyxsoc/trm.c \
			riscv/ysyxsoc/start.S \
			riscv/npc/ioe.c \
            riscv/npc/timer.c \
            riscv/npc/input.c \
            riscv/npc/cte.c \
            riscv/npc/trap.S \
            platform/dummy/vme.c \
            platform/dummy/mpe.c

CFLAGS    += -fdata-sections -ffunction-sections -O2
LDFLAGS   += -T $(AM_HOME)/scripts/platform/ysyxsoclinker.ld \
						 --defsym=_mrom_start=0x20000000 --defsym=_entry_offset=0x0 \
						 --defsym=_sram_start=0x0f000000
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
