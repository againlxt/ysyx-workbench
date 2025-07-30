module PC(
  input         clock,
  input         reset,
  output        io_wbu2PC_ready, // @[src/main/scala/PC.scala 10:20]
  input         io_wbu2PC_valid, // @[src/main/scala/PC.scala 10:20]
  input  [31:0] io_wbu2PC_bits_nextPC, // @[src/main/scala/PC.scala 10:20]
  output [31:0] io_pc // @[src/main/scala/PC.scala 10:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/PC.scala 16:28]
  assign io_wbu2PC_ready = 1'h1; // @[src/main/scala/PC.scala 19:33]
  assign io_pc = pcReg; // @[src/main/scala/PC.scala 32:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/PC.scala 16:28]
      pcReg <= 32'h30000000; // @[src/main/scala/PC.scala 16:28]
    end else if (io_wbu2PC_ready & io_wbu2PC_valid) begin // @[src/main/scala/PC.scala 27:51]
      pcReg <= io_wbu2PC_bits_nextPC; // @[src/main/scala/PC.scala 28:23]
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
