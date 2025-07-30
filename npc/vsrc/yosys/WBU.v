module WBU(
  input         clock,
  output        io_lsu2WBU_ready, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_valid, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_pc, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_memData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_aluData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_csrWData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_csrData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_immData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_rs1Data, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_lsu2WBU_bits_inst, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_regWR, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [1:0]  io_lsu2WBU_bits_toReg, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [1:0]  io_lsu2WBU_bits_pcASrc, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [1:0]  io_lsu2WBU_bits_pcBSrc, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_ecall, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_csrEn, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_csrWr, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_fencei, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2CSR_pc, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [11:0] io_wbu2CSR_csr, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_ecall, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_csrEn, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_csrWr, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2BaseReg_data, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2BaseReg_regWR, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2PC_valid, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2PC_bits_nextPC, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2Icache // @[src/main/scala/wbu/WBU.scala 14:20]
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/wbu/WBU.scala 22:50]
  reg [31:0] memDataReg; // @[src/main/scala/wbu/WBU.scala 23:42]
  reg [31:0] aluDataReg; // @[src/main/scala/wbu/WBU.scala 24:42]
  reg [31:0] csrWDataReg; // @[src/main/scala/wbu/WBU.scala 25:42]
  reg [31:0] csrDataReg; // @[src/main/scala/wbu/WBU.scala 26:42]
  reg [31:0] immDataReg; // @[src/main/scala/wbu/WBU.scala 27:42]
  reg [31:0] rs1DataReg; // @[src/main/scala/wbu/WBU.scala 28:42]
  reg [31:0] instReg; // @[src/main/scala/wbu/WBU.scala 29:42]
  reg  regWRReg; // @[src/main/scala/wbu/WBU.scala 30:34]
  reg [1:0] toRegReg; // @[src/main/scala/wbu/WBU.scala 31:42]
  reg [1:0] pcASrcReg; // @[src/main/scala/wbu/WBU.scala 32:42]
  reg [1:0] pcBSrcReg; // @[src/main/scala/wbu/WBU.scala 33:42]
  reg  ecallReg; // @[src/main/scala/wbu/WBU.scala 34:42]
  reg  csrEnReg; // @[src/main/scala/wbu/WBU.scala 35:42]
  reg  csrWrReg; // @[src/main/scala/wbu/WBU.scala 36:42]
  reg  fenceiReg; // @[src/main/scala/wbu/WBU.scala 37:42]
  reg  handReg; // @[src/main/scala/wbu/WBU.scala 38:42]
  wire  _io_wbu2BaseReg_data_T = toRegReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 49:19]
  wire  _io_wbu2BaseReg_data_T_1 = toRegReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 50:27]
  wire  _io_wbu2BaseReg_data_T_2 = toRegReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 51:27]
  wire [31:0] _io_wbu2BaseReg_data_T_3 = _io_wbu2BaseReg_data_T_2 ? csrDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2BaseReg_data_T_4 = _io_wbu2BaseReg_data_T_1 ? memDataReg : _io_wbu2BaseReg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T = pcASrcReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 57:20]
  wire  _io_wbu2PC_bits_nextPC_T_1 = pcASrcReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 58:28]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_4 = _io_wbu2PC_bits_nextPC_T_1 ? immDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_5 = _io_wbu2PC_bits_nextPC_T ? 32'h4 : _io_wbu2PC_bits_nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T_6 = pcBSrcReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 61:20]
  wire  _io_wbu2PC_bits_nextPC_T_7 = pcBSrcReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 62:28]
  wire  _io_wbu2PC_bits_nextPC_T_8 = pcBSrcReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 63:28]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_9 = _io_wbu2PC_bits_nextPC_T_8 ? csrWDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_10 = _io_wbu2PC_bits_nextPC_T_7 ? rs1DataReg : _io_wbu2PC_bits_nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_11 = _io_wbu2PC_bits_nextPC_T_6 ? pcReg : _io_wbu2PC_bits_nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_lsu2WBU_ready = 1'h1; // @[src/main/scala/wbu/WBU.scala 41:33]
  assign io_wbu2CSR_pc = pcReg; // @[src/main/scala/wbu/WBU.scala 42:25]
  assign io_wbu2CSR_csrWData = csrWDataReg; // @[src/main/scala/wbu/WBU.scala 43:25]
  assign io_wbu2CSR_csr = instReg[31:20]; // @[src/main/scala/wbu/WBU.scala 44:35]
  assign io_wbu2CSR_ecall = ecallReg; // @[src/main/scala/wbu/WBU.scala 45:25]
  assign io_wbu2CSR_csrEn = csrEnReg; // @[src/main/scala/wbu/WBU.scala 46:25]
  assign io_wbu2CSR_csrWr = csrWrReg; // @[src/main/scala/wbu/WBU.scala 47:25]
  assign io_wbu2BaseReg_rdIndex = instReg[10:7]; // @[src/main/scala/wbu/WBU.scala 53:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? aluDataReg : _io_wbu2BaseReg_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2BaseReg_regWR = regWRReg; // @[src/main/scala/wbu/WBU.scala 54:29]
  assign io_wbu2PC_valid = handReg; // @[src/main/scala/wbu/WBU.scala 55:41]
  assign io_wbu2PC_bits_nextPC = _io_wbu2PC_bits_nextPC_T_5 + _io_wbu2PC_bits_nextPC_T_11; // @[src/main/scala/wbu/WBU.scala 60:8]
  assign io_wbu2Icache = fenceiReg; // @[src/main/scala/wbu/WBU.scala 66:25]
  always @(posedge clock) begin
    pcReg <= io_lsu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 22:50]
    memDataReg <= io_lsu2WBU_bits_memData; // @[src/main/scala/wbu/WBU.scala 23:42]
    aluDataReg <= io_lsu2WBU_bits_aluData; // @[src/main/scala/wbu/WBU.scala 24:42]
    csrWDataReg <= io_lsu2WBU_bits_csrWData; // @[src/main/scala/wbu/WBU.scala 25:42]
    csrDataReg <= io_lsu2WBU_bits_csrData; // @[src/main/scala/wbu/WBU.scala 26:42]
    immDataReg <= io_lsu2WBU_bits_immData; // @[src/main/scala/wbu/WBU.scala 27:42]
    rs1DataReg <= io_lsu2WBU_bits_rs1Data; // @[src/main/scala/wbu/WBU.scala 28:42]
    instReg <= io_lsu2WBU_bits_inst; // @[src/main/scala/wbu/WBU.scala 29:42]
    regWRReg <= io_lsu2WBU_bits_regWR; // @[src/main/scala/wbu/WBU.scala 30:34]
    toRegReg <= io_lsu2WBU_bits_toReg; // @[src/main/scala/wbu/WBU.scala 31:42]
    pcASrcReg <= io_lsu2WBU_bits_pcASrc; // @[src/main/scala/wbu/WBU.scala 32:42]
    pcBSrcReg <= io_lsu2WBU_bits_pcBSrc; // @[src/main/scala/wbu/WBU.scala 33:42]
    ecallReg <= io_lsu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 34:42]
    csrEnReg <= io_lsu2WBU_bits_csrEn; // @[src/main/scala/wbu/WBU.scala 35:42]
    csrWrReg <= io_lsu2WBU_bits_csrWr; // @[src/main/scala/wbu/WBU.scala 36:42]
    fenceiReg <= io_lsu2WBU_bits_fencei; // @[src/main/scala/wbu/WBU.scala 37:42]
    handReg <= io_lsu2WBU_valid & io_lsu2WBU_ready; // @[src/main/scala/wbu/WBU.scala 38:60]
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
  toRegReg = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  pcASrcReg = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  pcBSrcReg = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  ecallReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  csrEnReg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  csrWrReg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  fenceiReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  handReg = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
