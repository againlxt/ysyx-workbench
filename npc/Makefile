
TOPNAME = top
NXDC_FILES = constr/Top.nxdc
INC_PATH ?=

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

# constraint file
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# project source
VSRCS = $(shell find $(abspath ./vsrc/$(PROJ_NAME)) -name "*.v" -or -name "*.sv")
CSRCS = $(shell find $(abspath ./csrc/$(PROJ_NAME)) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
VERCS = $(shell find $(abspath ./csrc/$(PROJ_NAME)) -name "sim_main.c")
HSRCS = -I$(NPC_HOME)/include
VCDSRCS = $(shell find $(abspath ./) -name $(PROJ_NAME).vcd)

# Command to execute NPC
NPC_SIM := $(BUILD_DIR)/top $(ARGS) $(IMG)

# rules for NVBoard
include $(NVBOARD_HOME)/scripts/nvboard.mk

# rules for verilator
INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
CXXFLAGS += $(HSRCS)
CXXFLAGS += -D__REG_PREFIX__=top__DOT__riscv32BaseReg__DOT__riscv32BaseReg_
LDFLAGS += -lreadline

$(BIN): $(VSRCS) $(CSRCS)
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

sim: $(VSRCS) $(VERCS) $(CSRCS)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	@rm -rf $(OBJ_DIR)
	@rm -rf ./*.vcd
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		$(addprefix -CFLAGS , $(CXXFLAGS)) \
		$(addprefix -LDFLAGS , $(LDFLAGS)) \
		--top-module $(TOPNAME) $(VSRCS) $(CSRCS) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))
	$(NPC_SIM)
wave: 
	$(GTKWAVE) $(GTKWAVE_CFLAGS) $(VCDSRCS)

.PHONY: default all clean run
