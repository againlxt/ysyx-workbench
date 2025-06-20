module ALUAdder(
  input         io_subOrAdd, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_carry, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_zero, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output        io_overflow, // @[src/main/scala/exu/alu/ALU.scala 73:20]
  output [31:0] io_result // @[src/main/scala/exu/alu/ALU.scala 73:20]
);
  wire [31:0] cla32Add_io_a; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [31:0] cla32Add_io_b; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire  cla32Add_io_cin; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire  cla32Add_io_cout; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [31:0] cla32Add_io_sum; // @[src/main/scala/exu/alu/ALU.scala 84:33]
  wire [30:0] _subOrAddWire_T_1 = io_subOrAdd ? 31'h7fffffff : 31'h0; // @[src/main/scala/exu/alu/ALU.scala 85:35]
  wire [31:0] subOrAddWire = {_subOrAddWire_T_1,io_subOrAdd}; // @[src/main/scala/exu/alu/ALU.scala 85:30]
  wire [31:0] bXorCIn = io_srcBData ^ subOrAddWire; // @[src/main/scala/exu/alu/ALU.scala 88:36]
  wire  _aOverflow_T_5 = cla32Add_io_sum[31] != io_srcAData[31]; // @[src/main/scala/exu/alu/ALU.scala 95:83]
  wire  aOverflow = io_srcAData[31] == io_srcBData[31] & cla32Add_io_sum[31] != io_srcAData[31]; // @[src/main/scala/exu/alu/ALU.scala 95:59]
  wire  sOverflow = io_srcAData[31] == bXorCIn[31] & _aOverflow_T_5; // @[src/main/scala/exu/alu/ALU.scala 96:58]
  CLAGen cla32Add ( // @[src/main/scala/exu/alu/ALU.scala 84:33]
    .io_a(cla32Add_io_a),
    .io_b(cla32Add_io_b),
    .io_cin(cla32Add_io_cin),
    .io_cout(cla32Add_io_cout),
    .io_sum(cla32Add_io_sum)
  );
  assign io_carry = cla32Add_io_cout; // @[src/main/scala/exu/alu/ALU.scala 93:33]
  assign io_zero = cla32Add_io_sum == 32'h0; // @[src/main/scala/exu/alu/ALU.scala 94:56]
  assign io_overflow = io_subOrAdd ? sOverflow : aOverflow; // @[src/main/scala/exu/alu/ALU.scala 97:39]
  assign io_result = cla32Add_io_sum; // @[src/main/scala/exu/alu/ALU.scala 98:33]
  assign cla32Add_io_a = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 90:25]
  assign cla32Add_io_b = io_srcBData ^ subOrAddWire; // @[src/main/scala/exu/alu/ALU.scala 91:37]
  assign cla32Add_io_cin = io_subOrAdd; // @[src/main/scala/exu/alu/ALU.scala 92:25]
endmodule
