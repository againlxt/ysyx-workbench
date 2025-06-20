module XbarAXI(
  input         clock,
  input         reset,
  input         io_axiSlaveIFU_bready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_arready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveIFU_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveIFU_araddr, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveIFU_rready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveIFU_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiSlaveIFU_rdata, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_awready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_awvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_awaddr, // @[src/main/scala/device/Device.scala 58:16]
  input  [2:0]  io_axiSlaveWBU_awsize, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_wready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_wvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_wdata, // @[src/main/scala/device/Device.scala 58:16]
  input  [3:0]  io_axiSlaveWBU_wstrb, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_wlast, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_bready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_arready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiSlaveWBU_araddr, // @[src/main/scala/device/Device.scala 58:16]
  input  [2:0]  io_axiSlaveWBU_arsize, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiSlaveWBU_rready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiSlaveWBU_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiSlaveWBU_rdata, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_awready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_awvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_awaddr, // @[src/main/scala/device/Device.scala 58:16]
  output [2:0]  io_axiMasterDevice_awsize, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_wready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_wvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_wdata, // @[src/main/scala/device/Device.scala 58:16]
  output [3:0]  io_axiMasterDevice_wstrb, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_wlast, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_bready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_bvalid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_arready, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_arvalid, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiMasterDevice_araddr, // @[src/main/scala/device/Device.scala 58:16]
  output [2:0]  io_axiMasterDevice_arsize, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiMasterDevice_rready, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiMasterDevice_rvalid, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiMasterDevice_rdata, // @[src/main/scala/device/Device.scala 58:16]
  output [31:0] io_axiLiteClint_arAddr, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_arValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_arReady, // @[src/main/scala/device/Device.scala 58:16]
  input  [31:0] io_axiLiteClint_rData, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_rValid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_rReady, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_awValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_awReady, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_wValid, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_wReady, // @[src/main/scala/device/Device.scala 58:16]
  input         io_axiLiteClint_bValid, // @[src/main/scala/device/Device.scala 58:16]
  output        io_axiLiteClint_bReady // @[src/main/scala/device/Device.scala 58:16]
);
  wire  axiBusarbiter_clock; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_reset; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_awvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_awaddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_awsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_wdata; // @[src/main/scala/device/Device.scala 83:33]
  wire [3:0] axiBusarbiter_io_axiSlave1_wstrb; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_wlast; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiSlave1_arsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_awready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 83:33]
  wire [3:0] axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_bvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_arready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 83:33]
  wire [2:0] axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 83:33]
  wire  axiBusarbiter_io_axiMaster_rvalid; // @[src/main/scala/device/Device.scala 83:33]
  wire [31:0] axiBusarbiter_io_axiMaster_rdata; // @[src/main/scala/device/Device.scala 83:33]
  wire  _deviceID_T_9 = axiBusarbiter_io_axiMaster_awaddr < 32'h2010000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h2000000
    ; // @[src/main/scala/device/Device.scala 93:79]
  wire  _deviceID_T_10 = axiBusarbiter_io_axiMaster_araddr < 32'h2010000 & axiBusarbiter_io_axiMaster_araddr >= 32'h2000000
     | _deviceID_T_9; // @[src/main/scala/device/Device.scala 92:126]
  wire  _deviceID_T_20 = axiBusarbiter_io_axiMaster_awaddr < 32'h10001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10000000
    ; // @[src/main/scala/device/Device.scala 95:87]
  wire  _deviceID_T_21 = axiBusarbiter_io_axiMaster_araddr < 32'h10001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10000000
     | _deviceID_T_20; // @[src/main/scala/device/Device.scala 94:138]
  wire  _deviceID_T_31 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10001000
    ; // @[src/main/scala/device/Device.scala 97:77]
  wire  _deviceID_T_32 = axiBusarbiter_io_axiMaster_araddr < 32'h10002000 & axiBusarbiter_io_axiMaster_araddr >= 32'h10001000
     | _deviceID_T_31; // @[src/main/scala/device/Device.scala 96:123]
  wire  _deviceID_T_42 = axiBusarbiter_io_axiMaster_awaddr < 32'h10002008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10002000
    ; // @[src/main/scala/device/Device.scala 99:77]
  wire  _deviceID_T_43 = axiBusarbiter_io_axiMaster_araddr < 32'h10002008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10002000
     | _deviceID_T_42; // @[src/main/scala/device/Device.scala 98:123]
  wire  _deviceID_T_53 = axiBusarbiter_io_axiMaster_awaddr < 32'h10011008 & axiBusarbiter_io_axiMaster_awaddr >= 32'h10011000
    ; // @[src/main/scala/device/Device.scala 101:75]
  wire  _deviceID_T_54 = axiBusarbiter_io_axiMaster_araddr < 32'h10011008 & axiBusarbiter_io_axiMaster_araddr >= 32'h10011000
     | _deviceID_T_53; // @[src/main/scala/device/Device.scala 100:120]
  wire  _deviceID_T_64 = axiBusarbiter_io_axiMaster_awaddr < 32'h21200000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h21000000
    ; // @[src/main/scala/device/Device.scala 103:75]
  wire  _deviceID_T_65 = axiBusarbiter_io_axiMaster_araddr < 32'h21200000 & axiBusarbiter_io_axiMaster_araddr >= 32'h21000000
     | _deviceID_T_64; // @[src/main/scala/device/Device.scala 102:120]
  wire  _deviceID_T_75 = axiBusarbiter_io_axiMaster_awaddr < 32'hf002000 & axiBusarbiter_io_axiMaster_awaddr >= 32'hf000000
    ; // @[src/main/scala/device/Device.scala 105:77]
  wire  _deviceID_T_76 = axiBusarbiter_io_axiMaster_araddr < 32'hf002000 & axiBusarbiter_io_axiMaster_araddr >= 32'hf000000
     | _deviceID_T_75; // @[src/main/scala/device/Device.scala 104:115]
  wire  _deviceID_T_86 = axiBusarbiter_io_axiMaster_awaddr < 32'h20001000 & axiBusarbiter_io_axiMaster_awaddr >= 32'h20000000
    ; // @[src/main/scala/device/Device.scala 107:77]
  wire  _deviceID_T_87 = axiBusarbiter_io_axiMaster_araddr < 32'h20001000 & axiBusarbiter_io_axiMaster_araddr >= 32'h20000000
     | _deviceID_T_86; // @[src/main/scala/device/Device.scala 106:115]
  wire  _deviceID_T_90 = axiBusarbiter_io_axiMaster_araddr >= 32'h30000000 | axiBusarbiter_io_axiMaster_awaddr >= 32'h30000000
    ; // @[src/main/scala/device/Device.scala 108:53]
  wire [3:0] _deviceID_T_91 = _deviceID_T_90 ? 4'h8 : 4'h9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_92 = _deviceID_T_87 ? 4'h7 : _deviceID_T_91; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_93 = _deviceID_T_76 ? 4'h6 : _deviceID_T_92; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_94 = _deviceID_T_65 ? 4'h5 : _deviceID_T_93; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_95 = _deviceID_T_54 ? 4'h4 : _deviceID_T_94; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_96 = _deviceID_T_43 ? 4'h3 : _deviceID_T_95; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_97 = _deviceID_T_32 ? 4'h2 : _deviceID_T_96; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _deviceID_T_98 = _deviceID_T_21 ? 4'h1 : _deviceID_T_97; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] deviceID = _deviceID_T_10 ? 4'h0 : _deviceID_T_98; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  AXIBusArbiter axiBusarbiter ( // @[src/main/scala/device/Device.scala 83:33]
    .clock(axiBusarbiter_clock),
    .reset(axiBusarbiter_reset),
    .io_axiSlave0_bready(axiBusarbiter_io_axiSlave0_bready),
    .io_axiSlave0_bvalid(axiBusarbiter_io_axiSlave0_bvalid),
    .io_axiSlave0_arready(axiBusarbiter_io_axiSlave0_arready),
    .io_axiSlave0_arvalid(axiBusarbiter_io_axiSlave0_arvalid),
    .io_axiSlave0_araddr(axiBusarbiter_io_axiSlave0_araddr),
    .io_axiSlave0_rready(axiBusarbiter_io_axiSlave0_rready),
    .io_axiSlave0_rvalid(axiBusarbiter_io_axiSlave0_rvalid),
    .io_axiSlave0_rdata(axiBusarbiter_io_axiSlave0_rdata),
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
    .io_axiMaster_arsize(axiBusarbiter_io_axiMaster_arsize),
    .io_axiMaster_rready(axiBusarbiter_io_axiMaster_rready),
    .io_axiMaster_rvalid(axiBusarbiter_io_axiMaster_rvalid),
    .io_axiMaster_rdata(axiBusarbiter_io_axiMaster_rdata)
  );
  assign io_axiSlaveIFU_bvalid = axiBusarbiter_io_axiSlave0_bvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_arready = axiBusarbiter_io_axiSlave0_arready; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_rvalid = axiBusarbiter_io_axiSlave0_rvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveIFU_rdata = axiBusarbiter_io_axiSlave0_rdata; // @[src/main/scala/device/Device.scala 84:21]
  assign io_axiSlaveWBU_awready = axiBusarbiter_io_axiSlave1_awready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_wready = axiBusarbiter_io_axiSlave1_wready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_bvalid = axiBusarbiter_io_axiSlave1_bvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_arready = axiBusarbiter_io_axiSlave1_arready; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_rvalid = axiBusarbiter_io_axiSlave1_rvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiSlaveWBU_rdata = axiBusarbiter_io_axiSlave1_rdata; // @[src/main/scala/device/Device.scala 85:21]
  assign io_axiMasterDevice_awvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 212:21 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_awaddr = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_awaddr; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 213:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_awsize = deviceID == 4'h0 ? 3'h2 : axiBusarbiter_io_axiMaster_awsize; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 216:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 219:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wdata = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_wdata; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 220:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wstrb = deviceID == 4'h0 ? 4'h0 : axiBusarbiter_io_axiMaster_wstrb; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 221:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_wlast = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_wlast; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 222:19 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_bready = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 224:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_arvalid = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 226:21 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_araddr = deviceID == 4'h0 ? 32'h0 : axiBusarbiter_io_axiMaster_araddr; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 227:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_arsize = deviceID == 4'h0 ? 3'h2 : axiBusarbiter_io_axiMaster_arsize; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 230:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiMasterDevice_rready = deviceID == 4'h0 ? 1'h0 : axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 120:39 src/main/scala/basemode/Interface.scala 233:20 src/main/scala/device/Device.scala 144:19]
  assign io_axiLiteClint_arAddr = deviceID == 4'h0 ? axiBusarbiter_io_axiMaster_araddr : 32'h0; // @[src/main/scala/device/Device.scala 120:39 137:38 66:32]
  assign io_axiLiteClint_arValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_arvalid; // @[src/main/scala/device/Device.scala 120:39 136:38 67:33]
  assign io_axiLiteClint_rReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_rready; // @[src/main/scala/device/Device.scala 120:39 142:38 68:32]
  assign io_axiLiteClint_awValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_awvalid; // @[src/main/scala/device/Device.scala 120:39 123:38 70:33]
  assign io_axiLiteClint_wValid = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_wvalid; // @[src/main/scala/device/Device.scala 120:39 127:38 73:32]
  assign io_axiLiteClint_bReady = deviceID == 4'h0 & axiBusarbiter_io_axiMaster_bready; // @[src/main/scala/device/Device.scala 120:39 133:38 74:32]
  assign axiBusarbiter_clock = clock;
  assign axiBusarbiter_reset = reset;
  assign axiBusarbiter_io_axiSlave0_bready = io_axiSlaveIFU_bready; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_arvalid = io_axiSlaveIFU_arvalid; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_araddr = io_axiSlaveIFU_araddr; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave0_rready = io_axiSlaveIFU_rready; // @[src/main/scala/device/Device.scala 84:21]
  assign axiBusarbiter_io_axiSlave1_awvalid = io_axiSlaveWBU_awvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_awaddr = io_axiSlaveWBU_awaddr; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_awsize = io_axiSlaveWBU_awsize; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wvalid = io_axiSlaveWBU_wvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wdata = io_axiSlaveWBU_wdata; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wstrb = io_axiSlaveWBU_wstrb; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_wlast = io_axiSlaveWBU_wlast; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_bready = io_axiSlaveWBU_bready; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_arvalid = io_axiSlaveWBU_arvalid; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_araddr = io_axiSlaveWBU_araddr; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_arsize = io_axiSlaveWBU_arsize; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiSlave1_rready = io_axiSlaveWBU_rready; // @[src/main/scala/device/Device.scala 85:21]
  assign axiBusarbiter_io_axiMaster_awready = deviceID == 4'h0 ? io_axiLiteClint_awReady : io_axiMasterDevice_awready; // @[src/main/scala/device/Device.scala 120:39 122:30 144:19]
  assign axiBusarbiter_io_axiMaster_wready = deviceID == 4'h0 ? io_axiLiteClint_wReady : io_axiMasterDevice_wready; // @[src/main/scala/device/Device.scala 120:39 126:30 144:19]
  assign axiBusarbiter_io_axiMaster_bvalid = deviceID == 4'h0 ? io_axiLiteClint_bValid : io_axiMasterDevice_bvalid; // @[src/main/scala/device/Device.scala 120:39 132:30 144:19]
  assign axiBusarbiter_io_axiMaster_arready = deviceID == 4'h0 ? io_axiLiteClint_arReady : io_axiMasterDevice_arready; // @[src/main/scala/device/Device.scala 120:39 135:30 144:19]
  assign axiBusarbiter_io_axiMaster_rvalid = deviceID == 4'h0 ? io_axiLiteClint_rValid : io_axiMasterDevice_rvalid; // @[src/main/scala/device/Device.scala 120:39 141:30 144:19]
  assign axiBusarbiter_io_axiMaster_rdata = deviceID == 4'h0 ? io_axiLiteClint_rData : io_axiMasterDevice_rdata; // @[src/main/scala/device/Device.scala 120:39 139:30 144:19]
endmodule
