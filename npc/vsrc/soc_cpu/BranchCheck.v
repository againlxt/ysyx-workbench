module BranchCheck(
  input  [31:0] io_predictPC, // @[src/main/scala/exu/EXU.scala 208:20]
  input  [31:0] io_correctPC, // @[src/main/scala/exu/EXU.scala 208:20]
  output        io_correct // @[src/main/scala/exu/EXU.scala 208:20]
);
  assign io_correct = io_predictPC == io_correctPC; // @[src/main/scala/exu/EXU.scala 214:41]
endmodule
