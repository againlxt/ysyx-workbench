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
  wire  pcFIFO_clock; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_reset; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_io_enq_ready; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_io_enq_valid; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire [31:0] pcFIFO_io_enq_bits_0; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire [31:0] pcFIFO_io_enq_bits_1; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_io_deq_ready; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_io_deq_valid; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire [31:0] pcFIFO_io_deq_bits_0; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire [31:0] pcFIFO_io_deq_bits_1; // @[src/main/scala/ifu/IFU.scala 32:49]
  wire  pcFIFO_io_flush; // @[src/main/scala/ifu/IFU.scala 32:49]
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
  Queue pcFIFO ( // @[src/main/scala/ifu/IFU.scala 32:49]
    .clock(pcFIFO_clock),
    .reset(pcFIFO_reset),
    .io_enq_ready(pcFIFO_io_enq_ready),
    .io_enq_valid(pcFIFO_io_enq_valid),
    .io_enq_bits_0(pcFIFO_io_enq_bits_0),
    .io_enq_bits_1(pcFIFO_io_enq_bits_1),
    .io_deq_ready(pcFIFO_io_deq_ready),
    .io_deq_valid(pcFIFO_io_deq_valid),
    .io_deq_bits_0(pcFIFO_io_deq_bits_0),
    .io_deq_bits_1(pcFIFO_io_deq_bits_1),
    .io_flush(pcFIFO_io_flush)
  );
  assign io_inst_valid = pcFIFO_io_deq_valid; // @[src/main/scala/ifu/IFU.scala 59:41]
  assign io_inst_bits_inst = pcFIFO_io_deq_bits_1; // @[src/main/scala/ifu/IFU.scala 58:41]
  assign io_inst_bits_pc = pcFIFO_io_deq_bits_0; // @[src/main/scala/ifu/IFU.scala 57:41]
  assign io_ifu2ICache_valid = branchPredict_io_ifu2ICache_valid; // @[src/main/scala/ifu/IFU.scala 40:41]
  assign io_ifu2ICache_bits_pc = branchPredict_io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/IFU.scala 40:41]
  assign io_icache2IFU_ready = pcFIFO_io_enq_ready; // @[src/main/scala/ifu/IFU.scala 54:41]
  assign branchPredict_clock = clock;
  assign branchPredict_reset = reset;
  assign branchPredict_io_correctPC = io_correctPC; // @[src/main/scala/ifu/IFU.scala 37:41]
  assign branchPredict_io_fromPC = io_fromPC; // @[src/main/scala/ifu/IFU.scala 38:41]
  assign branchPredict_io_flush = io_flush; // @[src/main/scala/ifu/IFU.scala 39:41]
  assign branchPredict_io_ifu2ICache_ready = io_ifu2ICache_ready; // @[src/main/scala/ifu/IFU.scala 40:41]
  assign pcFIFO_clock = clock;
  assign pcFIFO_reset = reset;
  assign pcFIFO_io_enq_valid = io_icache2IFU_valid; // @[src/main/scala/ifu/IFU.scala 51:41]
  assign pcFIFO_io_enq_bits_0 = io_icache2IFU_bits_pc; // @[src/main/scala/ifu/IFU.scala 52:33]
  assign pcFIFO_io_enq_bits_1 = io_icache2IFU_bits_inst; // @[src/main/scala/ifu/IFU.scala 53:33]
  assign pcFIFO_io_deq_ready = io_inst_ready; // @[src/main/scala/ifu/IFU.scala 56:41]
  assign pcFIFO_io_flush = io_flush; // @[src/main/scala/ifu/IFU.scala 55:35]
endmodule
