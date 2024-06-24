#include "verilated.h"
#include <verilated_vcd_c.h>
#include <svdpi.h>
#include <iostream>
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
    0x00100073
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
    tfp->open("simplest_cpu.vcd");
}

extern "C" void sim_exit();
void sim_exit(){
  	step_and_dump_wave();
  	tfp->close();
    exit(0);
}

int main() {
    sim_init();
    top->reset = 1; top->sys_clk = 1;   step_and_dump_wave();
    top->sys_clk = !top->sys_clk;       step_and_dump_wave();
    top->sys_clk = !top->sys_clk;       step_and_dump_wave();
    top->sys_clk = !top->sys_clk;       step_and_dump_wave();
    top->reset = 0; step_and_dump_wave();
    top->i_ren = 1;

    while (1) {
        top->sys_clk = !top->sys_clk;

        
        if(top->o_pc==0x80000000)       {top->i_command = rom[0];    top->i_ren = 1;}
        else if(top->o_pc==0x80000004)  {top->i_command = rom[1];    top->i_ren = 1;}
        else if(top->o_pc==0x80000008)  {top->i_command = rom[2];    top->i_ren = 1;}
        else if(top->o_pc==0x8000000C)  {top->i_command = rom[3];    top->i_ren = 1;}
        else if(top->o_pc==0x80000010)  {top->i_command = rom[4];    top->i_ren = 1;}
        else                            top->i_ren = 0;
        
        step_and_dump_wave();
    }
}
