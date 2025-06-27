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
  wire [4:0] rdIndexWire = instReg[11:7]; // @[src/main/scala/idu/IDU.scala 61:31]
  wire [4:0] bImmWire_lo = {instReg[11:8],1'h0}; // @[src/main/scala/idu/IDU.scala 65:30]
  wire [7:0] bImmWire_hi = {instReg[31],instReg[7],instReg[30:25]}; // @[src/main/scala/idu/IDU.scala 65:30]
  wire [10:0] jImmWire_lo = {instReg[30:21],1'h0}; // @[src/main/scala/idu/IDU.scala 67:30]
  wire [9:0] jImmWire_hi = {instReg[31],instReg[19:12],instReg[20]}; // @[src/main/scala/idu/IDU.scala 67:30]
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
  assign immGen_io_sImm = {func7Wire,rdIndexWire}; // @[src/main/scala/idu/IDU.scala 64:30]
  assign immGen_io_bImm = {bImmWire_hi,bImmWire_lo}; // @[src/main/scala/idu/IDU.scala 65:30]
  assign immGen_io_uImm = {instReg[31:12],12'h0}; // @[src/main/scala/idu/IDU.scala 66:30]
  assign immGen_io_jImm = {jImmWire_hi,jImmWire_lo}; // @[src/main/scala/idu/IDU.scala 67:30]
  assign immGen_io_immType = contrGen_io_immType; // @[src/main/scala/idu/IDU.scala 102:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/idu/IDU.scala 21:30]
      pcReg <= 32'h30000000; // @[src/main/scala/idu/IDU.scala 21:30]
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
