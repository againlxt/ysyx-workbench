#include "verilated.h"
#include <verilated_vcd_c.h>
#include "Vtop.h"

VerilatedContext* contextp = NULL;
VerilatedVcdC* tfp = NULL;

static Vtop* top;
/*
0b0000000_00001_00101_000_10010_0010011     addi s2, t0 1
0b0000000_00010_00101_000_10010_0010011     addi s2, t0 2
0b0000000_00011_00101_000_10010_0010011     addi s2, t0 3
0b0000000_00100_00101_000_10010_0010011     addi s2, t0 4
0b0000000_00001_00000_000_00000_1110011     ebreak
*/
static unsigned int rom[128] = {
    0x00128913,
    0x00228913,
    0x00328913,
    0x00428913,
    0x00100043
};

void step_and_dump_wave(){
    top->eval();
    contextp->timeInc(1);
    tfp->dump(contextp->time());
}
void sim_init(){
    contextp = new VerilatedContext;
    tfp = new VerilatedVcdC;
    top = new Vtop{contextp};
    contextp->traceEverOn(true);
    top->trace(tfp, 0);
    tfp->open("dump.vcd");
}

void sim_exit(){
  	step_and_dump_wave();
  	tfp->close();
}

int main() {
    sim_init();
    top->reset = 1; top->sys_clk = 1; step_and_dump_wave();
	sim_exit();
}
