module LRU_8(
  input        clock,
  input        reset,
  input        io_update_entry, // @[src/main/scala/ifu/Icache.scala 258:20]
  input  [2:0] io_update_index, // @[src/main/scala/ifu/Icache.scala 258:20]
  output [2:0] io_lru_index // @[src/main/scala/ifu/Icache.scala 258:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] matrix_1; // @[src/main/scala/ifu/Icache.scala 265:29]
  wire [2:0] _matrixNext_0_T_3 = 3'h4 - 3'h1; // @[src/main/scala/ifu/Icache.scala 272:72]
  wire [2:0] _matrixNext_1_T_4 = 3'h1 & _matrixNext_0_T_3; // @[src/main/scala/ifu/Icache.scala 272:56]
  wire [2:0] _GEN_1 = io_update_entry & 3'h1 == io_update_index ? _matrixNext_1_T_4 : {{1'd0}, matrix_1}; // @[src/main/scala/ifu/Icache.scala 270:68 272:39 274:39]
  wire  _T_5 = matrix_1 == 2'h0; // @[src/main/scala/ifu/Icache.scala 287:32]
  reg [2:0] lruIndexReg; // @[src/main/scala/ifu/Icache.scala 293:34]
  wire [1:0] matrixNext_1 = _GEN_1[1:0]; // @[src/main/scala/ifu/Icache.scala 268:30]
  wire [2:0] lruIndexNext = {{2'd0}, _T_5}; // @[src/main/scala/ifu/Icache.scala 284:32]
  assign io_lru_index = lruIndexReg; // @[src/main/scala/ifu/Icache.scala 294:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 265:29]
      matrix_1 <= 2'h0; // @[src/main/scala/ifu/Icache.scala 265:29]
    end else begin
      matrix_1 <= matrixNext_1; // @[src/main/scala/ifu/Icache.scala 280:27]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 293:34]
      lruIndexReg <= 3'h0; // @[src/main/scala/ifu/Icache.scala 293:34]
    end else begin
      lruIndexReg <= lruIndexNext; // @[src/main/scala/ifu/Icache.scala 293:34]
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
  matrix_1 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  lruIndexReg = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
