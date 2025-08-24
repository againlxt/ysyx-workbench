module PreDecoder(
  input         clock,
  input         reset,
  output        io_preDecoderIO_checkUnit2PreDecoder_ready, // @[src/main/scala/ifu/Icache.scala 498:20]
  input         io_preDecoderIO_checkUnit2PreDecoder_valid, // @[src/main/scala/ifu/Icache.scala 498:20]
  input  [31:0] io_preDecoderIO_checkUnit2PreDecoder_bits_pc, // @[src/main/scala/ifu/Icache.scala 498:20]
  input  [31:0] io_preDecoderIO_checkUnit2PreDecoder_bits_inst, // @[src/main/scala/ifu/Icache.scala 498:20]
  input         io_preDecoderIO_preDecoder2IFU_ready, // @[src/main/scala/ifu/Icache.scala 498:20]
  output        io_preDecoderIO_preDecoder2IFU_valid, // @[src/main/scala/ifu/Icache.scala 498:20]
  output [31:0] io_preDecoderIO_preDecoder2IFU_bits_pc, // @[src/main/scala/ifu/Icache.scala 498:20]
  output [31:0] io_preDecoderIO_preDecoder2IFU_bits_inst, // @[src/main/scala/ifu/Icache.scala 498:20]
  input         io_preDecoderIO_flush // @[src/main/scala/ifu/Icache.scala 498:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 502:31]
  wire  _T = ~validReg; // @[src/main/scala/ifu/Icache.scala 506:34]
  wire  _validReg_T = io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 507:90]
  wire  _validReg_T_4 = io_preDecoderIO_preDecoder2IFU_valid & io_preDecoderIO_preDecoder2IFU_ready ? _validReg_T : 1'h1
    ; // @[src/main/scala/ifu/Icache.scala 509:48]
  assign io_preDecoderIO_checkUnit2PreDecoder_ready = io_preDecoderIO_preDecoder2IFU_ready | _T; // @[src/main/scala/ifu/Icache.scala 515:97]
  assign io_preDecoderIO_preDecoder2IFU_valid = validReg & ~io_preDecoderIO_flush; // @[src/main/scala/ifu/Icache.scala 516:69]
  assign io_preDecoderIO_preDecoder2IFU_bits_pc = io_preDecoderIO_checkUnit2PreDecoder_bits_pc; // @[src/main/scala/ifu/Icache.scala 517:57]
  assign io_preDecoderIO_preDecoder2IFU_bits_inst = io_preDecoderIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 517:57]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 502:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 502:31]
    end else if (io_preDecoderIO_flush) begin // @[src/main/scala/ifu/Icache.scala 503:37]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 504:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 506:34]
      validReg <= io_preDecoderIO_checkUnit2PreDecoder_valid & io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 507:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 506:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 509:42]
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
