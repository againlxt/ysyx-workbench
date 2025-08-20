module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_0, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_1, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_0, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_1, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_flush // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_0 [0:3]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_0_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [1:0] ram_0_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_0_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_0_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [1:0] ram_0_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_0_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_0_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_1 [0:3]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_1_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [1:0] ram_1_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_1_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_1_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [1:0] ram_1_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_1_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_1_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [1:0] enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 283:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 284:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 285:24]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _GEN_13 = io_deq_ready ? 1'h0 : _do_enq_T; // @[src/main/scala/chisel3/util/Decoupled.scala 324:26 286:27 324:35]
  wire  do_enq = empty ? _GEN_13 : _do_enq_T; // @[src/main/scala/chisel3/util/Decoupled.scala 321:17 286:27]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[src/main/scala/chisel3/util/Decoupled.scala 321:17 323:14 287:27]
  assign ram_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_0_io_deq_bits_MPORT_data = ram_0[ram_0_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_0_MPORT_data = io_enq_bits_0;
  assign ram_0_MPORT_addr = enq_ptr_value;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = empty ? _GEN_13 : _do_enq_T;
  assign ram_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_1_io_deq_bits_MPORT_data = ram_1[ram_1_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_1_MPORT_data = io_enq_bits_1;
  assign ram_1_MPORT_addr = enq_ptr_value;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = empty ? _GEN_13 : _do_enq_T;
  assign io_enq_ready = io_deq_ready | ~full; // @[src/main/scala/chisel3/util/Decoupled.scala 309:16 329:{24,39}]
  assign io_deq_valid = io_enq_valid | ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 308:16 320:{24,39}]
  assign io_deq_bits_0 = empty ? io_enq_bits_0 : ram_0_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17 321:17 322:19]
  assign io_deq_bits_1 = empty ? io_enq_bits_1 : ram_1_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17 321:17 322:19]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (io_flush) begin // @[src/main/scala/chisel3/util/Decoupled.scala 302:15]
      enq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 98:11]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 292:16]
      enq_ptr_value <= _value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (io_flush) begin // @[src/main/scala/chisel3/util/Decoupled.scala 302:15]
      deq_ptr_value <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 98:11]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 296:16]
      deq_ptr_value <= _value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    end else if (io_flush) begin // @[src/main/scala/chisel3/util/Decoupled.scala 302:15]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 305:16]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 299:27]
      if (empty) begin // @[src/main/scala/chisel3/util/Decoupled.scala 321:17]
        maybe_full <= _GEN_13;
      end else begin
        maybe_full <= _do_enq_T; // @[src/main/scala/chisel3/util/Decoupled.scala 286:27]
      end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_1[initvar] = _RAND_1[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
