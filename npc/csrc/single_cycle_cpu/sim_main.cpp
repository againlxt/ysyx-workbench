#include "verilated.h"
#include <verilated_vcd_c.h>
#include <svdpi.h>
#include <iostream>
#include "Vtop.h"

// 全局变量
VerilatedContext* contextp = nullptr;
VerilatedVcdC* tfp = nullptr;
Vtop* top = nullptr;

// ROM 指令集
static unsigned int rom[128] = {
    0x00128913, // addi s2, t0, 1
    0x00228913, // addi s2, t0, 2
    0x00328913, // addi s2, t0, 3
    0x00428913, // addi s2, t0, 4
    0x00100073  // ebreak
};

// 仿真步进并记录波形
void step_and_dump_wave() {
    top->eval();
    contextp->timeInc(1); // 时间增加
    tfp->dump(contextp->time());
}

// 仿真初始化
void sim_init() {
    contextp = new VerilatedContext;
    tfp = new VerilatedVcdC;
    top = new Vtop(contextp);
    contextp->traceEverOn(true);
    top->trace(tfp, 99); // 设置波形深度为99
    tfp->open("single_cycle_cpu.vcd");
}

// 仿真退出
extern "C" void sim_exit();
void sim_exit() {
    step_and_dump_wave(); // 确保最后一步被记录
    tfp->close();
    delete top;
    delete tfp;
    delete contextp;
    exit(0);
}

// 主函数
int main() {
    sim_init();
    uint32_t pc = 0x80000000;
    top->io_pc = pc;
    top->reset = 1;

    // 初始复位序列
    for (int i = 0; i < 5; ++i) {
        top->clock = 1; step_and_dump_wave();
        top->clock = 0; step_and_dump_wave();
    }
    top->reset = 0; step_and_dump_wave();

    // 主仿真循环
    while (true) {
        top->clock = 1; step_and_dump_wave();
        top->clock = 0; step_and_dump_wave();
        
        if (pc == 0x80000000)       { top->io_memData = rom[0]; }
        else if (pc == 0x80000004)  { top->io_memData = rom[1]; }
        else if (pc == 0x80000008)  { top->io_memData = rom[2]; }
        else if (pc == 0x8000000C)  { top->io_memData = rom[3]; }
        else if (pc == 0x80000010)  { top->io_memData = rom[4]; }
        else                        { break; }

        if (top->clock == 0) { pc += 4; top->io_pc = pc; }
    }

    sim_exit();
    return 0;
}
