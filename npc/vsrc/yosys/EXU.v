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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
