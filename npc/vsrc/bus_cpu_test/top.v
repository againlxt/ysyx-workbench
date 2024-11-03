module PC(
  input         clock,
  input         reset,
  input  [31:0] io_npcState,
  output        io_wbu2PC_ready,
  input         io_wbu2PC_valid,
  input  [31:0] io_wbu2PC_bits_nextPC,
  output [31:0] io_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[PC.scala 16:28]
  reg  wbu2PCReadyReg; // @[PC.scala 17:37]
  wire  _T_1 = io_npcState == 32'h0; // @[PC.scala 18:27]
  wire  _pcReg_T_4 = io_npcState != 32'h0; // @[PC.scala 29:38]
  assign io_wbu2PC_ready = wbu2PCReadyReg; // @[PC.scala 23:25]
  assign io_pc = pcReg; // @[PC.scala 34:15]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 16:28]
      pcReg <= 32'h80000000; // @[PC.scala 16:28]
    end else if (io_wbu2PC_ready & io_wbu2PC_valid) begin // @[PC.scala 26:51]
      if (_T_1) begin // @[Mux.scala 101:16]
        pcReg <= io_wbu2PC_bits_nextPC;
      end else if (!(_pcReg_T_4)) begin // @[Mux.scala 101:16]
        pcReg <= 32'h80000000;
      end
    end
    wbu2PCReadyReg <= reset | _T_1; // @[PC.scala 17:{37,37}]
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
  input  [31:0] io_pc,
  output        io_inst_valid,
  output [31:0] io_inst_bits_inst,
  output [31:0] io_inst_bits_pc,
  output        io_ifu2Mem_aclk,
  output        io_ifu2Mem_aresetn,
  output [31:0] io_ifu2Mem_arAddr,
  output        io_ifu2Mem_arValid,
  input         io_ifu2Mem_arReady,
  input  [31:0] io_ifu2Mem_rData,
  input         io_ifu2Mem_rValid,
  output        io_ifu2Mem_rReady
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  resetnWire = ~reset; // @[IFU.scala 19:35]
  reg [31:0] arAddrReg; // @[IFU.scala 31:42]
  reg  arValidReg; // @[IFU.scala 33:42]
  reg  rReadyReg; // @[IFU.scala 35:42]
  wire  _T_1 = ~resetnWire; // @[IFU.scala 65:14]
  wire  _GEN_0 = io_ifu2Mem_arReady ? 1'h0 : arValidReg; // @[IFU.scala 69:41 70:28 33:42]
  wire  _GEN_1 = arAddrReg != io_pc | _GEN_0; // @[IFU.scala 67:42 68:28]
  wire  _GEN_2 = ~resetnWire | _GEN_1; // @[IFU.scala 65:34 66:28]
  wire  _GEN_3 = io_ifu2Mem_rValid | rReadyReg; // @[IFU.scala 76:40 77:27 35:42]
  wire  _GEN_4 = io_ifu2Mem_rValid & rReadyReg ? 1'h0 : _GEN_3; // @[IFU.scala 74:60 75:27]
  wire  _GEN_5 = _T_1 | _GEN_4; // @[IFU.scala 72:34 73:27]
  assign io_inst_valid = io_ifu2Mem_rValid & rReadyReg; // @[IFU.scala 80:54]
  assign io_inst_bits_inst = io_ifu2Mem_rData; // @[IFU.scala 81:33]
  assign io_inst_bits_pc = arAddrReg; // @[IFU.scala 82:33]
  assign io_ifu2Mem_aclk = clock; // @[IFU.scala 18:46]
  assign io_ifu2Mem_aresetn = ~reset; // @[IFU.scala 19:35]
  assign io_ifu2Mem_arAddr = arAddrReg; // @[IFU.scala 42:33]
  assign io_ifu2Mem_arValid = arValidReg; // @[IFU.scala 43:33]
  assign io_ifu2Mem_rReady = rReadyReg; // @[IFU.scala 49:33]
  always @(posedge clock) begin
    if (reset) begin // @[IFU.scala 31:42]
      arAddrReg <= 32'h80000000; // @[IFU.scala 31:42]
    end else begin
      arAddrReg <= io_pc; // @[IFU.scala 32:41]
    end
    arValidReg <= reset | _GEN_2; // @[IFU.scala 33:{42,42}]
    rReadyReg <= reset | _GEN_5; // @[IFU.scala 35:{42,42}]
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
  arAddrReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  arValidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rReadyReg = _RAND_2[0:0];
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
  output [31:0] io_idu2BaseReg_rs1Data,
  output [31:0] io_idu2BaseReg_rs2Data,
  input  [3:0]  io_idu2BaseReg_rs1Index,
  input  [3:0]  io_idu2BaseReg_rs2Index,
  input  [3:0]  io_wbu2BaseReg_rdIndex,
  input  [31:0] io_wbu2BaseReg_data,
  input         io_wbu2BaseReg_regWR
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
  reg [31:0] riscv32BaseReg_0; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_1; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_2; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_3; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_4; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_5; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_6; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_7; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_8; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_9; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_10; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_11; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_12; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_13; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_14; // @[Riscv32BaseReg.scala 14:42]
  reg [31:0] riscv32BaseReg_15; // @[Riscv32BaseReg.scala 14:42]
  wire [31:0] _GEN_49 = 4'h1 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_50 = 4'h2 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_2 : _GEN_49; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_51 = 4'h3 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_3 : _GEN_50; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_52 = 4'h4 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_4 : _GEN_51; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_53 = 4'h5 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_5 : _GEN_52; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_54 = 4'h6 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_6 : _GEN_53; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_55 = 4'h7 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_7 : _GEN_54; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_56 = 4'h8 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_8 : _GEN_55; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_57 = 4'h9 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_9 : _GEN_56; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_58 = 4'ha == io_idu2BaseReg_rs1Index ? riscv32BaseReg_10 : _GEN_57; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_59 = 4'hb == io_idu2BaseReg_rs1Index ? riscv32BaseReg_11 : _GEN_58; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_60 = 4'hc == io_idu2BaseReg_rs1Index ? riscv32BaseReg_12 : _GEN_59; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_61 = 4'hd == io_idu2BaseReg_rs1Index ? riscv32BaseReg_13 : _GEN_60; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_62 = 4'he == io_idu2BaseReg_rs1Index ? riscv32BaseReg_14 : _GEN_61; // @[Riscv32BaseReg.scala 24:{33,33}]
  wire [31:0] _GEN_65 = 4'h1 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_66 = 4'h2 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_2 : _GEN_65; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_67 = 4'h3 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_3 : _GEN_66; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_68 = 4'h4 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_4 : _GEN_67; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_69 = 4'h5 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_5 : _GEN_68; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_70 = 4'h6 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_6 : _GEN_69; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_71 = 4'h7 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_7 : _GEN_70; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_72 = 4'h8 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_8 : _GEN_71; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_73 = 4'h9 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_9 : _GEN_72; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_74 = 4'ha == io_idu2BaseReg_rs2Index ? riscv32BaseReg_10 : _GEN_73; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_75 = 4'hb == io_idu2BaseReg_rs2Index ? riscv32BaseReg_11 : _GEN_74; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_76 = 4'hc == io_idu2BaseReg_rs2Index ? riscv32BaseReg_12 : _GEN_75; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_77 = 4'hd == io_idu2BaseReg_rs2Index ? riscv32BaseReg_13 : _GEN_76; // @[Riscv32BaseReg.scala 25:{33,33}]
  wire [31:0] _GEN_78 = 4'he == io_idu2BaseReg_rs2Index ? riscv32BaseReg_14 : _GEN_77; // @[Riscv32BaseReg.scala 25:{33,33}]
  assign io_idu2BaseReg_rs1Data = 4'hf == io_idu2BaseReg_rs1Index ? riscv32BaseReg_15 : _GEN_62; // @[Riscv32BaseReg.scala 24:{33,33}]
  assign io_idu2BaseReg_rs2Data = 4'hf == io_idu2BaseReg_rs2Index ? riscv32BaseReg_15 : _GEN_78; // @[Riscv32BaseReg.scala 25:{33,33}]
  always @(posedge clock) begin
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_0 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h0 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_0 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end else begin
        riscv32BaseReg_0 <= 32'h0; // @[Riscv32BaseReg.scala 20:45]
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_1 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h1 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_1 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_2 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h2 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_2 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_3 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h3 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_3 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_4 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h4 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_4 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_5 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h5 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_5 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_6 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h6 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_6 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_7 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h7 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_7 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_8 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h8 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_8 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_9 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'h9 == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_9 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_10 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'ha == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_10 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_11 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'hb == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_11 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_12 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'hc == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_12 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_13 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'hd == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_13 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_14 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'he == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_14 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
        end
      end
    end
    if (reset) begin // @[Riscv32BaseReg.scala 14:42]
      riscv32BaseReg_15 <= 32'h0; // @[Riscv32BaseReg.scala 14:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[Riscv32BaseReg.scala 16:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[Riscv32BaseReg.scala 17:54]
        if (4'hf == io_wbu2BaseReg_rdIndex) begin // @[Riscv32BaseReg.scala 18:65]
          riscv32BaseReg_15 <= io_wbu2BaseReg_data; // @[Riscv32BaseReg.scala 18:65]
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
  output [31:0] io_exu2CSR_csrData,
  input         io_exu2CSR_mret,
  input         io_exu2CSR_ecall,
  input  [11:0] io_exu2CSR_csr,
  input  [31:0] io_wbu2CSR_pc,
  input  [31:0] io_wbu2CSR_csrWData,
  input  [11:0] io_wbu2CSR_csr,
  input         io_wbu2CSR_ecall,
  input         io_wbu2CSR_csrEn,
  input         io_wbu2CSR_csrWr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mepcReg; // @[CSR.scala 15:30]
  reg [31:0] mstatusReg; // @[CSR.scala 16:30]
  reg [31:0] mcauseReg; // @[CSR.scala 17:30]
  reg [31:0] mtvecReg; // @[CSR.scala 18:30]
  wire [31:0] _GEN_0 = io_wbu2CSR_csr == 12'h305 ? io_wbu2CSR_csrWData : mtvecReg; // @[CSR.scala 27:53 28:29 18:30]
  wire [31:0] _GEN_1 = io_wbu2CSR_csr == 12'h341 ? io_wbu2CSR_csrWData : mepcReg; // @[CSR.scala 25:53 26:29 15:30]
  wire [31:0] _GEN_2 = io_wbu2CSR_csr == 12'h341 ? mtvecReg : _GEN_0; // @[CSR.scala 18:30 25:53]
  wire [31:0] _GEN_3 = io_wbu2CSR_csr == 12'h342 ? io_wbu2CSR_csrWData : mcauseReg; // @[CSR.scala 23:53 24:29 17:30]
  wire [31:0] _GEN_4 = io_wbu2CSR_csr == 12'h342 ? mepcReg : _GEN_1; // @[CSR.scala 15:30 23:53]
  wire [31:0] _GEN_5 = io_wbu2CSR_csr == 12'h342 ? mtvecReg : _GEN_2; // @[CSR.scala 18:30 23:53]
  wire  _io_exu2CSR_csrData_T = io_exu2CSR_csr == 12'h300; // @[CSR.scala 37:25]
  wire  _io_exu2CSR_csrData_T_2 = io_exu2CSR_csr == 12'h342; // @[CSR.scala 38:33]
  wire  _io_exu2CSR_csrData_T_4 = io_exu2CSR_csr == 12'h341; // @[CSR.scala 39:33]
  wire  _io_exu2CSR_csrData_T_6 = io_exu2CSR_csr == 12'h305; // @[CSR.scala 40:33]
  wire [31:0] _io_exu2CSR_csrData_T_10 = io_exu2CSR_mret ? mepcReg : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_exu2CSR_csrData_T_11 = io_exu2CSR_ecall ? mtvecReg : _io_exu2CSR_csrData_T_10; // @[Mux.scala 101:16]
  wire [31:0] _io_exu2CSR_csrData_T_12 = _io_exu2CSR_csrData_T_6 ? mtvecReg : _io_exu2CSR_csrData_T_11; // @[Mux.scala 101:16]
  wire [31:0] _io_exu2CSR_csrData_T_13 = _io_exu2CSR_csrData_T_4 ? mepcReg : _io_exu2CSR_csrData_T_12; // @[Mux.scala 101:16]
  wire [31:0] _io_exu2CSR_csrData_T_14 = _io_exu2CSR_csrData_T_2 ? mcauseReg : _io_exu2CSR_csrData_T_13; // @[Mux.scala 101:16]
  assign io_exu2CSR_csrData = _io_exu2CSR_csrData_T ? mstatusReg : _io_exu2CSR_csrData_T_14; // @[Mux.scala 101:16]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 15:30]
      mepcReg <= 32'h0; // @[CSR.scala 15:30]
    end else if (io_wbu2CSR_csrEn) begin // @[CSR.scala 19:35]
      if (io_wbu2CSR_csrWr) begin // @[CSR.scala 20:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[CSR.scala 21:47]
          mepcReg <= _GEN_4;
        end
      end else if (io_wbu2CSR_ecall) begin // @[CSR.scala 30:46]
        mepcReg <= io_wbu2CSR_pc; // @[CSR.scala 31:25]
      end
    end
    if (reset) begin // @[CSR.scala 16:30]
      mstatusReg <= 32'h1800; // @[CSR.scala 16:30]
    end else if (io_wbu2CSR_csrEn) begin // @[CSR.scala 19:35]
      if (io_wbu2CSR_csrWr) begin // @[CSR.scala 20:40]
        if (io_wbu2CSR_csr == 12'h300) begin // @[CSR.scala 21:47]
          mstatusReg <= io_wbu2CSR_csrWData; // @[CSR.scala 22:29]
        end
      end
    end
    if (reset) begin // @[CSR.scala 17:30]
      mcauseReg <= 32'h0; // @[CSR.scala 17:30]
    end else if (io_wbu2CSR_csrEn) begin // @[CSR.scala 19:35]
      if (io_wbu2CSR_csrWr) begin // @[CSR.scala 20:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[CSR.scala 21:47]
          mcauseReg <= _GEN_3;
        end
      end else if (io_wbu2CSR_ecall) begin // @[CSR.scala 30:46]
        mcauseReg <= 32'hb; // @[CSR.scala 32:25]
      end
    end
    if (reset) begin // @[CSR.scala 18:30]
      mtvecReg <= 32'h0; // @[CSR.scala 18:30]
    end else if (io_wbu2CSR_csrEn) begin // @[CSR.scala 19:35]
      if (io_wbu2CSR_csrWr) begin // @[CSR.scala 20:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[CSR.scala 21:47]
          mtvecReg <= _GEN_5;
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ContrGen(
  input  [31:0] io_cmd,
  input  [6:0]  io_opcode,
  input  [2:0]  io_func3,
  input  [6:0]  io_func7,
  output [2:0]  io_immType,
  output        io_regWR,
  output [1:0]  io_srcAALU,
  output [1:0]  io_srcBALU,
  output [3:0]  io_ctrALU,
  output [3:0]  io_branch,
  output [1:0]  io_memToReg,
  output        io_memWR,
  output        io_memValid,
  output [2:0]  io_memOP,
  output        io_ecall,
  output        io_mret,
  output        io_csrEn,
  output        io_csrWr,
  output        io_csrOP,
  output [1:0]  io_csrALUOP
);
  wire [31:0] cgDPIC_cmd; // @[ContrGen.scala 1005:28]
  wire [31:0] cgDPIC_instructionFormat; // @[ContrGen.scala 1005:28]
  wire [31:0] cgDPIC_instructionFormatJAL; // @[ContrGen.scala 1005:28]
  wire [31:0] cgDPIC_instructionFormatJALR; // @[ContrGen.scala 1005:28]
  wire [31:0] cgDPIC_instructionFormatRET; // @[ContrGen.scala 1005:28]
  wire  _instructionFormatWire_T_1 = io_cmd[19:0] == 20'h8067; // @[ContrGen.scala 40:31]
  wire  _instructionFormatWire_T_8 = io_func3 == 3'h0; // @[ContrGen.scala 41:79]
  wire  _instructionFormatWire_T_10 = io_opcode == 7'h13; // @[ContrGen.scala 41:106]
  wire  _instructionFormatWire_T_11 = io_cmd[31:15] == 17'h0 & io_cmd[11:7] == 5'h0 & io_func3 == 3'h0 & io_opcode == 7'h13
    ; // @[ContrGen.scala 41:92]
  wire  _instructionFormatWire_T_14 = io_cmd == 32'h73; // @[ContrGen.scala 42:31]
  wire  _instructionFormatWire_T_17 = io_cmd == 32'h30200073; // @[ContrGen.scala 43:31]
  wire  _instructionFormatWire_T_19 = io_func3 == 3'h3; // @[ContrGen.scala 46:28]
  wire  _instructionFormatWire_T_20 = io_opcode == 7'h73; // @[ContrGen.scala 46:54]
  wire  _instructionFormatWire_T_21 = io_func3 == 3'h3 & io_opcode == 7'h73; // @[ContrGen.scala 46:41]
  wire  _instructionFormatWire_T_23 = io_func3 == 3'h7; // @[ContrGen.scala 47:28]
  wire  _instructionFormatWire_T_25 = io_func3 == 3'h7 & _instructionFormatWire_T_20; // @[ContrGen.scala 47:41]
  wire  _instructionFormatWire_T_27 = io_func3 == 3'h2; // @[ContrGen.scala 48:28]
  wire  _instructionFormatWire_T_29 = io_func3 == 3'h2 & _instructionFormatWire_T_20; // @[ContrGen.scala 48:41]
  wire  _instructionFormatWire_T_31 = io_func3 == 3'h6; // @[ContrGen.scala 49:28]
  wire  _instructionFormatWire_T_33 = io_func3 == 3'h6 & _instructionFormatWire_T_20; // @[ContrGen.scala 49:41]
  wire  _instructionFormatWire_T_35 = io_func3 == 3'h1; // @[ContrGen.scala 50:28]
  wire  _instructionFormatWire_T_37 = io_func3 == 3'h1 & _instructionFormatWire_T_20; // @[ContrGen.scala 50:41]
  wire  _instructionFormatWire_T_39 = io_func3 == 3'h5; // @[ContrGen.scala 51:28]
  wire  _instructionFormatWire_T_41 = io_func3 == 3'h5 & _instructionFormatWire_T_20; // @[ContrGen.scala 51:41]
  wire  _instructionFormatWire_T_45 = _instructionFormatWire_T_8 & _instructionFormatWire_T_10; // @[ContrGen.scala 57:41]
  wire  _instructionFormatWire_T_49 = _instructionFormatWire_T_27 & _instructionFormatWire_T_10; // @[ContrGen.scala 58:41]
  wire  _instructionFormatWire_T_53 = _instructionFormatWire_T_19 & _instructionFormatWire_T_10; // @[ContrGen.scala 59:41]
  wire  _instructionFormatWire_T_57 = _instructionFormatWire_T_23 & _instructionFormatWire_T_10; // @[ContrGen.scala 60:41]
  wire  _instructionFormatWire_T_61 = _instructionFormatWire_T_31 & _instructionFormatWire_T_10; // @[ContrGen.scala 61:41]
  wire  _instructionFormatWire_T_63 = io_func3 == 3'h4; // @[ContrGen.scala 62:28]
  wire  _instructionFormatWire_T_65 = io_func3 == 3'h4 & _instructionFormatWire_T_10; // @[ContrGen.scala 62:41]
  wire  _instructionFormatWire_T_68 = io_cmd[31:26] == 6'h0; // @[ContrGen.scala 63:33]
  wire  _instructionFormatWire_T_72 = io_cmd[31:26] == 6'h0 & _instructionFormatWire_T_35 & _instructionFormatWire_T_10; // @[ContrGen.scala 63:74]
  wire  _instructionFormatWire_T_79 = _instructionFormatWire_T_68 & _instructionFormatWire_T_39 &
    _instructionFormatWire_T_10; // @[ContrGen.scala 64:74]
  wire  _instructionFormatWire_T_86 = io_cmd[31:26] == 6'h10 & _instructionFormatWire_T_39 & _instructionFormatWire_T_10
    ; // @[ContrGen.scala 65:74]
  wire  _instructionFormatWire_T_88 = io_opcode == 7'h37; // @[ContrGen.scala 66:29]
  wire  _instructionFormatWire_T_90 = io_opcode == 7'h17; // @[ContrGen.scala 67:29]
  wire  _instructionFormatWire_T_92 = io_func7 == 7'h0; // @[ContrGen.scala 69:28]
  wire  _instructionFormatWire_T_95 = io_opcode == 7'h33; // @[ContrGen.scala 69:85]
  wire  _instructionFormatWire_T_96 = io_func7 == 7'h0 & _instructionFormatWire_T_8 & io_opcode == 7'h33; // @[ContrGen.scala 69:71]
  wire  _instructionFormatWire_T_102 = _instructionFormatWire_T_92 & _instructionFormatWire_T_27 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 70:71]
  wire  _instructionFormatWire_T_108 = _instructionFormatWire_T_92 & _instructionFormatWire_T_19 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 71:71]
  wire  _instructionFormatWire_T_114 = _instructionFormatWire_T_92 & _instructionFormatWire_T_23 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 72:71]
  wire  _instructionFormatWire_T_120 = _instructionFormatWire_T_92 & _instructionFormatWire_T_31 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 73:71]
  wire  _instructionFormatWire_T_126 = _instructionFormatWire_T_92 & _instructionFormatWire_T_63 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 74:71]
  wire  _instructionFormatWire_T_132 = _instructionFormatWire_T_92 & _instructionFormatWire_T_35 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 75:71]
  wire  _instructionFormatWire_T_138 = _instructionFormatWire_T_92 & _instructionFormatWire_T_39 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 76:71]
  wire  _instructionFormatWire_T_140 = io_func7 == 7'h20; // @[ContrGen.scala 77:28]
  wire  _instructionFormatWire_T_144 = io_func7 == 7'h20 & _instructionFormatWire_T_8 & _instructionFormatWire_T_95; // @[ContrGen.scala 77:71]
  wire  _instructionFormatWire_T_150 = _instructionFormatWire_T_140 & _instructionFormatWire_T_39 &
    _instructionFormatWire_T_95; // @[ContrGen.scala 78:71]
  wire  _instructionFormatWire_T_152 = io_opcode == 7'h6f; // @[ContrGen.scala 82:29]
  wire  _instructionFormatWire_T_156 = _instructionFormatWire_T_8 & io_opcode == 7'h67; // @[ContrGen.scala 83:41]
  wire  _instructionFormatWire_T_159 = io_opcode == 7'h63; // @[ContrGen.scala 85:54]
  wire  _instructionFormatWire_T_160 = _instructionFormatWire_T_8 & io_opcode == 7'h63; // @[ContrGen.scala 85:41]
  wire  _instructionFormatWire_T_164 = _instructionFormatWire_T_35 & _instructionFormatWire_T_159; // @[ContrGen.scala 86:41]
  wire  _instructionFormatWire_T_168 = _instructionFormatWire_T_63 & _instructionFormatWire_T_159; // @[ContrGen.scala 87:41]
  wire  _instructionFormatWire_T_172 = _instructionFormatWire_T_31 & _instructionFormatWire_T_159; // @[ContrGen.scala 88:41]
  wire  _instructionFormatWire_T_176 = _instructionFormatWire_T_39 & _instructionFormatWire_T_159; // @[ContrGen.scala 89:41]
  wire  _instructionFormatWire_T_180 = _instructionFormatWire_T_23 & _instructionFormatWire_T_159; // @[ContrGen.scala 90:41]
  wire  _instructionFormatWire_T_183 = io_opcode == 7'h3; // @[ContrGen.scala 93:55]
  wire  _instructionFormatWire_T_184 = _instructionFormatWire_T_27 & io_opcode == 7'h3; // @[ContrGen.scala 93:41]
  wire  _instructionFormatWire_T_188 = _instructionFormatWire_T_35 & _instructionFormatWire_T_183; // @[ContrGen.scala 94:41]
  wire  _instructionFormatWire_T_192 = _instructionFormatWire_T_39 & _instructionFormatWire_T_183; // @[ContrGen.scala 95:41]
  wire  _instructionFormatWire_T_196 = _instructionFormatWire_T_8 & _instructionFormatWire_T_183; // @[ContrGen.scala 96:41]
  wire  _instructionFormatWire_T_200 = _instructionFormatWire_T_63 & _instructionFormatWire_T_183; // @[ContrGen.scala 97:41]
  wire  _instructionFormatWire_T_203 = io_opcode == 7'h23; // @[ContrGen.scala 99:54]
  wire  _instructionFormatWire_T_204 = _instructionFormatWire_T_27 & io_opcode == 7'h23; // @[ContrGen.scala 99:41]
  wire  _instructionFormatWire_T_208 = _instructionFormatWire_T_35 & _instructionFormatWire_T_203; // @[ContrGen.scala 100:41]
  wire  _instructionFormatWire_T_212 = _instructionFormatWire_T_8 & _instructionFormatWire_T_203; // @[ContrGen.scala 101:41]
  wire [5:0] _instructionFormatWire_T_214 = _instructionFormatWire_T_212 ? 6'h10 : 6'h31; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_215 = _instructionFormatWire_T_208 ? 6'h11 : _instructionFormatWire_T_214; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_216 = _instructionFormatWire_T_204 ? 6'h12 : _instructionFormatWire_T_215; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_217 = _instructionFormatWire_T_200 ? 6'he : _instructionFormatWire_T_216; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_218 = _instructionFormatWire_T_196 ? 6'hb : _instructionFormatWire_T_217; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_219 = _instructionFormatWire_T_192 ? 6'hf : _instructionFormatWire_T_218; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_220 = _instructionFormatWire_T_188 ? 6'hc : _instructionFormatWire_T_219; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_221 = _instructionFormatWire_T_184 ? 6'hd : _instructionFormatWire_T_220; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_222 = _instructionFormatWire_T_180 ? 6'ha : _instructionFormatWire_T_221; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_223 = _instructionFormatWire_T_176 ? 6'h8 : _instructionFormatWire_T_222; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_224 = _instructionFormatWire_T_172 ? 6'h9 : _instructionFormatWire_T_223; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_225 = _instructionFormatWire_T_168 ? 6'h7 : _instructionFormatWire_T_224; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_226 = _instructionFormatWire_T_164 ? 6'h6 : _instructionFormatWire_T_225; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_227 = _instructionFormatWire_T_160 ? 6'h5 : _instructionFormatWire_T_226; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_228 = _instructionFormatWire_T_156 ? 6'h4 : _instructionFormatWire_T_227; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_229 = _instructionFormatWire_T_152 ? 6'h3 : _instructionFormatWire_T_228; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_230 = _instructionFormatWire_T_150 ? 6'h23 : _instructionFormatWire_T_229; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_231 = _instructionFormatWire_T_144 ? 6'h1d : _instructionFormatWire_T_230; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_232 = _instructionFormatWire_T_138 ? 6'h22 : _instructionFormatWire_T_231; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_233 = _instructionFormatWire_T_132 ? 6'h1e : _instructionFormatWire_T_232; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_234 = _instructionFormatWire_T_126 ? 6'h21 : _instructionFormatWire_T_233; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_235 = _instructionFormatWire_T_120 ? 6'h24 : _instructionFormatWire_T_234; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_236 = _instructionFormatWire_T_114 ? 6'h25 : _instructionFormatWire_T_235; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_237 = _instructionFormatWire_T_108 ? 6'h20 : _instructionFormatWire_T_236; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_238 = _instructionFormatWire_T_102 ? 6'h1f : _instructionFormatWire_T_237; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_239 = _instructionFormatWire_T_96 ? 6'h1c : _instructionFormatWire_T_238; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_240 = _instructionFormatWire_T_90 ? 6'h2 : _instructionFormatWire_T_239; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_241 = _instructionFormatWire_T_88 ? 6'h1 : _instructionFormatWire_T_240; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_242 = _instructionFormatWire_T_86 ? 6'h1b : _instructionFormatWire_T_241; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_243 = _instructionFormatWire_T_79 ? 6'h1a : _instructionFormatWire_T_242; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_244 = _instructionFormatWire_T_72 ? 6'h19 : _instructionFormatWire_T_243; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_245 = _instructionFormatWire_T_65 ? 6'h16 : _instructionFormatWire_T_244; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_246 = _instructionFormatWire_T_61 ? 6'h17 : _instructionFormatWire_T_245; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_247 = _instructionFormatWire_T_57 ? 6'h18 : _instructionFormatWire_T_246; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_248 = _instructionFormatWire_T_53 ? 6'h15 : _instructionFormatWire_T_247; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_249 = _instructionFormatWire_T_49 ? 6'h14 : _instructionFormatWire_T_248; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_250 = _instructionFormatWire_T_45 ? 6'h13 : _instructionFormatWire_T_249; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_251 = _instructionFormatWire_T_41 ? 6'h2e : _instructionFormatWire_T_250; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_252 = _instructionFormatWire_T_37 ? 6'h2b : _instructionFormatWire_T_251; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_253 = _instructionFormatWire_T_33 ? 6'h2f : _instructionFormatWire_T_252; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_254 = _instructionFormatWire_T_29 ? 6'h2c : _instructionFormatWire_T_253; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_255 = _instructionFormatWire_T_25 ? 6'h30 : _instructionFormatWire_T_254; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_256 = _instructionFormatWire_T_21 ? 6'h2d : _instructionFormatWire_T_255; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_257 = _instructionFormatWire_T_17 ? 6'h29 : _instructionFormatWire_T_256; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_258 = _instructionFormatWire_T_14 ? 6'h28 : _instructionFormatWire_T_257; // @[Mux.scala 101:16]
  wire [5:0] _instructionFormatWire_T_259 = _instructionFormatWire_T_11 ? 6'h31 : _instructionFormatWire_T_258; // @[Mux.scala 101:16]
  wire [5:0] instructionFormatWire = _instructionFormatWire_T_1 ? 6'h0 : _instructionFormatWire_T_259; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_188 = _instructionFormatWire_T_212 ? 3'h2 : 3'h6; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_189 = _instructionFormatWire_T_208 ? 3'h2 : _instructionTypeWire_T_188; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_190 = _instructionFormatWire_T_204 ? 3'h2 : _instructionTypeWire_T_189; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_191 = _instructionFormatWire_T_200 ? 3'h1 : _instructionTypeWire_T_190; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_192 = _instructionFormatWire_T_196 ? 3'h1 : _instructionTypeWire_T_191; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_193 = _instructionFormatWire_T_192 ? 3'h1 : _instructionTypeWire_T_192; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_194 = _instructionFormatWire_T_188 ? 3'h1 : _instructionTypeWire_T_193; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_195 = _instructionFormatWire_T_184 ? 3'h1 : _instructionTypeWire_T_194; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_196 = _instructionFormatWire_T_180 ? 3'h3 : _instructionTypeWire_T_195; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_197 = _instructionFormatWire_T_176 ? 3'h3 : _instructionTypeWire_T_196; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_198 = _instructionFormatWire_T_172 ? 3'h3 : _instructionTypeWire_T_197; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_199 = _instructionFormatWire_T_168 ? 3'h3 : _instructionTypeWire_T_198; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_200 = _instructionFormatWire_T_164 ? 3'h3 : _instructionTypeWire_T_199; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_201 = _instructionFormatWire_T_160 ? 3'h3 : _instructionTypeWire_T_200; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_202 = _instructionFormatWire_T_156 ? 3'h1 : _instructionTypeWire_T_201; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_203 = _instructionFormatWire_T_152 ? 3'h5 : _instructionTypeWire_T_202; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_204 = _instructionFormatWire_T_150 ? 3'h0 : _instructionTypeWire_T_203; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_205 = _instructionFormatWire_T_144 ? 3'h0 : _instructionTypeWire_T_204; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_206 = _instructionFormatWire_T_138 ? 3'h0 : _instructionTypeWire_T_205; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_207 = _instructionFormatWire_T_132 ? 3'h0 : _instructionTypeWire_T_206; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_208 = _instructionFormatWire_T_126 ? 3'h0 : _instructionTypeWire_T_207; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_209 = _instructionFormatWire_T_120 ? 3'h0 : _instructionTypeWire_T_208; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_210 = _instructionFormatWire_T_114 ? 3'h0 : _instructionTypeWire_T_209; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_211 = _instructionFormatWire_T_108 ? 3'h0 : _instructionTypeWire_T_210; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_212 = _instructionFormatWire_T_102 ? 3'h0 : _instructionTypeWire_T_211; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_213 = _instructionFormatWire_T_96 ? 3'h0 : _instructionTypeWire_T_212; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_214 = _instructionFormatWire_T_90 ? 3'h4 : _instructionTypeWire_T_213; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_215 = _instructionFormatWire_T_88 ? 3'h4 : _instructionTypeWire_T_214; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_216 = _instructionFormatWire_T_86 ? 3'h1 : _instructionTypeWire_T_215; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_217 = _instructionFormatWire_T_79 ? 3'h1 : _instructionTypeWire_T_216; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_218 = _instructionFormatWire_T_72 ? 3'h1 : _instructionTypeWire_T_217; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_219 = _instructionFormatWire_T_65 ? 3'h1 : _instructionTypeWire_T_218; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_220 = _instructionFormatWire_T_61 ? 3'h1 : _instructionTypeWire_T_219; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_221 = _instructionFormatWire_T_57 ? 3'h1 : _instructionTypeWire_T_220; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_222 = _instructionFormatWire_T_53 ? 3'h1 : _instructionTypeWire_T_221; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_223 = _instructionFormatWire_T_49 ? 3'h1 : _instructionTypeWire_T_222; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_224 = _instructionFormatWire_T_45 ? 3'h1 : _instructionTypeWire_T_223; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_225 = _instructionFormatWire_T_41 ? 3'h1 : _instructionTypeWire_T_224; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_226 = _instructionFormatWire_T_37 ? 3'h1 : _instructionTypeWire_T_225; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_227 = _instructionFormatWire_T_33 ? 3'h1 : _instructionTypeWire_T_226; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_228 = _instructionFormatWire_T_29 ? 3'h1 : _instructionTypeWire_T_227; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_229 = _instructionFormatWire_T_25 ? 3'h1 : _instructionTypeWire_T_228; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_230 = _instructionFormatWire_T_21 ? 3'h1 : _instructionTypeWire_T_229; // @[Mux.scala 101:16]
  wire [2:0] _instructionTypeWire_T_231 = _instructionFormatWire_T_17 ? 3'h0 : _instructionTypeWire_T_230; // @[Mux.scala 101:16]
  wire  _GEN_3 = 6'h11 == instructionFormatWire | 6'h10 == instructionFormatWire; // @[ContrGen.scala 184:39 971:41]
  wire  _GEN_6 = 6'h12 == instructionFormatWire | _GEN_3; // @[ContrGen.scala 184:39 954:41]
  wire [1:0] _GEN_7 = 6'h12 == instructionFormatWire ? 2'h2 : {{1'd0}, 6'h11 == instructionFormatWire}; // @[ContrGen.scala 184:39 960:41]
  wire  _GEN_10 = 6'he == instructionFormatWire | _GEN_6; // @[ContrGen.scala 184:39 936:41]
  wire  _GEN_11 = 6'he == instructionFormatWire ? 1'h0 : _GEN_6; // @[ContrGen.scala 184:39 940:41]
  wire [2:0] _GEN_12 = 6'he == instructionFormatWire ? 3'h4 : {{1'd0}, _GEN_7}; // @[ContrGen.scala 184:39 942:41]
  wire  _GEN_13 = 6'hb == instructionFormatWire | 6'he == instructionFormatWire; // @[ContrGen.scala 184:39 917:41]
  wire  _GEN_15 = 6'hb == instructionFormatWire | _GEN_10; // @[ContrGen.scala 184:39 919:41]
  wire  _GEN_16 = 6'hb == instructionFormatWire ? 1'h0 : _GEN_11; // @[ContrGen.scala 184:39 923:41]
  wire [2:0] _GEN_17 = 6'hb == instructionFormatWire ? 3'h0 : _GEN_12; // @[ContrGen.scala 184:39 925:41]
  wire  _GEN_18 = 6'hf == instructionFormatWire | _GEN_13; // @[ContrGen.scala 184:39 900:41]
  wire  _GEN_20 = 6'hf == instructionFormatWire | _GEN_15; // @[ContrGen.scala 184:39 902:41]
  wire  _GEN_21 = 6'hf == instructionFormatWire ? 1'h0 : _GEN_16; // @[ContrGen.scala 184:39 906:41]
  wire [2:0] _GEN_22 = 6'hf == instructionFormatWire ? 3'h5 : _GEN_17; // @[ContrGen.scala 184:39 908:41]
  wire  _GEN_23 = 6'hc == instructionFormatWire | _GEN_18; // @[ContrGen.scala 184:39 883:41]
  wire  _GEN_25 = 6'hc == instructionFormatWire | _GEN_20; // @[ContrGen.scala 184:39 885:41]
  wire  _GEN_26 = 6'hc == instructionFormatWire ? 1'h0 : _GEN_21; // @[ContrGen.scala 184:39 889:41]
  wire [2:0] _GEN_27 = 6'hc == instructionFormatWire ? 3'h1 : _GEN_22; // @[ContrGen.scala 184:39 891:41]
  wire  _GEN_28 = 6'hd == instructionFormatWire | _GEN_23; // @[ContrGen.scala 184:39 866:41]
  wire  _GEN_30 = 6'hd == instructionFormatWire | _GEN_25; // @[ContrGen.scala 184:39 868:41]
  wire  _GEN_31 = 6'hd == instructionFormatWire ? 1'h0 : _GEN_26; // @[ContrGen.scala 184:39 872:41]
  wire [2:0] _GEN_32 = 6'hd == instructionFormatWire ? 3'h2 : _GEN_27; // @[ContrGen.scala 184:39 874:41]
  wire  _GEN_33 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_28; // @[ContrGen.scala 184:39 847:41]
  wire  _GEN_35 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_30; // @[ContrGen.scala 184:39 849:41]
  wire [3:0] _GEN_36 = 6'ha == instructionFormatWire ? 4'ha : 4'h0; // @[ContrGen.scala 184:39 850:41]
  wire [2:0] _GEN_37 = 6'ha == instructionFormatWire ? 3'h7 : 3'h0; // @[ContrGen.scala 184:39 851:41]
  wire  _GEN_38 = 6'ha == instructionFormatWire ? 1'h0 : _GEN_31; // @[ContrGen.scala 184:39 853:41]
  wire [2:0] _GEN_39 = 6'ha == instructionFormatWire ? 3'h0 : _GEN_32; // @[ContrGen.scala 184:39 855:41]
  wire  _GEN_40 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_33; // @[ContrGen.scala 184:39 830:41]
  wire  _GEN_42 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_35; // @[ContrGen.scala 184:39 832:41]
  wire [3:0] _GEN_43 = 6'h8 == instructionFormatWire ? 4'h2 : _GEN_36; // @[ContrGen.scala 184:39 833:41]
  wire [2:0] _GEN_44 = 6'h8 == instructionFormatWire ? 3'h7 : _GEN_37; // @[ContrGen.scala 184:39 834:41]
  wire  _GEN_45 = 6'h8 == instructionFormatWire ? 1'h0 : _GEN_38; // @[ContrGen.scala 184:39 836:41]
  wire [2:0] _GEN_46 = 6'h8 == instructionFormatWire ? 3'h0 : _GEN_39; // @[ContrGen.scala 184:39 838:41]
  wire  _GEN_47 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_40; // @[ContrGen.scala 184:39 813:41]
  wire  _GEN_49 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_42; // @[ContrGen.scala 184:39 815:41]
  wire [3:0] _GEN_50 = 6'h9 == instructionFormatWire ? 4'ha : _GEN_43; // @[ContrGen.scala 184:39 816:41]
  wire [2:0] _GEN_51 = 6'h9 == instructionFormatWire ? 3'h6 : _GEN_44; // @[ContrGen.scala 184:39 817:41]
  wire  _GEN_52 = 6'h9 == instructionFormatWire ? 1'h0 : _GEN_45; // @[ContrGen.scala 184:39 819:41]
  wire [2:0] _GEN_53 = 6'h9 == instructionFormatWire ? 3'h0 : _GEN_46; // @[ContrGen.scala 184:39 821:41]
  wire  _GEN_54 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_47; // @[ContrGen.scala 184:39 796:41]
  wire  _GEN_56 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_49; // @[ContrGen.scala 184:39 798:41]
  wire [3:0] _GEN_57 = 6'h7 == instructionFormatWire ? 4'h2 : _GEN_50; // @[ContrGen.scala 184:39 799:41]
  wire [2:0] _GEN_58 = 6'h7 == instructionFormatWire ? 3'h6 : _GEN_51; // @[ContrGen.scala 184:39 800:41]
  wire  _GEN_59 = 6'h7 == instructionFormatWire ? 1'h0 : _GEN_52; // @[ContrGen.scala 184:39 802:41]
  wire [2:0] _GEN_60 = 6'h7 == instructionFormatWire ? 3'h0 : _GEN_53; // @[ContrGen.scala 184:39 804:41]
  wire  _GEN_61 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_54; // @[ContrGen.scala 184:39 779:41]
  wire  _GEN_63 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_56; // @[ContrGen.scala 184:39 781:41]
  wire [3:0] _GEN_64 = 6'h6 == instructionFormatWire ? 4'h2 : _GEN_57; // @[ContrGen.scala 184:39 782:41]
  wire [2:0] _GEN_65 = 6'h6 == instructionFormatWire ? 3'h5 : _GEN_58; // @[ContrGen.scala 184:39 783:41]
  wire  _GEN_66 = 6'h6 == instructionFormatWire ? 1'h0 : _GEN_59; // @[ContrGen.scala 184:39 785:41]
  wire [2:0] _GEN_67 = 6'h6 == instructionFormatWire ? 3'h0 : _GEN_60; // @[ContrGen.scala 184:39 787:41]
  wire  _GEN_68 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_61; // @[ContrGen.scala 184:39 762:41]
  wire  _GEN_70 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_63; // @[ContrGen.scala 184:39 764:41]
  wire [3:0] _GEN_71 = 6'h5 == instructionFormatWire ? 4'h2 : _GEN_64; // @[ContrGen.scala 184:39 765:41]
  wire [2:0] _GEN_72 = 6'h5 == instructionFormatWire ? 3'h4 : _GEN_65; // @[ContrGen.scala 184:39 766:41]
  wire  _GEN_73 = 6'h5 == instructionFormatWire ? 1'h0 : _GEN_66; // @[ContrGen.scala 184:39 768:41]
  wire [2:0] _GEN_74 = 6'h5 == instructionFormatWire ? 3'h0 : _GEN_67; // @[ContrGen.scala 184:39 770:41]
  wire  _GEN_75 = 6'h4 == instructionFormatWire | _GEN_68; // @[ContrGen.scala 184:39 744:41]
  wire [1:0] _GEN_77 = 6'h4 == instructionFormatWire ? 2'h2 : {{1'd0}, _GEN_70}; // @[ContrGen.scala 184:39 746:41]
  wire [3:0] _GEN_78 = 6'h4 == instructionFormatWire ? 4'h0 : _GEN_71; // @[ContrGen.scala 184:39 747:41]
  wire [2:0] _GEN_79 = 6'h4 == instructionFormatWire ? 3'h2 : _GEN_72; // @[ContrGen.scala 184:39 748:41]
  wire  _GEN_80 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_68; // @[ContrGen.scala 184:39 749:37]
  wire  _GEN_81 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_73; // @[ContrGen.scala 184:39 750:41]
  wire  _GEN_82 = 6'h4 == instructionFormatWire ? 1'h0 : _GEN_70; // @[ContrGen.scala 184:39 751:37]
  wire [2:0] _GEN_83 = 6'h4 == instructionFormatWire ? 3'h0 : _GEN_74; // @[ContrGen.scala 184:39 752:41]
  wire  _GEN_85 = 6'h3 == instructionFormatWire | _GEN_75; // @[ContrGen.scala 184:39 727:41]
  wire  _GEN_86 = 6'h3 == instructionFormatWire | 6'h4 == instructionFormatWire; // @[ContrGen.scala 184:39 728:41]
  wire [1:0] _GEN_87 = 6'h3 == instructionFormatWire ? 2'h2 : _GEN_77; // @[ContrGen.scala 184:39 729:41]
  wire [3:0] _GEN_88 = 6'h3 == instructionFormatWire ? 4'h0 : _GEN_78; // @[ContrGen.scala 184:39 730:41]
  wire [2:0] _GEN_89 = 6'h3 == instructionFormatWire ? 3'h1 : _GEN_79; // @[ContrGen.scala 184:39 731:41]
  wire  _GEN_90 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_80; // @[ContrGen.scala 184:39 732:37]
  wire  _GEN_91 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_81; // @[ContrGen.scala 184:39 733:41]
  wire  _GEN_92 = 6'h3 == instructionFormatWire ? 1'h0 : _GEN_82; // @[ContrGen.scala 184:39 734:37]
  wire [2:0] _GEN_93 = 6'h3 == instructionFormatWire ? 3'h0 : _GEN_83; // @[ContrGen.scala 184:39 735:41]
  wire  _GEN_95 = 6'h23 == instructionFormatWire | _GEN_85; // @[ContrGen.scala 184:39 707:41]
  wire  _GEN_96 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_86; // @[ContrGen.scala 184:39 708:41]
  wire [1:0] _GEN_97 = 6'h23 == instructionFormatWire ? 2'h0 : _GEN_87; // @[ContrGen.scala 184:39 709:41]
  wire [3:0] _GEN_98 = 6'h23 == instructionFormatWire ? 4'hd : _GEN_88; // @[ContrGen.scala 184:39 710:41]
  wire [2:0] _GEN_99 = 6'h23 == instructionFormatWire ? 3'h0 : _GEN_89; // @[ContrGen.scala 184:39 711:41]
  wire  _GEN_100 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_90; // @[ContrGen.scala 184:39 712:37]
  wire  _GEN_101 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_91; // @[ContrGen.scala 184:39 713:41]
  wire  _GEN_102 = 6'h23 == instructionFormatWire ? 1'h0 : _GEN_92; // @[ContrGen.scala 184:39 714:37]
  wire [2:0] _GEN_103 = 6'h23 == instructionFormatWire ? 3'h0 : _GEN_93; // @[ContrGen.scala 184:39 715:41]
  wire  _GEN_105 = 6'h1d == instructionFormatWire | _GEN_95; // @[ContrGen.scala 184:39 690:41]
  wire  _GEN_106 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_96; // @[ContrGen.scala 184:39 691:41]
  wire [1:0] _GEN_107 = 6'h1d == instructionFormatWire ? 2'h0 : _GEN_97; // @[ContrGen.scala 184:39 692:41]
  wire [3:0] _GEN_108 = 6'h1d == instructionFormatWire ? 4'h8 : _GEN_98; // @[ContrGen.scala 184:39 693:41]
  wire [2:0] _GEN_109 = 6'h1d == instructionFormatWire ? 3'h0 : _GEN_99; // @[ContrGen.scala 184:39 694:41]
  wire  _GEN_110 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_100; // @[ContrGen.scala 184:39 695:37]
  wire  _GEN_111 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_101; // @[ContrGen.scala 184:39 696:41]
  wire  _GEN_112 = 6'h1d == instructionFormatWire ? 1'h0 : _GEN_102; // @[ContrGen.scala 184:39 697:37]
  wire [2:0] _GEN_113 = 6'h1d == instructionFormatWire ? 3'h0 : _GEN_103; // @[ContrGen.scala 184:39 698:41]
  wire  _GEN_115 = 6'h22 == instructionFormatWire | _GEN_105; // @[ContrGen.scala 184:39 673:41]
  wire  _GEN_116 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_106; // @[ContrGen.scala 184:39 674:41]
  wire [1:0] _GEN_117 = 6'h22 == instructionFormatWire ? 2'h0 : _GEN_107; // @[ContrGen.scala 184:39 675:41]
  wire [3:0] _GEN_118 = 6'h22 == instructionFormatWire ? 4'h5 : _GEN_108; // @[ContrGen.scala 184:39 676:41]
  wire [2:0] _GEN_119 = 6'h22 == instructionFormatWire ? 3'h0 : _GEN_109; // @[ContrGen.scala 184:39 677:41]
  wire  _GEN_120 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_110; // @[ContrGen.scala 184:39 678:37]
  wire  _GEN_121 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_111; // @[ContrGen.scala 184:39 679:41]
  wire  _GEN_122 = 6'h22 == instructionFormatWire ? 1'h0 : _GEN_112; // @[ContrGen.scala 184:39 680:37]
  wire [2:0] _GEN_123 = 6'h22 == instructionFormatWire ? 3'h0 : _GEN_113; // @[ContrGen.scala 184:39 681:41]
  wire  _GEN_125 = 6'h1e == instructionFormatWire | _GEN_115; // @[ContrGen.scala 184:39 656:41]
  wire  _GEN_126 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_116; // @[ContrGen.scala 184:39 657:41]
  wire [1:0] _GEN_127 = 6'h1e == instructionFormatWire ? 2'h0 : _GEN_117; // @[ContrGen.scala 184:39 658:41]
  wire [3:0] _GEN_128 = 6'h1e == instructionFormatWire ? 4'h1 : _GEN_118; // @[ContrGen.scala 184:39 659:41]
  wire [2:0] _GEN_129 = 6'h1e == instructionFormatWire ? 3'h0 : _GEN_119; // @[ContrGen.scala 184:39 660:41]
  wire  _GEN_130 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_120; // @[ContrGen.scala 184:39 661:37]
  wire  _GEN_131 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_121; // @[ContrGen.scala 184:39 662:41]
  wire  _GEN_132 = 6'h1e == instructionFormatWire ? 1'h0 : _GEN_122; // @[ContrGen.scala 184:39 663:37]
  wire [2:0] _GEN_133 = 6'h1e == instructionFormatWire ? 3'h0 : _GEN_123; // @[ContrGen.scala 184:39 664:41]
  wire  _GEN_135 = 6'h21 == instructionFormatWire | _GEN_125; // @[ContrGen.scala 184:39 639:41]
  wire  _GEN_136 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_126; // @[ContrGen.scala 184:39 640:41]
  wire [1:0] _GEN_137 = 6'h21 == instructionFormatWire ? 2'h0 : _GEN_127; // @[ContrGen.scala 184:39 641:41]
  wire [3:0] _GEN_138 = 6'h21 == instructionFormatWire ? 4'h4 : _GEN_128; // @[ContrGen.scala 184:39 642:41]
  wire [2:0] _GEN_139 = 6'h21 == instructionFormatWire ? 3'h0 : _GEN_129; // @[ContrGen.scala 184:39 643:41]
  wire  _GEN_140 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_130; // @[ContrGen.scala 184:39 644:37]
  wire  _GEN_141 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_131; // @[ContrGen.scala 184:39 645:41]
  wire  _GEN_142 = 6'h21 == instructionFormatWire ? 1'h0 : _GEN_132; // @[ContrGen.scala 184:39 646:37]
  wire [2:0] _GEN_143 = 6'h21 == instructionFormatWire ? 3'h0 : _GEN_133; // @[ContrGen.scala 184:39 647:41]
  wire  _GEN_145 = 6'h24 == instructionFormatWire | _GEN_135; // @[ContrGen.scala 184:39 622:41]
  wire  _GEN_146 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_136; // @[ContrGen.scala 184:39 623:41]
  wire [1:0] _GEN_147 = 6'h24 == instructionFormatWire ? 2'h0 : _GEN_137; // @[ContrGen.scala 184:39 624:41]
  wire [3:0] _GEN_148 = 6'h24 == instructionFormatWire ? 4'h6 : _GEN_138; // @[ContrGen.scala 184:39 625:41]
  wire [2:0] _GEN_149 = 6'h24 == instructionFormatWire ? 3'h0 : _GEN_139; // @[ContrGen.scala 184:39 626:41]
  wire  _GEN_150 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_140; // @[ContrGen.scala 184:39 627:37]
  wire  _GEN_151 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_141; // @[ContrGen.scala 184:39 628:41]
  wire  _GEN_152 = 6'h24 == instructionFormatWire ? 1'h0 : _GEN_142; // @[ContrGen.scala 184:39 629:37]
  wire [2:0] _GEN_153 = 6'h24 == instructionFormatWire ? 3'h0 : _GEN_143; // @[ContrGen.scala 184:39 630:41]
  wire  _GEN_155 = 6'h25 == instructionFormatWire | _GEN_145; // @[ContrGen.scala 184:39 605:41]
  wire  _GEN_156 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_146; // @[ContrGen.scala 184:39 606:41]
  wire [1:0] _GEN_157 = 6'h25 == instructionFormatWire ? 2'h0 : _GEN_147; // @[ContrGen.scala 184:39 607:41]
  wire [3:0] _GEN_158 = 6'h25 == instructionFormatWire ? 4'h7 : _GEN_148; // @[ContrGen.scala 184:39 608:41]
  wire [2:0] _GEN_159 = 6'h25 == instructionFormatWire ? 3'h0 : _GEN_149; // @[ContrGen.scala 184:39 609:41]
  wire  _GEN_160 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_150; // @[ContrGen.scala 184:39 610:37]
  wire  _GEN_161 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_151; // @[ContrGen.scala 184:39 611:41]
  wire  _GEN_162 = 6'h25 == instructionFormatWire ? 1'h0 : _GEN_152; // @[ContrGen.scala 184:39 612:37]
  wire [2:0] _GEN_163 = 6'h25 == instructionFormatWire ? 3'h0 : _GEN_153; // @[ContrGen.scala 184:39 613:41]
  wire  _GEN_165 = 6'h20 == instructionFormatWire | _GEN_155; // @[ContrGen.scala 184:39 587:41]
  wire  _GEN_166 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_156; // @[ContrGen.scala 184:39 588:41]
  wire [1:0] _GEN_167 = 6'h20 == instructionFormatWire ? 2'h0 : _GEN_157; // @[ContrGen.scala 184:39 589:41]
  wire [3:0] _GEN_168 = 6'h20 == instructionFormatWire ? 4'ha : _GEN_158; // @[ContrGen.scala 184:39 590:41]
  wire [2:0] _GEN_169 = 6'h20 == instructionFormatWire ? 3'h0 : _GEN_159; // @[ContrGen.scala 184:39 591:41]
  wire  _GEN_170 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_160; // @[ContrGen.scala 184:39 592:37]
  wire  _GEN_171 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_161; // @[ContrGen.scala 184:39 593:41]
  wire  _GEN_172 = 6'h20 == instructionFormatWire ? 1'h0 : _GEN_162; // @[ContrGen.scala 184:39 594:37]
  wire [2:0] _GEN_173 = 6'h20 == instructionFormatWire ? 3'h0 : _GEN_163; // @[ContrGen.scala 184:39 595:41]
  wire  _GEN_175 = 6'h1f == instructionFormatWire | _GEN_165; // @[ContrGen.scala 184:39 570:41]
  wire  _GEN_176 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_166; // @[ContrGen.scala 184:39 571:41]
  wire [1:0] _GEN_177 = 6'h1f == instructionFormatWire ? 2'h0 : _GEN_167; // @[ContrGen.scala 184:39 572:41]
  wire [3:0] _GEN_178 = 6'h1f == instructionFormatWire ? 4'h2 : _GEN_168; // @[ContrGen.scala 184:39 573:41]
  wire [2:0] _GEN_179 = 6'h1f == instructionFormatWire ? 3'h0 : _GEN_169; // @[ContrGen.scala 184:39 574:41]
  wire  _GEN_180 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_170; // @[ContrGen.scala 184:39 575:37]
  wire  _GEN_181 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_171; // @[ContrGen.scala 184:39 576:41]
  wire  _GEN_182 = 6'h1f == instructionFormatWire ? 1'h0 : _GEN_172; // @[ContrGen.scala 184:39 577:37]
  wire [2:0] _GEN_183 = 6'h1f == instructionFormatWire ? 3'h0 : _GEN_173; // @[ContrGen.scala 184:39 578:41]
  wire  _GEN_185 = 6'h1c == instructionFormatWire | _GEN_175; // @[ContrGen.scala 184:39 553:41]
  wire  _GEN_186 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_176; // @[ContrGen.scala 184:39 554:41]
  wire [1:0] _GEN_187 = 6'h1c == instructionFormatWire ? 2'h0 : _GEN_177; // @[ContrGen.scala 184:39 555:41]
  wire [3:0] _GEN_188 = 6'h1c == instructionFormatWire ? 4'h0 : _GEN_178; // @[ContrGen.scala 184:39 556:41]
  wire [2:0] _GEN_189 = 6'h1c == instructionFormatWire ? 3'h0 : _GEN_179; // @[ContrGen.scala 184:39 557:41]
  wire  _GEN_190 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_180; // @[ContrGen.scala 184:39 558:37]
  wire  _GEN_191 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_181; // @[ContrGen.scala 184:39 559:41]
  wire  _GEN_192 = 6'h1c == instructionFormatWire ? 1'h0 : _GEN_182; // @[ContrGen.scala 184:39 560:37]
  wire [2:0] _GEN_193 = 6'h1c == instructionFormatWire ? 3'h0 : _GEN_183; // @[ContrGen.scala 184:39 561:41]
  wire  _GEN_195 = 6'h2 == instructionFormatWire | _GEN_185; // @[ContrGen.scala 184:39 535:41]
  wire  _GEN_196 = 6'h2 == instructionFormatWire | _GEN_186; // @[ContrGen.scala 184:39 536:41]
  wire [1:0] _GEN_197 = 6'h2 == instructionFormatWire ? 2'h1 : _GEN_187; // @[ContrGen.scala 184:39 537:41]
  wire [3:0] _GEN_198 = 6'h2 == instructionFormatWire ? 4'h0 : _GEN_188; // @[ContrGen.scala 184:39 538:41]
  wire [2:0] _GEN_199 = 6'h2 == instructionFormatWire ? 3'h0 : _GEN_189; // @[ContrGen.scala 184:39 539:41]
  wire  _GEN_200 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_190; // @[ContrGen.scala 184:39 540:37]
  wire  _GEN_201 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_191; // @[ContrGen.scala 184:39 541:41]
  wire  _GEN_202 = 6'h2 == instructionFormatWire ? 1'h0 : _GEN_192; // @[ContrGen.scala 184:39 542:37]
  wire [2:0] _GEN_203 = 6'h2 == instructionFormatWire ? 3'h0 : _GEN_193; // @[ContrGen.scala 184:39 543:41]
  wire  _GEN_205 = 6'h1 == instructionFormatWire | _GEN_195; // @[ContrGen.scala 184:39 518:41]
  wire  _GEN_206 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_196; // @[ContrGen.scala 184:39 519:41]
  wire [1:0] _GEN_207 = 6'h1 == instructionFormatWire ? 2'h1 : _GEN_197; // @[ContrGen.scala 184:39 520:41]
  wire [3:0] _GEN_208 = 6'h1 == instructionFormatWire ? 4'h3 : _GEN_198; // @[ContrGen.scala 184:39 521:41]
  wire [2:0] _GEN_209 = 6'h1 == instructionFormatWire ? 3'h0 : _GEN_199; // @[ContrGen.scala 184:39 522:41]
  wire  _GEN_210 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_200; // @[ContrGen.scala 184:39 523:37]
  wire  _GEN_211 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_201; // @[ContrGen.scala 184:39 524:41]
  wire  _GEN_212 = 6'h1 == instructionFormatWire ? 1'h0 : _GEN_202; // @[ContrGen.scala 184:39 525:37]
  wire [2:0] _GEN_213 = 6'h1 == instructionFormatWire ? 3'h0 : _GEN_203; // @[ContrGen.scala 184:39 526:41]
  wire  _GEN_215 = 6'h1b == instructionFormatWire | _GEN_205; // @[ContrGen.scala 184:39 501:41]
  wire  _GEN_216 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_206; // @[ContrGen.scala 184:39 502:41]
  wire [1:0] _GEN_217 = 6'h1b == instructionFormatWire ? 2'h1 : _GEN_207; // @[ContrGen.scala 184:39 503:41]
  wire [3:0] _GEN_218 = 6'h1b == instructionFormatWire ? 4'hd : _GEN_208; // @[ContrGen.scala 184:39 504:41]
  wire [2:0] _GEN_219 = 6'h1b == instructionFormatWire ? 3'h0 : _GEN_209; // @[ContrGen.scala 184:39 505:41]
  wire  _GEN_220 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_210; // @[ContrGen.scala 184:39 506:37]
  wire  _GEN_221 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_211; // @[ContrGen.scala 184:39 507:41]
  wire  _GEN_222 = 6'h1b == instructionFormatWire ? 1'h0 : _GEN_212; // @[ContrGen.scala 184:39 508:37]
  wire [2:0] _GEN_223 = 6'h1b == instructionFormatWire ? 3'h0 : _GEN_213; // @[ContrGen.scala 184:39 509:41]
  wire  _GEN_225 = 6'h1a == instructionFormatWire | _GEN_215; // @[ContrGen.scala 184:39 484:41]
  wire  _GEN_226 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_216; // @[ContrGen.scala 184:39 485:41]
  wire [1:0] _GEN_227 = 6'h1a == instructionFormatWire ? 2'h1 : _GEN_217; // @[ContrGen.scala 184:39 486:41]
  wire [3:0] _GEN_228 = 6'h1a == instructionFormatWire ? 4'h5 : _GEN_218; // @[ContrGen.scala 184:39 487:41]
  wire [2:0] _GEN_229 = 6'h1a == instructionFormatWire ? 3'h0 : _GEN_219; // @[ContrGen.scala 184:39 488:41]
  wire  _GEN_230 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_220; // @[ContrGen.scala 184:39 489:37]
  wire  _GEN_231 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_221; // @[ContrGen.scala 184:39 490:41]
  wire  _GEN_232 = 6'h1a == instructionFormatWire ? 1'h0 : _GEN_222; // @[ContrGen.scala 184:39 491:37]
  wire [2:0] _GEN_233 = 6'h1a == instructionFormatWire ? 3'h0 : _GEN_223; // @[ContrGen.scala 184:39 492:41]
  wire  _GEN_235 = 6'h19 == instructionFormatWire | _GEN_225; // @[ContrGen.scala 184:39 467:41]
  wire  _GEN_236 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_226; // @[ContrGen.scala 184:39 468:41]
  wire [1:0] _GEN_237 = 6'h19 == instructionFormatWire ? 2'h1 : _GEN_227; // @[ContrGen.scala 184:39 469:41]
  wire [3:0] _GEN_238 = 6'h19 == instructionFormatWire ? 4'h1 : _GEN_228; // @[ContrGen.scala 184:39 470:41]
  wire [2:0] _GEN_239 = 6'h19 == instructionFormatWire ? 3'h0 : _GEN_229; // @[ContrGen.scala 184:39 471:41]
  wire  _GEN_240 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_230; // @[ContrGen.scala 184:39 472:37]
  wire  _GEN_241 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_231; // @[ContrGen.scala 184:39 473:41]
  wire  _GEN_242 = 6'h19 == instructionFormatWire ? 1'h0 : _GEN_232; // @[ContrGen.scala 184:39 474:37]
  wire [2:0] _GEN_243 = 6'h19 == instructionFormatWire ? 3'h0 : _GEN_233; // @[ContrGen.scala 184:39 475:41]
  wire  _GEN_245 = 6'h16 == instructionFormatWire | _GEN_235; // @[ContrGen.scala 184:39 450:41]
  wire  _GEN_246 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_236; // @[ContrGen.scala 184:39 451:41]
  wire [1:0] _GEN_247 = 6'h16 == instructionFormatWire ? 2'h1 : _GEN_237; // @[ContrGen.scala 184:39 452:41]
  wire [3:0] _GEN_248 = 6'h16 == instructionFormatWire ? 4'h4 : _GEN_238; // @[ContrGen.scala 184:39 453:41]
  wire [2:0] _GEN_249 = 6'h16 == instructionFormatWire ? 3'h0 : _GEN_239; // @[ContrGen.scala 184:39 454:41]
  wire  _GEN_250 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_240; // @[ContrGen.scala 184:39 455:37]
  wire  _GEN_251 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_241; // @[ContrGen.scala 184:39 456:41]
  wire  _GEN_252 = 6'h16 == instructionFormatWire ? 1'h0 : _GEN_242; // @[ContrGen.scala 184:39 457:37]
  wire [2:0] _GEN_253 = 6'h16 == instructionFormatWire ? 3'h0 : _GEN_243; // @[ContrGen.scala 184:39 458:41]
  wire  _GEN_255 = 6'h17 == instructionFormatWire | _GEN_245; // @[ContrGen.scala 184:39 433:41]
  wire  _GEN_256 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_246; // @[ContrGen.scala 184:39 434:41]
  wire [1:0] _GEN_257 = 6'h17 == instructionFormatWire ? 2'h1 : _GEN_247; // @[ContrGen.scala 184:39 435:41]
  wire [3:0] _GEN_258 = 6'h17 == instructionFormatWire ? 4'h6 : _GEN_248; // @[ContrGen.scala 184:39 436:41]
  wire [2:0] _GEN_259 = 6'h17 == instructionFormatWire ? 3'h0 : _GEN_249; // @[ContrGen.scala 184:39 437:41]
  wire  _GEN_260 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_250; // @[ContrGen.scala 184:39 438:37]
  wire  _GEN_261 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_251; // @[ContrGen.scala 184:39 439:41]
  wire  _GEN_262 = 6'h17 == instructionFormatWire ? 1'h0 : _GEN_252; // @[ContrGen.scala 184:39 440:37]
  wire [2:0] _GEN_263 = 6'h17 == instructionFormatWire ? 3'h0 : _GEN_253; // @[ContrGen.scala 184:39 441:41]
  wire  _GEN_265 = 6'h18 == instructionFormatWire | _GEN_255; // @[ContrGen.scala 184:39 416:41]
  wire  _GEN_266 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_256; // @[ContrGen.scala 184:39 417:41]
  wire [1:0] _GEN_267 = 6'h18 == instructionFormatWire ? 2'h1 : _GEN_257; // @[ContrGen.scala 184:39 418:41]
  wire [3:0] _GEN_268 = 6'h18 == instructionFormatWire ? 4'h7 : _GEN_258; // @[ContrGen.scala 184:39 419:41]
  wire [2:0] _GEN_269 = 6'h18 == instructionFormatWire ? 3'h0 : _GEN_259; // @[ContrGen.scala 184:39 420:41]
  wire  _GEN_270 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_260; // @[ContrGen.scala 184:39 421:37]
  wire  _GEN_271 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_261; // @[ContrGen.scala 184:39 422:41]
  wire  _GEN_272 = 6'h18 == instructionFormatWire ? 1'h0 : _GEN_262; // @[ContrGen.scala 184:39 423:37]
  wire [2:0] _GEN_273 = 6'h18 == instructionFormatWire ? 3'h0 : _GEN_263; // @[ContrGen.scala 184:39 424:41]
  wire  _GEN_275 = 6'h15 == instructionFormatWire | _GEN_265; // @[ContrGen.scala 184:39 399:41]
  wire  _GEN_276 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_266; // @[ContrGen.scala 184:39 400:41]
  wire [1:0] _GEN_277 = 6'h15 == instructionFormatWire ? 2'h1 : _GEN_267; // @[ContrGen.scala 184:39 401:41]
  wire [3:0] _GEN_278 = 6'h15 == instructionFormatWire ? 4'ha : _GEN_268; // @[ContrGen.scala 184:39 402:41]
  wire [2:0] _GEN_279 = 6'h15 == instructionFormatWire ? 3'h0 : _GEN_269; // @[ContrGen.scala 184:39 403:41]
  wire  _GEN_280 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_270; // @[ContrGen.scala 184:39 404:37]
  wire  _GEN_281 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_271; // @[ContrGen.scala 184:39 405:41]
  wire  _GEN_282 = 6'h15 == instructionFormatWire ? 1'h0 : _GEN_272; // @[ContrGen.scala 184:39 406:37]
  wire [2:0] _GEN_283 = 6'h15 == instructionFormatWire ? 3'h0 : _GEN_273; // @[ContrGen.scala 184:39 407:41]
  wire  _GEN_285 = 6'h14 == instructionFormatWire | _GEN_275; // @[ContrGen.scala 184:39 382:41]
  wire  _GEN_286 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_276; // @[ContrGen.scala 184:39 383:41]
  wire [1:0] _GEN_287 = 6'h14 == instructionFormatWire ? 2'h1 : _GEN_277; // @[ContrGen.scala 184:39 384:41]
  wire [3:0] _GEN_288 = 6'h14 == instructionFormatWire ? 4'h2 : _GEN_278; // @[ContrGen.scala 184:39 385:41]
  wire [2:0] _GEN_289 = 6'h14 == instructionFormatWire ? 3'h0 : _GEN_279; // @[ContrGen.scala 184:39 386:41]
  wire  _GEN_290 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_280; // @[ContrGen.scala 184:39 387:37]
  wire  _GEN_291 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_281; // @[ContrGen.scala 184:39 388:41]
  wire  _GEN_292 = 6'h14 == instructionFormatWire ? 1'h0 : _GEN_282; // @[ContrGen.scala 184:39 389:37]
  wire [2:0] _GEN_293 = 6'h14 == instructionFormatWire ? 3'h0 : _GEN_283; // @[ContrGen.scala 184:39 390:41]
  wire  _GEN_295 = 6'h13 == instructionFormatWire | _GEN_285; // @[ContrGen.scala 184:39 365:41]
  wire  _GEN_296 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_286; // @[ContrGen.scala 184:39 366:41]
  wire [1:0] _GEN_297 = 6'h13 == instructionFormatWire ? 2'h1 : _GEN_287; // @[ContrGen.scala 184:39 367:41]
  wire [3:0] _GEN_298 = 6'h13 == instructionFormatWire ? 4'h0 : _GEN_288; // @[ContrGen.scala 184:39 368:41]
  wire [2:0] _GEN_299 = 6'h13 == instructionFormatWire ? 3'h0 : _GEN_289; // @[ContrGen.scala 184:39 369:41]
  wire  _GEN_300 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_290; // @[ContrGen.scala 184:39 370:37]
  wire  _GEN_301 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_291; // @[ContrGen.scala 184:39 371:41]
  wire  _GEN_302 = 6'h13 == instructionFormatWire ? 1'h0 : _GEN_292; // @[ContrGen.scala 184:39 372:37]
  wire [2:0] _GEN_303 = 6'h13 == instructionFormatWire ? 3'h0 : _GEN_293; // @[ContrGen.scala 184:39 373:41]
  wire  _GEN_305 = 6'h2e == instructionFormatWire | _GEN_295; // @[ContrGen.scala 184:39 343:41]
  wire  _GEN_306 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_296; // @[ContrGen.scala 184:39 344:41]
  wire [1:0] _GEN_307 = 6'h2e == instructionFormatWire ? 2'h0 : _GEN_297; // @[ContrGen.scala 184:39 345:41]
  wire [3:0] _GEN_308 = 6'h2e == instructionFormatWire ? 4'h0 : _GEN_298; // @[ContrGen.scala 184:39 346:41]
  wire [2:0] _GEN_309 = 6'h2e == instructionFormatWire ? 3'h0 : _GEN_299; // @[ContrGen.scala 184:39 347:41]
  wire [1:0] _GEN_310 = 6'h2e == instructionFormatWire ? 2'h2 : {{1'd0}, _GEN_300}; // @[ContrGen.scala 184:39 348:37]
  wire  _GEN_311 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_301; // @[ContrGen.scala 184:39 349:41]
  wire  _GEN_312 = 6'h2e == instructionFormatWire ? 1'h0 : _GEN_302; // @[ContrGen.scala 184:39 350:37]
  wire [2:0] _GEN_313 = 6'h2e == instructionFormatWire ? 3'h0 : _GEN_303; // @[ContrGen.scala 184:39 351:41]
  wire [1:0] _GEN_316 = 6'h2e == instructionFormatWire ? 2'h2 : 2'h0; // @[ContrGen.scala 184:39 357:25]
  wire  _GEN_317 = 6'h2b == instructionFormatWire | _GEN_305; // @[ContrGen.scala 184:39 326:41]
  wire  _GEN_318 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_306; // @[ContrGen.scala 184:39 327:41]
  wire [1:0] _GEN_319 = 6'h2b == instructionFormatWire ? 2'h0 : _GEN_307; // @[ContrGen.scala 184:39 328:41]
  wire [3:0] _GEN_320 = 6'h2b == instructionFormatWire ? 4'h0 : _GEN_308; // @[ContrGen.scala 184:39 329:41]
  wire [2:0] _GEN_321 = 6'h2b == instructionFormatWire ? 3'h0 : _GEN_309; // @[ContrGen.scala 184:39 330:41]
  wire [1:0] _GEN_322 = 6'h2b == instructionFormatWire ? 2'h2 : _GEN_310; // @[ContrGen.scala 184:39 331:37]
  wire  _GEN_323 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_311; // @[ContrGen.scala 184:39 332:41]
  wire  _GEN_324 = 6'h2b == instructionFormatWire ? 1'h0 : _GEN_312; // @[ContrGen.scala 184:39 333:37]
  wire [2:0] _GEN_325 = 6'h2b == instructionFormatWire ? 3'h0 : _GEN_313; // @[ContrGen.scala 184:39 334:41]
  wire  _GEN_326 = 6'h2b == instructionFormatWire | 6'h2e == instructionFormatWire; // @[ContrGen.scala 184:39 335:33]
  wire  _GEN_327 = 6'h2b == instructionFormatWire ? 1'h0 : 6'h2e == instructionFormatWire; // @[ContrGen.scala 184:39 336:25]
  wire [1:0] _GEN_329 = 6'h2b == instructionFormatWire ? 2'h2 : _GEN_316; // @[ContrGen.scala 184:39 340:25]
  wire  _GEN_330 = 6'h2f == instructionFormatWire | _GEN_317; // @[ContrGen.scala 184:39 309:41]
  wire  _GEN_331 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_318; // @[ContrGen.scala 184:39 310:41]
  wire [1:0] _GEN_332 = 6'h2f == instructionFormatWire ? 2'h0 : _GEN_319; // @[ContrGen.scala 184:39 311:41]
  wire [3:0] _GEN_333 = 6'h2f == instructionFormatWire ? 4'h0 : _GEN_320; // @[ContrGen.scala 184:39 312:41]
  wire [2:0] _GEN_334 = 6'h2f == instructionFormatWire ? 3'h0 : _GEN_321; // @[ContrGen.scala 184:39 313:41]
  wire [1:0] _GEN_335 = 6'h2f == instructionFormatWire ? 2'h2 : _GEN_322; // @[ContrGen.scala 184:39 314:37]
  wire  _GEN_336 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_323; // @[ContrGen.scala 184:39 315:41]
  wire  _GEN_337 = 6'h2f == instructionFormatWire ? 1'h0 : _GEN_324; // @[ContrGen.scala 184:39 316:37]
  wire [2:0] _GEN_338 = 6'h2f == instructionFormatWire ? 3'h0 : _GEN_325; // @[ContrGen.scala 184:39 317:41]
  wire  _GEN_339 = 6'h2f == instructionFormatWire | _GEN_326; // @[ContrGen.scala 184:39 318:33]
  wire  _GEN_340 = 6'h2f == instructionFormatWire | _GEN_327; // @[ContrGen.scala 184:39 319:25]
  wire [1:0] _GEN_342 = 6'h2f == instructionFormatWire ? 2'h1 : _GEN_329; // @[ContrGen.scala 184:39 323:25]
  wire  _GEN_343 = 6'h2c == instructionFormatWire | _GEN_330; // @[ContrGen.scala 184:39 292:41]
  wire  _GEN_344 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_331; // @[ContrGen.scala 184:39 293:41]
  wire [1:0] _GEN_345 = 6'h2c == instructionFormatWire ? 2'h0 : _GEN_332; // @[ContrGen.scala 184:39 294:41]
  wire [3:0] _GEN_346 = 6'h2c == instructionFormatWire ? 4'h0 : _GEN_333; // @[ContrGen.scala 184:39 295:41]
  wire [2:0] _GEN_347 = 6'h2c == instructionFormatWire ? 3'h0 : _GEN_334; // @[ContrGen.scala 184:39 296:41]
  wire [1:0] _GEN_348 = 6'h2c == instructionFormatWire ? 2'h2 : _GEN_335; // @[ContrGen.scala 184:39 297:37]
  wire  _GEN_349 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_336; // @[ContrGen.scala 184:39 298:41]
  wire  _GEN_350 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_337; // @[ContrGen.scala 184:39 299:37]
  wire [2:0] _GEN_351 = 6'h2c == instructionFormatWire ? 3'h0 : _GEN_338; // @[ContrGen.scala 184:39 300:41]
  wire  _GEN_352 = 6'h2c == instructionFormatWire | _GEN_339; // @[ContrGen.scala 184:39 301:33]
  wire  _GEN_353 = 6'h2c == instructionFormatWire ? 1'h0 : _GEN_340; // @[ContrGen.scala 184:39 302:25]
  wire [1:0] _GEN_355 = 6'h2c == instructionFormatWire ? 2'h1 : _GEN_342; // @[ContrGen.scala 184:39 306:25]
  wire  _GEN_356 = 6'h30 == instructionFormatWire | _GEN_343; // @[ContrGen.scala 184:39 275:41]
  wire  _GEN_357 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_344; // @[ContrGen.scala 184:39 276:41]
  wire [1:0] _GEN_358 = 6'h30 == instructionFormatWire ? 2'h0 : _GEN_345; // @[ContrGen.scala 184:39 277:41]
  wire [3:0] _GEN_359 = 6'h30 == instructionFormatWire ? 4'h0 : _GEN_346; // @[ContrGen.scala 184:39 278:41]
  wire [2:0] _GEN_360 = 6'h30 == instructionFormatWire ? 3'h0 : _GEN_347; // @[ContrGen.scala 184:39 279:41]
  wire [1:0] _GEN_361 = 6'h30 == instructionFormatWire ? 2'h2 : _GEN_348; // @[ContrGen.scala 184:39 280:37]
  wire  _GEN_362 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_349; // @[ContrGen.scala 184:39 281:41]
  wire  _GEN_363 = 6'h30 == instructionFormatWire ? 1'h0 : _GEN_350; // @[ContrGen.scala 184:39 282:37]
  wire [2:0] _GEN_364 = 6'h30 == instructionFormatWire ? 3'h0 : _GEN_351; // @[ContrGen.scala 184:39 283:41]
  wire  _GEN_365 = 6'h30 == instructionFormatWire | _GEN_352; // @[ContrGen.scala 184:39 284:33]
  wire  _GEN_366 = 6'h30 == instructionFormatWire | _GEN_353; // @[ContrGen.scala 184:39 285:25]
  wire [1:0] _GEN_368 = 6'h30 == instructionFormatWire ? 2'h0 : _GEN_355; // @[ContrGen.scala 184:39 289:25]
  wire  _GEN_369 = 6'h2d == instructionFormatWire | _GEN_356; // @[ContrGen.scala 184:39 258:41]
  wire  _GEN_370 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_357; // @[ContrGen.scala 184:39 259:41]
  wire [1:0] _GEN_371 = 6'h2d == instructionFormatWire ? 2'h0 : _GEN_358; // @[ContrGen.scala 184:39 260:41]
  wire [3:0] _GEN_372 = 6'h2d == instructionFormatWire ? 4'h0 : _GEN_359; // @[ContrGen.scala 184:39 261:41]
  wire [2:0] _GEN_373 = 6'h2d == instructionFormatWire ? 3'h0 : _GEN_360; // @[ContrGen.scala 184:39 262:41]
  wire [1:0] _GEN_374 = 6'h2d == instructionFormatWire ? 2'h2 : _GEN_361; // @[ContrGen.scala 184:39 263:37]
  wire  _GEN_375 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_362; // @[ContrGen.scala 184:39 264:41]
  wire  _GEN_376 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_363; // @[ContrGen.scala 184:39 265:37]
  wire [2:0] _GEN_377 = 6'h2d == instructionFormatWire ? 3'h0 : _GEN_364; // @[ContrGen.scala 184:39 266:41]
  wire  _GEN_378 = 6'h2d == instructionFormatWire | _GEN_365; // @[ContrGen.scala 184:39 267:33]
  wire  _GEN_379 = 6'h2d == instructionFormatWire ? 1'h0 : _GEN_366; // @[ContrGen.scala 184:39 268:25]
  wire [1:0] _GEN_381 = 6'h2d == instructionFormatWire ? 2'h0 : _GEN_368; // @[ContrGen.scala 184:39 272:25]
  wire  _GEN_382 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_369; // @[ContrGen.scala 184:39 238:41]
  wire  _GEN_383 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_370; // @[ContrGen.scala 184:39 239:41]
  wire [1:0] _GEN_384 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_371; // @[ContrGen.scala 184:39 240:41]
  wire [3:0] _GEN_385 = 6'h29 == instructionFormatWire ? 4'h0 : _GEN_372; // @[ContrGen.scala 184:39 241:41]
  wire [3:0] _GEN_386 = 6'h29 == instructionFormatWire ? 4'h8 : {{1'd0}, _GEN_373}; // @[ContrGen.scala 184:39 242:41]
  wire [1:0] _GEN_387 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_374; // @[ContrGen.scala 184:39 243:37]
  wire  _GEN_388 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_375; // @[ContrGen.scala 184:39 244:41]
  wire  _GEN_389 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_376; // @[ContrGen.scala 184:39 245:37]
  wire [2:0] _GEN_390 = 6'h29 == instructionFormatWire ? 3'h0 : _GEN_377; // @[ContrGen.scala 184:39 246:41]
  wire  _GEN_391 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_378; // @[ContrGen.scala 184:39 247:33]
  wire  _GEN_392 = 6'h29 == instructionFormatWire ? 1'h0 : _GEN_379; // @[ContrGen.scala 184:39 248:25]
  wire  _GEN_395 = 6'h29 == instructionFormatWire | _GEN_378; // @[ContrGen.scala 184:39 251:25]
  wire [1:0] _GEN_396 = 6'h29 == instructionFormatWire ? 2'h0 : _GEN_381; // @[ContrGen.scala 184:39 252:25]
  wire  _GEN_397 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_382; // @[ContrGen.scala 184:39 221:41]
  wire  _GEN_398 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_383; // @[ContrGen.scala 184:39 222:41]
  wire [1:0] _GEN_399 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_384; // @[ContrGen.scala 184:39 223:41]
  wire [3:0] _GEN_400 = 6'h28 == instructionFormatWire ? 4'h0 : _GEN_385; // @[ContrGen.scala 184:39 224:41]
  wire [3:0] _GEN_401 = 6'h28 == instructionFormatWire ? 4'h8 : _GEN_386; // @[ContrGen.scala 184:39 225:41]
  wire [1:0] _GEN_402 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_387; // @[ContrGen.scala 184:39 226:37]
  wire  _GEN_403 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_388; // @[ContrGen.scala 184:39 227:41]
  wire  _GEN_404 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_389; // @[ContrGen.scala 184:39 228:37]
  wire [2:0] _GEN_405 = 6'h28 == instructionFormatWire ? 3'h0 : _GEN_390; // @[ContrGen.scala 184:39 229:41]
  wire  _GEN_406 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_391; // @[ContrGen.scala 184:39 230:33]
  wire  _GEN_407 = 6'h28 == instructionFormatWire ? 1'h0 : _GEN_392; // @[ContrGen.scala 184:39 231:25]
  wire  _GEN_409 = 6'h28 == instructionFormatWire ? 1'h0 : 6'h29 == instructionFormatWire; // @[ContrGen.scala 184:39 233:25]
  wire  _GEN_410 = 6'h28 == instructionFormatWire | _GEN_395; // @[ContrGen.scala 184:39 234:25]
  wire [1:0] _GEN_411 = 6'h28 == instructionFormatWire ? 2'h0 : _GEN_396; // @[ContrGen.scala 184:39 235:25]
  wire  _GEN_412 = 6'h31 == instructionFormatWire | _GEN_397; // @[ContrGen.scala 184:39 204:41]
  wire  _GEN_413 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_398; // @[ContrGen.scala 184:39 205:41]
  wire [1:0] _GEN_414 = 6'h31 == instructionFormatWire ? 2'h1 : _GEN_399; // @[ContrGen.scala 184:39 206:41]
  wire [3:0] _GEN_415 = 6'h31 == instructionFormatWire ? 4'h0 : _GEN_400; // @[ContrGen.scala 184:39 207:41]
  wire [3:0] _GEN_416 = 6'h31 == instructionFormatWire ? 4'h0 : _GEN_401; // @[ContrGen.scala 184:39 208:41]
  wire [1:0] _GEN_417 = 6'h31 == instructionFormatWire ? 2'h0 : _GEN_402; // @[ContrGen.scala 184:39 209:37]
  wire  _GEN_418 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_403; // @[ContrGen.scala 184:39 210:41]
  wire  _GEN_419 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_404; // @[ContrGen.scala 184:39 211:37]
  wire [2:0] _GEN_420 = 6'h31 == instructionFormatWire ? 3'h0 : _GEN_405; // @[ContrGen.scala 184:39 212:41]
  wire  _GEN_421 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_406; // @[ContrGen.scala 184:39 213:33]
  wire  _GEN_422 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_407; // @[ContrGen.scala 184:39 214:25]
  wire  _GEN_423 = 6'h31 == instructionFormatWire ? 1'h0 : 6'h28 == instructionFormatWire; // @[ContrGen.scala 184:39 215:25]
  wire  _GEN_424 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_409; // @[ContrGen.scala 184:39 216:25]
  wire  _GEN_425 = 6'h31 == instructionFormatWire ? 1'h0 : _GEN_410; // @[ContrGen.scala 184:39 217:25]
  wire [1:0] _GEN_426 = 6'h31 == instructionFormatWire ? 2'h0 : _GEN_411; // @[ContrGen.scala 184:39 218:25]
  wire  _GEN_428 = 6'h0 == instructionFormatWire | _GEN_413; // @[ContrGen.scala 184:39 188:41]
  CGDPIC cgDPIC ( // @[ContrGen.scala 1005:28]
    .cmd(cgDPIC_cmd),
    .instructionFormat(cgDPIC_instructionFormat),
    .instructionFormatJAL(cgDPIC_instructionFormatJAL),
    .instructionFormatJALR(cgDPIC_instructionFormatJALR),
    .instructionFormatRET(cgDPIC_instructionFormatRET)
  );
  assign io_immType = _instructionFormatWire_T_14 ? 3'h1 : _instructionTypeWire_T_231; // @[Mux.scala 101:16]
  assign io_regWR = 6'h0 == instructionFormatWire | _GEN_412; // @[ContrGen.scala 184:39 187:41]
  assign io_srcAALU = {{1'd0}, _GEN_428};
  assign io_srcBALU = 6'h0 == instructionFormatWire ? 2'h2 : _GEN_414; // @[ContrGen.scala 184:39 189:41]
  assign io_ctrALU = 6'h0 == instructionFormatWire ? 4'h2 : _GEN_415; // @[ContrGen.scala 184:39 190:41]
  assign io_branch = 6'h0 == instructionFormatWire ? 4'h2 : _GEN_416; // @[ContrGen.scala 184:39 191:41]
  assign io_memToReg = 6'h0 == instructionFormatWire ? 2'h0 : _GEN_417; // @[ContrGen.scala 184:39 192:37]
  assign io_memWR = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_418; // @[ContrGen.scala 184:39 193:41]
  assign io_memValid = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_419; // @[ContrGen.scala 184:39 194:37]
  assign io_memOP = 6'h0 == instructionFormatWire ? 3'h0 : _GEN_420; // @[ContrGen.scala 184:39 195:41]
  assign io_ecall = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_423; // @[ContrGen.scala 184:39 198:25]
  assign io_mret = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_424; // @[ContrGen.scala 184:39 199:25]
  assign io_csrEn = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_425; // @[ContrGen.scala 184:39 200:25]
  assign io_csrWr = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_421; // @[ContrGen.scala 184:39 196:33]
  assign io_csrOP = 6'h0 == instructionFormatWire ? 1'h0 : _GEN_422; // @[ContrGen.scala 184:39 197:25]
  assign io_csrALUOP = 6'h0 == instructionFormatWire ? 2'h0 : _GEN_426; // @[ContrGen.scala 184:39 201:25]
  assign cgDPIC_cmd = io_cmd; // @[ContrGen.scala 1006:57]
  assign cgDPIC_instructionFormat = {{26'd0}, instructionFormatWire}; // @[ContrGen.scala 1007:41]
  assign cgDPIC_instructionFormatJAL = 32'h3; // @[ContrGen.scala 1008:41]
  assign cgDPIC_instructionFormatJALR = 32'h4; // @[ContrGen.scala 1009:41]
  assign cgDPIC_instructionFormatRET = 32'h0; // @[ContrGen.scala 1010:41]
endmodule
module ImmGen(
  input  [11:0] io_iImm,
  input  [11:0] io_sImm,
  input  [12:0] io_bImm,
  input  [31:0] io_uImm,
  input  [20:0] io_jImm,
  input  [2:0]  io_immType,
  output [31:0] io_imm
);
  wire [19:0] _iImmWire_T_2 = io_iImm[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] iImmWire = {_iImmWire_T_2,io_iImm}; // @[Cat.scala 33:92]
  wire [19:0] _sImmWire_T_2 = io_sImm[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] sImmWire = {_sImmWire_T_2,io_sImm}; // @[Cat.scala 33:92]
  wire [18:0] _bImmWire_T_2 = io_bImm[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 77:12]
  wire [31:0] bImmWire = {_bImmWire_T_2,io_bImm}; // @[Cat.scala 33:92]
  wire [10:0] _jImmWire_T_2 = io_jImm[20] ? 11'h7ff : 11'h0; // @[Bitwise.scala 77:12]
  wire [31:0] jImmWire = {_jImmWire_T_2,io_jImm}; // @[Cat.scala 33:92]
  wire  _io_imm_T = io_immType == 3'h1; // @[ImmGen.scala 26:70]
  wire  _io_imm_T_1 = io_immType == 3'h2; // @[ImmGen.scala 27:78]
  wire  _io_imm_T_2 = io_immType == 3'h3; // @[ImmGen.scala 28:78]
  wire  _io_imm_T_3 = io_immType == 3'h4; // @[ImmGen.scala 29:78]
  wire  _io_imm_T_4 = io_immType == 3'h5; // @[ImmGen.scala 30:78]
  wire [31:0] _io_imm_T_5 = _io_imm_T_4 ? jImmWire : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_imm_T_6 = _io_imm_T_3 ? io_uImm : _io_imm_T_5; // @[Mux.scala 101:16]
  wire [31:0] _io_imm_T_7 = _io_imm_T_2 ? bImmWire : _io_imm_T_6; // @[Mux.scala 101:16]
  wire [31:0] _io_imm_T_8 = _io_imm_T_1 ? sImmWire : _io_imm_T_7; // @[Mux.scala 101:16]
  assign io_imm = _io_imm_T ? iImmWire : _io_imm_T_8; // @[Mux.scala 101:16]
endmodule
module IDU(
  input         clock,
  input         reset,
  output        io_inst_ready,
  input         io_inst_valid,
  input  [31:0] io_inst_bits_inst,
  input  [31:0] io_inst_bits_pc,
  input         io_idu2EXU_ready,
  output        io_idu2EXU_valid,
  output [31:0] io_idu2EXU_bits_pc,
  output [31:0] io_idu2EXU_bits_rs1Data,
  output [31:0] io_idu2EXU_bits_rs2Data,
  output [31:0] io_idu2EXU_bits_imm,
  output [31:0] io_idu2EXU_bits_inst,
  output        io_idu2EXU_bits_regWR,
  output [1:0]  io_idu2EXU_bits_srcAALU,
  output [1:0]  io_idu2EXU_bits_srcBALU,
  output [3:0]  io_idu2EXU_bits_ctrALU,
  output [3:0]  io_idu2EXU_bits_branch,
  output [1:0]  io_idu2EXU_bits_toReg,
  output        io_idu2EXU_bits_memWR,
  output        io_idu2EXU_bits_memValid,
  output [2:0]  io_idu2EXU_bits_memOP,
  output [4:0]  io_idu2EXU_bits_rs1Index,
  output        io_idu2EXU_bits_ecall,
  output        io_idu2EXU_bits_mret,
  output        io_idu2EXU_bits_csrEn,
  output        io_idu2EXU_bits_csrWr,
  output        io_idu2EXU_bits_csrOP,
  output [1:0]  io_idu2EXU_bits_csrALUOP,
  input  [31:0] io_idu2BaseReg_rs1Data,
  input  [31:0] io_idu2BaseReg_rs2Data,
  output [3:0]  io_idu2BaseReg_rs1Index,
  output [3:0]  io_idu2BaseReg_rs2Index
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] contrGen_io_cmd; // @[IDU.scala 67:33]
  wire [6:0] contrGen_io_opcode; // @[IDU.scala 67:33]
  wire [2:0] contrGen_io_func3; // @[IDU.scala 67:33]
  wire [6:0] contrGen_io_func7; // @[IDU.scala 67:33]
  wire [2:0] contrGen_io_immType; // @[IDU.scala 67:33]
  wire  contrGen_io_regWR; // @[IDU.scala 67:33]
  wire [1:0] contrGen_io_srcAALU; // @[IDU.scala 67:33]
  wire [1:0] contrGen_io_srcBALU; // @[IDU.scala 67:33]
  wire [3:0] contrGen_io_ctrALU; // @[IDU.scala 67:33]
  wire [3:0] contrGen_io_branch; // @[IDU.scala 67:33]
  wire [1:0] contrGen_io_memToReg; // @[IDU.scala 67:33]
  wire  contrGen_io_memWR; // @[IDU.scala 67:33]
  wire  contrGen_io_memValid; // @[IDU.scala 67:33]
  wire [2:0] contrGen_io_memOP; // @[IDU.scala 67:33]
  wire  contrGen_io_ecall; // @[IDU.scala 67:33]
  wire  contrGen_io_mret; // @[IDU.scala 67:33]
  wire  contrGen_io_csrEn; // @[IDU.scala 67:33]
  wire  contrGen_io_csrWr; // @[IDU.scala 67:33]
  wire  contrGen_io_csrOP; // @[IDU.scala 67:33]
  wire [1:0] contrGen_io_csrALUOP; // @[IDU.scala 67:33]
  wire [11:0] immGen_io_iImm; // @[IDU.scala 92:33]
  wire [11:0] immGen_io_sImm; // @[IDU.scala 92:33]
  wire [12:0] immGen_io_bImm; // @[IDU.scala 92:33]
  wire [31:0] immGen_io_uImm; // @[IDU.scala 92:33]
  wire [20:0] immGen_io_jImm; // @[IDU.scala 92:33]
  wire [2:0] immGen_io_immType; // @[IDU.scala 92:33]
  wire [31:0] immGen_io_imm; // @[IDU.scala 92:33]
  reg [31:0] pcReg; // @[IDU.scala 18:30]
  reg [31:0] instReg; // @[IDU.scala 19:30]
  reg  ready2IFUReg; // @[IDU.scala 20:30]
  reg  valid2EXUReg; // @[IDU.scala 22:30]
  wire  _T_1 = io_idu2EXU_valid & io_idu2EXU_ready; // @[IDU.scala 27:31]
  wire  _GEN_0 = io_idu2EXU_valid & io_idu2EXU_ready | ready2IFUReg; // @[IDU.scala 27:52 28:26 20:30]
  wire  _T_2 = io_inst_valid & io_inst_ready; // @[IDU.scala 31:28]
  wire  _GEN_1 = io_inst_valid & io_inst_ready ? 1'h0 : ready2IFUReg; // @[IDU.scala 31:46 32:26 20:30]
  wire  _GEN_2 = ~ready2IFUReg ? _GEN_0 : _GEN_1; // @[IDU.scala 26:32]
  wire  _GEN_3 = _T_2 | valid2EXUReg; // @[IDU.scala 36:46 37:26 22:30]
  wire [6:0] func7Wire = instReg[31:25]; // @[IDU.scala 54:35]
  wire [4:0] rs2IndexWire = instReg[24:20]; // @[IDU.scala 55:31]
  wire [4:0] rs1IndexWire = instReg[19:15]; // @[IDU.scala 56:31]
  wire [4:0] bImmWire_lo = {instReg[11:8],1'h0}; // @[Cat.scala 33:92]
  wire [7:0] bImmWire_hi = {instReg[31],instReg[7],instReg[30:25]}; // @[Cat.scala 33:92]
  wire [10:0] jImmWire_lo = {instReg[30:21],1'h0}; // @[Cat.scala 33:92]
  wire [9:0] jImmWire_hi = {instReg[31],instReg[19:12],instReg[20]}; // @[Cat.scala 33:92]
  ContrGen contrGen ( // @[IDU.scala 67:33]
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
  ImmGen immGen ( // @[IDU.scala 92:33]
    .io_iImm(immGen_io_iImm),
    .io_sImm(immGen_io_sImm),
    .io_bImm(immGen_io_bImm),
    .io_uImm(immGen_io_uImm),
    .io_jImm(immGen_io_jImm),
    .io_immType(immGen_io_immType),
    .io_imm(immGen_io_imm)
  );
  assign io_inst_ready = ready2IFUReg; // @[IDU.scala 21:37]
  assign io_idu2EXU_valid = valid2EXUReg; // @[IDU.scala 23:37]
  assign io_idu2EXU_bits_pc = pcReg; // @[IDU.scala 124:33]
  assign io_idu2EXU_bits_rs1Data = io_idu2BaseReg_rs1Data; // @[IDU.scala 125:33]
  assign io_idu2EXU_bits_rs2Data = io_idu2BaseReg_rs2Data; // @[IDU.scala 126:33]
  assign io_idu2EXU_bits_imm = immGen_io_imm; // @[IDU.scala 127:41]
  assign io_idu2EXU_bits_inst = instReg; // @[IDU.scala 128:33]
  assign io_idu2EXU_bits_regWR = contrGen_io_regWR; // @[IDU.scala 104:41]
  assign io_idu2EXU_bits_srcAALU = contrGen_io_srcAALU; // @[IDU.scala 105:33]
  assign io_idu2EXU_bits_srcBALU = contrGen_io_srcBALU; // @[IDU.scala 106:33]
  assign io_idu2EXU_bits_ctrALU = contrGen_io_ctrALU; // @[IDU.scala 107:41]
  assign io_idu2EXU_bits_branch = contrGen_io_branch; // @[IDU.scala 108:41]
  assign io_idu2EXU_bits_toReg = contrGen_io_memToReg; // @[IDU.scala 109:41]
  assign io_idu2EXU_bits_memWR = contrGen_io_memWR; // @[IDU.scala 110:41]
  assign io_idu2EXU_bits_memValid = contrGen_io_memValid; // @[IDU.scala 111:41]
  assign io_idu2EXU_bits_memOP = contrGen_io_memOP; // @[IDU.scala 112:41]
  assign io_idu2EXU_bits_rs1Index = instReg[19:15]; // @[IDU.scala 56:31]
  assign io_idu2EXU_bits_ecall = contrGen_io_ecall; // @[IDU.scala 114:33]
  assign io_idu2EXU_bits_mret = contrGen_io_mret; // @[IDU.scala 115:33]
  assign io_idu2EXU_bits_csrEn = contrGen_io_csrEn; // @[IDU.scala 116:33]
  assign io_idu2EXU_bits_csrWr = contrGen_io_csrWr; // @[IDU.scala 117:33]
  assign io_idu2EXU_bits_csrOP = contrGen_io_csrOP; // @[IDU.scala 118:33]
  assign io_idu2EXU_bits_csrALUOP = contrGen_io_csrALUOP; // @[IDU.scala 119:33]
  assign io_idu2BaseReg_rs1Index = rs1IndexWire[3:0]; // @[IDU.scala 121:29]
  assign io_idu2BaseReg_rs2Index = rs2IndexWire[3:0]; // @[IDU.scala 122:29]
  assign contrGen_io_cmd = io_inst_bits_inst; // @[IDU.scala 69:25]
  assign contrGen_io_opcode = instReg[6:0]; // @[IDU.scala 59:35]
  assign contrGen_io_func3 = instReg[14:12]; // @[IDU.scala 57:35]
  assign contrGen_io_func7 = instReg[31:25]; // @[IDU.scala 54:35]
  assign immGen_io_iImm = instReg[31:20]; // @[IDU.scala 60:35]
  assign immGen_io_sImm = {func7Wire,instReg[11:7]}; // @[Cat.scala 33:92]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[Cat.scala 33:92]
  assign immGen_io_uImm = {instReg[31:12],12'h0}; // @[Cat.scala 33:92]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[Cat.scala 33:92]
  assign immGen_io_immType = contrGen_io_immType; // @[IDU.scala 99:25]
  always @(posedge clock) begin
    if (reset) begin // @[IDU.scala 18:30]
      pcReg <= 32'h80000000; // @[IDU.scala 18:30]
    end else if (io_inst_ready & io_inst_valid) begin // @[IDU.scala 46:42]
      pcReg <= io_inst_bits_pc; // @[IDU.scala 47:21]
    end
    if (reset) begin // @[IDU.scala 19:30]
      instReg <= 32'h0; // @[IDU.scala 19:30]
    end else if (io_inst_ready & io_inst_valid) begin // @[IDU.scala 46:42]
      instReg <= io_inst_bits_inst; // @[IDU.scala 48:21]
    end
    ready2IFUReg <= reset | _GEN_2; // @[IDU.scala 20:{30,30}]
    if (reset) begin // @[IDU.scala 22:30]
      valid2EXUReg <= 1'h0; // @[IDU.scala 22:30]
    end else if (~valid2EXUReg) begin // @[IDU.scala 35:32]
      valid2EXUReg <= _GEN_3;
    end else if (_T_1) begin // @[IDU.scala 40:52]
      valid2EXUReg <= 1'h0; // @[IDU.scala 41:26]
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
  input  [3:0] io_aluCtr,
  output       io_aOrLCtr,
  output       io_lOrRCtr,
  output       io_uOrSCtr,
  output       io_subOrAddCtr
);
  wire  _aluCtrWire_T_1 = io_aluCtr[2:0] == 3'h0; // @[ALUControl.scala 29:33]
  wire  _aluCtrWire_T_3 = io_aluCtr[2:0] == 3'h1; // @[ALUControl.scala 30:33]
  wire  _aluCtrWire_T_5 = io_aluCtr[2:0] == 3'h2; // @[ALUControl.scala 31:33]
  wire  _aluCtrWire_T_7 = io_aluCtr[2:0] == 3'h3; // @[ALUControl.scala 32:33]
  wire  _aluCtrWire_T_9 = io_aluCtr[2:0] == 3'h4; // @[ALUControl.scala 33:33]
  wire  _aluCtrWire_T_11 = io_aluCtr[2:0] == 3'h5; // @[ALUControl.scala 34:33]
  wire  _aluCtrWire_T_13 = io_aluCtr[2:0] == 3'h6; // @[ALUControl.scala 35:33]
  wire  _aluCtrWire_T_15 = io_aluCtr[2:0] == 3'h7; // @[ALUControl.scala 36:33]
  wire [3:0] _aluCtrWire_T_16 = _aluCtrWire_T_15 ? 4'h7 : 4'h8; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_17 = _aluCtrWire_T_13 ? 4'h6 : _aluCtrWire_T_16; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_18 = _aluCtrWire_T_11 ? 4'h5 : _aluCtrWire_T_17; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_19 = _aluCtrWire_T_9 ? 4'h4 : _aluCtrWire_T_18; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_20 = _aluCtrWire_T_7 ? 4'h3 : _aluCtrWire_T_19; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_21 = _aluCtrWire_T_5 ? 4'h2 : _aluCtrWire_T_20; // @[Mux.scala 101:16]
  wire [3:0] _aluCtrWire_T_22 = _aluCtrWire_T_3 ? 4'h1 : _aluCtrWire_T_21; // @[Mux.scala 101:16]
  wire [3:0] aluCtrWire = _aluCtrWire_T_1 ? 4'h0 : _aluCtrWire_T_22; // @[Mux.scala 101:16]
  wire  _GEN_1 = ~io_aluCtr[3] ? 1'h0 : 1'h1; // @[ALUControl.scala 45:52 49:49 54:49]
  wire  _GEN_12 = 4'h4 == aluCtrWire ? 1'h0 : 4'h5 == aluCtrWire & _GEN_1; // @[ALUControl.scala 43:28 83:41]
  wire  _GEN_14 = 4'h3 == aluCtrWire ? 1'h0 : _GEN_12; // @[ALUControl.scala 43:28 77:41]
  wire  _GEN_16 = 4'h2 == aluCtrWire ? 1'h0 : _GEN_14; // @[ALUControl.scala 43:28]
  wire  _GEN_20 = 4'h1 == aluCtrWire ? 1'h0 : _GEN_16; // @[ALUControl.scala 43:28 58:41]
  wire  _GEN_22 = 4'h1 == aluCtrWire ? 1'h0 : 4'h2 == aluCtrWire & _GEN_1; // @[ALUControl.scala 43:28 60:41]
  wire  _GEN_23 = 4'h1 == aluCtrWire ? 1'h0 : 4'h2 == aluCtrWire; // @[ALUControl.scala 43:28 61:41]
  assign io_aOrLCtr = 4'h0 == aluCtrWire ? 1'h0 : _GEN_20; // @[ALUControl.scala 43:28]
  assign io_lOrRCtr = 4'h0 == aluCtrWire ? 1'h0 : 4'h1 == aluCtrWire; // @[ALUControl.scala 43:28]
  assign io_uOrSCtr = 4'h0 == aluCtrWire ? 1'h0 : _GEN_22; // @[ALUControl.scala 43:28]
  assign io_subOrAddCtr = 4'h0 == aluCtrWire ? _GEN_1 : _GEN_23; // @[ALUControl.scala 43:28]
endmodule
module Shifter(
  input         io_lOrR,
  input         io_aOrL,
  input  [31:0] io_dIn,
  input  [4:0]  io_shamt,
  output [31:0] io_dOut
);
  wire [62:0] _GEN_0 = {{31'd0}, io_dIn}; // @[ALU.scala 111:42]
  wire [62:0] leftShiftedDataWire = _GEN_0 << io_shamt; // @[ALU.scala 111:42]
  wire [31:0] _rightShiftedDataWire_T_3 = $signed(io_dIn) >>> io_shamt; // @[ALU.scala 113:45]
  wire [31:0] _rightShiftedDataWire_T_4 = io_dIn >> io_shamt; // @[ALU.scala 114:25]
  wire [31:0] rightShiftedDataWire = io_aOrL ? _rightShiftedDataWire_T_3 : _rightShiftedDataWire_T_4; // @[ALU.scala 112:39]
  wire [62:0] _io_dOut_T_1 = io_lOrR ? leftShiftedDataWire : {{31'd0}, rightShiftedDataWire}; // @[ALU.scala 117:23]
  assign io_dOut = _io_dOut_T_1[31:0]; // @[ALU.scala 117:17]
endmodule
module FullAdder(
  input   io_a,
  input   io_b,
  input   io_cin,
  output  io_s,
  output  io_p,
  output  io_g
);
  assign io_s = io_a ^ io_b ^ io_cin; // @[BaseALU.scala 17:29]
  assign io_p = io_a | io_b; // @[BaseALU.scala 18:22]
  assign io_g = io_a & io_b; // @[BaseALU.scala 19:22]
endmodule
module CLAGen(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input         io_cin,
  output        io_cout,
  output [31:0] io_sum
);
  wire  FullAdder_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_1_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_2_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_3_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_4_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_5_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_6_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_7_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_8_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_9_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_10_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_11_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_12_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_13_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_14_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_15_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_16_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_17_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_18_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_19_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_20_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_21_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_22_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_23_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_24_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_25_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_26_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_27_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_28_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_29_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_30_io_g; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_a; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_b; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_cin; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_s; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_p; // @[BaseALU.scala 108:42]
  wire  FullAdder_31_io_g; // @[BaseALU.scala 108:42]
  wire  adders_0_p = FullAdder_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_0_g = FullAdder_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_1 = adders_0_g | adders_0_p & io_cin; // @[BaseALU.scala 124:24]
  wire  adders_1_p = FullAdder_1_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_1_g = FullAdder_1_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_2 = adders_1_g | adders_1_p & cs_1; // @[BaseALU.scala 124:24]
  wire  adders_2_p = FullAdder_2_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_2_g = FullAdder_2_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_3 = adders_2_g | adders_2_p & cs_2; // @[BaseALU.scala 124:24]
  wire  adders_3_p = FullAdder_3_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_3_g = FullAdder_3_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_4 = adders_3_g | adders_3_p & cs_3; // @[BaseALU.scala 124:24]
  wire  adders_4_p = FullAdder_4_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_4_g = FullAdder_4_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_5 = adders_4_g | adders_4_p & cs_4; // @[BaseALU.scala 124:24]
  wire  adders_5_p = FullAdder_5_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_5_g = FullAdder_5_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_6 = adders_5_g | adders_5_p & cs_5; // @[BaseALU.scala 124:24]
  wire  adders_6_p = FullAdder_6_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_6_g = FullAdder_6_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_7 = adders_6_g | adders_6_p & cs_6; // @[BaseALU.scala 124:24]
  wire  adders_7_p = FullAdder_7_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_7_g = FullAdder_7_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_8 = adders_7_g | adders_7_p & cs_7; // @[BaseALU.scala 124:24]
  wire  adders_8_p = FullAdder_8_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_8_g = FullAdder_8_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_9 = adders_8_g | adders_8_p & cs_8; // @[BaseALU.scala 124:24]
  wire  adders_9_p = FullAdder_9_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_9_g = FullAdder_9_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_10 = adders_9_g | adders_9_p & cs_9; // @[BaseALU.scala 124:24]
  wire  adders_10_p = FullAdder_10_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_10_g = FullAdder_10_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_11 = adders_10_g | adders_10_p & cs_10; // @[BaseALU.scala 124:24]
  wire  adders_11_p = FullAdder_11_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_11_g = FullAdder_11_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_12 = adders_11_g | adders_11_p & cs_11; // @[BaseALU.scala 124:24]
  wire  adders_12_p = FullAdder_12_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_12_g = FullAdder_12_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_13 = adders_12_g | adders_12_p & cs_12; // @[BaseALU.scala 124:24]
  wire  adders_13_p = FullAdder_13_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_13_g = FullAdder_13_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_14 = adders_13_g | adders_13_p & cs_13; // @[BaseALU.scala 124:24]
  wire  adders_14_p = FullAdder_14_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_14_g = FullAdder_14_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_15 = adders_14_g | adders_14_p & cs_14; // @[BaseALU.scala 124:24]
  wire  adders_15_p = FullAdder_15_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_15_g = FullAdder_15_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_16 = adders_15_g | adders_15_p & cs_15; // @[BaseALU.scala 124:24]
  wire  adders_16_p = FullAdder_16_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_16_g = FullAdder_16_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_17 = adders_16_g | adders_16_p & cs_16; // @[BaseALU.scala 124:24]
  wire  adders_17_p = FullAdder_17_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_17_g = FullAdder_17_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_18 = adders_17_g | adders_17_p & cs_17; // @[BaseALU.scala 124:24]
  wire  adders_18_p = FullAdder_18_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_18_g = FullAdder_18_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_19 = adders_18_g | adders_18_p & cs_18; // @[BaseALU.scala 124:24]
  wire  adders_19_p = FullAdder_19_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_19_g = FullAdder_19_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_20 = adders_19_g | adders_19_p & cs_19; // @[BaseALU.scala 124:24]
  wire  adders_20_p = FullAdder_20_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_20_g = FullAdder_20_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_21 = adders_20_g | adders_20_p & cs_20; // @[BaseALU.scala 124:24]
  wire  adders_21_p = FullAdder_21_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_21_g = FullAdder_21_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_22 = adders_21_g | adders_21_p & cs_21; // @[BaseALU.scala 124:24]
  wire  adders_22_p = FullAdder_22_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_22_g = FullAdder_22_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_23 = adders_22_g | adders_22_p & cs_22; // @[BaseALU.scala 124:24]
  wire  adders_23_p = FullAdder_23_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_23_g = FullAdder_23_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_24 = adders_23_g | adders_23_p & cs_23; // @[BaseALU.scala 124:24]
  wire  adders_24_p = FullAdder_24_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_24_g = FullAdder_24_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_25 = adders_24_g | adders_24_p & cs_24; // @[BaseALU.scala 124:24]
  wire  adders_25_p = FullAdder_25_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_25_g = FullAdder_25_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_26 = adders_25_g | adders_25_p & cs_25; // @[BaseALU.scala 124:24]
  wire  adders_26_p = FullAdder_26_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_26_g = FullAdder_26_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_27 = adders_26_g | adders_26_p & cs_26; // @[BaseALU.scala 124:24]
  wire  adders_27_p = FullAdder_27_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_27_g = FullAdder_27_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_28 = adders_27_g | adders_27_p & cs_27; // @[BaseALU.scala 124:24]
  wire  adders_28_p = FullAdder_28_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_28_g = FullAdder_28_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_29 = adders_28_g | adders_28_p & cs_28; // @[BaseALU.scala 124:24]
  wire  adders_29_p = FullAdder_29_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_29_g = FullAdder_29_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_30 = adders_29_g | adders_29_p & cs_29; // @[BaseALU.scala 124:24]
  wire  adders_30_p = FullAdder_30_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_30_g = FullAdder_30_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  cs_31 = adders_30_g | adders_30_p & cs_30; // @[BaseALU.scala 124:24]
  wire  adders_31_p = FullAdder_31_io_p; // @[BaseALU.scala 108:{23,23}]
  wire  adders_31_g = FullAdder_31_io_g; // @[BaseALU.scala 108:{23,23}]
  wire  adders_1_s = FullAdder_1_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_0_s = FullAdder_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_3_s = FullAdder_3_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_2_s = FullAdder_2_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_5_s = FullAdder_5_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_4_s = FullAdder_4_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_7_s = FullAdder_7_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_6_s = FullAdder_6_io_s; // @[BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_lo_lo = {adders_7_s,adders_6_s,adders_5_s,adders_4_s,adders_3_s,adders_2_s,adders_1_s,adders_0_s}; // @[BaseALU.scala 127:18]
  wire  adders_9_s = FullAdder_9_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_8_s = FullAdder_8_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_11_s = FullAdder_11_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_10_s = FullAdder_10_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_13_s = FullAdder_13_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_12_s = FullAdder_12_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_15_s = FullAdder_15_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_14_s = FullAdder_14_io_s; // @[BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_lo = {adders_15_s,adders_14_s,adders_13_s,adders_12_s,adders_11_s,adders_10_s,adders_9_s,adders_8_s
    ,io_sum_lo_lo}; // @[BaseALU.scala 127:18]
  wire  adders_17_s = FullAdder_17_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_16_s = FullAdder_16_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_19_s = FullAdder_19_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_18_s = FullAdder_18_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_21_s = FullAdder_21_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_20_s = FullAdder_20_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_23_s = FullAdder_23_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_22_s = FullAdder_22_io_s; // @[BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_hi_lo = {adders_23_s,adders_22_s,adders_21_s,adders_20_s,adders_19_s,adders_18_s,adders_17_s,
    adders_16_s}; // @[BaseALU.scala 127:18]
  wire  adders_25_s = FullAdder_25_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_24_s = FullAdder_24_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_27_s = FullAdder_27_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_26_s = FullAdder_26_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_29_s = FullAdder_29_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_28_s = FullAdder_28_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_31_s = FullAdder_31_io_s; // @[BaseALU.scala 108:{23,23}]
  wire  adders_30_s = FullAdder_30_io_s; // @[BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_hi = {adders_31_s,adders_30_s,adders_29_s,adders_28_s,adders_27_s,adders_26_s,adders_25_s,
    adders_24_s,io_sum_hi_lo}; // @[BaseALU.scala 127:18]
  FullAdder FullAdder ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_cin(FullAdder_io_cin),
    .io_s(FullAdder_io_s),
    .io_p(FullAdder_io_p),
    .io_g(FullAdder_io_g)
  );
  FullAdder FullAdder_1 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_cin(FullAdder_1_io_cin),
    .io_s(FullAdder_1_io_s),
    .io_p(FullAdder_1_io_p),
    .io_g(FullAdder_1_io_g)
  );
  FullAdder FullAdder_2 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_cin(FullAdder_2_io_cin),
    .io_s(FullAdder_2_io_s),
    .io_p(FullAdder_2_io_p),
    .io_g(FullAdder_2_io_g)
  );
  FullAdder FullAdder_3 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_cin(FullAdder_3_io_cin),
    .io_s(FullAdder_3_io_s),
    .io_p(FullAdder_3_io_p),
    .io_g(FullAdder_3_io_g)
  );
  FullAdder FullAdder_4 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_4_io_a),
    .io_b(FullAdder_4_io_b),
    .io_cin(FullAdder_4_io_cin),
    .io_s(FullAdder_4_io_s),
    .io_p(FullAdder_4_io_p),
    .io_g(FullAdder_4_io_g)
  );
  FullAdder FullAdder_5 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_5_io_a),
    .io_b(FullAdder_5_io_b),
    .io_cin(FullAdder_5_io_cin),
    .io_s(FullAdder_5_io_s),
    .io_p(FullAdder_5_io_p),
    .io_g(FullAdder_5_io_g)
  );
  FullAdder FullAdder_6 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_6_io_a),
    .io_b(FullAdder_6_io_b),
    .io_cin(FullAdder_6_io_cin),
    .io_s(FullAdder_6_io_s),
    .io_p(FullAdder_6_io_p),
    .io_g(FullAdder_6_io_g)
  );
  FullAdder FullAdder_7 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_7_io_a),
    .io_b(FullAdder_7_io_b),
    .io_cin(FullAdder_7_io_cin),
    .io_s(FullAdder_7_io_s),
    .io_p(FullAdder_7_io_p),
    .io_g(FullAdder_7_io_g)
  );
  FullAdder FullAdder_8 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_8_io_a),
    .io_b(FullAdder_8_io_b),
    .io_cin(FullAdder_8_io_cin),
    .io_s(FullAdder_8_io_s),
    .io_p(FullAdder_8_io_p),
    .io_g(FullAdder_8_io_g)
  );
  FullAdder FullAdder_9 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_9_io_a),
    .io_b(FullAdder_9_io_b),
    .io_cin(FullAdder_9_io_cin),
    .io_s(FullAdder_9_io_s),
    .io_p(FullAdder_9_io_p),
    .io_g(FullAdder_9_io_g)
  );
  FullAdder FullAdder_10 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_10_io_a),
    .io_b(FullAdder_10_io_b),
    .io_cin(FullAdder_10_io_cin),
    .io_s(FullAdder_10_io_s),
    .io_p(FullAdder_10_io_p),
    .io_g(FullAdder_10_io_g)
  );
  FullAdder FullAdder_11 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_11_io_a),
    .io_b(FullAdder_11_io_b),
    .io_cin(FullAdder_11_io_cin),
    .io_s(FullAdder_11_io_s),
    .io_p(FullAdder_11_io_p),
    .io_g(FullAdder_11_io_g)
  );
  FullAdder FullAdder_12 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_12_io_a),
    .io_b(FullAdder_12_io_b),
    .io_cin(FullAdder_12_io_cin),
    .io_s(FullAdder_12_io_s),
    .io_p(FullAdder_12_io_p),
    .io_g(FullAdder_12_io_g)
  );
  FullAdder FullAdder_13 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_13_io_a),
    .io_b(FullAdder_13_io_b),
    .io_cin(FullAdder_13_io_cin),
    .io_s(FullAdder_13_io_s),
    .io_p(FullAdder_13_io_p),
    .io_g(FullAdder_13_io_g)
  );
  FullAdder FullAdder_14 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_14_io_a),
    .io_b(FullAdder_14_io_b),
    .io_cin(FullAdder_14_io_cin),
    .io_s(FullAdder_14_io_s),
    .io_p(FullAdder_14_io_p),
    .io_g(FullAdder_14_io_g)
  );
  FullAdder FullAdder_15 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_15_io_a),
    .io_b(FullAdder_15_io_b),
    .io_cin(FullAdder_15_io_cin),
    .io_s(FullAdder_15_io_s),
    .io_p(FullAdder_15_io_p),
    .io_g(FullAdder_15_io_g)
  );
  FullAdder FullAdder_16 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_16_io_a),
    .io_b(FullAdder_16_io_b),
    .io_cin(FullAdder_16_io_cin),
    .io_s(FullAdder_16_io_s),
    .io_p(FullAdder_16_io_p),
    .io_g(FullAdder_16_io_g)
  );
  FullAdder FullAdder_17 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_17_io_a),
    .io_b(FullAdder_17_io_b),
    .io_cin(FullAdder_17_io_cin),
    .io_s(FullAdder_17_io_s),
    .io_p(FullAdder_17_io_p),
    .io_g(FullAdder_17_io_g)
  );
  FullAdder FullAdder_18 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_18_io_a),
    .io_b(FullAdder_18_io_b),
    .io_cin(FullAdder_18_io_cin),
    .io_s(FullAdder_18_io_s),
    .io_p(FullAdder_18_io_p),
    .io_g(FullAdder_18_io_g)
  );
  FullAdder FullAdder_19 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_19_io_a),
    .io_b(FullAdder_19_io_b),
    .io_cin(FullAdder_19_io_cin),
    .io_s(FullAdder_19_io_s),
    .io_p(FullAdder_19_io_p),
    .io_g(FullAdder_19_io_g)
  );
  FullAdder FullAdder_20 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_20_io_a),
    .io_b(FullAdder_20_io_b),
    .io_cin(FullAdder_20_io_cin),
    .io_s(FullAdder_20_io_s),
    .io_p(FullAdder_20_io_p),
    .io_g(FullAdder_20_io_g)
  );
  FullAdder FullAdder_21 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_21_io_a),
    .io_b(FullAdder_21_io_b),
    .io_cin(FullAdder_21_io_cin),
    .io_s(FullAdder_21_io_s),
    .io_p(FullAdder_21_io_p),
    .io_g(FullAdder_21_io_g)
  );
  FullAdder FullAdder_22 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_22_io_a),
    .io_b(FullAdder_22_io_b),
    .io_cin(FullAdder_22_io_cin),
    .io_s(FullAdder_22_io_s),
    .io_p(FullAdder_22_io_p),
    .io_g(FullAdder_22_io_g)
  );
  FullAdder FullAdder_23 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_23_io_a),
    .io_b(FullAdder_23_io_b),
    .io_cin(FullAdder_23_io_cin),
    .io_s(FullAdder_23_io_s),
    .io_p(FullAdder_23_io_p),
    .io_g(FullAdder_23_io_g)
  );
  FullAdder FullAdder_24 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_24_io_a),
    .io_b(FullAdder_24_io_b),
    .io_cin(FullAdder_24_io_cin),
    .io_s(FullAdder_24_io_s),
    .io_p(FullAdder_24_io_p),
    .io_g(FullAdder_24_io_g)
  );
  FullAdder FullAdder_25 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_25_io_a),
    .io_b(FullAdder_25_io_b),
    .io_cin(FullAdder_25_io_cin),
    .io_s(FullAdder_25_io_s),
    .io_p(FullAdder_25_io_p),
    .io_g(FullAdder_25_io_g)
  );
  FullAdder FullAdder_26 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_26_io_a),
    .io_b(FullAdder_26_io_b),
    .io_cin(FullAdder_26_io_cin),
    .io_s(FullAdder_26_io_s),
    .io_p(FullAdder_26_io_p),
    .io_g(FullAdder_26_io_g)
  );
  FullAdder FullAdder_27 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_27_io_a),
    .io_b(FullAdder_27_io_b),
    .io_cin(FullAdder_27_io_cin),
    .io_s(FullAdder_27_io_s),
    .io_p(FullAdder_27_io_p),
    .io_g(FullAdder_27_io_g)
  );
  FullAdder FullAdder_28 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_28_io_a),
    .io_b(FullAdder_28_io_b),
    .io_cin(FullAdder_28_io_cin),
    .io_s(FullAdder_28_io_s),
    .io_p(FullAdder_28_io_p),
    .io_g(FullAdder_28_io_g)
  );
  FullAdder FullAdder_29 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_29_io_a),
    .io_b(FullAdder_29_io_b),
    .io_cin(FullAdder_29_io_cin),
    .io_s(FullAdder_29_io_s),
    .io_p(FullAdder_29_io_p),
    .io_g(FullAdder_29_io_g)
  );
  FullAdder FullAdder_30 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_30_io_a),
    .io_b(FullAdder_30_io_b),
    .io_cin(FullAdder_30_io_cin),
    .io_s(FullAdder_30_io_s),
    .io_p(FullAdder_30_io_p),
    .io_g(FullAdder_30_io_g)
  );
  FullAdder FullAdder_31 ( // @[BaseALU.scala 108:42]
    .io_a(FullAdder_31_io_a),
    .io_b(FullAdder_31_io_b),
    .io_cin(FullAdder_31_io_cin),
    .io_s(FullAdder_31_io_s),
    .io_p(FullAdder_31_io_p),
    .io_g(FullAdder_31_io_g)
  );
  assign io_cout = adders_31_g | adders_31_p & cs_31; // @[BaseALU.scala 124:24]
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[BaseALU.scala 127:18]
  assign FullAdder_io_a = io_a[0]; // @[BaseALU.scala 118:24]
  assign FullAdder_io_b = io_b[0]; // @[BaseALU.scala 119:24]
  assign FullAdder_io_cin = io_cin; // @[BaseALU.scala 113:16 115:9]
  assign FullAdder_1_io_a = io_a[1]; // @[BaseALU.scala 118:24]
  assign FullAdder_1_io_b = io_b[1]; // @[BaseALU.scala 119:24]
  assign FullAdder_1_io_cin = adders_0_g | adders_0_p & io_cin; // @[BaseALU.scala 124:24]
  assign FullAdder_2_io_a = io_a[2]; // @[BaseALU.scala 118:24]
  assign FullAdder_2_io_b = io_b[2]; // @[BaseALU.scala 119:24]
  assign FullAdder_2_io_cin = adders_1_g | adders_1_p & cs_1; // @[BaseALU.scala 124:24]
  assign FullAdder_3_io_a = io_a[3]; // @[BaseALU.scala 118:24]
  assign FullAdder_3_io_b = io_b[3]; // @[BaseALU.scala 119:24]
  assign FullAdder_3_io_cin = adders_2_g | adders_2_p & cs_2; // @[BaseALU.scala 124:24]
  assign FullAdder_4_io_a = io_a[4]; // @[BaseALU.scala 118:24]
  assign FullAdder_4_io_b = io_b[4]; // @[BaseALU.scala 119:24]
  assign FullAdder_4_io_cin = adders_3_g | adders_3_p & cs_3; // @[BaseALU.scala 124:24]
  assign FullAdder_5_io_a = io_a[5]; // @[BaseALU.scala 118:24]
  assign FullAdder_5_io_b = io_b[5]; // @[BaseALU.scala 119:24]
  assign FullAdder_5_io_cin = adders_4_g | adders_4_p & cs_4; // @[BaseALU.scala 124:24]
  assign FullAdder_6_io_a = io_a[6]; // @[BaseALU.scala 118:24]
  assign FullAdder_6_io_b = io_b[6]; // @[BaseALU.scala 119:24]
  assign FullAdder_6_io_cin = adders_5_g | adders_5_p & cs_5; // @[BaseALU.scala 124:24]
  assign FullAdder_7_io_a = io_a[7]; // @[BaseALU.scala 118:24]
  assign FullAdder_7_io_b = io_b[7]; // @[BaseALU.scala 119:24]
  assign FullAdder_7_io_cin = adders_6_g | adders_6_p & cs_6; // @[BaseALU.scala 124:24]
  assign FullAdder_8_io_a = io_a[8]; // @[BaseALU.scala 118:24]
  assign FullAdder_8_io_b = io_b[8]; // @[BaseALU.scala 119:24]
  assign FullAdder_8_io_cin = adders_7_g | adders_7_p & cs_7; // @[BaseALU.scala 124:24]
  assign FullAdder_9_io_a = io_a[9]; // @[BaseALU.scala 118:24]
  assign FullAdder_9_io_b = io_b[9]; // @[BaseALU.scala 119:24]
  assign FullAdder_9_io_cin = adders_8_g | adders_8_p & cs_8; // @[BaseALU.scala 124:24]
  assign FullAdder_10_io_a = io_a[10]; // @[BaseALU.scala 118:24]
  assign FullAdder_10_io_b = io_b[10]; // @[BaseALU.scala 119:24]
  assign FullAdder_10_io_cin = adders_9_g | adders_9_p & cs_9; // @[BaseALU.scala 124:24]
  assign FullAdder_11_io_a = io_a[11]; // @[BaseALU.scala 118:24]
  assign FullAdder_11_io_b = io_b[11]; // @[BaseALU.scala 119:24]
  assign FullAdder_11_io_cin = adders_10_g | adders_10_p & cs_10; // @[BaseALU.scala 124:24]
  assign FullAdder_12_io_a = io_a[12]; // @[BaseALU.scala 118:24]
  assign FullAdder_12_io_b = io_b[12]; // @[BaseALU.scala 119:24]
  assign FullAdder_12_io_cin = adders_11_g | adders_11_p & cs_11; // @[BaseALU.scala 124:24]
  assign FullAdder_13_io_a = io_a[13]; // @[BaseALU.scala 118:24]
  assign FullAdder_13_io_b = io_b[13]; // @[BaseALU.scala 119:24]
  assign FullAdder_13_io_cin = adders_12_g | adders_12_p & cs_12; // @[BaseALU.scala 124:24]
  assign FullAdder_14_io_a = io_a[14]; // @[BaseALU.scala 118:24]
  assign FullAdder_14_io_b = io_b[14]; // @[BaseALU.scala 119:24]
  assign FullAdder_14_io_cin = adders_13_g | adders_13_p & cs_13; // @[BaseALU.scala 124:24]
  assign FullAdder_15_io_a = io_a[15]; // @[BaseALU.scala 118:24]
  assign FullAdder_15_io_b = io_b[15]; // @[BaseALU.scala 119:24]
  assign FullAdder_15_io_cin = adders_14_g | adders_14_p & cs_14; // @[BaseALU.scala 124:24]
  assign FullAdder_16_io_a = io_a[16]; // @[BaseALU.scala 118:24]
  assign FullAdder_16_io_b = io_b[16]; // @[BaseALU.scala 119:24]
  assign FullAdder_16_io_cin = adders_15_g | adders_15_p & cs_15; // @[BaseALU.scala 124:24]
  assign FullAdder_17_io_a = io_a[17]; // @[BaseALU.scala 118:24]
  assign FullAdder_17_io_b = io_b[17]; // @[BaseALU.scala 119:24]
  assign FullAdder_17_io_cin = adders_16_g | adders_16_p & cs_16; // @[BaseALU.scala 124:24]
  assign FullAdder_18_io_a = io_a[18]; // @[BaseALU.scala 118:24]
  assign FullAdder_18_io_b = io_b[18]; // @[BaseALU.scala 119:24]
  assign FullAdder_18_io_cin = adders_17_g | adders_17_p & cs_17; // @[BaseALU.scala 124:24]
  assign FullAdder_19_io_a = io_a[19]; // @[BaseALU.scala 118:24]
  assign FullAdder_19_io_b = io_b[19]; // @[BaseALU.scala 119:24]
  assign FullAdder_19_io_cin = adders_18_g | adders_18_p & cs_18; // @[BaseALU.scala 124:24]
  assign FullAdder_20_io_a = io_a[20]; // @[BaseALU.scala 118:24]
  assign FullAdder_20_io_b = io_b[20]; // @[BaseALU.scala 119:24]
  assign FullAdder_20_io_cin = adders_19_g | adders_19_p & cs_19; // @[BaseALU.scala 124:24]
  assign FullAdder_21_io_a = io_a[21]; // @[BaseALU.scala 118:24]
  assign FullAdder_21_io_b = io_b[21]; // @[BaseALU.scala 119:24]
  assign FullAdder_21_io_cin = adders_20_g | adders_20_p & cs_20; // @[BaseALU.scala 124:24]
  assign FullAdder_22_io_a = io_a[22]; // @[BaseALU.scala 118:24]
  assign FullAdder_22_io_b = io_b[22]; // @[BaseALU.scala 119:24]
  assign FullAdder_22_io_cin = adders_21_g | adders_21_p & cs_21; // @[BaseALU.scala 124:24]
  assign FullAdder_23_io_a = io_a[23]; // @[BaseALU.scala 118:24]
  assign FullAdder_23_io_b = io_b[23]; // @[BaseALU.scala 119:24]
  assign FullAdder_23_io_cin = adders_22_g | adders_22_p & cs_22; // @[BaseALU.scala 124:24]
  assign FullAdder_24_io_a = io_a[24]; // @[BaseALU.scala 118:24]
  assign FullAdder_24_io_b = io_b[24]; // @[BaseALU.scala 119:24]
  assign FullAdder_24_io_cin = adders_23_g | adders_23_p & cs_23; // @[BaseALU.scala 124:24]
  assign FullAdder_25_io_a = io_a[25]; // @[BaseALU.scala 118:24]
  assign FullAdder_25_io_b = io_b[25]; // @[BaseALU.scala 119:24]
  assign FullAdder_25_io_cin = adders_24_g | adders_24_p & cs_24; // @[BaseALU.scala 124:24]
  assign FullAdder_26_io_a = io_a[26]; // @[BaseALU.scala 118:24]
  assign FullAdder_26_io_b = io_b[26]; // @[BaseALU.scala 119:24]
  assign FullAdder_26_io_cin = adders_25_g | adders_25_p & cs_25; // @[BaseALU.scala 124:24]
  assign FullAdder_27_io_a = io_a[27]; // @[BaseALU.scala 118:24]
  assign FullAdder_27_io_b = io_b[27]; // @[BaseALU.scala 119:24]
  assign FullAdder_27_io_cin = adders_26_g | adders_26_p & cs_26; // @[BaseALU.scala 124:24]
  assign FullAdder_28_io_a = io_a[28]; // @[BaseALU.scala 118:24]
  assign FullAdder_28_io_b = io_b[28]; // @[BaseALU.scala 119:24]
  assign FullAdder_28_io_cin = adders_27_g | adders_27_p & cs_27; // @[BaseALU.scala 124:24]
  assign FullAdder_29_io_a = io_a[29]; // @[BaseALU.scala 118:24]
  assign FullAdder_29_io_b = io_b[29]; // @[BaseALU.scala 119:24]
  assign FullAdder_29_io_cin = adders_28_g | adders_28_p & cs_28; // @[BaseALU.scala 124:24]
  assign FullAdder_30_io_a = io_a[30]; // @[BaseALU.scala 118:24]
  assign FullAdder_30_io_b = io_b[30]; // @[BaseALU.scala 119:24]
  assign FullAdder_30_io_cin = adders_29_g | adders_29_p & cs_29; // @[BaseALU.scala 124:24]
  assign FullAdder_31_io_a = io_a[31]; // @[BaseALU.scala 118:24]
  assign FullAdder_31_io_b = io_b[31]; // @[BaseALU.scala 119:24]
  assign FullAdder_31_io_cin = adders_30_g | adders_30_p & cs_30; // @[BaseALU.scala 124:24]
endmodule
module ALUAdder(
  input         io_subOrAdd,
  input  [31:0] io_srcAData,
  input  [31:0] io_srcBData,
  output        io_carry,
  output        io_zero,
  output        io_overflow,
  output [31:0] io_result
);
  wire [31:0] cla32Add_io_a; // @[ALU.scala 84:33]
  wire [31:0] cla32Add_io_b; // @[ALU.scala 84:33]
  wire  cla32Add_io_cin; // @[ALU.scala 84:33]
  wire  cla32Add_io_cout; // @[ALU.scala 84:33]
  wire [31:0] cla32Add_io_sum; // @[ALU.scala 84:33]
  wire [30:0] _subOrAddWire_T_1 = io_subOrAdd ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 77:12]
  wire [31:0] subOrAddWire = {_subOrAddWire_T_1,io_subOrAdd}; // @[Cat.scala 33:92]
  wire [31:0] bXorCIn = io_srcBData ^ subOrAddWire; // @[ALU.scala 88:36]
  wire  _aOverflow_T_5 = cla32Add_io_sum[31] != io_srcAData[31]; // @[ALU.scala 95:83]
  wire  aOverflow = io_srcAData[31] == io_srcBData[31] & cla32Add_io_sum[31] != io_srcAData[31]; // @[ALU.scala 95:59]
  wire  sOverflow = io_srcAData[31] == bXorCIn[31] & _aOverflow_T_5; // @[ALU.scala 96:58]
  CLAGen cla32Add ( // @[ALU.scala 84:33]
    .io_a(cla32Add_io_a),
    .io_b(cla32Add_io_b),
    .io_cin(cla32Add_io_cin),
    .io_cout(cla32Add_io_cout),
    .io_sum(cla32Add_io_sum)
  );
  assign io_carry = cla32Add_io_cout; // @[ALU.scala 93:33]
  assign io_zero = cla32Add_io_sum == 32'h0; // @[ALU.scala 94:56]
  assign io_overflow = io_subOrAdd ? sOverflow : aOverflow; // @[ALU.scala 97:39]
  assign io_result = cla32Add_io_sum; // @[ALU.scala 98:33]
  assign cla32Add_io_a = io_srcAData; // @[ALU.scala 90:25]
  assign cla32Add_io_b = io_srcBData ^ subOrAddWire; // @[ALU.scala 91:37]
  assign cla32Add_io_cin = io_subOrAdd; // @[ALU.scala 92:25]
endmodule
module ALU(
  input  [3:0]  io_aluCtr,
  input  [31:0] io_srcAData,
  input  [31:0] io_srcBData,
  output        io_less,
  output        io_zero,
  output [31:0] io_aluOut
);
  wire [3:0] aluControl_io_aluCtr; // @[ALU.scala 19:49]
  wire  aluControl_io_aOrLCtr; // @[ALU.scala 19:49]
  wire  aluControl_io_lOrRCtr; // @[ALU.scala 19:49]
  wire  aluControl_io_uOrSCtr; // @[ALU.scala 19:49]
  wire  aluControl_io_subOrAddCtr; // @[ALU.scala 19:49]
  wire  shifter_io_lOrR; // @[ALU.scala 27:57]
  wire  shifter_io_aOrL; // @[ALU.scala 27:57]
  wire [31:0] shifter_io_dIn; // @[ALU.scala 27:57]
  wire [4:0] shifter_io_shamt; // @[ALU.scala 27:57]
  wire [31:0] shifter_io_dOut; // @[ALU.scala 27:57]
  wire  aluAdder_io_subOrAdd; // @[ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcAData; // @[ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcBData; // @[ALU.scala 34:49]
  wire  aluAdder_io_carry; // @[ALU.scala 34:49]
  wire  aluAdder_io_zero; // @[ALU.scala 34:49]
  wire  aluAdder_io_overflow; // @[ALU.scala 34:49]
  wire [31:0] aluAdder_io_result; // @[ALU.scala 34:49]
  wire [2:0] aluCtrWire = io_aluCtr[2:0]; // @[ALU.scala 21:52]
  wire  _lessWire_T_3 = aluAdder_io_overflow ^ aluAdder_io_result[31]; // @[ALU.scala 44:77]
  wire  lessWire = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[ALU.scala 43:46]
  wire [31:0] sltDataWire = {31'h0,lessWire}; // @[Cat.scala 33:92]
  wire [31:0] xorDataWire = io_srcAData ^ io_srcBData; // @[ALU.scala 49:55]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[ALU.scala 50:55]
  wire [31:0] andDataWire = io_srcAData & io_srcBData; // @[ALU.scala 51:55]
  wire  _aluOutWire_T_1 = aluCtrWire == 3'h0; // @[ALU.scala 53:29]
  wire  _aluOutWire_T_4 = aluCtrWire == 3'h1; // @[ALU.scala 54:29]
  wire  _aluOutWire_T_7 = aluCtrWire == 3'h2; // @[ALU.scala 55:29]
  wire  _aluOutWire_T_10 = aluCtrWire == 3'h3; // @[ALU.scala 56:29]
  wire  _aluOutWire_T_13 = aluCtrWire == 3'h4; // @[ALU.scala 57:29]
  wire  _aluOutWire_T_16 = aluCtrWire == 3'h5; // @[ALU.scala 58:29]
  wire  _aluOutWire_T_19 = aluCtrWire == 3'h6; // @[ALU.scala 59:29]
  wire  _aluOutWire_T_22 = aluCtrWire == 3'h7; // @[ALU.scala 60:29]
  wire [31:0] _aluOutWire_T_24 = _aluOutWire_T_22 ? andDataWire : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_25 = _aluOutWire_T_19 ? orDataWire : _aluOutWire_T_24; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_26 = _aluOutWire_T_16 ? shifter_io_dOut : _aluOutWire_T_25; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_27 = _aluOutWire_T_13 ? xorDataWire : _aluOutWire_T_26; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_28 = _aluOutWire_T_10 ? io_srcBData : _aluOutWire_T_27; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_29 = _aluOutWire_T_7 ? sltDataWire : _aluOutWire_T_28; // @[Mux.scala 101:16]
  wire [31:0] _aluOutWire_T_30 = _aluOutWire_T_4 ? shifter_io_dOut : _aluOutWire_T_29; // @[Mux.scala 101:16]
  ALUControl aluControl ( // @[ALU.scala 19:49]
    .io_aluCtr(aluControl_io_aluCtr),
    .io_aOrLCtr(aluControl_io_aOrLCtr),
    .io_lOrRCtr(aluControl_io_lOrRCtr),
    .io_uOrSCtr(aluControl_io_uOrSCtr),
    .io_subOrAddCtr(aluControl_io_subOrAddCtr)
  );
  Shifter shifter ( // @[ALU.scala 27:57]
    .io_lOrR(shifter_io_lOrR),
    .io_aOrL(shifter_io_aOrL),
    .io_dIn(shifter_io_dIn),
    .io_shamt(shifter_io_shamt),
    .io_dOut(shifter_io_dOut)
  );
  ALUAdder aluAdder ( // @[ALU.scala 34:49]
    .io_subOrAdd(aluAdder_io_subOrAdd),
    .io_srcAData(aluAdder_io_srcAData),
    .io_srcBData(aluAdder_io_srcBData),
    .io_carry(aluAdder_io_carry),
    .io_zero(aluAdder_io_zero),
    .io_overflow(aluAdder_io_overflow),
    .io_result(aluAdder_io_result)
  );
  assign io_less = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[ALU.scala 43:46]
  assign io_zero = aluAdder_io_zero; // @[ALU.scala 64:25]
  assign io_aluOut = _aluOutWire_T_1 ? aluAdder_io_result : _aluOutWire_T_30; // @[Mux.scala 101:16]
  assign aluControl_io_aluCtr = io_aluCtr; // @[ALU.scala 20:33]
  assign shifter_io_lOrR = aluControl_io_lOrRCtr; // @[ALU.scala 28:41]
  assign shifter_io_aOrL = aluControl_io_aOrLCtr; // @[ALU.scala 29:41]
  assign shifter_io_dIn = io_srcAData; // @[ALU.scala 30:41]
  assign shifter_io_shamt = io_srcBData[4:0]; // @[ALU.scala 31:55]
  assign aluAdder_io_subOrAdd = aluControl_io_subOrAddCtr; // @[ALU.scala 35:33]
  assign aluAdder_io_srcAData = io_srcAData; // @[ALU.scala 36:33]
  assign aluAdder_io_srcBData = io_srcBData; // @[ALU.scala 37:33]
endmodule
module CSRALU(
  input  [31:0] io_srcAData,
  input  [31:0] io_srcBData,
  input  [1:0]  io_csrALUOP,
  output [31:0] io_oData
);
  wire [31:0] _andNotDataWire_T = ~io_srcBData; // @[CSRALU.scala 20:43]
  wire [31:0] andNotDataWire = io_srcAData & _andNotDataWire_T; // @[CSRALU.scala 20:40]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[CSRALU.scala 21:40]
  wire  _io_oData_T = io_csrALUOP == 2'h0; // @[CSRALU.scala 24:23]
  wire  _io_oData_T_2 = io_csrALUOP == 2'h1; // @[CSRALU.scala 25:23]
  wire  _io_oData_T_4 = io_csrALUOP == 2'h2; // @[CSRALU.scala 26:23]
  wire [31:0] _io_oData_T_6 = _io_oData_T_4 ? io_srcBData : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_oData_T_7 = _io_oData_T_2 ? orDataWire : _io_oData_T_6; // @[Mux.scala 101:16]
  assign io_oData = _io_oData_T ? andNotDataWire : _io_oData_T_7; // @[Mux.scala 101:16]
endmodule
module EXU(
  input         clock,
  input         reset,
  output        io_idu2EXU_ready,
  input         io_idu2EXU_valid,
  input  [31:0] io_idu2EXU_bits_pc,
  input  [31:0] io_idu2EXU_bits_rs1Data,
  input  [31:0] io_idu2EXU_bits_rs2Data,
  input  [31:0] io_idu2EXU_bits_imm,
  input  [31:0] io_idu2EXU_bits_inst,
  input         io_idu2EXU_bits_regWR,
  input  [1:0]  io_idu2EXU_bits_srcAALU,
  input  [1:0]  io_idu2EXU_bits_srcBALU,
  input  [3:0]  io_idu2EXU_bits_ctrALU,
  input  [3:0]  io_idu2EXU_bits_branch,
  input  [1:0]  io_idu2EXU_bits_toReg,
  input         io_idu2EXU_bits_memWR,
  input         io_idu2EXU_bits_memValid,
  input  [2:0]  io_idu2EXU_bits_memOP,
  input  [4:0]  io_idu2EXU_bits_rs1Index,
  input         io_idu2EXU_bits_ecall,
  input         io_idu2EXU_bits_mret,
  input         io_idu2EXU_bits_csrEn,
  input         io_idu2EXU_bits_csrWr,
  input         io_idu2EXU_bits_csrOP,
  input  [1:0]  io_idu2EXU_bits_csrALUOP,
  input         io_exu2WBU_ready,
  output        io_exu2WBU_valid,
  output [31:0] io_exu2WBU_bits_pc,
  output [31:0] io_exu2WBU_bits_memData,
  output [31:0] io_exu2WBU_bits_aluData,
  output [31:0] io_exu2WBU_bits_csrWData,
  output [31:0] io_exu2WBU_bits_csrData,
  output [31:0] io_exu2WBU_bits_immData,
  output [31:0] io_exu2WBU_bits_rs1Data,
  output [31:0] io_exu2WBU_bits_inst,
  output        io_exu2WBU_bits_regWR,
  output        io_exu2WBU_bits_memWR,
  output        io_exu2WBU_bits_memValid,
  output [2:0]  io_exu2WBU_bits_memOP,
  output [1:0]  io_exu2WBU_bits_toReg,
  output [3:0]  io_exu2WBU_bits_branchCtr,
  output        io_exu2WBU_bits_less,
  output        io_exu2WBU_bits_zero,
  output        io_exu2WBU_bits_ecall,
  output        io_exu2WBU_bits_csrEn,
  output        io_exu2WBU_bits_csrWr,
  input  [31:0] io_exu2CSR_csrData,
  output        io_exu2CSR_mret,
  output        io_exu2CSR_ecall,
  output [11:0] io_exu2CSR_csr
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] alu_io_aluCtr; // @[EXU.scala 130:25]
  wire [31:0] alu_io_srcAData; // @[EXU.scala 130:25]
  wire [31:0] alu_io_srcBData; // @[EXU.scala 130:25]
  wire  alu_io_less; // @[EXU.scala 130:25]
  wire  alu_io_zero; // @[EXU.scala 130:25]
  wire [31:0] alu_io_aluOut; // @[EXU.scala 130:25]
  wire [31:0] csrALU_io_srcAData; // @[EXU.scala 140:41]
  wire [31:0] csrALU_io_srcBData; // @[EXU.scala 140:41]
  wire [1:0] csrALU_io_csrALUOP; // @[EXU.scala 140:41]
  wire [31:0] csrALU_io_oData; // @[EXU.scala 140:41]
  reg [31:0] pcReg; // @[EXU.scala 22:42]
  reg [31:0] rs1DataReg; // @[EXU.scala 23:34]
  reg [31:0] rs2DataReg; // @[EXU.scala 24:34]
  reg [31:0] immDataWire; // @[EXU.scala 25:42]
  reg [31:0] instReg; // @[EXU.scala 26:34]
  reg  regWRReg; // @[EXU.scala 28:34]
  reg [1:0] aluASrcCtrWire; // @[EXU.scala 29:34]
  reg [1:0] aluBSrcCtrWire; // @[EXU.scala 30:34]
  reg [3:0] aluCtrWire; // @[EXU.scala 31:34]
  reg [3:0] branchCtrWire; // @[EXU.scala 32:34]
  reg [1:0] memToRegCtrWire; // @[EXU.scala 33:34]
  reg  memWRCtrWire; // @[EXU.scala 34:34]
  reg  memValidCtrWire; // @[EXU.scala 35:34]
  reg [2:0] memOPCtrWire; // @[EXU.scala 36:34]
  reg [4:0] rs1IndexReg; // @[EXU.scala 37:34]
  reg  ecallReg; // @[EXU.scala 38:34]
  reg  mretReg; // @[EXU.scala 39:34]
  reg  csrEnReg; // @[EXU.scala 40:34]
  reg  csrWrReg; // @[EXU.scala 41:34]
  reg  csrOPReg; // @[EXU.scala 42:34]
  reg [1:0] csrALUOPReg; // @[EXU.scala 43:34]
  reg  ready2IDUReg; // @[EXU.scala 45:34]
  reg  valid2WBUReg; // @[EXU.scala 47:30]
  reg [1:0] state; // @[EXU.scala 52:28]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[EXU.scala 54:55]
  wire [1:0] _state_T_3 = io_idu2EXU_valid ? 2'h2 : 2'h1; // @[EXU.scala 55:73]
  wire  _GEN_0 = state == 2'h2 ? 1'h0 : ready2IDUReg; // @[EXU.scala 65:49 66:30 45:34]
  wire  _GEN_1 = state == 2'h2 | valid2WBUReg; // @[EXU.scala 47:30 65:49 67:30]
  wire  _GEN_2 = state == 2'h1 | _GEN_0; // @[EXU.scala 62:49 63:30]
  wire  _GEN_4 = state == 2'h0 | _GEN_2; // @[EXU.scala 59:32 60:30]
  wire  _srcADataWire_T = aluASrcCtrWire == 2'h0; // @[EXU.scala 122:33]
  wire  _srcADataWire_T_2 = aluASrcCtrWire == 2'h1; // @[EXU.scala 123:33]
  wire [31:0] _srcADataWire_T_4 = _srcADataWire_T_2 ? pcReg : 32'h0; // @[Mux.scala 101:16]
  wire  _srcBDataWire_T = aluBSrcCtrWire == 2'h0; // @[EXU.scala 126:33]
  wire  _srcBDataWire_T_2 = aluBSrcCtrWire == 2'h1; // @[EXU.scala 127:33]
  wire  _srcBDataWire_T_4 = aluBSrcCtrWire == 2'h2; // @[EXU.scala 128:33]
  wire [31:0] _srcBDataWire_T_6 = _srcBDataWire_T_4 ? 32'h4 : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _srcBDataWire_T_7 = _srcBDataWire_T_2 ? immDataWire : _srcBDataWire_T_6; // @[Mux.scala 101:16]
  ALU alu ( // @[EXU.scala 130:25]
    .io_aluCtr(alu_io_aluCtr),
    .io_srcAData(alu_io_srcAData),
    .io_srcBData(alu_io_srcBData),
    .io_less(alu_io_less),
    .io_zero(alu_io_zero),
    .io_aluOut(alu_io_aluOut)
  );
  CSRALU csrALU ( // @[EXU.scala 140:41]
    .io_srcAData(csrALU_io_srcAData),
    .io_srcBData(csrALU_io_srcBData),
    .io_csrALUOP(csrALU_io_csrALUOP),
    .io_oData(csrALU_io_oData)
  );
  assign io_idu2EXU_ready = ready2IDUReg; // @[EXU.scala 46:40]
  assign io_exu2WBU_valid = valid2WBUReg; // @[EXU.scala 48:37]
  assign io_exu2WBU_bits_pc = pcReg; // @[EXU.scala 147:49]
  assign io_exu2WBU_bits_memData = rs2DataReg; // @[EXU.scala 148:41]
  assign io_exu2WBU_bits_aluData = alu_io_aluOut; // @[EXU.scala 149:41]
  assign io_exu2WBU_bits_csrWData = csrALU_io_oData; // @[EXU.scala 150:41]
  assign io_exu2WBU_bits_csrData = io_exu2CSR_csrData; // @[EXU.scala 151:41]
  assign io_exu2WBU_bits_immData = immDataWire; // @[EXU.scala 152:41]
  assign io_exu2WBU_bits_rs1Data = rs1DataReg; // @[EXU.scala 153:41]
  assign io_exu2WBU_bits_inst = instReg; // @[EXU.scala 154:41]
  assign io_exu2WBU_bits_regWR = regWRReg; // @[EXU.scala 156:41]
  assign io_exu2WBU_bits_memWR = memWRCtrWire; // @[EXU.scala 157:41]
  assign io_exu2WBU_bits_memValid = memValidCtrWire; // @[EXU.scala 158:41]
  assign io_exu2WBU_bits_memOP = memOPCtrWire; // @[EXU.scala 159:41]
  assign io_exu2WBU_bits_toReg = memToRegCtrWire; // @[EXU.scala 160:41]
  assign io_exu2WBU_bits_branchCtr = branchCtrWire; // @[EXU.scala 161:41]
  assign io_exu2WBU_bits_less = alu_io_less; // @[EXU.scala 162:41]
  assign io_exu2WBU_bits_zero = alu_io_zero; // @[EXU.scala 163:41]
  assign io_exu2WBU_bits_ecall = ecallReg; // @[EXU.scala 164:41]
  assign io_exu2WBU_bits_csrEn = csrEnReg; // @[EXU.scala 165:41]
  assign io_exu2WBU_bits_csrWr = csrWrReg; // @[EXU.scala 166:41]
  assign io_exu2CSR_mret = mretReg; // @[EXU.scala 169:49]
  assign io_exu2CSR_ecall = ecallReg; // @[EXU.scala 170:49]
  assign io_exu2CSR_csr = instReg[31:20]; // @[EXU.scala 168:60]
  assign alu_io_aluCtr = aluCtrWire; // @[EXU.scala 132:33]
  assign alu_io_srcAData = _srcADataWire_T ? rs1DataReg : _srcADataWire_T_4; // @[Mux.scala 101:16]
  assign alu_io_srcBData = _srcBDataWire_T ? rs2DataReg : _srcBDataWire_T_7; // @[Mux.scala 101:16]
  assign csrALU_io_srcAData = io_exu2CSR_csrData; // @[EXU.scala 142:33]
  assign csrALU_io_srcBData = csrOPReg ? {{27'd0}, rs1IndexReg} : rs1DataReg; // @[EXU.scala 143:39]
  assign csrALU_io_csrALUOP = csrALUOPReg; // @[EXU.scala 144:33]
  always @(posedge clock) begin
    if (reset) begin // @[EXU.scala 22:42]
      pcReg <= 32'h80000000; // @[EXU.scala 22:42]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      pcReg <= io_idu2EXU_bits_pc; // @[EXU.scala 72:25]
    end
    if (reset) begin // @[EXU.scala 23:34]
      rs1DataReg <= 32'h0; // @[EXU.scala 23:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      rs1DataReg <= io_idu2EXU_bits_rs1Data; // @[EXU.scala 73:33]
    end
    if (reset) begin // @[EXU.scala 24:34]
      rs2DataReg <= 32'h0; // @[EXU.scala 24:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      rs2DataReg <= io_idu2EXU_bits_rs2Data; // @[EXU.scala 74:33]
    end
    if (reset) begin // @[EXU.scala 25:42]
      immDataWire <= 32'h0; // @[EXU.scala 25:42]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      immDataWire <= io_idu2EXU_bits_imm; // @[EXU.scala 75:33]
    end
    if (reset) begin // @[EXU.scala 26:34]
      instReg <= 32'h0; // @[EXU.scala 26:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      instReg <= io_idu2EXU_bits_inst; // @[EXU.scala 76:33]
    end
    if (reset) begin // @[EXU.scala 28:34]
      regWRReg <= 1'h0; // @[EXU.scala 28:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      regWRReg <= io_idu2EXU_bits_regWR; // @[EXU.scala 78:33]
    end
    if (reset) begin // @[EXU.scala 29:34]
      aluASrcCtrWire <= 2'h0; // @[EXU.scala 29:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      aluASrcCtrWire <= io_idu2EXU_bits_srcAALU; // @[EXU.scala 79:33]
    end
    if (reset) begin // @[EXU.scala 30:34]
      aluBSrcCtrWire <= 2'h0; // @[EXU.scala 30:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      aluBSrcCtrWire <= io_idu2EXU_bits_srcBALU; // @[EXU.scala 80:33]
    end
    if (reset) begin // @[EXU.scala 31:34]
      aluCtrWire <= 4'h0; // @[EXU.scala 31:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      aluCtrWire <= io_idu2EXU_bits_ctrALU; // @[EXU.scala 81:33]
    end
    if (reset) begin // @[EXU.scala 32:34]
      branchCtrWire <= 4'h0; // @[EXU.scala 32:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      branchCtrWire <= io_idu2EXU_bits_branch; // @[EXU.scala 82:33]
    end
    if (reset) begin // @[EXU.scala 33:34]
      memToRegCtrWire <= 2'h0; // @[EXU.scala 33:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      memToRegCtrWire <= io_idu2EXU_bits_toReg; // @[EXU.scala 83:33]
    end
    if (reset) begin // @[EXU.scala 34:34]
      memWRCtrWire <= 1'h0; // @[EXU.scala 34:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      memWRCtrWire <= io_idu2EXU_bits_memWR; // @[EXU.scala 84:33]
    end
    if (reset) begin // @[EXU.scala 35:34]
      memValidCtrWire <= 1'h0; // @[EXU.scala 35:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      memValidCtrWire <= io_idu2EXU_bits_memValid; // @[EXU.scala 85:33]
    end
    if (reset) begin // @[EXU.scala 36:34]
      memOPCtrWire <= 3'h0; // @[EXU.scala 36:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      memOPCtrWire <= io_idu2EXU_bits_memOP; // @[EXU.scala 86:33]
    end
    if (reset) begin // @[EXU.scala 37:34]
      rs1IndexReg <= 5'h0; // @[EXU.scala 37:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      rs1IndexReg <= io_idu2EXU_bits_rs1Index; // @[EXU.scala 87:33]
    end
    if (reset) begin // @[EXU.scala 38:34]
      ecallReg <= 1'h0; // @[EXU.scala 38:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      ecallReg <= io_idu2EXU_bits_ecall; // @[EXU.scala 88:33]
    end
    if (reset) begin // @[EXU.scala 39:34]
      mretReg <= 1'h0; // @[EXU.scala 39:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      mretReg <= io_idu2EXU_bits_mret; // @[EXU.scala 89:33]
    end
    if (reset) begin // @[EXU.scala 40:34]
      csrEnReg <= 1'h0; // @[EXU.scala 40:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      csrEnReg <= io_idu2EXU_bits_csrEn; // @[EXU.scala 90:33]
    end
    if (reset) begin // @[EXU.scala 41:34]
      csrWrReg <= 1'h0; // @[EXU.scala 41:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      csrWrReg <= io_idu2EXU_bits_csrWr; // @[EXU.scala 91:33]
    end
    if (reset) begin // @[EXU.scala 42:34]
      csrOPReg <= 1'h0; // @[EXU.scala 42:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      csrOPReg <= io_idu2EXU_bits_csrOP; // @[EXU.scala 92:33]
    end
    if (reset) begin // @[EXU.scala 43:34]
      csrALUOPReg <= 2'h0; // @[EXU.scala 43:34]
    end else if (io_idu2EXU_ready & io_idu2EXU_valid) begin // @[EXU.scala 71:52]
      csrALUOPReg <= io_idu2EXU_bits_csrALUOP; // @[EXU.scala 93:33]
    end
    ready2IDUReg <= reset | _GEN_4; // @[EXU.scala 45:{34,34}]
    if (reset) begin // @[EXU.scala 47:30]
      valid2WBUReg <= 1'h0; // @[EXU.scala 47:30]
    end else if (state == 2'h0) begin // @[EXU.scala 59:32]
      valid2WBUReg <= 1'h0; // @[EXU.scala 61:30]
    end else if (state == 2'h1) begin // @[EXU.scala 62:49]
      valid2WBUReg <= 1'h0; // @[EXU.scala 64:30]
    end else begin
      valid2WBUReg <= _GEN_1;
    end
    if (reset) begin // @[EXU.scala 52:28]
      state <= 2'h0; // @[EXU.scala 52:28]
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[EXU.scala 56:47]
        state <= 2'h0;
      end else if (io_exu2WBU_ready) begin // @[EXU.scala 56:73]
        state <= 2'h0;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[EXU.scala 55:47]
        state <= 2'h0;
      end else begin
        state <= _state_T_3;
      end
    end else if (2'h0 == state) begin // @[Mux.scala 81:58]
      state <= _state_T_1;
    end else begin
      state <= 2'h0;
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
  immDataWire = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  instReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regWRReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  aluASrcCtrWire = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  aluBSrcCtrWire = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  aluCtrWire = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  branchCtrWire = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  memToRegCtrWire = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  memWRCtrWire = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  memValidCtrWire = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  memOPCtrWire = _RAND_13[2:0];
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BranchCond(
  input  [3:0] io_branch,
  input        io_less,
  input        io_zero,
  output [1:0] io_pcASrc,
  output [1:0] io_pcBSrc
);
  wire  _io_pcASrc_T = io_branch == 4'h0; // @[WBU.scala 272:29]
  wire  _io_pcASrc_T_2 = io_branch == 4'h1; // @[WBU.scala 273:29]
  wire  _io_pcASrc_T_4 = io_branch == 4'h2; // @[WBU.scala 274:29]
  wire  _io_pcASrc_T_6 = io_branch == 4'h4; // @[WBU.scala 275:29]
  wire  _io_pcASrc_T_7 = ~io_zero; // @[WBU.scala 275:45]
  wire  _io_pcASrc_T_8 = io_branch == 4'h4 & ~io_zero; // @[WBU.scala 275:43]
  wire  _io_pcASrc_T_11 = _io_pcASrc_T_6 & io_zero; // @[WBU.scala 276:43]
  wire  _io_pcASrc_T_13 = io_branch == 4'h5; // @[WBU.scala 277:29]
  wire  _io_pcASrc_T_15 = io_branch == 4'h5 & _io_pcASrc_T_7; // @[WBU.scala 277:43]
  wire  _io_pcASrc_T_18 = _io_pcASrc_T_13 & io_zero; // @[WBU.scala 278:43]
  wire  _io_pcASrc_T_20 = io_branch == 4'h6; // @[WBU.scala 279:29]
  wire  _io_pcASrc_T_21 = ~io_less; // @[WBU.scala 279:45]
  wire  _io_pcASrc_T_22 = io_branch == 4'h6 & ~io_less; // @[WBU.scala 279:43]
  wire  _io_pcASrc_T_25 = _io_pcASrc_T_20 & io_less; // @[WBU.scala 280:43]
  wire  _io_pcASrc_T_27 = io_branch == 4'h7; // @[WBU.scala 281:29]
  wire  _io_pcASrc_T_29 = io_branch == 4'h7 & _io_pcASrc_T_21; // @[WBU.scala 281:43]
  wire  _io_pcASrc_T_32 = _io_pcASrc_T_27 & io_less; // @[WBU.scala 282:43]
  wire  _io_pcASrc_T_34 = io_branch == 4'h8; // @[WBU.scala 283:29]
  wire [1:0] _io_pcASrc_T_36 = _io_pcASrc_T_34 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_37 = _io_pcASrc_T_32 ? 2'h0 : _io_pcASrc_T_36; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_38 = _io_pcASrc_T_29 ? 2'h1 : _io_pcASrc_T_37; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_39 = _io_pcASrc_T_25 ? 2'h1 : _io_pcASrc_T_38; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_40 = _io_pcASrc_T_22 ? 2'h0 : _io_pcASrc_T_39; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_41 = _io_pcASrc_T_18 ? 2'h0 : _io_pcASrc_T_40; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_42 = _io_pcASrc_T_15 ? 2'h1 : _io_pcASrc_T_41; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_43 = _io_pcASrc_T_11 ? 2'h1 : _io_pcASrc_T_42; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_44 = _io_pcASrc_T_8 ? 2'h0 : _io_pcASrc_T_43; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_45 = _io_pcASrc_T_4 ? 2'h1 : _io_pcASrc_T_44; // @[Mux.scala 101:16]
  wire [1:0] _io_pcASrc_T_46 = _io_pcASrc_T_2 ? 2'h1 : _io_pcASrc_T_45; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_34 = _io_pcASrc_T_29 ? 2'h0 : _io_pcASrc_T_36; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_35 = _io_pcASrc_T_25 ? 2'h0 : _io_pcBSrc_T_34; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_36 = _io_pcASrc_T_22 ? 2'h0 : _io_pcBSrc_T_35; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_37 = _io_pcASrc_T_18 ? 2'h0 : _io_pcBSrc_T_36; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_38 = _io_pcASrc_T_15 ? 2'h0 : _io_pcBSrc_T_37; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_39 = _io_pcASrc_T_11 ? 2'h0 : _io_pcBSrc_T_38; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_40 = _io_pcASrc_T_8 ? 2'h0 : _io_pcBSrc_T_39; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_41 = _io_pcASrc_T_4 ? 2'h1 : _io_pcBSrc_T_40; // @[Mux.scala 101:16]
  wire [1:0] _io_pcBSrc_T_42 = _io_pcASrc_T_2 ? 2'h0 : _io_pcBSrc_T_41; // @[Mux.scala 101:16]
  assign io_pcASrc = _io_pcASrc_T ? 2'h0 : _io_pcASrc_T_46; // @[Mux.scala 101:16]
  assign io_pcBSrc = _io_pcASrc_T ? 2'h0 : _io_pcBSrc_T_42; // @[Mux.scala 101:16]
endmodule
module WBU(
  input         clock,
  input         reset,
  output        io_exu2WBU_ready,
  input         io_exu2WBU_valid,
  input  [31:0] io_exu2WBU_bits_pc,
  input  [31:0] io_exu2WBU_bits_memData,
  input  [31:0] io_exu2WBU_bits_aluData,
  input  [31:0] io_exu2WBU_bits_csrWData,
  input  [31:0] io_exu2WBU_bits_csrData,
  input  [31:0] io_exu2WBU_bits_immData,
  input  [31:0] io_exu2WBU_bits_rs1Data,
  input  [31:0] io_exu2WBU_bits_inst,
  input         io_exu2WBU_bits_regWR,
  input         io_exu2WBU_bits_memWR,
  input         io_exu2WBU_bits_memValid,
  input  [2:0]  io_exu2WBU_bits_memOP,
  input  [1:0]  io_exu2WBU_bits_toReg,
  input  [3:0]  io_exu2WBU_bits_branchCtr,
  input         io_exu2WBU_bits_less,
  input         io_exu2WBU_bits_zero,
  input         io_exu2WBU_bits_ecall,
  input         io_exu2WBU_bits_csrEn,
  input         io_exu2WBU_bits_csrWr,
  output [31:0] io_wbu2CSR_pc,
  output [31:0] io_wbu2CSR_csrWData,
  output [11:0] io_wbu2CSR_csr,
  output        io_wbu2CSR_ecall,
  output        io_wbu2CSR_csrEn,
  output        io_wbu2CSR_csrWr,
  output [3:0]  io_wbu2BaseReg_rdIndex,
  output [31:0] io_wbu2BaseReg_data,
  output        io_wbu2BaseReg_regWR,
  output        io_wbu2Mem_aclk,
  output        io_wbu2Mem_aresetn,
  output [31:0] io_wbu2Mem_arAddr,
  output        io_wbu2Mem_arValid,
  input         io_wbu2Mem_arReady,
  input  [31:0] io_wbu2Mem_rData,
  input         io_wbu2Mem_rValid,
  output        io_wbu2Mem_rReady,
  output [31:0] io_wbu2Mem_awAddr,
  output        io_wbu2Mem_awValid,
  input         io_wbu2Mem_awReady,
  output [31:0] io_wbu2Mem_wData,
  output [3:0]  io_wbu2Mem_wStrb,
  output        io_wbu2Mem_wValid,
  input         io_wbu2Mem_wReady,
  input         io_wbu2Mem_bValid,
  output        io_wbu2Mem_bReady,
  input         io_wbu2PC_ready,
  output        io_wbu2PC_valid,
  output [31:0] io_wbu2PC_bits_nextPC
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] branchCond_io_branch; // @[WBU.scala 109:41]
  wire  branchCond_io_less; // @[WBU.scala 109:41]
  wire  branchCond_io_zero; // @[WBU.scala 109:41]
  wire [1:0] branchCond_io_pcASrc; // @[WBU.scala 109:41]
  wire [1:0] branchCond_io_pcBSrc; // @[WBU.scala 109:41]
  wire  resetnWire = ~reset; // @[WBU.scala 23:35]
  reg [31:0] pcReg; // @[WBU.scala 25:42]
  reg [31:0] memDataReg; // @[WBU.scala 26:42]
  reg [31:0] aluDataReg; // @[WBU.scala 27:42]
  reg [31:0] csrWDataReg; // @[WBU.scala 28:42]
  reg [31:0] csrDataReg; // @[WBU.scala 29:42]
  reg [31:0] immDataReg; // @[WBU.scala 30:38]
  reg [31:0] rs1DataReg; // @[WBU.scala 31:38]
  reg [31:0] instReg; // @[WBU.scala 32:42]
  reg  regWRReg; // @[WBU.scala 34:34]
  reg [2:0] memOPReg; // @[WBU.scala 37:42]
  reg [1:0] toRegReg; // @[WBU.scala 38:42]
  reg [3:0] branchCtrReg; // @[WBU.scala 39:42]
  reg  lessReg; // @[WBU.scala 40:42]
  reg  zeroReg; // @[WBU.scala 41:42]
  reg  ecallReg; // @[WBU.scala 42:42]
  reg  csrEnReg; // @[WBU.scala 43:42]
  reg  csrWrReg; // @[WBU.scala 44:42]
  reg  ready2EXUReg; // @[WBU.scala 66:30]
  reg  validPC2Reg; // @[WBU.scala 68:34]
  wire  _T = io_exu2WBU_ready & io_exu2WBU_valid; // @[WBU.scala 72:31]
  wire  _wMaskWire_T = memOPReg == 3'h0; // @[WBU.scala 94:28]
  wire  _wMaskWire_T_2 = memOPReg == 3'h1; // @[WBU.scala 95:28]
  wire  _wMaskWire_T_4 = memOPReg == 3'h2; // @[WBU.scala 96:28]
  wire  _wMaskWire_T_6 = memOPReg == 3'h5; // @[WBU.scala 97:28]
  wire [3:0] _wMaskWire_T_11 = _wMaskWire_T_6 ? 4'h3 : 4'h1; // @[Mux.scala 101:16]
  wire [3:0] _wMaskWire_T_12 = _wMaskWire_T_4 ? 4'hf : _wMaskWire_T_11; // @[Mux.scala 101:16]
  wire [3:0] _wMaskWire_T_13 = _wMaskWire_T_2 ? 4'h3 : _wMaskWire_T_12; // @[Mux.scala 101:16]
  wire [3:0] wMaskWire = _wMaskWire_T ? 4'h1 : _wMaskWire_T_13; // @[Mux.scala 101:16]
  wire  sOrUWire = _wMaskWire_T | (_wMaskWire_T_2 | _wMaskWire_T_4); // @[Mux.scala 101:16]
  reg  arValidReg; // @[WBU.scala 123:74]
  wire  _signDataWire_T_1 = wMaskWire == 4'h1; // @[WBU.scala 129:28]
  wire [23:0] _signDataWire_T_5 = io_wbu2Mem_rData[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _signDataWire_T_8 = {_signDataWire_T_5,io_wbu2Mem_rData[7:0]}; // @[WBU.scala 129:105]
  wire  _signDataWire_T_9 = wMaskWire == 4'h3; // @[WBU.scala 130:28]
  wire [15:0] _signDataWire_T_13 = io_wbu2Mem_rData[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _signDataWire_T_16 = {_signDataWire_T_13,io_wbu2Mem_rData[15:0]}; // @[WBU.scala 130:107]
  wire  _signDataWire_T_17 = wMaskWire == 4'hf; // @[WBU.scala 131:28]
  wire [31:0] _signDataWire_T_20 = _signDataWire_T_17 ? $signed(io_wbu2Mem_rData) : $signed(io_wbu2Mem_rData); // @[Mux.scala 101:16]
  wire [31:0] _signDataWire_T_21 = _signDataWire_T_9 ? $signed(_signDataWire_T_16) : $signed(_signDataWire_T_20); // @[Mux.scala 101:16]
  reg [31:0] memRdDataReg; // @[WBU.scala 133:74]
  wire [31:0] _memRdDataWire_T_1 = _signDataWire_T_1 ? $signed(_signDataWire_T_8) : $signed(_signDataWire_T_21); // @[WBU.scala 134:101]
  reg  rReadyReg; // @[WBU.scala 137:74]
  wire  _T_2 = ~resetnWire; // @[WBU.scala 139:14]
  wire  _T_5 = io_wbu2Mem_rValid & io_wbu2Mem_rReady; // @[WBU.scala 141:39]
  reg  awValidReg; // @[WBU.scala 146:74]
  reg  wValidReg; // @[WBU.scala 152:74]
  reg  bReadyReg; // @[WBU.scala 158:74]
  wire  _GEN_21 = io_wbu2Mem_arValid & io_wbu2Mem_arReady ? 1'h0 : arValidReg; // @[WBU.scala 166:77 167:33 123:74]
  wire  _GEN_22 = _T & (io_exu2WBU_bits_memValid & ~io_exu2WBU_bits_memWR) | _GEN_21; // @[WBU.scala 164:131 165:33]
  wire  _GEN_24 = io_wbu2Mem_rValid | rReadyReg; // @[WBU.scala 174:40 175:33 137:74]
  wire  _GEN_25 = _T_5 & io_exu2WBU_bits_memValid ? 1'h0 : _GEN_24; // @[WBU.scala 172:103 173:41]
  wire  _GEN_26 = _T_2 | _GEN_25; // @[WBU.scala 170:34 171:33]
  wire  _T_31 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR; // @[WBU.scala 180:93]
  wire  _GEN_27 = io_wbu2Mem_awReady & io_wbu2Mem_awValid ? 1'h0 : awValidReg; // @[WBU.scala 182:70 183:33 146:74]
  wire  _GEN_28 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR | _GEN_27; // @[WBU.scala 180:126 181:33]
  wire  _GEN_30 = io_wbu2Mem_wReady & io_wbu2Mem_wValid ? 1'h0 : wValidReg; // @[WBU.scala 190:68 191:33 152:74]
  wire  _GEN_31 = _T_31 | _GEN_30; // @[WBU.scala 188:126 189:33]
  wire  _GEN_33 = io_wbu2Mem_bValid | bReadyReg; // @[WBU.scala 198:40 199:33 158:74]
  wire  _GEN_34 = io_wbu2Mem_bValid & io_wbu2Mem_bReady ? 1'h0 : _GEN_33; // @[WBU.scala 196:68 197:33]
  wire  _GEN_35 = _T_2 | _GEN_34; // @[WBU.scala 194:34 195:33]
  reg [1:0] state; // @[WBU.scala 205:28]
  wire  memEnd = io_wbu2Mem_wReady & wValidReg | rReadyReg & io_wbu2Mem_rValid; // @[WBU.scala 206:62]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[WBU.scala 208:55]
  wire [1:0] _state_T_4 = io_exu2WBU_bits_memValid ? 2'h2 : 2'h3; // @[WBU.scala 209:95]
  wire [1:0] _state_T_5 = io_exu2WBU_valid ? _state_T_4 : 2'h1; // @[WBU.scala 209:73]
  wire [1:0] _state_T_6 = reset ? 2'h0 : _state_T_5; // @[WBU.scala 209:47]
  wire [1:0] _state_T_8 = memEnd ? 2'h3 : 2'h2; // @[WBU.scala 210:81]
  wire  _GEN_36 = state == 2'h3 ? 1'h0 : ready2EXUReg; // @[WBU.scala 223:51 224:33 66:30]
  wire  _GEN_37 = state == 2'h3 | validPC2Reg; // @[WBU.scala 223:51 225:33 68:34]
  wire  _GEN_38 = state == 2'h2 ? 1'h0 : _GEN_36; // @[WBU.scala 220:42 221:33]
  wire  _GEN_40 = state == 2'h1 | _GEN_38; // @[WBU.scala 217:49 218:33]
  wire  _GEN_42 = state == 2'h0 | _GEN_40; // @[WBU.scala 214:32 215:33]
  wire  _io_wbu2BaseReg_data_T = toRegReg == 2'h0; // @[WBU.scala 237:20]
  wire  _io_wbu2BaseReg_data_T_2 = toRegReg == 2'h1; // @[WBU.scala 238:28]
  wire  _io_wbu2BaseReg_data_T_4 = toRegReg == 2'h2; // @[WBU.scala 239:28]
  wire [31:0] _io_wbu2BaseReg_data_T_6 = _io_wbu2BaseReg_data_T_4 ? csrDataReg : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_wbu2BaseReg_data_T_7 = _io_wbu2BaseReg_data_T_2 ? memRdDataReg : _io_wbu2BaseReg_data_T_6; // @[Mux.scala 101:16]
  wire  _io_wbu2PC_bits_nextPC_T = branchCond_io_pcASrc == 2'h0; // @[WBU.scala 245:21]
  wire  _io_wbu2PC_bits_nextPC_T_2 = branchCond_io_pcASrc == 2'h1; // @[WBU.scala 246:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_7 = _io_wbu2PC_bits_nextPC_T_2 ? immDataReg : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_8 = _io_wbu2PC_bits_nextPC_T ? 32'h4 : _io_wbu2PC_bits_nextPC_T_7; // @[Mux.scala 101:16]
  wire  _io_wbu2PC_bits_nextPC_T_9 = branchCond_io_pcBSrc == 2'h0; // @[WBU.scala 249:21]
  wire  _io_wbu2PC_bits_nextPC_T_11 = branchCond_io_pcBSrc == 2'h1; // @[WBU.scala 250:29]
  wire  _io_wbu2PC_bits_nextPC_T_13 = branchCond_io_pcBSrc == 2'h2; // @[WBU.scala 251:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_15 = _io_wbu2PC_bits_nextPC_T_13 ? csrWDataReg : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_16 = _io_wbu2PC_bits_nextPC_T_11 ? rs1DataReg : _io_wbu2PC_bits_nextPC_T_15; // @[Mux.scala 101:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_17 = _io_wbu2PC_bits_nextPC_T_9 ? pcReg : _io_wbu2PC_bits_nextPC_T_16; // @[Mux.scala 101:16]
  BranchCond branchCond ( // @[WBU.scala 109:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  assign io_exu2WBU_ready = ready2EXUReg; // @[WBU.scala 67:40]
  assign io_wbu2CSR_pc = pcReg; // @[WBU.scala 229:25]
  assign io_wbu2CSR_csrWData = csrWDataReg; // @[WBU.scala 230:25]
  assign io_wbu2CSR_csr = instReg[31:20]; // @[WBU.scala 231:36]
  assign io_wbu2CSR_ecall = ecallReg; // @[WBU.scala 232:25]
  assign io_wbu2CSR_csrEn = csrEnReg; // @[WBU.scala 233:25]
  assign io_wbu2CSR_csrWr = csrWrReg; // @[WBU.scala 234:25]
  assign io_wbu2BaseReg_rdIndex = instReg[10:7]; // @[WBU.scala 241:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? aluDataReg : _io_wbu2BaseReg_data_T_7; // @[Mux.scala 101:16]
  assign io_wbu2BaseReg_regWR = regWRReg; // @[WBU.scala 242:29]
  assign io_wbu2Mem_aclk = clock; // @[WBU.scala 119:39]
  assign io_wbu2Mem_aresetn = ~reset; // @[WBU.scala 23:35]
  assign io_wbu2Mem_arAddr = aluDataReg; // @[WBU.scala 122:33]
  assign io_wbu2Mem_arValid = arValidReg; // @[WBU.scala 124:33]
  assign io_wbu2Mem_rReady = rReadyReg; // @[WBU.scala 138:33]
  assign io_wbu2Mem_awAddr = aluDataReg; // @[WBU.scala 145:33]
  assign io_wbu2Mem_awValid = awValidReg; // @[WBU.scala 147:33]
  assign io_wbu2Mem_wData = memDataReg; // @[WBU.scala 150:33]
  assign io_wbu2Mem_wStrb = _wMaskWire_T ? 4'h1 : _wMaskWire_T_13; // @[Mux.scala 101:16]
  assign io_wbu2Mem_wValid = wValidReg; // @[WBU.scala 153:33]
  assign io_wbu2Mem_bReady = bReadyReg; // @[WBU.scala 159:33]
  assign io_wbu2PC_valid = validPC2Reg; // @[WBU.scala 69:43]
  assign io_wbu2PC_bits_nextPC = _io_wbu2PC_bits_nextPC_T_8 + _io_wbu2PC_bits_nextPC_T_17; // @[WBU.scala 248:8]
  assign branchCond_io_branch = branchCtrReg; // @[WBU.scala 111:29]
  assign branchCond_io_less = lessReg; // @[WBU.scala 112:33]
  assign branchCond_io_zero = zeroReg; // @[WBU.scala 113:33]
  always @(posedge clock) begin
    if (reset) begin // @[WBU.scala 25:42]
      pcReg <= 32'h80000000; // @[WBU.scala 25:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      pcReg <= io_exu2WBU_bits_pc; // @[WBU.scala 73:33]
    end
    if (reset) begin // @[WBU.scala 26:42]
      memDataReg <= 32'h0; // @[WBU.scala 26:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      memDataReg <= io_exu2WBU_bits_memData; // @[WBU.scala 74:33]
    end
    if (reset) begin // @[WBU.scala 27:42]
      aluDataReg <= 32'h0; // @[WBU.scala 27:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      aluDataReg <= io_exu2WBU_bits_aluData; // @[WBU.scala 75:33]
    end
    if (reset) begin // @[WBU.scala 28:42]
      csrWDataReg <= 32'h0; // @[WBU.scala 28:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      csrWDataReg <= io_exu2WBU_bits_csrWData; // @[WBU.scala 76:33]
    end
    if (reset) begin // @[WBU.scala 29:42]
      csrDataReg <= 32'h0; // @[WBU.scala 29:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      csrDataReg <= io_exu2WBU_bits_csrData; // @[WBU.scala 77:33]
    end
    if (reset) begin // @[WBU.scala 30:38]
      immDataReg <= 32'h0; // @[WBU.scala 30:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      immDataReg <= io_exu2WBU_bits_immData; // @[WBU.scala 78:29]
    end
    if (reset) begin // @[WBU.scala 31:38]
      rs1DataReg <= 32'h0; // @[WBU.scala 31:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      rs1DataReg <= io_exu2WBU_bits_rs1Data; // @[WBU.scala 79:29]
    end
    if (reset) begin // @[WBU.scala 32:42]
      instReg <= 32'h0; // @[WBU.scala 32:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      instReg <= io_exu2WBU_bits_inst; // @[WBU.scala 80:33]
    end
    if (reset) begin // @[WBU.scala 34:34]
      regWRReg <= 1'h0; // @[WBU.scala 34:34]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      regWRReg <= io_exu2WBU_bits_regWR; // @[WBU.scala 81:25]
    end
    if (reset) begin // @[WBU.scala 37:42]
      memOPReg <= 3'h0; // @[WBU.scala 37:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      memOPReg <= io_exu2WBU_bits_memOP; // @[WBU.scala 84:33]
    end
    if (reset) begin // @[WBU.scala 38:42]
      toRegReg <= 2'h0; // @[WBU.scala 38:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      toRegReg <= io_exu2WBU_bits_toReg; // @[WBU.scala 85:33]
    end
    if (reset) begin // @[WBU.scala 39:42]
      branchCtrReg <= 4'h0; // @[WBU.scala 39:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      branchCtrReg <= io_exu2WBU_bits_branchCtr; // @[WBU.scala 86:25]
    end
    if (reset) begin // @[WBU.scala 40:42]
      lessReg <= 1'h0; // @[WBU.scala 40:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      lessReg <= io_exu2WBU_bits_less; // @[WBU.scala 87:33]
    end
    if (reset) begin // @[WBU.scala 41:42]
      zeroReg <= 1'h0; // @[WBU.scala 41:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      zeroReg <= io_exu2WBU_bits_zero; // @[WBU.scala 88:33]
    end
    if (reset) begin // @[WBU.scala 42:42]
      ecallReg <= 1'h0; // @[WBU.scala 42:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      ecallReg <= io_exu2WBU_bits_ecall; // @[WBU.scala 89:33]
    end
    if (reset) begin // @[WBU.scala 43:42]
      csrEnReg <= 1'h0; // @[WBU.scala 43:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      csrEnReg <= io_exu2WBU_bits_csrEn; // @[WBU.scala 90:33]
    end
    if (reset) begin // @[WBU.scala 44:42]
      csrWrReg <= 1'h0; // @[WBU.scala 44:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[WBU.scala 72:52]
      csrWrReg <= io_exu2WBU_bits_csrWr; // @[WBU.scala 91:33]
    end
    ready2EXUReg <= reset | _GEN_42; // @[WBU.scala 66:{30,30}]
    if (reset) begin // @[WBU.scala 68:34]
      validPC2Reg <= 1'h0; // @[WBU.scala 68:34]
    end else if (state == 2'h0) begin // @[WBU.scala 214:32]
      validPC2Reg <= 1'h0; // @[WBU.scala 216:33]
    end else if (state == 2'h1) begin // @[WBU.scala 217:49]
      validPC2Reg <= 1'h0; // @[WBU.scala 219:33]
    end else if (state == 2'h2) begin // @[WBU.scala 220:42]
      validPC2Reg <= 1'h0; // @[WBU.scala 222:33]
    end else begin
      validPC2Reg <= _GEN_37;
    end
    if (reset) begin // @[WBU.scala 123:74]
      arValidReg <= 1'h0; // @[WBU.scala 123:74]
    end else if (_T_2) begin // @[WBU.scala 162:34]
      arValidReg <= 1'h0; // @[WBU.scala 163:33]
    end else begin
      arValidReg <= _GEN_22;
    end
    if (reset) begin // @[WBU.scala 133:74]
      memRdDataReg <= 32'h0; // @[WBU.scala 133:74]
    end else if (~resetnWire) begin // @[WBU.scala 139:34]
      memRdDataReg <= 32'h0; // @[WBU.scala 140:33]
    end else if (io_wbu2Mem_rValid & io_wbu2Mem_rReady) begin // @[WBU.scala 141:68]
      if (sOrUWire) begin // @[WBU.scala 134:70]
        memRdDataReg <= _memRdDataWire_T_1;
      end else begin
        memRdDataReg <= io_wbu2Mem_rData;
      end
    end
    rReadyReg <= reset | _GEN_26; // @[WBU.scala 137:{74,74}]
    if (reset) begin // @[WBU.scala 146:74]
      awValidReg <= 1'h0; // @[WBU.scala 146:74]
    end else if (_T_2) begin // @[WBU.scala 178:34]
      awValidReg <= 1'h0; // @[WBU.scala 179:33]
    end else begin
      awValidReg <= _GEN_28;
    end
    if (reset) begin // @[WBU.scala 152:74]
      wValidReg <= 1'h0; // @[WBU.scala 152:74]
    end else if (_T_2) begin // @[WBU.scala 186:34]
      wValidReg <= 1'h0; // @[WBU.scala 187:33]
    end else begin
      wValidReg <= _GEN_31;
    end
    bReadyReg <= reset | _GEN_35; // @[WBU.scala 158:{74,74}]
    if (reset) begin // @[WBU.scala 205:28]
      state <= 2'h0; // @[WBU.scala 205:28]
    end else if (2'h3 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[WBU.scala 211:47]
        state <= 2'h0;
      end else if (io_wbu2PC_ready) begin // @[WBU.scala 211:73]
        state <= 2'h0;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[WBU.scala 210:55]
        state <= 2'h0;
      end else begin
        state <= _state_T_8;
      end
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
      state <= _state_T_6;
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
  memOPReg = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  toRegReg = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  branchCtrReg = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  lessReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  zeroReg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ecallReg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  csrEnReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  csrWrReg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  ready2EXUReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  validPC2Reg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  arValidReg = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  memRdDataReg = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  rReadyReg = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  awValidReg = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  wValidReg = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  bReadyReg = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  state = _RAND_25[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXILiteBusArbiter(
  input         clock,
  input         reset,
  input         io_axiLiteMaster0_aclk,
  input         io_axiLiteMaster0_aresetn,
  input  [31:0] io_axiLiteMaster0_arAddr,
  input         io_axiLiteMaster0_arValid,
  output        io_axiLiteMaster0_arReady,
  output [31:0] io_axiLiteMaster0_rData,
  output        io_axiLiteMaster0_rValid,
  input         io_axiLiteMaster0_rReady,
  input         io_axiLiteMaster1_aclk,
  input         io_axiLiteMaster1_aresetn,
  input  [31:0] io_axiLiteMaster1_arAddr,
  input         io_axiLiteMaster1_arValid,
  output        io_axiLiteMaster1_arReady,
  output [31:0] io_axiLiteMaster1_rData,
  output        io_axiLiteMaster1_rValid,
  input         io_axiLiteMaster1_rReady,
  input  [31:0] io_axiLiteMaster1_awAddr,
  input         io_axiLiteMaster1_awValid,
  output        io_axiLiteMaster1_awReady,
  input  [31:0] io_axiLiteMaster1_wData,
  input  [3:0]  io_axiLiteMaster1_wStrb,
  input         io_axiLiteMaster1_wValid,
  output        io_axiLiteMaster1_wReady,
  output        io_axiLiteMaster1_bValid,
  input         io_axiLiteMaster1_bReady,
  output        io_axiLiteSlave_aclk,
  output        io_axiLiteSlave_aresetn,
  output [31:0] io_axiLiteSlave_arAddr,
  output        io_axiLiteSlave_arValid,
  input         io_axiLiteSlave_arReady,
  input  [31:0] io_axiLiteSlave_rData,
  input         io_axiLiteSlave_rValid,
  output        io_axiLiteSlave_rReady,
  output [31:0] io_axiLiteSlave_awAddr,
  output        io_axiLiteSlave_awValid,
  input         io_axiLiteSlave_awReady,
  output [31:0] io_axiLiteSlave_wData,
  output [3:0]  io_axiLiteSlave_wStrb,
  output        io_axiLiteSlave_wValid,
  input         io_axiLiteSlave_wReady,
  input         io_axiLiteSlave_bValid,
  output        io_axiLiteSlave_bReady
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[Memory.scala 115:22]
  wire  wait2LSUWire = io_axiLiteMaster1_arValid | io_axiLiteMaster1_awValid | io_axiLiteMaster1_wValid; // @[Memory.scala 116:66]
  wire  ifu2WaitWire = io_axiLiteMaster0_rValid & io_axiLiteMaster0_rReady; // @[Memory.scala 118:43]
  wire  lsu2WaitWire = io_axiLiteMaster1_rValid & io_axiLiteMaster1_rReady | io_axiLiteMaster1_wValid &
    io_axiLiteMaster1_wReady; // @[Memory.scala 119:66]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[Memory.scala 121:19]
  wire [1:0] _state_T_3 = io_axiLiteMaster0_arValid ? 2'h2 : 2'h1; // @[Memory.scala 122:75]
  wire [1:0] _state_T_4 = wait2LSUWire ? 2'h3 : _state_T_3; // @[Memory.scala 122:50]
  wire [1:0] _state_T_5 = reset ? 2'h0 : _state_T_4; // @[Memory.scala 122:19]
  wire [1:0] _state_T_7 = ifu2WaitWire ? 2'h1 : 2'h2; // @[Memory.scala 123:50]
  wire  _GEN_0 = state == 2'h3 ? io_axiLiteMaster1_aclk : clock; // @[Memory.scala 141:32 142:21 80:29]
  wire  _GEN_1 = state == 2'h3 ? io_axiLiteMaster1_aresetn : 1'h1 - reset; // @[Memory.scala 141:32 142:21 81:29]
  wire [31:0] _GEN_2 = state == 2'h3 ? io_axiLiteMaster1_arAddr : 32'h0; // @[Memory.scala 141:32 142:21 82:29]
  wire  _GEN_3 = state == 2'h3 & io_axiLiteMaster1_arValid; // @[Memory.scala 141:32 142:21 83:29]
  wire  _GEN_4 = state == 2'h3 & io_axiLiteSlave_arReady; // @[Memory.scala 141:32 142:21 71:29]
  wire [31:0] _GEN_5 = state == 2'h3 ? io_axiLiteSlave_rData : 32'h0; // @[Memory.scala 141:32 142:21 72:29]
  wire  _GEN_7 = state == 2'h3 & io_axiLiteSlave_rValid; // @[Memory.scala 141:32 142:21 74:29]
  wire  _GEN_8 = state == 2'h3 & io_axiLiteMaster1_rReady; // @[Memory.scala 141:32 142:21 84:29]
  wire [31:0] _GEN_9 = state == 2'h3 ? io_axiLiteMaster1_awAddr : 32'h0; // @[Memory.scala 141:32 142:21 85:29]
  wire  _GEN_10 = state == 2'h3 & io_axiLiteMaster1_awValid; // @[Memory.scala 141:32 142:21 86:29]
  wire  _GEN_11 = state == 2'h3 & io_axiLiteSlave_awReady; // @[Memory.scala 141:32 142:21 75:29]
  wire [31:0] _GEN_12 = state == 2'h3 ? io_axiLiteMaster1_wData : 32'h0; // @[Memory.scala 141:32 142:21 87:29]
  wire [3:0] _GEN_13 = state == 2'h3 ? io_axiLiteMaster1_wStrb : 4'h0; // @[Memory.scala 141:32 142:21 88:29]
  wire  _GEN_14 = state == 2'h3 & io_axiLiteMaster1_wValid; // @[Memory.scala 141:32 142:21 89:29]
  wire  _GEN_15 = state == 2'h3 & io_axiLiteSlave_wReady; // @[Memory.scala 141:32 142:21 76:29]
  wire  _GEN_17 = state == 2'h3 & io_axiLiteSlave_bValid; // @[Memory.scala 141:32 142:21 78:29]
  wire  _GEN_18 = state == 2'h3 & io_axiLiteMaster1_bReady; // @[Memory.scala 141:32 142:21 90:29]
  wire  _GEN_19 = state == 2'h2 | state == 2'h1 ? io_axiLiteMaster0_aclk : _GEN_0; // @[Memory.scala 139:52 140:21]
  wire  _GEN_20 = state == 2'h2 | state == 2'h1 ? io_axiLiteMaster0_aresetn : _GEN_1; // @[Memory.scala 139:52 140:21]
  wire [31:0] _GEN_21 = state == 2'h2 | state == 2'h1 ? io_axiLiteMaster0_arAddr : _GEN_2; // @[Memory.scala 139:52 140:21]
  wire  _GEN_22 = state == 2'h2 | state == 2'h1 ? io_axiLiteMaster0_arValid : _GEN_3; // @[Memory.scala 139:52 140:21]
  wire  _GEN_23 = (state == 2'h2 | state == 2'h1) & io_axiLiteSlave_arReady; // @[Memory.scala 139:52 140:21 62:29]
  wire [31:0] _GEN_24 = state == 2'h2 | state == 2'h1 ? io_axiLiteSlave_rData : 32'h0; // @[Memory.scala 139:52 140:21 63:29]
  wire  _GEN_26 = (state == 2'h2 | state == 2'h1) & io_axiLiteSlave_rValid; // @[Memory.scala 139:52 140:21 65:29]
  wire  _GEN_27 = state == 2'h2 | state == 2'h1 ? io_axiLiteMaster0_rReady : _GEN_8; // @[Memory.scala 139:52 140:21]
  wire [31:0] _GEN_28 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_9; // @[Memory.scala 139:52 140:21]
  wire  _GEN_29 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_10; // @[Memory.scala 139:52 140:21]
  wire [31:0] _GEN_31 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_12; // @[Memory.scala 139:52 140:21]
  wire [3:0] _GEN_32 = state == 2'h2 | state == 2'h1 ? 4'hf : _GEN_13; // @[Memory.scala 139:52 140:21]
  wire  _GEN_33 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_14; // @[Memory.scala 139:52 140:21]
  wire  _GEN_37 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_18; // @[Memory.scala 139:52 140:21]
  wire  _GEN_38 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_4; // @[Memory.scala 139:52 71:29]
  wire [31:0] _GEN_39 = state == 2'h2 | state == 2'h1 ? 32'h0 : _GEN_5; // @[Memory.scala 139:52 72:29]
  wire  _GEN_41 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_7; // @[Memory.scala 139:52 74:29]
  wire  _GEN_42 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_11; // @[Memory.scala 139:52 75:29]
  wire  _GEN_43 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_15; // @[Memory.scala 139:52 76:29]
  wire  _GEN_45 = state == 2'h2 | state == 2'h1 ? 1'h0 : _GEN_17; // @[Memory.scala 139:52 78:29]
  assign io_axiLiteMaster0_arReady = state == 2'h0 ? 1'h0 : _GEN_23; // @[Memory.scala 127:26 62:29]
  assign io_axiLiteMaster0_rData = state == 2'h0 ? 32'h0 : _GEN_24; // @[Memory.scala 127:26 63:29]
  assign io_axiLiteMaster0_rValid = state == 2'h0 ? 1'h0 : _GEN_26; // @[Memory.scala 127:26 65:29]
  assign io_axiLiteMaster1_arReady = state == 2'h0 ? 1'h0 : _GEN_38; // @[Memory.scala 127:26 71:29]
  assign io_axiLiteMaster1_rData = state == 2'h0 ? 32'h0 : _GEN_39; // @[Memory.scala 127:26 72:29]
  assign io_axiLiteMaster1_rValid = state == 2'h0 ? 1'h0 : _GEN_41; // @[Memory.scala 127:26 74:29]
  assign io_axiLiteMaster1_awReady = state == 2'h0 ? 1'h0 : _GEN_42; // @[Memory.scala 127:26 75:29]
  assign io_axiLiteMaster1_wReady = state == 2'h0 ? 1'h0 : _GEN_43; // @[Memory.scala 127:26 76:29]
  assign io_axiLiteMaster1_bValid = state == 2'h0 ? 1'h0 : _GEN_45; // @[Memory.scala 127:26 78:29]
  assign io_axiLiteSlave_aclk = state == 2'h0 ? clock : _GEN_19; // @[Memory.scala 127:26 128:29]
  assign io_axiLiteSlave_aresetn = state == 2'h0 ? ~reset : _GEN_20; // @[Memory.scala 127:26 129:29]
  assign io_axiLiteSlave_arAddr = state == 2'h0 ? 32'h0 : _GEN_21; // @[Memory.scala 127:26 130:29]
  assign io_axiLiteSlave_arValid = state == 2'h0 ? 1'h0 : _GEN_22; // @[Memory.scala 127:26 131:29]
  assign io_axiLiteSlave_rReady = state == 2'h0 ? 1'h0 : _GEN_27; // @[Memory.scala 127:26 132:29]
  assign io_axiLiteSlave_awAddr = state == 2'h0 ? 32'h0 : _GEN_28; // @[Memory.scala 127:26 133:29]
  assign io_axiLiteSlave_awValid = state == 2'h0 ? 1'h0 : _GEN_29; // @[Memory.scala 127:26 134:29]
  assign io_axiLiteSlave_wData = state == 2'h0 ? 32'h0 : _GEN_31; // @[Memory.scala 127:26 135:29]
  assign io_axiLiteSlave_wStrb = state == 2'h0 ? 4'h0 : _GEN_32; // @[Memory.scala 127:26 136:29]
  assign io_axiLiteSlave_wValid = state == 2'h0 ? 1'h0 : _GEN_33; // @[Memory.scala 127:26 137:29]
  assign io_axiLiteSlave_bReady = state == 2'h0 ? 1'h0 : _GEN_37; // @[Memory.scala 127:26 138:29]
  always @(posedge clock) begin
    if (reset) begin // @[Memory.scala 115:22]
      state <= 2'h0; // @[Memory.scala 115:22]
    end else if (2'h3 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[Memory.scala 124:19]
        state <= 2'h0;
      end else if (lsu2WaitWire) begin // @[Memory.scala 124:50]
        state <= 2'h1;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      if (reset) begin // @[Memory.scala 123:19]
        state <= 2'h0;
      end else begin
        state <= _state_T_7;
      end
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
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
module top(
  input         clock,
  input         reset,
  input  [2:0]  io_npcState,
  output [31:0] io_curPC,
  output [31:0] io_nextPC,
  output        io_toMem_aclk,
  output        io_toMem_aresetn,
  output [31:0] io_toMem_arAddr,
  output        io_toMem_arValid,
  input         io_toMem_arReady,
  input  [31:0] io_toMem_rData,
  input  [1:0]  io_toMem_rrEsp,
  input         io_toMem_rValid,
  output        io_toMem_rReady,
  output [31:0] io_toMem_awAddr,
  output        io_toMem_awValid,
  input         io_toMem_awReady,
  output [31:0] io_toMem_wData,
  output [3:0]  io_toMem_wStrb,
  output        io_toMem_wValid,
  input         io_toMem_wReady,
  input  [1:0]  io_toMem_bResp,
  input         io_toMem_bValid,
  output        io_toMem_bReady
);
  wire  pc_clock; // @[Main.scala 27:49]
  wire  pc_reset; // @[Main.scala 27:49]
  wire [31:0] pc_io_npcState; // @[Main.scala 27:49]
  wire  pc_io_wbu2PC_ready; // @[Main.scala 27:49]
  wire  pc_io_wbu2PC_valid; // @[Main.scala 27:49]
  wire [31:0] pc_io_wbu2PC_bits_nextPC; // @[Main.scala 27:49]
  wire [31:0] pc_io_pc; // @[Main.scala 27:49]
  wire  ifu_clock; // @[Main.scala 28:49]
  wire  ifu_reset; // @[Main.scala 28:49]
  wire [31:0] ifu_io_pc; // @[Main.scala 28:49]
  wire  ifu_io_inst_valid; // @[Main.scala 28:49]
  wire [31:0] ifu_io_inst_bits_inst; // @[Main.scala 28:49]
  wire [31:0] ifu_io_inst_bits_pc; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_aclk; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_aresetn; // @[Main.scala 28:49]
  wire [31:0] ifu_io_ifu2Mem_arAddr; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_arValid; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_arReady; // @[Main.scala 28:49]
  wire [31:0] ifu_io_ifu2Mem_rData; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_rValid; // @[Main.scala 28:49]
  wire  ifu_io_ifu2Mem_rReady; // @[Main.scala 28:49]
  wire  riscv32BaseReg_clock; // @[Main.scala 29:41]
  wire  riscv32BaseReg_reset; // @[Main.scala 29:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[Main.scala 29:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[Main.scala 29:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs1Index; // @[Main.scala 29:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs2Index; // @[Main.scala 29:41]
  wire [3:0] riscv32BaseReg_io_wbu2BaseReg_rdIndex; // @[Main.scala 29:41]
  wire [31:0] riscv32BaseReg_io_wbu2BaseReg_data; // @[Main.scala 29:41]
  wire  riscv32BaseReg_io_wbu2BaseReg_regWR; // @[Main.scala 29:41]
  wire  csrReg_clock; // @[Main.scala 30:49]
  wire  csrReg_reset; // @[Main.scala 30:49]
  wire [31:0] csrReg_io_exu2CSR_csrData; // @[Main.scala 30:49]
  wire  csrReg_io_exu2CSR_mret; // @[Main.scala 30:49]
  wire  csrReg_io_exu2CSR_ecall; // @[Main.scala 30:49]
  wire [11:0] csrReg_io_exu2CSR_csr; // @[Main.scala 30:49]
  wire [31:0] csrReg_io_wbu2CSR_pc; // @[Main.scala 30:49]
  wire [31:0] csrReg_io_wbu2CSR_csrWData; // @[Main.scala 30:49]
  wire [11:0] csrReg_io_wbu2CSR_csr; // @[Main.scala 30:49]
  wire  csrReg_io_wbu2CSR_ecall; // @[Main.scala 30:49]
  wire  csrReg_io_wbu2CSR_csrEn; // @[Main.scala 30:49]
  wire  csrReg_io_wbu2CSR_csrWr; // @[Main.scala 30:49]
  wire  idu_clock; // @[Main.scala 31:49]
  wire  idu_reset; // @[Main.scala 31:49]
  wire  idu_io_inst_ready; // @[Main.scala 31:49]
  wire  idu_io_inst_valid; // @[Main.scala 31:49]
  wire [31:0] idu_io_inst_bits_inst; // @[Main.scala 31:49]
  wire [31:0] idu_io_inst_bits_pc; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_ready; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_valid; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2EXU_bits_pc; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2EXU_bits_rs1Data; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2EXU_bits_rs2Data; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2EXU_bits_imm; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2EXU_bits_inst; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_regWR; // @[Main.scala 31:49]
  wire [1:0] idu_io_idu2EXU_bits_srcAALU; // @[Main.scala 31:49]
  wire [1:0] idu_io_idu2EXU_bits_srcBALU; // @[Main.scala 31:49]
  wire [3:0] idu_io_idu2EXU_bits_ctrALU; // @[Main.scala 31:49]
  wire [3:0] idu_io_idu2EXU_bits_branch; // @[Main.scala 31:49]
  wire [1:0] idu_io_idu2EXU_bits_toReg; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_memWR; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_memValid; // @[Main.scala 31:49]
  wire [2:0] idu_io_idu2EXU_bits_memOP; // @[Main.scala 31:49]
  wire [4:0] idu_io_idu2EXU_bits_rs1Index; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_ecall; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_mret; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_csrEn; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_csrWr; // @[Main.scala 31:49]
  wire  idu_io_idu2EXU_bits_csrOP; // @[Main.scala 31:49]
  wire [1:0] idu_io_idu2EXU_bits_csrALUOP; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2BaseReg_rs1Data; // @[Main.scala 31:49]
  wire [31:0] idu_io_idu2BaseReg_rs2Data; // @[Main.scala 31:49]
  wire [3:0] idu_io_idu2BaseReg_rs1Index; // @[Main.scala 31:49]
  wire [3:0] idu_io_idu2BaseReg_rs2Index; // @[Main.scala 31:49]
  wire  exu_clock; // @[Main.scala 32:49]
  wire  exu_reset; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_ready; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_valid; // @[Main.scala 32:49]
  wire [31:0] exu_io_idu2EXU_bits_pc; // @[Main.scala 32:49]
  wire [31:0] exu_io_idu2EXU_bits_rs1Data; // @[Main.scala 32:49]
  wire [31:0] exu_io_idu2EXU_bits_rs2Data; // @[Main.scala 32:49]
  wire [31:0] exu_io_idu2EXU_bits_imm; // @[Main.scala 32:49]
  wire [31:0] exu_io_idu2EXU_bits_inst; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_regWR; // @[Main.scala 32:49]
  wire [1:0] exu_io_idu2EXU_bits_srcAALU; // @[Main.scala 32:49]
  wire [1:0] exu_io_idu2EXU_bits_srcBALU; // @[Main.scala 32:49]
  wire [3:0] exu_io_idu2EXU_bits_ctrALU; // @[Main.scala 32:49]
  wire [3:0] exu_io_idu2EXU_bits_branch; // @[Main.scala 32:49]
  wire [1:0] exu_io_idu2EXU_bits_toReg; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_memWR; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_memValid; // @[Main.scala 32:49]
  wire [2:0] exu_io_idu2EXU_bits_memOP; // @[Main.scala 32:49]
  wire [4:0] exu_io_idu2EXU_bits_rs1Index; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_ecall; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_mret; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_csrEn; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_csrWr; // @[Main.scala 32:49]
  wire  exu_io_idu2EXU_bits_csrOP; // @[Main.scala 32:49]
  wire [1:0] exu_io_idu2EXU_bits_csrALUOP; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_ready; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_valid; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_pc; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_memData; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_aluData; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_csrWData; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_csrData; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_immData; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_rs1Data; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2WBU_bits_inst; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_regWR; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_memWR; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_memValid; // @[Main.scala 32:49]
  wire [2:0] exu_io_exu2WBU_bits_memOP; // @[Main.scala 32:49]
  wire [1:0] exu_io_exu2WBU_bits_toReg; // @[Main.scala 32:49]
  wire [3:0] exu_io_exu2WBU_bits_branchCtr; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_less; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_zero; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_ecall; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_csrEn; // @[Main.scala 32:49]
  wire  exu_io_exu2WBU_bits_csrWr; // @[Main.scala 32:49]
  wire [31:0] exu_io_exu2CSR_csrData; // @[Main.scala 32:49]
  wire  exu_io_exu2CSR_mret; // @[Main.scala 32:49]
  wire  exu_io_exu2CSR_ecall; // @[Main.scala 32:49]
  wire [11:0] exu_io_exu2CSR_csr; // @[Main.scala 32:49]
  wire  wbu_clock; // @[Main.scala 33:49]
  wire  wbu_reset; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_ready; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_valid; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_pc; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_memData; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_aluData; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrWData; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrData; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_immData; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_rs1Data; // @[Main.scala 33:49]
  wire [31:0] wbu_io_exu2WBU_bits_inst; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_regWR; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_memWR; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_memValid; // @[Main.scala 33:49]
  wire [2:0] wbu_io_exu2WBU_bits_memOP; // @[Main.scala 33:49]
  wire [1:0] wbu_io_exu2WBU_bits_toReg; // @[Main.scala 33:49]
  wire [3:0] wbu_io_exu2WBU_bits_branchCtr; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_less; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_zero; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_ecall; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_csrEn; // @[Main.scala 33:49]
  wire  wbu_io_exu2WBU_bits_csrWr; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2CSR_pc; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2CSR_csrWData; // @[Main.scala 33:49]
  wire [11:0] wbu_io_wbu2CSR_csr; // @[Main.scala 33:49]
  wire  wbu_io_wbu2CSR_ecall; // @[Main.scala 33:49]
  wire  wbu_io_wbu2CSR_csrEn; // @[Main.scala 33:49]
  wire  wbu_io_wbu2CSR_csrWr; // @[Main.scala 33:49]
  wire [3:0] wbu_io_wbu2BaseReg_rdIndex; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2BaseReg_data; // @[Main.scala 33:49]
  wire  wbu_io_wbu2BaseReg_regWR; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_aclk; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_aresetn; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2Mem_arAddr; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_arValid; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_arReady; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2Mem_rData; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_rValid; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_rReady; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2Mem_awAddr; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_awValid; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_awReady; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2Mem_wData; // @[Main.scala 33:49]
  wire [3:0] wbu_io_wbu2Mem_wStrb; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_wValid; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_wReady; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_bValid; // @[Main.scala 33:49]
  wire  wbu_io_wbu2Mem_bReady; // @[Main.scala 33:49]
  wire  wbu_io_wbu2PC_ready; // @[Main.scala 33:49]
  wire  wbu_io_wbu2PC_valid; // @[Main.scala 33:49]
  wire [31:0] wbu_io_wbu2PC_bits_nextPC; // @[Main.scala 33:49]
  wire  axiLiteBusArbiter_clock; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_reset; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_aclk; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_aresetn; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster0_arAddr; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_arValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_arReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster0_rData; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_rValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster0_rReady; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_aclk; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_aresetn; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster1_arAddr; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_arValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_arReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster1_rData; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_rValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_rReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster1_awAddr; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_awValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_awReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteMaster1_wData; // @[Main.scala 34:41]
  wire [3:0] axiLiteBusArbiter_io_axiLiteMaster1_wStrb; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_wValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_wReady; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_bValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteMaster1_bReady; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_aclk; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_aresetn; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteSlave_arAddr; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_arValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_arReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteSlave_rData; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_rValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_rReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteSlave_awAddr; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_awValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_awReady; // @[Main.scala 34:41]
  wire [31:0] axiLiteBusArbiter_io_axiLiteSlave_wData; // @[Main.scala 34:41]
  wire [3:0] axiLiteBusArbiter_io_axiLiteSlave_wStrb; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_wValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_wReady; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_bValid; // @[Main.scala 34:41]
  wire  axiLiteBusArbiter_io_axiLiteSlave_bReady; // @[Main.scala 34:41]
  PC pc ( // @[Main.scala 27:49]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_npcState(pc_io_npcState),
    .io_wbu2PC_ready(pc_io_wbu2PC_ready),
    .io_wbu2PC_valid(pc_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(pc_io_wbu2PC_bits_nextPC),
    .io_pc(pc_io_pc)
  );
  IFU ifu ( // @[Main.scala 28:49]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_pc(ifu_io_pc),
    .io_inst_valid(ifu_io_inst_valid),
    .io_inst_bits_inst(ifu_io_inst_bits_inst),
    .io_inst_bits_pc(ifu_io_inst_bits_pc),
    .io_ifu2Mem_aclk(ifu_io_ifu2Mem_aclk),
    .io_ifu2Mem_aresetn(ifu_io_ifu2Mem_aresetn),
    .io_ifu2Mem_arAddr(ifu_io_ifu2Mem_arAddr),
    .io_ifu2Mem_arValid(ifu_io_ifu2Mem_arValid),
    .io_ifu2Mem_arReady(ifu_io_ifu2Mem_arReady),
    .io_ifu2Mem_rData(ifu_io_ifu2Mem_rData),
    .io_ifu2Mem_rValid(ifu_io_ifu2Mem_rValid),
    .io_ifu2Mem_rReady(ifu_io_ifu2Mem_rReady)
  );
  Riscv32BaseReg riscv32BaseReg ( // @[Main.scala 29:41]
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
  CSRReg csrReg ( // @[Main.scala 30:49]
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
  IDU idu ( // @[Main.scala 31:49]
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
  EXU exu ( // @[Main.scala 32:49]
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
  WBU wbu ( // @[Main.scala 33:49]
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
    .io_wbu2Mem_aclk(wbu_io_wbu2Mem_aclk),
    .io_wbu2Mem_aresetn(wbu_io_wbu2Mem_aresetn),
    .io_wbu2Mem_arAddr(wbu_io_wbu2Mem_arAddr),
    .io_wbu2Mem_arValid(wbu_io_wbu2Mem_arValid),
    .io_wbu2Mem_arReady(wbu_io_wbu2Mem_arReady),
    .io_wbu2Mem_rData(wbu_io_wbu2Mem_rData),
    .io_wbu2Mem_rValid(wbu_io_wbu2Mem_rValid),
    .io_wbu2Mem_rReady(wbu_io_wbu2Mem_rReady),
    .io_wbu2Mem_awAddr(wbu_io_wbu2Mem_awAddr),
    .io_wbu2Mem_awValid(wbu_io_wbu2Mem_awValid),
    .io_wbu2Mem_awReady(wbu_io_wbu2Mem_awReady),
    .io_wbu2Mem_wData(wbu_io_wbu2Mem_wData),
    .io_wbu2Mem_wStrb(wbu_io_wbu2Mem_wStrb),
    .io_wbu2Mem_wValid(wbu_io_wbu2Mem_wValid),
    .io_wbu2Mem_wReady(wbu_io_wbu2Mem_wReady),
    .io_wbu2Mem_bValid(wbu_io_wbu2Mem_bValid),
    .io_wbu2Mem_bReady(wbu_io_wbu2Mem_bReady),
    .io_wbu2PC_ready(wbu_io_wbu2PC_ready),
    .io_wbu2PC_valid(wbu_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(wbu_io_wbu2PC_bits_nextPC)
  );
  AXILiteBusArbiter axiLiteBusArbiter ( // @[Main.scala 34:41]
    .clock(axiLiteBusArbiter_clock),
    .reset(axiLiteBusArbiter_reset),
    .io_axiLiteMaster0_aclk(axiLiteBusArbiter_io_axiLiteMaster0_aclk),
    .io_axiLiteMaster0_aresetn(axiLiteBusArbiter_io_axiLiteMaster0_aresetn),
    .io_axiLiteMaster0_arAddr(axiLiteBusArbiter_io_axiLiteMaster0_arAddr),
    .io_axiLiteMaster0_arValid(axiLiteBusArbiter_io_axiLiteMaster0_arValid),
    .io_axiLiteMaster0_arReady(axiLiteBusArbiter_io_axiLiteMaster0_arReady),
    .io_axiLiteMaster0_rData(axiLiteBusArbiter_io_axiLiteMaster0_rData),
    .io_axiLiteMaster0_rValid(axiLiteBusArbiter_io_axiLiteMaster0_rValid),
    .io_axiLiteMaster0_rReady(axiLiteBusArbiter_io_axiLiteMaster0_rReady),
    .io_axiLiteMaster1_aclk(axiLiteBusArbiter_io_axiLiteMaster1_aclk),
    .io_axiLiteMaster1_aresetn(axiLiteBusArbiter_io_axiLiteMaster1_aresetn),
    .io_axiLiteMaster1_arAddr(axiLiteBusArbiter_io_axiLiteMaster1_arAddr),
    .io_axiLiteMaster1_arValid(axiLiteBusArbiter_io_axiLiteMaster1_arValid),
    .io_axiLiteMaster1_arReady(axiLiteBusArbiter_io_axiLiteMaster1_arReady),
    .io_axiLiteMaster1_rData(axiLiteBusArbiter_io_axiLiteMaster1_rData),
    .io_axiLiteMaster1_rValid(axiLiteBusArbiter_io_axiLiteMaster1_rValid),
    .io_axiLiteMaster1_rReady(axiLiteBusArbiter_io_axiLiteMaster1_rReady),
    .io_axiLiteMaster1_awAddr(axiLiteBusArbiter_io_axiLiteMaster1_awAddr),
    .io_axiLiteMaster1_awValid(axiLiteBusArbiter_io_axiLiteMaster1_awValid),
    .io_axiLiteMaster1_awReady(axiLiteBusArbiter_io_axiLiteMaster1_awReady),
    .io_axiLiteMaster1_wData(axiLiteBusArbiter_io_axiLiteMaster1_wData),
    .io_axiLiteMaster1_wStrb(axiLiteBusArbiter_io_axiLiteMaster1_wStrb),
    .io_axiLiteMaster1_wValid(axiLiteBusArbiter_io_axiLiteMaster1_wValid),
    .io_axiLiteMaster1_wReady(axiLiteBusArbiter_io_axiLiteMaster1_wReady),
    .io_axiLiteMaster1_bValid(axiLiteBusArbiter_io_axiLiteMaster1_bValid),
    .io_axiLiteMaster1_bReady(axiLiteBusArbiter_io_axiLiteMaster1_bReady),
    .io_axiLiteSlave_aclk(axiLiteBusArbiter_io_axiLiteSlave_aclk),
    .io_axiLiteSlave_aresetn(axiLiteBusArbiter_io_axiLiteSlave_aresetn),
    .io_axiLiteSlave_arAddr(axiLiteBusArbiter_io_axiLiteSlave_arAddr),
    .io_axiLiteSlave_arValid(axiLiteBusArbiter_io_axiLiteSlave_arValid),
    .io_axiLiteSlave_arReady(axiLiteBusArbiter_io_axiLiteSlave_arReady),
    .io_axiLiteSlave_rData(axiLiteBusArbiter_io_axiLiteSlave_rData),
    .io_axiLiteSlave_rValid(axiLiteBusArbiter_io_axiLiteSlave_rValid),
    .io_axiLiteSlave_rReady(axiLiteBusArbiter_io_axiLiteSlave_rReady),
    .io_axiLiteSlave_awAddr(axiLiteBusArbiter_io_axiLiteSlave_awAddr),
    .io_axiLiteSlave_awValid(axiLiteBusArbiter_io_axiLiteSlave_awValid),
    .io_axiLiteSlave_awReady(axiLiteBusArbiter_io_axiLiteSlave_awReady),
    .io_axiLiteSlave_wData(axiLiteBusArbiter_io_axiLiteSlave_wData),
    .io_axiLiteSlave_wStrb(axiLiteBusArbiter_io_axiLiteSlave_wStrb),
    .io_axiLiteSlave_wValid(axiLiteBusArbiter_io_axiLiteSlave_wValid),
    .io_axiLiteSlave_wReady(axiLiteBusArbiter_io_axiLiteSlave_wReady),
    .io_axiLiteSlave_bValid(axiLiteBusArbiter_io_axiLiteSlave_bValid),
    .io_axiLiteSlave_bReady(axiLiteBusArbiter_io_axiLiteSlave_bReady)
  );
  assign io_curPC = pc_io_pc; // @[Main.scala 40:25]
  assign io_nextPC = wbu_io_wbu2PC_bits_nextPC; // @[Main.scala 41:33]
  assign io_toMem_aclk = axiLiteBusArbiter_io_axiLiteSlave_aclk; // @[Main.scala 64:25]
  assign io_toMem_aresetn = axiLiteBusArbiter_io_axiLiteSlave_aresetn; // @[Main.scala 64:25]
  assign io_toMem_arAddr = axiLiteBusArbiter_io_axiLiteSlave_arAddr; // @[Main.scala 64:25]
  assign io_toMem_arValid = axiLiteBusArbiter_io_axiLiteSlave_arValid; // @[Main.scala 64:25]
  assign io_toMem_rReady = axiLiteBusArbiter_io_axiLiteSlave_rReady; // @[Main.scala 64:25]
  assign io_toMem_awAddr = axiLiteBusArbiter_io_axiLiteSlave_awAddr; // @[Main.scala 64:25]
  assign io_toMem_awValid = axiLiteBusArbiter_io_axiLiteSlave_awValid; // @[Main.scala 64:25]
  assign io_toMem_wData = axiLiteBusArbiter_io_axiLiteSlave_wData; // @[Main.scala 64:25]
  assign io_toMem_wStrb = axiLiteBusArbiter_io_axiLiteSlave_wStrb; // @[Main.scala 64:25]
  assign io_toMem_wValid = axiLiteBusArbiter_io_axiLiteSlave_wValid; // @[Main.scala 64:25]
  assign io_toMem_bReady = axiLiteBusArbiter_io_axiLiteSlave_bReady; // @[Main.scala 64:25]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_npcState = {{29'd0}, io_npcState}; // @[Main.scala 37:25]
  assign pc_io_wbu2PC_valid = wbu_io_wbu2PC_valid; // @[Main.scala 38:25]
  assign pc_io_wbu2PC_bits_nextPC = wbu_io_wbu2PC_bits_nextPC; // @[Main.scala 38:25]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_pc = pc_io_pc; // @[Main.scala 45:33]
  assign ifu_io_ifu2Mem_arReady = axiLiteBusArbiter_io_axiLiteMaster0_arReady; // @[Main.scala 48:49]
  assign ifu_io_ifu2Mem_rData = axiLiteBusArbiter_io_axiLiteMaster0_rData; // @[Main.scala 48:49]
  assign ifu_io_ifu2Mem_rValid = axiLiteBusArbiter_io_axiLiteMaster0_rValid; // @[Main.scala 48:49]
  assign riscv32BaseReg_clock = clock;
  assign riscv32BaseReg_reset = reset;
  assign riscv32BaseReg_io_idu2BaseReg_rs1Index = idu_io_idu2BaseReg_rs1Index; // @[Main.scala 52:33]
  assign riscv32BaseReg_io_idu2BaseReg_rs2Index = idu_io_idu2BaseReg_rs2Index; // @[Main.scala 52:33]
  assign riscv32BaseReg_io_wbu2BaseReg_rdIndex = wbu_io_wbu2BaseReg_rdIndex; // @[Main.scala 60:33]
  assign riscv32BaseReg_io_wbu2BaseReg_data = wbu_io_wbu2BaseReg_data; // @[Main.scala 60:33]
  assign riscv32BaseReg_io_wbu2BaseReg_regWR = wbu_io_wbu2BaseReg_regWR; // @[Main.scala 60:33]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_exu2CSR_mret = exu_io_exu2CSR_mret; // @[Main.scala 56:25]
  assign csrReg_io_exu2CSR_ecall = exu_io_exu2CSR_ecall; // @[Main.scala 56:25]
  assign csrReg_io_exu2CSR_csr = exu_io_exu2CSR_csr; // @[Main.scala 56:25]
  assign csrReg_io_wbu2CSR_pc = wbu_io_wbu2CSR_pc; // @[Main.scala 59:33]
  assign csrReg_io_wbu2CSR_csrWData = wbu_io_wbu2CSR_csrWData; // @[Main.scala 59:33]
  assign csrReg_io_wbu2CSR_csr = wbu_io_wbu2CSR_csr; // @[Main.scala 59:33]
  assign csrReg_io_wbu2CSR_ecall = wbu_io_wbu2CSR_ecall; // @[Main.scala 59:33]
  assign csrReg_io_wbu2CSR_csrEn = wbu_io_wbu2CSR_csrEn; // @[Main.scala 59:33]
  assign csrReg_io_wbu2CSR_csrWr = wbu_io_wbu2CSR_csrWr; // @[Main.scala 59:33]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_inst_valid = ifu_io_inst_valid; // @[Main.scala 47:33]
  assign idu_io_inst_bits_inst = ifu_io_inst_bits_inst; // @[Main.scala 47:33]
  assign idu_io_inst_bits_pc = ifu_io_inst_bits_pc; // @[Main.scala 47:33]
  assign idu_io_idu2EXU_ready = exu_io_idu2EXU_ready; // @[Main.scala 51:33]
  assign idu_io_idu2BaseReg_rs1Data = riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[Main.scala 52:33]
  assign idu_io_idu2BaseReg_rs2Data = riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[Main.scala 52:33]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_idu2EXU_valid = idu_io_idu2EXU_valid; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_pc = idu_io_idu2EXU_bits_pc; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_rs1Data = idu_io_idu2EXU_bits_rs1Data; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_rs2Data = idu_io_idu2EXU_bits_rs2Data; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_imm = idu_io_idu2EXU_bits_imm; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_inst = idu_io_idu2EXU_bits_inst; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_regWR = idu_io_idu2EXU_bits_regWR; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_srcAALU = idu_io_idu2EXU_bits_srcAALU; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_srcBALU = idu_io_idu2EXU_bits_srcBALU; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_ctrALU = idu_io_idu2EXU_bits_ctrALU; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_branch = idu_io_idu2EXU_bits_branch; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_toReg = idu_io_idu2EXU_bits_toReg; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_memWR = idu_io_idu2EXU_bits_memWR; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_memValid = idu_io_idu2EXU_bits_memValid; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_memOP = idu_io_idu2EXU_bits_memOP; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_rs1Index = idu_io_idu2EXU_bits_rs1Index; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_ecall = idu_io_idu2EXU_bits_ecall; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_mret = idu_io_idu2EXU_bits_mret; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_csrEn = idu_io_idu2EXU_bits_csrEn; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_csrWr = idu_io_idu2EXU_bits_csrWr; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_csrOP = idu_io_idu2EXU_bits_csrOP; // @[Main.scala 51:33]
  assign exu_io_idu2EXU_bits_csrALUOP = idu_io_idu2EXU_bits_csrALUOP; // @[Main.scala 51:33]
  assign exu_io_exu2WBU_ready = wbu_io_exu2WBU_ready; // @[Main.scala 55:25]
  assign exu_io_exu2CSR_csrData = csrReg_io_exu2CSR_csrData; // @[Main.scala 56:25]
  assign wbu_clock = clock;
  assign wbu_reset = reset;
  assign wbu_io_exu2WBU_valid = exu_io_exu2WBU_valid; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_pc = exu_io_exu2WBU_bits_pc; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_memData = exu_io_exu2WBU_bits_memData; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_aluData = exu_io_exu2WBU_bits_aluData; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_csrWData = exu_io_exu2WBU_bits_csrWData; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_csrData = exu_io_exu2WBU_bits_csrData; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_immData = exu_io_exu2WBU_bits_immData; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_rs1Data = exu_io_exu2WBU_bits_rs1Data; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_inst = exu_io_exu2WBU_bits_inst; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_regWR = exu_io_exu2WBU_bits_regWR; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_memWR = exu_io_exu2WBU_bits_memWR; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_memValid = exu_io_exu2WBU_bits_memValid; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_memOP = exu_io_exu2WBU_bits_memOP; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_toReg = exu_io_exu2WBU_bits_toReg; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_branchCtr = exu_io_exu2WBU_bits_branchCtr; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_less = exu_io_exu2WBU_bits_less; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_zero = exu_io_exu2WBU_bits_zero; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_ecall = exu_io_exu2WBU_bits_ecall; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_csrEn = exu_io_exu2WBU_bits_csrEn; // @[Main.scala 55:25]
  assign wbu_io_exu2WBU_bits_csrWr = exu_io_exu2WBU_bits_csrWr; // @[Main.scala 55:25]
  assign wbu_io_wbu2Mem_arReady = axiLiteBusArbiter_io_axiLiteMaster1_arReady; // @[Main.scala 61:49]
  assign wbu_io_wbu2Mem_rData = axiLiteBusArbiter_io_axiLiteMaster1_rData; // @[Main.scala 61:49]
  assign wbu_io_wbu2Mem_rValid = axiLiteBusArbiter_io_axiLiteMaster1_rValid; // @[Main.scala 61:49]
  assign wbu_io_wbu2Mem_awReady = axiLiteBusArbiter_io_axiLiteMaster1_awReady; // @[Main.scala 61:49]
  assign wbu_io_wbu2Mem_wReady = axiLiteBusArbiter_io_axiLiteMaster1_wReady; // @[Main.scala 61:49]
  assign wbu_io_wbu2Mem_bValid = axiLiteBusArbiter_io_axiLiteMaster1_bValid; // @[Main.scala 61:49]
  assign wbu_io_wbu2PC_ready = pc_io_wbu2PC_ready; // @[Main.scala 38:25]
  assign axiLiteBusArbiter_clock = clock;
  assign axiLiteBusArbiter_reset = reset;
  assign axiLiteBusArbiter_io_axiLiteMaster0_aclk = ifu_io_ifu2Mem_aclk; // @[Main.scala 48:49]
  assign axiLiteBusArbiter_io_axiLiteMaster0_aresetn = ifu_io_ifu2Mem_aresetn; // @[Main.scala 48:49]
  assign axiLiteBusArbiter_io_axiLiteMaster0_arAddr = ifu_io_ifu2Mem_arAddr; // @[Main.scala 48:49]
  assign axiLiteBusArbiter_io_axiLiteMaster0_arValid = ifu_io_ifu2Mem_arValid; // @[Main.scala 48:49]
  assign axiLiteBusArbiter_io_axiLiteMaster0_rReady = ifu_io_ifu2Mem_rReady; // @[Main.scala 48:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_aclk = wbu_io_wbu2Mem_aclk; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_aresetn = wbu_io_wbu2Mem_aresetn; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_arAddr = wbu_io_wbu2Mem_arAddr; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_arValid = wbu_io_wbu2Mem_arValid; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_rReady = wbu_io_wbu2Mem_rReady; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_awAddr = wbu_io_wbu2Mem_awAddr; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_awValid = wbu_io_wbu2Mem_awValid; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_wData = wbu_io_wbu2Mem_wData; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_wStrb = wbu_io_wbu2Mem_wStrb; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_wValid = wbu_io_wbu2Mem_wValid; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteMaster1_bReady = wbu_io_wbu2Mem_bReady; // @[Main.scala 61:49]
  assign axiLiteBusArbiter_io_axiLiteSlave_arReady = io_toMem_arReady; // @[Main.scala 64:25]
  assign axiLiteBusArbiter_io_axiLiteSlave_rData = io_toMem_rData; // @[Main.scala 64:25]
  assign axiLiteBusArbiter_io_axiLiteSlave_rValid = io_toMem_rValid; // @[Main.scala 64:25]
  assign axiLiteBusArbiter_io_axiLiteSlave_awReady = io_toMem_awReady; // @[Main.scala 64:25]
  assign axiLiteBusArbiter_io_axiLiteSlave_wReady = io_toMem_wReady; // @[Main.scala 64:25]
  assign axiLiteBusArbiter_io_axiLiteSlave_bValid = io_toMem_bValid; // @[Main.scala 64:25]
endmodule
