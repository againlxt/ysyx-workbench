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
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 298:31]
  reg  readyReg; // @[src/main/scala/ifu/Icache.scala 299:31]
  wire  _pcReg_T = io_fetchReqIO_ifu2FetchReq_valid & io_fetchReqIO_ifu2FetchReq_ready; // @[src/main/scala/ifu/Icache.scala 301:42]
  reg [31:0] pcReg; // @[src/main/scala/ifu/Icache.scala 300:37]
  wire  _validReg_T_1 = io_fetchReqIO_fetchReq2CheckUnit_valid & io_fetchReqIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 309:88]
  wire  _validReg_T_4 = io_fetchReqIO_fetchReq2CheckUnit_valid & io_fetchReqIO_fetchReq2CheckUnit_ready ? _pcReg_T : 1'h1
    ; // @[src/main/scala/ifu/Icache.scala 309:48]
  wire  _readyReg_T_4 = _pcReg_T ? _validReg_T_1 : 1'h1; // @[src/main/scala/ifu/Icache.scala 316:48]
  wire  _GEN_3 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/ifu/Icache.scala 299:31 313:34 316:42]
  wire  _GEN_4 = ~readyReg ? _validReg_T_1 : _GEN_3; // @[src/main/scala/ifu/Icache.scala 313:34 314:44]
  wire  _GEN_6 = io_fetchReqIO_flush | _GEN_4; // @[src/main/scala/ifu/Icache.scala 302:35 304:26]
  assign io_fetchReqIO_ifu2FetchReq_ready = readyReg; // @[src/main/scala/ifu/Icache.scala 322:57]
  assign io_fetchReqIO_fetchReq2CheckUnit_valid = validReg & ~io_fetchReqIO_flush; // @[src/main/scala/ifu/Icache.scala 324:61]
  assign io_fetchReqIO_fetchReq2CheckUnit_bits = pcReg; // @[src/main/scala/ifu/Icache.scala 323:49]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 298:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 298:31]
    end else if (io_fetchReqIO_flush) begin // @[src/main/scala/ifu/Icache.scala 302:35]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 303:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 306:34]
      validReg <= _pcReg_T; // @[src/main/scala/ifu/Icache.scala 307:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 306:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 309:42]
    end
    readyReg <= reset | _GEN_6; // @[src/main/scala/ifu/Icache.scala 299:{31,31}]
    if (_pcReg_T) begin // @[src/main/scala/ifu/Icache.scala 300:37]
      pcReg <= io_fetchReqIO_ifu2FetchReq_bits_pc; // @[src/main/scala/ifu/Icache.scala 300:37]
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
  readyReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pcReg = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
