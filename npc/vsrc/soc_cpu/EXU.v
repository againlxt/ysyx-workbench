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
  output [31:0] io_exu2LSU_bits_immData, // @[src/main/scala/exu/EXU.scala 16:20]
  output [31:0] io_exu2LSU_bits_rs1Data, // @[src/main/scala/exu/EXU.scala 16:20]
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
  output [3:0]  io_exu2Branch_branchCtr, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2Branch_less, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2Branch_zero, // @[src/main/scala/exu/EXU.scala 16:20]
  output [3:0]  io_rd, // @[src/main/scala/exu/EXU.scala 16:20]
  input         io_flush // @[src/main/scala/exu/EXU.scala 16:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] alu_io_aluCtr; // @[src/main/scala/exu/EXU.scala 60:25]
  wire [31:0] alu_io_srcAData; // @[src/main/scala/exu/EXU.scala 60:25]
  wire [31:0] alu_io_srcBData; // @[src/main/scala/exu/EXU.scala 60:25]
  wire  alu_io_less; // @[src/main/scala/exu/EXU.scala 60:25]
  wire  alu_io_zero; // @[src/main/scala/exu/EXU.scala 60:25]
  wire [31:0] alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 60:25]
  wire [31:0] csrALU_io_srcAData; // @[src/main/scala/exu/EXU.scala 70:41]
  wire [31:0] csrALU_io_srcBData; // @[src/main/scala/exu/EXU.scala 70:41]
  wire [1:0] csrALU_io_csrALUOP; // @[src/main/scala/exu/EXU.scala 70:41]
  wire [31:0] csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 70:41]
  wire  EFCC_valid; // @[src/main/scala/exu/EXU.scala 88:57]
  wire [31:0] EFCC_counterType; // @[src/main/scala/exu/EXU.scala 88:57]
  wire [31:0] EFCC_data; // @[src/main/scala/exu/EXU.scala 88:57]
  wire  _srcADataWire_T = io_idu2EXU_bits_srcAALU == 2'h0; // @[src/main/scala/exu/EXU.scala 52:33]
  wire  _srcADataWire_T_1 = io_idu2EXU_bits_srcAALU == 2'h1; // @[src/main/scala/exu/EXU.scala 53:33]
  wire [31:0] _srcADataWire_T_2 = _srcADataWire_T_1 ? io_idu2EXU_bits_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _srcBDataWire_T = io_idu2EXU_bits_srcBALU == 2'h0; // @[src/main/scala/exu/EXU.scala 56:33]
  wire  _srcBDataWire_T_1 = io_idu2EXU_bits_srcBALU == 2'h1; // @[src/main/scala/exu/EXU.scala 57:33]
  wire  _srcBDataWire_T_2 = io_idu2EXU_bits_srcBALU == 2'h2; // @[src/main/scala/exu/EXU.scala 58:33]
  wire [31:0] _srcBDataWire_T_3 = _srcBDataWire_T_2 ? 32'h4 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _srcBDataWire_T_4 = _srcBDataWire_T_1 ? io_idu2EXU_bits_imm : _srcBDataWire_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _csrALU_io_srcBData_T_1 = ~io_idu2EXU_bits_csrOP; // @[src/main/scala/exu/EXU.scala 75:28]
  wire [31:0] _csrALU_io_srcBData_T_2 = _csrALU_io_srcBData_T_1 ? io_idu2EXU_bits_rs1Data : {{27'd0},
    io_idu2EXU_bits_rs1Index}; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg [31:0] exuFinCalCnt; // @[src/main/scala/exu/EXU.scala 82:43]
  wire  _T = io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/exu/EXU.scala 83:40]
  wire [31:0] _exuFinCalCnt_T_1 = exuFinCalCnt + 32'h1; // @[src/main/scala/exu/EXU.scala 86:54]
  wire [4:0] _io_rd_T_4 = io_idu2EXU_ready & ~io_exu2LSU_valid ? 5'h0 : io_idu2EXU_bits_inst[11:7]; // @[src/main/scala/exu/EXU.scala 120:45]
  wire [4:0] _io_rd_T_5 = io_idu2EXU_bits_regWR ? _io_rd_T_4 : 5'h0; // @[src/main/scala/exu/EXU.scala 120:23]
  reg  validReg; // @[src/main/scala/exu/EXU.scala 122:31]
  reg  readyReg; // @[src/main/scala/exu/EXU.scala 123:31]
  wire  _T_1 = ~io_flush; // @[src/main/scala/exu/EXU.scala 124:14]
  wire  _validReg_T_1 = io_exu2LSU_valid & io_exu2LSU_ready; // @[src/main/scala/exu/EXU.scala 128:66]
  wire  _validReg_T_4 = io_exu2LSU_valid & io_exu2LSU_ready ? _T : 1'h1; // @[src/main/scala/exu/EXU.scala 128:48]
  wire  _GEN_1 = validReg ? _validReg_T_4 : validReg; // @[src/main/scala/exu/EXU.scala 122:31 125:34 128:42]
  wire  _GEN_2 = ~validReg ? _T : _GEN_1; // @[src/main/scala/exu/EXU.scala 125:34 126:44]
  wire  _readyReg_T_4 = _T ? _validReg_T_1 : 1'h1; // @[src/main/scala/exu/EXU.scala 135:48]
  wire  _GEN_3 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/exu/EXU.scala 123:31 132:34 135:42]
  wire  _GEN_4 = ~readyReg ? _validReg_T_1 : _GEN_3; // @[src/main/scala/exu/EXU.scala 132:34 133:44]
  wire  _GEN_5 = ~io_flush & _GEN_2; // @[src/main/scala/exu/EXU.scala 124:26 140:26]
  wire  _GEN_6 = ~io_flush ? _GEN_4 : 1'h1; // @[src/main/scala/exu/EXU.scala 124:26 141:26]
  ALU alu ( // @[src/main/scala/exu/EXU.scala 60:25]
    .io_aluCtr(alu_io_aluCtr),
    .io_srcAData(alu_io_srcAData),
    .io_srcBData(alu_io_srcBData),
    .io_less(alu_io_less),
    .io_zero(alu_io_zero),
    .io_aluOut(alu_io_aluOut)
  );
  CSRALU csrALU ( // @[src/main/scala/exu/EXU.scala 70:41]
    .io_srcAData(csrALU_io_srcAData),
    .io_srcBData(csrALU_io_srcBData),
    .io_csrALUOP(csrALU_io_csrALUOP),
    .io_oData(csrALU_io_oData)
  );
  PerformanceCounter EFCC ( // @[src/main/scala/exu/EXU.scala 88:57]
    .valid(EFCC_valid),
    .counterType(EFCC_counterType),
    .data(EFCC_data)
  );
  assign io_idu2EXU_ready = readyReg & _T_1; // @[src/main/scala/exu/EXU.scala 143:45]
  assign io_exu2LSU_valid = validReg & _T_1; // @[src/main/scala/exu/EXU.scala 144:37]
  assign io_exu2LSU_bits_pc = io_idu2EXU_bits_pc; // @[src/main/scala/exu/EXU.scala 94:49]
  assign io_exu2LSU_bits_memData = io_idu2EXU_bits_rs2Data; // @[src/main/scala/exu/EXU.scala 95:41]
  assign io_exu2LSU_bits_aluData = alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 96:41]
  assign io_exu2LSU_bits_csrWData = csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 97:41]
  assign io_exu2LSU_bits_csrData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 98:41]
  assign io_exu2LSU_bits_immData = io_idu2EXU_bits_imm; // @[src/main/scala/exu/EXU.scala 99:41]
  assign io_exu2LSU_bits_rs1Data = io_idu2EXU_bits_rs1Data; // @[src/main/scala/exu/EXU.scala 100:41]
  assign io_exu2LSU_bits_inst = io_idu2EXU_bits_inst; // @[src/main/scala/exu/EXU.scala 101:41]
  assign io_exu2LSU_bits_regWR = io_idu2EXU_bits_regWR; // @[src/main/scala/exu/EXU.scala 103:41]
  assign io_exu2LSU_bits_memWR = io_idu2EXU_bits_memWR; // @[src/main/scala/exu/EXU.scala 104:41]
  assign io_exu2LSU_bits_memValid = io_idu2EXU_bits_memValid; // @[src/main/scala/exu/EXU.scala 105:41]
  assign io_exu2LSU_bits_memOP = io_idu2EXU_bits_memOP; // @[src/main/scala/exu/EXU.scala 106:41]
  assign io_exu2LSU_bits_toReg = io_idu2EXU_bits_toReg; // @[src/main/scala/exu/EXU.scala 107:41]
  assign io_exu2LSU_bits_ecall = io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 108:41]
  assign io_exu2LSU_bits_csrEn = io_idu2EXU_bits_csrEn; // @[src/main/scala/exu/EXU.scala 109:41]
  assign io_exu2LSU_bits_csrWr = io_idu2EXU_bits_csrWr; // @[src/main/scala/exu/EXU.scala 110:41]
  assign io_exu2CSR_mret = io_idu2EXU_bits_mret; // @[src/main/scala/exu/EXU.scala 117:49]
  assign io_exu2CSR_ecall = io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 118:49]
  assign io_exu2CSR_csr = io_idu2EXU_bits_inst[31:20]; // @[src/main/scala/exu/EXU.scala 116:60]
  assign io_exu2Branch_branchCtr = io_idu2EXU_bits_branch; // @[src/main/scala/exu/EXU.scala 112:41]
  assign io_exu2Branch_less = alu_io_less; // @[src/main/scala/exu/EXU.scala 113:49]
  assign io_exu2Branch_zero = alu_io_zero; // @[src/main/scala/exu/EXU.scala 114:49]
  assign io_rd = _io_rd_T_5[3:0]; // @[src/main/scala/exu/EXU.scala 120:17]
  assign alu_io_aluCtr = io_idu2EXU_bits_ctrALU; // @[src/main/scala/exu/EXU.scala 62:33]
  assign alu_io_srcAData = _srcADataWire_T ? io_idu2EXU_bits_rs1Data : _srcADataWire_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign alu_io_srcBData = _srcBDataWire_T ? io_idu2EXU_bits_rs2Data : _srcBDataWire_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_srcAData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 72:33]
  assign csrALU_io_srcBData = io_idu2EXU_bits_csrOP ? {{27'd0}, io_idu2EXU_bits_rs1Index} : _csrALU_io_srcBData_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_csrALUOP = io_idu2EXU_bits_csrALUOP; // @[src/main/scala/exu/EXU.scala 77:33]
  assign EFCC_valid = io_exu2LSU_valid; // @[src/main/scala/exu/EXU.scala 89:41]
  assign EFCC_counterType = 32'h8; // @[src/main/scala/exu/EXU.scala 90:41]
  assign EFCC_data = exuFinCalCnt; // @[src/main/scala/exu/EXU.scala 91:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/exu/EXU.scala 82:43]
      exuFinCalCnt <= 32'h0; // @[src/main/scala/exu/EXU.scala 82:43]
    end else if (io_idu2EXU_valid & io_idu2EXU_ready) begin // @[src/main/scala/exu/EXU.scala 83:60]
      exuFinCalCnt <= 32'h1; // @[src/main/scala/exu/EXU.scala 84:38]
    end else begin
      exuFinCalCnt <= _exuFinCalCnt_T_1; // @[src/main/scala/exu/EXU.scala 86:38]
    end
    if (reset) begin // @[src/main/scala/exu/EXU.scala 122:31]
      validReg <= 1'h0; // @[src/main/scala/exu/EXU.scala 122:31]
    end else begin
      validReg <= _GEN_5;
    end
    readyReg <= reset | _GEN_6; // @[src/main/scala/exu/EXU.scala 123:{31,31}]
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
  exuFinCalCnt = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  validReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  readyReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
