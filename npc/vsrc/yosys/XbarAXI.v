module XbarAXI(
  input         clock,
  input         reset,
  input         io_axiSlaveIFU_bready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveIFU_bvalid, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveIFU_arready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveIFU_arvalid, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiSlaveIFU_araddr, // @[src/main/scala/device/Device.scala 69:16]
  input  [7:0]  io_axiSlaveIFU_arlen, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveIFU_rready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveIFU_rvalid, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiSlaveIFU_rdata, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveIFU_rlast, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveWBU_awready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_awvalid, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiSlaveWBU_awaddr, // @[src/main/scala/device/Device.scala 69:16]
  input  [2:0]  io_axiSlaveWBU_awsize, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveWBU_wready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_wvalid, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiSlaveWBU_wdata, // @[src/main/scala/device/Device.scala 69:16]
  input  [3:0]  io_axiSlaveWBU_wstrb, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_wlast, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_bready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveWBU_bvalid, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveWBU_arready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_arvalid, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiSlaveWBU_araddr, // @[src/main/scala/device/Device.scala 69:16]
  input  [2:0]  io_axiSlaveWBU_arsize, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiSlaveWBU_rready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiSlaveWBU_rvalid, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiSlaveWBU_rdata, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_awready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_awvalid, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiMasterDevice_awaddr, // @[src/main/scala/device/Device.scala 69:16]
  output [2:0]  io_axiMasterDevice_awsize, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_wready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_wvalid, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiMasterDevice_wdata, // @[src/main/scala/device/Device.scala 69:16]
  output [3:0]  io_axiMasterDevice_wstrb, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_wlast, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_bready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_bvalid, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_arready, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_arvalid, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiMasterDevice_araddr, // @[src/main/scala/device/Device.scala 69:16]
  output [7:0]  io_axiMasterDevice_arlen, // @[src/main/scala/device/Device.scala 69:16]
  output [2:0]  io_axiMasterDevice_arsize, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiMasterDevice_rready, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_rvalid, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiMasterDevice_rdata, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiMasterDevice_rlast, // @[src/main/scala/device/Device.scala 69:16]
  output [31:0] io_axiLiteClint_arAddr, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiLiteClint_arValid, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiLiteClint_arReady, // @[src/main/scala/device/Device.scala 69:16]
  input  [31:0] io_axiLiteClint_rData, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiLiteClint_rValid, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiLiteClint_rReady, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiLiteClint_awValid, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiLiteClint_awReady, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiLiteClint_wValid, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiLiteClint_wReady, // @[src/main/scala/device/Device.scala 69:16]
  input         io_axiLiteClint_bValid, // @[src/main/scala/device/Device.scala 69:16]
  output        io_axiLiteClint_bReady // @[src/main/scala/device/Device.scala 69:16]
);
  wire  axiBusarbiter_clock; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_reset; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_bready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_arvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_araddr; // @[src/main/scala/device/Device.scala 96:33]
  wire [7:0] axiBusarbiter_io_axiSlave0_arlen; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_rready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave0_rlast; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_awvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_awaddr; // @[src/main/scala/device/Device.scala 96:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_awsize; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_wvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_wdata; // @[src/main/scala/device/Device.scala 96:33]
  wire [3:0] axiBusarbiter_io_axiSlave1_wstrb; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_wlast; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_bready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_arvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_araddr; // @[src/main/scala/device/Device.scala 96:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_arsize; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_rready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_awready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 96:33]
  wire [2:0] axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_wready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 96:33]
  wire [3:0] axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_bvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_arready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 96:33]
  wire [7:0] axiBusarbiter_io_axiMaster_arlen; // @[src/main/scala/device/Device.scala 96:33]
  wire [2:0] axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_rvalid; // @[src/main/scala/device/Device.scala 96:33]
  wire [31:0] axiBusarbiter_io_axiMaster_rdata; // @[src/main/scala/device/Device.scala 96:33]
  wire  axiBusarbiter_io_axiMaster_rlast; // @[src/main/scala/device/Device.scala 96:33]
  wire  _deviceID_T_9 = axiBusarbiter_io_axiMaster_awaddr < 32'h2010000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h2000000
    ; // @[src/main/scala/device/Device.scala 104:79]
  wire  _deviceID_T_10 = axiBusarbiter_io_axiMaster_araddr < 32'h2010000 & axiBusarbiter_io_axiMaster_araddr >= 32'h2000000
     | _deviceID_T_9; // @[src/main/scala/device/Device.scala 103:126]
  wire  _deviceID_T_20 = axiBusarbiter_io_axiMaster_awaddr < 32'h10001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10000000
    ; // @[src/main/scala/device/Device.scala 106:87]
  wire  _deviceID_T_21 = axiBusarbiter_io_axiMaster_araddr < 32'h10001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10000000
     | _deviceID_T_20; // @[src/main/scala/device/Device.scala 105:138]
  wire  _deviceID_T_31 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10001000
    ; // @[src/main/scala/device/Device.scala 108:77]
  wire  _deviceID_T_32 = axiBusarbiter_io_axiMaster_araddr < 32'h10002000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10001000
     | _deviceID_T_31; // @[src/main/scala/device/Device.scala 107:123]
  wire  _deviceID_T_42 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10002000
    ; // @[src/main/scala/device/Device.scala 110:77]
  wire  _deviceID_T_43 = axiBusarbiter_io_axiMaster_araddr < 32'h10002008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10002000
     | _deviceID_T_42; // @[src/main/scala/device/Device.scala 109:123]
  wire  _deviceID_T_53 = axiBusarbiter_io_axiMaster_awaddr < 32'h10011008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10011000
    ; // @[src/main/scala/device/Device.scala 112:75]
  wire  _deviceID_T_54 = axiBusarbiter_io_axiMaster_araddr < 32'h10011008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10011000
     | _deviceID_T_53; // @[src/main/scala/device/Device.scala 111:120]
  wire  _deviceID_T_64 = axiBusarbiter_io_axiMaster_awaddr < 32'h21200000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h21000000
    ; // @[src/main/scala/device/Device.scala 114:75]
  wire  _deviceID_T_65 = axiBusarbiter_io_axiMaster_araddr < 32'h21200000 & axiBusarbiter_io_axiMaster_araddr >= 32'h21000000
     | _deviceID_T_64; // @[src/main/scala/device/Device.scala 113:120]
  wire  _deviceID_T_75 = axiBusarbiter_io_axiMaster_awaddr < 32'hf002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'hf000000
    ; // @[src/main/scala/device/Device.scala 116:77]
  wire  _deviceID_T_76 = axiBusarbiter_io_axiMaster_araddr < 32'hf002000 & axiBusarbiter_io_axiMaster_araddr >= 32'hf000000
     | _deviceID_T_75; // @[src/main/scala/device/Device.scala 115:115]
  wire  _deviceID_T_86 = axiBusarbiter_io_axiMaster_awaddr < 32'h20001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h20000000
    ; // @[src/main/scala/device/Device.scala 118:77]
  wire  _deviceID_T_87 = axiBusarbiter_io_axiMaster_araddr < 32'h20001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h20000000
     | _deviceID_T_86; // @[src/main/scala/device/Device.scala 117:115]
  wire  _deviceID_T_90 = axiBusarbiter_io_axiMaster_araddr >= 32'h30000000 | axiBusarbiter_io_axiMaster_awaddr >= 32'h30000000
    ; // @[src/main/scala/device/Device.scala 119:53]
  wire [3:0] _deviceID_T_91 = _deviceID_T_90 ? 4'h8 : 4'h9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_92 = _deviceID_T_87 ? 4'h7 : _deviceID_T_91; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_93 = _deviceID_T_76 ? 4'h6 : _deviceID_T_92; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_94 = _deviceID_T_65 ? 4'h5 : _deviceID_T_93; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_95 = _deviceID_T_54 ? 4'h4 : _deviceID_T_94; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_96 = _deviceID_T_43 ? 4'h3 : _deviceID_T_95; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_97 = _deviceID_T_32 ? 4'h2 : _deviceID_T_96; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_98 = _deviceID_T_21 ? 4'h1 : _deviceID_T_97; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] deviceID = _deviceID_T_10 ? 4'h0 : _deviceID_T_98; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _T_3 = axiBusarbiter_io_axiMaster_awaddr == 32'ha00003f8; // @[src/main/scala/device/Device.scala 156:23]
  wire  _T_4 = axiBusarbiter_io_axiMaster_araddr == 32'ha00003f8 | _T_3; // @[src/main/scala/device/Device.scala 155:60]
  wire  _T_5 = deviceID == 4'h1 & _T_4; // @[src/main/scala/device/Device.scala 154:53]
  wire  _GEN_1 = _T_5 ? 1'h0 : io_axiMasterDevice_rlast; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 206:19 src/main/scala/device/Device.scala 187:19]
  wire [31:0] _GEN_2 = _T_5 ? 32'h0 : io_axiMasterDevice_rdata; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 205:19 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_4 = _T_5 ? 1'h0 : io_axiMasterDevice_rvalid; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 203:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_5 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 233:20 src/main/scala/device/Device.scala 187:19]
  wire [2:0] _GEN_7 = _T_5 ? 3'h2 : axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 230:20 src/main/scala/device/Device.scala 187:19]
  wire [7:0] _GEN_8 = _T_5 ? 8'h0 : axiBusarbiter_io_axiMaster_arlen; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 229:19 src/main/scala/device/Device.scala 187:19]
  wire [31:0] _GEN_10 = _T_5 ? 32'h0 : axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 227:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_11 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 226:21 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_12 = _T_5 ? 1'h0 : io_axiMasterDevice_arready; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 201:21 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_15 = _T_5 ? 1'h0 : io_axiMasterDevice_bvalid; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 197:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_16 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 224:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_17 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 222:19 src/main/scala/device/Device.scala 187:19]
  wire [3:0] _GEN_18 = _T_5 ? 4'h0 : axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 221:19 src/main/scala/device/Device.scala 187:19]
  wire [31:0] _GEN_19 = _T_5 ? 32'h0 : axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 220:19 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_20 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 219:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_21 = _T_5 ? 1'h0 : io_axiMasterDevice_wready; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 195:20 src/main/scala/device/Device.scala 187:19]
  wire [2:0] _GEN_23 = _T_5 ? 3'h2 : axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 216:20 src/main/scala/device/Device.scala 187:19]
  wire [31:0] _GEN_26 = _T_5 ? 32'h0 : axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 213:20 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_27 = _T_5 ? 1'h0 : axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 212:21 src/main/scala/device/Device.scala 187:19]
  wire  _GEN_28 = _T_5 ? 1'h0 : io_axiMasterDevice_awready; // @[src/main/scala/device/Device.scala 156:61 src/main/scala/basemode/Interface.scala 193:21 src/main/scala/device/Device.scala 187:19]
  AXIBusArbiter axiBusarbiter ( // @[src/main/scala/device/Device.scala 96:33]
    .clock(axiBusarbiter_clock),
    .reset(axiBusarbiter_reset),
    .io_axiSlave0_bready(axiBusarbiter_io_axiSlave0_bready),
    .io_axiSlave0_bvalid(axiBusarbiter_io_axiSlave0_bvalid),
    .io_axiSlave0_arready(axiBusarbiter_io_axiSlave0_arready),
    .io_axiSlave0_arvalid(axiBusarbiter_io_axiSlave0_arvalid),
    .io_axiSlave0_araddr(axiBusarbiter_io_axiSlave0_araddr),
    .io_axiSlave0_arlen(axiBusarbiter_io_axiSlave0_arlen),
    .io_axiSlave0_rready(axiBusarbiter_io_axiSlave0_rready),
    .io_axiSlave0_rvalid(axiBusarbiter_io_axiSlave0_rvalid),
    .io_axiSlave0_rdata(axiBusarbiter_io_axiSlave0_rdata),
    .io_axiSlave0_rlast(axiBusarbiter_io_axiSlave0_rlast),
    .io_axiSlave1_awready(axiBusarbiter_io_axiSlave1_awready),
    .io_axiSlave1_awvalid(axiBusarbiter_io_axiSlave1_awvalid),
    .io_axiSlave1_awaddr(axiBusarbiter_io_axiSlave1_awaddr),
    .io_axiSlave1_awsize(axiBusarbiter_io_axiSlave1_awsize),
    .io_axiSlave1_wready(axiBusarbiter_io_axiSlave1_wready),
    .io_axiSlave1_wvalid(axiBusarbiter_io_axiSlave1_wvalid),
    .io_axiSlave1_wdata(axiBusarbiter_io_axiSlave1_wdata),
    .io_axiSlave1_wstrb(axiBusarbiter_io_axiSlave1_wstrb),
    .io_axiSlave1_wlast(axiBusarbiter_io_axiSlave1_wlast),
    .io_axiSlave1_bready(axiBusarbiter_io_axiSlave1_bready),
    .io_axiSlave1_bvalid(axiBusarbiter_io_axiSlave1_bvalid),
    .io_axiSlave1_arready(axiBusarbiter_io_axiSlave1_arready),
    .io_axiSlave1_arvalid(axiBusarbiter_io_axiSlave1_arvalid),
    .io_axiSlave1_araddr(axiBusarbiter_io_axiSlave1_araddr),
    .io_axiSlave1_arsize(axiBusarbiter_io_axiSlave1_arsize),
    .io_axiSlave1_rready(axiBusarbiter_io_axiSlave1_rready),
    .io_axiSlave1_rvalid(axiBusarbiter_io_axiSlave1_rvalid),
    .io_axiSlave1_rdata(axiBusarbiter_io_axiSlave1_rdata),
    .io_axiMaster_awready(axiBusarbiter_io_axiMaster_awready),
    .io_axiMaster_awvalid(axiBusarbiter_io_axiMaster_awvalid),
    .io_axiMaster_awaddr(axiBusarbiter_io_axiMaster_awaddr),
    .io_axiMaster_awsize(axiBusarbiter_io_axiMaster_awsize),
    .io_axiMaster_wready(axiBusarbiter_io_axiMaster_wready),
    .io_axiMaster_wvalid(axiBusarbiter_io_axiMaster_wvalid),
    .io_axiMaster_wdata(axiBusarbiter_io_axiMaster_wdata),
    .io_axiMaster_wstrb(axiBusarbiter_io_axiMaster_wstrb),
    .io_axiMaster_wlast(axiBusarbiter_io_axiMaster_wlast),
    .io_axiMaster_bready(axiBusarbiter_io_axiMaster_bready),
    .io_axiMaster_bvalid(axiBusarbiter_io_axiMaster_bvalid),
    .io_axiMaster_arready(axiBusarbiter_io_axiMaster_arready),
    .io_axiMaster_arvalid(axiBusarbiter_io_axiMaster_arvalid),
    .io_axiMaster_araddr(axiBusarbiter_io_axiMaster_araddr),
    .io_axiMaster_arlen(axiBusarbiter_io_axiMaster_arlen),
    .io_axiMaster_arsize(axiBusarbiter_io_axiMaster_arsize),
    .io_axiMaster_rready(axiBusarbiter_io_axiMaster_rready),
    .io_axiMaster_rvalid(axiBusarbiter_io_axiMaster_rvalid),
    .io_axiMaster_rdata(axiBusarbiter_io_axiMaster_rdata),
    .io_axiMaster_rlast(axiBusarbiter_io_axiMaster_rlast)
  );
  assign io_axiSlaveIFU_bvalid = axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 97:21]
  assign io_axiSlaveIFU_arready = axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 97:21]
  assign io_axiSlaveIFU_rvalid = axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 97:21]
  assign io_axiSlaveIFU_rdata = axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 97:21]
  assign io_axiSlaveIFU_rlast = axiBusarbiter_io_axiSlave0_rlast; // @[src/main/scala/device/Device.scala 97:21]
  assign io_axiSlaveWBU_awready = axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiSlaveWBU_wready = axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiSlaveWBU_bvalid = axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiSlaveWBU_arready = axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiSlaveWBU_rvalid = axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiSlaveWBU_rdata = axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 98:21]
  assign io_axiMasterDevice_awvalid = deviceID == 4'h0 ? 1'h0 : _GEN_27; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 212:21]
  assign io_axiMasterDevice_awaddr = deviceID == 4'h0 ? 32'h0 : _GEN_26; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 213:20]
  assign io_axiMasterDevice_awsize = deviceID == 4'h0 ? 3'h2 : _GEN_23; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 216:20]
  assign io_axiMasterDevice_wvalid = deviceID == 4'h0 ? 1'h0 : _GEN_20; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 219:20]
  assign io_axiMasterDevice_wdata = deviceID == 4'h0 ? 32'h0 : _GEN_19; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 220:19]
  assign io_axiMasterDevice_wstrb = deviceID == 4'h0 ? 4'h0 : _GEN_18; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 221:19]
  assign io_axiMasterDevice_wlast = deviceID == 4'h0 ? 1'h0 : _GEN_17; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 222:19]
  assign io_axiMasterDevice_bready = deviceID == 4'h0 ? 1'h0 : _GEN_16; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 224:20]
  assign io_axiMasterDevice_arvalid = deviceID == 4'h0 ? 1'h0 : _GEN_11; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 226:21]
  assign io_axiMasterDevice_araddr = deviceID == 4'h0 ? 32'h0 : _GEN_10; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 227:20]
  assign io_axiMasterDevice_arlen = deviceID == 4'h0 ? 8'h0 : _GEN_8; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 229:19]
  assign io_axiMasterDevice_arsize = deviceID == 4'h0 ? 3'h2 : _GEN_7; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 230:20]
  assign io_axiMasterDevice_rready = deviceID == 4'h0 ? 1'h0 : _GEN_5; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 233:20]
  assign io_axiLiteClint_arAddr = deviceID == 4'h0 ? axiBusarbiter_io_axiMaster_araddr : 32'h0; // @[src/main/scala/device/Device.scala 131:39 148:38 78:32]
  assign io_axiLiteClint_arValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 131:39 147:38 79:33]
  assign io_axiLiteClint_rReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 131:39 153:38 80:32]
  assign io_axiLiteClint_awValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 131:39 134:38 82:33]
  assign io_axiLiteClint_wValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 131:39 138:38 85:32]
  assign io_axiLiteClint_bReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 131:39 144:38 86:32]
  assign axiBusarbiter_clock = clock;
  assign axiBusarbiter_reset = reset;
  assign axiBusarbiter_io_axiSlave0_bready = io_axiSlaveIFU_bready; // @[src/main/scala/device/Device.scala 97:21]
  assign axiBusarbiter_io_axiSlave0_arvalid = io_axiSlaveIFU_arvalid; // @[src/main/scala/device/Device.scala 97:21]
  assign axiBusarbiter_io_axiSlave0_araddr = io_axiSlaveIFU_araddr; // @[src/main/scala/device/Device.scala 97:21]
  assign axiBusarbiter_io_axiSlave0_arlen = io_axiSlaveIFU_arlen; // @[src/main/scala/device/Device.scala 97:21]
  assign axiBusarbiter_io_axiSlave0_rready = io_axiSlaveIFU_rready; // @[src/main/scala/device/Device.scala 97:21]
  assign axiBusarbiter_io_axiSlave1_awvalid = io_axiSlaveWBU_awvalid; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_awaddr = io_axiSlaveWBU_awaddr; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_awsize = io_axiSlaveWBU_awsize; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_wvalid = io_axiSlaveWBU_wvalid; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_wdata = io_axiSlaveWBU_wdata; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_wstrb = io_axiSlaveWBU_wstrb; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_wlast = io_axiSlaveWBU_wlast; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_bready = io_axiSlaveWBU_bready; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_arvalid = io_axiSlaveWBU_arvalid; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_araddr = io_axiSlaveWBU_araddr; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_arsize = io_axiSlaveWBU_arsize; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiSlave1_rready = io_axiSlaveWBU_rready; // @[src/main/scala/device/Device.scala 98:21]
  assign axiBusarbiter_io_axiMaster_awready = deviceID == 4'h0 ? io_axiLiteClint_awReady : _GEN_28; // @[src/main/scala/device/Device.scala 131:39 133:30]
  assign axiBusarbiter_io_axiMaster_wready = deviceID == 4'h0 ? io_axiLiteClint_wReady : _GEN_21; // @[src/main/scala/device/Device.scala 131:39 137:30]
  assign axiBusarbiter_io_axiMaster_bvalid = deviceID == 4'h0 ? io_axiLiteClint_bValid : _GEN_15; // @[src/main/scala/device/Device.scala 131:39 143:30]
  assign axiBusarbiter_io_axiMaster_arready = deviceID == 4'h0 ? io_axiLiteClint_arReady : _GEN_12; // @[src/main/scala/device/Device.scala 131:39 146:30]
  assign axiBusarbiter_io_axiMaster_rvalid = deviceID == 4'h0 ? io_axiLiteClint_rValid : _GEN_4; // @[src/main/scala/device/Device.scala 131:39 152:30]
  assign axiBusarbiter_io_axiMaster_rdata = deviceID == 4'h0 ? io_axiLiteClint_rData : _GEN_2; // @[src/main/scala/device/Device.scala 131:39 150:30]
  assign axiBusarbiter_io_axiMaster_rlast = deviceID == 4'h0 ? 1'h0 : _GEN_1; // @[src/main/scala/device/Device.scala 131:39 src/main/scala/basemode/Interface.scala 206:19]
endmodule
