module IFU(
  input         clock,
  input         reset,
  input         io_inst_ready, // @[src/main/scala/ifu/IFU.scala 21:16]
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 21:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 21:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 21:16]
  output [31:0] io_ifu2Icache_addr, // @[src/main/scala/ifu/IFU.scala 21:16]
  output        io_ifu2Icache_enable, // @[src/main/scala/ifu/IFU.scala 21:16]
  input         io_ifu2Icache_oEnable, // @[src/main/scala/ifu/IFU.scala 21:16]
  input  [31:0] io_ifu2Icache_inst, // @[src/main/scala/ifu/IFU.scala 21:16]
  input         io_flush, // @[src/main/scala/ifu/IFU.scala 21:16]
  input  [31:0] io_correctPC, // @[src/main/scala/ifu/IFU.scala 21:16]
  input  [31:0] io_fromPC // @[src/main/scala/ifu/IFU.scala 21:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  branchPredict_clock; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire  branchPredict_reset; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire [31:0] branchPredict_io_correctPC; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire [31:0] branchPredict_io_fromPC; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire  branchPredict_io_flush; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire  branchPredict_io_next; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire [31:0] branchPredict_io_predictPC; // @[src/main/scala/ifu/IFU.scala 39:35]
  wire  IGIC_valid; // @[src/main/scala/ifu/IFU.scala 54:57]
  wire [31:0] IGIC_counterType; // @[src/main/scala/ifu/IFU.scala 54:57]
  wire [31:0] IGIC_data; // @[src/main/scala/ifu/IFU.scala 54:57]
  reg [1:0] state; // @[src/main/scala/ifu/IFU.scala 29:34]
  wire [1:0] _state_T = io_flush ? 2'h1 : 2'h2; // @[src/main/scala/ifu/IFU.scala 32:47]
  wire [1:0] _state_T_2 = io_inst_valid & io_inst_ready ? 2'h1 : 2'h2; // @[src/main/scala/ifu/IFU.scala 34:20]
  reg [31:0] ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 48:48]
  wire  _T = state == 2'h1; // @[src/main/scala/ifu/IFU.scala 49:29]
  wire [31:0] _ifuGetInstCounter_T_1 = ifuGetInstCounter + 32'h1; // @[src/main/scala/ifu/IFU.scala 52:64]
  wire  _io_ifu2Icache_enable_T_3 = ~io_flush; // @[src/main/scala/ifu/IFU.scala 60:80]
  BranchPredict branchPredict ( // @[src/main/scala/ifu/IFU.scala 39:35]
    .clock(branchPredict_clock),
    .reset(branchPredict_reset),
    .io_correctPC(branchPredict_io_correctPC),
    .io_fromPC(branchPredict_io_fromPC),
    .io_flush(branchPredict_io_flush),
    .io_next(branchPredict_io_next),
    .io_predictPC(branchPredict_io_predictPC)
  );
  PerformanceCounter IGIC ( // @[src/main/scala/ifu/IFU.scala 54:57]
    .valid(IGIC_valid),
    .counterType(IGIC_counterType),
    .data(IGIC_data)
  );
  assign io_inst_valid = io_ifu2Icache_oEnable & state == 2'h2 & _io_ifu2Icache_enable_T_3; // @[src/main/scala/ifu/IFU.scala 62:86]
  assign io_inst_bits_inst = io_ifu2Icache_inst; // @[src/main/scala/ifu/IFU.scala 63:33]
  assign io_inst_bits_pc = branchPredict_io_predictPC; // @[src/main/scala/ifu/IFU.scala 64:33]
  assign io_ifu2Icache_addr = branchPredict_io_predictPC; // @[src/main/scala/ifu/IFU.scala 61:33]
  assign io_ifu2Icache_enable = (state == 2'h0 | _T) & ~io_flush; // @[src/main/scala/ifu/IFU.scala 60:77]
  assign branchPredict_clock = clock;
  assign branchPredict_reset = reset;
  assign branchPredict_io_correctPC = io_correctPC; // @[src/main/scala/ifu/IFU.scala 40:41]
  assign branchPredict_io_fromPC = io_fromPC; // @[src/main/scala/ifu/IFU.scala 41:41]
  assign branchPredict_io_flush = io_flush; // @[src/main/scala/ifu/IFU.scala 42:41]
  assign branchPredict_io_next = io_inst_valid & io_inst_ready; // @[src/main/scala/ifu/IFU.scala 38:38]
  assign IGIC_valid = io_ifu2Icache_oEnable; // @[src/main/scala/ifu/IFU.scala 55:41]
  assign IGIC_counterType = 32'h6; // @[src/main/scala/ifu/IFU.scala 56:41]
  assign IGIC_data = ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 57:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 29:34]
      state <= 2'h0; // @[src/main/scala/ifu/IFU.scala 29:34]
    end else if (2'h3 == state) begin // @[src/main/scala/ifu/IFU.scala 30:44]
      if (io_ifu2Icache_oEnable) begin // @[src/main/scala/ifu/IFU.scala 35:47]
        state <= 2'h1;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/ifu/IFU.scala 30:44]
      if (io_flush) begin // @[src/main/scala/ifu/IFU.scala 33:39]
        state <= 2'h3;
      end else begin
        state <= _state_T_2;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/ifu/IFU.scala 30:44]
      state <= _state_T;
    end else begin
      state <= 2'h2;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 48:48]
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 48:48]
    end else if (state == 2'h1) begin // @[src/main/scala/ifu/IFU.scala 49:44]
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 50:43]
    end else begin
      ifuGetInstCounter <= _ifuGetInstCounter_T_1; // @[src/main/scala/ifu/IFU.scala 52:43]
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  ifuGetInstCounter = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
