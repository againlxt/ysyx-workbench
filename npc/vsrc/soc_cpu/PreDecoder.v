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
`endif // RANDOMIZE_REG_INIT
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 524:31]
  wire  _T = ~validReg; // @[src/main/scala/ifu/Icache.scala 528:34]
  wire  _validReg_T = io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 529:90]
  wire  _validReg_T_4 = io_preDecoderIO_preDecoder2IFU_valid & io_preDecoderIO_preDecoder2IFU_ready ? _validReg_T : 1'h1
    ; // @[src/main/scala/ifu/Icache.scala 531:48]
  assign io_preDecoderIO_checkUnit2PreDecoder_ready = io_preDecoderIO_preDecoder2IFU_ready | _T; // @[src/main/scala/ifu/Icache.scala 537:97]
  assign io_preDecoderIO_preDecoder2IFU_valid = validReg & ~io_preDecoderIO_flush; // @[src/main/scala/ifu/Icache.scala 538:69]
  assign io_preDecoderIO_preDecoder2IFU_bits_pc = io_preDecoderIO_checkUnit2PreDecoder_bits_pc; // @[src/main/scala/ifu/Icache.scala 539:57]
  assign io_preDecoderIO_preDecoder2IFU_bits_inst = io_preDecoderIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 539:57]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 524:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 524:31]
    end else if (io_preDecoderIO_flush) begin // @[src/main/scala/ifu/Icache.scala 525:37]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 526:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 528:34]
      validReg <= io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 529:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 528:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 531:42]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
