module EXU(
  input         clock,
  input         reset,
  output        io_idu2EXU_ready, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_valid, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_idu2EXU_bits_pc, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_idu2EXU_bits_rs1Data, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_idu2EXU_bits_rs2Data, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_idu2EXU_bits_imm, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_idu2EXU_bits_inst, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_regWR, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [1:0]  io_idu2EXU_bits_srcAALU, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [1:0]  io_idu2EXU_bits_srcBALU, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [3:0]  io_idu2EXU_bits_ctrALU, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [3:0]  io_idu2EXU_bits_branch, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [1:0]  io_idu2EXU_bits_toReg, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_memWR, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_memValid, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [2:0]  io_idu2EXU_bits_memOP, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [4:0]  io_idu2EXU_bits_rs1Index, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_ecall, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_mret, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_csrEn, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_csrWr, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_idu2EXU_bits_csrOP, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [1:0]  io_idu2EXU_bits_csrALUOP, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_exu2LSU_ready, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_valid, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_pc, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_memData, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_aluData, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_csrWData, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_csrData, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_inst, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_regWR, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_memWR, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_memValid, // @[src/main/scala/exu/EXU.scala 16:20]
  output [2:0]  io_exu2LSU_bits_memOP, // @[src/main/scala/exu/EXU.scala 16:20]
  output [1:0]  io_exu2LSU_bits_toReg, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_ecall, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_csrEn, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_csrWr, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_exu2CSR_csrData, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2CSR_mret, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2CSR_ecall, // @[src/main/scala/exu/EXU.scala 16:20]
  output [11:0] io_exu2CSR_csr, // @[src/main/scala/exu/EXU.scala 16:20]
  output [3:0]  io_rd, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_currentPC, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_flush, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_ecallFlush, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_flushing // @[src/main/scala/exu/EXU.scala 16:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] alu_io_aluCtr; // @[src/main/scala/exu/EXU.scala 61:25]
  wire [31:0] alu_io_srcAData; // @[src/main/scala/exu/EXU.scala 61:25]
  wire [31:0] alu_io_srcBData; // @[src/main/scala/exu/EXU.scala 61:25]
  wire  alu_io_less; // @[src/main/scala/exu/EXU.scala 61:25]
  wire  alu_io_zero; // @[src/main/scala/exu/EXU.scala 61:25]
  wire [31:0] alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 61:25]
  wire [31:0] csrALU_io_srcAData; // @[src/main/scala/exu/EXU.scala 77:41]
  wire [31:0] csrALU_io_srcBData; // @[src/main/scala/exu/EXU.scala 77:41]
  wire [1:0] csrALU_io_csrALUOP; // @[src/main/scala/exu/EXU.scala 77:41]
  wire [31:0] csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 77:41]
  wire [3:0] branchCond_io_branch; // @[src/main/scala/exu/EXU.scala 88:41]
  wire  branchCond_io_less; // @[src/main/scala/exu/EXU.scala 88:41]
  wire  branchCond_io_zero; // @[src/main/scala/exu/EXU.scala 88:41]
  wire [1:0] branchCond_io_pcASrc; // @[src/main/scala/exu/EXU.scala 88:41]
  wire [1:0] branchCond_io_pcBSrc; // @[src/main/scala/exu/EXU.scala 88:41]
  wire [31:0] branchCheck_io_predictPC; // @[src/main/scala/exu/EXU.scala 105:41]
  wire [31:0] branchCheck_io_correctPC; // @[src/main/scala/exu/EXU.scala 105:41]
  wire  branchCheck_io_correct; // @[src/main/scala/exu/EXU.scala 105:41]
  wire  _srcADataWire_T = io_idu2EXU_bits_srcAALU == 2'h0; // @[src/main/scala/exu/EXU.scala 53:33]
  wire  _srcADataWire_T_1 = io_idu2EXU_bits_srcAALU == 2'h1; // @[src/main/scala/exu/EXU.scala 54:33]
  wire [31:0] _srcADataWire_T_2 = _srcADataWire_T_1 ? io_idu2EXU_bits_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _srcBDataWire_T = io_idu2EXU_bits_srcBALU == 2'h0; // @[src/main/scala/exu/EXU.scala 57:33]
  wire  _srcBDataWire_T_1 = io_idu2EXU_bits_srcBALU == 2'h1; // @[src/main/scala/exu/EXU.scala 58:33]
  wire  _srcBDataWire_T_2 = io_idu2EXU_bits_srcBALU == 2'h2; // @[src/main/scala/exu/EXU.scala 59:33]
  wire [31:0] _srcBDataWire_T_3 = _srcBDataWire_T_2 ? 32'h4 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _srcBDataWire_T_4 = _srcBDataWire_T_1 ? io_idu2EXU_bits_imm : _srcBDataWire_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  lessReg; // @[src/main/scala/exu/EXU.scala 62:34]
  reg  zeroReg; // @[src/main/scala/exu/EXU.scala 63:34]
  reg [31:0] resultReg; // @[src/main/scala/exu/EXU.scala 64:34]
  wire  _csrALU_io_srcBData_T_1 = ~io_idu2EXU_bits_csrOP; // @[src/main/scala/exu/EXU.scala 82:28]
  wire [31:0] _csrALU_io_srcBData_T_2 = _csrALU_io_srcBData_T_1 ? io_idu2EXU_bits_rs1Data : {{27'd0},
    io_idu2EXU_bits_rs1Index}; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _nextPC_T = branchCond_io_pcASrc == 2'h0; // @[src/main/scala/exu/EXU.scala 95:21]
  wire  _nextPC_T_1 = branchCond_io_pcASrc == 2'h1; // @[src/main/scala/exu/EXU.scala 96:29]
  wire [31:0] _nextPC_T_4 = _nextPC_T_1 ? io_idu2EXU_bits_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_5 = _nextPC_T ? 32'h4 : _nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _nextPC_T_6 = branchCond_io_pcBSrc == 2'h0; // @[src/main/scala/exu/EXU.scala 99:21]
  wire  _nextPC_T_7 = branchCond_io_pcBSrc == 2'h1; // @[src/main/scala/exu/EXU.scala 100:29]
  wire  _nextPC_T_8 = branchCond_io_pcBSrc == 2'h2; // @[src/main/scala/exu/EXU.scala 101:29]
  wire [31:0] _nextPC_T_9 = _nextPC_T_8 ? csrALU_io_oData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_10 = _nextPC_T_7 ? io_idu2EXU_bits_rs1Data : _nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_11 = _nextPC_T_6 ? io_idu2EXU_bits_pc : _nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] nextPC = _nextPC_T_5 + _nextPC_T_11; // @[src/main/scala/exu/EXU.scala 98:8]
  wire  _predictPCReg_T = io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/exu/EXU.scala 103:70]
  reg [31:0] predictPCReg; // @[src/main/scala/exu/EXU.scala 103:44]
  reg  handReg; // @[src/main/scala/exu/EXU.scala 104:42]
  wire  flushWire = ~branchCheck_io_correct & predictPCReg != 32'h4 & handReg & ~io_flushing | io_ecallFlush; // @[src/main/scala/exu/EXU.scala 108:117]
  wire [4:0] _io_rd_T_4 = io_idu2EXU_ready & ~io_exu2LSU_valid ? 5'h0 : io_idu2EXU_bits_inst[11:7]; // @[src/main/scala/exu/EXU.scala 146:45]
  wire [4:0] _io_rd_T_5 = io_idu2EXU_bits_regWR ? _io_rd_T_4 : 5'h0; // @[src/main/scala/exu/EXU.scala 146:23]
  reg  validReg; // @[src/main/scala/exu/EXU.scala 150:31]
  reg  readyReg; // @[src/main/scala/exu/EXU.scala 151:31]
  wire  _T = ~flushWire; // @[src/main/scala/exu/EXU.scala 152:14]
  wire  _validReg_T_1 = io_exu2LSU_valid & io_exu2LSU_ready; // @[src/main/scala/exu/EXU.scala 156:66]
  wire  _validReg_T_4 = io_exu2LSU_valid & io_exu2LSU_ready ? _predictPCReg_T : 1'h1; // @[src/main/scala/exu/EXU.scala 156:48]
  wire  _GEN_1 = validReg ? _validReg_T_4 : validReg; // @[src/main/scala/exu/EXU.scala 150:31 153:34 156:42]
  wire  _GEN_2 = ~validReg ? _predictPCReg_T : _GEN_1; // @[src/main/scala/exu/EXU.scala 153:34 154:44]
  wire  _readyReg_T_4 = _predictPCReg_T ? _validReg_T_1 : 1'h1; // @[src/main/scala/exu/EXU.scala 163:48]
  wire  _GEN_3 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/exu/EXU.scala 151:31 160:34 163:42]
  wire  _GEN_4 = ~readyReg ? _validReg_T_1 : _GEN_3; // @[src/main/scala/exu/EXU.scala 160:34 161:44]
  wire  _GEN_5 = ~flushWire & _GEN_2; // @[src/main/scala/exu/EXU.scala 152:26 168:26]
  wire  _GEN_6 = ~flushWire ? _GEN_4 : 1'h1; // @[src/main/scala/exu/EXU.scala 152:26 169:26]
  ALU alu ( // @[src/main/scala/exu/EXU.scala 61:25]
    .io_aluCtr(alu_io_aluCtr),
    .io_srcAData(alu_io_srcAData),
    .io_srcBData(alu_io_srcBData),
    .io_less(alu_io_less),
    .io_zero(alu_io_zero),
    .io_aluOut(alu_io_aluOut)
  );
  CSRALU csrALU ( // @[src/main/scala/exu/EXU.scala 77:41]
    .io_srcAData(csrALU_io_srcAData),
    .io_srcBData(csrALU_io_srcBData),
    .io_csrALUOP(csrALU_io_csrALUOP),
    .io_oData(csrALU_io_oData)
  );
  BranchCond branchCond ( // @[src/main/scala/exu/EXU.scala 88:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  BranchCheck branchCheck ( // @[src/main/scala/exu/EXU.scala 105:41]
    .io_predictPC(branchCheck_io_predictPC),
    .io_correctPC(branchCheck_io_correctPC),
    .io_correct(branchCheck_io_correct)
  );
  assign io_idu2EXU_ready = readyReg & _T; // @[src/main/scala/exu/EXU.scala 171:45]
  assign io_exu2LSU_valid = validReg & _T; // @[src/main/scala/exu/EXU.scala 172:37]
  assign io_exu2LSU_bits_pc = io_idu2EXU_bits_pc; // @[src/main/scala/exu/EXU.scala 124:49]
  assign io_exu2LSU_bits_memData = io_idu2EXU_bits_rs2Data; // @[src/main/scala/exu/EXU.scala 125:41]
  assign io_exu2LSU_bits_aluData = resultReg; // @[src/main/scala/exu/EXU.scala 126:41]
  assign io_exu2LSU_bits_csrWData = csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 127:41]
  assign io_exu2LSU_bits_csrData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 128:41]
  assign io_exu2LSU_bits_inst = io_idu2EXU_bits_inst; // @[src/main/scala/exu/EXU.scala 131:41]
  assign io_exu2LSU_bits_regWR = io_idu2EXU_bits_regWR; // @[src/main/scala/exu/EXU.scala 133:41]
  assign io_exu2LSU_bits_memWR = io_idu2EXU_bits_memWR; // @[src/main/scala/exu/EXU.scala 134:41]
  assign io_exu2LSU_bits_memValid = io_idu2EXU_bits_memValid; // @[src/main/scala/exu/EXU.scala 135:41]
  assign io_exu2LSU_bits_memOP = io_idu2EXU_bits_memOP; // @[src/main/scala/exu/EXU.scala 136:41]
  assign io_exu2LSU_bits_toReg = io_idu2EXU_bits_toReg; // @[src/main/scala/exu/EXU.scala 137:41]
  assign io_exu2LSU_bits_ecall = io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 138:41]
  assign io_exu2LSU_bits_csrEn = io_idu2EXU_bits_csrEn; // @[src/main/scala/exu/EXU.scala 139:41]
  assign io_exu2LSU_bits_csrWr = io_idu2EXU_bits_csrWr; // @[src/main/scala/exu/EXU.scala 140:41]
  assign io_exu2CSR_mret = io_idu2EXU_bits_mret; // @[src/main/scala/exu/EXU.scala 143:49]
  assign io_exu2CSR_ecall = io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 144:49]
  assign io_exu2CSR_csr = io_idu2EXU_bits_inst[31:20]; // @[src/main/scala/exu/EXU.scala 142:60]
  assign io_rd = _io_rd_T_5[3:0]; // @[src/main/scala/exu/EXU.scala 146:17]
  assign io_currentPC = predictPCReg; // @[src/main/scala/exu/EXU.scala 147:25]
  assign io_flush = ~branchCheck_io_correct & predictPCReg != 32'h4 & handReg & ~io_flushing | io_ecallFlush; // @[src/main/scala/exu/EXU.scala 108:117]
  assign alu_io_aluCtr = io_idu2EXU_bits_ctrALU; // @[src/main/scala/exu/EXU.scala 66:33]
  assign alu_io_srcAData = _srcADataWire_T ? io_idu2EXU_bits_rs1Data : _srcADataWire_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign alu_io_srcBData = _srcBDataWire_T ? io_idu2EXU_bits_rs2Data : _srcBDataWire_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_srcAData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 79:33]
  assign csrALU_io_srcBData = io_idu2EXU_bits_csrOP ? {{27'd0}, io_idu2EXU_bits_rs1Index} : _csrALU_io_srcBData_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_csrALUOP = io_idu2EXU_bits_csrALUOP; // @[src/main/scala/exu/EXU.scala 84:33]
  assign branchCond_io_branch = io_idu2EXU_bits_branch; // @[src/main/scala/exu/EXU.scala 89:33]
  assign branchCond_io_less = lessReg; // @[src/main/scala/exu/EXU.scala 90:41]
  assign branchCond_io_zero = zeroReg; // @[src/main/scala/exu/EXU.scala 91:41]
  assign branchCheck_io_predictPC = io_idu2EXU_bits_pc; // @[src/main/scala/exu/EXU.scala 106:34]
  assign branchCheck_io_correctPC = predictPCReg; // @[src/main/scala/exu/EXU.scala 107:34]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/exu/EXU.scala 62:34]
      lessReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 62:34]
    end else begin
      lessReg <= alu_io_less; // @[src/main/scala/exu/EXU.scala 70:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 63:34]
      zeroReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 63:34]
    end else begin
      zeroReg <= alu_io_zero; // @[src/main/scala/exu/EXU.scala 71:33]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 64:34]
      resultReg <= 32'h0; // @[src/main/scala/exu/EXU.scala 64:34]
    end else begin
      resultReg <= alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 74:33]
    end
    if (io_idu2EXU_valid & io_idu2EXU_ready) begin // @[src/main/scala/exu/EXU.scala 103:44]
      predictPCReg <= nextPC; // @[src/main/scala/exu/EXU.scala 103:44]
    end
    handReg <= io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/exu/EXU.scala 104:60]
    if (reset) begin // @[src/main/scala/exu/EXU.scala 150:31]
      validReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 150:31]
    end else begin
      validReg <= _GEN_5;
    end
    readyReg <= reset | _GEN_6; // @[src/main/scala/exu/EXU.scala 151:{31,31}]
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
  lessReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  zeroReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  resultReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  predictPCReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  handReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  validReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  readyReg = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
