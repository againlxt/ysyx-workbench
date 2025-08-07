module Shifter(
  input         io_lOrR, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input         io_aOrL, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input  [31:0] io_dIn, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  input  [4:0]  io_shamt, // @[src/main/scala/exu/alu/ALU.scala 102:20]
  output [31:0] io_dOut // @[src/main/scala/exu/alu/ALU.scala 102:20]
);
  wire [31:0] _dataS_T_1 = io_dIn[31] ? 32'hffffffff : 32'h0; // @[src/main/scala/exu/alu/ALU.scala 110:67]
  wire [63:0] dataS = {_dataS_T_1,io_dIn}; // @[src/main/scala/exu/alu/ALU.scala 110:62]
  wire [63:0] rightShiftedDataWire = dataS >> io_shamt; // @[src/main/scala/exu/alu/ALU.scala 111:49]
  wire [62:0] _GEN_0 = {{31'd0}, io_dIn}; // @[src/main/scala/exu/alu/ALU.scala 112:50]
  wire [62:0] leftShiftedDataWire = _GEN_0 << io_shamt; // @[src/main/scala/exu/alu/ALU.scala 112:50]
  wire [31:0] _io_dOut_T_3 = io_dIn >> io_shamt; // @[src/main/scala/exu/alu/ALU.scala 113:117]
  wire [31:0] _io_dOut_T_4 = io_aOrL ? rightShiftedDataWire[31:0] : _io_dOut_T_3; // @[src/main/scala/exu/alu/ALU.scala 113:64]
  wire [62:0] _io_dOut_T_5 = io_lOrR ? leftShiftedDataWire : {{31'd0}, _io_dOut_T_4}; // @[src/main/scala/exu/alu/ALU.scala 113:23]
  assign io_dOut = _io_dOut_T_5[31:0]; // @[src/main/scala/exu/alu/ALU.scala 113:17]
endmodule
