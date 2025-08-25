module IFU(
  input         clock,
  input         reset,
  input         io_inst_ready, // @[src/main/scala/ifu/IFU.scala 22:16]
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 22:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 22:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 22:16]
  input         io_ifu2ICache_ready, // @[src/main/scala/ifu/IFU.scala 22:16]
  output        io_ifu2ICache_valid, // @[src/main/scala/ifu/IFU.scala 22:16]
  output [31:0] io_ifu2ICache_bits_pc, // @[src/main/scala/ifu/IFU.scala 22:16]
  output        io_icache2IFU_ready, // @[src/main/scala/ifu/IFU.scala 22:16]
  input         io_icache2IFU_valid, // @[src/main/scala/ifu/IFU.scala 22:16]
  input  [31:0] io_icache2IFU_bits_pc, // @[src/main/scala/ifu/IFU.scala 22:16]
  input  [31:0] io_icache2IFU_bits_inst, // @[src/main/scala/ifu/IFU.scala 22:16]
  input         io_flush, // @[src/main/scala/ifu/IFU.scala 22:16]
  input  [31:0] io_correctPC, // @[src/main/scala/ifu/IFU.scala 22:16]
  input  [31:0] io_fromPC // @[src/main/scala/ifu/IFU.scala 22:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  branchPredict_clock; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire  branchPredict_reset; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire [31:0] branchPredict_io_correctPC; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire [31:0] branchPredict_io_fromPC; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire  branchPredict_io_flush; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire  branchPredict_io_ifu2ICache_ready; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire  branchPredict_io_ifu2ICache_valid; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire [31:0] branchPredict_io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/IFU.scala 31:41]
  wire  IGIC_valid; // @[src/main/scala/ifu/IFU.scala 44:57]
  wire [31:0] IGIC_counterType; // @[src/main/scala/ifu/IFU.scala 44:57]
  wire [31:0] IGIC_data; // @[src/main/scala/ifu/IFU.scala 44:57]
  reg [31:0] ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 43:48]
  wire [31:0] _ifuGetInstCounter_T_1 = ifuGetInstCounter + 32'h1; // @[src/main/scala/ifu/IFU.scala 49:72]
  BranchPredict branchPredict ( // @[src/main/scala/ifu/IFU.scala 31:41]
    .clock(branchPredict_clock),
    .reset(branchPredict_reset),
    .io_correctPC(branchPredict_io_correctPC),
    .io_fromPC(branchPredict_io_fromPC),
    .io_flush(branchPredict_io_flush),
    .io_ifu2ICache_ready(branchPredict_io_ifu2ICache_ready),
    .io_ifu2ICache_valid(branchPredict_io_ifu2ICache_valid),
    .io_ifu2ICache_bits_pc(branchPredict_io_ifu2ICache_bits_pc)
  );
  PerformanceCounter IGIC ( // @[src/main/scala/ifu/IFU.scala 44:57]
    .valid(IGIC_valid),
    .counterType(IGIC_counterType),
    .data(IGIC_data)
  );
  assign io_inst_valid = io_icache2IFU_valid; // @[src/main/scala/ifu/IFU.scala 62:41]
  assign io_inst_bits_inst = io_icache2IFU_bits_inst; // @[src/main/scala/ifu/IFU.scala 61:41]
  assign io_inst_bits_pc = io_icache2IFU_bits_pc; // @[src/main/scala/ifu/IFU.scala 60:41]
  assign io_ifu2ICache_valid = branchPredict_io_ifu2ICache_valid; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign io_ifu2ICache_bits_pc = branchPredict_io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign io_icache2IFU_ready = io_inst_ready; // @[src/main/scala/ifu/IFU.scala 59:41]
  assign branchPredict_clock = clock;
  assign branchPredict_reset = reset;
  assign branchPredict_io_correctPC = io_correctPC; // @[src/main/scala/ifu/IFU.scala 36:41]
  assign branchPredict_io_fromPC = io_fromPC; // @[src/main/scala/ifu/IFU.scala 37:41]
  assign branchPredict_io_flush = io_flush; // @[src/main/scala/ifu/IFU.scala 38:41]
  assign branchPredict_io_ifu2ICache_ready = io_ifu2ICache_ready; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign IGIC_valid = io_inst_ready & io_inst_valid; // @[src/main/scala/ifu/IFU.scala 54:58]
  assign IGIC_counterType = 32'h6; // @[src/main/scala/ifu/IFU.scala 55:41]
  assign IGIC_data = ifuGetInstCounter; // @[src/main/scala/ifu/IFU.scala 56:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 43:48]
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 43:48]
    end else if (io_inst_ready) begin // @[src/main/scala/ifu/IFU.scala 45:37]
      if (io_inst_valid) begin // @[src/main/scala/ifu/IFU.scala 46:45]
        ifuGetInstCounter <= 32'h1; // @[src/main/scala/ifu/IFU.scala 47:51]
      end else begin
        ifuGetInstCounter <= _ifuGetInstCounter_T_1; // @[src/main/scala/ifu/IFU.scala 49:51]
      end
    end else begin
      ifuGetInstCounter <= 32'h0; // @[src/main/scala/ifu/IFU.scala 52:43]
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
  ifuGetInstCounter = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
