module WBU(
  input         clock,
  input         reset,
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
  input  [3:0]  io_lsu2WBU_bits_branchCtr, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_less, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_zero, // @[src/main/scala/wbu/WBU.scala 14:20]
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
  input         io_wbu2PC_ready, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2PC_valid, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2PC_bits_nextPC, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2Icache // @[src/main/scala/wbu/WBU.scala 14:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] branchCond_io_branch; // @[src/main/scala/wbu/WBU.scala 50:41]
  wire  branchCond_io_less; // @[src/main/scala/wbu/WBU.scala 50:41]
  wire  branchCond_io_zero; // @[src/main/scala/wbu/WBU.scala 50:41]
  wire [1:0] branchCond_io_pcASrc; // @[src/main/scala/wbu/WBU.scala 50:41]
  wire [1:0] branchCond_io_pcBSrc; // @[src/main/scala/wbu/WBU.scala 50:41]
  reg  state; // @[src/main/scala/wbu/WBU.scala 42:34]
  wire  wb_end = io_wbu2PC_ready & io_wbu2PC_valid; // @[src/main/scala/wbu/WBU.scala 43:43]
  wire  _state_T = io_lsu2WBU_ready & io_lsu2WBU_valid; // @[src/main/scala/wbu/WBU.scala 45:49]
  wire  _io_wbu2BaseReg_data_T = io_lsu2WBU_bits_toReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 68:20]
  wire  _io_wbu2BaseReg_data_T_1 = io_lsu2WBU_bits_toReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 69:28]
  wire  _io_wbu2BaseReg_data_T_2 = io_lsu2WBU_bits_toReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 70:28]
  wire [31:0] _io_wbu2BaseReg_data_T_3 = _io_wbu2BaseReg_data_T_2 ? io_lsu2WBU_bits_csrData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2BaseReg_data_T_4 = _io_wbu2BaseReg_data_T_1 ? io_lsu2WBU_bits_memData : _io_wbu2BaseReg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T = branchCond_io_pcASrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 76:21]
  wire  _io_wbu2PC_bits_nextPC_T_1 = branchCond_io_pcASrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 77:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_4 = _io_wbu2PC_bits_nextPC_T_1 ? io_lsu2WBU_bits_immData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_5 = _io_wbu2PC_bits_nextPC_T ? 32'h4 : _io_wbu2PC_bits_nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T_6 = branchCond_io_pcBSrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 80:21]
  wire  _io_wbu2PC_bits_nextPC_T_7 = branchCond_io_pcBSrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 81:29]
  wire  _io_wbu2PC_bits_nextPC_T_8 = branchCond_io_pcBSrc == 2'h2; // @[src/main/scala/wbu/WBU.scala 82:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_9 = _io_wbu2PC_bits_nextPC_T_8 ? io_lsu2WBU_bits_csrWData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_10 = _io_wbu2PC_bits_nextPC_T_7 ? io_lsu2WBU_bits_rs1Data :
    _io_wbu2PC_bits_nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_11 = _io_wbu2PC_bits_nextPC_T_6 ? io_lsu2WBU_bits_pc :
    _io_wbu2PC_bits_nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  BranchCond branchCond ( // @[src/main/scala/wbu/WBU.scala 50:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  assign io_lsu2WBU_ready = ~state; // @[src/main/scala/wbu/WBU.scala 60:43]
  assign io_wbu2CSR_pc = io_lsu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 61:25]
  assign io_wbu2CSR_csrWData = io_lsu2WBU_bits_csrWData; // @[src/main/scala/wbu/WBU.scala 62:25]
  assign io_wbu2CSR_csr = io_lsu2WBU_bits_inst[31:20]; // @[src/main/scala/wbu/WBU.scala 63:36]
  assign io_wbu2CSR_ecall = io_lsu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 64:25]
  assign io_wbu2CSR_csrEn = io_lsu2WBU_bits_csrEn; // @[src/main/scala/wbu/WBU.scala 65:25]
  assign io_wbu2CSR_csrWr = io_lsu2WBU_bits_csrWr; // @[src/main/scala/wbu/WBU.scala 66:25]
  assign io_wbu2BaseReg_rdIndex = io_lsu2WBU_bits_inst[10:7]; // @[src/main/scala/wbu/WBU.scala 72:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? io_lsu2WBU_bits_aluData : _io_wbu2BaseReg_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2BaseReg_regWR = io_lsu2WBU_bits_regWR; // @[src/main/scala/wbu/WBU.scala 73:29]
  assign io_wbu2PC_valid = state; // @[src/main/scala/wbu/WBU.scala 74:51]
  assign io_wbu2PC_bits_nextPC = _io_wbu2PC_bits_nextPC_T_5 + _io_wbu2PC_bits_nextPC_T_11; // @[src/main/scala/wbu/WBU.scala 79:8]
  assign io_wbu2Icache = io_lsu2WBU_bits_fencei; // @[src/main/scala/wbu/WBU.scala 85:25]
  assign branchCond_io_branch = io_lsu2WBU_bits_branchCtr; // @[src/main/scala/wbu/WBU.scala 52:29]
  assign branchCond_io_less = io_lsu2WBU_bits_less; // @[src/main/scala/wbu/WBU.scala 53:33]
  assign branchCond_io_zero = io_lsu2WBU_bits_zero; // @[src/main/scala/wbu/WBU.scala 54:33]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 42:34]
      state <= 1'h0; // @[src/main/scala/wbu/WBU.scala 42:34]
    end else if (state) begin // @[src/main/scala/wbu/WBU.scala 44:52]
      if (wb_end) begin // @[src/main/scala/wbu/WBU.scala 46:31]
        state <= 1'h0;
      end else begin
        state <= 1'h1;
      end
    end else begin
      state <= _state_T;
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
  state = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
