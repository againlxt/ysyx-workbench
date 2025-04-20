# ysyxsoc 学习笔记

# 器件学习

## sdram (MT48LC16M16A2)

 [Micron_256M_SDRAM_PartNo.MT48LC16M16A2.pdf](../../manual/Micron_256M_SDRAM_PartNo.MT48LC16M16A2.pdf) 

 [sdram_axi_core.v](../../ysyxSoC/perip/sdram/core_sdram_axi4/sdram_axi_core.v) 

### sdram控制器

#### 初始化sdram

在每次reset时，控制器会将计时器`refresh_timer_q`重置为`SDRAM_START_DELAY + 100`，先进行初始化。下面对初始化的流程进行逐一介绍：

当计数器记到10时，执行`LOAD_MODE`指令，即如下代码：

```verilog
...
else if (refresh_timer_q == 10)
begin
    command_q <= CMD_LOAD_MODE;
    addr_q    <= MODE_REG;
end
...
```

当计数器记到20或30时，执行`REFRESH`；

当计数器记到40时，执行`PRECHARGE`停用所有行；

当计数器记到50时，会使能`cke_q`，启动 sdram时钟。

计数器在未记满`SDRAM_START_DELAY + 100`或未达到如上时间时执行`NOP`指令。

**其中cke_q只会在reset时置为0，所以仿真模型中可以将cke_q视为低位有效的复位信号。**

#### LOAD_MODE操作

只在初始化时执行一次，且固定了`Burst Length = 4 Bytes`和`CAS = 2`。

#### ACTIVE操作

在进行读写操作前如果没有激活相应地址则会向sdram发送一个ACTIVE操作。

#### 写操作



### sdram仿真模型

sdram控制器与sdram的仿真模型所用时钟为同频反向时钟，sdram的仿真模型的时钟为sdram控制器的时钟通过一个非门后得到的，有略微的相位差异，但影响不大，可以认为是同步的。

#### LOAD_MODE操作

在读取到该命令时直接将相应数据存储下来即可。

#### ACTIVE操作

在读取到该命令时将激活的行和BANK写入相应寄存器即可。



