module CSRALU(
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  input  [1:0]  io_csrALUOP, // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
  output [31:0] io_oData // @[src/main/scala/exu/alu/CSRALU.scala 9:20]
);
  wire [31:0] _andNotDataWire_T = ~io_srcBData; // @[src/main/scala/exu/alu/CSRALU.scala 20:43]
  wire [31:0] andNotDataWire = io_srcAData & _andNotDataWire_T; // @[src/main/scala/exu/alu/CSRALU.scala 20:40]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[src/main/scala/exu/alu/CSRALU.scala 21:40]
  wire  _io_oData_T = io_csrALUOP == 2'h0; // @[src/main/scala/exu/alu/CSRALU.scala 24:23]
  wire  _io_oData_T_1 = io_csrALUOP == 2'h1; // @[src/main/scala/exu/alu/CSRALU.scala 25:23]
  wire  _io_oData_T_2 = io_csrALUOP == 2'h2; // @[src/main/scala/exu/alu/CSRALU.scala 26:23]
  wire [31:0] _io_oData_T_3 = _io_oData_T_2 ? io_srcBData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_oData_T_4 = _io_oData_T_1 ? orDataWire : _io_oData_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_oData = _io_oData_T ? andNotDataWire : _io_oData_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
endmodule
