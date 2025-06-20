module ALU(
  input  [3:0]  io_aluCtr, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  input  [31:0] io_srcAData, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  input  [31:0] io_srcBData, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output        io_less, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output        io_zero, // @[src/main/scala/exu/alu/ALU.scala 9:20]
  output [31:0] io_aluOut // @[src/main/scala/exu/alu/ALU.scala 9:20]
);
  wire [3:0] aluControl_io_aluCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_aOrLCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_lOrRCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_uOrSCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  aluControl_io_subOrAddCtr; // @[src/main/scala/exu/alu/ALU.scala 19:49]
  wire  shifter_io_lOrR; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire  shifter_io_aOrL; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [31:0] shifter_io_dIn; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [4:0] shifter_io_shamt; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire [31:0] shifter_io_dOut; // @[src/main/scala/exu/alu/ALU.scala 27:57]
  wire  aluAdder_io_subOrAdd; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_carry; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_zero; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire  aluAdder_io_overflow; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [31:0] aluAdder_io_result; // @[src/main/scala/exu/alu/ALU.scala 34:49]
  wire [2:0] aluCtrWire = io_aluCtr[2:0]; // @[src/main/scala/exu/alu/ALU.scala 21:52]
  wire  _lessWire_T_3 = aluAdder_io_overflow ^ aluAdder_io_result[31]; // @[src/main/scala/exu/alu/ALU.scala 44:77]
  wire  lessWire = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[src/main/scala/exu/alu/ALU.scala 43:46]
  wire [31:0] sltDataWire = {31'h0,lessWire}; // @[src/main/scala/exu/alu/ALU.scala 47:46]
  wire [31:0] xorDataWire = io_srcAData ^ io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 49:55]
  wire [31:0] orDataWire = io_srcAData | io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 50:55]
  wire [31:0] andDataWire = io_srcAData & io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 51:55]
  wire  _aluOutWire_T_1 = aluCtrWire == 3'h0; // @[src/main/scala/exu/alu/ALU.scala 53:29]
  wire  _aluOutWire_T_3 = aluCtrWire == 3'h1; // @[src/main/scala/exu/alu/ALU.scala 54:29]
  wire  _aluOutWire_T_5 = aluCtrWire == 3'h2; // @[src/main/scala/exu/alu/ALU.scala 55:29]
  wire  _aluOutWire_T_7 = aluCtrWire == 3'h3; // @[src/main/scala/exu/alu/ALU.scala 56:29]
  wire  _aluOutWire_T_9 = aluCtrWire == 3'h4; // @[src/main/scala/exu/alu/ALU.scala 57:29]
  wire  _aluOutWire_T_11 = aluCtrWire == 3'h5; // @[src/main/scala/exu/alu/ALU.scala 58:29]
  wire  _aluOutWire_T_13 = aluCtrWire == 3'h6; // @[src/main/scala/exu/alu/ALU.scala 59:29]
  wire  _aluOutWire_T_15 = aluCtrWire == 3'h7; // @[src/main/scala/exu/alu/ALU.scala 60:29]
  wire [31:0] _aluOutWire_T_16 = _aluOutWire_T_15 ? andDataWire : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_17 = _aluOutWire_T_13 ? orDataWire : _aluOutWire_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_18 = _aluOutWire_T_11 ? shifter_io_dOut : _aluOutWire_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_19 = _aluOutWire_T_9 ? xorDataWire : _aluOutWire_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_20 = _aluOutWire_T_7 ? io_srcBData : _aluOutWire_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_21 = _aluOutWire_T_5 ? sltDataWire : _aluOutWire_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _aluOutWire_T_22 = _aluOutWire_T_3 ? shifter_io_dOut : _aluOutWire_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  ALUControl aluControl ( // @[src/main/scala/exu/alu/ALU.scala 19:49]
    .io_aluCtr(aluControl_io_aluCtr),
    .io_aOrLCtr(aluControl_io_aOrLCtr),
    .io_lOrRCtr(aluControl_io_lOrRCtr),
    .io_uOrSCtr(aluControl_io_uOrSCtr),
    .io_subOrAddCtr(aluControl_io_subOrAddCtr)
  );
  Shifter shifter ( // @[src/main/scala/exu/alu/ALU.scala 27:57]
    .io_lOrR(shifter_io_lOrR),
    .io_aOrL(shifter_io_aOrL),
    .io_dIn(shifter_io_dIn),
    .io_shamt(shifter_io_shamt),
    .io_dOut(shifter_io_dOut)
  );
  ALUAdder aluAdder ( // @[src/main/scala/exu/alu/ALU.scala 34:49]
    .io_subOrAdd(aluAdder_io_subOrAdd),
    .io_srcAData(aluAdder_io_srcAData),
    .io_srcBData(aluAdder_io_srcBData),
    .io_carry(aluAdder_io_carry),
    .io_zero(aluAdder_io_zero),
    .io_overflow(aluAdder_io_overflow),
    .io_result(aluAdder_io_result)
  );
  assign io_less = aluControl_io_uOrSCtr ? aluAdder_io_carry ^ aluControl_io_subOrAddCtr : _lessWire_T_3; // @[src/main/scala/exu/alu/ALU.scala 43:46]
  assign io_zero = aluAdder_io_zero; // @[src/main/scala/exu/alu/ALU.scala 64:25]
  assign io_aluOut = _aluOutWire_T_1 ? aluAdder_io_result : _aluOutWire_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign aluControl_io_aluCtr = io_aluCtr; // @[src/main/scala/exu/alu/ALU.scala 20:33]
  assign shifter_io_lOrR = aluControl_io_lOrRCtr; // @[src/main/scala/exu/alu/ALU.scala 28:41]
  assign shifter_io_aOrL = aluControl_io_aOrLCtr; // @[src/main/scala/exu/alu/ALU.scala 29:41]
  assign shifter_io_dIn = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 30:41]
  assign shifter_io_shamt = io_srcBData[4:0]; // @[src/main/scala/exu/alu/ALU.scala 31:55]
  assign aluAdder_io_subOrAdd = aluControl_io_subOrAddCtr; // @[src/main/scala/exu/alu/ALU.scala 35:33]
  assign aluAdder_io_srcAData = io_srcAData; // @[src/main/scala/exu/alu/ALU.scala 36:33]
  assign aluAdder_io_srcBData = io_srcBData; // @[src/main/scala/exu/alu/ALU.scala 37:33]
endmodule
