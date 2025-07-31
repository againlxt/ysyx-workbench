module IFU(
  input         clock,
  input         reset,
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 18:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 18:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 18:16]
  output [31:0] io_ifu2Icache_addr, // @[src/main/scala/ifu/IFU.scala 18:16]
  output        io_ifu2Icache_enable, // @[src/main/scala/ifu/IFU.scala 18:16]
  input         io_ifu2Icache_oEnable, // @[src/main/scala/ifu/IFU.scala 18:16]
  input  [31:0] io_ifu2Icache_inst, // @[src/main/scala/ifu/IFU.scala 18:16]
  output        io_wbu2IFU_ready, // @[src/main/scala/ifu/IFU.scala 18:16]
  input         io_wbu2IFU_valid, // @[src/main/scala/ifu/IFU.scala 18:16]
  input  [31:0] io_wbu2IFU_bits_nextPC // @[src/main/scala/ifu/IFU.scala 18:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/ifu/IFU.scala 24:42]
  wire  _pcValidReg_T = io_wbu2IFU_valid & io_wbu2IFU_ready; // @[src/main/scala/ifu/IFU.scala 25:52]
  reg  pcValidReg; // @[src/main/scala/ifu/IFU.scala 25:34]
  reg  ifuReadyReg; // @[src/main/scala/ifu/IFU.scala 26:34]
  assign io_inst_valid = io_ifu2Icache_oEnable; // @[src/main/scala/ifu/IFU.scala 55:33]
  assign io_inst_bits_inst = io_ifu2Icache_inst; // @[src/main/scala/ifu/IFU.scala 56:33]
  assign io_inst_bits_pc = pcReg; // @[src/main/scala/ifu/IFU.scala 57:33]
  assign io_ifu2Icache_addr = pcReg; // @[src/main/scala/ifu/IFU.scala 54:33]
  assign io_ifu2Icache_enable = pcValidReg; // @[src/main/scala/ifu/IFU.scala 53:29]
  assign io_wbu2IFU_ready = ifuReadyReg; // @[src/main/scala/ifu/IFU.scala 58:33]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 24:42]
      pcReg <= 32'h30000000; // @[src/main/scala/ifu/IFU.scala 24:42]
    end else if (_pcValidReg_T) begin // @[src/main/scala/ifu/IFU.scala 31:21]
      pcReg <= io_wbu2IFU_bits_nextPC;
    end
    pcValidReg <= reset | io_wbu2IFU_valid & io_wbu2IFU_ready; // @[src/main/scala/ifu/IFU.scala 25:{34,34,34}]
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 26:34]
      ifuReadyReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 26:34]
    end else if (~ifuReadyReg) begin // @[src/main/scala/ifu/IFU.scala 27:29]
      ifuReadyReg <= io_inst_valid; // @[src/main/scala/ifu/IFU.scala 28:38]
    end else if (ifuReadyReg) begin // @[src/main/scala/ifu/IFU.scala 27:29]
      ifuReadyReg <= ~_pcValidReg_T; // @[src/main/scala/ifu/IFU.scala 29:38]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pcValidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ifuReadyReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
