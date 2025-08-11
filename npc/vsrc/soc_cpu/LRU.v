module LRU(
  input        clock,
  input        reset,
  input        io_update_entry, // @[src/main/scala/ifu/Icache.scala 246:20]
  input  [5:0] io_update_index, // @[src/main/scala/ifu/Icache.scala 246:20]
  output [5:0] io_lru_index // @[src/main/scala/ifu/Icache.scala 246:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] matrix_1; // @[src/main/scala/ifu/Icache.scala 253:29]
  reg [3:0] matrix_2; // @[src/main/scala/ifu/Icache.scala 253:29]
  reg [3:0] matrix_3; // @[src/main/scala/ifu/Icache.scala 253:29]
  wire [4:0] _matrixNext_0_T_3 = 5'h10 - 5'h1; // @[src/main/scala/ifu/Icache.scala 260:72]
  wire [4:0] _matrixNext_1_T_4 = 5'h1 & _matrixNext_0_T_3; // @[src/main/scala/ifu/Icache.scala 260:56]
  wire [4:0] _GEN_1 = io_update_entry & 6'h1 == io_update_index ? _matrixNext_1_T_4 : {{1'd0}, matrix_1}; // @[src/main/scala/ifu/Icache.scala 258:68 260:39 262:39]
  wire [4:0] _matrixNext_2_T_4 = 5'h3 & _matrixNext_0_T_3; // @[src/main/scala/ifu/Icache.scala 260:56]
  wire [4:0] _GEN_2 = io_update_entry & 6'h2 == io_update_index ? _matrixNext_2_T_4 : {{1'd0}, matrix_2}; // @[src/main/scala/ifu/Icache.scala 258:68 260:39 262:39]
  wire [4:0] _matrixNext_3_T_4 = 5'h7 & _matrixNext_0_T_3; // @[src/main/scala/ifu/Icache.scala 260:56]
  wire [4:0] _GEN_3 = io_update_entry & 6'h3 == io_update_index ? _matrixNext_3_T_4 : {{1'd0}, matrix_3}; // @[src/main/scala/ifu/Icache.scala 258:68 260:39 262:39]
  wire [1:0] _GEN_6 = matrix_2 == 4'h0 ? 2'h2 : {{1'd0}, matrix_1 == 4'h0}; // @[src/main/scala/ifu/Icache.scala 275:41 276:38]
  wire [1:0] _GEN_7 = matrix_3 == 4'h0 ? 2'h3 : _GEN_6; // @[src/main/scala/ifu/Icache.scala 275:41 276:38]
  reg [5:0] lruIndexReg; // @[src/main/scala/ifu/Icache.scala 281:34]
  wire [3:0] matrixNext_1 = _GEN_1[3:0]; // @[src/main/scala/ifu/Icache.scala 256:30]
  wire [3:0] matrixNext_2 = _GEN_2[3:0]; // @[src/main/scala/ifu/Icache.scala 256:30]
  wire [3:0] matrixNext_3 = _GEN_3[3:0]; // @[src/main/scala/ifu/Icache.scala 256:30]
  wire [5:0] lruIndexNext = {{4'd0}, _GEN_7}; // @[src/main/scala/ifu/Icache.scala 272:32]
  assign io_lru_index = lruIndexReg; // @[src/main/scala/ifu/Icache.scala 282:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 253:29]
      matrix_1 <= 4'h0; // @[src/main/scala/ifu/Icache.scala 253:29]
    end else begin
      matrix_1 <= matrixNext_1; // @[src/main/scala/ifu/Icache.scala 268:27]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 253:29]
      matrix_2 <= 4'h0; // @[src/main/scala/ifu/Icache.scala 253:29]
    end else begin
      matrix_2 <= matrixNext_2; // @[src/main/scala/ifu/Icache.scala 268:27]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 253:29]
      matrix_3 <= 4'h0; // @[src/main/scala/ifu/Icache.scala 253:29]
    end else begin
      matrix_3 <= matrixNext_3; // @[src/main/scala/ifu/Icache.scala 268:27]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 281:34]
      lruIndexReg <= 6'h0; // @[src/main/scala/ifu/Icache.scala 281:34]
    end else begin
      lruIndexReg <= lruIndexNext; // @[src/main/scala/ifu/Icache.scala 281:34]
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
  matrix_1 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  matrix_2 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  matrix_3 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  lruIndexReg = _RAND_3[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
