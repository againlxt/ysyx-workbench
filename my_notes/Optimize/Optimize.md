# Yosys

```
yosys ltp -noff
yosys show -format dot -prefix ./out/${mod_name} -viewer none
```

# 寻找最高的综合频率

## 整体的综合频率

### 使用CLA

```
Startpoint: exu/_2331_ (rising edge-triggered flip-flop clocked by core_clock)
Endpoint: wbu/_4702_ (rising edge-triggered flip-flop clocked by core_clock)
Path Group: core_clock
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock core_clock (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ exu/_2331_/CK (DFF_X1)
   0.09    0.09 ^ exu/_2331_/Q (DFF_X1)
   0.14    0.23 ^ exu/alu/aluControl/_19_/Z (BUF_X1)
   0.00    0.22 v exu/alu/aluControl/_11_/ZN (INV_X32)
   0.03    0.25 ^ exu/alu/aluControl/_17_/ZN (AOI211_X2)
   0.03    0.29 ^ exu/alu/aluControl/_25_/Z (BUF_X1)
   0.20    0.48 ^ exu/alu/aluAdder/_193_/Z (BUF_X1)
   0.01    0.49 v exu/alu/aluAdder/_125_/Z (XOR2_X1)
   0.04    0.53 v exu/alu/aluAdder/_197_/Z (BUF_X1)
   0.03    0.56 v exu/alu/aluAdder/cla32Add/FullAdder/_11_/Z (BUF_X1)
   0.04    0.61 v exu/alu/aluAdder/cla32Add/FullAdder/_09_/ZN (OR2_X1)
   0.02    0.63 v exu/alu/aluAdder/cla32Add/FullAdder/_15_/Z (BUF_X1)
   0.03    0.66 v exu/alu/aluAdder/cla32Add/_298_/Z (BUF_X1)
   0.03    0.69 ^ exu/alu/aluAdder/cla32Add/_165_/ZN (AOI21_X4)
   0.01    0.70 v exu/alu/aluAdder/cla32Add/_166_/ZN (INV_X2)
   0.02    0.72 v exu/alu/aluAdder/cla32Add/_167_/ZN (AND2_X4)
   0.04    0.76 v exu/alu/aluAdder/cla32Add/_168_/ZN (OR2_X4)
   0.02    0.78 ^ exu/alu/aluAdder/cla32Add/_169_/ZN (AOI21_X2)
   0.01    0.79 v exu/alu/aluAdder/cla32Add/_170_/ZN (INV_X1)
   0.03    0.82 v exu/alu/aluAdder/cla32Add/_171_/ZN (AND2_X2)
   0.04    0.86 v exu/alu/aluAdder/cla32Add/_172_/ZN (OR2_X4)
   0.02    0.88 ^ exu/alu/aluAdder/cla32Add/_173_/ZN (AOI21_X4)
   0.01    0.89 v exu/alu/aluAdder/cla32Add/_174_/ZN (INV_X2)
   0.03    0.91 v exu/alu/aluAdder/cla32Add/_175_/ZN (AND2_X4)
   0.03    0.94 ^ exu/alu/aluAdder/cla32Add/_177_/ZN (OAI21_X4)
   0.02    0.95 v exu/alu/aluAdder/cla32Add/_182_/ZN (AOI21_X4)
   0.03    0.98 ^ exu/alu/aluAdder/cla32Add/_184_/ZN (OAI21_X4)
   0.02    1.00 v exu/alu/aluAdder/cla32Add/_189_/ZN (AOI21_X4)
   0.03    1.03 ^ exu/alu/aluAdder/cla32Add/_191_/ZN (OAI21_X4)
   0.02    1.04 v exu/alu/aluAdder/cla32Add/_196_/ZN (AOI21_X4)
   0.03    1.07 ^ exu/alu/aluAdder/cla32Add/_198_/ZN (OAI21_X4)
   0.02    1.09 v exu/alu/aluAdder/cla32Add/_203_/ZN (AOI21_X4)
   0.03    1.11 ^ exu/alu/aluAdder/cla32Add/_205_/ZN (OAI21_X4)
   0.02    1.13 v exu/alu/aluAdder/cla32Add/_210_/ZN (AOI21_X4)
   0.03    1.16 ^ exu/alu/aluAdder/cla32Add/_212_/ZN (OAI21_X4)
   0.02    1.18 v exu/alu/aluAdder/cla32Add/_217_/ZN (AOI21_X4)
   0.03    1.20 ^ exu/alu/aluAdder/cla32Add/_219_/ZN (OAI21_X4)
   0.02    1.22 v exu/alu/aluAdder/cla32Add/_224_/ZN (AOI21_X4)
   0.03    1.25 ^ exu/alu/aluAdder/cla32Add/_226_/ZN (OAI21_X4)
   0.02    1.26 v exu/alu/aluAdder/cla32Add/_231_/ZN (AOI21_X4)
   0.03    1.29 ^ exu/alu/aluAdder/cla32Add/_233_/ZN (OAI21_X4)
   0.02    1.31 v exu/alu/aluAdder/cla32Add/_238_/ZN (AOI21_X4)
   0.03    1.34 ^ exu/alu/aluAdder/cla32Add/_240_/ZN (OAI21_X4)
   0.02    1.35 v exu/alu/aluAdder/cla32Add/_245_/ZN (AOI21_X4)
   0.03    1.38 ^ exu/alu/aluAdder/cla32Add/_247_/ZN (OAI21_X4)
   0.02    1.40 v exu/alu/aluAdder/cla32Add/_252_/ZN (AOI21_X4)
   0.02    1.42 ^ exu/alu/aluAdder/cla32Add/_254_/ZN (OAI21_X4)
   0.01    1.43 v exu/alu/aluAdder/cla32Add/_259_/ZN (AOI21_X2)
   0.04    1.47 v exu/alu/aluAdder/cla32Add/_260_/ZN (OR2_X2)
   0.02    1.50 ^ exu/alu/aluAdder/cla32Add/_261_/ZN (AOI21_X2)
   0.01    1.51 v exu/alu/aluAdder/cla32Add/_262_/ZN (INV_X1)
   0.02    1.53 v exu/alu/aluAdder/cla32Add/_390_/Z (BUF_X1)
   0.03    1.56 v exu/alu/aluAdder/cla32Add/FullAdder_31/_13_/Z (BUF_X1)
   0.03    1.59 v exu/alu/aluAdder/cla32Add/FullAdder_31/_08_/ZN (XNOR2_X1)
   0.02    1.62 v exu/alu/aluAdder/cla32Add/FullAdder_31/_14_/Z (BUF_X1)
   0.02    1.64 v exu/alu/aluAdder/cla32Add/_296_/Z (BUF_X1)
   0.03    1.67 v exu/alu/aluAdder/_190_/Z (BUF_X1)
   0.02    1.69 ^ exu/alu/aluAdder/_156_/ZN (INV_X1)
   0.02    1.72 ^ exu/alu/aluAdder/_157_/ZN (OR3_X4)
   0.01    1.72 v exu/alu/aluAdder/_159_/ZN (NAND2_X1)
   0.02    1.75 v exu/alu/aluAdder/_259_/Z (BUF_X1)
   0.03    1.78 v exu/alu/_1025_/Z (BUF_X1)
   0.05    1.83 v exu/alu/_0580_/Z (XOR2_X2)
   0.06    1.88 v exu/alu/_0582_/Z (MUX2_X2)
   0.02    1.90 ^ exu/alu/_0588_/ZN (NAND3_X2)
   0.04    1.94 ^ exu/alu/_0594_/ZN (AND4_X4)
   0.02    1.97 v exu/alu/_0602_/ZN (OAI211_X2)
   0.03    1.99 v exu/alu/_1038_/Z (BUF_X1)
   0.02    2.02 v wbu/_5515_/Z (BUF_X1)
   0.05    2.06 ^ wbu/_3883_/ZN (NOR3_X1)
   0.04    2.11 v wbu/_3884_/ZN (AOI211_X4)
   0.02    2.13 v wbu/_5777_/Z (BUF_X1)
   0.00    2.13 v wbu/_4702_/D (DFF_X1)
           2.13   data arrival time

   2.00    2.00   clock core_clock (rise edge)
   0.00    2.00   clock network delay (ideal)
   0.00    2.00   clock reconvergence pessimism
           2.00 ^ wbu/_4702_/CK (DFF_X1)
  -0.04    1.96   library setup time
           1.96   data required time
---------------------------------------------------------
           1.96   data required time
          -2.13   data arrival time
---------------------------------------------------------
          -0.17   slack (VIOLATED)

Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             5.11e-03   4.85e-06   1.12e-04   5.23e-03  82.7%
Combinational          2.87e-04   2.39e-04   5.26e-04   1.05e-03  16.6%
Clock                  1.44e-05   2.15e-05   7.96e-06   4.39e-05   0.7%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  5.41e-03   2.65e-04   6.46e-04   6.32e-03 100.0%
                          85.6%       4.2%      10.2%
core_clock period_min = 2.17 fmax = 460.56
   Chip area for module '\ALU': 740.544000
   Chip area for module '\ALUAdder': 169.176000
   Chip area for module '\ALUControl': 22.610000
   Chip area for module '\AXIBusArbiter': 763.686000
   Chip area for module '\AXILiteClint': 1719.158000
   Chip area for module '\BranchCond': 55.594000
   Chip area for module '\CLAGen': 257.222000
   Chip area for module '\CSRALU': 168.910000
   Chip area for module '\CSRReg': 2945.152000
   Chip area for module '\ContrGen': 579.880000
   Chip area for module '\EXU': 2428.314000
   Chip area for module '\FullAdder': 11.172000
   Chip area for module '\IDU': 749.588000
   Chip area for module '\IFU': 433.314000
   Chip area for module '\ImmGen': 297.122000
   Chip area for module '\PC': 335.426000
   Chip area for module '\Riscv32BaseReg': 7581.266000
   Chip area for module '\Shifter': 862.638000
   Chip area for module '\WBU': 4567.486000
   Chip area for module '\XbarAXI': 686.280000
   Chip area for module '\top': 63.308000
   Chip area for top module '\top': 25784.178000
```

### 使用行为级

```
  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock core_clock (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ exu/_2331_/CK (DFF_X1)
   0.09    0.09 ^ exu/_2331_/Q (DFF_X1)
   0.14    0.23 ^ exu/alu/aluControl/_19_/Z (BUF_X1)
   0.00    0.22 v exu/alu/aluControl/_11_/ZN (INV_X32)
   0.03    0.25 ^ exu/alu/aluControl/_17_/ZN (AOI211_X2)
   0.03    0.29 ^ exu/alu/aluControl/_25_/Z (BUF_X1)
   0.20    0.48 ^ exu/alu/aluAdder/_193_/Z (BUF_X1)
   0.05    0.53 ^ exu/alu/aluAdder/_125_/Z (XOR2_X1)
   0.02    0.56 ^ exu/alu/aluAdder/_197_/Z (BUF_X1)
   0.03    0.59 ^ exu/alu/aluAdder/cla32Add/_536_/Z (BUF_X1)
   0.05    0.64 ^ exu/alu/aluAdder/cla32Add/_300_/Z (XOR2_X2)
   0.03    0.67 ^ exu/alu/aluAdder/cla32Add/_302_/ZN (AND2_X4)
   0.01    0.68 v exu/alu/aluAdder/cla32Add/_304_/ZN (NOR2_X4)
   0.03    0.71 ^ exu/alu/aluAdder/cla32Add/_309_/ZN (NOR3_X4)
   0.03    0.74 v exu/alu/aluAdder/cla32Add/_319_/ZN (OAI211_X2)
   0.04    0.78 ^ exu/alu/aluAdder/cla32Add/_347_/ZN (AOI21_X4)
   0.01    0.79 v exu/alu/aluAdder/cla32Add/_352_/ZN (NOR2_X4)
   0.04    0.83 ^ exu/alu/aluAdder/cla32Add/_410_/ZN (NOR3_X4)
   0.01    0.85 v exu/alu/aluAdder/cla32Add/_414_/ZN (NOR2_X4)
   0.03    0.88 ^ exu/alu/aluAdder/cla32Add/_470_/ZN (NOR2_X4)
   0.02    0.89 v exu/alu/aluAdder/cla32Add/_501_/ZN (OAI21_X4)
   0.04    0.93 ^ exu/alu/aluAdder/cla32Add/_518_/ZN (AOI211_X2)
   0.02    0.95 v exu/alu/aluAdder/cla32Add/_524_/ZN (OAI21_X1)
   0.03    0.98 v exu/alu/aluAdder/cla32Add/_526_/ZN (AND2_X2)
   0.03    1.01 v exu/alu/aluAdder/cla32Add/_528_/ZN (XNOR2_X1)
   0.03    1.04 v exu/alu/aluAdder/cla32Add/_631_/Z (BUF_X1)
   0.03    1.07 v exu/alu/aluAdder/_190_/Z (BUF_X1)
   0.02    1.09 ^ exu/alu/aluAdder/_156_/ZN (INV_X1)
   0.02    1.12 ^ exu/alu/aluAdder/_157_/ZN (OR3_X4)
   0.01    1.12 v exu/alu/aluAdder/_159_/ZN (NAND2_X1)
   0.02    1.15 v exu/alu/aluAdder/_259_/Z (BUF_X1)
   0.03    1.18 v exu/alu/_1025_/Z (BUF_X1)
   0.05    1.23 v exu/alu/_0580_/Z (XOR2_X2)
   0.06    1.28 v exu/alu/_0582_/Z (MUX2_X2)
   0.02    1.30 ^ exu/alu/_0588_/ZN (NAND3_X2)
   0.04    1.34 ^ exu/alu/_0594_/ZN (AND4_X4)
   0.02    1.37 v exu/alu/_0602_/ZN (OAI211_X2)
   0.03    1.39 v exu/alu/_1038_/Z (BUF_X1)
   0.02    1.42 v wbu/_5485_/Z (BUF_X1)
   0.05    1.46 ^ wbu/_3867_/ZN (NOR3_X1)
   0.04    1.51 v wbu/_3868_/ZN (AOI211_X4)
   0.02    1.53 v wbu/_5747_/Z (BUF_X1)
   0.00    1.53 v wbu/_4672_/D (DFF_X1)
           1.53   data arrival time

   2.00    2.00   clock core_clock (rise edge)
   0.00    2.00   clock network delay (ideal)
   0.00    2.00   clock reconvergence pessimism
           2.00 ^ wbu/_4672_/CK (DFF_X1)
  -0.04    1.96   library setup time
           1.96   data required time
---------------------------------------------------------
           1.96   data required time
          -1.53   data arrival time
---------------------------------------------------------
           0.43   slack (MET)


Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             5.11e-03   4.85e-06   1.12e-04   5.23e-03  82.9%
Combinational          2.78e-04   2.35e-04   5.18e-04   1.03e-03  16.4%
Clock                  1.44e-05   2.15e-05   7.96e-06   4.39e-05   0.7%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  5.40e-03   2.62e-04   6.39e-04   6.30e-03 100.0%
                          85.7%       4.2%      10.1%
core_clock period_min = 1.57 fmax = 636.33
   Chip area for module '\ALU': 740.544000
   Chip area for module '\ALUAdderCLA': 169.176000
   Chip area for module '\ALUControl': 22.610000
   Chip area for module '\AXIBusArbiter': 763.686000
   Chip area for module '\AXILiteClint': 1719.158000
   Chip area for module '\BranchCond': 55.594000
   Chip area for module '\CSRALU': 168.910000
   Chip area for module '\CSRReg': 2945.152000
   Chip area for module '\ContrGen': 579.880000
   Chip area for module '\EXU': 2428.314000
   Chip area for module '\FullAdder32': 387.296000
   Chip area for module '\IDU': 749.588000
   Chip area for module '\IFU': 433.314000
   Chip area for module '\ImmGen': 297.122000
   Chip area for module '\PC': 335.426000
   Chip area for module '\Riscv32BaseReg': 7581.266000
   Chip area for module '\Shifter': 862.638000
   Chip area for module '\WBU': 4547.004000
   Chip area for module '\XbarAXI': 686.280000
   Chip area for module '\top': 63.308000
   Chip area for top module '\top': 25536.266000
```

## 重要模块

### 寄存器堆

```
  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock core_clock (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ _7643_/CK (DFF_X1)
   0.08    0.08 ^ _7643_/Q (DFF_X1)
   0.02    0.11 ^ _7732_/Z (BUF_X1)
   0.01    0.12 v _5736_/ZN (INV_X1)
   0.11    0.23 ^ _5598_/ZN (AOI211_X4)
   0.02    0.25 ^ _8777_/Z (BUF_X1)
   0.00    0.25 ^ _7643_/D (DFF_X1)
           0.25   data arrival time

   2.00    2.00   clock core_clock (rise edge)
   0.00    2.00   clock network delay (ideal)
   0.00    2.00   clock reconvergence pessimism
           2.00 ^ _7643_/CK (DFF_X1)
  -0.03    1.97   library setup time
           1.97   data required time
---------------------------------------------------------
           1.97   data required time
          -0.25   data arrival time
---------------------------------------------------------
           1.72   slack (MET)


Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.79e-03   4.82e-06   3.91e-05   1.83e-03  70.6%
Combinational          3.77e-04   2.25e-04   1.60e-04   7.62e-04  29.4%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.17e-03   2.30e-04   2.00e-04   2.60e-03 100.0%
                          83.5%       8.8%       7.7%
core_clock period_min = 0.28 fmax = 3598.23
   Chip area for module '\Riscv32BaseReg': 7706.286000
```

### ALU

#### CLA

```
  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock core_clock (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ _171_/CK (DFFR_X1)
   0.10    0.10 ^ _171_/Q (DFFR_X1)
   0.14    0.24 ^ alu0/aluControl/_19_/Z (BUF_X1)
   0.00    0.24 v alu0/aluControl/_11_/ZN (INV_X32)
   0.03    0.27 ^ alu0/aluControl/_17_/ZN (AOI211_X2)
   0.03    0.30 ^ alu0/aluControl/_25_/Z (BUF_X1)
   0.20    0.50 ^ alu0/aluAdder/_193_/Z (BUF_X1)
   0.01    0.51 v alu0/aluAdder/_125_/Z (XOR2_X1)
   0.04    0.54 v alu0/aluAdder/_197_/Z (BUF_X1)
   0.03    0.58 v alu0/aluAdder/cla32Add/FullAdder/_11_/Z (BUF_X1)
   0.04    0.62 v alu0/aluAdder/cla32Add/FullAdder/_09_/ZN (OR2_X1)
   0.02    0.64 v alu0/aluAdder/cla32Add/FullAdder/_15_/Z (BUF_X1)
   0.03    0.67 v alu0/aluAdder/cla32Add/_298_/Z (BUF_X1)
   0.03    0.70 ^ alu0/aluAdder/cla32Add/_165_/ZN (AOI21_X4)
   0.01    0.71 v alu0/aluAdder/cla32Add/_166_/ZN (INV_X2)
   0.02    0.73 v alu0/aluAdder/cla32Add/_167_/ZN (AND2_X4)
   0.04    0.77 v alu0/aluAdder/cla32Add/_168_/ZN (OR2_X4)
   0.02    0.79 ^ alu0/aluAdder/cla32Add/_169_/ZN (AOI21_X2)
   0.01    0.80 v alu0/aluAdder/cla32Add/_170_/ZN (INV_X1)
   0.03    0.83 v alu0/aluAdder/cla32Add/_171_/ZN (AND2_X2)
   0.04    0.87 v alu0/aluAdder/cla32Add/_172_/ZN (OR2_X4)
   0.02    0.89 ^ alu0/aluAdder/cla32Add/_173_/ZN (AOI21_X4)
   0.01    0.90 v alu0/aluAdder/cla32Add/_174_/ZN (INV_X2)
   0.03    0.92 v alu0/aluAdder/cla32Add/_175_/ZN (AND2_X4)
   0.03    0.95 ^ alu0/aluAdder/cla32Add/_177_/ZN (OAI21_X4)
   0.02    0.97 v alu0/aluAdder/cla32Add/_182_/ZN (AOI21_X4)
   0.03    0.99 ^ alu0/aluAdder/cla32Add/_184_/ZN (OAI21_X4)
   0.02    1.01 v alu0/aluAdder/cla32Add/_189_/ZN (AOI21_X4)
   0.03    1.04 ^ alu0/aluAdder/cla32Add/_191_/ZN (OAI21_X4)
   0.02    1.06 v alu0/aluAdder/cla32Add/_196_/ZN (AOI21_X4)
   0.03    1.08 ^ alu0/aluAdder/cla32Add/_198_/ZN (OAI21_X4)
   0.02    1.10 v alu0/aluAdder/cla32Add/_203_/ZN (AOI21_X4)
   0.03    1.13 ^ alu0/aluAdder/cla32Add/_205_/ZN (OAI21_X4)
   0.02    1.14 v alu0/aluAdder/cla32Add/_210_/ZN (AOI21_X4)
   0.03    1.17 ^ alu0/aluAdder/cla32Add/_212_/ZN (OAI21_X4)
   0.02    1.19 v alu0/aluAdder/cla32Add/_217_/ZN (AOI21_X4)
   0.03    1.22 ^ alu0/aluAdder/cla32Add/_219_/ZN (OAI21_X4)
   0.02    1.23 v alu0/aluAdder/cla32Add/_224_/ZN (AOI21_X4)
   0.03    1.26 ^ alu0/aluAdder/cla32Add/_226_/ZN (OAI21_X4)
   0.02    1.28 v alu0/aluAdder/cla32Add/_231_/ZN (AOI21_X4)
   0.03    1.30 ^ alu0/aluAdder/cla32Add/_233_/ZN (OAI21_X4)
   0.02    1.32 v alu0/aluAdder/cla32Add/_238_/ZN (AOI21_X4)
   0.03    1.35 ^ alu0/aluAdder/cla32Add/_240_/ZN (OAI21_X4)
   0.02    1.36 v alu0/aluAdder/cla32Add/_245_/ZN (AOI21_X4)
   0.03    1.39 ^ alu0/aluAdder/cla32Add/_247_/ZN (OAI21_X4)
   0.02    1.41 v alu0/aluAdder/cla32Add/_252_/ZN (AOI21_X4)
   0.02    1.43 ^ alu0/aluAdder/cla32Add/_254_/ZN (OAI21_X4)
   0.01    1.44 v alu0/aluAdder/cla32Add/_259_/ZN (AOI21_X2)
   0.04    1.49 v alu0/aluAdder/cla32Add/_260_/ZN (OR2_X2)
   0.02    1.51 ^ alu0/aluAdder/cla32Add/_261_/ZN (AOI21_X2)
   0.01    1.52 v alu0/aluAdder/cla32Add/_262_/ZN (INV_X1)
   0.02    1.54 v alu0/aluAdder/cla32Add/_390_/Z (BUF_X1)
   0.03    1.57 v alu0/aluAdder/cla32Add/FullAdder_31/_13_/Z (BUF_X1)
   0.03    1.60 v alu0/aluAdder/cla32Add/FullAdder_31/_08_/ZN (XNOR2_X1)
   0.02    1.63 v alu0/aluAdder/cla32Add/FullAdder_31/_14_/Z (BUF_X1)
   0.02    1.65 v alu0/aluAdder/cla32Add/_296_/Z (BUF_X1)
   0.03    1.68 v alu0/aluAdder/_190_/Z (BUF_X1)
   0.02    1.70 ^ alu0/aluAdder/_156_/ZN (INV_X1)
   0.02    1.73 ^ alu0/aluAdder/_157_/ZN (OR3_X4)
   0.01    1.74 v alu0/aluAdder/_159_/ZN (NAND2_X1)
   0.02    1.76 v alu0/aluAdder/_259_/Z (BUF_X1)
   0.03    1.79 v alu0/_1027_/Z (BUF_X1)
   0.05    1.83 v alu0/_0581_/Z (XOR2_X1)
   0.06    1.89 v alu0/_0583_/Z (MUX2_X1)
   0.01    1.91 ^ alu0/_0591_/ZN (NAND3_X1)
   0.06    1.96 ^ alu0/_0597_/ZN (AND4_X1)
   0.02    1.99 v alu0/_0605_/ZN (OAI211_X2)
   0.03    2.02 v alu0/_1040_/Z (BUF_X1)
   0.00    2.02 v _174_/D (DFFR_X1)
           2.02   data arrival time

   2.00    2.00   clock core_clock (rise edge)
   0.00    2.00   clock network delay (ideal)
   0.00    2.00   clock reconvergence pessimism
           2.00 ^ _174_/CK (DFFR_X1)
  -0.04    1.96   library setup time
           1.96   data required time
---------------------------------------------------------
           1.96   data required time
          -2.02   data arrival time
---------------------------------------------------------
          -0.06   slack (VIOLATED)


Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             2.87e-04   5.10e-06   8.76e-06   3.01e-04  22.9%
Combinational          5.91e-04   3.59e-04   6.61e-05   1.02e-03  77.1%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  8.79e-04   3.64e-04   7.48e-05   1.32e-03 100.0%
                          66.7%      27.6%       5.7%
core_clock period_min = 2.06 fmax = 486.56
   Chip area for module '\ALU': 722.456000
   Chip area for module '\ALUAdder': 169.176000
   Chip area for module '\ALUControl': 22.610000
   Chip area for module '\ALU_STA': 544.768000
   Chip area for module '\CLAGen': 257.222000
   Chip area for module '\FullAdder': 11.172000
   Chip area for module '\Shifter': 862.638000
   Chip area for top module '\ALU_STA': 2936.374000
```

#### 行为级

```
  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock core_clock (rise edge)
   0.00    0.00   clock network delay (ideal)
   0.00    0.00 ^ _171_/CK (DFFR_X1)
   0.10    0.10 ^ _171_/Q (DFFR_X1)
   0.14    0.24 ^ alu0/aluControl/_19_/Z (BUF_X1)
   0.00    0.24 v alu0/aluControl/_11_/ZN (INV_X32)
   0.03    0.27 ^ alu0/aluControl/_17_/ZN (AOI211_X2)
   0.03    0.30 ^ alu0/aluControl/_25_/Z (BUF_X1)
   0.20    0.49 ^ alu0/aluAdder/_193_/Z (BUF_X1)
   0.05    0.54 ^ alu0/aluAdder/_125_/Z (XOR2_X1)
   0.02    0.57 ^ alu0/aluAdder/_197_/Z (BUF_X1)
   0.03    0.60 ^ alu0/aluAdder/cla32Add/_536_/Z (BUF_X1)
   0.05    0.65 ^ alu0/aluAdder/cla32Add/_300_/Z (XOR2_X2)
   0.03    0.69 ^ alu0/aluAdder/cla32Add/_302_/ZN (AND2_X4)
   0.01    0.69 v alu0/aluAdder/cla32Add/_304_/ZN (NOR2_X4)
   0.03    0.72 ^ alu0/aluAdder/cla32Add/_309_/ZN (NOR3_X4)
   0.03    0.76 v alu0/aluAdder/cla32Add/_319_/ZN (OAI211_X2)
   0.04    0.79 ^ alu0/aluAdder/cla32Add/_347_/ZN (AOI21_X4)
   0.01    0.80 v alu0/aluAdder/cla32Add/_352_/ZN (NOR2_X4)
   0.04    0.85 ^ alu0/aluAdder/cla32Add/_410_/ZN (NOR3_X4)
   0.01    0.86 v alu0/aluAdder/cla32Add/_414_/ZN (NOR2_X4)
   0.03    0.89 ^ alu0/aluAdder/cla32Add/_470_/ZN (NOR2_X4)
   0.02    0.90 v alu0/aluAdder/cla32Add/_501_/ZN (OAI21_X4)
   0.04    0.94 ^ alu0/aluAdder/cla32Add/_518_/ZN (AOI211_X2)
   0.02    0.96 v alu0/aluAdder/cla32Add/_524_/ZN (OAI21_X1)
   0.03    0.99 v alu0/aluAdder/cla32Add/_526_/ZN (AND2_X2)
   0.03    1.02 v alu0/aluAdder/cla32Add/_528_/ZN (XNOR2_X1)
   0.03    1.05 v alu0/aluAdder/cla32Add/_631_/Z (BUF_X1)
   0.03    1.08 v alu0/aluAdder/_190_/Z (BUF_X1)
   0.02    1.10 ^ alu0/aluAdder/_156_/ZN (INV_X1)
   0.02    1.13 ^ alu0/aluAdder/_157_/ZN (OR3_X4)
   0.01    1.14 v alu0/aluAdder/_159_/ZN (NAND2_X1)
   0.02    1.16 v alu0/aluAdder/_259_/Z (BUF_X1)
   0.03    1.19 v alu0/_1027_/Z (BUF_X1)
   0.05    1.23 v alu0/_0581_/Z (XOR2_X1)
   0.06    1.29 v alu0/_0583_/Z (MUX2_X1)
   0.01    1.31 ^ alu0/_0591_/ZN (NAND3_X1)
   0.06    1.36 ^ alu0/_0597_/ZN (AND4_X1)
   0.02    1.39 v alu0/_0605_/ZN (OAI211_X2)
   0.03    1.42 v alu0/_1040_/Z (BUF_X1)
   0.00    1.42 v _174_/D (DFFR_X1)
           1.42   data arrival time

   2.00    2.00   clock core_clock (rise edge)
   0.00    2.00   clock network delay (ideal)
   0.00    2.00   clock reconvergence pessimism
           2.00 ^ _174_/CK (DFFR_X1)
  -0.04    1.96   library setup time
           1.96   data required time
---------------------------------------------------------
           1.96   data required time
          -1.42   data arrival time
---------------------------------------------------------
           0.54   slack (MET)


Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             2.87e-04   5.10e-06   8.76e-06   3.01e-04  25.3%
Combinational          4.97e-04   3.32e-04   5.91e-05   8.88e-04  74.7%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  7.84e-04   3.37e-04   6.78e-05   1.19e-03 100.0%
                          65.9%      28.4%       5.7%
core_clock period_min = 1.46 fmax = 687.05
   Chip area for module '\ALU': 722.456000
   Chip area for module '\ALUAdderCLA': 169.176000
   Chip area for module '\ALUControl': 22.610000
   Chip area for module '\ALU_STA': 544.768000
   Chip area for module '\FullAdder32': 387.296000
   Chip area for module '\Shifter': 862.638000
   Chip area for top module '\ALU_STA': 2708.944000
```

## 总结

可以看到，寄存器堆的最高综合频率为3598.23MHz，ALU的最高综合频率为486.56MHz，这个加法器还有待改善，该加法器使用的是CLA门电路级的设计。替换为行为级设计后综合频率有所上升，为687.05MHz，面积也有所减小。但使用行为级仿真感觉根本不清楚什么会有这样的区别，具体的还是要看生成的门电路有何区别。

# 重新寻找优化瓶颈

不添加延迟如下`microbench test`：

```
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:95 sim_exit] total cycle = 19511741
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:96 sim_exit] total inst  = 1137738
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:97 sim_exit] IPC         = 0.058310
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:98 sim_exit] CPI         = 17.149591
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:77 performence_cnt_display] ================ Performence Counter Display =================
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:78 performence_cnt_display] The average memory access latency of the LSU: 19.11
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:79 performence_cnt_display] proportion JUMP  |  Store  |  Load  |  Cal  |  Csr  |  Other
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:80 performence_cnt_display]            3.79%   12.02%   8.69%   50.60%   0.00%   24.90%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:82 performence_cnt_display] proportion IFUGetInst  |  LSUGetData  |  EXUFinCal
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:83 performence_cnt_display]            28.56%           23.08%         5.83%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:84 performence_cnt_display] ============== Performence Counter Display End ===============
```

添加延迟，`microbench test`：

```
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:95 sim_exit] total cycle = 41952932
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:96 sim_exit] total inst  = 1135257
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:97 sim_exit] IPC         = 0.027060
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:98 sim_exit] CPI         = 36.954568
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:77 performence_cnt_display] ================ Performence Counter Display =================
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:78 performence_cnt_display] The average memory access latency of the LSU: 24.98
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:79 performence_cnt_display] proportion JUMP  |  Store  |  Load  |  Cal  |  Csr  |  Other
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:80 performence_cnt_display]            3.80%   12.05%   8.63%   50.65%   0.00%   24.88%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:82 performence_cnt_display] proportion IFUGetInst  |  LSUGetData  |  EXUFinCal
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:83 performence_cnt_display]            63.58%           13.98%         2.71%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:84 performence_cnt_display] ============== Performence Counter Display End ===============
```

添加延迟，`microbench train`：

```
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:95 sim_exit] total cycle = 10481870659
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:96 sim_exit] total inst  = 286204350
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:97 sim_exit] IPC         = 0.027305
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:98 sim_exit] CPI         = 36.623729
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:77 performence_cnt_display] ================ Performence Counter Display =================
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:78 performence_cnt_display] The average memory access latency of the LSU: 13.34
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:79 performence_cnt_display] proportion JUMP  |  Store  |  Load  |  Cal  |  Csr  |  Other
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:80 performence_cnt_display]            3.42%   4.61%   7.66%   56.11%   0.00%   28.20%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:82 performence_cnt_display] proportion IFUGetInst  |  LSUGetData  |  EXUFinCal
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:83 performence_cnt_display]            73.14%           4.47%         2.73%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:84 performence_cnt_display] ============== Performence Counter Display End ===============
```

根据`Amdahl's Law`，优化IFU取指令到理论值，整个程序的加速比是`1 / (1 - 0.7314 + 0.7314 / 4) = 2.2151`，能够让运行速度变为原来的`41952932 / 19511741 = 2.1501`倍，但要获取同样的效果需要将频率提升为原来的两倍而且没有考虑延迟的改变，还是比较有难度，所以当前主要目标应该是优化取指令效率。

# 评估NPC性能

```
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:95 sim_exit] total cycle = 10481870659
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:96 sim_exit] total inst  = 286204350
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:97 sim_exit] IPC         = 0.027305
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:98 sim_exit] CPI         = 36.623729
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:77 performence_cnt_display] ================ Performence Counter Display =================
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:78 performence_cnt_display] The average memory access latency of the LSU: 13.34
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:79 performence_cnt_display] proportion JUMP  |  Store  |  Load  |  Cal  |  Csr  |  Other
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:80 performence_cnt_display]            3.42%   4.61%   7.66%   56.11%   0.00%   28.20%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:82 performence_cnt_display] proportion IFUGetInst  |  LSUGetData  |  EXUFinCal
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:83 performence_cnt_display]            73.14%           4.47%         2.73%
[/home/lxt/ysyx-workbench/npc/csrc/cpu/cpu-exec.cpp:84 performence_cnt_display] ============== Performence Counter Display End ===============
```
