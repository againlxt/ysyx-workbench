# Dire**c**t Programming Interfa**c**e (**DPI**)

## C++使用sv中的函数

**System verilog**

```systemverilog
+
```

**C++**

verilog会生成头文件包含这个函数，在Vtop__Dpi.h、Vtop__Dpi.cpp中，定义如下：

**Vtop__Dpi.h**

```c++
#ifndef VERILATED_VTOP__DPI_H_
#define VERILATED_VTOP__DPI_H_  // guard

#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif


    // DPI EXPORTS
    // DPI export at /home/lxt/ysyx-workbench/npc/vsrc/single_cycle_cpu/top.sv:1184:21
    extern svBitVecVal getCommond();

    // DPI IMPORTS
    // DPI import at /home/lxt/ysyx-workbench/npc/vsrc/single_cycle_cpu/top.sv:1178:30
    extern void sim_exit();

#ifdef __cplusplus
}
#endif

#endif  // guard
```

**Vtop__Dpi.cpp**

```c++
#include "Vtop__Dpi.h"
#include "Vtop.h"

#ifndef VL_DPIDECL_getCommond_
#define VL_DPIDECL_getCommond_
svBitVecVal getCommond() {
    // DPI export at /home/lxt/ysyx-workbench/npc/vsrc/single_cycle_cpu/top.sv:1184:21
    return Vtop::getCommond();
}
#endif
```

调用时如下：

```c++
extern "C" svBitVecVal getCommond();
...
svSetScope(svGetScopeFromName("TOP.top"));
svBitVecVal cmd = getCommond();
```

