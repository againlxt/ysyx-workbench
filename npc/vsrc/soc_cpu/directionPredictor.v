module directionPredictor(
  input  [31:0] io_pc, // @[src/main/scala/ifu/IFU.scala 120:20]
  input  [31:0] io_nextPC, // @[src/main/scala/ifu/IFU.scala 120:20]
  output        io_jump // @[src/main/scala/ifu/IFU.scala 120:20]
);
  assign io_jump = io_nextPC < io_pc; // @[src/main/scala/ifu/IFU.scala 126:31]
endmodule
