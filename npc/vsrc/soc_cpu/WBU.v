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
  input  [31:0] io_lsu2WBU_bits_inst, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_regWR, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [1:0]  io_lsu2WBU_bits_toReg, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_ecall, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_csrEn, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_csrWr, // @[src/main/scala/wbu/WBU.scala 14:20]
  input         io_lsu2WBU_bits_fencei, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2CSR_pc, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/wbu/WBU.scala 14:20]
  input  [31:0] io_wbu2CSR_mtvec, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [11:0] io_wbu2CSR_csr, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_ecall, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_csrEn, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2CSR_csrWr, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_wbu2BaseReg_data, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2BaseReg_regWR, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_wbu2Icache, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [3:0]  io_rd, // @[src/main/scala/wbu/WBU.scala 14:20]
  output        io_flush, // @[src/main/scala/wbu/WBU.scala 14:20]
  output [31:0] io_correctPC // @[src/main/scala/wbu/WBU.scala 14:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] getCurPC_pc; // @[src/main/scala/wbu/WBU.scala 49:41]
  wire [31:0] getNextPC_nextPC; // @[src/main/scala/wbu/WBU.scala 50:41]
  wire [31:0] getCmd_cmd; // @[src/main/scala/wbu/WBU.scala 51:49]
  wire  wbuEnd_handshake; // @[src/main/scala/wbu/WBU.scala 52:33]
  wire  handWire = io_lsu2WBU_valid & io_lsu2WBU_ready; // @[src/main/scala/wbu/WBU.scala 23:44]
  reg  handReg; // @[src/main/scala/wbu/WBU.scala 36:42]
  reg  handRReg; // @[src/main/scala/wbu/WBU.scala 37:42]
  reg  state; // @[src/main/scala/wbu/WBU.scala 41:42]
  wire  _nextState_T_2 = handWire ? 1'h0 : 1'h1; // @[src/main/scala/wbu/WBU.scala 44:31]
  wire  _nextState_T_3 = ~state; // @[src/main/scala/wbu/WBU.scala 42:52]
  wire  nextState = state ? _nextState_T_2 : ~state & io_lsu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 42:52]
  wire  _io_wbu2BaseReg_data_T = io_lsu2WBU_bits_toReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 68:20]
  wire  _io_wbu2BaseReg_data_T_1 = io_lsu2WBU_bits_toReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 69:28]
  wire  _io_wbu2BaseReg_data_T_2 = io_lsu2WBU_bits_toReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 70:28]
  wire [31:0] _io_wbu2BaseReg_data_T_3 = _io_wbu2BaseReg_data_T_2 ? io_lsu2WBU_bits_csrData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2BaseReg_data_T_4 = _io_wbu2BaseReg_data_T_1 ? io_lsu2WBU_bits_memData : _io_wbu2BaseReg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [4:0] _io_rd_T_2 = handReg ? io_lsu2WBU_bits_inst[11:7] : 5'h0; // @[src/main/scala/wbu/WBU.scala 76:53]
  wire [4:0] _io_rd_T_3 = io_lsu2WBU_bits_regWR ? _io_rd_T_2 : 5'h0; // @[src/main/scala/wbu/WBU.scala 76:31]
  GetCurPC getCurPC ( // @[src/main/scala/wbu/WBU.scala 49:41]
    .pc(getCurPC_pc)
  );
  GetNextPC getNextPC ( // @[src/main/scala/wbu/WBU.scala 50:41]
    .nextPC(getNextPC_nextPC)
  );
  GetCmd getCmd ( // @[src/main/scala/wbu/WBU.scala 51:49]
    .cmd(getCmd_cmd)
  );
  WBUEnd wbuEnd ( // @[src/main/scala/wbu/WBU.scala 52:33]
    .handshake(wbuEnd_handshake)
  );
  assign io_lsu2WBU_ready = 1'h1; // @[src/main/scala/wbu/WBU.scala 60:33]
  assign io_wbu2CSR_pc = io_lsu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 61:25]
  assign io_wbu2CSR_csrWData = io_lsu2WBU_bits_csrWData; // @[src/main/scala/wbu/WBU.scala 62:25]
  assign io_wbu2CSR_csr = io_lsu2WBU_bits_inst[31:20]; // @[src/main/scala/wbu/WBU.scala 63:36]
  assign io_wbu2CSR_ecall = io_lsu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 64:25]
  assign io_wbu2CSR_csrEn = io_lsu2WBU_bits_csrEn; // @[src/main/scala/wbu/WBU.scala 65:25]
  assign io_wbu2CSR_csrWr = io_lsu2WBU_bits_csrWr; // @[src/main/scala/wbu/WBU.scala 66:25]
  assign io_wbu2BaseReg_rdIndex = io_lsu2WBU_bits_inst[10:7]; // @[src/main/scala/wbu/WBU.scala 72:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? io_lsu2WBU_bits_aluData : _io_wbu2BaseReg_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2BaseReg_regWR = io_lsu2WBU_bits_regWR; // @[src/main/scala/wbu/WBU.scala 73:29]
  assign io_wbu2Icache = io_lsu2WBU_bits_fencei; // @[src/main/scala/wbu/WBU.scala 75:25]
  assign io_rd = _io_rd_T_3[3:0]; // @[src/main/scala/wbu/WBU.scala 76:25]
  assign io_flush = _nextState_T_3 & nextState; // @[src/main/scala/wbu/WBU.scala 78:47]
  assign io_correctPC = io_wbu2CSR_mtvec; // @[src/main/scala/wbu/WBU.scala 79:21]
  assign getCurPC_pc = io_lsu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 53:41]
  assign getNextPC_nextPC = io_lsu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 54:41]
  assign getCmd_cmd = io_lsu2WBU_bits_inst; // @[src/main/scala/wbu/WBU.scala 55:41]
  assign wbuEnd_handshake = handRReg; // @[src/main/scala/wbu/WBU.scala 56:29]
  always @(posedge clock) begin
    handReg <= io_lsu2WBU_valid & io_lsu2WBU_ready; // @[src/main/scala/wbu/WBU.scala 23:44]
    handRReg <= handReg; // @[src/main/scala/wbu/WBU.scala 37:42]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 41:42]
      state <= 1'h0; // @[src/main/scala/wbu/WBU.scala 41:42]
    end else if (state) begin // @[src/main/scala/wbu/WBU.scala 42:52]
      if (handWire) begin // @[src/main/scala/wbu/WBU.scala 44:31]
        state <= 1'h0;
      end else begin
        state <= 1'h1;
      end
    end else begin
      state <= ~state & io_lsu2WBU_bits_ecall;
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
  handReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  handRReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
