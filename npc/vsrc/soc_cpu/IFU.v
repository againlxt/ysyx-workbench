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
  assign io_inst_valid = io_icache2IFU_valid; // @[src/main/scala/ifu/IFU.scala 53:41]
  assign io_inst_bits_inst = io_icache2IFU_bits_inst; // @[src/main/scala/ifu/IFU.scala 52:41]
  assign io_inst_bits_pc = io_icache2IFU_bits_pc; // @[src/main/scala/ifu/IFU.scala 51:41]
  assign io_ifu2ICache_valid = branchPredict_io_ifu2ICache_valid; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign io_ifu2ICache_bits_pc = branchPredict_io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign io_icache2IFU_ready = io_inst_ready; // @[src/main/scala/ifu/IFU.scala 50:41]
  assign branchPredict_clock = clock;
  assign branchPredict_reset = reset;
  assign branchPredict_io_correctPC = io_correctPC; // @[src/main/scala/ifu/IFU.scala 36:41]
  assign branchPredict_io_fromPC = io_fromPC; // @[src/main/scala/ifu/IFU.scala 37:41]
  assign branchPredict_io_flush = io_flush; // @[src/main/scala/ifu/IFU.scala 38:41]
  assign branchPredict_io_ifu2ICache_ready = io_ifu2ICache_ready; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign IGIC_valid = 1'h0; // @[src/main/scala/ifu/IFU.scala 45:41]
  assign IGIC_counterType = 32'h6; // @[src/main/scala/ifu/IFU.scala 46:41]
  assign IGIC_data = 32'h0; // @[src/main/scala/ifu/IFU.scala 47:41]
endmodule
