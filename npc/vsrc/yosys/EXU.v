module EXU(
  input         clock,
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
  output [3:0]  io_exu2LSU_bits_branchCtr, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_less, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_zero, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_ecall, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_csrEn, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2LSU_bits_csrWr, // @[src/main/scala/exu/EXU.scala 16:20]
  input  [31:0] io_exu2CSR_csrData, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2CSR_mret, // @[src/main/scala/exu/EXU.scala 16:20]
  output        io_exu2CSR_ecall, // @[src/main/scala/exu/EXU.scala 16:20]
  output [11:0] io_exu2CSR_csr // @[src/main/scala/exu/EXU.scala 16:20]
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] alu_io_aluCtr; // @[src/main/scala/exu/EXU.scala 83:25]
  wire [31:0] alu_io_srcAData; // @[src/main/scala/exu/EXU.scala 83:25]
  wire [31:0] alu_io_srcBData; // @[src/main/scala/exu/EXU.scala 83:25]
  wire  alu_io_less; // @[src/main/scala/exu/EXU.scala 83:25]
  wire  alu_io_zero; // @[src/main/scala/exu/EXU.scala 83:25]
  wire [31:0] alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 83:25]
  wire [31:0] csrALU_io_srcAData; // @[src/main/scala/exu/EXU.scala 93:41]
  wire [31:0] csrALU_io_srcBData; // @[src/main/scala/exu/EXU.scala 93:41]
  wire [1:0] csrALU_io_csrALUOP; // @[src/main/scala/exu/EXU.scala 93:41]
  wire [31:0] csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 93:41]
  reg [31:0] pcReg; // @[src/main/scala/exu/EXU.scala 22:42]
  reg [31:0] rs1DataReg; // @[src/main/scala/exu/EXU.scala 23:34]
  reg [31:0] rs2DataReg; // @[src/main/scala/exu/EXU.scala 24:34]
  reg [31:0] immReg; // @[src/main/scala/exu/EXU.scala 25:42]
  reg [31:0] instReg; // @[src/main/scala/exu/EXU.scala 26:34]
  reg  regWRReg; // @[src/main/scala/exu/EXU.scala 28:34]
  reg [1:0] srcAALUReg; // @[src/main/scala/exu/EXU.scala 29:34]
  reg [1:0] srcBALUReg; // @[src/main/scala/exu/EXU.scala 30:34]
  reg [3:0] ctrALUReg; // @[src/main/scala/exu/EXU.scala 31:34]
  reg [3:0] branchReg; // @[src/main/scala/exu/EXU.scala 32:34]
  reg [1:0] toRegReg; // @[src/main/scala/exu/EXU.scala 33:34]
  reg  memWRReg; // @[src/main/scala/exu/EXU.scala 34:34]
  reg  memValidReg; // @[src/main/scala/exu/EXU.scala 35:34]
  reg [2:0] memOPReg; // @[src/main/scala/exu/EXU.scala 36:34]
  reg [4:0] rs1IndexReg; // @[src/main/scala/exu/EXU.scala 37:34]
  reg  ecallReg; // @[src/main/scala/exu/EXU.scala 38:34]
  reg  mretReg; // @[src/main/scala/exu/EXU.scala 39:34]
  reg  csrEnReg; // @[src/main/scala/exu/EXU.scala 40:34]
  reg  csrWrReg; // @[src/main/scala/exu/EXU.scala 41:34]
  reg  csrOPReg; // @[src/main/scala/exu/EXU.scala 42:34]
  reg [1:0] csrALUOPReg; // @[src/main/scala/exu/EXU.scala 43:34]
  reg  handReg; // @[src/main/scala/exu/EXU.scala 45:34]
  wire  _srcADataWire_T = srcAALUReg == 2'h0; // @[src/main/scala/exu/EXU.scala 75:33]
  wire  _srcADataWire_T_1 = srcAALUReg == 2'h1; // @[src/main/scala/exu/EXU.scala 76:33]
  wire [31:0] _srcADataWire_T_2 = _srcADataWire_T_1 ? pcReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _srcBDataWire_T = srcBALUReg == 2'h0; // @[src/main/scala/exu/EXU.scala 79:33]
  wire  _srcBDataWire_T_1 = srcBALUReg == 2'h1; // @[src/main/scala/exu/EXU.scala 80:33]
  wire  _srcBDataWire_T_2 = srcBALUReg == 2'h2; // @[src/main/scala/exu/EXU.scala 81:33]
  wire [31:0] _srcBDataWire_T_3 = _srcBDataWire_T_2 ? 32'h4 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _srcBDataWire_T_4 = _srcBDataWire_T_1 ? immReg : _srcBDataWire_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _csrALU_io_srcBData_T_1 = ~csrOPReg; // @[src/main/scala/exu/EXU.scala 98:28]
  wire [31:0] _csrALU_io_srcBData_T_2 = _csrALU_io_srcBData_T_1 ? rs1DataReg : {{27'd0}, rs1IndexReg}; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  ALU alu ( // @[src/main/scala/exu/EXU.scala 83:25]
    .io_aluCtr(alu_io_aluCtr),
    .io_srcAData(alu_io_srcAData),
    .io_srcBData(alu_io_srcBData),
    .io_less(alu_io_less),
    .io_zero(alu_io_zero),
    .io_aluOut(alu_io_aluOut)
  );
  CSRALU csrALU ( // @[src/main/scala/exu/EXU.scala 93:41]
    .io_srcAData(csrALU_io_srcAData),
    .io_srcBData(csrALU_io_srcBData),
    .io_csrALUOP(csrALU_io_csrALUOP),
    .io_oData(csrALU_io_oData)
  );
  assign io_idu2EXU_ready = 1'h1; // @[src/main/scala/exu/EXU.scala 46:25]
  assign io_exu2LSU_valid = handReg; // @[src/main/scala/exu/EXU.scala 47:25]
  assign io_exu2LSU_bits_pc = pcReg; // @[src/main/scala/exu/EXU.scala 117:49]
  assign io_exu2LSU_bits_memData = rs2DataReg; // @[src/main/scala/exu/EXU.scala 118:41]
  assign io_exu2LSU_bits_aluData = alu_io_aluOut; // @[src/main/scala/exu/EXU.scala 119:41]
  assign io_exu2LSU_bits_csrWData = csrALU_io_oData; // @[src/main/scala/exu/EXU.scala 120:41]
  assign io_exu2LSU_bits_csrData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 121:41]
  assign io_exu2LSU_bits_immData = immReg; // @[src/main/scala/exu/EXU.scala 122:41]
  assign io_exu2LSU_bits_rs1Data = rs1DataReg; // @[src/main/scala/exu/EXU.scala 123:41]
  assign io_exu2LSU_bits_inst = instReg; // @[src/main/scala/exu/EXU.scala 124:41]
  assign io_exu2LSU_bits_regWR = regWRReg; // @[src/main/scala/exu/EXU.scala 126:41]
  assign io_exu2LSU_bits_memWR = memWRReg; // @[src/main/scala/exu/EXU.scala 127:41]
  assign io_exu2LSU_bits_memValid = memValidReg; // @[src/main/scala/exu/EXU.scala 128:41]
  assign io_exu2LSU_bits_memOP = memOPReg; // @[src/main/scala/exu/EXU.scala 129:41]
  assign io_exu2LSU_bits_toReg = toRegReg; // @[src/main/scala/exu/EXU.scala 130:41]
  assign io_exu2LSU_bits_branchCtr = branchReg; // @[src/main/scala/exu/EXU.scala 131:41]
  assign io_exu2LSU_bits_less = alu_io_less; // @[src/main/scala/exu/EXU.scala 132:41]
  assign io_exu2LSU_bits_zero = alu_io_zero; // @[src/main/scala/exu/EXU.scala 133:41]
  assign io_exu2LSU_bits_ecall = ecallReg; // @[src/main/scala/exu/EXU.scala 134:41]
  assign io_exu2LSU_bits_csrEn = csrEnReg; // @[src/main/scala/exu/EXU.scala 135:41]
  assign io_exu2LSU_bits_csrWr = csrWrReg; // @[src/main/scala/exu/EXU.scala 136:41]
  assign io_exu2CSR_mret = mretReg; // @[src/main/scala/exu/EXU.scala 139:49]
  assign io_exu2CSR_ecall = ecallReg; // @[src/main/scala/exu/EXU.scala 140:49]
  assign io_exu2CSR_csr = instReg[31:20]; // @[src/main/scala/exu/EXU.scala 138:60]
  assign alu_io_aluCtr = ctrALUReg; // @[src/main/scala/exu/EXU.scala 85:33]
  assign alu_io_srcAData = _srcADataWire_T ? rs1DataReg : _srcADataWire_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign alu_io_srcBData = _srcBDataWire_T ? rs2DataReg : _srcBDataWire_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_srcAData = io_exu2CSR_csrData; // @[src/main/scala/exu/EXU.scala 95:33]
  assign csrALU_io_srcBData = csrOPReg ? {{27'd0}, rs1IndexReg} : _csrALU_io_srcBData_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign csrALU_io_csrALUOP = csrALUOPReg; // @[src/main/scala/exu/EXU.scala 100:33]
  always @(posedge clock) begin
    pcReg <= io_idu2EXU_bits_pc; // @[src/main/scala/exu/EXU.scala 22:42]
    rs1DataReg <= io_idu2EXU_bits_rs1Data; // @[src/main/scala/exu/EXU.scala 23:34]
    rs2DataReg <= io_idu2EXU_bits_rs2Data; // @[src/main/scala/exu/EXU.scala 24:34]
    immReg <= io_idu2EXU_bits_imm; // @[src/main/scala/exu/EXU.scala 25:42]
    instReg <= io_idu2EXU_bits_inst; // @[src/main/scala/exu/EXU.scala 26:34]
    regWRReg <= io_idu2EXU_bits_regWR; // @[src/main/scala/exu/EXU.scala 28:34]
    srcAALUReg <= io_idu2EXU_bits_srcAALU; // @[src/main/scala/exu/EXU.scala 29:34]
    srcBALUReg <= io_idu2EXU_bits_srcBALU; // @[src/main/scala/exu/EXU.scala 30:34]
    ctrALUReg <= io_idu2EXU_bits_ctrALU; // @[src/main/scala/exu/EXU.scala 31:34]
    branchReg <= io_idu2EXU_bits_branch; // @[src/main/scala/exu/EXU.scala 32:34]
    toRegReg <= io_idu2EXU_bits_toReg; // @[src/main/scala/exu/EXU.scala 33:34]
    memWRReg <= io_idu2EXU_bits_memWR; // @[src/main/scala/exu/EXU.scala 34:34]
    memValidReg <= io_idu2EXU_bits_memValid; // @[src/main/scala/exu/EXU.scala 35:34]
    memOPReg <= io_idu2EXU_bits_memOP; // @[src/main/scala/exu/EXU.scala 36:34]
    rs1IndexReg <= io_idu2EXU_bits_rs1Index; // @[src/main/scala/exu/EXU.scala 37:34]
    ecallReg <= io_idu2EXU_bits_ecall; // @[src/main/scala/exu/EXU.scala 38:34]
    mretReg <= io_idu2EXU_bits_mret; // @[src/main/scala/exu/EXU.scala 39:34]
    csrEnReg <= io_idu2EXU_bits_csrEn; // @[src/main/scala/exu/EXU.scala 40:34]
    csrWrReg <= io_idu2EXU_bits_csrWr; // @[src/main/scala/exu/EXU.scala 41:34]
    csrOPReg <= io_idu2EXU_bits_csrOP; // @[src/main/scala/exu/EXU.scala 42:34]
    csrALUOPReg <= io_idu2EXU_bits_csrALUOP; // @[src/main/scala/exu/EXU.scala 43:34]
    handReg <= io_idu2EXU_ready & io_idu2EXU_valid; // @[src/main/scala/exu/EXU.scala 45:52]
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
  handReg = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
