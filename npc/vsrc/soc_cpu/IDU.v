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
  output [3:0]  io_idu2BaseReg_rs2Index, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [3:0]  io_iduBypass_rd_0, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [3:0]  io_iduBypass_rd_1, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [3:0]  io_iduBypass_rd_2, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_iduBypass_data_0, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_iduBypass_data_1, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_iduBypass_data_2, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_regWR_0, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_regWR_1, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_regWR_2, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_Valid_0, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_Valid_1, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_iduBypass_Valid_2, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_isRAW, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_flush // @[src/main/scala/idu/IDU.scala 15:16]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] contrGen_io_cmd; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [6:0] contrGen_io_opcode; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [2:0] contrGen_io_func3; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [6:0] contrGen_io_func7; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [2:0] contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [1:0] contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [1:0] contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [3:0] contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [3:0] contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [1:0] contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [2:0] contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 39:33]
  wire  contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [1:0] contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 39:33]
  wire [11:0] immGen_io_iImm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [11:0] immGen_io_sImm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [12:0] immGen_io_bImm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [31:0] immGen_io_uImm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [20:0] immGen_io_jImm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [2:0] immGen_io_immType; // @[src/main/scala/idu/IDU.scala 64:33]
  wire [31:0] immGen_io_imm; // @[src/main/scala/idu/IDU.scala 64:33]
  wire  instTypeCnt_valid; // @[src/main/scala/idu/IDU.scala 99:45]
  wire [31:0] instTypeCnt_counterType; // @[src/main/scala/idu/IDU.scala 99:45]
  wire [31:0] instTypeCnt_data; // @[src/main/scala/idu/IDU.scala 99:45]
  wire [6:0] func7Wire = io_inst_bits_inst[31:25]; // @[src/main/scala/idu/IDU.scala 26:35]
  wire [4:0] rs2IndexWire = io_inst_bits_inst[24:20]; // @[src/main/scala/idu/IDU.scala 27:31]
  wire [4:0] rs1IndexWire = io_inst_bits_inst[19:15]; // @[src/main/scala/idu/IDU.scala 28:31]
  wire [6:0] opcodeWire = io_inst_bits_inst[6:0]; // @[src/main/scala/idu/IDU.scala 31:35]
  wire [4:0] bImmWire_lo = {io_inst_bits_inst[11:8],1'h0}; // @[src/main/scala/idu/IDU.scala 34:30]
  wire [7:0] bImmWire_hi = {io_inst_bits_inst[31],io_inst_bits_inst[7],io_inst_bits_inst[30:25]}; // @[src/main/scala/idu/IDU.scala 34:30]
  wire [10:0] jImmWire_lo = {io_inst_bits_inst[30:21],1'h0}; // @[src/main/scala/idu/IDU.scala 36:30]
  wire [9:0] jImmWire_hi = {io_inst_bits_inst[31],io_inst_bits_inst[19:12],io_inst_bits_inst[20]}; // @[src/main/scala/idu/IDU.scala 36:30]
  wire  _bypassRdReg_T = io_inst_valid & io_inst_ready; // @[src/main/scala/idu/IDU.scala 75:64]
  reg [3:0] bypassRdReg_0; // @[src/main/scala/idu/IDU.scala 75:32]
  reg [3:0] bypassRdReg_1; // @[src/main/scala/idu/IDU.scala 75:32]
  reg [3:0] bypassRdReg_2; // @[src/main/scala/idu/IDU.scala 75:32]
  reg  bypassWRReg_0; // @[src/main/scala/idu/IDU.scala 76:32]
  reg  bypassWRReg_1; // @[src/main/scala/idu/IDU.scala 76:32]
  reg  bypassWRReg_2; // @[src/main/scala/idu/IDU.scala 76:32]
  reg  bypassValidReg_0; // @[src/main/scala/idu/IDU.scala 77:38]
  reg  bypassValidReg_1; // @[src/main/scala/idu/IDU.scala 77:38]
  reg  bypassValidReg_2; // @[src/main/scala/idu/IDU.scala 77:38]
  reg [31:0] bypassDataReg_0; // @[src/main/scala/idu/IDU.scala 78:38]
  reg [31:0] bypassDataReg_1; // @[src/main/scala/idu/IDU.scala 78:38]
  reg [31:0] bypassDataReg_2; // @[src/main/scala/idu/IDU.scala 78:38]
  wire [4:0] _GEN_18 = {{1'd0}, bypassRdReg_0}; // @[src/main/scala/idu/IDU.scala 80:25]
  wire  _rs1DataWire_T_2 = _GEN_18 == rs1IndexWire & bypassWRReg_0 & bypassValidReg_0; // @[src/main/scala/idu/IDU.scala 80:59]
  wire [4:0] _GEN_19 = {{1'd0}, bypassRdReg_1}; // @[src/main/scala/idu/IDU.scala 81:25]
  wire  _rs1DataWire_T_5 = _GEN_19 == rs1IndexWire & bypassWRReg_1 & bypassValidReg_1; // @[src/main/scala/idu/IDU.scala 81:59]
  wire [4:0] _GEN_20 = {{1'd0}, bypassRdReg_2}; // @[src/main/scala/idu/IDU.scala 82:25]
  wire  _rs1DataWire_T_8 = _GEN_20 == rs1IndexWire & bypassWRReg_2 & bypassValidReg_2; // @[src/main/scala/idu/IDU.scala 82:59]
  wire [31:0] _rs1DataWire_T_9 = _rs1DataWire_T_8 ? bypassDataReg_2 : io_idu2BaseReg_rs1Data; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rs1DataWire_T_10 = _rs1DataWire_T_5 ? bypassDataReg_1 : _rs1DataWire_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _rs2DataWire_T_2 = _GEN_18 == rs2IndexWire & bypassWRReg_0 & bypassValidReg_0; // @[src/main/scala/idu/IDU.scala 85:59]
  wire  _rs2DataWire_T_5 = _GEN_19 == rs2IndexWire & bypassWRReg_1 & bypassValidReg_1; // @[src/main/scala/idu/IDU.scala 86:59]
  wire  _rs2DataWire_T_8 = _GEN_20 == rs2IndexWire & bypassWRReg_2 & bypassValidReg_2; // @[src/main/scala/idu/IDU.scala 87:59]
  wire [31:0] _rs2DataWire_T_9 = _rs2DataWire_T_8 ? bypassDataReg_2 : io_idu2BaseReg_rs2Data; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rs2DataWire_T_10 = _rs2DataWire_T_5 ? bypassDataReg_1 : _rs2DataWire_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _instType_T_3 = opcodeWire == 7'h67 | opcodeWire == 7'h6f; // @[src/main/scala/idu/IDU.scala 93:42]
  wire  _instType_T_5 = opcodeWire == 7'h23; // @[src/main/scala/idu/IDU.scala 94:25]
  wire  _instType_T_7 = opcodeWire == 7'h3; // @[src/main/scala/idu/IDU.scala 95:25]
  wire  _instType_T_11 = opcodeWire == 7'h13 | opcodeWire == 7'h33; // @[src/main/scala/idu/IDU.scala 96:42]
  wire  _instType_T_13 = opcodeWire == 7'h73; // @[src/main/scala/idu/IDU.scala 97:25]
  wire [2:0] _instType_T_15 = _instType_T_13 ? 3'h5 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_16 = _instType_T_11 ? 3'h4 : _instType_T_15; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_17 = _instType_T_7 ? 3'h3 : _instType_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _instType_T_18 = _instType_T_5 ? 3'h2 : _instType_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] instType = _instType_T_3 ? 3'h1 : _instType_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  validReg; // @[src/main/scala/idu/IDU.scala 133:27]
  reg  readyReg; // @[src/main/scala/idu/IDU.scala 134:31]
  wire  _validReg_T_1 = io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/idu/IDU.scala 139:50]
  wire  _validReg_T_4 = io_idu2EXU_valid & io_idu2EXU_ready ? _bypassRdReg_T : 1'h1; // @[src/main/scala/idu/IDU.scala 139:32]
  wire  _GEN_12 = validReg ? _validReg_T_4 : validReg; // @[src/main/scala/idu/IDU.scala 136:26 139:26 133:27]
  wire  _GEN_13 = ~validReg ? _bypassRdReg_T : _GEN_12; // @[src/main/scala/idu/IDU.scala 136:26 137:32]
  wire  _readyReg_T_4 = _bypassRdReg_T ? _validReg_T_1 : 1'h1; // @[src/main/scala/idu/IDU.scala 146:32]
  wire  _GEN_14 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/idu/IDU.scala 143:26 146:26 134:31]
  wire  _GEN_15 = ~readyReg ? _validReg_T_1 : _GEN_14; // @[src/main/scala/idu/IDU.scala 143:26 144:32]
  wire  _GEN_16 = ~io_flush & _GEN_13; // @[src/main/scala/idu/IDU.scala 135:21 151:18]
  wire  _GEN_17 = ~io_flush ? _GEN_15 : 1'h1; // @[src/main/scala/idu/IDU.scala 135:21 152:26]
  wire  _io_inst_ready_T = ~io_isRAW; // @[src/main/scala/idu/IDU.scala 154:47]
  ContrGen contrGen ( // @[src/main/scala/idu/IDU.scala 39:33]
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
  ImmGen immGen ( // @[src/main/scala/idu/IDU.scala 64:33]
    .io_iImm(immGen_io_iImm),
    .io_sImm(immGen_io_sImm),
    .io_bImm(immGen_io_bImm),
    .io_uImm(immGen_io_uImm),
    .io_jImm(immGen_io_jImm),
    .io_immType(immGen_io_immType),
    .io_imm(immGen_io_imm)
  );
  PerformanceCounter instTypeCnt ( // @[src/main/scala/idu/IDU.scala 99:45]
    .valid(instTypeCnt_valid),
    .counterType(instTypeCnt_counterType),
    .data(instTypeCnt_data)
  );
  assign io_inst_ready = readyReg & ~io_isRAW; // @[src/main/scala/idu/IDU.scala 154:45]
  assign io_idu2EXU_valid = validReg & _io_inst_ready_T; // @[src/main/scala/idu/IDU.scala 155:37]
  assign io_idu2EXU_bits_pc = io_inst_bits_pc; // @[src/main/scala/idu/IDU.scala 127:33]
  assign io_idu2EXU_bits_rs1Data = _rs1DataWire_T_2 ? bypassDataReg_0 : _rs1DataWire_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_idu2EXU_bits_rs2Data = _rs2DataWire_T_2 ? bypassDataReg_0 : _rs2DataWire_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_idu2EXU_bits_imm = immGen_io_imm; // @[src/main/scala/idu/IDU.scala 130:41]
  assign io_idu2EXU_bits_inst = io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 131:33]
  assign io_idu2EXU_bits_regWR = contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 107:41]
  assign io_idu2EXU_bits_srcAALU = contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 108:33]
  assign io_idu2EXU_bits_srcBALU = contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 109:33]
  assign io_idu2EXU_bits_ctrALU = contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 110:41]
  assign io_idu2EXU_bits_branch = contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 111:41]
  assign io_idu2EXU_bits_toReg = contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 112:41]
  assign io_idu2EXU_bits_memWR = contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 113:41]
  assign io_idu2EXU_bits_memValid = contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 114:41]
  assign io_idu2EXU_bits_memOP = contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 115:41]
  assign io_idu2EXU_bits_rs1Index = io_inst_bits_inst[19:15]; // @[src/main/scala/idu/IDU.scala 28:31]
  assign io_idu2EXU_bits_ecall = contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 117:33]
  assign io_idu2EXU_bits_mret = contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 118:33]
  assign io_idu2EXU_bits_csrEn = contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 119:33]
  assign io_idu2EXU_bits_csrWr = contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 120:33]
  assign io_idu2EXU_bits_csrOP = contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 121:33]
  assign io_idu2EXU_bits_csrALUOP = contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 122:33]
  assign io_idu2BaseReg_rs1Index = rs1IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 124:29]
  assign io_idu2BaseReg_rs2Index = rs2IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 125:29]
  assign contrGen_io_cmd = io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 41:25]
  assign contrGen_io_opcode = io_inst_bits_inst[6:0]; // @[src/main/scala/idu/IDU.scala 31:35]
  assign contrGen_io_func3 = io_inst_bits_inst[14:12]; // @[src/main/scala/idu/IDU.scala 29:35]
  assign contrGen_io_func7 = io_inst_bits_inst[31:25]; // @[src/main/scala/idu/IDU.scala 26:35]
  assign immGen_io_iImm = io_inst_bits_inst[31:20]; // @[src/main/scala/idu/IDU.scala 32:35]
  assign immGen_io_sImm = {func7Wire,io_inst_bits_inst[11:7]}; // @[src/main/scala/idu/IDU.scala 33:30]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[src/main/scala/idu/IDU.scala 34:30]
  assign immGen_io_uImm = {io_inst_bits_inst[31:12],12'h0}; // @[src/main/scala/idu/IDU.scala 35:30]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[src/main/scala/idu/IDU.scala 36:30]
  assign immGen_io_immType = contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 71:25]
  assign instTypeCnt_valid = io_idu2EXU_valid; // @[src/main/scala/idu/IDU.scala 100:37]
  assign instTypeCnt_counterType = {{29'd0}, instType}; // @[src/main/scala/idu/IDU.scala 101:37]
  assign instTypeCnt_data = 32'h0; // @[src/main/scala/idu/IDU.scala 102:37]
  always @(posedge clock) begin
    if (io_inst_valid & io_inst_ready) begin // @[src/main/scala/idu/IDU.scala 75:32]
      bypassRdReg_0 <= io_iduBypass_rd_0; // @[src/main/scala/idu/IDU.scala 75:32]
    end
    if (io_inst_valid & io_inst_ready) begin // @[src/main/scala/idu/IDU.scala 75:32]
      bypassRdReg_1 <= io_iduBypass_rd_1; // @[src/main/scala/idu/IDU.scala 75:32]
    end
    if (io_inst_valid & io_inst_ready) begin // @[src/main/scala/idu/IDU.scala 75:32]
      bypassRdReg_2 <= io_iduBypass_rd_2; // @[src/main/scala/idu/IDU.scala 75:32]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 76:32]
      bypassWRReg_0 <= io_iduBypass_regWR_0; // @[src/main/scala/idu/IDU.scala 76:32]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 76:32]
      bypassWRReg_1 <= io_iduBypass_regWR_1; // @[src/main/scala/idu/IDU.scala 76:32]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 76:32]
      bypassWRReg_2 <= io_iduBypass_regWR_2; // @[src/main/scala/idu/IDU.scala 76:32]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 77:38]
      bypassValidReg_0 <= io_iduBypass_Valid_0; // @[src/main/scala/idu/IDU.scala 77:38]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 77:38]
      bypassValidReg_1 <= io_iduBypass_Valid_1; // @[src/main/scala/idu/IDU.scala 77:38]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 77:38]
      bypassValidReg_2 <= io_iduBypass_Valid_2; // @[src/main/scala/idu/IDU.scala 77:38]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 78:38]
      bypassDataReg_0 <= io_iduBypass_data_0; // @[src/main/scala/idu/IDU.scala 78:38]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 78:38]
      bypassDataReg_1 <= io_iduBypass_data_1; // @[src/main/scala/idu/IDU.scala 78:38]
    end
    if (_bypassRdReg_T) begin // @[src/main/scala/idu/IDU.scala 78:38]
      bypassDataReg_2 <= io_iduBypass_data_2; // @[src/main/scala/idu/IDU.scala 78:38]
    end
    if (reset) begin // @[src/main/scala/idu/IDU.scala 133:27]
      validReg <= 1'h0; // @[src/main/scala/idu/IDU.scala 133:27]
    end else begin
      validReg <= _GEN_16;
    end
    readyReg <= reset | _GEN_17; // @[src/main/scala/idu/IDU.scala 134:{31,31}]
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
  bypassRdReg_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  bypassRdReg_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  bypassRdReg_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  bypassWRReg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bypassWRReg_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bypassWRReg_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  bypassValidReg_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  bypassValidReg_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  bypassValidReg_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  bypassDataReg_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  bypassDataReg_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  bypassDataReg_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  validReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  readyReg = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
