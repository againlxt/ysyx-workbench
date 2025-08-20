module BranchPredict(
  input         clock,
  input         reset,
  input  [31:0] io_correctPC, // @[src/main/scala/ifu/IFU.scala 63:20]
  input  [31:0] io_fromPC, // @[src/main/scala/ifu/IFU.scala 63:20]
  input         io_flush, // @[src/main/scala/ifu/IFU.scala 63:20]
  input         io_ifu2ICache_ready, // @[src/main/scala/ifu/IFU.scala 63:20]
  output        io_ifu2ICache_valid, // @[src/main/scala/ifu/IFU.scala 63:20]
  output [31:0] io_ifu2ICache_bits_pc // @[src/main/scala/ifu/IFU.scala 63:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] dp_io_pc; // @[src/main/scala/ifu/IFU.scala 101:41]
  wire [31:0] dp_io_nextPC; // @[src/main/scala/ifu/IFU.scala 101:41]
  wire  dp_io_jump; // @[src/main/scala/ifu/IFU.scala 101:41]
  reg [31:0] pcReg; // @[src/main/scala/ifu/IFU.scala 70:50]
  wire [2:0] indexWire = pcReg[4:2]; // @[src/main/scala/ifu/IFU.scala 72:40]
  wire [9:0] tagWire = pcReg[14:5]; // @[src/main/scala/ifu/IFU.scala 73:40]
  reg  wayValidVec_validVec_0_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_1_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_2_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_3_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_4_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_5_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_6_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg  wayValidVec_validVec_7_0; // @[src/main/scala/ifu/IFU.scala 75:42]
  reg [9:0] wayValidVec_tagVec_0_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_1_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_2_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_3_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_4_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_5_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_6_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [9:0] wayValidVec_tagVec_7_0; // @[src/main/scala/ifu/IFU.scala 76:50]
  reg [31:0] wayValidVec_pcVec_0_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_1_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_2_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_3_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_4_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_5_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_6_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  reg [31:0] wayValidVec_pcVec_7_0; // @[src/main/scala/ifu/IFU.scala 77:50]
  wire [9:0] _GEN_1 = 3'h1 == indexWire ? wayValidVec_tagVec_1_0 : wayValidVec_tagVec_0_0; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_2 = 3'h2 == indexWire ? wayValidVec_tagVec_2_0 : _GEN_1; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_3 = 3'h3 == indexWire ? wayValidVec_tagVec_3_0 : _GEN_2; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_4 = 3'h4 == indexWire ? wayValidVec_tagVec_4_0 : _GEN_3; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_5 = 3'h5 == indexWire ? wayValidVec_tagVec_5_0 : _GEN_4; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_6 = 3'h6 == indexWire ? wayValidVec_tagVec_6_0 : _GEN_5; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire [9:0] _GEN_7 = 3'h7 == indexWire ? wayValidVec_tagVec_7_0 : _GEN_6; // @[src/main/scala/ifu/IFU.scala 81:{99,99}]
  wire  _GEN_9 = 3'h1 == indexWire ? wayValidVec_validVec_1_0 : wayValidVec_validVec_0_0; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_10 = 3'h2 == indexWire ? wayValidVec_validVec_2_0 : _GEN_9; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_11 = 3'h3 == indexWire ? wayValidVec_validVec_3_0 : _GEN_10; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_12 = 3'h4 == indexWire ? wayValidVec_validVec_4_0 : _GEN_11; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_13 = 3'h5 == indexWire ? wayValidVec_validVec_5_0 : _GEN_12; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_14 = 3'h6 == indexWire ? wayValidVec_validVec_6_0 : _GEN_13; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  _GEN_15 = 3'h7 == indexWire ? wayValidVec_validVec_7_0 : _GEN_14; // @[src/main/scala/ifu/IFU.scala 81:{93,93}]
  wire  hitVec_0 = _GEN_15 & _GEN_7 == tagWire; // @[src/main/scala/ifu/IFU.scala 81:93]
  reg [31:0] fromPCReg; // @[src/main/scala/ifu/IFU.scala 85:44]
  reg  flushReg; // @[src/main/scala/ifu/IFU.scala 88:42]
  wire [2:0] flushIndexWire = io_fromPC[4:2]; // @[src/main/scala/ifu/IFU.scala 93:44]
  wire  _GEN_17 = 3'h0 == flushIndexWire | wayValidVec_validVec_0_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_18 = 3'h1 == flushIndexWire | wayValidVec_validVec_1_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_19 = 3'h2 == flushIndexWire | wayValidVec_validVec_2_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_20 = 3'h3 == flushIndexWire | wayValidVec_validVec_3_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_21 = 3'h4 == flushIndexWire | wayValidVec_validVec_4_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_22 = 3'h5 == flushIndexWire | wayValidVec_validVec_5_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_23 = 3'h6 == flushIndexWire | wayValidVec_validVec_6_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire  _GEN_24 = 3'h7 == flushIndexWire | wayValidVec_validVec_7_0; // @[src/main/scala/ifu/IFU.scala 75:42 95:{65,65}]
  wire [31:0] _GEN_66 = 3'h1 == indexWire ? wayValidVec_pcVec_1_0 : wayValidVec_pcVec_0_0; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_67 = 3'h2 == indexWire ? wayValidVec_pcVec_2_0 : _GEN_66; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_68 = 3'h3 == indexWire ? wayValidVec_pcVec_3_0 : _GEN_67; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_69 = 3'h4 == indexWire ? wayValidVec_pcVec_4_0 : _GEN_68; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_70 = 3'h5 == indexWire ? wayValidVec_pcVec_5_0 : _GEN_69; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_71 = 3'h6 == indexWire ? wayValidVec_pcVec_6_0 : _GEN_70; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] _GEN_72 = 3'h7 == indexWire ? wayValidVec_pcVec_7_0 : _GEN_71; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  wire [31:0] normalPC = pcReg + 32'h4; // @[src/main/scala/ifu/IFU.scala 105:33]
  wire [31:0] _pcReg_T_1 = dp_io_jump ? _GEN_72 : normalPC; // @[src/main/scala/ifu/IFU.scala 109:60]
  directionPredictor dp ( // @[src/main/scala/ifu/IFU.scala 101:41]
    .io_pc(dp_io_pc),
    .io_nextPC(dp_io_nextPC),
    .io_jump(dp_io_jump)
  );
  assign io_ifu2ICache_valid = ~io_flush; // @[src/main/scala/ifu/IFU.scala 112:36]
  assign io_ifu2ICache_bits_pc = pcReg; // @[src/main/scala/ifu/IFU.scala 113:33]
  assign dp_io_pc = pcReg; // @[src/main/scala/ifu/IFU.scala 102:33]
  assign dp_io_nextPC = 3'h7 == indexWire ? wayValidVec_pcVec_7_0 : _GEN_71; // @[src/main/scala/ifu/IFU.scala 103:{25,25}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 70:50]
      pcReg <= 32'h30000000; // @[src/main/scala/ifu/IFU.scala 70:50]
    end else if (io_flush) begin // @[src/main/scala/ifu/IFU.scala 106:24]
      pcReg <= io_correctPC; // @[src/main/scala/ifu/IFU.scala 107:41]
    end else if (io_ifu2ICache_ready) begin // @[src/main/scala/ifu/IFU.scala 108:42]
      if (hitVec_0) begin // @[src/main/scala/ifu/IFU.scala 109:47]
        pcReg <= _pcReg_T_1;
      end else begin
        pcReg <= normalPC;
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_0_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_0_0 <= _GEN_17;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_1_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_1_0 <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_2_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_2_0 <= _GEN_19;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_3_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_3_0 <= _GEN_20;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_4_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_4_0 <= _GEN_21;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_5_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_5_0 <= _GEN_22;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_6_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_6_0 <= _GEN_23;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 75:42]
      wayValidVec_validVec_7_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 75:42]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      wayValidVec_validVec_7_0 <= _GEN_24;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_0_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h0 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_0_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_1_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h1 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_1_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_2_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h2 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_2_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_3_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h3 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_3_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_4_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h4 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_4_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_5_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h5 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_5_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_6_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h6 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_6_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 76:50]
      wayValidVec_tagVec_7_0 <= 10'h0; // @[src/main/scala/ifu/IFU.scala 76:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h7 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 96:65]
        wayValidVec_tagVec_7_0 <= fromPCReg[14:5]; // @[src/main/scala/ifu/IFU.scala 96:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_0_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h0 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_0_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_1_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h1 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_1_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_2_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h2 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_2_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_3_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h3 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_3_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_4_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h4 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_4_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_5_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h5 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_5_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_6_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h6 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_6_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 77:50]
      wayValidVec_pcVec_7_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 77:50]
    end else if (flushReg) begin // @[src/main/scala/ifu/IFU.scala 94:24]
      if (3'h7 == flushIndexWire) begin // @[src/main/scala/ifu/IFU.scala 97:65]
        wayValidVec_pcVec_7_0 <= pcReg; // @[src/main/scala/ifu/IFU.scala 97:65]
      end
    end
    if (io_flush) begin // @[src/main/scala/ifu/IFU.scala 85:44]
      fromPCReg <= io_fromPC; // @[src/main/scala/ifu/IFU.scala 85:44]
    end
    flushReg <= io_flush; // @[src/main/scala/ifu/IFU.scala 88:42]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  wayValidVec_validVec_0_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wayValidVec_validVec_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wayValidVec_validVec_2_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  wayValidVec_validVec_3_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wayValidVec_validVec_4_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wayValidVec_validVec_5_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wayValidVec_validVec_6_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  wayValidVec_validVec_7_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wayValidVec_tagVec_0_0 = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  wayValidVec_tagVec_1_0 = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  wayValidVec_tagVec_2_0 = _RAND_11[9:0];
  _RAND_12 = {1{`RANDOM}};
  wayValidVec_tagVec_3_0 = _RAND_12[9:0];
  _RAND_13 = {1{`RANDOM}};
  wayValidVec_tagVec_4_0 = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  wayValidVec_tagVec_5_0 = _RAND_14[9:0];
  _RAND_15 = {1{`RANDOM}};
  wayValidVec_tagVec_6_0 = _RAND_15[9:0];
  _RAND_16 = {1{`RANDOM}};
  wayValidVec_tagVec_7_0 = _RAND_16[9:0];
  _RAND_17 = {1{`RANDOM}};
  wayValidVec_pcVec_0_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  wayValidVec_pcVec_1_0 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  wayValidVec_pcVec_2_0 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  wayValidVec_pcVec_3_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  wayValidVec_pcVec_4_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  wayValidVec_pcVec_5_0 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  wayValidVec_pcVec_6_0 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  wayValidVec_pcVec_7_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  fromPCReg = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  flushReg = _RAND_26[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
