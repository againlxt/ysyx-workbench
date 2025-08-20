module Icache(
  input         clock,
  input         reset,
  output        io_ifu2ICache_ready, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_ifu2ICache_valid, // @[src/main/scala/ifu/Icache.scala 21:16]
  input  [31:0] io_ifu2ICache_bits_pc, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_icache2IFU_ready, // @[src/main/scala/ifu/Icache.scala 21:16]
  output        io_icache2IFU_valid, // @[src/main/scala/ifu/Icache.scala 21:16]
  output [31:0] io_icache2IFU_bits_pc, // @[src/main/scala/ifu/Icache.scala 21:16]
  output [31:0] io_icache2IFU_bits_inst, // @[src/main/scala/ifu/Icache.scala 21:16]
  output        io_icache2Mem_bready, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_icache2Mem_bvalid, // @[src/main/scala/ifu/Icache.scala 21:16]
  input  [1:0]  io_icache2Mem_bresp, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_icache2Mem_arready, // @[src/main/scala/ifu/Icache.scala 21:16]
  output        io_icache2Mem_arvalid, // @[src/main/scala/ifu/Icache.scala 21:16]
  output [31:0] io_icache2Mem_araddr, // @[src/main/scala/ifu/Icache.scala 21:16]
  output [7:0]  io_icache2Mem_arlen, // @[src/main/scala/ifu/Icache.scala 21:16]
  output        io_icache2Mem_rready, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_icache2Mem_rvalid, // @[src/main/scala/ifu/Icache.scala 21:16]
  input  [31:0] io_icache2Mem_rdata, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_icache2Mem_rlast, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_wbu2Icache, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_flush // @[src/main/scala/ifu/Icache.scala 21:16]
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
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
`endif // RANDOMIZE_REG_INIT
  wire  replacement_algorithm_clock; // @[src/main/scala/ifu/Icache.scala 52:49]
  wire  replacement_algorithm_reset; // @[src/main/scala/ifu/Icache.scala 52:49]
  wire  replacement_algorithm_io_update_entry; // @[src/main/scala/ifu/Icache.scala 52:49]
  wire [2:0] replacement_algorithm_io_update_index; // @[src/main/scala/ifu/Icache.scala 52:49]
  wire [2:0] replacement_algorithm_io_way_index; // @[src/main/scala/ifu/Icache.scala 52:49]
  wire  axiAccessFault_valid; // @[src/main/scala/ifu/Icache.scala 187:44]
  wire  axiAccessFault_ready; // @[src/main/scala/ifu/Icache.scala 187:44]
  wire [1:0] axiAccessFault_resp; // @[src/main/scala/ifu/Icache.scala 187:44]
  wire  ATC_valid; // @[src/main/scala/ifu/Icache.scala 216:57]
  wire [31:0] ATC_counterType; // @[src/main/scala/ifu/Icache.scala 216:57]
  wire [31:0] ATC_data; // @[src/main/scala/ifu/Icache.scala 216:57]
  wire  MPC_valid; // @[src/main/scala/ifu/Icache.scala 220:57]
  wire [31:0] MPC_counterType; // @[src/main/scala/ifu/Icache.scala 220:57]
  wire [31:0] MPC_data; // @[src/main/scala/ifu/Icache.scala 220:57]
  reg  cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_0_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_1_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_2_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_3_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_4_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_4_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_5_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_5_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_6_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_6_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_7_0; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg  cacheValidReg_7_1; // @[src/main/scala/ifu/Icache.scala 28:42]
  reg [24:0] tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_0_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_1_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_1_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_2_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_2_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_3_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_3_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_4_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_4_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_5_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_5_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_6_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_6_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_7_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [24:0] tagReg_7_1; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [31:0] cache_0_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_0_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_1_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_2_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_3_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_4_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_5_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_6_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_0_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_0_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_0_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_0_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_1_0; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_1_1; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_1_2; // @[src/main/scala/ifu/Icache.scala 30:50]
  reg [31:0] cache_7_1_3; // @[src/main/scala/ifu/Icache.scala 30:50]
  wire  _addrReg_T = io_ifu2ICache_valid & io_ifu2ICache_ready; // @[src/main/scala/ifu/Icache.scala 32:80]
  reg [31:0] addrReg; // @[src/main/scala/ifu/Icache.scala 32:36]
  wire [24:0] tagWire = addrReg[31:7]; // @[src/main/scala/ifu/Icache.scala 33:50]
  wire [2:0] indexWire = addrReg[6:4]; // @[src/main/scala/ifu/Icache.scala 34:42]
  wire [1:0] offsetWire = addrReg[3:2]; // @[src/main/scala/ifu/Icache.scala 35:50]
  wire [24:0] _GEN_2 = 3'h1 == indexWire ? tagReg_1_0 : tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_3 = 3'h2 == indexWire ? tagReg_2_0 : _GEN_2; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_4 = 3'h3 == indexWire ? tagReg_3_0 : _GEN_3; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_5 = 3'h4 == indexWire ? tagReg_4_0 : _GEN_4; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_6 = 3'h5 == indexWire ? tagReg_5_0 : _GEN_5; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_7 = 3'h6 == indexWire ? tagReg_6_0 : _GEN_6; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_8 = 3'h7 == indexWire ? tagReg_7_0 : _GEN_7; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire  _GEN_10 = 3'h1 == indexWire ? cacheValidReg_1_0 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_11 = 3'h2 == indexWire ? cacheValidReg_2_0 : _GEN_10; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_12 = 3'h3 == indexWire ? cacheValidReg_3_0 : _GEN_11; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_13 = 3'h4 == indexWire ? cacheValidReg_4_0 : _GEN_12; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_14 = 3'h5 == indexWire ? cacheValidReg_5_0 : _GEN_13; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_15 = 3'h6 == indexWire ? cacheValidReg_6_0 : _GEN_14; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_16 = 3'h7 == indexWire ? cacheValidReg_7_0 : _GEN_15; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  hitVec_0 = _GEN_16 & _GEN_8 == tagWire; // @[src/main/scala/ifu/Icache.scala 38:93]
  wire [24:0] _GEN_18 = 3'h1 == indexWire ? tagReg_1_1 : tagReg_0_1; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_19 = 3'h2 == indexWire ? tagReg_2_1 : _GEN_18; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_20 = 3'h3 == indexWire ? tagReg_3_1 : _GEN_19; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_21 = 3'h4 == indexWire ? tagReg_4_1 : _GEN_20; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_22 = 3'h5 == indexWire ? tagReg_5_1 : _GEN_21; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_23 = 3'h6 == indexWire ? tagReg_6_1 : _GEN_22; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire [24:0] _GEN_24 = 3'h7 == indexWire ? tagReg_7_1 : _GEN_23; // @[src/main/scala/ifu/Icache.scala 38:{99,99}]
  wire  _GEN_26 = 3'h1 == indexWire ? cacheValidReg_1_1 : cacheValidReg_0_1; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_27 = 3'h2 == indexWire ? cacheValidReg_2_1 : _GEN_26; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_28 = 3'h3 == indexWire ? cacheValidReg_3_1 : _GEN_27; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_29 = 3'h4 == indexWire ? cacheValidReg_4_1 : _GEN_28; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_30 = 3'h5 == indexWire ? cacheValidReg_5_1 : _GEN_29; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_31 = 3'h6 == indexWire ? cacheValidReg_6_1 : _GEN_30; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  _GEN_32 = 3'h7 == indexWire ? cacheValidReg_7_1 : _GEN_31; // @[src/main/scala/ifu/Icache.scala 38:{93,93}]
  wire  hitVec_1 = _GEN_32 & _GEN_24 == tagWire; // @[src/main/scala/ifu/Icache.scala 38:93]
  wire  hitWire = hitVec_0 | hitVec_1; // @[src/main/scala/ifu/Icache.scala 39:51]
  reg  flushReg; // @[src/main/scala/ifu/Icache.scala 41:42]
  reg [4:0] state; // @[src/main/scala/ifu/Icache.scala 48:30]
  wire  _replacement_algorithm_io_update_entry_T = ~hitWire; // @[src/main/scala/ifu/Icache.scala 54:52]
  wire  _replacement_algorithm_io_update_entry_T_1 = state == 5'h2; // @[src/main/scala/ifu/Icache.scala 54:70]
  reg [7:0] busrtCnt; // @[src/main/scala/ifu/Icache.scala 59:42]
  wire  _findEndWire_T = io_icache2Mem_rvalid & io_icache2Mem_rready; // @[src/main/scala/ifu/Icache.scala 61:53]
  wire [2:0] _findEndWire_T_4 = 3'h4 - 3'h1; // @[src/main/scala/ifu/Icache.scala 61:133]
  wire [7:0] _GEN_457 = {{5'd0}, _findEndWire_T_4}; // @[src/main/scala/ifu/Icache.scala 61:110]
  wire  _findEndWire_T_5 = busrtCnt == _GEN_457; // @[src/main/scala/ifu/Icache.scala 61:110]
  wire  findEndWire = io_icache2Mem_rvalid & io_icache2Mem_rready & io_icache2Mem_rlast & busrtCnt == _GEN_457; // @[src/main/scala/ifu/Icache.scala 61:98]
  wire  isSdram = addrReg[31:28] >= 4'ha; // @[src/main/scala/ifu/Icache.scala 65:43]
  wire [1:0] _state_T_1 = _addrReg_T ? 2'h2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 67:27]
  wire [3:0] _state_T_2 = isSdram ? 4'h8 : 4'h4; // @[src/main/scala/ifu/Icache.scala 68:48]
  wire [4:0] _state_T_3 = hitWire ? 5'h10 : {{1'd0}, _state_T_2}; // @[src/main/scala/ifu/Icache.scala 68:27]
  wire [4:0] _state_T_4 = findEndWire ? 5'h10 : 5'h4; // @[src/main/scala/ifu/Icache.scala 69:27]
  wire  _state_T_8 = io_icache2IFU_valid & io_icache2IFU_ready | io_flush | flushReg; // @[src/main/scala/ifu/Icache.scala 71:95]
  wire  _state_T_10 = 5'h1 == state; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire [1:0] _state_T_11 = 5'h1 == state ? _state_T_1 : 2'h1; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire  _state_T_12 = 5'h2 == state; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire [4:0] _state_T_13 = 5'h2 == state ? _state_T_3 : {{3'd0}, _state_T_11}; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire  _state_T_14 = 5'h4 == state; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire  _state_T_16 = 5'h8 == state; // @[src/main/scala/ifu/Icache.scala 66:38]
  wire  _state_T_18 = 5'h10 == state; // @[src/main/scala/ifu/Icache.scala 66:38]
  reg  breadyReg; // @[src/main/scala/ifu/Icache.scala 87:42]
  reg  arvalidReg; // @[src/main/scala/ifu/Icache.scala 89:42]
  reg [7:0] arlenReg; // @[src/main/scala/ifu/Icache.scala 91:42]
  reg  rreadyReg; // @[src/main/scala/ifu/Icache.scala 95:42]
  wire [31:0] _io_icache2Mem_araddr_T_1 = {addrReg[31:4],4'h0}; // @[src/main/scala/ifu/Icache.scala 120:52]
  wire [9:0] _io_icache2Mem_araddr_T_4 = {busrtCnt, 2'h0}; // @[src/main/scala/ifu/Icache.scala 120:120]
  wire [31:0] _GEN_458 = {{22'd0}, _io_icache2Mem_araddr_T_4}; // @[src/main/scala/ifu/Icache.scala 120:108]
  wire [31:0] _io_icache2Mem_araddr_T_6 = _io_icache2Mem_araddr_T_1 + _GEN_458; // @[src/main/scala/ifu/Icache.scala 120:108]
  wire  _GEN_459 = 3'h0 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_460 = ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_461 = 3'h0 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_476 = 3'h0 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_487 = 3'h1 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_489 = 3'h1 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_504 = 3'h1 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_515 = 3'h2 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_517 = 3'h2 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_532 = 3'h2 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_543 = 3'h3 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_545 = 3'h3 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_560 = 3'h3 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_571 = 3'h4 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_573 = 3'h4 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_588 = 3'h4 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_599 = 3'h5 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_601 = 3'h5 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_616 = 3'h5 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_627 = 3'h6 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_629 = 3'h6 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_644 = 3'h6 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_655 = 3'h7 == indexWire; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_657 = 3'h7 == indexWire & ~replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire  _GEN_672 = 3'h7 == indexWire & replacement_algorithm_io_way_index[0]; // @[src/main/scala/ifu/Icache.scala 135:{62,62} 30:50]
  wire [7:0] _busrtCnt_T_1 = busrtCnt + 8'h1; // @[src/main/scala/ifu/Icache.scala 139:46]
  wire [24:0] _GEN_164 = _GEN_459 & replacement_algorithm_io_way_index[0] ? tagReg_0_1 : tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_165 = _GEN_487 & _GEN_460 ? tagReg_1_0 : _GEN_164; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_166 = _GEN_487 & replacement_algorithm_io_way_index[0] ? tagReg_1_1 : _GEN_165; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_167 = _GEN_515 & _GEN_460 ? tagReg_2_0 : _GEN_166; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_168 = _GEN_515 & replacement_algorithm_io_way_index[0] ? tagReg_2_1 : _GEN_167; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_169 = _GEN_543 & _GEN_460 ? tagReg_3_0 : _GEN_168; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_170 = _GEN_543 & replacement_algorithm_io_way_index[0] ? tagReg_3_1 : _GEN_169; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_171 = _GEN_571 & _GEN_460 ? tagReg_4_0 : _GEN_170; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_172 = _GEN_571 & replacement_algorithm_io_way_index[0] ? tagReg_4_1 : _GEN_171; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_173 = _GEN_599 & _GEN_460 ? tagReg_5_0 : _GEN_172; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_174 = _GEN_599 & replacement_algorithm_io_way_index[0] ? tagReg_5_1 : _GEN_173; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_175 = _GEN_627 & _GEN_460 ? tagReg_6_0 : _GEN_174; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_176 = _GEN_627 & replacement_algorithm_io_way_index[0] ? tagReg_6_1 : _GEN_175; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_177 = _GEN_655 & _GEN_460 ? tagReg_7_0 : _GEN_176; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire [24:0] _GEN_178 = _GEN_655 & replacement_algorithm_io_way_index[0] ? tagReg_7_1 : _GEN_177; // @[src/main/scala/ifu/Icache.scala 151:{45,45}]
  wire  _GEN_180 = _GEN_459 & replacement_algorithm_io_way_index[0] ? cacheValidReg_0_1 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_181 = _GEN_487 & _GEN_460 ? cacheValidReg_1_0 : _GEN_180; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_182 = _GEN_487 & replacement_algorithm_io_way_index[0] ? cacheValidReg_1_1 : _GEN_181; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_183 = _GEN_515 & _GEN_460 ? cacheValidReg_2_0 : _GEN_182; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_184 = _GEN_515 & replacement_algorithm_io_way_index[0] ? cacheValidReg_2_1 : _GEN_183; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_185 = _GEN_543 & _GEN_460 ? cacheValidReg_3_0 : _GEN_184; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_186 = _GEN_543 & replacement_algorithm_io_way_index[0] ? cacheValidReg_3_1 : _GEN_185; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_187 = _GEN_571 & _GEN_460 ? cacheValidReg_4_0 : _GEN_186; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_188 = _GEN_571 & replacement_algorithm_io_way_index[0] ? cacheValidReg_4_1 : _GEN_187; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_189 = _GEN_599 & _GEN_460 ? cacheValidReg_5_0 : _GEN_188; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_190 = _GEN_599 & replacement_algorithm_io_way_index[0] ? cacheValidReg_5_1 : _GEN_189; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_191 = _GEN_627 & _GEN_460 ? cacheValidReg_6_0 : _GEN_190; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_192 = _GEN_627 & replacement_algorithm_io_way_index[0] ? cacheValidReg_6_1 : _GEN_191; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_193 = _GEN_655 & _GEN_460 ? cacheValidReg_7_0 : _GEN_192; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _GEN_194 = _GEN_655 & replacement_algorithm_io_way_index[0] ? cacheValidReg_7_1 : _GEN_193; // @[src/main/scala/ifu/Icache.scala 151:{28,28}]
  wire  _cacheValidReg_T_4 = tagWire == _GEN_178 & _GEN_194; // @[src/main/scala/ifu/Icache.scala 151:28]
  wire  _GEN_211 = _GEN_459 & _GEN_460 ? findEndWire : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_212 = _GEN_459 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_0_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_213 = _GEN_487 & _GEN_460 ? findEndWire : cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_214 = _GEN_487 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_1_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_215 = _GEN_515 & _GEN_460 ? findEndWire : cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_216 = _GEN_515 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_2_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_217 = _GEN_543 & _GEN_460 ? findEndWire : cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_218 = _GEN_543 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_3_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_219 = _GEN_571 & _GEN_460 ? findEndWire : cacheValidReg_4_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_220 = _GEN_571 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_4_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_221 = _GEN_599 & _GEN_460 ? findEndWire : cacheValidReg_5_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_222 = _GEN_599 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_5_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_223 = _GEN_627 & _GEN_460 ? findEndWire : cacheValidReg_6_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_224 = _GEN_627 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_6_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_225 = _GEN_655 & _GEN_460 ? findEndWire : cacheValidReg_7_0; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_226 = _GEN_655 & replacement_algorithm_io_way_index[0] ? findEndWire : cacheValidReg_7_1; // @[src/main/scala/ifu/Icache.scala 152:{89,89} 28:42]
  wire  _GEN_243 = _state_T_16 ? _GEN_211 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_244 = _state_T_16 ? _GEN_212 : cacheValidReg_0_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_245 = _state_T_16 ? _GEN_213 : cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_246 = _state_T_16 ? _GEN_214 : cacheValidReg_1_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_247 = _state_T_16 ? _GEN_215 : cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_248 = _state_T_16 ? _GEN_216 : cacheValidReg_2_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_249 = _state_T_16 ? _GEN_217 : cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_250 = _state_T_16 ? _GEN_218 : cacheValidReg_3_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_251 = _state_T_16 ? _GEN_219 : cacheValidReg_4_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_252 = _state_T_16 ? _GEN_220 : cacheValidReg_4_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_253 = _state_T_16 ? _GEN_221 : cacheValidReg_5_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_254 = _state_T_16 ? _GEN_222 : cacheValidReg_5_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_255 = _state_T_16 ? _GEN_223 : cacheValidReg_6_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_256 = _state_T_16 ? _GEN_224 : cacheValidReg_6_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_257 = _state_T_16 ? _GEN_225 : cacheValidReg_7_0; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire  _GEN_258 = _state_T_16 ? _GEN_226 : cacheValidReg_7_1; // @[src/main/scala/ifu/Icache.scala 149:31 28:42]
  wire [24:0] _GEN_307 = _GEN_459 & _GEN_460 ? tagWire : tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_308 = _GEN_459 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_0_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_309 = _GEN_487 & _GEN_460 ? tagWire : tagReg_1_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_310 = _GEN_487 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_1_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_311 = _GEN_515 & _GEN_460 ? tagWire : tagReg_2_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_312 = _GEN_515 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_2_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_313 = _GEN_543 & _GEN_460 ? tagWire : tagReg_3_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_314 = _GEN_543 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_3_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_315 = _GEN_571 & _GEN_460 ? tagWire : tagReg_4_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_316 = _GEN_571 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_4_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_317 = _GEN_599 & _GEN_460 ? tagWire : tagReg_5_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_318 = _GEN_599 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_5_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_319 = _GEN_627 & _GEN_460 ? tagWire : tagReg_6_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_320 = _GEN_627 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_6_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_321 = _GEN_655 & _GEN_460 ? tagWire : tagReg_7_0; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [24:0] _GEN_322 = _GEN_655 & replacement_algorithm_io_way_index[0] ? tagWire : tagReg_7_1; // @[src/main/scala/ifu/Icache.scala 157:{58,58} 29:42]
  wire [2:0] _arlenReg_T_2 = isSdram ? _findEndWire_T_4 : 3'h0; // @[src/main/scala/ifu/Icache.scala 163:47]
  wire  _T_22 = io_icache2Mem_arvalid & io_icache2Mem_arready; // @[src/main/scala/ifu/Icache.scala 166:53]
  wire  _GEN_371 = _findEndWire_T & busrtCnt < _GEN_457 | arvalidReg; // @[src/main/scala/ifu/Icache.scala 168:122 169:44 89:42]
  wire  _GEN_373 = _T_22 ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/Icache.scala 173:78 174:44 89:42]
  wire  _GEN_380 = breadyReg ? ~io_icache2Mem_bvalid : breadyReg; // @[src/main/scala/ifu/Icache.scala 182:27 184:37 87:42]
  wire  _GEN_381 = ~breadyReg ? io_icache2Mem_bvalid : _GEN_380; // @[src/main/scala/ifu/Icache.scala 182:27 183:37]
  reg [31:0] accessTimeCounter; // @[src/main/scala/ifu/Icache.scala 194:50]
  reg [31:0] missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 195:50]
  reg  hitReg; // @[src/main/scala/ifu/Icache.scala 198:66]
  wire [31:0] _missPenaltyCounter_T_1 = missPenaltyCounter + 32'h1; // @[src/main/scala/ifu/Icache.scala 208:80]
  wire [31:0] _missPenaltyCounter_T_2 = findEndWire ? 32'h0 : _missPenaltyCounter_T_1; // @[src/main/scala/ifu/Icache.scala 208:42]
  reg  oValidReg; // @[src/main/scala/ifu/Icache.scala 225:34]
  reg [31:0] rdataReg; // @[src/main/scala/ifu/Icache.scala 226:36]
  wire  _oValidReg_T_3 = _state_T_8 ? 1'h0 : oValidReg; // @[src/main/scala/ifu/Icache.scala 246:41]
  wire  _GEN_388 = _state_T_18 ? _oValidReg_T_3 : oValidReg; // @[src/main/scala/ifu/Icache.scala 232:23 225:34 246:35]
  wire  _GEN_389 = _state_T_16 ? findEndWire : _GEN_388; // @[src/main/scala/ifu/Icache.scala 232:23 243:35]
  wire [31:0] _GEN_394 = _GEN_461 & 2'h1 == offsetWire ? cache_0_0_1 : cache_0_0_0; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_395 = _GEN_461 & 2'h2 == offsetWire ? cache_0_0_2 : _GEN_394; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_396 = _GEN_461 & 2'h3 == offsetWire ? cache_0_0_3 : _GEN_395; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_397 = _GEN_476 & 2'h0 == offsetWire ? cache_0_1_0 : _GEN_396; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_398 = _GEN_476 & 2'h1 == offsetWire ? cache_0_1_1 : _GEN_397; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_399 = _GEN_476 & 2'h2 == offsetWire ? cache_0_1_2 : _GEN_398; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_400 = _GEN_476 & 2'h3 == offsetWire ? cache_0_1_3 : _GEN_399; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_401 = _GEN_489 & 2'h0 == offsetWire ? cache_1_0_0 : _GEN_400; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_402 = _GEN_489 & 2'h1 == offsetWire ? cache_1_0_1 : _GEN_401; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_403 = _GEN_489 & 2'h2 == offsetWire ? cache_1_0_2 : _GEN_402; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_404 = _GEN_489 & 2'h3 == offsetWire ? cache_1_0_3 : _GEN_403; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_405 = _GEN_504 & 2'h0 == offsetWire ? cache_1_1_0 : _GEN_404; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_406 = _GEN_504 & 2'h1 == offsetWire ? cache_1_1_1 : _GEN_405; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_407 = _GEN_504 & 2'h2 == offsetWire ? cache_1_1_2 : _GEN_406; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_408 = _GEN_504 & 2'h3 == offsetWire ? cache_1_1_3 : _GEN_407; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_409 = _GEN_517 & 2'h0 == offsetWire ? cache_2_0_0 : _GEN_408; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_410 = _GEN_517 & 2'h1 == offsetWire ? cache_2_0_1 : _GEN_409; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_411 = _GEN_517 & 2'h2 == offsetWire ? cache_2_0_2 : _GEN_410; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_412 = _GEN_517 & 2'h3 == offsetWire ? cache_2_0_3 : _GEN_411; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_413 = _GEN_532 & 2'h0 == offsetWire ? cache_2_1_0 : _GEN_412; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_414 = _GEN_532 & 2'h1 == offsetWire ? cache_2_1_1 : _GEN_413; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_415 = _GEN_532 & 2'h2 == offsetWire ? cache_2_1_2 : _GEN_414; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_416 = _GEN_532 & 2'h3 == offsetWire ? cache_2_1_3 : _GEN_415; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_417 = _GEN_545 & 2'h0 == offsetWire ? cache_3_0_0 : _GEN_416; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_418 = _GEN_545 & 2'h1 == offsetWire ? cache_3_0_1 : _GEN_417; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_419 = _GEN_545 & 2'h2 == offsetWire ? cache_3_0_2 : _GEN_418; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_420 = _GEN_545 & 2'h3 == offsetWire ? cache_3_0_3 : _GEN_419; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_421 = _GEN_560 & 2'h0 == offsetWire ? cache_3_1_0 : _GEN_420; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_422 = _GEN_560 & 2'h1 == offsetWire ? cache_3_1_1 : _GEN_421; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_423 = _GEN_560 & 2'h2 == offsetWire ? cache_3_1_2 : _GEN_422; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_424 = _GEN_560 & 2'h3 == offsetWire ? cache_3_1_3 : _GEN_423; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_425 = _GEN_573 & 2'h0 == offsetWire ? cache_4_0_0 : _GEN_424; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_426 = _GEN_573 & 2'h1 == offsetWire ? cache_4_0_1 : _GEN_425; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_427 = _GEN_573 & 2'h2 == offsetWire ? cache_4_0_2 : _GEN_426; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_428 = _GEN_573 & 2'h3 == offsetWire ? cache_4_0_3 : _GEN_427; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_429 = _GEN_588 & 2'h0 == offsetWire ? cache_4_1_0 : _GEN_428; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_430 = _GEN_588 & 2'h1 == offsetWire ? cache_4_1_1 : _GEN_429; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_431 = _GEN_588 & 2'h2 == offsetWire ? cache_4_1_2 : _GEN_430; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_432 = _GEN_588 & 2'h3 == offsetWire ? cache_4_1_3 : _GEN_431; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_433 = _GEN_601 & 2'h0 == offsetWire ? cache_5_0_0 : _GEN_432; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_434 = _GEN_601 & 2'h1 == offsetWire ? cache_5_0_1 : _GEN_433; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_435 = _GEN_601 & 2'h2 == offsetWire ? cache_5_0_2 : _GEN_434; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_436 = _GEN_601 & 2'h3 == offsetWire ? cache_5_0_3 : _GEN_435; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_437 = _GEN_616 & 2'h0 == offsetWire ? cache_5_1_0 : _GEN_436; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_438 = _GEN_616 & 2'h1 == offsetWire ? cache_5_1_1 : _GEN_437; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_439 = _GEN_616 & 2'h2 == offsetWire ? cache_5_1_2 : _GEN_438; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_440 = _GEN_616 & 2'h3 == offsetWire ? cache_5_1_3 : _GEN_439; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_441 = _GEN_629 & 2'h0 == offsetWire ? cache_6_0_0 : _GEN_440; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_442 = _GEN_629 & 2'h1 == offsetWire ? cache_6_0_1 : _GEN_441; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_443 = _GEN_629 & 2'h2 == offsetWire ? cache_6_0_2 : _GEN_442; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_444 = _GEN_629 & 2'h3 == offsetWire ? cache_6_0_3 : _GEN_443; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_445 = _GEN_644 & 2'h0 == offsetWire ? cache_6_1_0 : _GEN_444; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_446 = _GEN_644 & 2'h1 == offsetWire ? cache_6_1_1 : _GEN_445; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_447 = _GEN_644 & 2'h2 == offsetWire ? cache_6_1_2 : _GEN_446; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_448 = _GEN_644 & 2'h3 == offsetWire ? cache_6_1_3 : _GEN_447; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_449 = _GEN_657 & 2'h0 == offsetWire ? cache_7_0_0 : _GEN_448; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_450 = _GEN_657 & 2'h1 == offsetWire ? cache_7_0_1 : _GEN_449; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_451 = _GEN_657 & 2'h2 == offsetWire ? cache_7_0_2 : _GEN_450; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_452 = _GEN_657 & 2'h3 == offsetWire ? cache_7_0_3 : _GEN_451; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_453 = _GEN_672 & 2'h0 == offsetWire ? cache_7_1_0 : _GEN_452; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_454 = _GEN_672 & 2'h1 == offsetWire ? cache_7_1_1 : _GEN_453; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_455 = _GEN_672 & 2'h2 == offsetWire ? cache_7_1_2 : _GEN_454; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  wire [31:0] _GEN_456 = _GEN_672 & 2'h3 == offsetWire ? cache_7_1_3 : _GEN_455; // @[src/main/scala/ifu/Icache.scala 252:{39,39}]
  Replacement_Algorithm_1 replacement_algorithm ( // @[src/main/scala/ifu/Icache.scala 52:49]
    .clock(replacement_algorithm_clock),
    .reset(replacement_algorithm_reset),
    .io_update_entry(replacement_algorithm_io_update_entry),
    .io_update_index(replacement_algorithm_io_update_index),
    .io_way_index(replacement_algorithm_io_way_index)
  );
  AXIAccessFault axiAccessFault ( // @[src/main/scala/ifu/Icache.scala 187:44]
    .valid(axiAccessFault_valid),
    .ready(axiAccessFault_ready),
    .resp(axiAccessFault_resp)
  );
  PerformanceCounter ATC ( // @[src/main/scala/ifu/Icache.scala 216:57]
    .valid(ATC_valid),
    .counterType(ATC_counterType),
    .data(ATC_data)
  );
  PerformanceCounter MPC ( // @[src/main/scala/ifu/Icache.scala 220:57]
    .valid(MPC_valid),
    .counterType(MPC_counterType),
    .data(MPC_data)
  );
  assign io_ifu2ICache_ready = state == 5'h1; // @[src/main/scala/ifu/Icache.scala 250:59]
  assign io_icache2IFU_valid = oValidReg & ~(io_flush | flushReg); // @[src/main/scala/ifu/Icache.scala 251:54]
  assign io_icache2IFU_bits_pc = addrReg; // @[src/main/scala/ifu/Icache.scala 254:41]
  assign io_icache2IFU_bits_inst = state != 5'h2 & findEndWire & offsetWire == 2'h3 ? rdataReg : _GEN_456; // @[src/main/scala/ifu/Icache.scala 252:39]
  assign io_icache2Mem_bready = breadyReg; // @[src/main/scala/ifu/Icache.scala 113:33]
  assign io_icache2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/Icache.scala 119:33]
  assign io_icache2Mem_araddr = isSdram ? _io_icache2Mem_araddr_T_1 : _io_icache2Mem_araddr_T_6; // @[src/main/scala/ifu/Icache.scala 120:39]
  assign io_icache2Mem_arlen = arlenReg; // @[src/main/scala/ifu/Icache.scala 122:33]
  assign io_icache2Mem_rready = rreadyReg; // @[src/main/scala/ifu/Icache.scala 126:33]
  assign replacement_algorithm_clock = clock;
  assign replacement_algorithm_reset = reset;
  assign replacement_algorithm_io_update_entry = ~hitWire & state == 5'h2; // @[src/main/scala/ifu/Icache.scala 54:61]
  assign replacement_algorithm_io_update_index = addrReg[6:4]; // @[src/main/scala/ifu/Icache.scala 34:42]
  assign axiAccessFault_valid = io_icache2Mem_bvalid; // @[src/main/scala/ifu/Icache.scala 189:41]
  assign axiAccessFault_ready = breadyReg; // @[src/main/scala/ifu/Icache.scala 188:41]
  assign axiAccessFault_resp = io_icache2Mem_bresp; // @[src/main/scala/ifu/Icache.scala 190:41]
  assign ATC_valid = hitWire & _replacement_algorithm_io_update_entry_T_1; // @[src/main/scala/ifu/Icache.scala 217:52]
  assign ATC_counterType = 32'h9; // @[src/main/scala/ifu/Icache.scala 218:41]
  assign ATC_data = accessTimeCounter; // @[src/main/scala/ifu/Icache.scala 219:41]
  assign MPC_valid = ~hitReg & findEndWire; // @[src/main/scala/ifu/Icache.scala 221:52]
  assign MPC_counterType = 32'ha; // @[src/main/scala/ifu/Icache.scala 222:41]
  assign MPC_data = missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 223:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_459 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_0_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_0_0 <= _GEN_211;
    end else begin
      cacheValidReg_0_0 <= _GEN_243;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_0_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_0_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_459 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_0_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_0_1 <= _GEN_212;
    end else begin
      cacheValidReg_0_1 <= _GEN_244;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_487 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_1_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_1_0 <= _GEN_213;
    end else begin
      cacheValidReg_1_0 <= _GEN_245;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_1_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_1_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_487 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_1_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_1_1 <= _GEN_214;
    end else begin
      cacheValidReg_1_1 <= _GEN_246;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_515 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_2_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_2_0 <= _GEN_215;
    end else begin
      cacheValidReg_2_0 <= _GEN_247;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_2_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_2_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_515 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_2_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_2_1 <= _GEN_216;
    end else begin
      cacheValidReg_2_1 <= _GEN_248;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_543 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_3_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_3_0 <= _GEN_217;
    end else begin
      cacheValidReg_3_0 <= _GEN_249;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_3_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_3_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_543 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_3_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_3_1 <= _GEN_218;
    end else begin
      cacheValidReg_3_1 <= _GEN_250;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_4_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_4_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_571 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_4_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_4_0 <= _GEN_219;
    end else begin
      cacheValidReg_4_0 <= _GEN_251;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_4_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_4_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_571 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_4_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_4_1 <= _GEN_220;
    end else begin
      cacheValidReg_4_1 <= _GEN_252;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_5_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_5_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_599 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_5_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_5_0 <= _GEN_221;
    end else begin
      cacheValidReg_5_0 <= _GEN_253;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_5_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_5_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_599 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_5_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_5_1 <= _GEN_222;
    end else begin
      cacheValidReg_5_1 <= _GEN_254;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_6_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_6_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_627 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_6_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_6_0 <= _GEN_223;
    end else begin
      cacheValidReg_6_0 <= _GEN_255;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_6_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_6_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_627 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_6_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_6_1 <= _GEN_224;
    end else begin
      cacheValidReg_6_1 <= _GEN_256;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_7_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_7_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_655 & _GEN_460) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_7_0 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_7_0 <= _GEN_225;
    end else begin
      cacheValidReg_7_0 <= _GEN_257;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 28:42]
      cacheValidReg_7_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 28:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 142:29]
      cacheValidReg_7_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 145:49]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      if (_GEN_655 & replacement_algorithm_io_way_index[0]) begin // @[src/main/scala/ifu/Icache.scala 150:81]
        cacheValidReg_7_1 <= _cacheValidReg_T_4; // @[src/main/scala/ifu/Icache.scala 150:81]
      end
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 149:31]
      cacheValidReg_7_1 <= _GEN_226;
    end else begin
      cacheValidReg_7_1 <= _GEN_258;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_0_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_0_0 <= _GEN_307;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_0_0 <= _GEN_307;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_0_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_0_1 <= _GEN_308;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_0_1 <= _GEN_308;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_1_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_1_0 <= _GEN_309;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_1_0 <= _GEN_309;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_1_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_1_1 <= _GEN_310;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_1_1 <= _GEN_310;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_2_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_2_0 <= _GEN_311;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_2_0 <= _GEN_311;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_2_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_2_1 <= _GEN_312;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_2_1 <= _GEN_312;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_3_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_3_0 <= _GEN_313;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_3_0 <= _GEN_313;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_3_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_3_1 <= _GEN_314;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_3_1 <= _GEN_314;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_4_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_4_0 <= _GEN_315;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_4_0 <= _GEN_315;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_4_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_4_1 <= _GEN_316;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_4_1 <= _GEN_316;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_5_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_5_0 <= _GEN_317;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_5_0 <= _GEN_317;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_5_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_5_1 <= _GEN_318;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_5_1 <= _GEN_318;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_6_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_6_0 <= _GEN_319;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_6_0 <= _GEN_319;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_6_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_6_1 <= _GEN_320;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_6_1 <= _GEN_320;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_7_0 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_7_0 <= _GEN_321;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_7_0 <= _GEN_321;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      tagReg_7_1 <= 25'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_7_1 <= _GEN_322;
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 156:23]
      tagReg_7_1 <= _GEN_322;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_0_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h0 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_0_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_1_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h1 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_1_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_2_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h2 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_2_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_3_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h3 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_3_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_4_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h4 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_4_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_5_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h5 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_5_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_6_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h6 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_6_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & ~replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_1_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & replacement_algorithm_io_way_index[0] & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_1_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_1_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & replacement_algorithm_io_way_index[0] & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_1_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_1_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & replacement_algorithm_io_way_index[0] & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_1_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:50]
      cache_7_1_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 30:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (3'h7 == indexWire & replacement_algorithm_io_way_index[0] & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 135:62]
        cache_7_1_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 135:62]
      end
    end
    if (io_ifu2ICache_valid & io_ifu2ICache_ready) begin // @[src/main/scala/ifu/Icache.scala 32:36]
      addrReg <= io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/Icache.scala 32:36]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 41:42]
      flushReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 41:42]
    end else if (state == 5'h10 | state == 5'h1) begin // @[src/main/scala/ifu/Icache.scala 227:55]
      flushReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 228:26]
    end else if (!(flushReg)) begin // @[src/main/scala/ifu/Icache.scala 230:32]
      flushReg <= io_flush;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 48:30]
      state <= 5'h1; // @[src/main/scala/ifu/Icache.scala 48:30]
    end else if (5'h10 == state) begin // @[src/main/scala/ifu/Icache.scala 66:38]
      if (io_icache2IFU_valid & io_icache2IFU_ready | io_flush | flushReg) begin // @[src/main/scala/ifu/Icache.scala 71:39]
        state <= 5'h1;
      end else begin
        state <= 5'h10;
      end
    end else if (5'h8 == state) begin // @[src/main/scala/ifu/Icache.scala 66:38]
      if (findEndWire) begin // @[src/main/scala/ifu/Icache.scala 70:35]
        state <= 5'h10;
      end else begin
        state <= 5'h8;
      end
    end else if (5'h4 == state) begin // @[src/main/scala/ifu/Icache.scala 66:38]
      state <= _state_T_4;
    end else begin
      state <= _state_T_13;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 59:42]
      busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 59:42]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 134:59]
      if (_findEndWire_T_5) begin // @[src/main/scala/ifu/Icache.scala 136:61]
        busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 137:34]
      end else begin
        busrtCnt <= _busrtCnt_T_1; // @[src/main/scala/ifu/Icache.scala 139:34]
      end
    end
    breadyReg <= reset | _GEN_381; // @[src/main/scala/ifu/Icache.scala 87:{42,42}]
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 89:42]
      arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 89:42]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 160:19]
      arvalidReg <= _replacement_algorithm_io_update_entry_T; // @[src/main/scala/ifu/Icache.scala 162:41]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 160:19]
      if (io_icache2Mem_arvalid & io_icache2Mem_arready) begin // @[src/main/scala/ifu/Icache.scala 166:78]
        arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 167:44]
      end else begin
        arvalidReg <= _GEN_371;
      end
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 160:19]
      arvalidReg <= _GEN_373;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 91:42]
      arlenReg <= 8'h0; // @[src/main/scala/ifu/Icache.scala 91:42]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 160:19]
      arlenReg <= {{5'd0}, _arlenReg_T_2}; // @[src/main/scala/ifu/Icache.scala 163:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 95:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 95:42]
    end else if (~rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 178:23]
      rreadyReg <= io_icache2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 179:29]
    end else if (rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 178:23]
      rreadyReg <= ~(io_icache2Mem_rvalid & io_icache2Mem_rlast); // @[src/main/scala/ifu/Icache.scala 180:29]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 194:50]
      accessTimeCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 194:50]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 200:31]
      accessTimeCounter <= 32'h2; // @[src/main/scala/ifu/Icache.scala 203:51]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 195:50]
      missPenaltyCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 195:50]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 206:31]
      missPenaltyCounter <= _missPenaltyCounter_T_2; // @[src/main/scala/ifu/Icache.scala 208:36]
    end else if (_state_T_16) begin // @[src/main/scala/ifu/Icache.scala 206:31]
      missPenaltyCounter <= _missPenaltyCounter_T_2; // @[src/main/scala/ifu/Icache.scala 211:52]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 198:66]
      hitReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 198:66]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 200:31]
      hitReg <= hitWire; // @[src/main/scala/ifu/Icache.scala 202:40]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 225:34]
      oValidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 225:34]
    end else if (_state_T_10) begin // @[src/main/scala/ifu/Icache.scala 232:23]
      oValidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 234:41]
    end else if (_state_T_12) begin // @[src/main/scala/ifu/Icache.scala 232:23]
      oValidReg <= hitWire; // @[src/main/scala/ifu/Icache.scala 237:41]
    end else if (_state_T_14) begin // @[src/main/scala/ifu/Icache.scala 232:23]
      oValidReg <= findEndWire; // @[src/main/scala/ifu/Icache.scala 240:35]
    end else begin
      oValidReg <= _GEN_389;
    end
    if (findEndWire) begin // @[src/main/scala/ifu/Icache.scala 226:36]
      rdataReg <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 226:36]
    end
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
  cacheValidReg_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cacheValidReg_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cacheValidReg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cacheValidReg_1_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cacheValidReg_2_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cacheValidReg_2_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  cacheValidReg_3_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  cacheValidReg_3_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cacheValidReg_4_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  cacheValidReg_4_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cacheValidReg_5_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cacheValidReg_5_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cacheValidReg_6_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  cacheValidReg_6_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cacheValidReg_7_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  cacheValidReg_7_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  tagReg_0_0 = _RAND_16[24:0];
  _RAND_17 = {1{`RANDOM}};
  tagReg_0_1 = _RAND_17[24:0];
  _RAND_18 = {1{`RANDOM}};
  tagReg_1_0 = _RAND_18[24:0];
  _RAND_19 = {1{`RANDOM}};
  tagReg_1_1 = _RAND_19[24:0];
  _RAND_20 = {1{`RANDOM}};
  tagReg_2_0 = _RAND_20[24:0];
  _RAND_21 = {1{`RANDOM}};
  tagReg_2_1 = _RAND_21[24:0];
  _RAND_22 = {1{`RANDOM}};
  tagReg_3_0 = _RAND_22[24:0];
  _RAND_23 = {1{`RANDOM}};
  tagReg_3_1 = _RAND_23[24:0];
  _RAND_24 = {1{`RANDOM}};
  tagReg_4_0 = _RAND_24[24:0];
  _RAND_25 = {1{`RANDOM}};
  tagReg_4_1 = _RAND_25[24:0];
  _RAND_26 = {1{`RANDOM}};
  tagReg_5_0 = _RAND_26[24:0];
  _RAND_27 = {1{`RANDOM}};
  tagReg_5_1 = _RAND_27[24:0];
  _RAND_28 = {1{`RANDOM}};
  tagReg_6_0 = _RAND_28[24:0];
  _RAND_29 = {1{`RANDOM}};
  tagReg_6_1 = _RAND_29[24:0];
  _RAND_30 = {1{`RANDOM}};
  tagReg_7_0 = _RAND_30[24:0];
  _RAND_31 = {1{`RANDOM}};
  tagReg_7_1 = _RAND_31[24:0];
  _RAND_32 = {1{`RANDOM}};
  cache_0_0_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  cache_0_0_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  cache_0_0_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  cache_0_0_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  cache_0_1_0 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  cache_0_1_1 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  cache_0_1_2 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  cache_0_1_3 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  cache_1_0_0 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  cache_1_0_1 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  cache_1_0_2 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  cache_1_0_3 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  cache_1_1_0 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  cache_1_1_1 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  cache_1_1_2 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  cache_1_1_3 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  cache_2_0_0 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  cache_2_0_1 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  cache_2_0_2 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  cache_2_0_3 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  cache_2_1_0 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  cache_2_1_1 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  cache_2_1_2 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  cache_2_1_3 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  cache_3_0_0 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  cache_3_0_1 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  cache_3_0_2 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  cache_3_0_3 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  cache_3_1_0 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  cache_3_1_1 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  cache_3_1_2 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  cache_3_1_3 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  cache_4_0_0 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  cache_4_0_1 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  cache_4_0_2 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  cache_4_0_3 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  cache_4_1_0 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  cache_4_1_1 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  cache_4_1_2 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  cache_4_1_3 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  cache_5_0_0 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  cache_5_0_1 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  cache_5_0_2 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  cache_5_0_3 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  cache_5_1_0 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  cache_5_1_1 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  cache_5_1_2 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  cache_5_1_3 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  cache_6_0_0 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  cache_6_0_1 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  cache_6_0_2 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  cache_6_0_3 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  cache_6_1_0 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  cache_6_1_1 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  cache_6_1_2 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  cache_6_1_3 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  cache_7_0_0 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  cache_7_0_1 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  cache_7_0_2 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  cache_7_0_3 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  cache_7_1_0 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  cache_7_1_1 = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  cache_7_1_2 = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  cache_7_1_3 = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  addrReg = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  flushReg = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  state = _RAND_98[4:0];
  _RAND_99 = {1{`RANDOM}};
  busrtCnt = _RAND_99[7:0];
  _RAND_100 = {1{`RANDOM}};
  breadyReg = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  arvalidReg = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  arlenReg = _RAND_102[7:0];
  _RAND_103 = {1{`RANDOM}};
  rreadyReg = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  accessTimeCounter = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  missPenaltyCounter = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  hitReg = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  oValidReg = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  rdataReg = _RAND_108[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
