module FetchReq(
  input         clock,
  input         reset,
  output        io_fetchReqIO_ifu2FetchReq_ready, // @[src/main/scala/ifu/Icache.scala 295:20]
  input         io_fetchReqIO_ifu2FetchReq_valid, // @[src/main/scala/ifu/Icache.scala 295:20]
  input  [31:0] io_fetchReqIO_ifu2FetchReq_bits_pc, // @[src/main/scala/ifu/Icache.scala 295:20]
  input         io_fetchReqIO_fetchReq2CheckUnit_ready, // @[src/main/scala/ifu/Icache.scala 295:20]
  output        io_fetchReqIO_fetchReq2CheckUnit_valid, // @[src/main/scala/ifu/Icache.scala 295:20]
  output [31:0] io_fetchReqIO_fetchReq2CheckUnit_bits, // @[src/main/scala/ifu/Icache.scala 295:20]
  input         io_fetchReqIO_flush // @[src/main/scala/ifu/Icache.scala 295:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 298:31]
  wire  _pcReg_T = io_fetchReqIO_ifu2FetchReq_valid & io_fetchReqIO_ifu2FetchReq_ready; // @[src/main/scala/ifu/Icache.scala 300:42]
  reg [31:0] pcReg; // @[src/main/scala/ifu/Icache.scala 299:37]
  wire  _T = ~validReg; // @[src/main/scala/ifu/Icache.scala 304:34]
  assign io_fetchReqIO_ifu2FetchReq_ready = io_fetchReqIO_fetchReq2CheckUnit_ready | _T; // @[src/main/scala/ifu/Icache.scala 309:99]
  assign io_fetchReqIO_fetchReq2CheckUnit_valid = validReg & ~io_fetchReqIO_flush; // @[src/main/scala/ifu/Icache.scala 311:61]
  assign io_fetchReqIO_fetchReq2CheckUnit_bits = pcReg; // @[src/main/scala/ifu/Icache.scala 310:49]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 298:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 298:31]
    end else if (io_fetchReqIO_flush) begin // @[src/main/scala/ifu/Icache.scala 301:35]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 302:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 304:34]
      validReg <= _pcReg_T; // @[src/main/scala/ifu/Icache.scala 305:44]
    end
    if (_pcReg_T) begin // @[src/main/scala/ifu/Icache.scala 299:37]
      pcReg <= io_fetchReqIO_ifu2FetchReq_bits_pc; // @[src/main/scala/ifu/Icache.scala 299:37]
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
  validReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pcReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
