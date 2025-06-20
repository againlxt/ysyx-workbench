module IFU(
  input         clock,
  input         reset,
  input  [31:0] io_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_bready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_bvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_arready, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_arvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_ifu2Mem_araddr, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_rready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_rvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input  [31:0] io_ifu2Mem_rdata // @[src/main/scala/ifu/IFU.scala 15:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  resetnWire = ~reset; // @[src/main/scala/ifu/IFU.scala 22:35]
  reg  breadyReg; // @[src/main/scala/ifu/IFU.scala 37:42]
  reg  arvalidReg; // @[src/main/scala/ifu/IFU.scala 39:42]
  reg [31:0] araddrReg; // @[src/main/scala/ifu/IFU.scala 40:42]
  reg  rreadyReg; // @[src/main/scala/ifu/IFU.scala 47:42]
  wire  _T_1 = ~resetnWire; // @[src/main/scala/ifu/IFU.scala 95:14]
  wire  _GEN_0 = io_ifu2Mem_bvalid | breadyReg; // @[src/main/scala/ifu/IFU.scala 100:33 99:33 37:42]
  wire  _GEN_1 = io_ifu2Mem_bvalid & io_ifu2Mem_bready ? 1'h0 : _GEN_0; // @[src/main/scala/ifu/IFU.scala 97:54 98:33]
  wire  _GEN_2 = ~resetnWire | _GEN_1; // @[src/main/scala/ifu/IFU.scala 95:34 96:33]
  wire  _GEN_3 = io_ifu2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/IFU.scala 107:41 108:28 39:42]
  wire  _GEN_4 = araddrReg != io_pc | _GEN_3; // @[src/main/scala/ifu/IFU.scala 105:42 106:28]
  wire  _GEN_5 = _T_1 | _GEN_4; // @[src/main/scala/ifu/IFU.scala 103:34 104:28]
  wire  _GEN_6 = io_ifu2Mem_rvalid | rreadyReg; // @[src/main/scala/ifu/IFU.scala 115:40 116:27 47:42]
  wire  _GEN_7 = io_ifu2Mem_rvalid & rreadyReg ? 1'h0 : _GEN_6; // @[src/main/scala/ifu/IFU.scala 113:60 114:27]
  wire  _GEN_8 = _T_1 | _GEN_7; // @[src/main/scala/ifu/IFU.scala 111:34 112:27]
  assign io_inst_valid = io_ifu2Mem_rvalid & rreadyReg; // @[src/main/scala/ifu/IFU.scala 133:47]
  assign io_inst_bits_inst = io_ifu2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 134:33]
  assign io_inst_bits_pc = araddrReg; // @[src/main/scala/ifu/IFU.scala 135:33]
  assign io_ifu2Mem_bready = breadyReg; // @[src/main/scala/ifu/IFU.scala 65:33]
  assign io_ifu2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/IFU.scala 71:33]
  assign io_ifu2Mem_araddr = araddrReg; // @[src/main/scala/ifu/IFU.scala 72:33]
  assign io_ifu2Mem_rready = rreadyReg; // @[src/main/scala/ifu/IFU.scala 78:33]
  always @(posedge clock) begin
    breadyReg <= reset | _GEN_2; // @[src/main/scala/ifu/IFU.scala 37:{42,42}]
    arvalidReg <= reset | _GEN_5; // @[src/main/scala/ifu/IFU.scala 39:{42,42}]
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 40:42]
      araddrReg <= 32'h80000000; // @[src/main/scala/ifu/IFU.scala 40:42]
    end else begin
      araddrReg <= io_pc; // @[src/main/scala/ifu/IFU.scala 45:41]
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 47:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 47:42]
    end else begin
      rreadyReg <= _GEN_8;
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
  breadyReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  arvalidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  araddrReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rreadyReg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
