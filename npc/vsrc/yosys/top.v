module PC(
  input         clock,
  input         reset,
  output        io_wbu2PC_ready, // @[src/main/scala/PC.scala 9:20]
  input         io_wbu2PC_valid, // @[src/main/scala/PC.scala 9:20]
  input  [31:0] io_wbu2PC_bits_nextPC, // @[src/main/scala/PC.scala 9:20]
  output [31:0] io_pc // @[src/main/scala/PC.scala 9:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/PC.scala 15:28]
  reg  wbu2PCReadyReg; // @[src/main/scala/PC.scala 16:37]
  wire  _GEN_1 = io_wbu2PC_ready & io_wbu2PC_valid ? 1'h0 : 1'h1; // @[src/main/scala/PC.scala 20:51 22:32 24:32]
  assign io_wbu2PC_ready = wbu2PCReadyReg; // @[src/main/scala/PC.scala 17:25]
  assign io_pc = pcReg; // @[src/main/scala/PC.scala 28:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/PC.scala 15:28]
      pcReg <= 32'h30000000; // @[src/main/scala/PC.scala 15:28]
    end else if (io_wbu2PC_ready & io_wbu2PC_valid) begin // @[src/main/scala/PC.scala 20:51]
      pcReg <= io_wbu2PC_bits_nextPC; // @[src/main/scala/PC.scala 21:23]
    end
    wbu2PCReadyReg <= reset | _GEN_1; // @[src/main/scala/PC.scala 16:{37,37}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  wbu2PCReadyReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IFU(
  input         clock,
  input         reset,
  input  [31:0] io_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_bready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_bvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_arready, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_arvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_ifu2Mem_araddr, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_rready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_rvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input  [31:0] io_ifu2Mem_rdata // @[src/main/scala/ifu/IFU.scala 15:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  IGIC_valid; // @[src/main/scala/ifu/IFU.scala 127:57]
  wire [31:0] IGIC_counterType; // @[src/main/scala/ifu/IFU.scala 127:57]
  wire [31:0] IGIC_data; // @[src/main/scala/ifu/IFU.scala 127:57]
  wire  resetnWire = ~reset; // @[src/main/scala/ifu/IFU.scala 22:35]
  reg  breadyReg; // @[src/main/scala/ifu/IFU.scala 37:42]
  reg  arvalidReg; // @[src/main/scala/ifu/IFU.scala 39:42]
  reg [31:0] araddrReg; // @[src/main/scala/ifu/IFU.scala 40:42]
  reg  rreadyReg; // @[src/main/scala/ifu/IFU.scala 47:42]
  wire  _T_1 = ~resetnWire; // @[src/main/scala/ifu/IFU.scala 95:14]
  wire  _GEN_0 = io_ifu2Mem_bvalid | breadyReg; // @[src/main/scala/ifu/IFU.scala 100:33 99:33 37:42]
  wire  _GEN_1 = io_ifu2Mem_bvalid & io_ifu2Mem_bready ? 1'h0 : _GEN_0; // @[src/main/scala/ifu/IFU.scala 97:54 98:33]
  wire  _GEN_2 = ~resetnWire | _GEN_1; // @[src/main/scala/ifu/IFU.scala 95:34 96:33]
  wire  _GEN_3 = io_ifu2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/IFU.scala 107:41 108:28 39:42]
  wire  _GEN_4 = araddrReg != io_pc | _GEN_3; // @[src/main/scala/ifu/IFU.scala 105:42 106:28]
  wire  _GEN_5 = _T_1 | _GEN_4; // @[src/main/scala/ifu/IFU.scala 103:34 104:28]
  wire  _GEN_6 = io_ifu2Mem_rvalid | rreadyReg; // @[src/main/scala/ifu/IFU.scala 115:40 116:27 47:42]
  wire  _GEN_7 = io_ifu2Mem_rvalid & rreadyReg ? 1'h0 : _GEN_6; // @[src/main/scala/ifu/IFU.scala 113:60 114:27]
  wire  _GEN_8 = _T_1 | _GEN_7; // @[src/main/scala/ifu/IFU.scala 111:34 112:27]
  reg [31:0] ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 121:48]
  wire [31:0] _ifuGetInstCounter_T_1 = ifuGetInstCounter + 32'h1; // @[src/main/scala/ifu/IFU.scala 125:64]
  PerformanceCounter IGIC ( // @[src/main/scala/ifu/IFU.scala 127:57]
    .valid(IGIC_valid),
    .counterType(IGIC_counterType),
    .data(IGIC_data)
  );
  assign io_inst_valid = io_ifu2Mem_rvalid & rreadyReg; // @[src/main/scala/ifu/IFU.scala 133:47]
  assign io_inst_bits_inst = io_ifu2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 134:33]
  assign io_inst_bits_pc = araddrReg; // @[src/main/scala/ifu/IFU.scala 135:33]
  assign io_ifu2Mem_bready = breadyReg; // @[src/main/scala/ifu/IFU.scala 65:33]
  assign io_ifu2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/IFU.scala 71:33]
  assign io_ifu2Mem_araddr = araddrReg; // @[src/main/scala/ifu/IFU.scala 72:33]
  assign io_ifu2Mem_rready = rreadyReg; // @[src/main/scala/ifu/IFU.scala 78:33]
  assign IGIC_valid = io_ifu2Mem_rvalid & rreadyReg; // @[src/main/scala/ifu/IFU.scala 128:62]
  assign IGIC_counterType = 32'h6; // @[src/main/scala/ifu/IFU.scala 129:41]
  assign IGIC_data = ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 130:41]
  always @(posedge clock) begin
    breadyReg <= reset | _GEN_2; // @[src/main/scala/ifu/IFU.scala 37:{42,42}]
    arvalidReg <= reset | _GEN_5; // @[src/main/scala/ifu/IFU.scala 39:{42,42}]
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 40:42]
      araddrReg <= 32'h80000000; // @[src/main/scala/ifu/IFU.scala 40:42]
    end else begin
      araddrReg <= io_pc; // @[src/main/scala/ifu/IFU.scala 45:41]
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 47:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 47:42]
    end else begin
      rreadyReg <= _GEN_8;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 121:48]
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 121:48]
    end else if (arvalidReg & io_ifu2Mem_arready) begin // @[src/main/scala/ifu/IFU.scala 122:64]
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 123:43]
    end else begin
      ifuGetInstCounter <= _ifuGetInstCounter_T_1; // @[src/main/scala/ifu/IFU.scala 125:43]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  breadyReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  arvalidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  araddrReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rreadyReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ifuGetInstCounter = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Riscv32BaseReg(
  input         clock,
  input         reset,
  output [31:0] io_idu2BaseReg_rs1Data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  output [31:0] io_idu2BaseReg_rs2Data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_idu2BaseReg_rs1Index, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_idu2BaseReg_rs2Index, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [31:0] io_wbu2BaseReg_data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input         io_wbu2BaseReg_regWR // @[src/main/scala/Riscv32BaseReg.scala 10:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_1; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_2; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_3; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_4; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_5; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_6; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_7; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_8; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_9; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_10; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_11; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_12; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_13; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_14; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_15; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  wire [31:0] _GEN_49 = 4'h1 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_50 = 4'h2 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_2 : _GEN_49; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_51 = 4'h3 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_3 : _GEN_50; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_52 = 4'h4 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_4 : _GEN_51; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_53 = 4'h5 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_5 : _GEN_52; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_54 = 4'h6 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_6 : _GEN_53; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_55 = 4'h7 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_7 : _GEN_54; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_56 = 4'h8 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_8 : _GEN_55; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_57 = 4'h9 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_9 : _GEN_56; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_58 = 4'ha == io_idu2BaseReg_rs1Index ? riscv32BaseReg_10 : _GEN_57; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_59 = 4'hb == io_idu2BaseReg_rs1Index ? riscv32BaseReg_11 : _GEN_58; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_60 = 4'hc == io_idu2BaseReg_rs1Index ? riscv32BaseReg_12 : _GEN_59; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_61 = 4'hd == io_idu2BaseReg_rs1Index ? riscv32BaseReg_13 : _GEN_60; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_62 = 4'he == io_idu2BaseReg_rs1Index ? riscv32BaseReg_14 : _GEN_61; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_65 = 4'h1 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_66 = 4'h2 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_2 : _GEN_65; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_67 = 4'h3 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_3 : _GEN_66; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_68 = 4'h4 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_4 : _GEN_67; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_69 = 4'h5 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_5 : _GEN_68; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_70 = 4'h6 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_6 : _GEN_69; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_71 = 4'h7 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_7 : _GEN_70; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_72 = 4'h8 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_8 : _GEN_71; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_73 = 4'h9 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_9 : _GEN_72; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_74 = 4'ha == io_idu2BaseReg_rs2Index ? riscv32BaseReg_10 : _GEN_73; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_75 = 4'hb == io_idu2BaseReg_rs2Index ? riscv32BaseReg_11 : _GEN_74; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_76 = 4'hc == io_idu2BaseReg_rs2Index ? riscv32BaseReg_12 : _GEN_75; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_77 = 4'hd == io_idu2BaseReg_rs2Index ? riscv32BaseReg_13 : _GEN_76; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  wire [31:0] _GEN_78 = 4'he == io_idu2BaseReg_rs2Index ? riscv32BaseReg_14 : _GEN_77; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  assign io_idu2BaseReg_rs1Data = 4'hf == io_idu2BaseReg_rs1Index ? riscv32BaseReg_15 : _GEN_62; // @[src/main/scala/Riscv32BaseReg.scala 25:{33,33}]
  assign io_idu2BaseReg_rs2Data = 4'hf == io_idu2BaseReg_rs2Index ? riscv32BaseReg_15 : _GEN_78; // @[src/main/scala/Riscv32BaseReg.scala 26:{33,33}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_0 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h0 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_0 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end else begin
        riscv32BaseReg_0 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 21:45]
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_1 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h1 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_1 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_2 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h2 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_2 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_3 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h3 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_3 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_4 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h4 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_4 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_5 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h5 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_5 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_6 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h6 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_6 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_7 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h7 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_7 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_8 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h8 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_8 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_9 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'h9 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_9 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_10 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'ha == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_10 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_11 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'hb == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_11 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_12 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'hc == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_12 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_13 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'hd == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_13 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_14 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'he == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_14 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_15 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 17:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 18:54]
        if (4'hf == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 19:65]
          riscv32BaseReg_15 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 19:65]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  riscv32BaseReg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  riscv32BaseReg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  riscv32BaseReg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  riscv32BaseReg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  riscv32BaseReg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  riscv32BaseReg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  riscv32BaseReg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  riscv32BaseReg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  riscv32BaseReg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  riscv32BaseReg_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  riscv32BaseReg_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  riscv32BaseReg_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  riscv32BaseReg_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  riscv32BaseReg_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  riscv32BaseReg_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  riscv32BaseReg_15 = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSRReg(
  input         clock,
  input         reset,
  output [31:0] io_exu2CSR_csrData, // @[src/main/scala/CSR.scala 10:16]
  input         io_exu2CSR_mret, // @[src/main/scala/CSR.scala 10:16]
  input         io_exu2CSR_ecall, // @[src/main/scala/CSR.scala 10:16]
  input  [11:0] io_exu2CSR_csr, // @[src/main/scala/CSR.scala 10:16]
  input  [31:0] io_wbu2CSR_pc, // @[src/main/scala/CSR.scala 10:16]
  input  [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/CSR.scala 10:16]
  input  [11:0] io_wbu2CSR_csr, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_ecall, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_csrEn, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_csrWr // @[src/main/scala/CSR.scala 10:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mepcReg; // @[src/main/scala/CSR.scala 16:34]
  reg [31:0] mstatusReg; // @[src/main/scala/CSR.scala 17:34]
  reg [31:0] mcauseReg; // @[src/main/scala/CSR.scala 18:34]
  reg [31:0] mtvecReg; // @[src/main/scala/CSR.scala 19:34]
  reg [31:0] mvendoridReg; // @[src/main/scala/CSR.scala 20:42]
  reg [31:0] marchidReg; // @[src/main/scala/CSR.scala 21:42]
  wire [31:0] _GEN_0 = io_wbu2CSR_csr == 12'hf12 ? io_wbu2CSR_csrWData : marchidReg; // @[src/main/scala/CSR.scala 21:42 34:65 35:57]
  wire [31:0] _GEN_1 = io_wbu2CSR_csr == 12'hf11 ? io_wbu2CSR_csrWData : mvendoridReg; // @[src/main/scala/CSR.scala 20:42 32:53 33:49]
  wire [31:0] _GEN_2 = io_wbu2CSR_csr == 12'hf11 ? marchidReg : _GEN_0; // @[src/main/scala/CSR.scala 21:42 32:53]
  wire [31:0] _GEN_3 = io_wbu2CSR_csr == 12'h305 ? io_wbu2CSR_csrWData : mtvecReg; // @[src/main/scala/CSR.scala 30:53 31:33 19:34]
  wire [31:0] _GEN_4 = io_wbu2CSR_csr == 12'h305 ? mvendoridReg : _GEN_1; // @[src/main/scala/CSR.scala 20:42 30:53]
  wire [31:0] _GEN_5 = io_wbu2CSR_csr == 12'h305 ? marchidReg : _GEN_2; // @[src/main/scala/CSR.scala 21:42 30:53]
  wire [31:0] _GEN_6 = io_wbu2CSR_csr == 12'h341 ? io_wbu2CSR_csrWData : mepcReg; // @[src/main/scala/CSR.scala 28:53 29:33 16:34]
  wire [31:0] _GEN_7 = io_wbu2CSR_csr == 12'h341 ? mtvecReg : _GEN_3; // @[src/main/scala/CSR.scala 19:34 28:53]
  wire [31:0] _GEN_8 = io_wbu2CSR_csr == 12'h341 ? mvendoridReg : _GEN_4; // @[src/main/scala/CSR.scala 20:42 28:53]
  wire [31:0] _GEN_9 = io_wbu2CSR_csr == 12'h341 ? marchidReg : _GEN_5; // @[src/main/scala/CSR.scala 21:42 28:53]
  wire [31:0] _GEN_10 = io_wbu2CSR_csr == 12'h342 ? io_wbu2CSR_csrWData : mcauseReg; // @[src/main/scala/CSR.scala 26:53 27:33 18:34]
  wire [31:0] _GEN_11 = io_wbu2CSR_csr == 12'h342 ? mepcReg : _GEN_6; // @[src/main/scala/CSR.scala 16:34 26:53]
  wire [31:0] _GEN_12 = io_wbu2CSR_csr == 12'h342 ? mtvecReg : _GEN_7; // @[src/main/scala/CSR.scala 19:34 26:53]
  wire [31:0] _GEN_13 = io_wbu2CSR_csr == 12'h342 ? mvendoridReg : _GEN_8; // @[src/main/scala/CSR.scala 20:42 26:53]
  wire [31:0] _GEN_14 = io_wbu2CSR_csr == 12'h342 ? marchidReg : _GEN_9; // @[src/main/scala/CSR.scala 21:42 26:53]
  wire  _io_exu2CSR_csrData_T = io_exu2CSR_csr == 12'h300; // @[src/main/scala/CSR.scala 44:25]
  wire  _io_exu2CSR_csrData_T_1 = io_exu2CSR_csr == 12'h342; // @[src/main/scala/CSR.scala 45:33]
  wire  _io_exu2CSR_csrData_T_2 = io_exu2CSR_csr == 12'h341; // @[src/main/scala/CSR.scala 46:33]
  wire  _io_exu2CSR_csrData_T_3 = io_exu2CSR_csr == 12'h305; // @[src/main/scala/CSR.scala 47:33]
  wire  _io_exu2CSR_csrData_T_4 = io_exu2CSR_csr == 12'hf11; // @[src/main/scala/CSR.scala 48:33]
  wire  _io_exu2CSR_csrData_T_5 = io_exu2CSR_csr == 12'hf12; // @[src/main/scala/CSR.scala 49:33]
  wire [31:0] _io_exu2CSR_csrData_T_8 = io_exu2CSR_mret ? mepcReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_9 = io_exu2CSR_ecall ? mtvecReg : _io_exu2CSR_csrData_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_10 = _io_exu2CSR_csrData_T_5 ? marchidReg : _io_exu2CSR_csrData_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_11 = _io_exu2CSR_csrData_T_4 ? mvendoridReg : _io_exu2CSR_csrData_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_12 = _io_exu2CSR_csrData_T_3 ? mtvecReg : _io_exu2CSR_csrData_T_11; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_13 = _io_exu2CSR_csrData_T_2 ? mepcReg : _io_exu2CSR_csrData_T_12; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_14 = _io_exu2CSR_csrData_T_1 ? mcauseReg : _io_exu2CSR_csrData_T_13; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_exu2CSR_csrData = _io_exu2CSR_csrData_T ? mstatusReg : _io_exu2CSR_csrData_T_14; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/CSR.scala 16:34]
      mepcReg <= 32'h0; // @[src/main/scala/CSR.scala 16:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mepcReg <= _GEN_11;
        end
      end else if (io_wbu2CSR_ecall) begin // @[src/main/scala/CSR.scala 37:46]
        mepcReg <= io_wbu2CSR_pc; // @[src/main/scala/CSR.scala 38:25]
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 17:34]
      mstatusReg <= 32'h1800; // @[src/main/scala/CSR.scala 17:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (io_wbu2CSR_csr == 12'h300) begin // @[src/main/scala/CSR.scala 24:47]
          mstatusReg <= io_wbu2CSR_csrWData; // @[src/main/scala/CSR.scala 25:33]
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 18:34]
      mcauseReg <= 32'h0; // @[src/main/scala/CSR.scala 18:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mcauseReg <= _GEN_10;
        end
      end else if (io_wbu2CSR_ecall) begin // @[src/main/scala/CSR.scala 37:46]
        mcauseReg <= 32'hb; // @[src/main/scala/CSR.scala 39:25]
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 19:34]
      mtvecReg <= 32'h0; // @[src/main/scala/CSR.scala 19:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mtvecReg <= _GEN_12;
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 20:42]
      mvendoridReg <= 32'h79737978; // @[src/main/scala/CSR.scala 20:42]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mvendoridReg <= _GEN_13;
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 21:42]
      marchidReg <= 32'h78957352; // @[src/main/scala/CSR.scala 21:42]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          marchidReg <= _GEN_14;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mepcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mstatusReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mcauseReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mtvecReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mvendoridReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  marchidReg = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ContrGen(
  input  [31:0] io_cmd, // @[src/main/scala/idu/ContrGen.scala 11:20]
  input  [6:0]  io_opcode, // @[src/main/scala/idu/ContrGen.scala 11:20]
  input  [2:0]  io_func3, // @[src/main/scala/idu/ContrGen.scala 11:20]
  input  [6:0]  io_func7, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [2:0]  io_immType, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_regWR, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [1:0]  io_srcAALU, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [1:0]  io_srcBALU, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [3:0]  io_ctrALU, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [3:0]  io_branch, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [1:0]  io_memToReg, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_memWR, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_memValid, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [2:0]  io_memOP, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_ecall, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_mret, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_csrEn, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_csrWr, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output        io_csrOP, // @[src/main/scala/idu/ContrGen.scala 11:20]
  output [1:0]  io_csrALUOP // @[src/main/scala/idu/ContrGen.scala 11:20]
);
  wire  _instructionFormatWire_T_1 = io_cmd[19:0] == 20'h8067; // @[src/main/scala/idu/ContrGen.scala 42:31]
  wire  _instructionFormatWire_T_7 = io_func3 == 3'h0; // @[src/main/scala/idu/ContrGen.scala 43:79]
  wire  _instructionFormatWire_T_9 = io_opcode == 7'h13; // @[src/main/scala/idu/ContrGen.scala 43:106]
  wire  _instructionFormatWire_T_10 = io_cmd[31:15] == 17'h0 & io_cmd[11:7] == 5'h0 & io_func3 == 3'h0 & io_opcode == 7'h13
    ; // @[src/main/scala/idu/ContrGen.scala 43:92]
  wire  _instructionFormatWire_T_12 = io_cmd == 32'h73; // @[src/main/scala/idu/ContrGen.scala 44:31]
  wire  _instructionFormatWire_T_14 = io_cmd == 32'h30200073; // @[src/main/scala/idu/ContrGen.scala 45:31]
  wire  _instructionFormatWire_T_15 = io_func3 == 3'h3; // @[src/main/scala/idu/ContrGen.scala 48:28]
  wire  _instructionFormatWire_T_16 = io_opcode == 7'h73; // @[src/main/scala/idu/ContrGen.scala 48:54]
  wire  _instructionFormatWire_T_17 = io_func3 == 3'h3 & io_opcode == 7'h73; // @[src/main/scala/idu/ContrGen.scala 48:41]
  wire  _instructionFormatWire_T_18 = io_func3 == 3'h7; // @[src/main/scala/idu/ContrGen.scala 49:28]
  wire  _instructionFormatWire_T_20 = io_func3 == 3'h7 & _instructionFormatWire_T_16; // @[src/main/scala/idu/ContrGen.scala 49:41]
  wire  _instructionFormatWire_T_21 = io_func3 == 3'h2; // @[src/main/scala/idu/ContrGen.scala 50:28]
  wire  _instructionFormatWire_T_23 = io_func3 == 3'h2 & _instructionFormatWire_T_16; // @[src/main/scala/idu/ContrGen.scala 50:41]
  wire  _instructionFormatWire_T_24 = io_func3 == 3'h6; // @[src/main/scala/idu/ContrGen.scala 51:28]
  wire  _instructionFormatWire_T_26 = io_func3 == 3'h6 & _instructionFormatWire_T_16; // @[src/main/scala/idu/ContrGen.scala 51:41]
  wire  _instructionFormatWire_T_27 = io_func3 == 3'h1; // @[src/main/scala/idu/ContrGen.scala 52:28]
  wire  _instructionFormatWire_T_29 = io_func3 == 3'h1 & _instructionFormatWire_T_16; // @[src/main/scala/idu/ContrGen.scala 52:41]
  wire  _instructionFormatWire_T_30 = io_func3 == 3'h5; // @[src/main/scala/idu/ContrGen.scala 53:28]
  wire  _instructionFormatWire_T_32 = io_func3 == 3'h5 & _instructionFormatWire_T_16; // @[src/main/scala/idu/ContrGen.scala 53:41]
  wire  _instructionFormatWire_T_35 = _instructionFormatWire_T_7 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 59:41]
  wire  _instructionFormatWire_T_38 = _instructionFormatWire_T_21 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 60:41]
  wire  _instructionFormatWire_T_41 = _instructionFormatWire_T_15 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 61:41]
  wire  _instructionFormatWire_T_44 = _instructionFormatWire_T_18 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 62:41]
  wire  _instructionFormatWire_T_47 = _instructionFormatWire_T_24 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 63:41]
  wire  _instructionFormatWire_T_48 = io_func3 == 3'h4; // @[src/main/scala/idu/ContrGen.scala 64:28]
  wire  _instructionFormatWire_T_50 = io_func3 == 3'h4 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 64:41]
  wire  _instructionFormatWire_T_52 = io_cmd[31:26] == 6'h0; // @[src/main/scala/idu/ContrGen.scala 65:33]
  wire  _instructionFormatWire_T_56 = io_cmd[31:26] == 6'h0 & _instructionFormatWire_T_27 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 65:74]
  wire  _instructionFormatWire_T_62 = _instructionFormatWire_T_52 & _instructionFormatWire_T_30 &
    _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 66:74]
  wire  _instructionFormatWire_T_68 = io_cmd[31:26] == 6'h10 & _instructionFormatWire_T_30 & _instructionFormatWire_T_9; // @[src/main/scala/idu/ContrGen.scala 67:74]
  wire  _instructionFormatWire_T_69 = io_opcode == 7'h37; // @[src/main/scala/idu/ContrGen.scala 68:29]
  wire  _instructionFormatWire_T_70 = io_opcode == 7'h17; // @[src/main/scala/idu/ContrGen.scala 69:29]
  wire  _instructionFormatWire_T_71 = io_func7 == 7'h0; // @[src/main/scala/idu/ContrGen.scala 71:28]
  wire  _instructionFormatWire_T_74 = io_opcode == 7'h33; // @[src/main/scala/idu/ContrGen.scala 71:85]
  wire  _instructionFormatWire_T_75 = io_func7 == 7'h0 & _instructionFormatWire_T_7 & io_opcode == 7'h33; // @[src/main/scala/idu/ContrGen.scala 71:71]
  wire  _instructionFormatWire_T_80 = _instructionFormatWire_T_71 & _instructionFormatWire_T_21 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 72:71]
  wire  _instructionFormatWire_T_85 = _instructionFormatWire_T_71 & _instructionFormatWire_T_15 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 73:71]
  wire  _instructionFormatWire_T_90 = _instructionFormatWire_T_71 & _instructionFormatWire_T_18 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 74:71]
  wire  _instructionFormatWire_T_95 = _instructionFormatWire_T_71 & _instructionFormatWire_T_24 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 75:71]
  wire  _instructionFormatWire_T_100 = _instructionFormatWire_T_71 & _instructionFormatWire_T_48 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 76:71]
  wire  _instructionFormatWire_T_105 = _instructionFormatWire_T_71 & _instructionFormatWire_T_27 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 77:71]
  wire  _instructionFormatWire_T_110 = _instructionFormatWire_T_71 & _instructionFormatWire_T_30 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 78:71]
  wire  _instructionFormatWire_T_111 = io_func7 == 7'h20; // @[src/main/scala/idu/ContrGen.scala 79:28]
  wire  _instructionFormatWire_T_115 = io_func7 == 7'h20 & _instructionFormatWire_T_7 & _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 79:71]
  wire  _instructionFormatWire_T_120 = _instructionFormatWire_T_111 & _instructionFormatWire_T_30 &
    _instructionFormatWire_T_74; // @[src/main/scala/idu/ContrGen.scala 80:71]
  wire  _instructionFormatWire_T_121 = io_opcode == 7'h6f; // @[src/main/scala/idu/ContrGen.scala 84:29]
  wire  _instructionFormatWire_T_124 = _instructionFormatWire_T_7 & io_opcode == 7'h67; // @[src/main/scala/idu/ContrGen.scala 85:41]
  wire  _instructionFormatWire_T_126 = io_opcode == 7'h63; // @[src/main/scala/idu/ContrGen.scala 87:54]
  wire  _instructionFormatWire_T_127 = _instructionFormatWire_T_7 & io_opcode == 7'h63; // @[src/main/scala/idu/ContrGen.scala 87:41]
  wire  _instructionFormatWire_T_130 = _instructionFormatWire_T_27 & _instructionFormatWire_T_126; // @[src/main/scala/idu/ContrGen.scala 88:41]
  wire  _instructionFormatWire_T_133 = _instructionFormatWire_T_48 & _instructionFormatWire_T_126; // @[src/main/scala/idu/ContrGen.scala 89:41]
  wire  _instructionFormatWire_T_136 = _instructionFormatWire_T_24 & _instructionFormatWire_T_126; // @[src/main/scala/idu/ContrGen.scala 90:41]
  wire  _instructionFormatWire_T_139 = _instructionFormatWire_T_30 & _instructionFormatWire_T_126; // @[src/main/scala/idu/ContrGen.scala 91:41]
  wire  _instructionFormatWire_T_142 = _instructionFormatWire_T_18 & _instructionFormatWire_T_126; // @[src/main/scala/idu/ContrGen.scala 92:41]
  wire  _instructionFormatWire_T_144 = io_opcode == 7'h3; // @[src/main/scala/idu/ContrGen.scala 95:55]
  wire  _instructionFormatWire_T_145 = _instructionFormatWire_T_21 & io_opcode == 7'h3; // @[src/main/scala/idu/ContrGen.scala 95:41]
  wire  _instructionFormatWire_T_148 = _instructionFormatWire_T_27 & _instructionFormatWire_T_144; // @[src/main/scala/idu/ContrGen.scala 96:41]
  wire  _instructionFormatWire_T_151 = _instructionFormatWire_T_30 & _instructionFormatWire_T_144; // @[src/main/scala/idu/ContrGen.scala 97:41]
  wire  _instructionFormatWire_T_154 = _instructionFormatWire_T_7 & _instructionFormatWire_T_144; // @[src/main/scala/idu/ContrGen.scala 98:41]
  wire  _instructionFormatWire_T_157 = _instructionFormatWire_T_48 & _instructionFormatWire_T_144; // @[src/main/scala/idu/ContrGen.scala 99:41]
  wire  _instructionFormatWire_T_159 = io_opcode == 7'h23; // @[src/main/scala/idu/ContrGen.scala 101:54]
  wire  _instructionFormatWire_T_160 = _instructionFormatWire_T_21 & io_opcode == 7'h23; // @[src/main/scala/idu/ContrGen.scala 101:41]
  wire  _instructionFormatWire_T_163 = _instructionFormatWire_T_27 & _instructionFormatWire_T_159; // @[src/main/scala/idu/ContrGen.scala 102:41]
  wire  _instructionFormatWire_T_166 = _instructionFormatWire_T_7 & _instructionFormatWire_T_159; // @[src/main/scala/idu/ContrGen.scala 103:41]
  wire [5:0] _instructionFormatWire_T_167 = _instructionFormatWire_T_166 ? 6'h10 : 6'h31; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_168 = _instructionFormatWire_T_163 ? 6'h11 : _instructionFormatWire_T_167; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_169 = _instructionFormatWire_T_160 ? 6'h12 : _instructionFormatWire_T_168; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_170 = _instructionFormatWire_T_157 ? 6'he : _instructionFormatWire_T_169; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_171 = _instructionFormatWire_T_154 ? 6'hb : _instructionFormatWire_T_170; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_172 = _instructionFormatWire_T_151 ? 6'hf : _instructionFormatWire_T_171; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_173 = _instructionFormatWire_T_148 ? 6'hc : _instructionFormatWire_T_172; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_174 = _instructionFormatWire_T_145 ? 6'hd : _instructionFormatWire_T_173; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_175 = _instructionFormatWire_T_142 ? 6'ha : _instructionFormatWire_T_174; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_176 = _instructionFormatWire_T_139 ? 6'h8 : _instructionFormatWire_T_175; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_177 = _instructionFormatWire_T_136 ? 6'h9 : _instructionFormatWire_T_176; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_178 = _instructionFormatWire_T_133 ? 6'h7 : _instructionFormatWire_T_177; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_179 = _instructionFormatWire_T_130 ? 6'h6 : _instructionFormatWire_T_178; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_180 = _instructionFormatWire_T_127 ? 6'h5 : _instructionFormatWire_T_179; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_181 = _instructionFormatWire_T_124 ? 6'h4 : _instructionFormatWire_T_180; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_182 = _instructionFormatWire_T_121 ? 6'h3 : _instructionFormatWire_T_181; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_183 = _instructionFormatWire_T_120 ? 6'h23 : _instructionFormatWire_T_182; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_184 = _instructionFormatWire_T_115 ? 6'h1d : _instructionFormatWire_T_183; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_185 = _instructionFormatWire_T_110 ? 6'h22 : _instructionFormatWire_T_184; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_186 = _instructionFormatWire_T_105 ? 6'h1e : _instructionFormatWire_T_185; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_187 = _instructionFormatWire_T_100 ? 6'h21 : _instructionFormatWire_T_186; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_188 = _instructionFormatWire_T_95 ? 6'h24 : _instructionFormatWire_T_187; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_189 = _instructionFormatWire_T_90 ? 6'h25 : _instructionFormatWire_T_188; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_190 = _instructionFormatWire_T_85 ? 6'h20 : _instructionFormatWire_T_189; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_191 = _instructionFormatWire_T_80 ? 6'h1f : _instructionFormatWire_T_190; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_192 = _instructionFormatWire_T_75 ? 6'h1c : _instructionFormatWire_T_191; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_193 = _instructionFormatWire_T_70 ? 6'h2 : _instructionFormatWire_T_192; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_194 = _instructionFormatWire_T_69 ? 6'h1 : _instructionFormatWire_T_193; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_195 = _instructionFormatWire_T_68 ? 6'h1b : _instructionFormatWire_T_194; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_196 = _instructionFormatWire_T_62 ? 6'h1a : _instructionFormatWire_T_195; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_197 = _instructionFormatWire_T_56 ? 6'h19 : _instructionFormatWire_T_196; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_198 = _instructionFormatWire_T_50 ? 6'h16 : _instructionFormatWire_T_197; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_199 = _instructionFormatWire_T_47 ? 6'h17 : _instructionFormatWire_T_198; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_200 = _instructionFormatWire_T_44 ? 6'h18 : _instructionFormatWire_T_199; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_201 = _instructionFormatWire_T_41 ? 6'h15 : _instructionFormatWire_T_200; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_202 = _instructionFormatWire_T_38 ? 6'h14 : _instructionFormatWire_T_201; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_203 = _instructionFormatWire_T_35 ? 6'h13 : _instructionFormatWire_T_202; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_204 = _instructionFormatWire_T_32 ? 6'h2e : _instructionFormatWire_T_203; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_205 = _instructionFormatWire_T_29 ? 6'h2b : _instructionFormatWire_T_204; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_206 = _instructionFormatWire_T_26 ? 6'h2f : _instructionFormatWire_T_205; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_207 = _instructionFormatWire_T_23 ? 6'h2c : _instructionFormatWire_T_206; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_208 = _instructionFormatWire_T_20 ? 6'h30 : _instructionFormatWire_T_207; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_209 = _instructionFormatWire_T_17 ? 6'h2d : _instructionFormatWire_T_208; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_210 = _instructionFormatWire_T_14 ? 6'h29 : _instructionFormatWire_T_209; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_211 = _instructionFormatWire_T_12 ? 6'h28 : _instructionFormatWire_T_210; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] _instructionFormatWire_T_212 = _instructionFormatWire_T_10 ? 6'h31 : _instructionFormatWire_T_211; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [5:0] instructionFormatWire = _instructionFormatWire_T_1 ? 6'h0 : _instructionFormatWire_T_212; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_156 = _instructionFormatWire_T_166 ? 3'h2 : 3'h6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_157 = _instructionFormatWire_T_163 ? 3'h2 : _instructionTypeWire_T_156; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_158 = _instructionFormatWire_T_160 ? 3'h2 : _instructionTypeWire_T_157; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_159 = _instructionFormatWire_T_157 ? 3'h1 : _instructionTypeWire_T_158; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_160 = _instructionFormatWire_T_154 ? 3'h1 : _instructionTypeWire_T_159; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_161 = _instructionFormatWire_T_151 ? 3'h1 : _instructionTypeWire_T_160; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_162 = _instructionFormatWire_T_148 ? 3'h1 : _instructionTypeWire_T_161; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_163 = _instructionFormatWire_T_145 ? 3'h1 : _instructionTypeWire_T_162; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_164 = _instructionFormatWire_T_142 ? 3'h3 : _instructionTypeWire_T_163; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_165 = _instructionFormatWire_T_139 ? 3'h3 : _instructionTypeWire_T_164; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_166 = _instructionFormatWire_T_136 ? 3'h3 : _instructionTypeWire_T_165; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_167 = _instructionFormatWire_T_133 ? 3'h3 : _instructionTypeWire_T_166; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_168 = _instructionFormatWire_T_130 ? 3'h3 : _instructionTypeWire_T_167; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_169 = _instructionFormatWire_T_127 ? 3'h3 : _instructionTypeWire_T_168; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_170 = _instructionFormatWire_T_124 ? 3'h1 : _instructionTypeWire_T_169; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_171 = _instructionFormatWire_T_121 ? 3'h5 : _instructionTypeWire_T_170; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_172 = _instructionFormatWire_T_120 ? 3'h0 : _instructionTypeWire_T_171; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_173 = _instructionFormatWire_T_115 ? 3'h0 : _instructionTypeWire_T_172; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_174 = _instructionFormatWire_T_110 ? 3'h0 : _instructionTypeWire_T_173; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_175 = _instructionFormatWire_T_105 ? 3'h0 : _instructionTypeWire_T_174; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_176 = _instructionFormatWire_T_100 ? 3'h0 : _instructionTypeWire_T_175; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_177 = _instructionFormatWire_T_95 ? 3'h0 : _instructionTypeWire_T_176; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_178 = _instructionFormatWire_T_90 ? 3'h0 : _instructionTypeWire_T_177; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_179 = _instructionFormatWire_T_85 ? 3'h0 : _instructionTypeWire_T_178; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_180 = _instructionFormatWire_T_80 ? 3'h0 : _instructionTypeWire_T_179; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_181 = _instructionFormatWire_T_75 ? 3'h0 : _instructionTypeWire_T_180; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_182 = _instructionFormatWire_T_70 ? 3'h4 : _instructionTypeWire_T_181; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_183 = _instructionFormatWire_T_69 ? 3'h4 : _instructionTypeWire_T_182; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_184 = _instructionFormatWire_T_68 ? 3'h1 : _instructionTypeWire_T_183; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_185 = _instructionFormatWire_T_62 ? 3'h1 : _instructionTypeWire_T_184; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_186 = _instructionFormatWire_T_56 ? 3'h1 : _instructionTypeWire_T_185; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_187 = _instructionFormatWire_T_50 ? 3'h1 : _instructionTypeWire_T_186; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_188 = _instructionFormatWire_T_47 ? 3'h1 : _instructionTypeWire_T_187; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_189 = _instructionFormatWire_T_44 ? 3'h1 : _instructionTypeWire_T_188; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_190 = _instructionFormatWire_T_41 ? 3'h1 : _instructionTypeWire_T_189; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_191 = _instructionFormatWire_T_38 ? 3'h1 : _instructionTypeWire_T_190; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_192 = _instructionFormatWire_T_35 ? 3'h1 : _instructionTypeWire_T_191; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_193 = _instructionFormatWire_T_32 ? 3'h1 : _instructionTypeWire_T_192; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_194 = _instructionFormatWire_T_29 ? 3'h1 : _instructionTypeWire_T_193; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_195 = _instructionFormatWire_T_26 ? 3'h1 : _instructionTypeWire_T_194; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_196 = _instructionFormatWire_T_23 ? 3'h1 : _instructionTypeWire_T_195; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_197 = _instructionFormatWire_T_20 ? 3'h1 : _instructionTypeWire_T_196; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_198 = _instructionFormatWire_T_17 ? 3'h1 : _instructionTypeWire_T_197; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instructionTypeWire_T_199 = _instructionFormatWire_T_14 ? 3'h0 : _instructionTypeWire_T_198; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _GEN_3 = 6'h11 == instructionFormatWire | 6'h10 == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 973:41]
  wire  _GEN_6 = 6'h12 == instructionFormatWire | _GEN_3; // @[src/main/scala/idu/ContrGen.scala 186:39 956:41]
  wire [1:0] _GEN_7 = 6'h12 == instructionFormatWire ? 2'h2 : {{1'd0}, 6'h11 == instructionFormatWire}; // @[src/main/scala/idu/ContrGen.scala 186:39 962:41]
  wire  _GEN_10 = 6'he == instructionFormatWire | _GEN_6; // @[src/main/scala/idu/ContrGen.scala 186:39 938:41]
  wire  _GEN_11 = 6'he == instructionFormatWire ? 1'h0 : _GEN_6; // @[src/main/scala/idu/ContrGen.scala 186:39 942:41]
  wire [2:0] _GEN_12 = 6'he == instructionFormatWire ? 3'h4 : {{1'd0}, _GEN_7}; // @[src/main/scala/idu/ContrGen.scala 186:39 944:41]
  wire  _GEN_13 = 6'hb == instructionFormatWire | 6'he == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 919:41]
  wire  _GEN_15 = 6'hb == instructionFormatWire | _GEN_10; // @[src/main/scala/idu/ContrGen.scala 186:39 921:41]
  wire  _GEN_16 = 6'hb == instructionFormatWire ? 1'h0 : _GEN_11; // @[src/main/scala/idu/ContrGen.scala 186:39 925:41]
  wire [2:0] _GEN_17 = 6'hb == instructionFormatWire ? 3'h0 : _GEN_12; // @[src/main/scala/idu/ContrGen.scala 186:39 927:41]
  wire  _GEN_18 = 6'hf == instructionFormatWire | _GEN_13; // @[src/main/scala/idu/ContrGen.scala 186:39 902:41]
  wire  _GEN_20 = 6'hf == instructionFormatWire | _GEN_15; // @[src/main/scala/idu/ContrGen.scala 186:39 904:41]
  wire  _GEN_21 = 6'hf == instructionFormatWire ? 1'h0 : _GEN_16; // @[src/main/scala/idu/ContrGen.scala 186:39 908:41]
  wire [2:0] _GEN_22 = 6'hf == instructionFormatWire ? 3'h5 : _GEN_17; // @[src/main/scala/idu/ContrGen.scala 186:39 910:41]
  wire  _GEN_23 = 6'hc == instructionFormatWire | _GEN_18; // @[src/main/scala/idu/ContrGen.scala 186:39 885:41]
  wire  _GEN_25 = 6'hc == instructionFormatWire | _GEN_20; // @[src/main/scala/idu/ContrGen.scala 186:39 887:41]
  wire  _GEN_26 = 6'hc == instructionFormatWire ? 1'h0 : _GEN_21; // @[src/main/scala/idu/ContrGen.scala 186:39 891:41]
  wire [2:0] _GEN_27 = 6'hc == instructionFormatWire ? 3'h1 : _GEN_22; // @[src/main/scala/idu/ContrGen.scala 186:39 893:41]
  wire  _GEN_28 = 6'hd == instructionFormatWire | _GEN_23; // @[src/main/scala/idu/ContrGen.scala 186:39 868:41]
  wire  _GEN_30 = 6'hd == instructionFormatWire | _GEN_25; // @[src/main/scala/idu/ContrGen.scala 186:39 870:41]
  wire  _GEN_31 = 6'hd == instructionFormatWire ? 1'h0 : _GEN_26; // @[src/main/scala/idu/ContrGen.scala 186:39 874:41]
  wire [2:0] _GEN_32 = 6'hd == instructionFormatWire ? 3'h2 : _GEN_27; // @[src/main/scala/idu/ContrGen.scala 186:39 876:41]
  wire  _GEN_33 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_28; // @[src/main/scala/idu/ContrGen.scala 186:39 849:41]
  wire  _GEN_35 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_30; // @[src/main/scala/idu/ContrGen.scala 186:39 851:41]
  wire [3:0] _GEN_36 = 6'ha == instructionFormatWire ? 4'ha : 4'h0; // @[src/main/scala/idu/ContrGen.scala 186:39 852:41]
  wire [2:0] _GEN_37 = 6'ha == instructionFormatWire ? 3'h7 : 3'h0; // @[src/main/scala/idu/ContrGen.scala 186:39 853:41]
  wire  _GEN_38 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_31; // @[src/main/scala/idu/ContrGen.scala 186:39 855:41]
  wire [2:0] _GEN_39 = 6'ha == instructionFormatWire ? 3'h0 : _GEN_32; // @[src/main/scala/idu/ContrGen.scala 186:39 857:41]
  wire  _GEN_40 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_33; // @[src/main/scala/idu/ContrGen.scala 186:39 832:41]
  wire  _GEN_42 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_35; // @[src/main/scala/idu/ContrGen.scala 186:39 834:41]
  wire [3:0] _GEN_43 = 6'h8 == instructionFormatWire ? 4'h2 : _GEN_36; // @[src/main/scala/idu/ContrGen.scala 186:39 835:41]
  wire [2:0] _GEN_44 = 6'h8 == instructionFormatWire ? 3'h7 : _GEN_37; // @[src/main/scala/idu/ContrGen.scala 186:39 836:41]
  wire  _GEN_45 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_38; // @[src/main/scala/idu/ContrGen.scala 186:39 838:41]
  wire [2:0] _GEN_46 = 6'h8 == instructionFormatWire ? 3'h0 : _GEN_39; // @[src/main/scala/idu/ContrGen.scala 186:39 840:41]
  wire  _GEN_47 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_40; // @[src/main/scala/idu/ContrGen.scala 186:39 815:41]
  wire  _GEN_49 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_42; // @[src/main/scala/idu/ContrGen.scala 186:39 817:41]
  wire [3:0] _GEN_50 = 6'h9 == instructionFormatWire ? 4'ha : _GEN_43; // @[src/main/scala/idu/ContrGen.scala 186:39 818:41]
  wire [2:0] _GEN_51 = 6'h9 == instructionFormatWire ? 3'h6 : _GEN_44; // @[src/main/scala/idu/ContrGen.scala 186:39 819:41]
  wire  _GEN_52 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_45; // @[src/main/scala/idu/ContrGen.scala 186:39 821:41]
  wire [2:0] _GEN_53 = 6'h9 == instructionFormatWire ? 3'h0 : _GEN_46; // @[src/main/scala/idu/ContrGen.scala 186:39 823:41]
  wire  _GEN_54 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_47; // @[src/main/scala/idu/ContrGen.scala 186:39 798:41]
  wire  _GEN_56 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_49; // @[src/main/scala/idu/ContrGen.scala 186:39 800:41]
  wire [3:0] _GEN_57 = 6'h7 == instructionFormatWire ? 4'h2 : _GEN_50; // @[src/main/scala/idu/ContrGen.scala 186:39 801:41]
  wire [2:0] _GEN_58 = 6'h7 == instructionFormatWire ? 3'h6 : _GEN_51; // @[src/main/scala/idu/ContrGen.scala 186:39 802:41]
  wire  _GEN_59 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_52; // @[src/main/scala/idu/ContrGen.scala 186:39 804:41]
  wire [2:0] _GEN_60 = 6'h7 == instructionFormatWire ? 3'h0 : _GEN_53; // @[src/main/scala/idu/ContrGen.scala 186:39 806:41]
  wire  _GEN_61 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_54; // @[src/main/scala/idu/ContrGen.scala 186:39 781:41]
  wire  _GEN_63 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_56; // @[src/main/scala/idu/ContrGen.scala 186:39 783:41]
  wire [3:0] _GEN_64 = 6'h6 == instructionFormatWire ? 4'h2 : _GEN_57; // @[src/main/scala/idu/ContrGen.scala 186:39 784:41]
  wire [2:0] _GEN_65 = 6'h6 == instructionFormatWire ? 3'h5 : _GEN_58; // @[src/main/scala/idu/ContrGen.scala 186:39 785:41]
  wire  _GEN_66 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_59; // @[src/main/scala/idu/ContrGen.scala 186:39 787:41]
  wire [2:0] _GEN_67 = 6'h6 == instructionFormatWire ? 3'h0 : _GEN_60; // @[src/main/scala/idu/ContrGen.scala 186:39 789:41]
  wire  _GEN_68 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_61; // @[src/main/scala/idu/ContrGen.scala 186:39 764:41]
  wire  _GEN_70 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_63; // @[src/main/scala/idu/ContrGen.scala 186:39 766:41]
  wire [3:0] _GEN_71 = 6'h5 == instructionFormatWire ? 4'h2 : _GEN_64; // @[src/main/scala/idu/ContrGen.scala 186:39 767:41]
  wire [2:0] _GEN_72 = 6'h5 == instructionFormatWire ? 3'h4 : _GEN_65; // @[src/main/scala/idu/ContrGen.scala 186:39 768:41]
  wire  _GEN_73 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_66; // @[src/main/scala/idu/ContrGen.scala 186:39 770:41]
  wire [2:0] _GEN_74 = 6'h5 == instructionFormatWire ? 3'h0 : _GEN_67; // @[src/main/scala/idu/ContrGen.scala 186:39 772:41]
  wire  _GEN_75 = 6'h4 == instructionFormatWire | _GEN_68; // @[src/main/scala/idu/ContrGen.scala 186:39 746:41]
  wire [1:0] _GEN_77 = 6'h4 == instructionFormatWire ? 2'h2 : {{1'd0}, _GEN_70}; // @[src/main/scala/idu/ContrGen.scala 186:39 748:41]
  wire [3:0] _GEN_78 = 6'h4 == instructionFormatWire ? 4'h0 : _GEN_71; // @[src/main/scala/idu/ContrGen.scala 186:39 749:41]
  wire [2:0] _GEN_79 = 6'h4 == instructionFormatWire ? 3'h2 : _GEN_72; // @[src/main/scala/idu/ContrGen.scala 186:39 750:41]
  wire  _GEN_80 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_68; // @[src/main/scala/idu/ContrGen.scala 186:39 751:37]
  wire  _GEN_81 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_73; // @[src/main/scala/idu/ContrGen.scala 186:39 752:41]
  wire  _GEN_82 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_70; // @[src/main/scala/idu/ContrGen.scala 186:39 753:37]
  wire [2:0] _GEN_83 = 6'h4 == instructionFormatWire ? 3'h0 : _GEN_74; // @[src/main/scala/idu/ContrGen.scala 186:39 754:41]
  wire  _GEN_85 = 6'h3 == instructionFormatWire | _GEN_75; // @[src/main/scala/idu/ContrGen.scala 186:39 729:41]
  wire  _GEN_86 = 6'h3 == instructionFormatWire | 6'h4 == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 730:41]
  wire [1:0] _GEN_87 = 6'h3 == instructionFormatWire ? 2'h2 : _GEN_77; // @[src/main/scala/idu/ContrGen.scala 186:39 731:41]
  wire [3:0] _GEN_88 = 6'h3 == instructionFormatWire ? 4'h0 : _GEN_78; // @[src/main/scala/idu/ContrGen.scala 186:39 732:41]
  wire [2:0] _GEN_89 = 6'h3 == instructionFormatWire ? 3'h1 : _GEN_79; // @[src/main/scala/idu/ContrGen.scala 186:39 733:41]
  wire  _GEN_90 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_80; // @[src/main/scala/idu/ContrGen.scala 186:39 734:37]
  wire  _GEN_91 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_81; // @[src/main/scala/idu/ContrGen.scala 186:39 735:41]
  wire  _GEN_92 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_82; // @[src/main/scala/idu/ContrGen.scala 186:39 736:37]
  wire [2:0] _GEN_93 = 6'h3 == instructionFormatWire ? 3'h0 : _GEN_83; // @[src/main/scala/idu/ContrGen.scala 186:39 737:41]
  wire  _GEN_95 = 6'h23 == instructionFormatWire | _GEN_85; // @[src/main/scala/idu/ContrGen.scala 186:39 709:41]
  wire  _GEN_96 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_86; // @[src/main/scala/idu/ContrGen.scala 186:39 710:41]
  wire [1:0] _GEN_97 = 6'h23 == instructionFormatWire ? 2'h0 : _GEN_87; // @[src/main/scala/idu/ContrGen.scala 186:39 711:41]
  wire [3:0] _GEN_98 = 6'h23 == instructionFormatWire ? 4'hd : _GEN_88; // @[src/main/scala/idu/ContrGen.scala 186:39 712:41]
  wire [2:0] _GEN_99 = 6'h23 == instructionFormatWire ? 3'h0 : _GEN_89; // @[src/main/scala/idu/ContrGen.scala 186:39 713:41]
  wire  _GEN_100 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_90; // @[src/main/scala/idu/ContrGen.scala 186:39 714:37]
  wire  _GEN_101 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_91; // @[src/main/scala/idu/ContrGen.scala 186:39 715:41]
  wire  _GEN_102 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_92; // @[src/main/scala/idu/ContrGen.scala 186:39 716:37]
  wire [2:0] _GEN_103 = 6'h23 == instructionFormatWire ? 3'h0 : _GEN_93; // @[src/main/scala/idu/ContrGen.scala 186:39 717:41]
  wire  _GEN_105 = 6'h1d == instructionFormatWire | _GEN_95; // @[src/main/scala/idu/ContrGen.scala 186:39 692:41]
  wire  _GEN_106 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_96; // @[src/main/scala/idu/ContrGen.scala 186:39 693:41]
  wire [1:0] _GEN_107 = 6'h1d == instructionFormatWire ? 2'h0 : _GEN_97; // @[src/main/scala/idu/ContrGen.scala 186:39 694:41]
  wire [3:0] _GEN_108 = 6'h1d == instructionFormatWire ? 4'h8 : _GEN_98; // @[src/main/scala/idu/ContrGen.scala 186:39 695:41]
  wire [2:0] _GEN_109 = 6'h1d == instructionFormatWire ? 3'h0 : _GEN_99; // @[src/main/scala/idu/ContrGen.scala 186:39 696:41]
  wire  _GEN_110 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_100; // @[src/main/scala/idu/ContrGen.scala 186:39 697:37]
  wire  _GEN_111 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_101; // @[src/main/scala/idu/ContrGen.scala 186:39 698:41]
  wire  _GEN_112 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_102; // @[src/main/scala/idu/ContrGen.scala 186:39 699:37]
  wire [2:0] _GEN_113 = 6'h1d == instructionFormatWire ? 3'h0 : _GEN_103; // @[src/main/scala/idu/ContrGen.scala 186:39 700:41]
  wire  _GEN_115 = 6'h22 == instructionFormatWire | _GEN_105; // @[src/main/scala/idu/ContrGen.scala 186:39 675:41]
  wire  _GEN_116 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_106; // @[src/main/scala/idu/ContrGen.scala 186:39 676:41]
  wire [1:0] _GEN_117 = 6'h22 == instructionFormatWire ? 2'h0 : _GEN_107; // @[src/main/scala/idu/ContrGen.scala 186:39 677:41]
  wire [3:0] _GEN_118 = 6'h22 == instructionFormatWire ? 4'h5 : _GEN_108; // @[src/main/scala/idu/ContrGen.scala 186:39 678:41]
  wire [2:0] _GEN_119 = 6'h22 == instructionFormatWire ? 3'h0 : _GEN_109; // @[src/main/scala/idu/ContrGen.scala 186:39 679:41]
  wire  _GEN_120 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_110; // @[src/main/scala/idu/ContrGen.scala 186:39 680:37]
  wire  _GEN_121 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_111; // @[src/main/scala/idu/ContrGen.scala 186:39 681:41]
  wire  _GEN_122 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_112; // @[src/main/scala/idu/ContrGen.scala 186:39 682:37]
  wire [2:0] _GEN_123 = 6'h22 == instructionFormatWire ? 3'h0 : _GEN_113; // @[src/main/scala/idu/ContrGen.scala 186:39 683:41]
  wire  _GEN_125 = 6'h1e == instructionFormatWire | _GEN_115; // @[src/main/scala/idu/ContrGen.scala 186:39 658:41]
  wire  _GEN_126 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_116; // @[src/main/scala/idu/ContrGen.scala 186:39 659:41]
  wire [1:0] _GEN_127 = 6'h1e == instructionFormatWire ? 2'h0 : _GEN_117; // @[src/main/scala/idu/ContrGen.scala 186:39 660:41]
  wire [3:0] _GEN_128 = 6'h1e == instructionFormatWire ? 4'h1 : _GEN_118; // @[src/main/scala/idu/ContrGen.scala 186:39 661:41]
  wire [2:0] _GEN_129 = 6'h1e == instructionFormatWire ? 3'h0 : _GEN_119; // @[src/main/scala/idu/ContrGen.scala 186:39 662:41]
  wire  _GEN_130 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_120; // @[src/main/scala/idu/ContrGen.scala 186:39 663:37]
  wire  _GEN_131 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_121; // @[src/main/scala/idu/ContrGen.scala 186:39 664:41]
  wire  _GEN_132 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_122; // @[src/main/scala/idu/ContrGen.scala 186:39 665:37]
  wire [2:0] _GEN_133 = 6'h1e == instructionFormatWire ? 3'h0 : _GEN_123; // @[src/main/scala/idu/ContrGen.scala 186:39 666:41]
  wire  _GEN_135 = 6'h21 == instructionFormatWire | _GEN_125; // @[src/main/scala/idu/ContrGen.scala 186:39 641:41]
  wire  _GEN_136 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_126; // @[src/main/scala/idu/ContrGen.scala 186:39 642:41]
  wire [1:0] _GEN_137 = 6'h21 == instructionFormatWire ? 2'h0 : _GEN_127; // @[src/main/scala/idu/ContrGen.scala 186:39 643:41]
  wire [3:0] _GEN_138 = 6'h21 == instructionFormatWire ? 4'h4 : _GEN_128; // @[src/main/scala/idu/ContrGen.scala 186:39 644:41]
  wire [2:0] _GEN_139 = 6'h21 == instructionFormatWire ? 3'h0 : _GEN_129; // @[src/main/scala/idu/ContrGen.scala 186:39 645:41]
  wire  _GEN_140 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_130; // @[src/main/scala/idu/ContrGen.scala 186:39 646:37]
  wire  _GEN_141 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_131; // @[src/main/scala/idu/ContrGen.scala 186:39 647:41]
  wire  _GEN_142 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_132; // @[src/main/scala/idu/ContrGen.scala 186:39 648:37]
  wire [2:0] _GEN_143 = 6'h21 == instructionFormatWire ? 3'h0 : _GEN_133; // @[src/main/scala/idu/ContrGen.scala 186:39 649:41]
  wire  _GEN_145 = 6'h24 == instructionFormatWire | _GEN_135; // @[src/main/scala/idu/ContrGen.scala 186:39 624:41]
  wire  _GEN_146 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_136; // @[src/main/scala/idu/ContrGen.scala 186:39 625:41]
  wire [1:0] _GEN_147 = 6'h24 == instructionFormatWire ? 2'h0 : _GEN_137; // @[src/main/scala/idu/ContrGen.scala 186:39 626:41]
  wire [3:0] _GEN_148 = 6'h24 == instructionFormatWire ? 4'h6 : _GEN_138; // @[src/main/scala/idu/ContrGen.scala 186:39 627:41]
  wire [2:0] _GEN_149 = 6'h24 == instructionFormatWire ? 3'h0 : _GEN_139; // @[src/main/scala/idu/ContrGen.scala 186:39 628:41]
  wire  _GEN_150 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_140; // @[src/main/scala/idu/ContrGen.scala 186:39 629:37]
  wire  _GEN_151 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_141; // @[src/main/scala/idu/ContrGen.scala 186:39 630:41]
  wire  _GEN_152 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_142; // @[src/main/scala/idu/ContrGen.scala 186:39 631:37]
  wire [2:0] _GEN_153 = 6'h24 == instructionFormatWire ? 3'h0 : _GEN_143; // @[src/main/scala/idu/ContrGen.scala 186:39 632:41]
  wire  _GEN_155 = 6'h25 == instructionFormatWire | _GEN_145; // @[src/main/scala/idu/ContrGen.scala 186:39 607:41]
  wire  _GEN_156 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_146; // @[src/main/scala/idu/ContrGen.scala 186:39 608:41]
  wire [1:0] _GEN_157 = 6'h25 == instructionFormatWire ? 2'h0 : _GEN_147; // @[src/main/scala/idu/ContrGen.scala 186:39 609:41]
  wire [3:0] _GEN_158 = 6'h25 == instructionFormatWire ? 4'h7 : _GEN_148; // @[src/main/scala/idu/ContrGen.scala 186:39 610:41]
  wire [2:0] _GEN_159 = 6'h25 == instructionFormatWire ? 3'h0 : _GEN_149; // @[src/main/scala/idu/ContrGen.scala 186:39 611:41]
  wire  _GEN_160 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_150; // @[src/main/scala/idu/ContrGen.scala 186:39 612:37]
  wire  _GEN_161 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_151; // @[src/main/scala/idu/ContrGen.scala 186:39 613:41]
  wire  _GEN_162 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_152; // @[src/main/scala/idu/ContrGen.scala 186:39 614:37]
  wire [2:0] _GEN_163 = 6'h25 == instructionFormatWire ? 3'h0 : _GEN_153; // @[src/main/scala/idu/ContrGen.scala 186:39 615:41]
  wire  _GEN_165 = 6'h20 == instructionFormatWire | _GEN_155; // @[src/main/scala/idu/ContrGen.scala 186:39 589:41]
  wire  _GEN_166 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_156; // @[src/main/scala/idu/ContrGen.scala 186:39 590:41]
  wire [1:0] _GEN_167 = 6'h20 == instructionFormatWire ? 2'h0 : _GEN_157; // @[src/main/scala/idu/ContrGen.scala 186:39 591:41]
  wire [3:0] _GEN_168 = 6'h20 == instructionFormatWire ? 4'ha : _GEN_158; // @[src/main/scala/idu/ContrGen.scala 186:39 592:41]
  wire [2:0] _GEN_169 = 6'h20 == instructionFormatWire ? 3'h0 : _GEN_159; // @[src/main/scala/idu/ContrGen.scala 186:39 593:41]
  wire  _GEN_170 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_160; // @[src/main/scala/idu/ContrGen.scala 186:39 594:37]
  wire  _GEN_171 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_161; // @[src/main/scala/idu/ContrGen.scala 186:39 595:41]
  wire  _GEN_172 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_162; // @[src/main/scala/idu/ContrGen.scala 186:39 596:37]
  wire [2:0] _GEN_173 = 6'h20 == instructionFormatWire ? 3'h0 : _GEN_163; // @[src/main/scala/idu/ContrGen.scala 186:39 597:41]
  wire  _GEN_175 = 6'h1f == instructionFormatWire | _GEN_165; // @[src/main/scala/idu/ContrGen.scala 186:39 572:41]
  wire  _GEN_176 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_166; // @[src/main/scala/idu/ContrGen.scala 186:39 573:41]
  wire [1:0] _GEN_177 = 6'h1f == instructionFormatWire ? 2'h0 : _GEN_167; // @[src/main/scala/idu/ContrGen.scala 186:39 574:41]
  wire [3:0] _GEN_178 = 6'h1f == instructionFormatWire ? 4'h2 : _GEN_168; // @[src/main/scala/idu/ContrGen.scala 186:39 575:41]
  wire [2:0] _GEN_179 = 6'h1f == instructionFormatWire ? 3'h0 : _GEN_169; // @[src/main/scala/idu/ContrGen.scala 186:39 576:41]
  wire  _GEN_180 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_170; // @[src/main/scala/idu/ContrGen.scala 186:39 577:37]
  wire  _GEN_181 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_171; // @[src/main/scala/idu/ContrGen.scala 186:39 578:41]
  wire  _GEN_182 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_172; // @[src/main/scala/idu/ContrGen.scala 186:39 579:37]
  wire [2:0] _GEN_183 = 6'h1f == instructionFormatWire ? 3'h0 : _GEN_173; // @[src/main/scala/idu/ContrGen.scala 186:39 580:41]
  wire  _GEN_185 = 6'h1c == instructionFormatWire | _GEN_175; // @[src/main/scala/idu/ContrGen.scala 186:39 555:41]
  wire  _GEN_186 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_176; // @[src/main/scala/idu/ContrGen.scala 186:39 556:41]
  wire [1:0] _GEN_187 = 6'h1c == instructionFormatWire ? 2'h0 : _GEN_177; // @[src/main/scala/idu/ContrGen.scala 186:39 557:41]
  wire [3:0] _GEN_188 = 6'h1c == instructionFormatWire ? 4'h0 : _GEN_178; // @[src/main/scala/idu/ContrGen.scala 186:39 558:41]
  wire [2:0] _GEN_189 = 6'h1c == instructionFormatWire ? 3'h0 : _GEN_179; // @[src/main/scala/idu/ContrGen.scala 186:39 559:41]
  wire  _GEN_190 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_180; // @[src/main/scala/idu/ContrGen.scala 186:39 560:37]
  wire  _GEN_191 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_181; // @[src/main/scala/idu/ContrGen.scala 186:39 561:41]
  wire  _GEN_192 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_182; // @[src/main/scala/idu/ContrGen.scala 186:39 562:37]
  wire [2:0] _GEN_193 = 6'h1c == instructionFormatWire ? 3'h0 : _GEN_183; // @[src/main/scala/idu/ContrGen.scala 186:39 563:41]
  wire  _GEN_195 = 6'h2 == instructionFormatWire | _GEN_185; // @[src/main/scala/idu/ContrGen.scala 186:39 537:41]
  wire  _GEN_196 = 6'h2 == instructionFormatWire | _GEN_186; // @[src/main/scala/idu/ContrGen.scala 186:39 538:41]
  wire [1:0] _GEN_197 = 6'h2 == instructionFormatWire ? 2'h1 : _GEN_187; // @[src/main/scala/idu/ContrGen.scala 186:39 539:41]
  wire [3:0] _GEN_198 = 6'h2 == instructionFormatWire ? 4'h0 : _GEN_188; // @[src/main/scala/idu/ContrGen.scala 186:39 540:41]
  wire [2:0] _GEN_199 = 6'h2 == instructionFormatWire ? 3'h0 : _GEN_189; // @[src/main/scala/idu/ContrGen.scala 186:39 541:41]
  wire  _GEN_200 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_190; // @[src/main/scala/idu/ContrGen.scala 186:39 542:37]
  wire  _GEN_201 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_191; // @[src/main/scala/idu/ContrGen.scala 186:39 543:41]
  wire  _GEN_202 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_192; // @[src/main/scala/idu/ContrGen.scala 186:39 544:37]
  wire [2:0] _GEN_203 = 6'h2 == instructionFormatWire ? 3'h0 : _GEN_193; // @[src/main/scala/idu/ContrGen.scala 186:39 545:41]
  wire  _GEN_205 = 6'h1 == instructionFormatWire | _GEN_195; // @[src/main/scala/idu/ContrGen.scala 186:39 520:41]
  wire  _GEN_206 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_196; // @[src/main/scala/idu/ContrGen.scala 186:39 521:41]
  wire [1:0] _GEN_207 = 6'h1 == instructionFormatWire ? 2'h1 : _GEN_197; // @[src/main/scala/idu/ContrGen.scala 186:39 522:41]
  wire [3:0] _GEN_208 = 6'h1 == instructionFormatWire ? 4'h3 : _GEN_198; // @[src/main/scala/idu/ContrGen.scala 186:39 523:41]
  wire [2:0] _GEN_209 = 6'h1 == instructionFormatWire ? 3'h0 : _GEN_199; // @[src/main/scala/idu/ContrGen.scala 186:39 524:41]
  wire  _GEN_210 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_200; // @[src/main/scala/idu/ContrGen.scala 186:39 525:37]
  wire  _GEN_211 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_201; // @[src/main/scala/idu/ContrGen.scala 186:39 526:41]
  wire  _GEN_212 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_202; // @[src/main/scala/idu/ContrGen.scala 186:39 527:37]
  wire [2:0] _GEN_213 = 6'h1 == instructionFormatWire ? 3'h0 : _GEN_203; // @[src/main/scala/idu/ContrGen.scala 186:39 528:41]
  wire  _GEN_215 = 6'h1b == instructionFormatWire | _GEN_205; // @[src/main/scala/idu/ContrGen.scala 186:39 503:41]
  wire  _GEN_216 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_206; // @[src/main/scala/idu/ContrGen.scala 186:39 504:41]
  wire [1:0] _GEN_217 = 6'h1b == instructionFormatWire ? 2'h1 : _GEN_207; // @[src/main/scala/idu/ContrGen.scala 186:39 505:41]
  wire [3:0] _GEN_218 = 6'h1b == instructionFormatWire ? 4'hd : _GEN_208; // @[src/main/scala/idu/ContrGen.scala 186:39 506:41]
  wire [2:0] _GEN_219 = 6'h1b == instructionFormatWire ? 3'h0 : _GEN_209; // @[src/main/scala/idu/ContrGen.scala 186:39 507:41]
  wire  _GEN_220 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_210; // @[src/main/scala/idu/ContrGen.scala 186:39 508:37]
  wire  _GEN_221 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_211; // @[src/main/scala/idu/ContrGen.scala 186:39 509:41]
  wire  _GEN_222 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_212; // @[src/main/scala/idu/ContrGen.scala 186:39 510:37]
  wire [2:0] _GEN_223 = 6'h1b == instructionFormatWire ? 3'h0 : _GEN_213; // @[src/main/scala/idu/ContrGen.scala 186:39 511:41]
  wire  _GEN_225 = 6'h1a == instructionFormatWire | _GEN_215; // @[src/main/scala/idu/ContrGen.scala 186:39 486:41]
  wire  _GEN_226 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_216; // @[src/main/scala/idu/ContrGen.scala 186:39 487:41]
  wire [1:0] _GEN_227 = 6'h1a == instructionFormatWire ? 2'h1 : _GEN_217; // @[src/main/scala/idu/ContrGen.scala 186:39 488:41]
  wire [3:0] _GEN_228 = 6'h1a == instructionFormatWire ? 4'h5 : _GEN_218; // @[src/main/scala/idu/ContrGen.scala 186:39 489:41]
  wire [2:0] _GEN_229 = 6'h1a == instructionFormatWire ? 3'h0 : _GEN_219; // @[src/main/scala/idu/ContrGen.scala 186:39 490:41]
  wire  _GEN_230 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_220; // @[src/main/scala/idu/ContrGen.scala 186:39 491:37]
  wire  _GEN_231 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_221; // @[src/main/scala/idu/ContrGen.scala 186:39 492:41]
  wire  _GEN_232 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_222; // @[src/main/scala/idu/ContrGen.scala 186:39 493:37]
  wire [2:0] _GEN_233 = 6'h1a == instructionFormatWire ? 3'h0 : _GEN_223; // @[src/main/scala/idu/ContrGen.scala 186:39 494:41]
  wire  _GEN_235 = 6'h19 == instructionFormatWire | _GEN_225; // @[src/main/scala/idu/ContrGen.scala 186:39 469:41]
  wire  _GEN_236 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_226; // @[src/main/scala/idu/ContrGen.scala 186:39 470:41]
  wire [1:0] _GEN_237 = 6'h19 == instructionFormatWire ? 2'h1 : _GEN_227; // @[src/main/scala/idu/ContrGen.scala 186:39 471:41]
  wire [3:0] _GEN_238 = 6'h19 == instructionFormatWire ? 4'h1 : _GEN_228; // @[src/main/scala/idu/ContrGen.scala 186:39 472:41]
  wire [2:0] _GEN_239 = 6'h19 == instructionFormatWire ? 3'h0 : _GEN_229; // @[src/main/scala/idu/ContrGen.scala 186:39 473:41]
  wire  _GEN_240 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_230; // @[src/main/scala/idu/ContrGen.scala 186:39 474:37]
  wire  _GEN_241 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_231; // @[src/main/scala/idu/ContrGen.scala 186:39 475:41]
  wire  _GEN_242 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_232; // @[src/main/scala/idu/ContrGen.scala 186:39 476:37]
  wire [2:0] _GEN_243 = 6'h19 == instructionFormatWire ? 3'h0 : _GEN_233; // @[src/main/scala/idu/ContrGen.scala 186:39 477:41]
  wire  _GEN_245 = 6'h16 == instructionFormatWire | _GEN_235; // @[src/main/scala/idu/ContrGen.scala 186:39 452:41]
  wire  _GEN_246 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_236; // @[src/main/scala/idu/ContrGen.scala 186:39 453:41]
  wire [1:0] _GEN_247 = 6'h16 == instructionFormatWire ? 2'h1 : _GEN_237; // @[src/main/scala/idu/ContrGen.scala 186:39 454:41]
  wire [3:0] _GEN_248 = 6'h16 == instructionFormatWire ? 4'h4 : _GEN_238; // @[src/main/scala/idu/ContrGen.scala 186:39 455:41]
  wire [2:0] _GEN_249 = 6'h16 == instructionFormatWire ? 3'h0 : _GEN_239; // @[src/main/scala/idu/ContrGen.scala 186:39 456:41]
  wire  _GEN_250 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_240; // @[src/main/scala/idu/ContrGen.scala 186:39 457:37]
  wire  _GEN_251 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_241; // @[src/main/scala/idu/ContrGen.scala 186:39 458:41]
  wire  _GEN_252 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_242; // @[src/main/scala/idu/ContrGen.scala 186:39 459:37]
  wire [2:0] _GEN_253 = 6'h16 == instructionFormatWire ? 3'h0 : _GEN_243; // @[src/main/scala/idu/ContrGen.scala 186:39 460:41]
  wire  _GEN_255 = 6'h17 == instructionFormatWire | _GEN_245; // @[src/main/scala/idu/ContrGen.scala 186:39 435:41]
  wire  _GEN_256 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_246; // @[src/main/scala/idu/ContrGen.scala 186:39 436:41]
  wire [1:0] _GEN_257 = 6'h17 == instructionFormatWire ? 2'h1 : _GEN_247; // @[src/main/scala/idu/ContrGen.scala 186:39 437:41]
  wire [3:0] _GEN_258 = 6'h17 == instructionFormatWire ? 4'h6 : _GEN_248; // @[src/main/scala/idu/ContrGen.scala 186:39 438:41]
  wire [2:0] _GEN_259 = 6'h17 == instructionFormatWire ? 3'h0 : _GEN_249; // @[src/main/scala/idu/ContrGen.scala 186:39 439:41]
  wire  _GEN_260 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_250; // @[src/main/scala/idu/ContrGen.scala 186:39 440:37]
  wire  _GEN_261 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_251; // @[src/main/scala/idu/ContrGen.scala 186:39 441:41]
  wire  _GEN_262 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_252; // @[src/main/scala/idu/ContrGen.scala 186:39 442:37]
  wire [2:0] _GEN_263 = 6'h17 == instructionFormatWire ? 3'h0 : _GEN_253; // @[src/main/scala/idu/ContrGen.scala 186:39 443:41]
  wire  _GEN_265 = 6'h18 == instructionFormatWire | _GEN_255; // @[src/main/scala/idu/ContrGen.scala 186:39 418:41]
  wire  _GEN_266 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_256; // @[src/main/scala/idu/ContrGen.scala 186:39 419:41]
  wire [1:0] _GEN_267 = 6'h18 == instructionFormatWire ? 2'h1 : _GEN_257; // @[src/main/scala/idu/ContrGen.scala 186:39 420:41]
  wire [3:0] _GEN_268 = 6'h18 == instructionFormatWire ? 4'h7 : _GEN_258; // @[src/main/scala/idu/ContrGen.scala 186:39 421:41]
  wire [2:0] _GEN_269 = 6'h18 == instructionFormatWire ? 3'h0 : _GEN_259; // @[src/main/scala/idu/ContrGen.scala 186:39 422:41]
  wire  _GEN_270 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_260; // @[src/main/scala/idu/ContrGen.scala 186:39 423:37]
  wire  _GEN_271 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_261; // @[src/main/scala/idu/ContrGen.scala 186:39 424:41]
  wire  _GEN_272 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_262; // @[src/main/scala/idu/ContrGen.scala 186:39 425:37]
  wire [2:0] _GEN_273 = 6'h18 == instructionFormatWire ? 3'h0 : _GEN_263; // @[src/main/scala/idu/ContrGen.scala 186:39 426:41]
  wire  _GEN_275 = 6'h15 == instructionFormatWire | _GEN_265; // @[src/main/scala/idu/ContrGen.scala 186:39 401:41]
  wire  _GEN_276 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_266; // @[src/main/scala/idu/ContrGen.scala 186:39 402:41]
  wire [1:0] _GEN_277 = 6'h15 == instructionFormatWire ? 2'h1 : _GEN_267; // @[src/main/scala/idu/ContrGen.scala 186:39 403:41]
  wire [3:0] _GEN_278 = 6'h15 == instructionFormatWire ? 4'ha : _GEN_268; // @[src/main/scala/idu/ContrGen.scala 186:39 404:41]
  wire [2:0] _GEN_279 = 6'h15 == instructionFormatWire ? 3'h0 : _GEN_269; // @[src/main/scala/idu/ContrGen.scala 186:39 405:41]
  wire  _GEN_280 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_270; // @[src/main/scala/idu/ContrGen.scala 186:39 406:37]
  wire  _GEN_281 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_271; // @[src/main/scala/idu/ContrGen.scala 186:39 407:41]
  wire  _GEN_282 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_272; // @[src/main/scala/idu/ContrGen.scala 186:39 408:37]
  wire [2:0] _GEN_283 = 6'h15 == instructionFormatWire ? 3'h0 : _GEN_273; // @[src/main/scala/idu/ContrGen.scala 186:39 409:41]
  wire  _GEN_285 = 6'h14 == instructionFormatWire | _GEN_275; // @[src/main/scala/idu/ContrGen.scala 186:39 384:41]
  wire  _GEN_286 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_276; // @[src/main/scala/idu/ContrGen.scala 186:39 385:41]
  wire [1:0] _GEN_287 = 6'h14 == instructionFormatWire ? 2'h1 : _GEN_277; // @[src/main/scala/idu/ContrGen.scala 186:39 386:41]
  wire [3:0] _GEN_288 = 6'h14 == instructionFormatWire ? 4'h2 : _GEN_278; // @[src/main/scala/idu/ContrGen.scala 186:39 387:41]
  wire [2:0] _GEN_289 = 6'h14 == instructionFormatWire ? 3'h0 : _GEN_279; // @[src/main/scala/idu/ContrGen.scala 186:39 388:41]
  wire  _GEN_290 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_280; // @[src/main/scala/idu/ContrGen.scala 186:39 389:37]
  wire  _GEN_291 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_281; // @[src/main/scala/idu/ContrGen.scala 186:39 390:41]
  wire  _GEN_292 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_282; // @[src/main/scala/idu/ContrGen.scala 186:39 391:37]
  wire [2:0] _GEN_293 = 6'h14 == instructionFormatWire ? 3'h0 : _GEN_283; // @[src/main/scala/idu/ContrGen.scala 186:39 392:41]
  wire  _GEN_295 = 6'h13 == instructionFormatWire | _GEN_285; // @[src/main/scala/idu/ContrGen.scala 186:39 367:41]
  wire  _GEN_296 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_286; // @[src/main/scala/idu/ContrGen.scala 186:39 368:41]
  wire [1:0] _GEN_297 = 6'h13 == instructionFormatWire ? 2'h1 : _GEN_287; // @[src/main/scala/idu/ContrGen.scala 186:39 369:41]
  wire [3:0] _GEN_298 = 6'h13 == instructionFormatWire ? 4'h0 : _GEN_288; // @[src/main/scala/idu/ContrGen.scala 186:39 370:41]
  wire [2:0] _GEN_299 = 6'h13 == instructionFormatWire ? 3'h0 : _GEN_289; // @[src/main/scala/idu/ContrGen.scala 186:39 371:41]
  wire  _GEN_300 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_290; // @[src/main/scala/idu/ContrGen.scala 186:39 372:37]
  wire  _GEN_301 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_291; // @[src/main/scala/idu/ContrGen.scala 186:39 373:41]
  wire  _GEN_302 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_292; // @[src/main/scala/idu/ContrGen.scala 186:39 374:37]
  wire [2:0] _GEN_303 = 6'h13 == instructionFormatWire ? 3'h0 : _GEN_293; // @[src/main/scala/idu/ContrGen.scala 186:39 375:41]
  wire  _GEN_305 = 6'h2e == instructionFormatWire | _GEN_295; // @[src/main/scala/idu/ContrGen.scala 186:39 345:41]
  wire  _GEN_306 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_296; // @[src/main/scala/idu/ContrGen.scala 186:39 346:41]
  wire [1:0] _GEN_307 = 6'h2e == instructionFormatWire ? 2'h0 : _GEN_297; // @[src/main/scala/idu/ContrGen.scala 186:39 347:41]
  wire [3:0] _GEN_308 = 6'h2e == instructionFormatWire ? 4'h0 : _GEN_298; // @[src/main/scala/idu/ContrGen.scala 186:39 348:41]
  wire [2:0] _GEN_309 = 6'h2e == instructionFormatWire ? 3'h0 : _GEN_299; // @[src/main/scala/idu/ContrGen.scala 186:39 349:41]
  wire [1:0] _GEN_310 = 6'h2e == instructionFormatWire ? 2'h2 : {{1'd0}, _GEN_300}; // @[src/main/scala/idu/ContrGen.scala 186:39 350:37]
  wire  _GEN_311 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_301; // @[src/main/scala/idu/ContrGen.scala 186:39 351:41]
  wire  _GEN_312 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_302; // @[src/main/scala/idu/ContrGen.scala 186:39 352:37]
  wire [2:0] _GEN_313 = 6'h2e == instructionFormatWire ? 3'h0 : _GEN_303; // @[src/main/scala/idu/ContrGen.scala 186:39 353:41]
  wire [1:0] _GEN_316 = 6'h2e == instructionFormatWire ? 2'h2 : 2'h0; // @[src/main/scala/idu/ContrGen.scala 186:39 359:25]
  wire  _GEN_317 = 6'h2b == instructionFormatWire | _GEN_305; // @[src/main/scala/idu/ContrGen.scala 186:39 328:41]
  wire  _GEN_318 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_306; // @[src/main/scala/idu/ContrGen.scala 186:39 329:41]
  wire [1:0] _GEN_319 = 6'h2b == instructionFormatWire ? 2'h0 : _GEN_307; // @[src/main/scala/idu/ContrGen.scala 186:39 330:41]
  wire [3:0] _GEN_320 = 6'h2b == instructionFormatWire ? 4'h0 : _GEN_308; // @[src/main/scala/idu/ContrGen.scala 186:39 331:41]
  wire [2:0] _GEN_321 = 6'h2b == instructionFormatWire ? 3'h0 : _GEN_309; // @[src/main/scala/idu/ContrGen.scala 186:39 332:41]
  wire [1:0] _GEN_322 = 6'h2b == instructionFormatWire ? 2'h2 : _GEN_310; // @[src/main/scala/idu/ContrGen.scala 186:39 333:37]
  wire  _GEN_323 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_311; // @[src/main/scala/idu/ContrGen.scala 186:39 334:41]
  wire  _GEN_324 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_312; // @[src/main/scala/idu/ContrGen.scala 186:39 335:37]
  wire [2:0] _GEN_325 = 6'h2b == instructionFormatWire ? 3'h0 : _GEN_313; // @[src/main/scala/idu/ContrGen.scala 186:39 336:41]
  wire  _GEN_326 = 6'h2b == instructionFormatWire | 6'h2e == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 337:33]
  wire  _GEN_327 = 6'h2b == instructionFormatWire ? 1'h0 : 6'h2e == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 338:25]
  wire [1:0] _GEN_329 = 6'h2b == instructionFormatWire ? 2'h2 : _GEN_316; // @[src/main/scala/idu/ContrGen.scala 186:39 342:25]
  wire  _GEN_330 = 6'h2f == instructionFormatWire | _GEN_317; // @[src/main/scala/idu/ContrGen.scala 186:39 311:41]
  wire  _GEN_331 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_318; // @[src/main/scala/idu/ContrGen.scala 186:39 312:41]
  wire [1:0] _GEN_332 = 6'h2f == instructionFormatWire ? 2'h0 : _GEN_319; // @[src/main/scala/idu/ContrGen.scala 186:39 313:41]
  wire [3:0] _GEN_333 = 6'h2f == instructionFormatWire ? 4'h0 : _GEN_320; // @[src/main/scala/idu/ContrGen.scala 186:39 314:41]
  wire [2:0] _GEN_334 = 6'h2f == instructionFormatWire ? 3'h0 : _GEN_321; // @[src/main/scala/idu/ContrGen.scala 186:39 315:41]
  wire [1:0] _GEN_335 = 6'h2f == instructionFormatWire ? 2'h2 : _GEN_322; // @[src/main/scala/idu/ContrGen.scala 186:39 316:37]
  wire  _GEN_336 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_323; // @[src/main/scala/idu/ContrGen.scala 186:39 317:41]
  wire  _GEN_337 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_324; // @[src/main/scala/idu/ContrGen.scala 186:39 318:37]
  wire [2:0] _GEN_338 = 6'h2f == instructionFormatWire ? 3'h0 : _GEN_325; // @[src/main/scala/idu/ContrGen.scala 186:39 319:41]
  wire  _GEN_339 = 6'h2f == instructionFormatWire | _GEN_326; // @[src/main/scala/idu/ContrGen.scala 186:39 320:33]
  wire  _GEN_340 = 6'h2f == instructionFormatWire | _GEN_327; // @[src/main/scala/idu/ContrGen.scala 186:39 321:25]
  wire [1:0] _GEN_342 = 6'h2f == instructionFormatWire ? 2'h1 : _GEN_329; // @[src/main/scala/idu/ContrGen.scala 186:39 325:25]
  wire  _GEN_343 = 6'h2c == instructionFormatWire | _GEN_330; // @[src/main/scala/idu/ContrGen.scala 186:39 294:41]
  wire  _GEN_344 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_331; // @[src/main/scala/idu/ContrGen.scala 186:39 295:41]
  wire [1:0] _GEN_345 = 6'h2c == instructionFormatWire ? 2'h0 : _GEN_332; // @[src/main/scala/idu/ContrGen.scala 186:39 296:41]
  wire [3:0] _GEN_346 = 6'h2c == instructionFormatWire ? 4'h0 : _GEN_333; // @[src/main/scala/idu/ContrGen.scala 186:39 297:41]
  wire [2:0] _GEN_347 = 6'h2c == instructionFormatWire ? 3'h0 : _GEN_334; // @[src/main/scala/idu/ContrGen.scala 186:39 298:41]
  wire [1:0] _GEN_348 = 6'h2c == instructionFormatWire ? 2'h2 : _GEN_335; // @[src/main/scala/idu/ContrGen.scala 186:39 299:37]
  wire  _GEN_349 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_336; // @[src/main/scala/idu/ContrGen.scala 186:39 300:41]
  wire  _GEN_350 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_337; // @[src/main/scala/idu/ContrGen.scala 186:39 301:37]
  wire [2:0] _GEN_351 = 6'h2c == instructionFormatWire ? 3'h0 : _GEN_338; // @[src/main/scala/idu/ContrGen.scala 186:39 302:41]
  wire  _GEN_352 = 6'h2c == instructionFormatWire | _GEN_339; // @[src/main/scala/idu/ContrGen.scala 186:39 303:33]
  wire  _GEN_353 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_340; // @[src/main/scala/idu/ContrGen.scala 186:39 304:25]
  wire [1:0] _GEN_355 = 6'h2c == instructionFormatWire ? 2'h1 : _GEN_342; // @[src/main/scala/idu/ContrGen.scala 186:39 308:25]
  wire  _GEN_356 = 6'h30 == instructionFormatWire | _GEN_343; // @[src/main/scala/idu/ContrGen.scala 186:39 277:41]
  wire  _GEN_357 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_344; // @[src/main/scala/idu/ContrGen.scala 186:39 278:41]
  wire [1:0] _GEN_358 = 6'h30 == instructionFormatWire ? 2'h0 : _GEN_345; // @[src/main/scala/idu/ContrGen.scala 186:39 279:41]
  wire [3:0] _GEN_359 = 6'h30 == instructionFormatWire ? 4'h0 : _GEN_346; // @[src/main/scala/idu/ContrGen.scala 186:39 280:41]
  wire [2:0] _GEN_360 = 6'h30 == instructionFormatWire ? 3'h0 : _GEN_347; // @[src/main/scala/idu/ContrGen.scala 186:39 281:41]
  wire [1:0] _GEN_361 = 6'h30 == instructionFormatWire ? 2'h2 : _GEN_348; // @[src/main/scala/idu/ContrGen.scala 186:39 282:37]
  wire  _GEN_362 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_349; // @[src/main/scala/idu/ContrGen.scala 186:39 283:41]
  wire  _GEN_363 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_350; // @[src/main/scala/idu/ContrGen.scala 186:39 284:37]
  wire [2:0] _GEN_364 = 6'h30 == instructionFormatWire ? 3'h0 : _GEN_351; // @[src/main/scala/idu/ContrGen.scala 186:39 285:41]
  wire  _GEN_365 = 6'h30 == instructionFormatWire | _GEN_352; // @[src/main/scala/idu/ContrGen.scala 186:39 286:33]
  wire  _GEN_366 = 6'h30 == instructionFormatWire | _GEN_353; // @[src/main/scala/idu/ContrGen.scala 186:39 287:25]
  wire [1:0] _GEN_368 = 6'h30 == instructionFormatWire ? 2'h0 : _GEN_355; // @[src/main/scala/idu/ContrGen.scala 186:39 291:25]
  wire  _GEN_369 = 6'h2d == instructionFormatWire | _GEN_356; // @[src/main/scala/idu/ContrGen.scala 186:39 260:41]
  wire  _GEN_370 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_357; // @[src/main/scala/idu/ContrGen.scala 186:39 261:41]
  wire [1:0] _GEN_371 = 6'h2d == instructionFormatWire ? 2'h0 : _GEN_358; // @[src/main/scala/idu/ContrGen.scala 186:39 262:41]
  wire [3:0] _GEN_372 = 6'h2d == instructionFormatWire ? 4'h0 : _GEN_359; // @[src/main/scala/idu/ContrGen.scala 186:39 263:41]
  wire [2:0] _GEN_373 = 6'h2d == instructionFormatWire ? 3'h0 : _GEN_360; // @[src/main/scala/idu/ContrGen.scala 186:39 264:41]
  wire [1:0] _GEN_374 = 6'h2d == instructionFormatWire ? 2'h2 : _GEN_361; // @[src/main/scala/idu/ContrGen.scala 186:39 265:37]
  wire  _GEN_375 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_362; // @[src/main/scala/idu/ContrGen.scala 186:39 266:41]
  wire  _GEN_376 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_363; // @[src/main/scala/idu/ContrGen.scala 186:39 267:37]
  wire [2:0] _GEN_377 = 6'h2d == instructionFormatWire ? 3'h0 : _GEN_364; // @[src/main/scala/idu/ContrGen.scala 186:39 268:41]
  wire  _GEN_378 = 6'h2d == instructionFormatWire | _GEN_365; // @[src/main/scala/idu/ContrGen.scala 186:39 269:33]
  wire  _GEN_379 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_366; // @[src/main/scala/idu/ContrGen.scala 186:39 270:25]
  wire [1:0] _GEN_381 = 6'h2d == instructionFormatWire ? 2'h0 : _GEN_368; // @[src/main/scala/idu/ContrGen.scala 186:39 274:25]
  wire  _GEN_382 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_369; // @[src/main/scala/idu/ContrGen.scala 186:39 240:41]
  wire  _GEN_383 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_370; // @[src/main/scala/idu/ContrGen.scala 186:39 241:41]
  wire [1:0] _GEN_384 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_371; // @[src/main/scala/idu/ContrGen.scala 186:39 242:41]
  wire [3:0] _GEN_385 = 6'h29 == instructionFormatWire ? 4'h0 : _GEN_372; // @[src/main/scala/idu/ContrGen.scala 186:39 243:41]
  wire [3:0] _GEN_386 = 6'h29 == instructionFormatWire ? 4'h8 : {{1'd0}, _GEN_373}; // @[src/main/scala/idu/ContrGen.scala 186:39 244:41]
  wire [1:0] _GEN_387 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_374; // @[src/main/scala/idu/ContrGen.scala 186:39 245:37]
  wire  _GEN_388 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_375; // @[src/main/scala/idu/ContrGen.scala 186:39 246:41]
  wire  _GEN_389 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_376; // @[src/main/scala/idu/ContrGen.scala 186:39 247:37]
  wire [2:0] _GEN_390 = 6'h29 == instructionFormatWire ? 3'h0 : _GEN_377; // @[src/main/scala/idu/ContrGen.scala 186:39 248:41]
  wire  _GEN_391 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_378; // @[src/main/scala/idu/ContrGen.scala 186:39 249:33]
  wire  _GEN_392 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_379; // @[src/main/scala/idu/ContrGen.scala 186:39 250:25]
  wire  _GEN_395 = 6'h29 == instructionFormatWire | _GEN_378; // @[src/main/scala/idu/ContrGen.scala 186:39 253:25]
  wire [1:0] _GEN_396 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_381; // @[src/main/scala/idu/ContrGen.scala 186:39 254:25]
  wire  _GEN_397 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_382; // @[src/main/scala/idu/ContrGen.scala 186:39 223:41]
  wire  _GEN_398 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_383; // @[src/main/scala/idu/ContrGen.scala 186:39 224:41]
  wire [1:0] _GEN_399 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_384; // @[src/main/scala/idu/ContrGen.scala 186:39 225:41]
  wire [3:0] _GEN_400 = 6'h28 == instructionFormatWire ? 4'h0 : _GEN_385; // @[src/main/scala/idu/ContrGen.scala 186:39 226:41]
  wire [3:0] _GEN_401 = 6'h28 == instructionFormatWire ? 4'h8 : _GEN_386; // @[src/main/scala/idu/ContrGen.scala 186:39 227:41]
  wire [1:0] _GEN_402 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_387; // @[src/main/scala/idu/ContrGen.scala 186:39 228:37]
  wire  _GEN_403 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_388; // @[src/main/scala/idu/ContrGen.scala 186:39 229:41]
  wire  _GEN_404 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_389; // @[src/main/scala/idu/ContrGen.scala 186:39 230:37]
  wire [2:0] _GEN_405 = 6'h28 == instructionFormatWire ? 3'h0 : _GEN_390; // @[src/main/scala/idu/ContrGen.scala 186:39 231:41]
  wire  _GEN_406 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_391; // @[src/main/scala/idu/ContrGen.scala 186:39 232:33]
  wire  _GEN_407 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_392; // @[src/main/scala/idu/ContrGen.scala 186:39 233:25]
  wire  _GEN_409 = 6'h28 == instructionFormatWire ? 1'h0 : 6'h29 == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 235:25]
  wire  _GEN_410 = 6'h28 == instructionFormatWire | _GEN_395; // @[src/main/scala/idu/ContrGen.scala 186:39 236:25]
  wire [1:0] _GEN_411 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_396; // @[src/main/scala/idu/ContrGen.scala 186:39 237:25]
  wire  _GEN_412 = 6'h31 == instructionFormatWire | _GEN_397; // @[src/main/scala/idu/ContrGen.scala 186:39 206:41]
  wire  _GEN_413 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_398; // @[src/main/scala/idu/ContrGen.scala 186:39 207:41]
  wire [1:0] _GEN_414 = 6'h31 == instructionFormatWire ? 2'h1 : _GEN_399; // @[src/main/scala/idu/ContrGen.scala 186:39 208:41]
  wire [3:0] _GEN_415 = 6'h31 == instructionFormatWire ? 4'h0 : _GEN_400; // @[src/main/scala/idu/ContrGen.scala 186:39 209:41]
  wire [3:0] _GEN_416 = 6'h31 == instructionFormatWire ? 4'h0 : _GEN_401; // @[src/main/scala/idu/ContrGen.scala 186:39 210:41]
  wire [1:0] _GEN_417 = 6'h31 == instructionFormatWire ? 2'h0 : _GEN_402; // @[src/main/scala/idu/ContrGen.scala 186:39 211:37]
  wire  _GEN_418 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_403; // @[src/main/scala/idu/ContrGen.scala 186:39 212:41]
  wire  _GEN_419 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_404; // @[src/main/scala/idu/ContrGen.scala 186:39 213:37]
  wire [2:0] _GEN_420 = 6'h31 == instructionFormatWire ? 3'h0 : _GEN_405; // @[src/main/scala/idu/ContrGen.scala 186:39 214:41]
  wire  _GEN_421 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_406; // @[src/main/scala/idu/ContrGen.scala 186:39 215:33]
  wire  _GEN_422 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_407; // @[src/main/scala/idu/ContrGen.scala 186:39 216:25]
  wire  _GEN_423 = 6'h31 == instructionFormatWire ? 1'h0 : 6'h28 == instructionFormatWire; // @[src/main/scala/idu/ContrGen.scala 186:39 217:25]
  wire  _GEN_424 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_409; // @[src/main/scala/idu/ContrGen.scala 186:39 218:25]
  wire  _GEN_425 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_410; // @[src/main/scala/idu/ContrGen.scala 186:39 219:25]
  wire [1:0] _GEN_426 = 6'h31 == instructionFormatWire ? 2'h0 : _GEN_411; // @[src/main/scala/idu/ContrGen.scala 186:39 220:25]
  wire  _GEN_428 = 6'h0 == instructionFormatWire | _GEN_413; // @[src/main/scala/idu/ContrGen.scala 186:39 190:41]
  assign io_immType = _instructionFormatWire_T_12 ? 3'h1 : _instructionTypeWire_T_199; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_regWR = 6'h0 == instructionFormatWire | _GEN_412; // @[src/main/scala/idu/ContrGen.scala 186:39 189:41]
  assign io_srcAALU = {{1'd0}, _GEN_428};
  assign io_srcBALU = 6'h0 == instructionFormatWire ? 2'h2 : _GEN_414; // @[src/main/scala/idu/ContrGen.scala 186:39 191:41]
  assign io_ctrALU = 6'h0 == instructionFormatWire ? 4'h2 : _GEN_415; // @[src/main/scala/idu/ContrGen.scala 186:39 192:41]
  assign io_branch = 6'h0 == instructionFormatWire ? 4'h2 : _GEN_416; // @[src/main/scala/idu/ContrGen.scala 186:39 193:41]
  assign io_memToReg = 6'h0 == instructionFormatWire ? 2'h0 : _GEN_417; // @[src/main/scala/idu/ContrGen.scala 186:39 194:37]
  assign io_memWR = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_418; // @[src/main/scala/idu/ContrGen.scala 186:39 195:41]
  assign io_memValid = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_419; // @[src/main/scala/idu/ContrGen.scala 186:39 196:37]
  assign io_memOP = 6'h0 == instructionFormatWire ? 3'h0 : _GEN_420; // @[src/main/scala/idu/ContrGen.scala 186:39 197:41]
  assign io_ecall = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_423; // @[src/main/scala/idu/ContrGen.scala 186:39 200:25]
  assign io_mret = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_424; // @[src/main/scala/idu/ContrGen.scala 186:39 201:25]
  assign io_csrEn = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_425; // @[src/main/scala/idu/ContrGen.scala 186:39 202:25]
  assign io_csrWr = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_421; // @[src/main/scala/idu/ContrGen.scala 186:39 198:33]
  assign io_csrOP = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_422; // @[src/main/scala/idu/ContrGen.scala 186:39 199:25]
  assign io_csrALUOP = 6'h0 == instructionFormatWire ? 2'h0 : _GEN_426; // @[src/main/scala/idu/ContrGen.scala 186:39 203:25]
endmodule
module ImmGen(
  input  [11:0] io_iImm, // @[src/main/scala/idu/ImmGen.scala 7:20]
  input  [11:0] io_sImm, // @[src/main/scala/idu/ImmGen.scala 7:20]
  input  [12:0] io_bImm, // @[src/main/scala/idu/ImmGen.scala 7:20]
  input  [31:0] io_uImm, // @[src/main/scala/idu/ImmGen.scala 7:20]
  input  [20:0] io_jImm, // @[src/main/scala/idu/ImmGen.scala 7:20]
  input  [2:0]  io_immType, // @[src/main/scala/idu/ImmGen.scala 7:20]
  output [31:0] io_imm // @[src/main/scala/idu/ImmGen.scala 7:20]
);
  wire [19:0] _iImmWire_T_1 = io_iImm[11] ? 20'hfffff : 20'h0; // @[src/main/scala/idu/ImmGen.scala 18:35]
  wire [31:0] iImmWire = {_iImmWire_T_1,io_iImm}; // @[src/main/scala/idu/ImmGen.scala 18:30]
  wire [19:0] _sImmWire_T_1 = io_sImm[11] ? 20'hfffff : 20'h0; // @[src/main/scala/idu/ImmGen.scala 19:35]
  wire [31:0] sImmWire = {_sImmWire_T_1,io_sImm}; // @[src/main/scala/idu/ImmGen.scala 19:30]
  wire [18:0] _bImmWire_T_1 = io_bImm[12] ? 19'h7ffff : 19'h0; // @[src/main/scala/idu/ImmGen.scala 20:35]
  wire [31:0] bImmWire = {_bImmWire_T_1,io_bImm}; // @[src/main/scala/idu/ImmGen.scala 20:30]
  wire [10:0] _jImmWire_T_1 = io_jImm[20] ? 11'h7ff : 11'h0; // @[src/main/scala/idu/ImmGen.scala 22:35]
  wire [31:0] jImmWire = {_jImmWire_T_1,io_jImm}; // @[src/main/scala/idu/ImmGen.scala 22:30]
  wire  _io_imm_T = io_immType == 3'h1; // @[src/main/scala/idu/ImmGen.scala 26:70]
  wire  _io_imm_T_1 = io_immType == 3'h2; // @[src/main/scala/idu/ImmGen.scala 27:78]
  wire  _io_imm_T_2 = io_immType == 3'h3; // @[src/main/scala/idu/ImmGen.scala 28:78]
  wire  _io_imm_T_3 = io_immType == 3'h4; // @[src/main/scala/idu/ImmGen.scala 29:78]
  wire  _io_imm_T_4 = io_immType == 3'h5; // @[src/main/scala/idu/ImmGen.scala 30:78]
  wire [31:0] _io_imm_T_5 = _io_imm_T_4 ? jImmWire : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_imm_T_6 = _io_imm_T_3 ? io_uImm : _io_imm_T_5; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_imm_T_7 = _io_imm_T_2 ? bImmWire : _io_imm_T_6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_imm_T_8 = _io_imm_T_1 ? sImmWire : _io_imm_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_imm = _io_imm_T ? iImmWire : _io_imm_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
endmodule
module IDU(
  input         clock,
  input         reset,
  output        io_inst_ready, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_inst_valid, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_inst_bits_inst, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_inst_bits_pc, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_idu2EXU_ready, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_valid, // @[src/main/scala/idu/IDU.scala 15:16]
  output [31:0] io_idu2EXU_bits_pc, // @[src/main/scala/idu/IDU.scala 15:16]
  output [31:0] io_idu2EXU_bits_rs1Data, // @[src/main/scala/idu/IDU.scala 15:16]
  output [31:0] io_idu2EXU_bits_rs2Data, // @[src/main/scala/idu/IDU.scala 15:16]
  output [31:0] io_idu2EXU_bits_imm, // @[src/main/scala/idu/IDU.scala 15:16]
  output [31:0] io_idu2EXU_bits_inst, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_regWR, // @[src/main/scala/idu/IDU.scala 15:16]
  output [1:0]  io_idu2EXU_bits_srcAALU, // @[src/main/scala/idu/IDU.scala 15:16]
  output [1:0]  io_idu2EXU_bits_srcBALU, // @[src/main/scala/idu/IDU.scala 15:16]
  output [3:0]  io_idu2EXU_bits_ctrALU, // @[src/main/scala/idu/IDU.scala 15:16]
  output [3:0]  io_idu2EXU_bits_branch, // @[src/main/scala/idu/IDU.scala 15:16]
  output [1:0]  io_idu2EXU_bits_toReg, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_memWR, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_memValid, // @[src/main/scala/idu/IDU.scala 15:16]
  output [2:0]  io_idu2EXU_bits_memOP, // @[src/main/scala/idu/IDU.scala 15:16]
  output [4:0]  io_idu2EXU_bits_rs1Index, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_ecall, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_mret, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_csrEn, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_csrWr, // @[src/main/scala/idu/IDU.scala 15:16]
  output        io_idu2EXU_bits_csrOP, // @[src/main/scala/idu/IDU.scala 15:16]
  output [1:0]  io_idu2EXU_bits_csrALUOP, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_idu2BaseReg_rs1Data, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_idu2BaseReg_rs2Data, // @[src/main/scala/idu/IDU.scala 15:16]
  output [3:0]  io_idu2BaseReg_rs1Index, // @[src/main/scala/idu/IDU.scala 15:16]
  output [3:0]  io_idu2BaseReg_rs2Index // @[src/main/scala/idu/IDU.scala 15:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] contrGen_io_cmd; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [6:0] contrGen_io_opcode; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [2:0] contrGen_io_func3; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [6:0] contrGen_io_func7; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [2:0] contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [1:0] contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [1:0] contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [3:0] contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [3:0] contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [1:0] contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [2:0] contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 70:33]
  wire  contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [1:0] contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 70:33]
  wire [11:0] immGen_io_iImm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [11:0] immGen_io_sImm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [12:0] immGen_io_bImm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [31:0] immGen_io_uImm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [20:0] immGen_io_jImm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [2:0] immGen_io_immType; // @[src/main/scala/idu/IDU.scala 95:33]
  wire [31:0] immGen_io_imm; // @[src/main/scala/idu/IDU.scala 95:33]
  wire  instTypeCnt_valid; // @[src/main/scala/idu/IDU.scala 115:45]
  wire [31:0] instTypeCnt_counterType; // @[src/main/scala/idu/IDU.scala 115:45]
  wire [31:0] instTypeCnt_data; // @[src/main/scala/idu/IDU.scala 115:45]
  reg [31:0] pcReg; // @[src/main/scala/idu/IDU.scala 21:30]
  reg [31:0] instReg; // @[src/main/scala/idu/IDU.scala 22:30]
  reg  ready2IFUReg; // @[src/main/scala/idu/IDU.scala 23:30]
  reg  valid2EXUReg; // @[src/main/scala/idu/IDU.scala 25:30]
  wire  _T_1 = io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/idu/IDU.scala 30:31]
  wire  _GEN_0 = io_idu2EXU_valid & io_idu2EXU_ready | ready2IFUReg; // @[src/main/scala/idu/IDU.scala 30:52 31:26 23:30]
  wire  _T_2 = io_inst_valid & io_inst_ready; // @[src/main/scala/idu/IDU.scala 34:28]
  wire  _GEN_1 = io_inst_valid & io_inst_ready ? 1'h0 : ready2IFUReg; // @[src/main/scala/idu/IDU.scala 34:46 35:26 23:30]
  wire  _GEN_2 = ~ready2IFUReg ? _GEN_0 : _GEN_1; // @[src/main/scala/idu/IDU.scala 29:32]
  wire  _GEN_3 = _T_2 | valid2EXUReg; // @[src/main/scala/idu/IDU.scala 39:46 40:26 25:30]
  wire [6:0] func7Wire = instReg[31:25]; // @[src/main/scala/idu/IDU.scala 57:35]
  wire [4:0] rs2IndexWire = instReg[24:20]; // @[src/main/scala/idu/IDU.scala 58:31]
  wire [4:0] rs1IndexWire = instReg[19:15]; // @[src/main/scala/idu/IDU.scala 59:31]
  wire [6:0] opcodeWire = instReg[6:0]; // @[src/main/scala/idu/IDU.scala 62:35]
  wire [4:0] bImmWire_lo = {instReg[11:8],1'h0}; // @[src/main/scala/idu/IDU.scala 65:30]
  wire [7:0] bImmWire_hi = {instReg[31],instReg[7],instReg[30:25]}; // @[src/main/scala/idu/IDU.scala 65:30]
  wire [10:0] jImmWire_lo = {instReg[30:21],1'h0}; // @[src/main/scala/idu/IDU.scala 67:30]
  wire [9:0] jImmWire_hi = {instReg[31],instReg[19:12],instReg[20]}; // @[src/main/scala/idu/IDU.scala 67:30]
  wire  _instType_T_3 = opcodeWire == 7'h67 | opcodeWire == 7'h6f; // @[src/main/scala/idu/IDU.scala 109:42]
  wire  _instType_T_5 = opcodeWire == 7'h23; // @[src/main/scala/idu/IDU.scala 110:25]
  wire  _instType_T_7 = opcodeWire == 7'h3; // @[src/main/scala/idu/IDU.scala 111:25]
  wire  _instType_T_11 = opcodeWire == 7'h13 | opcodeWire == 7'h33; // @[src/main/scala/idu/IDU.scala 112:42]
  wire  _instType_T_13 = opcodeWire == 7'h73; // @[src/main/scala/idu/IDU.scala 113:25]
  wire [2:0] _instType_T_15 = _instType_T_13 ? 3'h5 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_16 = _instType_T_11 ? 3'h4 : _instType_T_15; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_17 = _instType_T_7 ? 3'h3 : _instType_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_18 = _instType_T_5 ? 3'h2 : _instType_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] instType = _instType_T_3 ? 3'h1 : _instType_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  ContrGen contrGen ( // @[src/main/scala/idu/IDU.scala 70:33]
    .io_cmd(contrGen_io_cmd),
    .io_opcode(contrGen_io_opcode),
    .io_func3(contrGen_io_func3),
    .io_func7(contrGen_io_func7),
    .io_immType(contrGen_io_immType),
    .io_regWR(contrGen_io_regWR),
    .io_srcAALU(contrGen_io_srcAALU),
    .io_srcBALU(contrGen_io_srcBALU),
    .io_ctrALU(contrGen_io_ctrALU),
    .io_branch(contrGen_io_branch),
    .io_memToReg(contrGen_io_memToReg),
    .io_memWR(contrGen_io_memWR),
    .io_memValid(contrGen_io_memValid),
    .io_memOP(contrGen_io_memOP),
    .io_ecall(contrGen_io_ecall),
    .io_mret(contrGen_io_mret),
    .io_csrEn(contrGen_io_csrEn),
    .io_csrWr(contrGen_io_csrWr),
    .io_csrOP(contrGen_io_csrOP),
    .io_csrALUOP(contrGen_io_csrALUOP)
  );
  ImmGen immGen ( // @[src/main/scala/idu/IDU.scala 95:33]
    .io_iImm(immGen_io_iImm),
    .io_sImm(immGen_io_sImm),
    .io_bImm(immGen_io_bImm),
    .io_uImm(immGen_io_uImm),
    .io_jImm(immGen_io_jImm),
    .io_immType(immGen_io_immType),
    .io_imm(immGen_io_imm)
  );
  PerformanceCounter instTypeCnt ( // @[src/main/scala/idu/IDU.scala 115:45]
    .valid(instTypeCnt_valid),
    .counterType(instTypeCnt_counterType),
    .data(instTypeCnt_data)
  );
  assign io_inst_ready = ready2IFUReg; // @[src/main/scala/idu/IDU.scala 24:37]
  assign io_idu2EXU_valid = valid2EXUReg; // @[src/main/scala/idu/IDU.scala 26:37]
  assign io_idu2EXU_bits_pc = pcReg; // @[src/main/scala/idu/IDU.scala 142:33]
  assign io_idu2EXU_bits_rs1Data = io_idu2BaseReg_rs1Data; // @[src/main/scala/idu/IDU.scala 143:33]
  assign io_idu2EXU_bits_rs2Data = io_idu2BaseReg_rs2Data; // @[src/main/scala/idu/IDU.scala 144:33]
  assign io_idu2EXU_bits_imm = immGen_io_imm; // @[src/main/scala/idu/IDU.scala 145:41]
  assign io_idu2EXU_bits_inst = instReg; // @[src/main/scala/idu/IDU.scala 146:33]
  assign io_idu2EXU_bits_regWR = contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 122:41]
  assign io_idu2EXU_bits_srcAALU = contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 123:33]
  assign io_idu2EXU_bits_srcBALU = contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 124:33]
  assign io_idu2EXU_bits_ctrALU = contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 125:41]
  assign io_idu2EXU_bits_branch = contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 126:41]
  assign io_idu2EXU_bits_toReg = contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 127:41]
  assign io_idu2EXU_bits_memWR = contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 128:41]
  assign io_idu2EXU_bits_memValid = contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 129:41]
  assign io_idu2EXU_bits_memOP = contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 130:41]
  assign io_idu2EXU_bits_rs1Index = instReg[19:15]; // @[src/main/scala/idu/IDU.scala 59:31]
  assign io_idu2EXU_bits_ecall = contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 132:33]
  assign io_idu2EXU_bits_mret = contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 133:33]
  assign io_idu2EXU_bits_csrEn = contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 134:33]
  assign io_idu2EXU_bits_csrWr = contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 135:33]
  assign io_idu2EXU_bits_csrOP = contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 136:33]
  assign io_idu2EXU_bits_csrALUOP = contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 137:33]
  assign io_idu2BaseReg_rs1Index = rs1IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 139:29]
  assign io_idu2BaseReg_rs2Index = rs2IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 140:29]
  assign contrGen_io_cmd = instReg; // @[src/main/scala/idu/IDU.scala 72:25]
  assign contrGen_io_opcode = instReg[6:0]; // @[src/main/scala/idu/IDU.scala 62:35]
  assign contrGen_io_func3 = instReg[14:12]; // @[src/main/scala/idu/IDU.scala 60:35]
  assign contrGen_io_func7 = instReg[31:25]; // @[src/main/scala/idu/IDU.scala 57:35]
  assign immGen_io_iImm = instReg[31:20]; // @[src/main/scala/idu/IDU.scala 63:35]
  assign immGen_io_sImm = {func7Wire,instReg[11:7]}; // @[src/main/scala/idu/IDU.scala 64:30]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[src/main/scala/idu/IDU.scala 65:30]
  assign immGen_io_uImm = {instReg[31:12],12'h0}; // @[src/main/scala/idu/IDU.scala 66:30]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[src/main/scala/idu/IDU.scala 67:30]
  assign immGen_io_immType = contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 102:25]
  assign instTypeCnt_valid = io_idu2EXU_valid; // @[src/main/scala/idu/IDU.scala 116:37]
  assign instTypeCnt_counterType = {{29'd0}, instType}; // @[src/main/scala/idu/IDU.scala 117:37]
  assign instTypeCnt_data = 32'h0; // @[src/main/scala/idu/IDU.scala 118:37]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/idu/IDU.scala 21:30]
      pcReg <= 32'h80000000; // @[src/main/scala/idu/IDU.scala 21:30]
    end else if (io_inst_ready & io_inst_valid) begin // @[src/main/scala/idu/IDU.scala 49:42]
      pcReg <= io_inst_bits_pc; // @[src/main/scala/idu/IDU.scala 50:21]
    end
    if (reset) begin // @[src/main/scala/idu/IDU.scala 22:30]
      instReg <= 32'h0; // @[src/main/scala/idu/IDU.scala 22:30]
    end else if (io_inst_ready & io_inst_valid) begin // @[src/main/scala/idu/IDU.scala 49:42]
      instReg <= io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 51:21]
    end
    ready2IFUReg <= reset | _GEN_2; // @[src/main/scala/idu/IDU.scala 23:{30,30}]
    if (reset) begin // @[src/main/scala/idu/IDU.scala 25:30]
      valid2EXUReg <= 1'h0; // @[src/main/scala/idu/IDU.scala 25:30]
    end else if (~valid2EXUReg) begin // @[src/main/scala/idu/IDU.scala 38:32]
      valid2EXUReg <= _GEN_3;
    end else if (_T_1) begin // @[src/main/scala/idu/IDU.scala 43:52]
      valid2EXUReg <= 1'h0; // @[src/main/scala/idu/IDU.scala 44:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  instReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  ready2IFUReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valid2EXUReg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALUControl(
  input  [3:0] io_aluCtr, // @[src/main/scala/exu/alu/ALUControl.scala 19:20]
  output       io_aOrLCtr, // @[src/main/scala/exu/alu/ALUControl.scala 19:20]
  output       io_lOrRCtr, // @[src/main/scala/exu/alu/ALUControl.scala 19:20]
  output       io_uOrSCtr, // @[src/main/scala/exu/alu/ALUControl.scala 19:20]
  output       io_subOrAddCtr // @[src/main/scala/exu/alu/ALUControl.scala 19:20]
);
  wire  _aluCtrWire_T_1 = io_aluCtr[2:0] == 3'h0; // @[src/main/scala/exu/alu/ALUControl.scala 29:33]
  wire  _aluCtrWire_T_3 = io_aluCtr[2:0] == 3'h1; // @[src/main/scala/exu/alu/ALUControl.scala 30:33]
  wire  _aluCtrWire_T_5 = io_aluCtr[2:0] == 3'h2; // @[src/main/scala/exu/alu/ALUControl.scala 31:33]
  wire  _aluCtrWire_T_7 = io_aluCtr[2:0] == 3'h3; // @[src/main/scala/exu/alu/ALUControl.scala 32:33]
  wire  _aluCtrWire_T_9 = io_aluCtr[2:0] == 3'h4; // @[src/main/scala/exu/alu/ALUControl.scala 33:33]
  wire  _aluCtrWire_T_11 = io_aluCtr[2:0] == 3'h5; // @[src/main/scala/exu/alu/ALUControl.scala 34:33]
  wire  _aluCtrWire_T_13 = io_aluCtr[2:0] == 3'h6; // @[src/main/scala/exu/alu/ALUControl.scala 35:33]
  wire  _aluCtrWire_T_15 = io_aluCtr[2:0] == 3'h7; // @[src/main/scala/exu/alu/ALUControl.scala 36:33]
  wire [3:0] _aluCtrWire_T_16 = _aluCtrWire_T_15 ? 4'h7 : 4'h8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_17 = _aluCtrWire_T_13 ? 4'h6 : _aluCtrWire_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_18 = _aluCtrWire_T_11 ? 4'h5 : _aluCtrWire_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_19 = _aluCtrWire_T_9 ? 4'h4 : _aluCtrWire_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_20 = _aluCtrWire_T_7 ? 4'h3 : _aluCtrWire_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_21 = _aluCtrWire_T_5 ? 4'h2 : _aluCtrWire_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _aluCtrWire_T_22 = _aluCtrWire_T_3 ? 4'h1 : _aluCtrWire_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] aluCtrWire = _aluCtrWire_T_1 ? 4'h0 : _aluCtrWire_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _GEN_1 = ~io_aluCtr[3] ? 1'h0 : 1'h1; // @[src/main/scala/exu/alu/ALUControl.scala 45:52 49:49 54:49]
  wire  _GEN_12 = 4'h4 == aluCtrWire ? 1'h0 : 4'h5 == aluCtrWire & _GEN_1; // @[src/main/scala/exu/alu/ALUControl.scala 43:28 83:41]
  wire  _GEN_14 = 4'h3 == aluCtrWire ? 1'h0 : _GEN_12; // @[src/main/scala/exu/alu/ALUControl.scala 43:28 77:41]
  wire  _GEN_16 = 4'h2 == aluCtrWire ? 1'h0 : _GEN_14; // @[src/main/scala/exu/alu/ALUControl.scala 43:28]
  wire  _GEN_20 = 4'h1 == aluCtrWire ? 1'h0 : _GEN_16; // @[src/main/scala/exu/alu/ALUControl.scala 43:28 58:41]
  wire  _GEN_22 = 4'h1 == aluCtrWire ? 1'h0 : 4'h2 == aluCtrWire & _GEN_1; // @[src/main/scala/exu/alu/ALUControl.scala 43:28 60:41]
  wire  _GEN_23 = 4'h1 == aluCtrWire ? 1'h0 : 4'h2 == aluCtrWire; // @[src/main/scala/exu/alu/ALUControl.scala 43:28 61:41]
  assign io_aOrLCtr = 4'h0 == aluCtrWire ? 1'h0 : _GEN_20; // @[src/main/scala/exu/alu/ALUControl.scala 43:28]
  assign io_lOrRCtr = 4'h0 == aluCtrWire ? 1'h0 : 4'h1 == aluCtrWire; // @[src/main/scala/exu/alu/ALUControl.scala 43:28]
  assign io_uOrSCtr = 4'h0 == aluCtrWire ? 1'h0 : _GEN_22; // @[src/main/scala/exu/alu/ALUControl.scala 43:28]
  assign io_subOrAddCtr = 4'h0 == aluCtrWire ? _GEN_1 : _GEN_23; // @[src/main/scala/exu/alu/ALUControl.scala 43:28]
endmodule
module Shifter(
  input         io_lOrR, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input         io_aOrL, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input  [31:0] io_dIn, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input  [4:0]  io_shamt, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  output [31:0] io_dOut // @[src/main/scala/exu/alu/ALU.scala 102:20]
);
  wire [31:0] _dataS_T_1 = io_dIn[31] ? 32'hffffffff : 32'h0; // @[src/main/scala/exu/alu/ALU.scala 110:67]
  wire [63:0] dataS = {_dataS_T_1,io_dIn}; // @[src/main/scala/exu/alu/ALU.scala 110:62]
  wire [63:0] rightShiftedDataWire = dataS >> io_shamt; // @[src/main/scala/exu/alu/ALU.scala 111:49]
  wire [62:0] _GEN_0 = {{31'd0}, io_dIn}; // @[src/main/scala/exu/alu/ALU.scala 112:50]
  wire [62:0] leftShiftedDataWire = _GEN_0 << io_shamt; // @[src/main/scala/exu/alu/ALU.scala 112:50]
  wire [31:0] _io_dOut_T_3 = io_dIn >> io_shamt; // @[src/main/scala/exu/alu/ALU.scala 113:117]
  wire [31:0] _io_dOut_T_4 = io_aOrL ? rightShiftedDataWire[31:0] : _io_dOut_T_3; // @[src/main/scala/exu/alu/ALU.scala 113:64]
  wire [62:0] _io_dOut_T_5 = io_lOrR ? leftShiftedDataWire : {{31'd0}, _io_dOut_T_4}; // @[src/main/scala/exu/alu/ALU.scala 113:23]
  assign io_dOut = _io_dOut_T_5[31:0]; // @[src/main/scala/exu/alu/ALU.scala 113:17]
endmodule
module FullAdder(
  input   io_a, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  input   io_b, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  input   io_cin, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_s, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_p, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_g // @[src/main/scala/basemode/BaseALU.scala 8:20]
);
  assign io_s = io_a ^ io_b ^ io_cin; // @[src/main/scala/basemode/BaseALU.scala 17:29]
  assign io_p = io_a | io_b; // @[src/main/scala/basemode/BaseALU.scala 18:22]
  assign io_g = io_a & io_b; // @[src/main/scala/basemode/BaseALU.scala 19:22]
endmodule
module CLAGen(
  input  [31:0] io_a, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input  [31:0] io_b, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input         io_cin, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output        io_cout, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output [31:0] io_sum // @[src/main/scala/basemode/BaseALU.scala 98:14]
);
  wire  FullAdder_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  adders_0_p = FullAdder_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_0_g = FullAdder_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_1 = adders_0_g | adders_0_p & io_cin; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_1_p = FullAdder_1_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_1_g = FullAdder_1_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_2 = adders_1_g | adders_1_p & cs_1; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_2_p = FullAdder_2_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_2_g = FullAdder_2_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_3 = adders_2_g | adders_2_p & cs_2; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_3_p = FullAdder_3_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_3_g = FullAdder_3_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_4 = adders_3_g | adders_3_p & cs_3; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_4_p = FullAdder_4_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_4_g = FullAdder_4_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_5 = adders_4_g | adders_4_p & cs_4; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_5_p = FullAdder_5_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_5_g = FullAdder_5_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_6 = adders_5_g | adders_5_p & cs_5; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_6_p = FullAdder_6_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_6_g = FullAdder_6_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_7 = adders_6_g | adders_6_p & cs_6; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_7_p = FullAdder_7_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_7_g = FullAdder_7_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_8 = adders_7_g | adders_7_p & cs_7; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_8_p = FullAdder_8_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_8_g = FullAdder_8_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_9 = adders_8_g | adders_8_p & cs_8; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_9_p = FullAdder_9_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_9_g = FullAdder_9_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_10 = adders_9_g | adders_9_p & cs_9; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_10_p = FullAdder_10_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_10_g = FullAdder_10_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_11 = adders_10_g | adders_10_p & cs_10; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_11_p = FullAdder_11_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_11_g = FullAdder_11_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_12 = adders_11_g | adders_11_p & cs_11; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_12_p = FullAdder_12_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_12_g = FullAdder_12_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_13 = adders_12_g | adders_12_p & cs_12; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_13_p = FullAdder_13_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_13_g = FullAdder_13_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_14 = adders_13_g | adders_13_p & cs_13; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_14_p = FullAdder_14_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_14_g = FullAdder_14_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_15 = adders_14_g | adders_14_p & cs_14; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_15_p = FullAdder_15_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_15_g = FullAdder_15_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_16 = adders_15_g | adders_15_p & cs_15; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_16_p = FullAdder_16_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_16_g = FullAdder_16_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_17 = adders_16_g | adders_16_p & cs_16; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_17_p = FullAdder_17_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_17_g = FullAdder_17_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_18 = adders_17_g | adders_17_p & cs_17; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_18_p = FullAdder_18_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_18_g = FullAdder_18_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_19 = adders_18_g | adders_18_p & cs_18; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_19_p = FullAdder_19_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_19_g = FullAdder_19_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_20 = adders_19_g | adders_19_p & cs_19; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_20_p = FullAdder_20_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_20_g = FullAdder_20_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_21 = adders_20_g | adders_20_p & cs_20; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_21_p = FullAdder_21_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_21_g = FullAdder_21_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_22 = adders_21_g | adders_21_p & cs_21; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_22_p = FullAdder_22_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_22_g = FullAdder_22_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_23 = adders_22_g | adders_22_p & cs_22; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_23_p = FullAdder_23_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_23_g = FullAdder_23_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_24 = adders_23_g | adders_23_p & cs_23; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_24_p = FullAdder_24_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_24_g = FullAdder_24_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_25 = adders_24_g | adders_24_p & cs_24; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_25_p = FullAdder_25_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_25_g = FullAdder_25_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_26 = adders_25_g | adders_25_p & cs_25; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_26_p = FullAdder_26_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_26_g = FullAdder_26_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_27 = adders_26_g | adders_26_p & cs_26; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_27_p = FullAdder_27_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_27_g = FullAdder_27_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_28 = adders_27_g | adders_27_p & cs_27; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_28_p = FullAdder_28_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_28_g = FullAdder_28_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_29 = adders_28_g | adders_28_p & cs_28; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_29_p = FullAdder_29_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_29_g = FullAdder_29_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_30 = adders_29_g | adders_29_p & cs_29; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_30_p = FullAdder_30_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_30_g = FullAdder_30_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_31 = adders_30_g | adders_30_p & cs_30; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_31_p = FullAdder_31_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_31_g = FullAdder_31_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_1_s = FullAdder_1_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_0_s = FullAdder_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_3_s = FullAdder_3_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_2_s = FullAdder_2_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_5_s = FullAdder_5_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_4_s = FullAdder_4_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_7_s = FullAdder_7_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_6_s = FullAdder_6_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_lo_lo = {adders_7_s,adders_6_s,adders_5_s,adders_4_s,adders_3_s,adders_2_s,adders_1_s,adders_0_s}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_9_s = FullAdder_9_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_8_s = FullAdder_8_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_11_s = FullAdder_11_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_10_s = FullAdder_10_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_13_s = FullAdder_13_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_12_s = FullAdder_12_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_15_s = FullAdder_15_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_14_s = FullAdder_14_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_lo = {adders_15_s,adders_14_s,adders_13_s,adders_12_s,adders_11_s,adders_10_s,adders_9_s,adders_8_s
    ,io_sum_lo_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_17_s = FullAdder_17_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_16_s = FullAdder_16_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_19_s = FullAdder_19_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_18_s = FullAdder_18_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_21_s = FullAdder_21_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_20_s = FullAdder_20_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_23_s = FullAdder_23_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_22_s = FullAdder_22_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_hi_lo = {adders_23_s,adders_22_s,adders_21_s,adders_20_s,adders_19_s,adders_18_s,adders_17_s,
    adders_16_s}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_25_s = FullAdder_25_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_24_s = FullAdder_24_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_27_s = FullAdder_27_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_26_s = FullAdder_26_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_29_s = FullAdder_29_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_28_s = FullAdder_28_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_31_s = FullAdder_31_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_30_s = FullAdder_30_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_hi = {adders_31_s,adders_30_s,adders_29_s,adders_28_s,adders_27_s,adders_26_s,adders_25_s,
    adders_24_s,io_sum_hi_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  FullAdder FullAdder ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_cin(FullAdder_io_cin),
    .io_s(FullAdder_io_s),
    .io_p(FullAdder_io_p),
    .io_g(FullAdder_io_g)
  );
  FullAdder FullAdder_1 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_cin(FullAdder_1_io_cin),
    .io_s(FullAdder_1_io_s),
    .io_p(FullAdder_1_io_p),
    .io_g(FullAdder_1_io_g)
  );
  FullAdder FullAdder_2 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_cin(FullAdder_2_io_cin),
    .io_s(FullAdder_2_io_s),
    .io_p(FullAdder_2_io_p),
    .io_g(FullAdder_2_io_g)
  );
  FullAdder FullAdder_3 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_cin(FullAdder_3_io_cin),
    .io_s(FullAdder_3_io_s),
    .io_p(FullAdder_3_io_p),
    .io_g(FullAdder_3_io_g)
  );
  FullAdder FullAdder_4 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_4_io_a),
    .io_b(FullAdder_4_io_b),
    .io_cin(FullAdder_4_io_cin),
    .io_s(FullAdder_4_io_s),
    .io_p(FullAdder_4_io_p),
    .io_g(FullAdder_4_io_g)
  );
  FullAdder FullAdder_5 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_5_io_a),
    .io_b(FullAdder_5_io_b),
    .io_cin(FullAdder_5_io_cin),
    .io_s(FullAdder_5_io_s),
    .io_p(FullAdder_5_io_p),
    .io_g(FullAdder_5_io_g)
  );
  FullAdder FullAdder_6 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_6_io_a),
    .io_b(FullAdder_6_io_b),
    .io_cin(FullAdder_6_io_cin),
    .io_s(FullAdder_6_io_s),
    .io_p(FullAdder_6_io_p),
    .io_g(FullAdder_6_io_g)
  );
  FullAdder FullAdder_7 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_7_io_a),
    .io_b(FullAdder_7_io_b),
    .io_cin(FullAdder_7_io_cin),
    .io_s(FullAdder_7_io_s),
    .io_p(FullAdder_7_io_p),
    .io_g(FullAdder_7_io_g)
  );
  FullAdder FullAdder_8 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_8_io_a),
    .io_b(FullAdder_8_io_b),
    .io_cin(FullAdder_8_io_cin),
    .io_s(FullAdder_8_io_s),
    .io_p(FullAdder_8_io_p),
    .io_g(FullAdder_8_io_g)
  );
  FullAdder FullAdder_9 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_9_io_a),
    .io_b(FullAdder_9_io_b),
    .io_cin(FullAdder_9_io_cin),
    .io_s(FullAdder_9_io_s),
    .io_p(FullAdder_9_io_p),
    .io_g(FullAdder_9_io_g)
  );
  FullAdder FullAdder_10 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_10_io_a),
    .io_b(FullAdder_10_io_b),
    .io_cin(FullAdder_10_io_cin),
    .io_s(FullAdder_10_io_s),
    .io_p(FullAdder_10_io_p),
    .io_g(FullAdder_10_io_g)
  );
  FullAdder FullAdder_11 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_11_io_a),
    .io_b(FullAdder_11_io_b),
    .io_cin(FullAdder_11_io_cin),
    .io_s(FullAdder_11_io_s),
    .io_p(FullAdder_11_io_p),
    .io_g(FullAdder_11_io_g)
  );
  FullAdder FullAdder_12 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_12_io_a),
    .io_b(FullAdder_12_io_b),
    .io_cin(FullAdder_12_io_cin),
    .io_s(FullAdder_12_io_s),
    .io_p(FullAdder_12_io_p),
    .io_g(FullAdder_12_io_g)
  );
  FullAdder FullAdder_13 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_13_io_a),
    .io_b(FullAdder_13_io_b),
    .io_cin(FullAdder_13_io_cin),
    .io_s(FullAdder_13_io_s),
    .io_p(FullAdder_13_io_p),
    .io_g(FullAdder_13_io_g)
  );
  FullAdder FullAdder_14 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_14_io_a),
    .io_b(FullAdder_14_io_b),
    .io_cin(FullAdder_14_io_cin),
    .io_s(FullAdder_14_io_s),
    .io_p(FullAdder_14_io_p),
    .io_g(FullAdder_14_io_g)
  );
  FullAdder FullAdder_15 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_15_io_a),
    .io_b(FullAdder_15_io_b),
    .io_cin(FullAdder_15_io_cin),
    .io_s(FullAdder_15_io_s),
    .io_p(FullAdder_15_io_p),
    .io_g(FullAdder_15_io_g)
  );
  FullAdder FullAdder_16 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_16_io_a),
    .io_b(FullAdder_16_io_b),
    .io_cin(FullAdder_16_io_cin),
    .io_s(FullAdder_16_io_s),
    .io_p(FullAdder_16_io_p),
    .io_g(FullAdder_16_io_g)
  );
  FullAdder FullAdder_17 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_17_io_a),
    .io_b(FullAdder_17_io_b),
    .io_cin(FullAdder_17_io_cin),
    .io_s(FullAdder_17_io_s),
    .io_p(FullAdder_17_io_p),
    .io_g(FullAdder_17_io_g)
  );
  FullAdder FullAdder_18 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_18_io_a),
    .io_b(FullAdder_18_io_b),
    .io_cin(FullAdder_18_io_cin),
    .io_s(FullAdder_18_io_s),
    .io_p(FullAdder_18_io_p),
    .io_g(FullAdder_18_io_g)
  );
  FullAdder FullAdder_19 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_19_io_a),
    .io_b(FullAdder_19_io_b),
    .io_cin(FullAdder_19_io_cin),
    .io_s(FullAdder_19_io_s),
    .io_p(FullAdder_19_io_p),
    .io_g(FullAdder_19_io_g)
  );
  FullAdder FullAdder_20 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_20_io_a),
    .io_b(FullAdder_20_io_b),
    .io_cin(FullAdder_20_io_cin),
    .io_s(FullAdder_20_io_s),
    .io_p(FullAdder_20_io_p),
    .io_g(FullAdder_20_io_g)
  );
  FullAdder FullAdder_21 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_21_io_a),
    .io_b(FullAdder_21_io_b),
    .io_cin(FullAdder_21_io_cin),
    .io_s(FullAdder_21_io_s),
    .io_p(FullAdder_21_io_p),
    .io_g(FullAdder_21_io_g)
  );
  FullAdder FullAdder_22 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_22_io_a),
    .io_b(FullAdder_22_io_b),
    .io_cin(FullAdder_22_io_cin),
    .io_s(FullAdder_22_io_s),
    .io_p(FullAdder_22_io_p),
    .io_g(FullAdder_22_io_g)
  );
  FullAdder FullAdder_23 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_23_io_a),
    .io_b(FullAdder_23_io_b),
    .io_cin(FullAdder_23_io_cin),
    .io_s(FullAdder_23_io_s),
    .io_p(FullAdder_23_io_p),
    .io_g(FullAdder_23_io_g)
  );
  FullAdder FullAdder_24 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_24_io_a),
    .io_b(FullAdder_24_io_b),
    .io_cin(FullAdder_24_io_cin),
    .io_s(FullAdder_24_io_s),
    .io_p(FullAdder_24_io_p),
    .io_g(FullAdder_24_io_g)
  );
  FullAdder FullAdder_25 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_25_io_a),
    .io_b(FullAdder_25_io_b),
    .io_cin(FullAdder_25_io_cin),
    .io_s(FullAdder_25_io_s),
    .io_p(FullAdder_25_io_p),
    .io_g(FullAdder_25_io_g)
  );
  FullAdder FullAdder_26 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_26_io_a),
    .io_b(FullAdder_26_io_b),
    .io_cin(FullAdder_26_io_cin),
    .io_s(FullAdder_26_io_s),
    .io_p(FullAdder_26_io_p),
    .io_g(FullAdder_26_io_g)
  );
  FullAdder FullAdder_27 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_27_io_a),
    .io_b(FullAdder_27_io_b),
    .io_cin(FullAdder_27_io_cin),
    .io_s(FullAdder_27_io_s),
    .io_p(FullAdder_27_io_p),
    .io_g(FullAdder_27_io_g)
  );
  FullAdder FullAdder_28 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_28_io_a),
    .io_b(FullAdder_28_io_b),
    .io_cin(FullAdder_28_io_cin),
    .io_s(FullAdder_28_io_s),
    .io_p(FullAdder_28_io_p),
    .io_g(FullAdder_28_io_g)
  );
  FullAdder FullAdder_29 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_29_io_a),
    .io_b(FullAdder_29_io_b),
    .io_cin(FullAdder_29_io_cin),
    .io_s(FullAdder_29_io_s),
    .io_p(FullAdder_29_io_p),
    .io_g(FullAdder_29_io_g)
  );
  FullAdder FullAdder_30 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_30_io_a),
    .io_b(FullAdder_30_io_b),
    .io_cin(FullAdder_30_io_cin),
    .io_s(FullAdder_30_io_s),
    .io_p(FullAdder_30_io_p),
    .io_g(FullAdder_30_io_g)
  );
  FullAdder FullAdder_31 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_31_io_a),
    .io_b(FullAdder_31_io_b),
    .io_cin(FullAdder_31_io_cin),
    .io_s(FullAdder_31_io_s),
    .io_p(FullAdder_31_io_p),
    .io_g(FullAdder_31_io_g)
  );
  assign io_cout = adders_31_g | adders_31_p & cs_31; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  assign FullAdder_io_a = io_a[0]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_io_b = io_b[0]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_io_cin = io_cin; // @[src/main/scala/basemode/BaseALU.scala 113:16 115:9]
  assign FullAdder_1_io_a = io_a[1]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_1_io_b = io_b[1]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_1_io_cin = adders_0_g | adders_0_p & io_cin; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_2_io_a = io_a[2]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_2_io_b = io_b[2]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_2_io_cin = adders_1_g | adders_1_p & cs_1; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_3_io_a = io_a[3]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_3_io_b = io_b[3]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_3_io_cin = adders_2_g | adders_2_p & cs_2; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_4_io_a = io_a[4]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_4_io_b = io_b[4]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_4_io_cin = adders_3_g | adders_3_p & cs_3; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_5_io_a = io_a[5]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_5_io_b = io_b[5]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_5_io_cin = adders_4_g | adders_4_p & cs_4; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_6_io_a = io_a[6]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_6_io_b = io_b[6]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_6_io_cin = adders_5_g | adders_5_p & cs_5; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_7_io_a = io_a[7]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_7_io_b = io_b[7]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_7_io_cin = adders_6_g | adders_6_p & cs_6; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_8_io_a = io_a[8]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_8_io_b = io_b[8]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_8_io_cin = adders_7_g | adders_7_p & cs_7; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_9_io_a = io_a[9]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_9_io_b = io_b[9]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_9_io_cin = adders_8_g | adders_8_p & cs_8; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_10_io_a = io_a[10]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_10_io_b = io_b[10]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_10_io_cin = adders_9_g | adders_9_p & cs_9; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_11_io_a = io_a[11]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_11_io_b = io_b[11]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_11_io_cin = adders_10_g | adders_10_p & cs_10; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_12_io_a = io_a[12]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_12_io_b = io_b[12]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_12_io_cin = adders_11_g | adders_11_p & cs_11; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_13_io_a = io_a[13]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_13_io_b = io_b[13]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_13_io_cin = adders_12_g | adders_12_p & cs_12; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_14_io_a = io_a[14]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_14_io_b = io_b[14]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_14_io_cin = adders_13_g | adders_13_p & cs_13; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_15_io_a = io_a[15]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_15_io_b = io_b[15]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_15_io_cin = adders_14_g | adders_14_p & cs_14; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_16_io_a = io_a[16]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_16_io_b = io_b[16]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_16_io_cin = adders_15_g | adders_15_p & cs_15; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_17_io_a = io_a[17]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_17_io_b = io_b[17]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_17_io_cin = adders_16_g | adders_16_p & cs_16; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_18_io_a = io_a[18]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_18_io_b = io_b[18]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_18_io_cin = adders_17_g | adders_17_p & cs_17; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_19_io_a = io_a[19]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_19_io_b = io_b[19]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_19_io_cin = adders_18_g | adders_18_p & cs_18; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_20_io_a = io_a[20]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_20_io_b = io_b[20]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_20_io_cin = adders_19_g | adders_19_p & cs_19; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_21_io_a = io_a[21]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_21_io_b = io_b[21]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_21_io_cin = adders_20_g | adders_20_p & cs_20; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_22_io_a = io_a[22]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_22_io_b = io_b[22]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_22_io_cin = adders_21_g | adders_21_p & cs_21; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_23_io_a = io_a[23]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_23_io_b = io_b[23]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_23_io_cin = adders_22_g | adders_22_p & cs_22; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_24_io_a = io_a[24]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_24_io_b = io_b[24]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_24_io_cin = adders_23_g | adders_23_p & cs_23; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_25_io_a = io_a[25]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_25_io_b = io_b[25]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_25_io_cin = adders_24_g | adders_24_p & cs_24; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_26_io_a = io_a[26]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_26_io_b = io_b[26]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_26_io_cin = adders_25_g | adders_25_p & cs_25; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_27_io_a = io_a[27]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_27_io_b = io_b[27]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_27_io_cin = adders_26_g | adders_26_p & cs_26; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_28_io_a = io_a[28]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_28_io_b = io_b[28]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_28_io_cin = adders_27_g | adders_27_p & cs_27; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_29_io_a = io_a[29]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_29_io_b = io_b[29]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_29_io_cin = adders_28_g | adders_28_p & cs_28; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_30_io_a = io_a[30]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_30_io_b = io_b[30]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_30_io_cin = adders_29_g | adders_29_p & cs_29; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_31_io_a = io_a[31]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_31_io_b = io_b[31]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_31_io_cin = adders_30_g | adders_30_p & cs_30; // @[src/main/scala/basemode/BaseALU.scala 124:24]
endmodule
module ALUAdder(
  input         io_subOrAdd, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_carry, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_zero, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_overflow, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output [31:0] io_result // @[src/main/scala/exu/alu/ALU.scala 73:20]
);
  wire [31:0] cla32Add_io_a; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [31:0] cla32Add_io_b; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire  cla32Add_io_cin; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire  cla32Add_io_cout; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [31:0] cla32Add_io_sum; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [30:0] _subOrAddWire_T_1 = io_subOrAdd ? 31'h7fffffff : 31'h0; // @[src/main/scala/exu/alu/ALU.scala 85:35]
  wire [31:0] subOrAddWire = {_subOrAddWire_T_1,io_subOrAdd}; // @[src/main/scala/exu/alu/ALU.scala 85:30]
  wire [31:0] bXorCIn = io_srcBData ^ subOrAddWire; // @[src/main/scala/exu/alu/ALU.scala 88:36]
  wire  _aOverflow_T_5 = cla32Add_io_sum[31] != io_srcAData[31]; // @[src/main/scala/exu/alu/ALU.scala 95:83]
  wire  aOverflow = io_srcAData[31] == io_srcBData[31] & cla32Add_io_sum[31] != io_srcAData[31]; // @[src/main/scala/exu/alu/ALU.scala 95:59]
  wire  sOverflow = io_srcAData[31] == bXorCIn[31] & _aOverflow_T_5; // @[src/main/scala/exu/alu/ALU.scala 96:58]
  CLAGen cla32Add ( // @[src/main/scala/exu/alu/ALU.scala 84:33]
    .io_a(cla32Add_io_a),
    .io_b(cla32Add_io_b),
    .io_cin(cla32Add_io_cin),
    .io_cout(cla32Add_io_cout),
    .io_sum(cla32Add_io_sum)
  );
  assign io_carry = cla32Add_io_cout; // @[src/main/scala/exu/alu/ALU.scala 93:33]
  assign io_zero = cla32Add_io_sum == 32'h0; // @[src/main/scala/exu/alu/ALU.scala 94:56]
  assign io_overflow = io_subOrAdd ? sOverflow : aOverflow; // @[src/main/scala/exu/alu/ALU.scala 97:39]
  assign io_result = cla32Add_io_sum; // @[src/main/scala/exu/alu/ALU.scala 98:33]
  assign cla32Add_io_a = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 90:25]
  assign cla32Add_io_b = io_srcBData ^ subOrAddWire; // @[src/main/scala/exu/alu/ALU.scala 91:37]
  assign cla32Add_io_cin = io_subOrAdd; // @[src/main/scala/exu/alu/ALU.scala 92:25]
endmodule
module ALU(
  input  [3:0]  io_aluCtr, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output        io_less, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output        io_zero, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output [31:0] io_aluOut // @[src/main/scala/exu/alu/ALU.scala 9:20]
);
  wire [3:0] aluControl_io_aluCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_aOrLCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_lOrRCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_uOrSCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_subOrAddCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  shifter_io_lOrR; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire  shifter_io_aOrL; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [31:0] shifter_io_dIn; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [4:0] shifter_io_shamt; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [31:0] shifter_io_dOut; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire  aluAdder_io_subOrAdd; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_carry; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_zero; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_overflow; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_result; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [2:0] aluCtrWire = io_aluCtr[2:0]; // @[src/main/scala/exu/alu/ALU.scala 21:52]
  wire  _lessWire_T_3 = aluAdder_io_overflow ^ aluAdder_io_result[31]; // @[src/main/scala/exu/alu/ALU.scala 44:77]
  wire  lessWire = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[src/main/scala/exu/alu/ALU.scala 43:46]
  wire [31:0] sltDataWire = {31'h0,lessWire}; // @[src/main/scala/exu/alu/ALU.scala 47:46]
  wire [31:0] xorDataWire = io_srcAData ^ io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 49:55]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 50:55]
  wire [31:0] andDataWire = io_srcAData & io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 51:55]
  wire  _aluOutWire_T_1 = aluCtrWire == 3'h0; // @[src/main/scala/exu/alu/ALU.scala 53:29]
  wire  _aluOutWire_T_3 = aluCtrWire == 3'h1; // @[src/main/scala/exu/alu/ALU.scala 54:29]
  wire  _aluOutWire_T_5 = aluCtrWire == 3'h2; // @[src/main/scala/exu/alu/ALU.scala 55:29]
  wire  _aluOutWire_T_7 = aluCtrWire == 3'h3; // @[src/main/scala/exu/alu/ALU.scala 56:29]
  wire  _aluOutWire_T_9 = aluCtrWire == 3'h4; // @[src/main/scala/exu/alu/ALU.scala 57:29]
  wire  _aluOutWire_T_11 = aluCtrWire == 3'h5; // @[src/main/scala/exu/alu/ALU.scala 58:29]
  wire  _aluOutWire_T_13 = aluCtrWire == 3'h6; // @[src/main/scala/exu/alu/ALU.scala 59:29]
  wire  _aluOutWire_T_15 = aluCtrWire == 3'h7; // @[src/main/scala/exu/alu/ALU.scala 60:29]
  wire [31:0] _aluOutWire_T_16 = _aluOutWire_T_15 ? andDataWire : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_17 = _aluOutWire_T_13 ? orDataWire : _aluOutWire_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_18 = _aluOutWire_T_11 ? shifter_io_dOut : _aluOutWire_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_19 = _aluOutWire_T_9 ? xorDataWire : _aluOutWire_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_20 = _aluOutWire_T_7 ? io_srcBData : _aluOutWire_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_21 = _aluOutWire_T_5 ? sltDataWire : _aluOutWire_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_22 = _aluOutWire_T_3 ? shifter_io_dOut : _aluOutWire_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  ALUControl aluControl ( // @[src/main/scala/exu/alu/ALU.scala 19:49]
    .io_aluCtr(aluControl_io_aluCtr),
    .io_aOrLCtr(aluControl_io_aOrLCtr),
    .io_lOrRCtr(aluControl_io_lOrRCtr),
    .io_uOrSCtr(aluControl_io_uOrSCtr),
    .io_subOrAddCtr(aluControl_io_subOrAddCtr)
  );
  Shifter shifter ( // @[src/main/scala/exu/alu/ALU.scala 27:57]
    .io_lOrR(shifter_io_lOrR),
    .io_aOrL(shifter_io_aOrL),
    .io_dIn(shifter_io_dIn),
    .io_shamt(shifter_io_shamt),
    .io_dOut(shifter_io_dOut)
  );
  ALUAdder aluAdder ( // @[src/main/scala/exu/alu/ALU.scala 34:49]
    .io_subOrAdd(aluAdder_io_subOrAdd),
    .io_srcAData(aluAdder_io_srcAData),
    .io_srcBData(aluAdder_io_srcBData),
    .io_carry(aluAdder_io_carry),
    .io_zero(aluAdder_io_zero),
    .io_overflow(aluAdder_io_overflow),
    .io_result(aluAdder_io_result)
  );
  assign io_less = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[src/main/scala/exu/alu/ALU.scala 43:46]
  assign io_zero = aluAdder_io_zero; // @[src/main/scala/exu/alu/ALU.scala 64:25]
  assign io_aluOut = _aluOutWire_T_1 ? aluAdder_io_result : _aluOutWire_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign aluControl_io_aluCtr = io_aluCtr; // @[src/main/scala/exu/alu/ALU.scala 20:33]
  assign shifter_io_lOrR = aluControl_io_lOrRCtr; // @[src/main/scala/exu/alu/ALU.scala 28:41]
  assign shifter_io_aOrL = aluControl_io_aOrLCtr; // @[src/main/scala/exu/alu/ALU.scala 29:41]
  assign shifter_io_dIn = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 30:41]
  assign shifter_io_shamt = io_srcBData[4:0]; // @[src/main/scala/exu/alu/ALU.scala 31:55]
  assign aluAdder_io_subOrAdd = aluControl_io_subOrAddCtr; // @[src/main/scala/exu/alu/ALU.scala 35:33]
  assign aluAdder_io_srcAData = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 36:33]
  assign aluAdder_io_srcBData = io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 37:33]
endmodule
module CSRALU(
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  input  [1:0]  io_csrALUOP, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  output [31:0] io_oData // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
);
  wire [31:0] _andNotDataWire_T = ~io_srcBData; // @[src/main/scala/exu/alu/CSRALU.scala 20:43]
  wire [31:0] andNotDataWire = io_srcAData & _andNotDataWire_T; // @[src/main/scala/exu/alu/CSRALU.scala 20:40]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[src/main/scala/exu/alu/CSRALU.scala 21:40]
  wire  _io_oData_T = io_csrALUOP == 2'h0; // @[src/main/scala/exu/alu/CSRALU.scala 24:23]
  wire  _io_oData_T_1 = io_csrALUOP == 2'h1; // @[src/main/scala/exu/alu/CSRALU.scala 25:23]
  wire  _io_oData_T_2 = io_csrALUOP == 2'h2; // @[src/main/scala/exu/alu/CSRALU.scala 26:23]
  wire [31:0] _io_oData_T_3 = _io_oData_T_2 ? io_srcBData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_oData_T_4 = _io_oData_T_1 ? orDataWire : _io_oData_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_oData = _io_oData_T ? andNotDataWire : _io_oData_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
endmodule
module EXU(
  input         clock,
  input         reset,
  output        io_idu2EXU_ready, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_valid, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_idu2EXU_bits_pc, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_idu2EXU_bits_rs1Data, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_idu2EXU_bits_rs2Data, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_idu2EXU_bits_imm, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_idu2EXU_bits_inst, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_regWR, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [1:0]  io_idu2EXU_bits_srcAALU, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [1:0]  io_idu2EXU_bits_srcBALU, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [3:0]  io_idu2EXU_bits_ctrALU, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [3:0]  io_idu2EXU_bits_branch, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [1:0]  io_idu2EXU_bits_toReg, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_memWR, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_memValid, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [2:0]  io_idu2EXU_bits_memOP, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [4:0]  io_idu2EXU_bits_rs1Index, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_ecall, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_mret, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_csrEn, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_csrWr, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_idu2EXU_bits_csrOP, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [1:0]  io_idu2EXU_bits_csrALUOP, // @[src/main/scala/exu/EXU.scala 18:20]
  input         io_exu2WBU_ready, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_valid, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_pc, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_memData, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_aluData, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_csrWData, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_csrData, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_immData, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_rs1Data, // @[src/main/scala/exu/EXU.scala 18:20]
  output [31:0] io_exu2WBU_bits_inst, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_regWR, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_memWR, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_memValid, // @[src/main/scala/exu/EXU.scala 18:20]
  output [2:0]  io_exu2WBU_bits_memOP, // @[src/main/scala/exu/EXU.scala 18:20]
  output [1:0]  io_exu2WBU_bits_toReg, // @[src/main/scala/exu/EXU.scala 18:20]
  output [3:0]  io_exu2WBU_bits_branchCtr, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_less, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_zero, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_ecall, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_csrEn, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2WBU_bits_csrWr, // @[src/main/scala/exu/EXU.scala 18:20]
  input  [31:0] io_exu2CSR_csrData, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2CSR_mret, // @[src/main/scala/exu/EXU.scala 18:20]
  output        io_exu2CSR_ecall, // @[src/main/scala/exu/EXU.scala 18:20]
  output [11:0] io_exu2CSR_csr // @[src/main/scala/exu/EXU.scala 18:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] alu_io_aluCtr; // @[src/main/scala/exu/EXU.scala 132:25]
  wire [31:0] alu_io_srcAData; // @[src/main/scala/exu/EXU.scala 132:25]
  wire [31:0] alu_io_srcBData; // @[src/main/scala/exu/EXU.scala 132:25]
  wire  alu_io_less; // @[src/main/scala/exu/EXU.scala 132:25]
  wire  alu_io_zero; // @[src/main/scala/exu/EXU.scala 132:25]
  wire [31:0] alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 132:25]
  wire [31:0] csrALU_io_srcAData; // @[src/main/scala/exu/EXU.scala 142:41]
  wire [31:0] csrALU_io_srcBData; // @[src/main/scala/exu/EXU.scala 142:41]
  wire [1:0] csrALU_io_csrALUOP; // @[src/main/scala/exu/EXU.scala 142:41]
  wire [31:0] csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 142:41]
  wire  EFCC_valid; // @[src/main/scala/exu/EXU.scala 157:57]
  wire [31:0] EFCC_counterType; // @[src/main/scala/exu/EXU.scala 157:57]
  wire [31:0] EFCC_data; // @[src/main/scala/exu/EXU.scala 157:57]
  reg [31:0] pcReg; // @[src/main/scala/exu/EXU.scala 24:42]
  reg [31:0] rs1DataReg; // @[src/main/scala/exu/EXU.scala 25:34]
  reg [31:0] rs2DataReg; // @[src/main/scala/exu/EXU.scala 26:34]
  reg [31:0] immReg; // @[src/main/scala/exu/EXU.scala 27:42]
  reg [31:0] instReg; // @[src/main/scala/exu/EXU.scala 28:34]
  reg  regWRReg; // @[src/main/scala/exu/EXU.scala 30:34]
  reg [1:0] srcAALUReg; // @[src/main/scala/exu/EXU.scala 31:34]
  reg [1:0] srcBALUReg; // @[src/main/scala/exu/EXU.scala 32:34]
  reg [3:0] ctrALUReg; // @[src/main/scala/exu/EXU.scala 33:34]
  reg [3:0] branchReg; // @[src/main/scala/exu/EXU.scala 34:34]
  reg [1:0] toRegReg; // @[src/main/scala/exu/EXU.scala 35:34]
  reg  memWRReg; // @[src/main/scala/exu/EXU.scala 36:34]
  reg  memValidReg; // @[src/main/scala/exu/EXU.scala 37:34]
  reg [2:0] memOPReg; // @[src/main/scala/exu/EXU.scala 38:34]
  reg [4:0] rs1IndexReg; // @[src/main/scala/exu/EXU.scala 39:34]
  reg  ecallReg; // @[src/main/scala/exu/EXU.scala 40:34]
  reg  mretReg; // @[src/main/scala/exu/EXU.scala 41:34]
  reg  csrEnReg; // @[src/main/scala/exu/EXU.scala 42:34]
  reg  csrWrReg; // @[src/main/scala/exu/EXU.scala 43:34]
  reg  csrOPReg; // @[src/main/scala/exu/EXU.scala 44:34]
  reg [1:0] csrALUOPReg; // @[src/main/scala/exu/EXU.scala 45:34]
  reg  ready2IDUReg; // @[src/main/scala/exu/EXU.scala 47:34]
  reg  valid2WBUReg; // @[src/main/scala/exu/EXU.scala 49:30]
  reg [1:0] state; // @[src/main/scala/exu/EXU.scala 54:28]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[src/main/scala/exu/EXU.scala 56:55]
  wire [1:0] _state_T_3 = io_idu2EXU_valid ? 2'h2 : 2'h1; // @[src/main/scala/exu/EXU.scala 57:73]
  wire  _GEN_0 = state == 2'h2 ? 1'h0 : ready2IDUReg; // @[src/main/scala/exu/EXU.scala 67:49 68:30 47:34]
  wire  _GEN_1 = state == 2'h2 | valid2WBUReg; // @[src/main/scala/exu/EXU.scala 49:30 67:49 69:30]
  wire  _GEN_2 = state == 2'h1 | _GEN_0; // @[src/main/scala/exu/EXU.scala 64:49 65:30]
  wire  _GEN_4 = state == 2'h0 | _GEN_2; // @[src/main/scala/exu/EXU.scala 61:32 62:30]
  wire  _srcADataWire_T = srcAALUReg == 2'h0; // @[src/main/scala/exu/EXU.scala 124:33]
  wire  _srcADataWire_T_1 = srcAALUReg == 2'h1; // @[src/main/scala/exu/EXU.scala 125:33]
  wire [31:0] _srcADataWire_T_2 = _srcADataWire_T_1 ? pcReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _srcBDataWire_T = srcBALUReg == 2'h0; // @[src/main/scala/exu/EXU.scala 128:33]
  wire  _srcBDataWire_T_1 = srcBALUReg == 2'h1; // @[src/main/scala/exu/EXU.scala 129:33]
  wire  _srcBDataWire_T_2 = srcBALUReg == 2'h2; // @[src/main/scala/exu/EXU.scala 130:33]
  wire [31:0] _srcBDataWire_T_3 = _srcBDataWire_T_2 ? 32'h4 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _srcBDataWire_T_4 = _srcBDataWire_T_1 ? immReg : _srcBDataWire_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg [31:0] exuFinCalCnt; // @[src/main/scala/exu/EXU.scala 151:43]
  wire [31:0] _exuFinCalCnt_T_1 = exuFinCalCnt + 32'h1; // @[src/main/scala/exu/EXU.scala 155:54]
  ALU alu ( // @[src/main/scala/exu/EXU.scala 132:25]
    .io_aluCtr(alu_io_aluCtr),
    .io_srcAData(alu_io_srcAData),
    .io_srcBData(alu_io_srcBData),
    .io_less(alu_io_less),
    .io_zero(alu_io_zero),
    .io_aluOut(alu_io_aluOut)
  );
  CSRALU csrALU ( // @[src/main/scala/exu/EXU.scala 142:41]
    .io_srcAData(csrALU_io_srcAData),
    .io_srcBData(csrALU_io_srcBData),
    .io_csrALUOP(csrALU_io_csrALUOP),
    .io_oData(csrALU_io_oData)
  );
  PerformanceCounter EFCC ( // @[src/main/scala/exu/EXU.scala 157:57]
    .valid(EFCC_valid),
    .counterType(EFCC_counterType),
    .data(EFCC_data)
  );
  assign io_idu2EXU_ready = ready2IDUReg; // @[src/main/scala/exu/EXU.scala 48:40]
  assign io_exu2WBU_valid = valid2WBUReg; // @[src/main/scala/exu/EXU.scala 50:37]
  assign io_exu2WBU_bits_pc = pcReg; // @[src/main/scala/exu/EXU.scala 163:49]
  assign io_exu2WBU_bits_memData = rs2DataReg; // @[src/main/scala/exu/EXU.scala 164:41]
  assign io_exu2WBU_bits_aluData = alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 165:41]
  assign io_exu2WBU_bits_csrWData = csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 166:41]
  assign io_exu2WBU_bits_csrData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 167:41]
  assign io_exu2WBU_bits_immData = immReg; // @[src/main/scala/exu/EXU.scala 168:41]
  assign io_exu2WBU_bits_rs1Data = rs1DataReg; // @[src/main/scala/exu/EXU.scala 169:41]
  assign io_exu2WBU_bits_inst = instReg; // @[src/main/scala/exu/EXU.scala 170:41]
  assign io_exu2WBU_bits_regWR = regWRReg; // @[src/main/scala/exu/EXU.scala 172:41]
  assign io_exu2WBU_bits_memWR = memWRReg; // @[src/main/scala/exu/EXU.scala 173:41]
  assign io_exu2WBU_bits_memValid = memValidReg; // @[src/main/scala/exu/EXU.scala 174:41]
  assign io_exu2WBU_bits_memOP = memOPReg; // @[src/main/scala/exu/EXU.scala 175:41]
  assign io_exu2WBU_bits_toReg = toRegReg; // @[src/main/scala/exu/EXU.scala 176:41]
  assign io_exu2WBU_bits_branchCtr = branchReg; // @[src/main/scala/exu/EXU.scala 177:41]
  assign io_exu2WBU_bits_less = alu_io_less; // @[src/main/scala/exu/EXU.scala 178:41]
  assign io_exu2WBU_bits_zero = alu_io_zero; // @[src/main/scala/exu/EXU.scala 179:41]
  assign io_exu2WBU_bits_ecall = ecallReg; // @[src/main/scala/exu/EXU.scala 180:41]
  assign io_exu2WBU_bits_csrEn = csrEnReg; // @[src/main/scala/exu/EXU.scala 181:41]
  assign io_exu2WBU_bits_csrWr = csrWrReg; // @[src/main/scala/exu/EXU.scala 182:41]
  assign io_exu2CSR_mret = mretReg; // @[src/main/scala/exu/EXU.scala 185:49]
  assign io_exu2CSR_ecall = ecallReg; // @[src/main/scala/exu/EXU.scala 186:49]
  assign io_exu2CSR_csr = instReg[31:20]; // @[src/main/scala/exu/EXU.scala 184:60]
  assign alu_io_aluCtr = ctrALUReg; // @[src/main/scala/exu/EXU.scala 134:33]
  assign alu_io_srcAData = _srcADataWire_T ? rs1DataReg : _srcADataWire_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign alu_io_srcBData = _srcBDataWire_T ? rs2DataReg : _srcBDataWire_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_srcAData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 144:33]
  assign csrALU_io_srcBData = csrOPReg ? {{27'd0}, rs1IndexReg} : rs1DataReg; // @[src/main/scala/exu/EXU.scala 145:39]
  assign csrALU_io_csrALUOP = csrALUOPReg; // @[src/main/scala/exu/EXU.scala 146:33]
  assign EFCC_valid = io_exu2WBU_valid; // @[src/main/scala/exu/EXU.scala 158:41]
  assign EFCC_counterType = 32'h8; // @[src/main/scala/exu/EXU.scala 159:41]
  assign EFCC_data = exuFinCalCnt; // @[src/main/scala/exu/EXU.scala 160:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/exu/EXU.scala 24:42]
      pcReg <= 32'h80000000; // @[src/main/scala/exu/EXU.scala 24:42]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      pcReg <= io_idu2EXU_bits_pc; // @[src/main/scala/exu/EXU.scala 74:25]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 25:34]
      rs1DataReg <= 32'h0; // @[src/main/scala/exu/EXU.scala 25:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      rs1DataReg <= io_idu2EXU_bits_rs1Data; // @[src/main/scala/exu/EXU.scala 75:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 26:34]
      rs2DataReg <= 32'h0; // @[src/main/scala/exu/EXU.scala 26:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      rs2DataReg <= io_idu2EXU_bits_rs2Data; // @[src/main/scala/exu/EXU.scala 76:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 27:42]
      immReg <= 32'h0; // @[src/main/scala/exu/EXU.scala 27:42]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      immReg <= io_idu2EXU_bits_imm; // @[src/main/scala/exu/EXU.scala 77:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 28:34]
      instReg <= 32'h0; // @[src/main/scala/exu/EXU.scala 28:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      instReg <= io_idu2EXU_bits_inst; // @[src/main/scala/exu/EXU.scala 78:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 30:34]
      regWRReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 30:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      regWRReg <= io_idu2EXU_bits_regWR; // @[src/main/scala/exu/EXU.scala 80:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 31:34]
      srcAALUReg <= 2'h0; // @[src/main/scala/exu/EXU.scala 31:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      srcAALUReg <= io_idu2EXU_bits_srcAALU; // @[src/main/scala/exu/EXU.scala 81:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 32:34]
      srcBALUReg <= 2'h0; // @[src/main/scala/exu/EXU.scala 32:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      srcBALUReg <= io_idu2EXU_bits_srcBALU; // @[src/main/scala/exu/EXU.scala 82:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 33:34]
      ctrALUReg <= 4'h0; // @[src/main/scala/exu/EXU.scala 33:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      ctrALUReg <= io_idu2EXU_bits_ctrALU; // @[src/main/scala/exu/EXU.scala 83:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 34:34]
      branchReg <= 4'h0; // @[src/main/scala/exu/EXU.scala 34:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      branchReg <= io_idu2EXU_bits_branch; // @[src/main/scala/exu/EXU.scala 84:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 35:34]
      toRegReg <= 2'h0; // @[src/main/scala/exu/EXU.scala 35:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      toRegReg <= io_idu2EXU_bits_toReg; // @[src/main/scala/exu/EXU.scala 85:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 36:34]
      memWRReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 36:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      memWRReg <= io_idu2EXU_bits_memWR; // @[src/main/scala/exu/EXU.scala 86:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 37:34]
      memValidReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 37:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      memValidReg <= io_idu2EXU_bits_memValid; // @[src/main/scala/exu/EXU.scala 87:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 38:34]
      memOPReg <= 3'h0; // @[src/main/scala/exu/EXU.scala 38:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      memOPReg <= io_idu2EXU_bits_memOP; // @[src/main/scala/exu/EXU.scala 88:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 39:34]
      rs1IndexReg <= 5'h0; // @[src/main/scala/exu/EXU.scala 39:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      rs1IndexReg <= io_idu2EXU_bits_rs1Index; // @[src/main/scala/exu/EXU.scala 89:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 40:34]
      ecallReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 40:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      ecallReg <= io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 90:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 41:34]
      mretReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 41:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      mretReg <= io_idu2EXU_bits_mret; // @[src/main/scala/exu/EXU.scala 91:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 42:34]
      csrEnReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 42:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      csrEnReg <= io_idu2EXU_bits_csrEn; // @[src/main/scala/exu/EXU.scala 92:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 43:34]
      csrWrReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 43:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      csrWrReg <= io_idu2EXU_bits_csrWr; // @[src/main/scala/exu/EXU.scala 93:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 44:34]
      csrOPReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 44:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      csrOPReg <= io_idu2EXU_bits_csrOP; // @[src/main/scala/exu/EXU.scala 94:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 45:34]
      csrALUOPReg <= 2'h0; // @[src/main/scala/exu/EXU.scala 45:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[src/main/scala/exu/EXU.scala 73:52]
      csrALUOPReg <= io_idu2EXU_bits_csrALUOP; // @[src/main/scala/exu/EXU.scala 95:33]
    end
    ready2IDUReg <= reset | _GEN_4; // @[src/main/scala/exu/EXU.scala 47:{34,34}]
    if (reset) begin // @[src/main/scala/exu/EXU.scala 49:30]
      valid2WBUReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 49:30]
    end else if (state == 2'h0) begin // @[src/main/scala/exu/EXU.scala 61:32]
      valid2WBUReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 63:30]
    end else if (state == 2'h1) begin // @[src/main/scala/exu/EXU.scala 64:49]
      valid2WBUReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 66:30]
    end else begin
      valid2WBUReg <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 54:28]
      state <= 2'h0; // @[src/main/scala/exu/EXU.scala 54:28]
    end else if (2'h2 == state) begin // @[src/main/scala/exu/EXU.scala 55:42]
      if (reset) begin // @[src/main/scala/exu/EXU.scala 58:47]
        state <= 2'h0;
      end else if (io_exu2WBU_ready) begin // @[src/main/scala/exu/EXU.scala 58:73]
        state <= 2'h0;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/exu/EXU.scala 55:42]
      if (reset) begin // @[src/main/scala/exu/EXU.scala 57:47]
        state <= 2'h0;
      end else begin
        state <= _state_T_3;
      end
    end else if (2'h0 == state) begin // @[src/main/scala/exu/EXU.scala 55:42]
      state <= _state_T_1;
    end else begin
      state <= 2'h0;
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 151:43]
      exuFinCalCnt <= 32'h0; // @[src/main/scala/exu/EXU.scala 151:43]
    end else if (io_idu2EXU_valid & io_idu2EXU_ready) begin // @[src/main/scala/exu/EXU.scala 152:60]
      exuFinCalCnt <= 32'h0; // @[src/main/scala/exu/EXU.scala 153:38]
    end else begin
      exuFinCalCnt <= _exuFinCalCnt_T_1; // @[src/main/scala/exu/EXU.scala 155:38]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  rs1DataReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rs2DataReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  immReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  instReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regWRReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  srcAALUReg = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  srcBALUReg = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  ctrALUReg = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  branchReg = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  toRegReg = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  memWRReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  memValidReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  memOPReg = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  rs1IndexReg = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  ecallReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  mretReg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  csrEnReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  csrWrReg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  csrOPReg = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  csrALUOPReg = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  ready2IDUReg = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  valid2WBUReg = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  state = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  exuFinCalCnt = _RAND_24[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BranchCond(
  input  [3:0] io_branch, // @[src/main/scala/wbu/WBU.scala 354:20]
  input        io_less, // @[src/main/scala/wbu/WBU.scala 354:20]
  input        io_zero, // @[src/main/scala/wbu/WBU.scala 354:20]
  output [1:0] io_pcASrc, // @[src/main/scala/wbu/WBU.scala 354:20]
  output [1:0] io_pcBSrc // @[src/main/scala/wbu/WBU.scala 354:20]
);
  wire  _io_pcASrc_T = io_branch == 4'h0; // @[src/main/scala/wbu/WBU.scala 370:29]
  wire  _io_pcASrc_T_1 = io_branch == 4'h1; // @[src/main/scala/wbu/WBU.scala 371:29]
  wire  _io_pcASrc_T_2 = io_branch == 4'h2; // @[src/main/scala/wbu/WBU.scala 372:29]
  wire  _io_pcASrc_T_3 = io_branch == 4'h4; // @[src/main/scala/wbu/WBU.scala 373:29]
  wire  _io_pcASrc_T_4 = ~io_zero; // @[src/main/scala/wbu/WBU.scala 373:45]
  wire  _io_pcASrc_T_5 = io_branch == 4'h4 & ~io_zero; // @[src/main/scala/wbu/WBU.scala 373:43]
  wire  _io_pcASrc_T_7 = _io_pcASrc_T_3 & io_zero; // @[src/main/scala/wbu/WBU.scala 374:43]
  wire  _io_pcASrc_T_8 = io_branch == 4'h5; // @[src/main/scala/wbu/WBU.scala 375:29]
  wire  _io_pcASrc_T_10 = io_branch == 4'h5 & _io_pcASrc_T_4; // @[src/main/scala/wbu/WBU.scala 375:43]
  wire  _io_pcASrc_T_12 = _io_pcASrc_T_8 & io_zero; // @[src/main/scala/wbu/WBU.scala 376:43]
  wire  _io_pcASrc_T_13 = io_branch == 4'h6; // @[src/main/scala/wbu/WBU.scala 377:29]
  wire  _io_pcASrc_T_14 = ~io_less; // @[src/main/scala/wbu/WBU.scala 377:45]
  wire  _io_pcASrc_T_15 = io_branch == 4'h6 & ~io_less; // @[src/main/scala/wbu/WBU.scala 377:43]
  wire  _io_pcASrc_T_17 = _io_pcASrc_T_13 & io_less; // @[src/main/scala/wbu/WBU.scala 378:43]
  wire  _io_pcASrc_T_18 = io_branch == 4'h7; // @[src/main/scala/wbu/WBU.scala 379:29]
  wire  _io_pcASrc_T_20 = io_branch == 4'h7 & _io_pcASrc_T_14; // @[src/main/scala/wbu/WBU.scala 379:43]
  wire  _io_pcASrc_T_22 = _io_pcASrc_T_18 & io_less; // @[src/main/scala/wbu/WBU.scala 380:43]
  wire  _io_pcASrc_T_23 = io_branch == 4'h8; // @[src/main/scala/wbu/WBU.scala 381:29]
  wire [1:0] _io_pcASrc_T_24 = _io_pcASrc_T_23 ? 2'h2 : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_25 = _io_pcASrc_T_22 ? 2'h0 : _io_pcASrc_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_26 = _io_pcASrc_T_20 ? 2'h1 : _io_pcASrc_T_25; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_27 = _io_pcASrc_T_17 ? 2'h1 : _io_pcASrc_T_26; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_28 = _io_pcASrc_T_15 ? 2'h0 : _io_pcASrc_T_27; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_29 = _io_pcASrc_T_12 ? 2'h0 : _io_pcASrc_T_28; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_30 = _io_pcASrc_T_10 ? 2'h1 : _io_pcASrc_T_29; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_31 = _io_pcASrc_T_7 ? 2'h1 : _io_pcASrc_T_30; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_32 = _io_pcASrc_T_5 ? 2'h0 : _io_pcASrc_T_31; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_33 = _io_pcASrc_T_2 ? 2'h1 : _io_pcASrc_T_32; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcASrc_T_34 = _io_pcASrc_T_1 ? 2'h1 : _io_pcASrc_T_33; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_23 = _io_pcASrc_T_20 ? 2'h0 : _io_pcASrc_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_24 = _io_pcASrc_T_17 ? 2'h0 : _io_pcBSrc_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_25 = _io_pcASrc_T_15 ? 2'h0 : _io_pcBSrc_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_26 = _io_pcASrc_T_12 ? 2'h0 : _io_pcBSrc_T_25; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_27 = _io_pcASrc_T_10 ? 2'h0 : _io_pcBSrc_T_26; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_28 = _io_pcASrc_T_7 ? 2'h0 : _io_pcBSrc_T_27; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_29 = _io_pcASrc_T_5 ? 2'h0 : _io_pcBSrc_T_28; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_30 = _io_pcASrc_T_2 ? 2'h1 : _io_pcBSrc_T_29; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_pcBSrc_T_31 = _io_pcASrc_T_1 ? 2'h0 : _io_pcBSrc_T_30; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_pcASrc = _io_pcASrc_T ? 2'h0 : _io_pcASrc_T_34; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_pcBSrc = _io_pcASrc_T ? 2'h0 : _io_pcBSrc_T_31; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
endmodule
module WBU(
  input         clock,
  input         reset,
  output        io_exu2WBU_ready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_valid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_pc, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_memData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_aluData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_csrWData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_csrData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_immData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_rs1Data, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_inst, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_regWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_memWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_memValid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [2:0]  io_exu2WBU_bits_memOP, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [1:0]  io_exu2WBU_bits_toReg, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [3:0]  io_exu2WBU_bits_branchCtr, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_less, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_zero, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_ecall, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_csrEn, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_csrWr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2CSR_pc, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [11:0] io_wbu2CSR_csr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_ecall, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_csrEn, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_csrWr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2BaseReg_data, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2BaseReg_regWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_awready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_awvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_awaddr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [2:0]  io_wbu2Mem_awsize, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_wready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_wvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_wdata, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [3:0]  io_wbu2Mem_wstrb, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_wlast, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_bready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_bvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_arready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_arvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_araddr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [2:0]  io_wbu2Mem_arsize, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_rready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_rvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_wbu2Mem_rdata, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2PC_ready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2PC_valid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2PC_bits_nextPC // @[src/main/scala/wbu/WBU.scala 18:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] branchCond_io_branch; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  branchCond_io_less; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  branchCond_io_zero; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire [1:0] branchCond_io_pcASrc; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire [1:0] branchCond_io_pcBSrc; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  LGDC_valid; // @[src/main/scala/wbu/WBU.scala 308:57]
  wire [31:0] LGDC_counterType; // @[src/main/scala/wbu/WBU.scala 308:57]
  wire [31:0] LGDC_data; // @[src/main/scala/wbu/WBU.scala 308:57]
  wire  resetnWire = ~reset; // @[src/main/scala/wbu/WBU.scala 26:35]
  reg [31:0] pcReg; // @[src/main/scala/wbu/WBU.scala 28:42]
  reg [31:0] memDataReg; // @[src/main/scala/wbu/WBU.scala 29:42]
  reg [31:0] aluDataReg; // @[src/main/scala/wbu/WBU.scala 30:42]
  reg [31:0] csrWDataReg; // @[src/main/scala/wbu/WBU.scala 31:42]
  reg [31:0] csrDataReg; // @[src/main/scala/wbu/WBU.scala 32:42]
  reg [31:0] immDataReg; // @[src/main/scala/wbu/WBU.scala 33:38]
  reg [31:0] rs1DataReg; // @[src/main/scala/wbu/WBU.scala 34:38]
  reg [31:0] instReg; // @[src/main/scala/wbu/WBU.scala 35:42]
  reg  regWRReg; // @[src/main/scala/wbu/WBU.scala 37:34]
  reg  memWRReg; // @[src/main/scala/wbu/WBU.scala 38:42]
  reg  memValidReg; // @[src/main/scala/wbu/WBU.scala 39:38]
  reg [2:0] memOPReg; // @[src/main/scala/wbu/WBU.scala 40:42]
  reg [1:0] toRegReg; // @[src/main/scala/wbu/WBU.scala 41:42]
  reg [3:0] branchCtrReg; // @[src/main/scala/wbu/WBU.scala 42:42]
  reg  lessReg; // @[src/main/scala/wbu/WBU.scala 43:42]
  reg  zeroReg; // @[src/main/scala/wbu/WBU.scala 44:42]
  reg  ecallReg; // @[src/main/scala/wbu/WBU.scala 45:42]
  reg  csrEnReg; // @[src/main/scala/wbu/WBU.scala 46:42]
  reg  csrWrReg; // @[src/main/scala/wbu/WBU.scala 47:42]
  reg  ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 69:30]
  reg  validPC2Reg; // @[src/main/scala/wbu/WBU.scala 71:34]
  wire  _T = io_exu2WBU_ready & io_exu2WBU_valid; // @[src/main/scala/wbu/WBU.scala 75:31]
  wire  _wMaskWire_T = memOPReg == 3'h0; // @[src/main/scala/wbu/WBU.scala 97:28]
  wire  _wMaskWire_T_1 = memOPReg == 3'h1; // @[src/main/scala/wbu/WBU.scala 98:28]
  wire  _wMaskWire_T_2 = memOPReg == 3'h2; // @[src/main/scala/wbu/WBU.scala 99:28]
  wire  _wMaskWire_T_3 = memOPReg == 3'h5; // @[src/main/scala/wbu/WBU.scala 100:28]
  wire [3:0] _wMaskWire_T_6 = _wMaskWire_T_3 ? 4'h3 : 4'h1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _wMaskWire_T_7 = _wMaskWire_T_2 ? 4'hf : _wMaskWire_T_6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _wMaskWire_T_8 = _wMaskWire_T_1 ? 4'h3 : _wMaskWire_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] wMaskWire = _wMaskWire_T ? 4'h1 : _wMaskWire_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  sOrUWire = _wMaskWire_T | (_wMaskWire_T_1 | _wMaskWire_T_2); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  awvalidReg; // @[src/main/scala/wbu/WBU.scala 124:42]
  reg  wvalidReg; // @[src/main/scala/wbu/WBU.scala 136:42]
  wire  _io_wbu2Mem_wdata_T_1 = aluDataReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 139:35]
  wire  _io_wbu2Mem_wdata_T_3 = memOPReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 139:61]
  wire  _io_wbu2Mem_wdata_T_4 = aluDataReg[1:0] == 2'h0 & memOPReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 139:43]
  wire  _io_wbu2Mem_wdata_T_8 = memOPReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 140:61]
  wire  _io_wbu2Mem_wdata_T_9 = _io_wbu2Mem_wdata_T_1 & memOPReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 140:43]
  wire [31:0] _io_wbu2Mem_wdata_T_11 = {16'h0,memDataReg[15:0]}; // @[src/main/scala/wbu/WBU.scala 140:87]
  wire  _io_wbu2Mem_wdata_T_15 = memOPReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 141:61]
  wire  _io_wbu2Mem_wdata_T_16 = _io_wbu2Mem_wdata_T_1 & memOPReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 141:43]
  wire [31:0] _io_wbu2Mem_wdata_T_18 = {24'h0,memDataReg[7:0]}; // @[src/main/scala/wbu/WBU.scala 141:87]
  wire  _io_wbu2Mem_wdata_T_20 = aluDataReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 142:35]
  wire [31:0] _io_wbu2Mem_wdata_T_23 = {16'h0,memDataReg[7:0],8'h0}; // @[src/main/scala/wbu/WBU.scala 142:63]
  wire  _io_wbu2Mem_wdata_T_25 = aluDataReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 143:35]
  wire  _io_wbu2Mem_wdata_T_28 = aluDataReg[1:0] == 2'h2 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 143:43]
  wire [31:0] _io_wbu2Mem_wdata_T_31 = {8'h0,memDataReg[7:0],16'h0}; // @[src/main/scala/wbu/WBU.scala 143:87]
  wire  _io_wbu2Mem_wdata_T_36 = _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 144:43]
  wire [31:0] _io_wbu2Mem_wdata_T_38 = {memDataReg[15:0],16'h0}; // @[src/main/scala/wbu/WBU.scala 144:87]
  wire  _io_wbu2Mem_wdata_T_40 = aluDataReg[1:0] == 2'h3; // @[src/main/scala/wbu/WBU.scala 145:35]
  wire [31:0] _io_wbu2Mem_wdata_T_42 = {memDataReg[7:0],24'h0}; // @[src/main/scala/wbu/WBU.scala 145:63]
  wire [31:0] _io_wbu2Mem_wdata_T_43 = _io_wbu2Mem_wdata_T_40 ? _io_wbu2Mem_wdata_T_42 : memDataReg; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_44 = _io_wbu2Mem_wdata_T_36 ? _io_wbu2Mem_wdata_T_38 : _io_wbu2Mem_wdata_T_43; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_45 = _io_wbu2Mem_wdata_T_28 ? _io_wbu2Mem_wdata_T_31 : _io_wbu2Mem_wdata_T_44; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_46 = _io_wbu2Mem_wdata_T_20 ? _io_wbu2Mem_wdata_T_23 : _io_wbu2Mem_wdata_T_45; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_47 = _io_wbu2Mem_wdata_T_16 ? _io_wbu2Mem_wdata_T_18 : _io_wbu2Mem_wdata_T_46; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_48 = _io_wbu2Mem_wdata_T_9 ? _io_wbu2Mem_wdata_T_11 : _io_wbu2Mem_wdata_T_47; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2Mem_wstrb_T_3 = _io_wbu2Mem_wdata_T_1 & memWRReg; // @[src/main/scala/wbu/WBU.scala 148:43]
  wire  _io_wbu2Mem_wstrb_T_7 = _io_wbu2Mem_wdata_T_20 & memWRReg; // @[src/main/scala/wbu/WBU.scala 149:43]
  wire [3:0] _io_wbu2Mem_wstrb_T_9 = {wMaskWire[2:0],1'h0}; // @[src/main/scala/wbu/WBU.scala 149:79]
  wire  _io_wbu2Mem_wstrb_T_13 = _io_wbu2Mem_wdata_T_25 & memWRReg; // @[src/main/scala/wbu/WBU.scala 150:43]
  wire [3:0] _io_wbu2Mem_wstrb_T_15 = {wMaskWire[1:0],2'h0}; // @[src/main/scala/wbu/WBU.scala 150:79]
  wire  _io_wbu2Mem_wstrb_T_19 = _io_wbu2Mem_wdata_T_40 & memWRReg; // @[src/main/scala/wbu/WBU.scala 151:43]
  wire [3:0] _io_wbu2Mem_wstrb_T_21 = {wMaskWire[0],3'h0}; // @[src/main/scala/wbu/WBU.scala 151:79]
  wire [3:0] _io_wbu2Mem_wstrb_T_22 = _io_wbu2Mem_wstrb_T_19 ? _io_wbu2Mem_wstrb_T_21 : wMaskWire; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_wbu2Mem_wstrb_T_23 = _io_wbu2Mem_wstrb_T_13 ? _io_wbu2Mem_wstrb_T_15 : _io_wbu2Mem_wstrb_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_wbu2Mem_wstrb_T_24 = _io_wbu2Mem_wstrb_T_7 ? _io_wbu2Mem_wstrb_T_9 : _io_wbu2Mem_wstrb_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  wlastReg; // @[src/main/scala/wbu/WBU.scala 153:42]
  reg  breadyReg; // @[src/main/scala/wbu/WBU.scala 156:42]
  reg  arvalidReg; // @[src/main/scala/wbu/WBU.scala 163:42]
  reg  rreadyReg; // @[src/main/scala/wbu/WBU.scala 174:42]
  wire  _rdataShiftWire_T_2 = aluDataReg <= 32'h20000fff & aluDataReg >= 32'h20000000; // @[src/main/scala/wbu/WBU.scala 182:49]
  wire  _rdataShiftWire_T_5 = aluDataReg <= 32'h20000fff & aluDataReg >= 32'h20000000 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 182:83]
  wire [31:0] _rdataShiftWire_T_7 = {24'h0,io_wbu2Mem_rdata[7:0]}; // @[src/main/scala/wbu/WBU.scala 182:127]
  wire  _rdataShiftWire_T_13 = _rdataShiftWire_T_2 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 183:83]
  wire [31:0] _rdataShiftWire_T_15 = {16'h0,io_wbu2Mem_rdata[15:0]}; // @[src/main/scala/wbu/WBU.scala 183:127]
  wire  _rdataShiftWire_T_21 = _rdataShiftWire_T_2 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 184:83]
  wire  _rdataShiftWire_T_24 = aluDataReg <= 32'h3fffffff & aluDataReg >= 32'h30000000; // @[src/main/scala/wbu/WBU.scala 187:49]
  wire  _rdataShiftWire_T_27 = aluDataReg <= 32'h3fffffff & aluDataReg >= 32'h30000000 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 187:83]
  wire  _rdataShiftWire_T_35 = _rdataShiftWire_T_24 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 188:83]
  wire  _rdataShiftWire_T_43 = _rdataShiftWire_T_24 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 189:83]
  wire  _rdataShiftWire_T_44 = aluDataReg >= 32'h80000000; // @[src/main/scala/wbu/WBU.scala 192:31]
  wire  _rdataShiftWire_T_47 = aluDataReg >= 32'h80000000 & _io_wbu2Mem_wdata_T_1; // @[src/main/scala/wbu/WBU.scala 192:49]
  wire  _rdataShiftWire_T_50 = aluDataReg >= 32'h80000000 & _io_wbu2Mem_wdata_T_1 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 192:77]
  wire  _rdataShiftWire_T_57 = _rdataShiftWire_T_47 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 193:77]
  wire  _rdataShiftWire_T_66 = _rdataShiftWire_T_47 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 194:77]
  wire  _rdataShiftWire_T_72 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_20; // @[src/main/scala/wbu/WBU.scala 195:49]
  wire [31:0] _rdataShiftWire_T_74 = {24'h0,io_wbu2Mem_rdata[15:8]}; // @[src/main/scala/wbu/WBU.scala 195:95]
  wire  _rdataShiftWire_T_78 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_25; // @[src/main/scala/wbu/WBU.scala 196:49]
  wire  _rdataShiftWire_T_81 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 196:77]
  wire [31:0] _rdataShiftWire_T_83 = {24'h0,io_wbu2Mem_rdata[23:16]}; // @[src/main/scala/wbu/WBU.scala 196:119]
  wire  _rdataShiftWire_T_90 = _rdataShiftWire_T_78 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 197:77]
  wire [31:0] _rdataShiftWire_T_92 = {16'h0,io_wbu2Mem_rdata[31:16]}; // @[src/main/scala/wbu/WBU.scala 197:119]
  wire  _rdataShiftWire_T_96 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_40; // @[src/main/scala/wbu/WBU.scala 198:49]
  wire [31:0] _rdataShiftWire_T_98 = {24'h0,io_wbu2Mem_rdata[31:24]}; // @[src/main/scala/wbu/WBU.scala 198:95]
  wire  _rdataShiftWire_T_101 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000; // @[src/main/scala/wbu/WBU.scala 201:49]
  wire  _rdataShiftWire_T_104 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000 & _io_wbu2Mem_wdata_T_1; // @[src/main/scala/wbu/WBU.scala 201:82]
  wire  _rdataShiftWire_T_107 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000 & _io_wbu2Mem_wdata_T_1 &
    _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 201:110]
  wire  _rdataShiftWire_T_116 = _rdataShiftWire_T_104 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 202:110]
  wire  _rdataShiftWire_T_127 = _rdataShiftWire_T_104 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 203:110]
  wire  _rdataShiftWire_T_135 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_20; // @[src/main/scala/wbu/WBU.scala 204:82]
  wire  _rdataShiftWire_T_143 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_25; // @[src/main/scala/wbu/WBU.scala 205:82]
  wire  _rdataShiftWire_T_146 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 205:110]
  wire  _rdataShiftWire_T_157 = _rdataShiftWire_T_143 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 206:110]
  wire  _rdataShiftWire_T_165 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_40; // @[src/main/scala/wbu/WBU.scala 207:82]
  wire [31:0] _rdataShiftWire_T_168 = _rdataShiftWire_T_165 ? _rdataShiftWire_T_98 : io_wbu2Mem_rdata; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_169 = _rdataShiftWire_T_157 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_168; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_170 = _rdataShiftWire_T_146 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_169; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_171 = _rdataShiftWire_T_135 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_170; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_172 = _rdataShiftWire_T_127 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_171; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_173 = _rdataShiftWire_T_116 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_172; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_174 = _rdataShiftWire_T_107 ? io_wbu2Mem_rdata : _rdataShiftWire_T_173; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_175 = _rdataShiftWire_T_96 ? _rdataShiftWire_T_98 : _rdataShiftWire_T_174; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_176 = _rdataShiftWire_T_90 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_175; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_177 = _rdataShiftWire_T_81 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_176; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_178 = _rdataShiftWire_T_72 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_177; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_179 = _rdataShiftWire_T_66 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_178; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_180 = _rdataShiftWire_T_57 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_179; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_181 = _rdataShiftWire_T_50 ? io_wbu2Mem_rdata : _rdataShiftWire_T_180; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_182 = _rdataShiftWire_T_43 ? io_wbu2Mem_rdata : _rdataShiftWire_T_181; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_183 = _rdataShiftWire_T_35 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_182; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_184 = _rdataShiftWire_T_27 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_183; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_185 = _rdataShiftWire_T_21 ? io_wbu2Mem_rdata : _rdataShiftWire_T_184; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_186 = _rdataShiftWire_T_13 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_185; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] rdataShiftWire = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_186; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_186; // @[src/main/scala/wbu/WBU.scala 209:90]
  wire  _signDataWire_T_1 = wMaskWire == 4'h1; // @[src/main/scala/wbu/WBU.scala 210:28]
  wire [23:0] _signDataWire_T_3 = rdataShiftWire[7] ? 24'hffffff : 24'h0; // @[src/main/scala/wbu/WBU.scala 210:68]
  wire [31:0] _signDataWire_T_6 = {_signDataWire_T_3,rdataShiftWire[7:0]}; // @[src/main/scala/wbu/WBU.scala 210:115]
  wire  _signDataWire_T_7 = wMaskWire == 4'h3; // @[src/main/scala/wbu/WBU.scala 211:28]
  wire [15:0] _signDataWire_T_9 = rdataShiftWire[15] ? 16'hffff : 16'h0; // @[src/main/scala/wbu/WBU.scala 211:68]
  wire [31:0] _signDataWire_T_12 = {_signDataWire_T_9,rdataShiftWire[15:0]}; // @[src/main/scala/wbu/WBU.scala 211:117]
  wire  _signDataWire_T_13 = wMaskWire == 4'hf; // @[src/main/scala/wbu/WBU.scala 212:28]
  wire [31:0] _signDataWire_T_15 = _signDataWire_T_13 ? $signed(_signDataWire_T) : $signed(_signDataWire_T); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T_16 = _signDataWire_T_7 ? $signed(_signDataWire_T_12) : $signed(_signDataWire_T_15); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg [31:0] memRdDataReg; // @[src/main/scala/wbu/WBU.scala 214:42]
  wire [31:0] _memRdDataWire_T_1 = _signDataWire_T_1 ? $signed(_signDataWire_T_6) : $signed(_signDataWire_T_16); // @[src/main/scala/wbu/WBU.scala 215:69]
  wire  _T_1 = ~resetnWire; // @[src/main/scala/wbu/WBU.scala 218:14]
  wire  _T_2 = io_wbu2Mem_rvalid & io_wbu2Mem_rready; // @[src/main/scala/wbu/WBU.scala 220:32]
  wire  _T_18 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR; // @[src/main/scala/wbu/WBU.scala 228:93]
  wire  _T_19 = io_wbu2Mem_awready & io_wbu2Mem_awvalid; // @[src/main/scala/wbu/WBU.scala 230:33]
  wire  _GEN_21 = io_wbu2Mem_awready & io_wbu2Mem_awvalid ? 1'h0 : awvalidReg; // @[src/main/scala/wbu/WBU.scala 230:56 231:33 124:42]
  wire  _GEN_22 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR | _GEN_21; // @[src/main/scala/wbu/WBU.scala 228:126 229:33]
  wire  _T_26 = io_wbu2Mem_wready & io_wbu2Mem_wvalid; // @[src/main/scala/wbu/WBU.scala 240:32]
  wire  _GEN_24 = io_wbu2Mem_wready & io_wbu2Mem_wvalid ? 1'h0 : wvalidReg; // @[src/main/scala/wbu/WBU.scala 240:54 241:33 136:42]
  wire  _GEN_25 = io_wbu2Mem_wready & io_wbu2Mem_wvalid ? 1'h0 : wlastReg; // @[src/main/scala/wbu/WBU.scala 240:54 242:33 153:42]
  wire  _GEN_26 = _T_18 | _GEN_24; // @[src/main/scala/wbu/WBU.scala 237:126 238:33]
  wire  _GEN_27 = _T_18 | _GEN_25; // @[src/main/scala/wbu/WBU.scala 237:126 239:33]
  wire  _GEN_30 = io_wbu2Mem_bvalid | breadyReg; // @[src/main/scala/wbu/WBU.scala 255:33 256:33 156:42]
  wire  _GEN_31 = io_wbu2Mem_bvalid & io_wbu2Mem_bready ? 1'h0 : _GEN_30; // @[src/main/scala/wbu/WBU.scala 253:54 254:33]
  wire  _GEN_32 = _T_1 | _GEN_31; // @[src/main/scala/wbu/WBU.scala 251:34 252:33]
  wire  _T_36 = io_wbu2Mem_arvalid & io_wbu2Mem_arready; // @[src/main/scala/wbu/WBU.scala 263:40]
  wire  _GEN_33 = io_wbu2Mem_arvalid & io_wbu2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/wbu/WBU.scala 263:63 264:33 163:42]
  wire  _GEN_34 = _T & (io_exu2WBU_bits_memValid & ~io_exu2WBU_bits_memWR) | _GEN_33; // @[src/main/scala/wbu/WBU.scala 261:131 262:33]
  wire  _GEN_36 = io_wbu2Mem_rvalid | rreadyReg; // @[src/main/scala/wbu/WBU.scala 271:33 272:33 174:42]
  wire  _GEN_37 = _T_2 & io_exu2WBU_bits_memValid ? 1'h0 : _GEN_36; // @[src/main/scala/wbu/WBU.scala 269:89 270:33]
  wire  _GEN_38 = _T_1 | _GEN_37; // @[src/main/scala/wbu/WBU.scala 267:34 268:33]
  reg [1:0] state; // @[src/main/scala/wbu/WBU.scala 277:28]
  wire  memEnd = io_wbu2Mem_wready & wvalidReg | rreadyReg & io_wbu2Mem_rvalid; // @[src/main/scala/wbu/WBU.scala 278:48]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[src/main/scala/wbu/WBU.scala 280:55]
  wire [1:0] _state_T_4 = io_exu2WBU_bits_memValid ? 2'h2 : 2'h3; // @[src/main/scala/wbu/WBU.scala 281:95]
  wire [1:0] _state_T_5 = io_exu2WBU_valid ? _state_T_4 : 2'h1; // @[src/main/scala/wbu/WBU.scala 281:73]
  wire [1:0] _state_T_6 = reset ? 2'h0 : _state_T_5; // @[src/main/scala/wbu/WBU.scala 281:47]
  wire [1:0] _state_T_8 = memEnd ? 2'h3 : 2'h2; // @[src/main/scala/wbu/WBU.scala 282:81]
  wire  _GEN_39 = state == 2'h3 ? 1'h0 : ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 295:51 296:33 69:30]
  wire  _GEN_40 = state == 2'h3 | validPC2Reg; // @[src/main/scala/wbu/WBU.scala 295:51 297:33 71:34]
  wire  _GEN_41 = state == 2'h2 ? 1'h0 : _GEN_39; // @[src/main/scala/wbu/WBU.scala 292:42 293:33]
  wire  _GEN_43 = state == 2'h1 | _GEN_41; // @[src/main/scala/wbu/WBU.scala 289:49 290:33]
  wire  _GEN_45 = state == 2'h0 | _GEN_43; // @[src/main/scala/wbu/WBU.scala 286:32 287:33]
  reg [31:0] lsuGetDataCnt; // @[src/main/scala/wbu/WBU.scala 302:44]
  wire  _T_47 = _T_36 | _T_19; // @[src/main/scala/wbu/WBU.scala 303:66]
  wire [31:0] _lsuGetDataCnt_T_1 = lsuGetDataCnt + 32'h1; // @[src/main/scala/wbu/WBU.scala 306:56]
  wire  _io_wbu2BaseReg_data_T = toRegReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 335:20]
  wire  _io_wbu2BaseReg_data_T_1 = toRegReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 336:28]
  wire  _io_wbu2BaseReg_data_T_2 = toRegReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 337:28]
  wire [31:0] _io_wbu2BaseReg_data_T_3 = _io_wbu2BaseReg_data_T_2 ? csrDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2BaseReg_data_T_4 = _io_wbu2BaseReg_data_T_1 ? memRdDataReg : _io_wbu2BaseReg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T = branchCond_io_pcASrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 343:21]
  wire  _io_wbu2PC_bits_nextPC_T_1 = branchCond_io_pcASrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 344:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_4 = _io_wbu2PC_bits_nextPC_T_1 ? immDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_5 = _io_wbu2PC_bits_nextPC_T ? 32'h4 : _io_wbu2PC_bits_nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T_6 = branchCond_io_pcBSrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 347:21]
  wire  _io_wbu2PC_bits_nextPC_T_7 = branchCond_io_pcBSrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 348:29]
  wire  _io_wbu2PC_bits_nextPC_T_8 = branchCond_io_pcBSrc == 2'h2; // @[src/main/scala/wbu/WBU.scala 349:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_9 = _io_wbu2PC_bits_nextPC_T_8 ? csrWDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_10 = _io_wbu2PC_bits_nextPC_T_7 ? rs1DataReg : _io_wbu2PC_bits_nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_11 = _io_wbu2PC_bits_nextPC_T_6 ? pcReg : _io_wbu2PC_bits_nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  BranchCond branchCond ( // @[src/main/scala/wbu/WBU.scala 112:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  PerformanceCounter LGDC ( // @[src/main/scala/wbu/WBU.scala 308:57]
    .valid(LGDC_valid),
    .counterType(LGDC_counterType),
    .data(LGDC_data)
  );
  assign io_exu2WBU_ready = ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 70:40]
  assign io_wbu2CSR_pc = pcReg; // @[src/main/scala/wbu/WBU.scala 327:25]
  assign io_wbu2CSR_csrWData = csrWDataReg; // @[src/main/scala/wbu/WBU.scala 328:25]
  assign io_wbu2CSR_csr = instReg[31:20]; // @[src/main/scala/wbu/WBU.scala 329:36]
  assign io_wbu2CSR_ecall = ecallReg; // @[src/main/scala/wbu/WBU.scala 330:25]
  assign io_wbu2CSR_csrEn = csrEnReg; // @[src/main/scala/wbu/WBU.scala 331:25]
  assign io_wbu2CSR_csrWr = csrWrReg; // @[src/main/scala/wbu/WBU.scala 332:25]
  assign io_wbu2BaseReg_rdIndex = instReg[10:7]; // @[src/main/scala/wbu/WBU.scala 339:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? aluDataReg : _io_wbu2BaseReg_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2BaseReg_regWR = regWRReg; // @[src/main/scala/wbu/WBU.scala 340:29]
  assign io_wbu2Mem_awvalid = awvalidReg; // @[src/main/scala/wbu/WBU.scala 125:33]
  assign io_wbu2Mem_awaddr = aluDataReg; // @[src/main/scala/wbu/WBU.scala 126:33]
  assign io_wbu2Mem_awsize = {{1'd0}, memOPReg[1:0]}; // @[src/main/scala/wbu/WBU.scala 131:33]
  assign io_wbu2Mem_wvalid = wvalidReg; // @[src/main/scala/wbu/WBU.scala 137:33]
  assign io_wbu2Mem_wdata = _io_wbu2Mem_wdata_T_4 ? memDataReg : _io_wbu2Mem_wdata_T_48; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2Mem_wstrb = _io_wbu2Mem_wstrb_T_3 ? wMaskWire : _io_wbu2Mem_wstrb_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2Mem_wlast = wlastReg; // @[src/main/scala/wbu/WBU.scala 154:33]
  assign io_wbu2Mem_bready = breadyReg; // @[src/main/scala/wbu/WBU.scala 157:33]
  assign io_wbu2Mem_arvalid = arvalidReg; // @[src/main/scala/wbu/WBU.scala 164:33]
  assign io_wbu2Mem_araddr = aluDataReg; // @[src/main/scala/wbu/WBU.scala 165:33]
  assign io_wbu2Mem_arsize = {{1'd0}, memOPReg[1:0]}; // @[src/main/scala/wbu/WBU.scala 170:33]
  assign io_wbu2Mem_rready = rreadyReg; // @[src/main/scala/wbu/WBU.scala 175:33]
  assign io_wbu2PC_valid = validPC2Reg; // @[src/main/scala/wbu/WBU.scala 72:43]
  assign io_wbu2PC_bits_nextPC = _io_wbu2PC_bits_nextPC_T_5 + _io_wbu2PC_bits_nextPC_T_11; // @[src/main/scala/wbu/WBU.scala 346:8]
  assign branchCond_io_branch = branchCtrReg; // @[src/main/scala/wbu/WBU.scala 114:29]
  assign branchCond_io_less = lessReg; // @[src/main/scala/wbu/WBU.scala 115:33]
  assign branchCond_io_zero = zeroReg; // @[src/main/scala/wbu/WBU.scala 116:33]
  assign LGDC_valid = (_T_2 | _T_26) & memValidReg; // @[src/main/scala/wbu/WBU.scala 309:131]
  assign LGDC_counterType = 32'h7; // @[src/main/scala/wbu/WBU.scala 310:41]
  assign LGDC_data = _T_47 ? 32'h1 : _lsuGetDataCnt_T_1; // @[src/main/scala/wbu/WBU.scala 311:47]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 28:42]
      pcReg <= 32'h20000000; // @[src/main/scala/wbu/WBU.scala 28:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      pcReg <= io_exu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 76:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 29:42]
      memDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 29:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memDataReg <= io_exu2WBU_bits_memData; // @[src/main/scala/wbu/WBU.scala 77:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 30:42]
      aluDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 30:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      aluDataReg <= io_exu2WBU_bits_aluData; // @[src/main/scala/wbu/WBU.scala 78:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 31:42]
      csrWDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 31:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrWDataReg <= io_exu2WBU_bits_csrWData; // @[src/main/scala/wbu/WBU.scala 79:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 32:42]
      csrDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 32:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrDataReg <= io_exu2WBU_bits_csrData; // @[src/main/scala/wbu/WBU.scala 80:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 33:38]
      immDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 33:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      immDataReg <= io_exu2WBU_bits_immData; // @[src/main/scala/wbu/WBU.scala 81:29]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 34:38]
      rs1DataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 34:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      rs1DataReg <= io_exu2WBU_bits_rs1Data; // @[src/main/scala/wbu/WBU.scala 82:29]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 35:42]
      instReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 35:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      instReg <= io_exu2WBU_bits_inst; // @[src/main/scala/wbu/WBU.scala 83:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 37:34]
      regWRReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 37:34]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      regWRReg <= io_exu2WBU_bits_regWR; // @[src/main/scala/wbu/WBU.scala 84:25]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 38:42]
      memWRReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 38:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memWRReg <= io_exu2WBU_bits_memWR; // @[src/main/scala/wbu/WBU.scala 85:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 39:38]
      memValidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 39:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memValidReg <= io_exu2WBU_bits_memValid; // @[src/main/scala/wbu/WBU.scala 86:29]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 40:42]
      memOPReg <= 3'h0; // @[src/main/scala/wbu/WBU.scala 40:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memOPReg <= io_exu2WBU_bits_memOP; // @[src/main/scala/wbu/WBU.scala 87:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 41:42]
      toRegReg <= 2'h0; // @[src/main/scala/wbu/WBU.scala 41:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      toRegReg <= io_exu2WBU_bits_toReg; // @[src/main/scala/wbu/WBU.scala 88:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 42:42]
      branchCtrReg <= 4'h0; // @[src/main/scala/wbu/WBU.scala 42:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      branchCtrReg <= io_exu2WBU_bits_branchCtr; // @[src/main/scala/wbu/WBU.scala 89:25]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 43:42]
      lessReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 43:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      lessReg <= io_exu2WBU_bits_less; // @[src/main/scala/wbu/WBU.scala 90:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 44:42]
      zeroReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 44:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      zeroReg <= io_exu2WBU_bits_zero; // @[src/main/scala/wbu/WBU.scala 91:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 45:42]
      ecallReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 45:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      ecallReg <= io_exu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 92:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 46:42]
      csrEnReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 46:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrEnReg <= io_exu2WBU_bits_csrEn; // @[src/main/scala/wbu/WBU.scala 93:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 47:42]
      csrWrReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 47:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrWrReg <= io_exu2WBU_bits_csrWr; // @[src/main/scala/wbu/WBU.scala 94:33]
    end
    ready2EXUReg <= reset | _GEN_45; // @[src/main/scala/wbu/WBU.scala 69:{30,30}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 71:34]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 71:34]
    end else if (state == 2'h0) begin // @[src/main/scala/wbu/WBU.scala 286:32]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 288:33]
    end else if (state == 2'h1) begin // @[src/main/scala/wbu/WBU.scala 289:49]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 291:33]
    end else if (state == 2'h2) begin // @[src/main/scala/wbu/WBU.scala 292:42]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 294:33]
    end else begin
      validPC2Reg <= _GEN_40;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 124:42]
      awvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 124:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 226:34]
      awvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 227:33]
    end else begin
      awvalidReg <= _GEN_22;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 136:42]
      wvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 136:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 234:34]
      wvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 235:33]
    end else begin
      wvalidReg <= _GEN_26;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 153:42]
      wlastReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 153:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 234:34]
      wlastReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 236:33]
    end else begin
      wlastReg <= _GEN_27;
    end
    breadyReg <= reset | _GEN_32; // @[src/main/scala/wbu/WBU.scala 156:{42,42}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 163:42]
      arvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 163:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 259:34]
      arvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 260:33]
    end else begin
      arvalidReg <= _GEN_34;
    end
    rreadyReg <= reset | _GEN_38; // @[src/main/scala/wbu/WBU.scala 174:{42,42}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 214:42]
      memRdDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 214:42]
    end else if (~resetnWire) begin // @[src/main/scala/wbu/WBU.scala 218:34]
      memRdDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 219:33]
    end else if (io_wbu2Mem_rvalid & io_wbu2Mem_rready) begin // @[src/main/scala/wbu/WBU.scala 220:54]
      if (sOrUWire) begin // @[src/main/scala/wbu/WBU.scala 215:38]
        memRdDataReg <= _memRdDataWire_T_1;
      end else begin
        memRdDataReg <= rdataShiftWire;
      end
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 277:28]
      state <= 2'h0; // @[src/main/scala/wbu/WBU.scala 277:28]
    end else if (2'h3 == state) begin // @[src/main/scala/wbu/WBU.scala 279:42]
      if (reset) begin // @[src/main/scala/wbu/WBU.scala 283:47]
        state <= 2'h0;
      end else if (io_wbu2PC_ready) begin // @[src/main/scala/wbu/WBU.scala 283:73]
        state <= 2'h0;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/wbu/WBU.scala 279:42]
      if (reset) begin // @[src/main/scala/wbu/WBU.scala 282:55]
        state <= 2'h0;
      end else begin
        state <= _state_T_8;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/wbu/WBU.scala 279:42]
      state <= _state_T_6;
    end else begin
      state <= _state_T_1;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 302:44]
      lsuGetDataCnt <= 32'h0; // @[src/main/scala/wbu/WBU.scala 302:44]
    end else if (_T_36 | _T_19) begin // @[src/main/scala/wbu/WBU.scala 303:113]
      lsuGetDataCnt <= 32'h0; // @[src/main/scala/wbu/WBU.scala 304:39]
    end else begin
      lsuGetDataCnt <= _lsuGetDataCnt_T_1; // @[src/main/scala/wbu/WBU.scala 306:39]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (resetnWire & ~(~(io_wbu2Mem_awvalid & io_wbu2Mem_awaddr <= 32'hf000000) | ~(io_wbu2Mem_arvalid &
          io_wbu2Mem_araddr <= 32'hf000000))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at WBU.scala:224 assert(!(io.wbu2Mem.awvalid & (io.wbu2Mem.awaddr <= 0x0F000000.U)) | !(io.wbu2Mem.arvalid & (io.wbu2Mem.araddr <= 0x0F000000.U)));\n"
            ); // @[src/main/scala/wbu/WBU.scala 224:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_wbu2Mem_awvalid & io_wbu2Mem_awaddr <= 32'hf000000) | ~(io_wbu2Mem_arvalid & io_wbu2Mem_araddr <= 32'hf000000
          )) & resetnWire) begin
          $fatal; // @[src/main/scala/wbu/WBU.scala 224:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  memDataReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  aluDataReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  csrWDataReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  csrDataReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  immDataReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  rs1DataReg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  instReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regWRReg = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  memWRReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memValidReg = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  memOPReg = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  toRegReg = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  branchCtrReg = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  lessReg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  zeroReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  ecallReg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  csrEnReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  csrWrReg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  ready2EXUReg = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  validPC2Reg = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  awvalidReg = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  wvalidReg = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  wlastReg = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  breadyReg = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  arvalidReg = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  rreadyReg = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  memRdDataReg = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  state = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  lsuGetDataCnt = _RAND_29[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXIBusArbiter(
  input         clock,
  input         reset,
  input         io_axiSlave0_bready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave0_bvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave0_arready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave0_arvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [31:0] io_axiSlave0_araddr, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave0_rready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave0_rvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [31:0] io_axiSlave0_rdata, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave1_awready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_awvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [31:0] io_axiSlave1_awaddr, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [2:0]  io_axiSlave1_awsize, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave1_wready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_wvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [31:0] io_axiSlave1_wdata, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [3:0]  io_axiSlave1_wstrb, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_wlast, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_bready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave1_bvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave1_arready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_arvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [31:0] io_axiSlave1_araddr, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [2:0]  io_axiSlave1_arsize, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiSlave1_rready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiSlave1_rvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [31:0] io_axiSlave1_rdata, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiMaster_awready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_awvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [31:0] io_axiMaster_awaddr, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [2:0]  io_axiMaster_awsize, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiMaster_wready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_wvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [31:0] io_axiMaster_wdata, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [3:0]  io_axiMaster_wstrb, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_wlast, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_bready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiMaster_bvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiMaster_arready, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_arvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [31:0] io_axiMaster_araddr, // @[src/main/scala/basemode/Memory.scala 143:14]
  output [2:0]  io_axiMaster_arsize, // @[src/main/scala/basemode/Memory.scala 143:14]
  output        io_axiMaster_rready, // @[src/main/scala/basemode/Memory.scala 143:14]
  input         io_axiMaster_rvalid, // @[src/main/scala/basemode/Memory.scala 143:14]
  input  [31:0] io_axiMaster_rdata // @[src/main/scala/basemode/Memory.scala 143:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[src/main/scala/basemode/Memory.scala 175:22]
  wire  wait2LSUWire = io_axiSlave1_arvalid | io_axiSlave1_awvalid | io_axiSlave1_wvalid; // @[src/main/scala/basemode/Memory.scala 176:66]
  wire  ifu2WaitWire = io_axiSlave0_rvalid & io_axiSlave0_rready; // @[src/main/scala/basemode/Memory.scala 178:43]
  wire  lsu2WaitWire = io_axiSlave1_rvalid & io_axiSlave1_rready | io_axiSlave1_wvalid & io_axiSlave1_wready; // @[src/main/scala/basemode/Memory.scala 179:66]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[src/main/scala/basemode/Memory.scala 182:19]
  wire [1:0] _state_T_3 = io_axiSlave0_arvalid ? 2'h2 : 2'h1; // @[src/main/scala/basemode/Memory.scala 183:75]
  wire [1:0] _state_T_4 = wait2LSUWire ? 2'h3 : _state_T_3; // @[src/main/scala/basemode/Memory.scala 183:50]
  wire [1:0] _state_T_5 = reset ? 2'h0 : _state_T_4; // @[src/main/scala/basemode/Memory.scala 183:19]
  wire [1:0] _state_T_7 = ifu2WaitWire ? 2'h1 : 2'h2; // @[src/main/scala/basemode/Memory.scala 184:50]
  wire  _GEN_0 = state == 2'h3 & io_axiMaster_awready; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 193:21]
  wire  _GEN_1 = state == 2'h3 & io_axiSlave1_awvalid; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 212:21]
  wire [31:0] _GEN_2 = state == 2'h3 ? io_axiSlave1_awaddr : 32'h0; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 213:20]
  wire [2:0] _GEN_5 = state == 2'h3 ? io_axiSlave1_awsize : 3'h2; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 216:20]
  wire  _GEN_7 = state == 2'h3 & io_axiMaster_wready; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 195:20]
  wire  _GEN_8 = state == 2'h3 & io_axiSlave1_wvalid; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 219:20]
  wire [31:0] _GEN_9 = state == 2'h3 ? io_axiSlave1_wdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 220:19]
  wire [3:0] _GEN_10 = state == 2'h3 ? io_axiSlave1_wstrb : 4'h0; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 221:19]
  wire  _GEN_11 = state == 2'h3 & io_axiSlave1_wlast; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 222:19]
  wire  _GEN_12 = state == 2'h3 & io_axiSlave1_bready; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 224:20]
  wire  _GEN_13 = state == 2'h3 & io_axiMaster_bvalid; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 197:20]
  wire  _GEN_16 = state == 2'h3 & io_axiMaster_arready; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 201:21]
  wire  _GEN_17 = state == 2'h3 & io_axiSlave1_arvalid; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 226:21]
  wire [31:0] _GEN_18 = state == 2'h3 ? io_axiSlave1_araddr : 32'h0; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 227:20]
  wire [2:0] _GEN_21 = state == 2'h3 ? io_axiSlave1_arsize : 3'h2; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 230:20]
  wire  _GEN_23 = state == 2'h3 & io_axiSlave1_rready; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 233:20]
  wire  _GEN_24 = state == 2'h3 & io_axiMaster_rvalid; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 203:20]
  wire [31:0] _GEN_26 = state == 2'h3 ? io_axiMaster_rdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 192:32 193:18 src/main/scala/basemode/Interface.scala 205:19]
  wire  _GEN_30 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_1; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [31:0] _GEN_31 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_2; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [2:0] _GEN_34 = state == 2'h2 | state == 2'h1 ? 3'h2 : _GEN_5; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_37 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_8; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [31:0] _GEN_38 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_9; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [3:0] _GEN_39 = state == 2'h2 | state == 2'h1 ? 4'hf : _GEN_10; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_40 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_11; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_41 = state == 2'h2 | state == 2'h1 ? io_axiSlave0_bready : _GEN_12; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_42 = (state == 2'h2 | state == 2'h1) & io_axiMaster_bvalid; // @[src/main/scala/basemode/Memory.scala 190:52 191:18 src/main/scala/basemode/Interface.scala 197:20]
  wire  _GEN_45 = (state == 2'h2 | state == 2'h1) & io_axiMaster_arready; // @[src/main/scala/basemode/Memory.scala 190:52 191:18 src/main/scala/basemode/Interface.scala 201:21]
  wire  _GEN_46 = state == 2'h2 | state == 2'h1 ? io_axiSlave0_arvalid : _GEN_17; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [31:0] _GEN_47 = state == 2'h2 | state == 2'h1 ? io_axiSlave0_araddr : _GEN_18; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire [2:0] _GEN_50 = state == 2'h2 | state == 2'h1 ? 3'h2 : _GEN_21; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_52 = state == 2'h2 | state == 2'h1 ? io_axiSlave0_rready : _GEN_23; // @[src/main/scala/basemode/Memory.scala 190:52 191:18]
  wire  _GEN_53 = (state == 2'h2 | state == 2'h1) & io_axiMaster_rvalid; // @[src/main/scala/basemode/Memory.scala 190:52 191:18 src/main/scala/basemode/Interface.scala 203:20]
  wire [31:0] _GEN_55 = state == 2'h2 | state == 2'h1 ? io_axiMaster_rdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 190:52 191:18 src/main/scala/basemode/Interface.scala 205:19]
  wire  _GEN_58 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_0; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 193:21]
  wire  _GEN_59 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_7; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 195:20]
  wire  _GEN_60 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_13; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 197:20]
  wire  _GEN_63 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_16; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 201:21]
  wire  _GEN_64 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_24; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 203:20]
  wire [31:0] _GEN_66 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_26; // @[src/main/scala/basemode/Memory.scala 190:52 src/main/scala/basemode/Interface.scala 205:19]
  assign io_axiSlave0_bvalid = state == 2'h0 ? 1'h0 : _GEN_42; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 197:20]
  assign io_axiSlave0_arready = state == 2'h0 ? 1'h0 : _GEN_45; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 201:21]
  assign io_axiSlave0_rvalid = state == 2'h0 ? 1'h0 : _GEN_53; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 203:20]
  assign io_axiSlave0_rdata = state == 2'h0 ? 32'h0 : _GEN_55; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 205:19]
  assign io_axiSlave1_awready = state == 2'h0 ? 1'h0 : _GEN_58; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 193:21]
  assign io_axiSlave1_wready = state == 2'h0 ? 1'h0 : _GEN_59; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 195:20]
  assign io_axiSlave1_bvalid = state == 2'h0 ? 1'h0 : _GEN_60; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 197:20]
  assign io_axiSlave1_arready = state == 2'h0 ? 1'h0 : _GEN_63; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 201:21]
  assign io_axiSlave1_rvalid = state == 2'h0 ? 1'h0 : _GEN_64; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 203:20]
  assign io_axiSlave1_rdata = state == 2'h0 ? 32'h0 : _GEN_66; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 205:19]
  assign io_axiMaster_awvalid = state == 2'h0 ? 1'h0 : _GEN_30; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 212:21]
  assign io_axiMaster_awaddr = state == 2'h0 ? 32'h0 : _GEN_31; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 213:20]
  assign io_axiMaster_awsize = state == 2'h0 ? 3'h2 : _GEN_34; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 216:20]
  assign io_axiMaster_wvalid = state == 2'h0 ? 1'h0 : _GEN_37; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 219:20]
  assign io_axiMaster_wdata = state == 2'h0 ? 32'h0 : _GEN_38; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 220:19]
  assign io_axiMaster_wstrb = state == 2'h0 ? 4'h0 : _GEN_39; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 221:19]
  assign io_axiMaster_wlast = state == 2'h0 ? 1'h0 : _GEN_40; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 222:19]
  assign io_axiMaster_bready = state == 2'h0 ? 1'h0 : _GEN_41; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 224:20]
  assign io_axiMaster_arvalid = state == 2'h0 ? 1'h0 : _GEN_46; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 226:21]
  assign io_axiMaster_araddr = state == 2'h0 ? 32'h0 : _GEN_47; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 227:20]
  assign io_axiMaster_arsize = state == 2'h0 ? 3'h2 : _GEN_50; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 230:20]
  assign io_axiMaster_rready = state == 2'h0 ? 1'h0 : _GEN_52; // @[src/main/scala/basemode/Memory.scala 188:26 src/main/scala/basemode/Interface.scala 233:20]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/basemode/Memory.scala 175:22]
      state <= 2'h0; // @[src/main/scala/basemode/Memory.scala 175:22]
    end else if (2'h3 == state) begin // @[src/main/scala/basemode/Memory.scala 181:36]
      if (reset) begin // @[src/main/scala/basemode/Memory.scala 185:19]
        state <= 2'h0;
      end else if (lsu2WaitWire) begin // @[src/main/scala/basemode/Memory.scala 185:50]
        state <= 2'h1;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/basemode/Memory.scala 181:36]
      if (reset) begin // @[src/main/scala/basemode/Memory.scala 184:19]
        state <= 2'h0;
      end else begin
        state <= _state_T_7;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/basemode/Memory.scala 181:36]
      state <= _state_T_5;
    end else begin
      state <= _state_T_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module XbarAXI(
  input         clock,
  input         reset,
  input         io_axiSlaveIFU_bready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_arready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveIFU_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveIFU_araddr, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveIFU_rready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiSlaveIFU_rdata, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_awready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_awvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_awaddr, // @[src/main/scala/device/Device.scala 58:16]
  input  [2:0]  io_axiSlaveWBU_awsize, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_wready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_wvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_wdata, // @[src/main/scala/device/Device.scala 58:16]
  input  [3:0]  io_axiSlaveWBU_wstrb, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_wlast, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_bready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_arready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_araddr, // @[src/main/scala/device/Device.scala 58:16]
  input  [2:0]  io_axiSlaveWBU_arsize, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_rready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiSlaveWBU_rdata, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_awready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_awvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_awaddr, // @[src/main/scala/device/Device.scala 58:16]
  output [2:0]  io_axiMasterDevice_awsize, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_wready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_wvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_wdata, // @[src/main/scala/device/Device.scala 58:16]
  output [3:0]  io_axiMasterDevice_wstrb, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_wlast, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_bready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_arready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_araddr, // @[src/main/scala/device/Device.scala 58:16]
  output [2:0]  io_axiMasterDevice_arsize, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_rready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiMasterDevice_rdata, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiLiteClint_arAddr, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_arValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_arReady, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiLiteClint_rData, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_rValid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_rReady, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_awValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_awReady, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_wValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_wReady, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_bValid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_bReady // @[src/main/scala/device/Device.scala 58:16]
);
  wire  axiBusarbiter_clock; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_reset; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_awvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_awaddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_awsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_wdata; // @[src/main/scala/device/Device.scala 83:33]
  wire [3:0] axiBusarbiter_io_axiSlave1_wstrb; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wlast; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_arsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_awready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 83:33]
  wire [3:0] axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  _deviceID_T_9 = axiBusarbiter_io_axiMaster_awaddr < 32'h2010000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h2000000
    ; // @[src/main/scala/device/Device.scala 93:79]
  wire  _deviceID_T_10 = axiBusarbiter_io_axiMaster_araddr < 32'h2010000 & axiBusarbiter_io_axiMaster_araddr >= 32'h2000000
     | _deviceID_T_9; // @[src/main/scala/device/Device.scala 92:126]
  wire  _deviceID_T_20 = axiBusarbiter_io_axiMaster_awaddr < 32'h10001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10000000
    ; // @[src/main/scala/device/Device.scala 95:87]
  wire  _deviceID_T_21 = axiBusarbiter_io_axiMaster_araddr < 32'h10001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10000000
     | _deviceID_T_20; // @[src/main/scala/device/Device.scala 94:138]
  wire  _deviceID_T_31 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10001000
    ; // @[src/main/scala/device/Device.scala 97:77]
  wire  _deviceID_T_32 = axiBusarbiter_io_axiMaster_araddr < 32'h10002000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10001000
     | _deviceID_T_31; // @[src/main/scala/device/Device.scala 96:123]
  wire  _deviceID_T_42 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10002000
    ; // @[src/main/scala/device/Device.scala 99:77]
  wire  _deviceID_T_43 = axiBusarbiter_io_axiMaster_araddr < 32'h10002008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10002000
     | _deviceID_T_42; // @[src/main/scala/device/Device.scala 98:123]
  wire  _deviceID_T_53 = axiBusarbiter_io_axiMaster_awaddr < 32'h10011008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10011000
    ; // @[src/main/scala/device/Device.scala 101:75]
  wire  _deviceID_T_54 = axiBusarbiter_io_axiMaster_araddr < 32'h10011008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10011000
     | _deviceID_T_53; // @[src/main/scala/device/Device.scala 100:120]
  wire  _deviceID_T_64 = axiBusarbiter_io_axiMaster_awaddr < 32'h21200000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h21000000
    ; // @[src/main/scala/device/Device.scala 103:75]
  wire  _deviceID_T_65 = axiBusarbiter_io_axiMaster_araddr < 32'h21200000 & axiBusarbiter_io_axiMaster_araddr >= 32'h21000000
     | _deviceID_T_64; // @[src/main/scala/device/Device.scala 102:120]
  wire  _deviceID_T_75 = axiBusarbiter_io_axiMaster_awaddr < 32'hf002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'hf000000
    ; // @[src/main/scala/device/Device.scala 105:77]
  wire  _deviceID_T_76 = axiBusarbiter_io_axiMaster_araddr < 32'hf002000 & axiBusarbiter_io_axiMaster_araddr >= 32'hf000000
     | _deviceID_T_75; // @[src/main/scala/device/Device.scala 104:115]
  wire  _deviceID_T_86 = axiBusarbiter_io_axiMaster_awaddr < 32'h20001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h20000000
    ; // @[src/main/scala/device/Device.scala 107:77]
  wire  _deviceID_T_87 = axiBusarbiter_io_axiMaster_araddr < 32'h20001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h20000000
     | _deviceID_T_86; // @[src/main/scala/device/Device.scala 106:115]
  wire  _deviceID_T_90 = axiBusarbiter_io_axiMaster_araddr >= 32'h30000000 | axiBusarbiter_io_axiMaster_awaddr >= 32'h30000000
    ; // @[src/main/scala/device/Device.scala 108:53]
  wire [3:0] _deviceID_T_91 = _deviceID_T_90 ? 4'h8 : 4'h9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_92 = _deviceID_T_87 ? 4'h7 : _deviceID_T_91; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_93 = _deviceID_T_76 ? 4'h6 : _deviceID_T_92; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_94 = _deviceID_T_65 ? 4'h5 : _deviceID_T_93; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_95 = _deviceID_T_54 ? 4'h4 : _deviceID_T_94; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_96 = _deviceID_T_43 ? 4'h3 : _deviceID_T_95; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_97 = _deviceID_T_32 ? 4'h2 : _deviceID_T_96; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_98 = _deviceID_T_21 ? 4'h1 : _deviceID_T_97; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] deviceID = _deviceID_T_10 ? 4'h0 : _deviceID_T_98; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  AXIBusArbiter axiBusarbiter ( // @[src/main/scala/device/Device.scala 83:33]
    .clock(axiBusarbiter_clock),
    .reset(axiBusarbiter_reset),
    .io_axiSlave0_bready(axiBusarbiter_io_axiSlave0_bready),
    .io_axiSlave0_bvalid(axiBusarbiter_io_axiSlave0_bvalid),
    .io_axiSlave0_arready(axiBusarbiter_io_axiSlave0_arready),
    .io_axiSlave0_arvalid(axiBusarbiter_io_axiSlave0_arvalid),
    .io_axiSlave0_araddr(axiBusarbiter_io_axiSlave0_araddr),
    .io_axiSlave0_rready(axiBusarbiter_io_axiSlave0_rready),
    .io_axiSlave0_rvalid(axiBusarbiter_io_axiSlave0_rvalid),
    .io_axiSlave0_rdata(axiBusarbiter_io_axiSlave0_rdata),
    .io_axiSlave1_awready(axiBusarbiter_io_axiSlave1_awready),
    .io_axiSlave1_awvalid(axiBusarbiter_io_axiSlave1_awvalid),
    .io_axiSlave1_awaddr(axiBusarbiter_io_axiSlave1_awaddr),
    .io_axiSlave1_awsize(axiBusarbiter_io_axiSlave1_awsize),
    .io_axiSlave1_wready(axiBusarbiter_io_axiSlave1_wready),
    .io_axiSlave1_wvalid(axiBusarbiter_io_axiSlave1_wvalid),
    .io_axiSlave1_wdata(axiBusarbiter_io_axiSlave1_wdata),
    .io_axiSlave1_wstrb(axiBusarbiter_io_axiSlave1_wstrb),
    .io_axiSlave1_wlast(axiBusarbiter_io_axiSlave1_wlast),
    .io_axiSlave1_bready(axiBusarbiter_io_axiSlave1_bready),
    .io_axiSlave1_bvalid(axiBusarbiter_io_axiSlave1_bvalid),
    .io_axiSlave1_arready(axiBusarbiter_io_axiSlave1_arready),
    .io_axiSlave1_arvalid(axiBusarbiter_io_axiSlave1_arvalid),
    .io_axiSlave1_araddr(axiBusarbiter_io_axiSlave1_araddr),
    .io_axiSlave1_arsize(axiBusarbiter_io_axiSlave1_arsize),
    .io_axiSlave1_rready(axiBusarbiter_io_axiSlave1_rready),
    .io_axiSlave1_rvalid(axiBusarbiter_io_axiSlave1_rvalid),
    .io_axiSlave1_rdata(axiBusarbiter_io_axiSlave1_rdata),
    .io_axiMaster_awready(axiBusarbiter_io_axiMaster_awready),
    .io_axiMaster_awvalid(axiBusarbiter_io_axiMaster_awvalid),
    .io_axiMaster_awaddr(axiBusarbiter_io_axiMaster_awaddr),
    .io_axiMaster_awsize(axiBusarbiter_io_axiMaster_awsize),
    .io_axiMaster_wready(axiBusarbiter_io_axiMaster_wready),
    .io_axiMaster_wvalid(axiBusarbiter_io_axiMaster_wvalid),
    .io_axiMaster_wdata(axiBusarbiter_io_axiMaster_wdata),
    .io_axiMaster_wstrb(axiBusarbiter_io_axiMaster_wstrb),
    .io_axiMaster_wlast(axiBusarbiter_io_axiMaster_wlast),
    .io_axiMaster_bready(axiBusarbiter_io_axiMaster_bready),
    .io_axiMaster_bvalid(axiBusarbiter_io_axiMaster_bvalid),
    .io_axiMaster_arready(axiBusarbiter_io_axiMaster_arready),
    .io_axiMaster_arvalid(axiBusarbiter_io_axiMaster_arvalid),
    .io_axiMaster_araddr(axiBusarbiter_io_axiMaster_araddr),
    .io_axiMaster_arsize(axiBusarbiter_io_axiMaster_arsize),
    .io_axiMaster_rready(axiBusarbiter_io_axiMaster_rready),
    .io_axiMaster_rvalid(axiBusarbiter_io_axiMaster_rvalid),
    .io_axiMaster_rdata(axiBusarbiter_io_axiMaster_rdata)
  );
  assign io_axiSlaveIFU_bvalid = axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_arready = axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_rvalid = axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_rdata = axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveWBU_awready = axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_wready = axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_bvalid = axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_arready = axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_rvalid = axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_rdata = axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiMasterDevice_awvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 212:21 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_awaddr = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 213:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_awsize = deviceID == 4'h0 ? 3'h2 : axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 216:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 219:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wdata = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 220:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wstrb = deviceID == 4'h0 ? 4'h0 : axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 221:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wlast = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 222:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_bready = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 224:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_arvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 226:21 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_araddr = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 227:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_arsize = deviceID == 4'h0 ? 3'h2 : axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 230:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_rready = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 233:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiLiteClint_arAddr = deviceID == 4'h0 ? axiBusarbiter_io_axiMaster_araddr : 32'h0; // @[src/main/scala/device/Device.scala 120:39 137:38 66:32]
  assign io_axiLiteClint_arValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 120:39 136:38 67:33]
  assign io_axiLiteClint_rReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 120:39 142:38 68:32]
  assign io_axiLiteClint_awValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 120:39 123:38 70:33]
  assign io_axiLiteClint_wValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 120:39 127:38 73:32]
  assign io_axiLiteClint_bReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 120:39 133:38 74:32]
  assign axiBusarbiter_clock = clock;
  assign axiBusarbiter_reset = reset;
  assign axiBusarbiter_io_axiSlave0_bready = io_axiSlaveIFU_bready; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_arvalid = io_axiSlaveIFU_arvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_araddr = io_axiSlaveIFU_araddr; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_rready = io_axiSlaveIFU_rready; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave1_awvalid = io_axiSlaveWBU_awvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_awaddr = io_axiSlaveWBU_awaddr; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_awsize = io_axiSlaveWBU_awsize; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wvalid = io_axiSlaveWBU_wvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wdata = io_axiSlaveWBU_wdata; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wstrb = io_axiSlaveWBU_wstrb; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wlast = io_axiSlaveWBU_wlast; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_bready = io_axiSlaveWBU_bready; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_arvalid = io_axiSlaveWBU_arvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_araddr = io_axiSlaveWBU_araddr; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_arsize = io_axiSlaveWBU_arsize; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_rready = io_axiSlaveWBU_rready; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiMaster_awready = deviceID == 4'h0 ? io_axiLiteClint_awReady : io_axiMasterDevice_awready; // @[src/main/scala/device/Device.scala 120:39 122:30 144:19]
  assign axiBusarbiter_io_axiMaster_wready = deviceID == 4'h0 ? io_axiLiteClint_wReady : io_axiMasterDevice_wready; // @[src/main/scala/device/Device.scala 120:39 126:30 144:19]
  assign axiBusarbiter_io_axiMaster_bvalid = deviceID == 4'h0 ? io_axiLiteClint_bValid : io_axiMasterDevice_bvalid; // @[src/main/scala/device/Device.scala 120:39 132:30 144:19]
  assign axiBusarbiter_io_axiMaster_arready = deviceID == 4'h0 ? io_axiLiteClint_arReady : io_axiMasterDevice_arready; // @[src/main/scala/device/Device.scala 120:39 135:30 144:19]
  assign axiBusarbiter_io_axiMaster_rvalid = deviceID == 4'h0 ? io_axiLiteClint_rValid : io_axiMasterDevice_rvalid; // @[src/main/scala/device/Device.scala 120:39 141:30 144:19]
  assign axiBusarbiter_io_axiMaster_rdata = deviceID == 4'h0 ? io_axiLiteClint_rData : io_axiMasterDevice_rdata; // @[src/main/scala/device/Device.scala 120:39 139:30 144:19]
endmodule
module AXILiteClint(
  input         clock,
  input         reset,
  input  [31:0] io_axiLiteMaster_arAddr, // @[src/main/scala/device/Device.scala 316:20]
  input         io_axiLiteMaster_arValid, // @[src/main/scala/device/Device.scala 316:20]
  output        io_axiLiteMaster_arReady, // @[src/main/scala/device/Device.scala 316:20]
  output [31:0] io_axiLiteMaster_rData, // @[src/main/scala/device/Device.scala 316:20]
  output        io_axiLiteMaster_rValid, // @[src/main/scala/device/Device.scala 316:20]
  input         io_axiLiteMaster_rReady, // @[src/main/scala/device/Device.scala 316:20]
  input         io_axiLiteMaster_awValid, // @[src/main/scala/device/Device.scala 316:20]
  output        io_axiLiteMaster_awReady, // @[src/main/scala/device/Device.scala 316:20]
  input         io_axiLiteMaster_wValid, // @[src/main/scala/device/Device.scala 316:20]
  output        io_axiLiteMaster_wReady, // @[src/main/scala/device/Device.scala 316:20]
  output        io_axiLiteMaster_bValid, // @[src/main/scala/device/Device.scala 316:20]
  input         io_axiLiteMaster_bReady // @[src/main/scala/device/Device.scala 316:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtimeReg; // @[src/main/scala/device/Device.scala 320:31]
  wire [63:0] _mtimeReg_T_1 = mtimeReg + 64'h1; // @[src/main/scala/device/Device.scala 322:38]
  wire  aresetnWire = 1'h1 - reset; // @[src/main/scala/device/Device.scala 325:36]
  reg  arReadyReg; // @[src/main/scala/device/Device.scala 338:38]
  reg [31:0] rDataReg; // @[src/main/scala/device/Device.scala 342:38]
  reg  rValidReg; // @[src/main/scala/device/Device.scala 346:38]
  reg  awReadyReg; // @[src/main/scala/device/Device.scala 352:38]
  reg  wReadyReg; // @[src/main/scala/device/Device.scala 358:38]
  reg  bValidReg; // @[src/main/scala/device/Device.scala 363:38]
  reg  awEnReg; // @[src/main/scala/device/Device.scala 367:38]
  reg [31:0] arAddrReg; // @[src/main/scala/device/Device.scala 369:38]
  wire  _T_3 = ~aresetnWire; // @[src/main/scala/device/Device.scala 373:10]
  wire  _T_7 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg; // @[src/main/scala/device/Device.scala 376:58]
  wire  _GEN_2 = io_axiLiteMaster_wValid & wReadyReg | awEnReg; // @[src/main/scala/device/Device.scala 379:42 381:21 367:38]
  wire  _GEN_4 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg ? 1'h0 : _GEN_2; // @[src/main/scala/device/Device.scala 376:70 378:21]
  wire  _GEN_5 = ~aresetnWire | _T_7; // @[src/main/scala/device/Device.scala 373:31 374:21]
  wire  _GEN_6 = ~aresetnWire | _GEN_4; // @[src/main/scala/device/Device.scala 373:31 375:21]
  wire  _T_20 = ~wReadyReg & io_axiLiteMaster_wValid & io_axiLiteMaster_awValid & awEnReg; // @[src/main/scala/device/Device.scala 393:57]
  wire  _GEN_11 = bValidReg & io_axiLiteMaster_bReady ? 1'h0 : bValidReg; // @[src/main/scala/device/Device.scala 403:42 404:21 363:38]
  wire  _GEN_12 = io_axiLiteMaster_awValid & awReadyReg & io_axiLiteMaster_wValid & wReadyReg & ~bValidReg | _GEN_11; // @[src/main/scala/device/Device.scala 401:85 402:21]
  wire  _T_32 = io_axiLiteMaster_arValid & ~arReadyReg; // @[src/main/scala/device/Device.scala 410:29]
  wire  _GEN_16 = _T_3 | _T_32; // @[src/main/scala/device/Device.scala 407:31 408:21]
  wire  _T_37 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg; // @[src/main/scala/device/Device.scala 420:43]
  wire  _GEN_18 = io_axiLiteMaster_rReady ? 1'h0 : rValidReg; // @[src/main/scala/device/Device.scala 423:29 424:21 346:38]
  wire  _GEN_19 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg | _GEN_18; // @[src/main/scala/device/Device.scala 420:58 421:21]
  wire [31:0] _GEN_23 = arAddrReg == 32'h2000004 ? mtimeReg[63:32] : 32'h0; // @[src/main/scala/device/Device.scala 432:71 433:33 435:33]
  assign io_axiLiteMaster_arReady = arReadyReg; // @[src/main/scala/device/Device.scala 339:29]
  assign io_axiLiteMaster_rData = rDataReg; // @[src/main/scala/device/Device.scala 343:29]
  assign io_axiLiteMaster_rValid = rValidReg; // @[src/main/scala/device/Device.scala 347:29]
  assign io_axiLiteMaster_awReady = awReadyReg; // @[src/main/scala/device/Device.scala 353:29]
  assign io_axiLiteMaster_wReady = wReadyReg; // @[src/main/scala/device/Device.scala 359:29]
  assign io_axiLiteMaster_bValid = bValidReg; // @[src/main/scala/device/Device.scala 364:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/device/Device.scala 320:31]
      mtimeReg <= 64'h0; // @[src/main/scala/device/Device.scala 320:31]
    end else if (clock) begin // @[src/main/scala/device/Device.scala 321:33]
      mtimeReg <= _mtimeReg_T_1; // @[src/main/scala/device/Device.scala 322:26]
    end
    arReadyReg <= reset | _GEN_16; // @[src/main/scala/device/Device.scala 338:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 342:38]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 342:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 426:31]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 427:21]
    end else if (_T_37) begin // @[src/main/scala/device/Device.scala 429:58]
      if (arAddrReg == 32'h2000000) begin // @[src/main/scala/device/Device.scala 430:58]
        rDataReg <= mtimeReg[31:0]; // @[src/main/scala/device/Device.scala 431:33]
      end else begin
        rDataReg <= _GEN_23;
      end
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 346:38]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 346:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 417:31]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 418:21]
    end else begin
      rValidReg <= _GEN_19;
    end
    awReadyReg <= reset | _GEN_5; // @[src/main/scala/device/Device.scala 352:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 358:38]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 358:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 391:31]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 392:21]
    end else begin
      wReadyReg <= _T_20;
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 363:38]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 363:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 399:31]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 400:21]
    end else begin
      bValidReg <= _GEN_12;
    end
    awEnReg <= reset | _GEN_6; // @[src/main/scala/device/Device.scala 367:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 369:38]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 369:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 407:31]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 409:21]
    end else if (io_axiLiteMaster_arValid & ~arReadyReg) begin // @[src/main/scala/device/Device.scala 410:45]
      arAddrReg <= io_axiLiteMaster_arAddr; // @[src/main/scala/device/Device.scala 412:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mtimeReg = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  arReadyReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rDataReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rValidReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  awReadyReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wReadyReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  bValidReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  awEnReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  arAddrReg = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module top(
  input         clock,
  input         reset,
  input         io_interrupt, // @[src/main/scala/Main.scala 23:20]
  input         io_master_awready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_awvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_awaddr, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_awid, // @[src/main/scala/Main.scala 23:20]
  output [7:0]  io_master_awlen, // @[src/main/scala/Main.scala 23:20]
  output [2:0]  io_master_awsize, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_master_awburst, // @[src/main/scala/Main.scala 23:20]
  input         io_master_wready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_wvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_wdata, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_wstrb, // @[src/main/scala/Main.scala 23:20]
  output        io_master_wlast, // @[src/main/scala/Main.scala 23:20]
  output        io_master_bready, // @[src/main/scala/Main.scala 23:20]
  input         io_master_bvalid, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_master_bresp, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_master_bid, // @[src/main/scala/Main.scala 23:20]
  input         io_master_arready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_arvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_araddr, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_arid, // @[src/main/scala/Main.scala 23:20]
  output [7:0]  io_master_arlen, // @[src/main/scala/Main.scala 23:20]
  output [2:0]  io_master_arsize, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_master_arburst, // @[src/main/scala/Main.scala 23:20]
  output        io_master_rready, // @[src/main/scala/Main.scala 23:20]
  input         io_master_rvalid, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_master_rresp, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_master_rdata, // @[src/main/scala/Main.scala 23:20]
  input         io_master_rlast, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_master_rid, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_awready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_awvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_awaddr, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_awid, // @[src/main/scala/Main.scala 23:20]
  input  [7:0]  io_slave_awlen, // @[src/main/scala/Main.scala 23:20]
  input  [2:0]  io_slave_awsize, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_slave_awburst, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_wready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_wvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_wdata, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_wstrb, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_wlast, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_bready, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_bvalid, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_slave_bresp, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_slave_bid, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_arready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_arvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_araddr, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_arid, // @[src/main/scala/Main.scala 23:20]
  input  [7:0]  io_slave_arlen, // @[src/main/scala/Main.scala 23:20]
  input  [2:0]  io_slave_arsize, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_slave_arburst, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_rready, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_rvalid, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_slave_rresp, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_slave_rdata, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_rlast, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_slave_rid // @[src/main/scala/Main.scala 23:20]
);
  wire  pc_clock; // @[src/main/scala/Main.scala 28:49]
  wire  pc_reset; // @[src/main/scala/Main.scala 28:49]
  wire  pc_io_wbu2PC_ready; // @[src/main/scala/Main.scala 28:49]
  wire  pc_io_wbu2PC_valid; // @[src/main/scala/Main.scala 28:49]
  wire [31:0] pc_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 28:49]
  wire [31:0] pc_io_pc; // @[src/main/scala/Main.scala 28:49]
  wire  ifu_clock; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_reset; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_pc; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_inst_valid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_bvalid; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_arready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_rvalid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_ifu2Mem_rdata; // @[src/main/scala/Main.scala 29:49]
  wire  riscv32BaseReg_clock; // @[src/main/scala/Main.scala 30:41]
  wire  riscv32BaseReg_reset; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 30:41]
  wire  riscv32BaseReg_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 30:41]
  wire  csrReg_clock; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_reset; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_exu2CSR_mret; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 31:49]
  wire [11:0] csrReg_io_exu2CSR_csr; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 31:49]
  wire [11:0] csrReg_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 31:49]
  wire  idu_clock; // @[src/main/scala/Main.scala 32:49]
  wire  idu_reset; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_inst_ready; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_inst_valid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_inst_bits_inst; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_inst_bits_pc; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 32:49]
  wire [2:0] idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 32:49]
  wire [4:0] idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 32:49]
  wire  exu_clock; // @[src/main/scala/Main.scala 33:49]
  wire  exu_reset; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 33:49]
  wire [2:0] exu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 33:49]
  wire [4:0] exu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 33:49]
  wire [2:0] exu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 33:49]
  wire [11:0] exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 33:49]
  wire  wbu_clock; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_reset; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 34:49]
  wire [1:0] wbu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 34:49]
  wire [11:0] wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_awready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_awvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_awaddr; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_wbu2Mem_awsize; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_wdata; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_wbu2Mem_wstrb; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wlast; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_bready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_bvalid; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_arready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_arvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_araddr; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_wbu2Mem_arsize; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_rready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_rvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_rdata; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2PC_ready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 34:49]
  wire  xbarAXI_clock; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_reset; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_araddr; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_awvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_awaddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_awsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_wdata; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] xbarAXI_io_axiSlaveWBU_wstrb; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wlast; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_araddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_arsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_awready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_rdata; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_arReady; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiLiteClint_rData; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_rValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_awReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_wReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_bValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 35:49]
  wire  axiLiteClint_clock; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_reset; // @[src/main/scala/Main.scala 66:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_arAddr; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_arValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 66:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_rReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_awValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_wValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_bReady; // @[src/main/scala/Main.scala 66:34]
  PC pc ( // @[src/main/scala/Main.scala 28:49]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_wbu2PC_ready(pc_io_wbu2PC_ready),
    .io_wbu2PC_valid(pc_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(pc_io_wbu2PC_bits_nextPC),
    .io_pc(pc_io_pc)
  );
  IFU ifu ( // @[src/main/scala/Main.scala 29:49]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_pc(ifu_io_pc),
    .io_inst_valid(ifu_io_inst_valid),
    .io_inst_bits_inst(ifu_io_inst_bits_inst),
    .io_inst_bits_pc(ifu_io_inst_bits_pc),
    .io_ifu2Mem_bready(ifu_io_ifu2Mem_bready),
    .io_ifu2Mem_bvalid(ifu_io_ifu2Mem_bvalid),
    .io_ifu2Mem_arready(ifu_io_ifu2Mem_arready),
    .io_ifu2Mem_arvalid(ifu_io_ifu2Mem_arvalid),
    .io_ifu2Mem_araddr(ifu_io_ifu2Mem_araddr),
    .io_ifu2Mem_rready(ifu_io_ifu2Mem_rready),
    .io_ifu2Mem_rvalid(ifu_io_ifu2Mem_rvalid),
    .io_ifu2Mem_rdata(ifu_io_ifu2Mem_rdata)
  );
  Riscv32BaseReg riscv32BaseReg ( // @[src/main/scala/Main.scala 30:41]
    .clock(riscv32BaseReg_clock),
    .reset(riscv32BaseReg_reset),
    .io_idu2BaseReg_rs1Data(riscv32BaseReg_io_idu2BaseReg_rs1Data),
    .io_idu2BaseReg_rs2Data(riscv32BaseReg_io_idu2BaseReg_rs2Data),
    .io_idu2BaseReg_rs1Index(riscv32BaseReg_io_idu2BaseReg_rs1Index),
    .io_idu2BaseReg_rs2Index(riscv32BaseReg_io_idu2BaseReg_rs2Index),
    .io_wbu2BaseReg_rdIndex(riscv32BaseReg_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(riscv32BaseReg_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(riscv32BaseReg_io_wbu2BaseReg_regWR)
  );
  CSRReg csrReg ( // @[src/main/scala/Main.scala 31:49]
    .clock(csrReg_clock),
    .reset(csrReg_reset),
    .io_exu2CSR_csrData(csrReg_io_exu2CSR_csrData),
    .io_exu2CSR_mret(csrReg_io_exu2CSR_mret),
    .io_exu2CSR_ecall(csrReg_io_exu2CSR_ecall),
    .io_exu2CSR_csr(csrReg_io_exu2CSR_csr),
    .io_wbu2CSR_pc(csrReg_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(csrReg_io_wbu2CSR_csrWData),
    .io_wbu2CSR_csr(csrReg_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(csrReg_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(csrReg_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(csrReg_io_wbu2CSR_csrWr)
  );
  IDU idu ( // @[src/main/scala/Main.scala 32:49]
    .clock(idu_clock),
    .reset(idu_reset),
    .io_inst_ready(idu_io_inst_ready),
    .io_inst_valid(idu_io_inst_valid),
    .io_inst_bits_inst(idu_io_inst_bits_inst),
    .io_inst_bits_pc(idu_io_inst_bits_pc),
    .io_idu2EXU_ready(idu_io_idu2EXU_ready),
    .io_idu2EXU_valid(idu_io_idu2EXU_valid),
    .io_idu2EXU_bits_pc(idu_io_idu2EXU_bits_pc),
    .io_idu2EXU_bits_rs1Data(idu_io_idu2EXU_bits_rs1Data),
    .io_idu2EXU_bits_rs2Data(idu_io_idu2EXU_bits_rs2Data),
    .io_idu2EXU_bits_imm(idu_io_idu2EXU_bits_imm),
    .io_idu2EXU_bits_inst(idu_io_idu2EXU_bits_inst),
    .io_idu2EXU_bits_regWR(idu_io_idu2EXU_bits_regWR),
    .io_idu2EXU_bits_srcAALU(idu_io_idu2EXU_bits_srcAALU),
    .io_idu2EXU_bits_srcBALU(idu_io_idu2EXU_bits_srcBALU),
    .io_idu2EXU_bits_ctrALU(idu_io_idu2EXU_bits_ctrALU),
    .io_idu2EXU_bits_branch(idu_io_idu2EXU_bits_branch),
    .io_idu2EXU_bits_toReg(idu_io_idu2EXU_bits_toReg),
    .io_idu2EXU_bits_memWR(idu_io_idu2EXU_bits_memWR),
    .io_idu2EXU_bits_memValid(idu_io_idu2EXU_bits_memValid),
    .io_idu2EXU_bits_memOP(idu_io_idu2EXU_bits_memOP),
    .io_idu2EXU_bits_rs1Index(idu_io_idu2EXU_bits_rs1Index),
    .io_idu2EXU_bits_ecall(idu_io_idu2EXU_bits_ecall),
    .io_idu2EXU_bits_mret(idu_io_idu2EXU_bits_mret),
    .io_idu2EXU_bits_csrEn(idu_io_idu2EXU_bits_csrEn),
    .io_idu2EXU_bits_csrWr(idu_io_idu2EXU_bits_csrWr),
    .io_idu2EXU_bits_csrOP(idu_io_idu2EXU_bits_csrOP),
    .io_idu2EXU_bits_csrALUOP(idu_io_idu2EXU_bits_csrALUOP),
    .io_idu2BaseReg_rs1Data(idu_io_idu2BaseReg_rs1Data),
    .io_idu2BaseReg_rs2Data(idu_io_idu2BaseReg_rs2Data),
    .io_idu2BaseReg_rs1Index(idu_io_idu2BaseReg_rs1Index),
    .io_idu2BaseReg_rs2Index(idu_io_idu2BaseReg_rs2Index)
  );
  EXU exu ( // @[src/main/scala/Main.scala 33:49]
    .clock(exu_clock),
    .reset(exu_reset),
    .io_idu2EXU_ready(exu_io_idu2EXU_ready),
    .io_idu2EXU_valid(exu_io_idu2EXU_valid),
    .io_idu2EXU_bits_pc(exu_io_idu2EXU_bits_pc),
    .io_idu2EXU_bits_rs1Data(exu_io_idu2EXU_bits_rs1Data),
    .io_idu2EXU_bits_rs2Data(exu_io_idu2EXU_bits_rs2Data),
    .io_idu2EXU_bits_imm(exu_io_idu2EXU_bits_imm),
    .io_idu2EXU_bits_inst(exu_io_idu2EXU_bits_inst),
    .io_idu2EXU_bits_regWR(exu_io_idu2EXU_bits_regWR),
    .io_idu2EXU_bits_srcAALU(exu_io_idu2EXU_bits_srcAALU),
    .io_idu2EXU_bits_srcBALU(exu_io_idu2EXU_bits_srcBALU),
    .io_idu2EXU_bits_ctrALU(exu_io_idu2EXU_bits_ctrALU),
    .io_idu2EXU_bits_branch(exu_io_idu2EXU_bits_branch),
    .io_idu2EXU_bits_toReg(exu_io_idu2EXU_bits_toReg),
    .io_idu2EXU_bits_memWR(exu_io_idu2EXU_bits_memWR),
    .io_idu2EXU_bits_memValid(exu_io_idu2EXU_bits_memValid),
    .io_idu2EXU_bits_memOP(exu_io_idu2EXU_bits_memOP),
    .io_idu2EXU_bits_rs1Index(exu_io_idu2EXU_bits_rs1Index),
    .io_idu2EXU_bits_ecall(exu_io_idu2EXU_bits_ecall),
    .io_idu2EXU_bits_mret(exu_io_idu2EXU_bits_mret),
    .io_idu2EXU_bits_csrEn(exu_io_idu2EXU_bits_csrEn),
    .io_idu2EXU_bits_csrWr(exu_io_idu2EXU_bits_csrWr),
    .io_idu2EXU_bits_csrOP(exu_io_idu2EXU_bits_csrOP),
    .io_idu2EXU_bits_csrALUOP(exu_io_idu2EXU_bits_csrALUOP),
    .io_exu2WBU_ready(exu_io_exu2WBU_ready),
    .io_exu2WBU_valid(exu_io_exu2WBU_valid),
    .io_exu2WBU_bits_pc(exu_io_exu2WBU_bits_pc),
    .io_exu2WBU_bits_memData(exu_io_exu2WBU_bits_memData),
    .io_exu2WBU_bits_aluData(exu_io_exu2WBU_bits_aluData),
    .io_exu2WBU_bits_csrWData(exu_io_exu2WBU_bits_csrWData),
    .io_exu2WBU_bits_csrData(exu_io_exu2WBU_bits_csrData),
    .io_exu2WBU_bits_immData(exu_io_exu2WBU_bits_immData),
    .io_exu2WBU_bits_rs1Data(exu_io_exu2WBU_bits_rs1Data),
    .io_exu2WBU_bits_inst(exu_io_exu2WBU_bits_inst),
    .io_exu2WBU_bits_regWR(exu_io_exu2WBU_bits_regWR),
    .io_exu2WBU_bits_memWR(exu_io_exu2WBU_bits_memWR),
    .io_exu2WBU_bits_memValid(exu_io_exu2WBU_bits_memValid),
    .io_exu2WBU_bits_memOP(exu_io_exu2WBU_bits_memOP),
    .io_exu2WBU_bits_toReg(exu_io_exu2WBU_bits_toReg),
    .io_exu2WBU_bits_branchCtr(exu_io_exu2WBU_bits_branchCtr),
    .io_exu2WBU_bits_less(exu_io_exu2WBU_bits_less),
    .io_exu2WBU_bits_zero(exu_io_exu2WBU_bits_zero),
    .io_exu2WBU_bits_ecall(exu_io_exu2WBU_bits_ecall),
    .io_exu2WBU_bits_csrEn(exu_io_exu2WBU_bits_csrEn),
    .io_exu2WBU_bits_csrWr(exu_io_exu2WBU_bits_csrWr),
    .io_exu2CSR_csrData(exu_io_exu2CSR_csrData),
    .io_exu2CSR_mret(exu_io_exu2CSR_mret),
    .io_exu2CSR_ecall(exu_io_exu2CSR_ecall),
    .io_exu2CSR_csr(exu_io_exu2CSR_csr)
  );
  WBU wbu ( // @[src/main/scala/Main.scala 34:49]
    .clock(wbu_clock),
    .reset(wbu_reset),
    .io_exu2WBU_ready(wbu_io_exu2WBU_ready),
    .io_exu2WBU_valid(wbu_io_exu2WBU_valid),
    .io_exu2WBU_bits_pc(wbu_io_exu2WBU_bits_pc),
    .io_exu2WBU_bits_memData(wbu_io_exu2WBU_bits_memData),
    .io_exu2WBU_bits_aluData(wbu_io_exu2WBU_bits_aluData),
    .io_exu2WBU_bits_csrWData(wbu_io_exu2WBU_bits_csrWData),
    .io_exu2WBU_bits_csrData(wbu_io_exu2WBU_bits_csrData),
    .io_exu2WBU_bits_immData(wbu_io_exu2WBU_bits_immData),
    .io_exu2WBU_bits_rs1Data(wbu_io_exu2WBU_bits_rs1Data),
    .io_exu2WBU_bits_inst(wbu_io_exu2WBU_bits_inst),
    .io_exu2WBU_bits_regWR(wbu_io_exu2WBU_bits_regWR),
    .io_exu2WBU_bits_memWR(wbu_io_exu2WBU_bits_memWR),
    .io_exu2WBU_bits_memValid(wbu_io_exu2WBU_bits_memValid),
    .io_exu2WBU_bits_memOP(wbu_io_exu2WBU_bits_memOP),
    .io_exu2WBU_bits_toReg(wbu_io_exu2WBU_bits_toReg),
    .io_exu2WBU_bits_branchCtr(wbu_io_exu2WBU_bits_branchCtr),
    .io_exu2WBU_bits_less(wbu_io_exu2WBU_bits_less),
    .io_exu2WBU_bits_zero(wbu_io_exu2WBU_bits_zero),
    .io_exu2WBU_bits_ecall(wbu_io_exu2WBU_bits_ecall),
    .io_exu2WBU_bits_csrEn(wbu_io_exu2WBU_bits_csrEn),
    .io_exu2WBU_bits_csrWr(wbu_io_exu2WBU_bits_csrWr),
    .io_wbu2CSR_pc(wbu_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(wbu_io_wbu2CSR_csrWData),
    .io_wbu2CSR_csr(wbu_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(wbu_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(wbu_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(wbu_io_wbu2CSR_csrWr),
    .io_wbu2BaseReg_rdIndex(wbu_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(wbu_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(wbu_io_wbu2BaseReg_regWR),
    .io_wbu2Mem_awready(wbu_io_wbu2Mem_awready),
    .io_wbu2Mem_awvalid(wbu_io_wbu2Mem_awvalid),
    .io_wbu2Mem_awaddr(wbu_io_wbu2Mem_awaddr),
    .io_wbu2Mem_awsize(wbu_io_wbu2Mem_awsize),
    .io_wbu2Mem_wready(wbu_io_wbu2Mem_wready),
    .io_wbu2Mem_wvalid(wbu_io_wbu2Mem_wvalid),
    .io_wbu2Mem_wdata(wbu_io_wbu2Mem_wdata),
    .io_wbu2Mem_wstrb(wbu_io_wbu2Mem_wstrb),
    .io_wbu2Mem_wlast(wbu_io_wbu2Mem_wlast),
    .io_wbu2Mem_bready(wbu_io_wbu2Mem_bready),
    .io_wbu2Mem_bvalid(wbu_io_wbu2Mem_bvalid),
    .io_wbu2Mem_arready(wbu_io_wbu2Mem_arready),
    .io_wbu2Mem_arvalid(wbu_io_wbu2Mem_arvalid),
    .io_wbu2Mem_araddr(wbu_io_wbu2Mem_araddr),
    .io_wbu2Mem_arsize(wbu_io_wbu2Mem_arsize),
    .io_wbu2Mem_rready(wbu_io_wbu2Mem_rready),
    .io_wbu2Mem_rvalid(wbu_io_wbu2Mem_rvalid),
    .io_wbu2Mem_rdata(wbu_io_wbu2Mem_rdata),
    .io_wbu2PC_ready(wbu_io_wbu2PC_ready),
    .io_wbu2PC_valid(wbu_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(wbu_io_wbu2PC_bits_nextPC)
  );
  XbarAXI xbarAXI ( // @[src/main/scala/Main.scala 35:49]
    .clock(xbarAXI_clock),
    .reset(xbarAXI_reset),
    .io_axiSlaveIFU_bready(xbarAXI_io_axiSlaveIFU_bready),
    .io_axiSlaveIFU_bvalid(xbarAXI_io_axiSlaveIFU_bvalid),
    .io_axiSlaveIFU_arready(xbarAXI_io_axiSlaveIFU_arready),
    .io_axiSlaveIFU_arvalid(xbarAXI_io_axiSlaveIFU_arvalid),
    .io_axiSlaveIFU_araddr(xbarAXI_io_axiSlaveIFU_araddr),
    .io_axiSlaveIFU_rready(xbarAXI_io_axiSlaveIFU_rready),
    .io_axiSlaveIFU_rvalid(xbarAXI_io_axiSlaveIFU_rvalid),
    .io_axiSlaveIFU_rdata(xbarAXI_io_axiSlaveIFU_rdata),
    .io_axiSlaveWBU_awready(xbarAXI_io_axiSlaveWBU_awready),
    .io_axiSlaveWBU_awvalid(xbarAXI_io_axiSlaveWBU_awvalid),
    .io_axiSlaveWBU_awaddr(xbarAXI_io_axiSlaveWBU_awaddr),
    .io_axiSlaveWBU_awsize(xbarAXI_io_axiSlaveWBU_awsize),
    .io_axiSlaveWBU_wready(xbarAXI_io_axiSlaveWBU_wready),
    .io_axiSlaveWBU_wvalid(xbarAXI_io_axiSlaveWBU_wvalid),
    .io_axiSlaveWBU_wdata(xbarAXI_io_axiSlaveWBU_wdata),
    .io_axiSlaveWBU_wstrb(xbarAXI_io_axiSlaveWBU_wstrb),
    .io_axiSlaveWBU_wlast(xbarAXI_io_axiSlaveWBU_wlast),
    .io_axiSlaveWBU_bready(xbarAXI_io_axiSlaveWBU_bready),
    .io_axiSlaveWBU_bvalid(xbarAXI_io_axiSlaveWBU_bvalid),
    .io_axiSlaveWBU_arready(xbarAXI_io_axiSlaveWBU_arready),
    .io_axiSlaveWBU_arvalid(xbarAXI_io_axiSlaveWBU_arvalid),
    .io_axiSlaveWBU_araddr(xbarAXI_io_axiSlaveWBU_araddr),
    .io_axiSlaveWBU_arsize(xbarAXI_io_axiSlaveWBU_arsize),
    .io_axiSlaveWBU_rready(xbarAXI_io_axiSlaveWBU_rready),
    .io_axiSlaveWBU_rvalid(xbarAXI_io_axiSlaveWBU_rvalid),
    .io_axiSlaveWBU_rdata(xbarAXI_io_axiSlaveWBU_rdata),
    .io_axiMasterDevice_awready(xbarAXI_io_axiMasterDevice_awready),
    .io_axiMasterDevice_awvalid(xbarAXI_io_axiMasterDevice_awvalid),
    .io_axiMasterDevice_awaddr(xbarAXI_io_axiMasterDevice_awaddr),
    .io_axiMasterDevice_awsize(xbarAXI_io_axiMasterDevice_awsize),
    .io_axiMasterDevice_wready(xbarAXI_io_axiMasterDevice_wready),
    .io_axiMasterDevice_wvalid(xbarAXI_io_axiMasterDevice_wvalid),
    .io_axiMasterDevice_wdata(xbarAXI_io_axiMasterDevice_wdata),
    .io_axiMasterDevice_wstrb(xbarAXI_io_axiMasterDevice_wstrb),
    .io_axiMasterDevice_wlast(xbarAXI_io_axiMasterDevice_wlast),
    .io_axiMasterDevice_bready(xbarAXI_io_axiMasterDevice_bready),
    .io_axiMasterDevice_bvalid(xbarAXI_io_axiMasterDevice_bvalid),
    .io_axiMasterDevice_arready(xbarAXI_io_axiMasterDevice_arready),
    .io_axiMasterDevice_arvalid(xbarAXI_io_axiMasterDevice_arvalid),
    .io_axiMasterDevice_araddr(xbarAXI_io_axiMasterDevice_araddr),
    .io_axiMasterDevice_arsize(xbarAXI_io_axiMasterDevice_arsize),
    .io_axiMasterDevice_rready(xbarAXI_io_axiMasterDevice_rready),
    .io_axiMasterDevice_rvalid(xbarAXI_io_axiMasterDevice_rvalid),
    .io_axiMasterDevice_rdata(xbarAXI_io_axiMasterDevice_rdata),
    .io_axiLiteClint_arAddr(xbarAXI_io_axiLiteClint_arAddr),
    .io_axiLiteClint_arValid(xbarAXI_io_axiLiteClint_arValid),
    .io_axiLiteClint_arReady(xbarAXI_io_axiLiteClint_arReady),
    .io_axiLiteClint_rData(xbarAXI_io_axiLiteClint_rData),
    .io_axiLiteClint_rValid(xbarAXI_io_axiLiteClint_rValid),
    .io_axiLiteClint_rReady(xbarAXI_io_axiLiteClint_rReady),
    .io_axiLiteClint_awValid(xbarAXI_io_axiLiteClint_awValid),
    .io_axiLiteClint_awReady(xbarAXI_io_axiLiteClint_awReady),
    .io_axiLiteClint_wValid(xbarAXI_io_axiLiteClint_wValid),
    .io_axiLiteClint_wReady(xbarAXI_io_axiLiteClint_wReady),
    .io_axiLiteClint_bValid(xbarAXI_io_axiLiteClint_bValid),
    .io_axiLiteClint_bReady(xbarAXI_io_axiLiteClint_bReady)
  );
  AXILiteClint axiLiteClint ( // @[src/main/scala/Main.scala 66:34]
    .clock(axiLiteClint_clock),
    .reset(axiLiteClint_reset),
    .io_axiLiteMaster_arAddr(axiLiteClint_io_axiLiteMaster_arAddr),
    .io_axiLiteMaster_arValid(axiLiteClint_io_axiLiteMaster_arValid),
    .io_axiLiteMaster_arReady(axiLiteClint_io_axiLiteMaster_arReady),
    .io_axiLiteMaster_rData(axiLiteClint_io_axiLiteMaster_rData),
    .io_axiLiteMaster_rValid(axiLiteClint_io_axiLiteMaster_rValid),
    .io_axiLiteMaster_rReady(axiLiteClint_io_axiLiteMaster_rReady),
    .io_axiLiteMaster_awValid(axiLiteClint_io_axiLiteMaster_awValid),
    .io_axiLiteMaster_awReady(axiLiteClint_io_axiLiteMaster_awReady),
    .io_axiLiteMaster_wValid(axiLiteClint_io_axiLiteMaster_wValid),
    .io_axiLiteMaster_wReady(axiLiteClint_io_axiLiteMaster_wReady),
    .io_axiLiteMaster_bValid(axiLiteClint_io_axiLiteMaster_bValid),
    .io_axiLiteMaster_bReady(axiLiteClint_io_axiLiteMaster_bReady)
  );
  assign io_master_awvalid = xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awaddr = xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awid = 4'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awlen = 8'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awsize = xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awburst = 2'h1; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wvalid = xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wdata = xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wstrb = xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wlast = xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 63:41]
  assign io_master_bready = xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arvalid = xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_araddr = xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arid = 4'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arlen = 8'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arsize = xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arburst = 2'h1; // @[src/main/scala/Main.scala 63:41]
  assign io_master_rready = xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 63:41]
  assign io_slave_awready = 1'h0; // @[src/main/scala/basemode/Interface.scala 193:21]
  assign io_slave_wready = 1'h0; // @[src/main/scala/basemode/Interface.scala 195:20]
  assign io_slave_bvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 197:20]
  assign io_slave_bresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 198:19]
  assign io_slave_bid = 4'h0; // @[src/main/scala/basemode/Interface.scala 199:17]
  assign io_slave_arready = 1'h0; // @[src/main/scala/basemode/Interface.scala 201:21]
  assign io_slave_rvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 203:20]
  assign io_slave_rresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 204:19]
  assign io_slave_rdata = 32'h0; // @[src/main/scala/basemode/Interface.scala 205:19]
  assign io_slave_rlast = 1'h0; // @[src/main/scala/basemode/Interface.scala 206:19]
  assign io_slave_rid = 4'h0; // @[src/main/scala/basemode/Interface.scala 207:17]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_wbu2PC_valid = wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 38:25]
  assign pc_io_wbu2PC_bits_nextPC = wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 38:25]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_pc = pc_io_pc; // @[src/main/scala/Main.scala 43:33]
  assign ifu_io_ifu2Mem_bvalid = xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_arready = xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_rvalid = xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_rdata = xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 46:24]
  assign riscv32BaseReg_clock = clock;
  assign riscv32BaseReg_reset = reset;
  assign riscv32BaseReg_io_idu2BaseReg_rs1Index = idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 50:33]
  assign riscv32BaseReg_io_idu2BaseReg_rs2Index = idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 50:33]
  assign riscv32BaseReg_io_wbu2BaseReg_rdIndex = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 58:41]
  assign riscv32BaseReg_io_wbu2BaseReg_data = wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 58:41]
  assign riscv32BaseReg_io_wbu2BaseReg_regWR = wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 58:41]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_exu2CSR_mret = exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_exu2CSR_ecall = exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_exu2CSR_csr = exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_wbu2CSR_pc = wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrWData = wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csr = wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_ecall = wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrEn = wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrWr = wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 57:41]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_inst_valid = ifu_io_inst_valid; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_inst_bits_inst = ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_inst_bits_pc = ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_idu2EXU_ready = exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 49:33]
  assign idu_io_idu2BaseReg_rs1Data = riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 50:33]
  assign idu_io_idu2BaseReg_rs2Data = riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 50:33]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_idu2EXU_valid = idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_pc = idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs1Data = idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs2Data = idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_imm = idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_inst = idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_regWR = idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_srcAALU = idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_srcBALU = idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_ctrALU = idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_branch = idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_toReg = idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memWR = idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memValid = idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memOP = idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs1Index = idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_ecall = idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_mret = idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrEn = idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrWr = idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrOP = idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrALUOP = idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_exu2WBU_ready = wbu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 53:25]
  assign exu_io_exu2CSR_csrData = csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 54:25]
  assign wbu_clock = clock;
  assign wbu_reset = reset;
  assign wbu_io_exu2WBU_valid = exu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_pc = exu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memData = exu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_aluData = exu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrWData = exu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrData = exu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_immData = exu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_rs1Data = exu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_inst = exu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_regWR = exu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memWR = exu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memValid = exu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memOP = exu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_toReg = exu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_branchCtr = exu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_less = exu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_zero = exu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_ecall = exu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrEn = exu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrWr = exu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_wbu2Mem_awready = xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_wready = xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_bvalid = xbarAXI_io_axiSlaveWBU_bvalid; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_arready = xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_rvalid = xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_rdata = xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2PC_ready = pc_io_wbu2PC_ready; // @[src/main/scala/Main.scala 38:25]
  assign xbarAXI_clock = clock;
  assign xbarAXI_reset = reset;
  assign xbarAXI_io_axiSlaveIFU_bready = ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_arvalid = ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_araddr = ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_rready = ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveWBU_awvalid = wbu_io_wbu2Mem_awvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_awaddr = wbu_io_wbu2Mem_awaddr; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_awsize = wbu_io_wbu2Mem_awsize; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wvalid = wbu_io_wbu2Mem_wvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wdata = wbu_io_wbu2Mem_wdata; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wstrb = wbu_io_wbu2Mem_wstrb; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wlast = wbu_io_wbu2Mem_wlast; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_bready = wbu_io_wbu2Mem_bready; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_arvalid = wbu_io_wbu2Mem_arvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_araddr = wbu_io_wbu2Mem_araddr; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_arsize = wbu_io_wbu2Mem_arsize; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_rready = wbu_io_wbu2Mem_rready; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiMasterDevice_awready = io_master_awready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_wready = io_master_wready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_bvalid = io_master_bvalid; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_arready = io_master_arready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_rvalid = io_master_rvalid; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_rdata = io_master_rdata; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiLiteClint_arReady = axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_rData = axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_rValid = axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_awReady = axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_wReady = axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_bValid = axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_clock = clock;
  assign axiLiteClint_reset = reset;
  assign axiLiteClint_io_axiLiteMaster_arAddr = xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_arValid = xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_rReady = xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_awValid = xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_wValid = xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_bReady = xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 67:41]
endmodule
