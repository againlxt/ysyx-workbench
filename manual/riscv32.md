# Programmers' Model for Base Integer ISA

![RISC-V base unprivileged integer register state](/home/lxt/ysyx-workbench/manual/riscv32.assets/94859c012e2c4bd7b6368311cdb92fb0.png)

1. Register x0 is hardwired with all bits equal to 0
2. There is no dedicated stack pointer or subroutine return address link register in the Base Integer ISA; the instruction encoding allows any x register to be used for these purposes. However, the standard software calling convention uses register x1 to hold the return address for a call, with register x5 available as an alternate link register. The standard calling convention uses register x2 as the stack pointer.

![Base Instruction Formats](/home/lxt/ysyx-workbench/manual/riscv32.assets/Screenshot from 2024-05-21 14-08-27.png)

# 可能用到的部分

## 加法溢出的处理

unpriv-isa-asciidoc.pdf 20240411版 pg44 

## 移动命令mv的实现

通过`addi`命令实现

unpriv-isa-asciidoc.pdf 20240411版 pg45 

# RISC-V开放架构设计之道
