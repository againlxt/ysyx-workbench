module FullAdder(
  input   io_a, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  input   io_b, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  input   io_cin, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_s, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_p, // @[src/main/scala/basemode/BaseALU.scala 8:20]
  output  io_g // @[src/main/scala/basemode/BaseALU.scala 8:20]
);
  assign io_s = io_a ^ io_b ^ io_cin; // @[src/main/scala/basemode/BaseALU.scala 17:29]
  assign io_p = io_a | io_b; // @[src/main/scala/basemode/BaseALU.scala 18:22]
  assign io_g = io_a & io_b; // @[src/main/scala/basemode/BaseALU.scala 19:22]
endmodule
