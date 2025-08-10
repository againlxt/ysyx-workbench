YSYX_HOME = $(NEMU_HOME)/..
CACHESIM_HOME = $(YSYX_HOME)/Cachesim

NAME = main

SRCS = $(shell find -L src/ -name "*.c")

include $(CACHESIM_HOME)/scripts/build.mk

ARGS ?= nemu-log.txt

# make run ARGS="-e microbench-riscv32e-ysyxsoc.elf -l build/nemu-log.txt -b" IMG=microbench-riscv32e-ysyxsoc.bin

NEMU_EXEC := $(BINARY) $(ARGS)

all: default

run-env: $(BINARY)

run: run-env
	$(NEMU_EXEC)

gdb: run-env
	gdb -s $(BINARY) --args $(NEMU_EXEC)

.PHONY: default all run gdb
