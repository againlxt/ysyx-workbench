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
  input         io_isRAW, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_flush // @[src/main/scala/idu/IDU.scala 15:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] contrGen_io_cmd; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [6:0] contrGen_io_opcode; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [2:0] contrGen_io_func3; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [6:0] contrGen_io_func7; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [2:0] contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [1:0] contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [1:0] contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [3:0] contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [3:0] contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [1:0] contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [2:0] contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 38:33]
  wire  contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [1:0] contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 38:33]
  wire [11:0] immGen_io_iImm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [11:0] immGen_io_sImm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [12:0] immGen_io_bImm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [31:0] immGen_io_uImm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [20:0] immGen_io_jImm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [2:0] immGen_io_immType; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [31:0] immGen_io_imm; // @[src/main/scala/idu/IDU.scala 63:33]
  wire [6:0] func7Wire = io_inst_bits_inst[31:25]; // @[src/main/scala/idu/IDU.scala 25:35]
  wire [4:0] rs2IndexWire = io_inst_bits_inst[24:20]; // @[src/main/scala/idu/IDU.scala 26:31]
  wire [4:0] rs1IndexWire = io_inst_bits_inst[19:15]; // @[src/main/scala/idu/IDU.scala 27:31]
  wire [4:0] rdIndexWire = io_inst_bits_inst[11:7]; // @[src/main/scala/idu/IDU.scala 29:31]
  wire [4:0] bImmWire_lo = {io_inst_bits_inst[11:8],1'h0}; // @[src/main/scala/idu/IDU.scala 33:30]
  wire [7:0] bImmWire_hi = {io_inst_bits_inst[31],io_inst_bits_inst[7],io_inst_bits_inst[30:25]}; // @[src/main/scala/idu/IDU.scala 33:30]
  wire [10:0] jImmWire_lo = {io_inst_bits_inst[30:21],1'h0}; // @[src/main/scala/idu/IDU.scala 35:30]
  wire [9:0] jImmWire_hi = {io_inst_bits_inst[31],io_inst_bits_inst[19:12],io_inst_bits_inst[20]}; // @[src/main/scala/idu/IDU.scala 35:30]
  reg  validReg; // @[src/main/scala/idu/IDU.scala 117:27]
  reg  readyReg; // @[src/main/scala/idu/IDU.scala 118:31]
  wire  _validReg_T = io_inst_valid & io_inst_ready; // @[src/main/scala/idu/IDU.scala 121:49]
  wire  _validReg_T_1 = io_idu2EXU_valid & io_idu2EXU_ready; // @[src/main/scala/idu/IDU.scala 123:50]
  wire  _validReg_T_4 = io_idu2EXU_valid & io_idu2EXU_ready ? _validReg_T : 1'h1; // @[src/main/scala/idu/IDU.scala 123:32]
  wire  _GEN_0 = validReg ? _validReg_T_4 : validReg; // @[src/main/scala/idu/IDU.scala 120:26 123:26 117:27]
  wire  _GEN_1 = ~validReg ? io_inst_valid & io_inst_ready : _GEN_0; // @[src/main/scala/idu/IDU.scala 120:26 121:32]
  wire  _readyReg_T_4 = _validReg_T ? _validReg_T_1 : 1'h1; // @[src/main/scala/idu/IDU.scala 130:32]
  wire  _GEN_2 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/idu/IDU.scala 127:26 130:26 118:31]
  wire  _GEN_3 = ~readyReg ? _validReg_T_1 : _GEN_2; // @[src/main/scala/idu/IDU.scala 127:26 128:32]
  wire  _GEN_4 = ~io_flush & _GEN_1; // @[src/main/scala/idu/IDU.scala 119:21 135:18]
  wire  _GEN_5 = ~io_flush ? _GEN_3 : 1'h1; // @[src/main/scala/idu/IDU.scala 119:21 136:26]
  wire  _io_inst_ready_T = ~io_isRAW; // @[src/main/scala/idu/IDU.scala 138:47]
  ContrGen contrGen ( // @[src/main/scala/idu/IDU.scala 38:33]
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
  ImmGen immGen ( // @[src/main/scala/idu/IDU.scala 63:33]
    .io_iImm(immGen_io_iImm),
    .io_sImm(immGen_io_sImm),
    .io_bImm(immGen_io_bImm),
    .io_uImm(immGen_io_uImm),
    .io_jImm(immGen_io_jImm),
    .io_immType(immGen_io_immType),
    .io_imm(immGen_io_imm)
  );
  assign io_inst_ready = readyReg & ~io_isRAW; // @[src/main/scala/idu/IDU.scala 138:45]
  assign io_idu2EXU_valid = validReg & _io_inst_ready_T; // @[src/main/scala/idu/IDU.scala 139:37]
  assign io_idu2EXU_bits_pc = io_inst_bits_pc; // @[src/main/scala/idu/IDU.scala 111:33]
  assign io_idu2EXU_bits_rs1Data = io_idu2BaseReg_rs1Data; // @[src/main/scala/idu/IDU.scala 112:33]
  assign io_idu2EXU_bits_rs2Data = io_idu2BaseReg_rs2Data; // @[src/main/scala/idu/IDU.scala 113:33]
  assign io_idu2EXU_bits_imm = immGen_io_imm; // @[src/main/scala/idu/IDU.scala 114:41]
  assign io_idu2EXU_bits_inst = io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 115:33]
  assign io_idu2EXU_bits_regWR = contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 91:41]
  assign io_idu2EXU_bits_srcAALU = contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 92:33]
  assign io_idu2EXU_bits_srcBALU = contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 93:33]
  assign io_idu2EXU_bits_ctrALU = contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 94:41]
  assign io_idu2EXU_bits_branch = contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 95:41]
  assign io_idu2EXU_bits_toReg = contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 96:41]
  assign io_idu2EXU_bits_memWR = contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 97:41]
  assign io_idu2EXU_bits_memValid = contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 98:41]
  assign io_idu2EXU_bits_memOP = contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 99:41]
  assign io_idu2EXU_bits_rs1Index = io_inst_bits_inst[19:15]; // @[src/main/scala/idu/IDU.scala 27:31]
  assign io_idu2EXU_bits_ecall = contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 101:33]
  assign io_idu2EXU_bits_mret = contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 102:33]
  assign io_idu2EXU_bits_csrEn = contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 103:33]
  assign io_idu2EXU_bits_csrWr = contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 104:33]
  assign io_idu2EXU_bits_csrOP = contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 105:33]
  assign io_idu2EXU_bits_csrALUOP = contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 106:33]
  assign io_idu2BaseReg_rs1Index = rs1IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 108:29]
  assign io_idu2BaseReg_rs2Index = rs2IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 109:29]
  assign contrGen_io_cmd = io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 40:25]
  assign contrGen_io_opcode = io_inst_bits_inst[6:0]; // @[src/main/scala/idu/IDU.scala 30:35]
  assign contrGen_io_func3 = io_inst_bits_inst[14:12]; // @[src/main/scala/idu/IDU.scala 28:35]
  assign contrGen_io_func7 = io_inst_bits_inst[31:25]; // @[src/main/scala/idu/IDU.scala 25:35]
  assign immGen_io_iImm = io_inst_bits_inst[31:20]; // @[src/main/scala/idu/IDU.scala 31:35]
  assign immGen_io_sImm = {func7Wire,rdIndexWire}; // @[src/main/scala/idu/IDU.scala 32:30]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[src/main/scala/idu/IDU.scala 33:30]
  assign immGen_io_uImm = {io_inst_bits_inst[31:12],12'h0}; // @[src/main/scala/idu/IDU.scala 34:30]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[src/main/scala/idu/IDU.scala 35:30]
  assign immGen_io_immType = contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 70:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/idu/IDU.scala 117:27]
      validReg <= 1'h0; // @[src/main/scala/idu/IDU.scala 117:27]
    end else begin
      validReg <= _GEN_4;
    end
    readyReg <= reset | _GEN_5; // @[src/main/scala/idu/IDU.scala 118:{31,31}]
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
  validReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  readyReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
