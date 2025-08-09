module BranchCheck(
  input  [31:0] io_predictPC, // @[src/main/scala/Main.scala 281:20]
  input  [31:0] io_correctPC, // @[src/main/scala/Main.scala 281:20]
  output        io_correct // @[src/main/scala/Main.scala 281:20]
);
  wire  _io_correct_T_1 = io_predictPC == 32'h0; // @[src/main/scala/Main.scala 288:23]
  wire  _io_correct_T_2 = io_predictPC == io_correctPC | _io_correct_T_1; // @[src/main/scala/Main.scala 287:59]
  assign io_correct = _io_correct_T_2 | io_correctPC == 32'h4; // @[src/main/scala/Main.scala 288:32]
endmodule
