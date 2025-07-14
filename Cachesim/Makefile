YSYX_HOME = $(NEMU_HOME)/..
CACHESIM_HOME = $(YSYX_HOME)/Cachesim

NAME = main

SRCS = $(shell find -L src/ -name "*.c")

include $(CACHESIM_HOME)/scripts/build.mk

ARGS = nemu-log.txt

NEMU_EXEC := $(BINARY) $(ARGS)

all: default

run-env: $(BINARY)

run: run-env
	$(NEMU_EXEC)

gdb: run-env
	gdb -s $(BINARY) --args $(NEMU_EXEC)

.PHONY: default all run gdb
