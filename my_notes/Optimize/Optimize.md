## Yosys

```
yosys ltp -noff
yosys show -format dot -prefix ./out/${mod_name} -viewer none
```

# 寻找最高的综合频率

## 整体的综合频率

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

## 总结

可以看到，寄存器堆的最高综合频率为3598.23MHz，ALU的最高综合频率为486.56MHz，这个加法器还有待改善。
