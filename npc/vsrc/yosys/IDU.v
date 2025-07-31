module IDU(
  input         clock,
  output        io_inst_ready, // @[src/main/scala/idu/IDU.scala 15:16]
  input         io_inst_valid, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_inst_bits_inst, // @[src/main/scala/idu/IDU.scala 15:16]
  input  [31:0] io_inst_bits_pc, // @[src/main/scala/idu/IDU.scala 15:16]
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] contrGen_io_cmd; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [6:0] contrGen_io_opcode; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [2:0] contrGen_io_func3; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [6:0] contrGen_io_func7; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [2:0] contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [1:0] contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [1:0] contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [3:0] contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [3:0] contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [1:0] contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [2:0] contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 43:33]
  wire  contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [1:0] contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 43:33]
  wire [11:0] immGen_io_iImm; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [11:0] immGen_io_sImm; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [12:0] immGen_io_bImm; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [31:0] immGen_io_uImm; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [20:0] immGen_io_jImm; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [2:0] immGen_io_immType; // @[src/main/scala/idu/IDU.scala 68:33]
  wire [31:0] immGen_io_imm; // @[src/main/scala/idu/IDU.scala 68:33]
  reg [31:0] pcReg; // @[src/main/scala/idu/IDU.scala 21:30]
  reg [31:0] instReg; // @[src/main/scala/idu/IDU.scala 22:30]
  reg  valid2EXUReg; // @[src/main/scala/idu/IDU.scala 24:30]
  wire [6:0] func7Wire = instReg[31:25]; // @[src/main/scala/idu/IDU.scala 30:35]
  wire [4:0] rs2IndexWire = instReg[24:20]; // @[src/main/scala/idu/IDU.scala 31:31]
  wire [4:0] rs1IndexWire = instReg[19:15]; // @[src/main/scala/idu/IDU.scala 32:31]
  wire [4:0] bImmWire_lo = {instReg[11:8],1'h0}; // @[src/main/scala/idu/IDU.scala 38:30]
  wire [7:0] bImmWire_hi = {instReg[31],instReg[7],instReg[30:25]}; // @[src/main/scala/idu/IDU.scala 38:30]
  wire [10:0] jImmWire_lo = {instReg[30:21],1'h0}; // @[src/main/scala/idu/IDU.scala 40:30]
  wire [9:0] jImmWire_hi = {instReg[31],instReg[19:12],instReg[20]}; // @[src/main/scala/idu/IDU.scala 40:30]
  ContrGen contrGen ( // @[src/main/scala/idu/IDU.scala 43:33]
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
  ImmGen immGen ( // @[src/main/scala/idu/IDU.scala 68:33]
    .io_iImm(immGen_io_iImm),
    .io_sImm(immGen_io_sImm),
    .io_bImm(immGen_io_bImm),
    .io_uImm(immGen_io_uImm),
    .io_jImm(immGen_io_jImm),
    .io_immType(immGen_io_immType),
    .io_imm(immGen_io_imm)
  );
  assign io_inst_ready = 1'h1; // @[src/main/scala/idu/IDU.scala 23:21]
  assign io_idu2EXU_valid = valid2EXUReg; // @[src/main/scala/idu/IDU.scala 25:21]
  assign io_idu2EXU_bits_pc = pcReg; // @[src/main/scala/idu/IDU.scala 115:33]
  assign io_idu2EXU_bits_rs1Data = io_idu2BaseReg_rs1Data; // @[src/main/scala/idu/IDU.scala 116:33]
  assign io_idu2EXU_bits_rs2Data = io_idu2BaseReg_rs2Data; // @[src/main/scala/idu/IDU.scala 117:33]
  assign io_idu2EXU_bits_imm = immGen_io_imm; // @[src/main/scala/idu/IDU.scala 118:41]
  assign io_idu2EXU_bits_inst = instReg; // @[src/main/scala/idu/IDU.scala 119:33]
  assign io_idu2EXU_bits_regWR = contrGen_io_regWR; // @[src/main/scala/idu/IDU.scala 95:41]
  assign io_idu2EXU_bits_srcAALU = contrGen_io_srcAALU; // @[src/main/scala/idu/IDU.scala 96:33]
  assign io_idu2EXU_bits_srcBALU = contrGen_io_srcBALU; // @[src/main/scala/idu/IDU.scala 97:33]
  assign io_idu2EXU_bits_ctrALU = contrGen_io_ctrALU; // @[src/main/scala/idu/IDU.scala 98:41]
  assign io_idu2EXU_bits_branch = contrGen_io_branch; // @[src/main/scala/idu/IDU.scala 99:41]
  assign io_idu2EXU_bits_toReg = contrGen_io_memToReg; // @[src/main/scala/idu/IDU.scala 100:41]
  assign io_idu2EXU_bits_memWR = contrGen_io_memWR; // @[src/main/scala/idu/IDU.scala 101:41]
  assign io_idu2EXU_bits_memValid = contrGen_io_memValid; // @[src/main/scala/idu/IDU.scala 102:41]
  assign io_idu2EXU_bits_memOP = contrGen_io_memOP; // @[src/main/scala/idu/IDU.scala 103:41]
  assign io_idu2EXU_bits_rs1Index = instReg[19:15]; // @[src/main/scala/idu/IDU.scala 32:31]
  assign io_idu2EXU_bits_ecall = contrGen_io_ecall; // @[src/main/scala/idu/IDU.scala 105:33]
  assign io_idu2EXU_bits_mret = contrGen_io_mret; // @[src/main/scala/idu/IDU.scala 106:33]
  assign io_idu2EXU_bits_csrEn = contrGen_io_csrEn; // @[src/main/scala/idu/IDU.scala 107:33]
  assign io_idu2EXU_bits_csrWr = contrGen_io_csrWr; // @[src/main/scala/idu/IDU.scala 108:33]
  assign io_idu2EXU_bits_csrOP = contrGen_io_csrOP; // @[src/main/scala/idu/IDU.scala 109:33]
  assign io_idu2EXU_bits_csrALUOP = contrGen_io_csrALUOP; // @[src/main/scala/idu/IDU.scala 110:33]
  assign io_idu2BaseReg_rs1Index = rs1IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 112:29]
  assign io_idu2BaseReg_rs2Index = rs2IndexWire[3:0]; // @[src/main/scala/idu/IDU.scala 113:29]
  assign contrGen_io_cmd = instReg; // @[src/main/scala/idu/IDU.scala 45:25]
  assign contrGen_io_opcode = instReg[6:0]; // @[src/main/scala/idu/IDU.scala 35:35]
  assign contrGen_io_func3 = instReg[14:12]; // @[src/main/scala/idu/IDU.scala 33:35]
  assign contrGen_io_func7 = instReg[31:25]; // @[src/main/scala/idu/IDU.scala 30:35]
  assign immGen_io_iImm = instReg[31:20]; // @[src/main/scala/idu/IDU.scala 36:35]
  assign immGen_io_sImm = {func7Wire,instReg[11:7]}; // @[src/main/scala/idu/IDU.scala 37:30]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[src/main/scala/idu/IDU.scala 38:30]
  assign immGen_io_uImm = {instReg[31:12],12'h0}; // @[src/main/scala/idu/IDU.scala 39:30]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[src/main/scala/idu/IDU.scala 40:30]
  assign immGen_io_immType = contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 75:25]
  always @(posedge clock) begin
    pcReg <= io_inst_bits_pc; // @[src/main/scala/idu/IDU.scala 21:30]
    instReg <= io_inst_bits_inst; // @[src/main/scala/idu/IDU.scala 22:30]
    valid2EXUReg <= io_inst_ready & io_inst_valid; // @[src/main/scala/idu/IDU.scala 24:45]
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
  valid2EXUReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
