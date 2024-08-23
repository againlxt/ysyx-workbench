-include $(NEMU_HOME)/include/config/auto.conf
-include $(NEMU_HOME)/include/config/auto.conf.cmd

TOPNAME = top
NXDC_FILES = constr/Top.nxdc
INC_PATH ?= $(NPC_HOME)/include

VERILATOR = verilator
VERILATOR_CFLAGS += -MMD --build -cc -O3 --x-initial fast --noassert --trace

GTKWAVE = gtkwave
GTKWAVE_CFLAGS +=

PROJ_NAME ?= single_cycle_cpu

BUILD_DIR = ./build/$(PROJ_NAME)
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

default: $(BIN)

$(shell mkdir -p $(BUILD_DIR))

FILELIST_MK = $(shell find -L $(NPC_HOME)/csrc -name "filelist.mk")
include $(FILELIST_MK)

# constraint file
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# project source
VSRCS = $(shell find $(abspath $(NPC_HOME)/vsrc/$(PROJ_NAME)) -name "*.v" -or -name "*.sv")
CSRCS = $(shell find $(abspath $(NPC_HOME)/csrc/) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

OBJS  = $(VSRCS) $(CSRCS)
VCDSRCS = $(shell find $(abspath ./) -name $(PROJ_NAME).vcd)

# Command to execute NPC
NPC_SIM := $(BUILD_DIR)/top $(ARGS) $(IMG)

# rules for NVBoard
include $(NVBOARD_HOME)/scripts/nvboard.mk

# Extract compiler and options from menuconfig
CC = $(call remove_quote,$(CONFIG_CC))
CFLAGS_BUILD += $(call remove_quote,$(CONFIG_CC_OPT))
CFLAGS_BUILD += $(if $(CONFIG_CC_LTO),-flto,)
CFLAGS_BUILD += -Og -ggdb3
CFLAGS_TRACE += -DITRACE_COND=$(if $(CONFIG_ITRACE_COND),$(call remove_quote,$(CONFIG_ITRACE_COND)),true)
CXXFLAGS  += $(CFLAGS_BUILD) $(CFLAGS_TRACE) 
LDFLAGS += $(CFLAGS_BUILD)

# rules for verilator
INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
CXXFLAGS += $(HSRCS)
LDFLAGS  += -lreadline

$(BIN): $(OBJS)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		--top-module $(TOPNAME) $^ \
		$(addprefix -CFLAGS , $(CXXFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))

all: default

run: $(BIN)
	@$^
clean:
	rm -rf ./build
	rm -rf ./*.vcd

sim: $(OBJS)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	@rm -rf $(OBJ_DIR)
	@rm -rf ./*.vcd
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		$(addprefix -CFLAGS , $(CXXFLAGS)) \
		$(addprefix -LDFLAGS , $(LDFLAGS)) \
		--top-module $(TOPNAME) $(OBJS) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))
	$(NPC_SIM)

val: $(BIN)
	valgrind --leak-check=full $(NPC_SIM)

gdb: $(BIN)
	gdb -s $(BIN) --args $(NPC_SIM)

wave: 
	$(GTKWAVE) $(GTKWAVE_CFLAGS) $(VCDSRCS)

# Include rules for menuconfig
include $(NPC_HOME)/scripts/config.mk

.PHONY: default all clean run wave
