-include $(NPC_HOME)/include/config/auto.conf
-include $(NPC_HOME)/include/config/auto.conf.cmd

TOPNORMAL = top
TOPSOC = ysyxSoCFull
TOPNAME = $(if $(CONFIG_SOC),$(TOPSOC),$(TOPNORMAL))
NXDC_FILES = constr/Top.nxdc
INC_PATH ?= $(NPC_HOME)/include
YSYX_HOME = $(NEMU_HOME)/..

GTKWAVE = gtkwave
GTKWAVE_CFLAGS +=

PROJ_NAME ?= soc_cpu

BUILD_DIR = ./build/$(PROJ_NAME)
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

default: $(BIN)

$(shell mkdir -p $(BUILD_DIR))

# constraint file
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# project source
VSRCS = $(shell find $(abspath $(NPC_HOME)/vsrc/$(PROJ_NAME)) -name "*.v" -or -name "*.sv")
VSRCS_SOC = $(shell find $(abspath $(YSYX_HOME)/ysyxSoC/perip) -name "*.v")
VSRCS_SOC += $(YSYX_HOME)/ysyxSoC/build/ysyxSoCFull.v
VSRCS += $(if $(CONFIG_SOC),$(VSRCS_SOC),)
CSRCS = $(shell find $(abspath $(NPC_HOME)/csrc/) -name "*.c")
CXXSRC = $(shell find $(abspath $(NPC_HOME)/csrc/) -name "*.cpp" ! -name "disasm.cpp")
ifneq ($(CONFIG_ITRACE),)
CXXSRC += $(NPC_HOME)/csrc/utils/disasm.cpp
CXXFLAGS += $(shell llvm-config --cxxflags) -fPIE
LDFLAGS += $(shell llvm-config --libs)
endif
OBJS  = $(VSRCS) $(CSRCS) $(CXXSRC)
VCDSRCS = $(shell find $(abspath ./) -name $(PROJ_NAME).vcd)

# Command to execute NPC
NPC_SIM := $(BUILD_DIR)/$(TOPNAME) $(ARGS) $(IMG)

# rules for NVBoard
include $(NVBOARD_HOME)/scripts/nvboard.mk

# Extract compiler and options from menuconfig
CC = $(call remove_quote,$(CONFIG_CC))
CFLAGS_BUILD += $(call remove_quote,$(CONFIG_CC_OPT))
CFLAGS_BUILD += $(if $(CONFIG_CC_LTO),-flto,)
CFLAGS_BUILD += $(if $(CONFIG_CC_DEBUG),-Og -ggdb3,)
CFLAGS_BUILD += $(if $(CONFIG_CC_ASAN),-fsanitize=address,)
CFLAGS_TRACE += -DITRACE_COND=$(if $(CONFIG_ITRACE_COND),$(call remove_quote,$(CONFIG_ITRACE_COND)),true)
CXXFLAGS  += $(CFLAGS_BUILD) $(CFLAGS_TRACE) 
LDFLAGS += $(CFLAGS_BUILD)

# rules for verilator
#INV_PATH = $(if $(CONFIG_SOC),$(YSYX_HOME)/ysyxSoC/perip/uart16550/rtl,)
#INV_PATH += $(if $(CONFIG_SOC),$(YSYX_HOME)/ysyxSoC/perip/spi/rtl,)
INCFLAGS = $(addprefix -I, $(INC_PATH))
INVFLAGS = $(if $(CONFIG_SOC),-y $(YSYX_HOME)/ysyxSoC/perip/spi/rtl -y $(YSYX_HOME)/ysyxSoC/perip/uart16550/rtl,)

CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
CXXFLAGS += $(HSRCS)
LDFLAGS  += -lreadline
VERILATOR = verilator
VERILATOR_CFLAGS += -MMD --build -cc --x-initial fast --noassert
VERILATOR_CFLAGS += $(if $(CONFIG_WAVE_TRACE),--trace,)
VERILATOR_CFLAGS += $(call remove_quote,$(CONFIG_CC_OPT))
VERILATOR_CFLAGS += $(if $(CONFIG_SOC),--timescale "1ns/1ns",)
VERILATOR_CFLAGS += $(if $(CONFIG_SOC),--no-timing,)
VERILATOR_CFLAGS += $(if $(CONFIG_SOC),$(INVFLAGS)) 

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
		--top-module $(TOPNAME) $^ \
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

.PHONY: default all clean run wave gdb val sim
