module BranchPredict(
  input         clock,
  input         reset,
  input  [31:0] io_correctPC, // @[src/main/scala/ifu/IFU.scala 63:20]
  input         io_flush, // @[src/main/scala/ifu/IFU.scala 63:20]
  input         io_next, // @[src/main/scala/ifu/IFU.scala 63:20]
  output [31:0] io_predictPC // @[src/main/scala/ifu/IFU.scala 63:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/ifu/IFU.scala 69:42]
  wire [31:0] _pcReg_T_2 = pcReg + 32'h4; // @[src/main/scala/ifu/IFU.scala 73:49]
  assign io_predictPC = pcReg; // @[src/main/scala/ifu/IFU.scala 76:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 69:42]
      pcReg <= 32'h30000000; // @[src/main/scala/ifu/IFU.scala 69:42]
    end else if (io_flush) begin // @[src/main/scala/ifu/IFU.scala 70:24]
      pcReg <= io_correctPC; // @[src/main/scala/ifu/IFU.scala 71:41]
    end else if (io_next) begin // @[src/main/scala/ifu/IFU.scala 72:30]
      pcReg <= _pcReg_T_2; // @[src/main/scala/ifu/IFU.scala 73:41]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
