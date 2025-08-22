module PreDecoder(
  input         clock,
  input         reset,
  output        io_preDecoderIO_checkUnit2PreDecoder_ready, // @[src/main/scala/ifu/Icache.scala 520:20]
  input         io_preDecoderIO_checkUnit2PreDecoder_valid, // @[src/main/scala/ifu/Icache.scala 520:20]
  input  [31:0] io_preDecoderIO_checkUnit2PreDecoder_bits_pc, // @[src/main/scala/ifu/Icache.scala 520:20]
  input  [31:0] io_preDecoderIO_checkUnit2PreDecoder_bits_inst, // @[src/main/scala/ifu/Icache.scala 520:20]
  input         io_preDecoderIO_preDecoder2IFU_ready, // @[src/main/scala/ifu/Icache.scala 520:20]
  output        io_preDecoderIO_preDecoder2IFU_valid, // @[src/main/scala/ifu/Icache.scala 520:20]
  output [31:0] io_preDecoderIO_preDecoder2IFU_bits_pc, // @[src/main/scala/ifu/Icache.scala 520:20]
  output [31:0] io_preDecoderIO_preDecoder2IFU_bits_inst, // @[src/main/scala/ifu/Icache.scala 520:20]
  input         io_preDecoderIO_flush // @[src/main/scala/ifu/Icache.scala 520:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 524:31]
  reg  readyReg; // @[src/main/scala/ifu/Icache.scala 525:31]
  wire  _validReg_T = io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 531:90]
  wire  _validReg_T_1 = io_preDecoderIO_preDecoder2IFU_valid & io_preDecoderIO_preDecoder2IFU_ready; // @[src/main/scala/ifu/Icache.scala 533:86]
  wire  _validReg_T_4 = io_preDecoderIO_preDecoder2IFU_valid & io_preDecoderIO_preDecoder2IFU_ready ? _validReg_T : 1'h1
    ; // @[src/main/scala/ifu/Icache.scala 533:48]
  wire  _readyReg_T_4 = _validReg_T ? _validReg_T_1 : 1'h1; // @[src/main/scala/ifu/Icache.scala 540:48]
  wire  _GEN_2 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/ifu/Icache.scala 525:31 537:34 540:42]
  wire  _GEN_3 = ~readyReg ? _validReg_T_1 : _GEN_2; // @[src/main/scala/ifu/Icache.scala 537:34 538:44]
  wire  _GEN_5 = io_preDecoderIO_flush | _GEN_3; // @[src/main/scala/ifu/Icache.scala 526:37 528:26]
  assign io_preDecoderIO_checkUnit2PreDecoder_ready = readyReg; // @[src/main/scala/ifu/Icache.scala 546:57]
  assign io_preDecoderIO_preDecoder2IFU_valid = validReg & ~io_preDecoderIO_flush; // @[src/main/scala/ifu/Icache.scala 547:69]
  assign io_preDecoderIO_preDecoder2IFU_bits_pc = io_preDecoderIO_checkUnit2PreDecoder_bits_pc; // @[src/main/scala/ifu/Icache.scala 548:57]
  assign io_preDecoderIO_preDecoder2IFU_bits_inst = io_preDecoderIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 548:57]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 524:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 524:31]
    end else if (io_preDecoderIO_flush) begin // @[src/main/scala/ifu/Icache.scala 526:37]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 527:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 530:34]
      validReg <= io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 531:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 530:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 533:42]
    end
    readyReg <= reset | _GEN_5; // @[src/main/scala/ifu/Icache.scala 525:{31,31}]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
