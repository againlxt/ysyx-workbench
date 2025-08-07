module FullAdder32(
  input  [31:0] io_a, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input  [31:0] io_b, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input         io_cin, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output [31:0] io_sum, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output        io_cout // @[src/main/scala/basemode/BaseALU.scala 98:14]
);
  wire [32:0] _result_T = {1'h0,io_a}; // @[src/main/scala/basemode/BaseALU.scala 106:19]
  wire [32:0] _result_T_1 = {1'h0,io_b}; // @[src/main/scala/basemode/BaseALU.scala 106:41]
  wire [32:0] _result_T_3 = _result_T + _result_T_1; // @[src/main/scala/basemode/BaseALU.scala 106:36]
  wire [32:0] _GEN_0 = {{32'd0}, io_cin}; // @[src/main/scala/basemode/BaseALU.scala 106:58]
  wire [32:0] result = _result_T_3 + _GEN_0; // @[src/main/scala/basemode/BaseALU.scala 106:58]
  assign io_sum = result[31:0]; // @[src/main/scala/basemode/BaseALU.scala 107:19]
  assign io_cout = result[32]; // @[src/main/scala/basemode/BaseALU.scala 108:20]
endmodule
