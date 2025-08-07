module Icache(
  input         clock,
  input         reset,
  input  [31:0] io_addr, // @[src/main/scala/ifu/Icache.scala 21:16]
  input         io_enable, // @[src/main/scala/ifu/Icache.scala 21:16]
  output [31:0] io_inst, // @[src/main/scala/ifu/Icache.scala 21:16]
  output        io_oEnable, // @[src/main/scala/ifu/Icache.scala 21:16]
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
  input         io_wbu2Icache // @[src/main/scala/ifu/Icache.scala 21:16]
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
`endif // RANDOMIZE_REG_INIT
  wire  axiAccessFault_valid; // @[src/main/scala/ifu/Icache.scala 185:44]
  wire  axiAccessFault_ready; // @[src/main/scala/ifu/Icache.scala 185:44]
  wire [1:0] axiAccessFault_resp; // @[src/main/scala/ifu/Icache.scala 185:44]
  wire  ATC_valid; // @[src/main/scala/ifu/Icache.scala 214:57]
  wire [31:0] ATC_counterType; // @[src/main/scala/ifu/Icache.scala 214:57]
  wire [31:0] ATC_data; // @[src/main/scala/ifu/Icache.scala 214:57]
  wire  MPC_valid; // @[src/main/scala/ifu/Icache.scala 218:57]
  wire [31:0] MPC_counterType; // @[src/main/scala/ifu/Icache.scala 218:57]
  wire [31:0] MPC_data; // @[src/main/scala/ifu/Icache.scala 218:57]
  reg  cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg  cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg  cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg  cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 29:42]
  reg [25:0] tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 30:42]
  reg [25:0] tagReg_1_0; // @[src/main/scala/ifu/Icache.scala 30:42]
  reg [25:0] tagReg_2_0; // @[src/main/scala/ifu/Icache.scala 30:42]
  reg [25:0] tagReg_3_0; // @[src/main/scala/ifu/Icache.scala 30:42]
  reg [31:0] cache_0_0_0; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_0_0_1; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_0_0_2; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_0_0_3; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_1_0_0; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_1_0_1; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_1_0_2; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_1_0_3; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_2_0_0; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_2_0_1; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_2_0_2; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_2_0_3; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_3_0_0; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_3_0_1; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_3_0_2; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] cache_3_0_3; // @[src/main/scala/ifu/Icache.scala 31:50]
  reg [31:0] addrReg; // @[src/main/scala/ifu/Icache.scala 33:36]
  wire [25:0] tagWire = addrReg[31:6]; // @[src/main/scala/ifu/Icache.scala 34:50]
  wire [1:0] indexWire = addrReg[5:4]; // @[src/main/scala/ifu/Icache.scala 35:42]
  wire [1:0] offsetWire = addrReg[3:2]; // @[src/main/scala/ifu/Icache.scala 36:50]
  wire [25:0] _GEN_2 = 2'h1 == indexWire ? tagReg_1_0 : tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 39:{99,99}]
  wire [25:0] _GEN_3 = 2'h2 == indexWire ? tagReg_2_0 : _GEN_2; // @[src/main/scala/ifu/Icache.scala 39:{99,99}]
  wire [25:0] _GEN_4 = 2'h3 == indexWire ? tagReg_3_0 : _GEN_3; // @[src/main/scala/ifu/Icache.scala 39:{99,99}]
  wire  _GEN_6 = 2'h1 == indexWire ? cacheValidReg_1_0 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 39:{93,93}]
  wire  _GEN_7 = 2'h2 == indexWire ? cacheValidReg_2_0 : _GEN_6; // @[src/main/scala/ifu/Icache.scala 39:{93,93}]
  wire  _GEN_8 = 2'h3 == indexWire ? cacheValidReg_3_0 : _GEN_7; // @[src/main/scala/ifu/Icache.scala 39:{93,93}]
  wire  hitVec_0 = _GEN_8 & _GEN_4 == tagWire; // @[src/main/scala/ifu/Icache.scala 39:93]
  reg [4:0] state; // @[src/main/scala/ifu/Icache.scala 56:30]
  reg [7:0] busrtCnt; // @[src/main/scala/ifu/Icache.scala 58:42]
  wire  _findEndWire_T = io_icache2Mem_rvalid & io_icache2Mem_rready; // @[src/main/scala/ifu/Icache.scala 60:53]
  wire [2:0] _findEndWire_T_4 = 3'h4 - 3'h1; // @[src/main/scala/ifu/Icache.scala 60:133]
  wire [7:0] _GEN_455 = {{5'd0}, _findEndWire_T_4}; // @[src/main/scala/ifu/Icache.scala 60:110]
  wire  _findEndWire_T_5 = busrtCnt == _GEN_455; // @[src/main/scala/ifu/Icache.scala 60:110]
  wire  findEndWire = io_icache2Mem_rvalid & io_icache2Mem_rready & io_icache2Mem_rlast & busrtCnt == _GEN_455; // @[src/main/scala/ifu/Icache.scala 60:98]
  wire  isSdram = addrReg[31:28] >= 4'ha; // @[src/main/scala/ifu/Icache.scala 64:43]
  wire [1:0] _state_T = io_enable ? 2'h2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 66:27]
  wire [3:0] _state_T_1 = isSdram ? 4'h8 : 4'h4; // @[src/main/scala/ifu/Icache.scala 67:48]
  wire [3:0] _state_T_2 = hitVec_0 ? 4'h1 : _state_T_1; // @[src/main/scala/ifu/Icache.scala 67:27]
  wire [2:0] _state_T_3 = findEndWire ? 3'h1 : 3'h4; // @[src/main/scala/ifu/Icache.scala 68:27]
  wire [3:0] _state_T_4 = findEndWire ? 4'h1 : 4'h8; // @[src/main/scala/ifu/Icache.scala 69:35]
  wire  _state_T_5 = 5'h1 == state; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire [1:0] _state_T_6 = 5'h1 == state ? _state_T : 2'h1; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire  _state_T_7 = 5'h2 == state; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire [3:0] _state_T_8 = 5'h2 == state ? _state_T_2 : {{2'd0}, _state_T_6}; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire  _state_T_9 = 5'h4 == state; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire [3:0] _state_T_10 = 5'h4 == state ? {{1'd0}, _state_T_3} : _state_T_8; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire  _state_T_11 = 5'h8 == state; // @[src/main/scala/ifu/Icache.scala 65:38]
  wire [3:0] _state_T_12 = 5'h8 == state ? _state_T_4 : _state_T_10; // @[src/main/scala/ifu/Icache.scala 65:38]
  reg  breadyReg; // @[src/main/scala/ifu/Icache.scala 85:42]
  reg  arvalidReg; // @[src/main/scala/ifu/Icache.scala 87:42]
  reg [7:0] arlenReg; // @[src/main/scala/ifu/Icache.scala 89:42]
  reg  rreadyReg; // @[src/main/scala/ifu/Icache.scala 93:42]
  wire [31:0] _io_icache2Mem_araddr_T_1 = {addrReg[31:4],4'h0}; // @[src/main/scala/ifu/Icache.scala 118:52]
  wire [9:0] _io_icache2Mem_araddr_T_4 = {busrtCnt, 2'h0}; // @[src/main/scala/ifu/Icache.scala 118:120]
  wire [31:0] _GEN_456 = {{22'd0}, _io_icache2Mem_araddr_T_4}; // @[src/main/scala/ifu/Icache.scala 118:108]
  wire [31:0] _io_icache2Mem_araddr_T_6 = _io_icache2Mem_araddr_T_1 + _GEN_456; // @[src/main/scala/ifu/Icache.scala 118:108]
  wire  _GEN_457 = 2'h0 == indexWire; // @[src/main/scala/ifu/Icache.scala 133:{62,62} 31:50]
  wire  _GEN_465 = 2'h1 == indexWire; // @[src/main/scala/ifu/Icache.scala 133:{62,62} 31:50]
  wire  _GEN_473 = 2'h2 == indexWire; // @[src/main/scala/ifu/Icache.scala 133:{62,62} 31:50]
  wire  _GEN_481 = 2'h3 == indexWire; // @[src/main/scala/ifu/Icache.scala 133:{62,62} 31:50]
  wire [7:0] _busrtCnt_T_1 = busrtCnt + 8'h1; // @[src/main/scala/ifu/Icache.scala 137:46]
  wire  _cacheValidReg_T_2 = tagWire == _GEN_4 & _GEN_8; // @[src/main/scala/ifu/Icache.scala 149:28]
  wire  _GEN_211 = 2'h0 == indexWire ? findEndWire : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 150:{89,89} 29:42]
  wire  _GEN_215 = 2'h1 == indexWire ? findEndWire : cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 150:{89,89} 29:42]
  wire  _GEN_219 = 2'h2 == indexWire ? findEndWire : cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 150:{89,89} 29:42]
  wire  _GEN_223 = 2'h3 == indexWire ? findEndWire : cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 150:{89,89} 29:42]
  wire  _GEN_243 = _state_T_11 ? _GEN_211 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 147:31 29:42]
  wire  _GEN_247 = _state_T_11 ? _GEN_215 : cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 147:31 29:42]
  wire  _GEN_251 = _state_T_11 ? _GEN_219 : cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 147:31 29:42]
  wire  _GEN_255 = _state_T_11 ? _GEN_223 : cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 147:31 29:42]
  wire [25:0] _GEN_307 = 2'h0 == indexWire ? tagWire : tagReg_0_0; // @[src/main/scala/ifu/Icache.scala 155:{58,58} 30:42]
  wire [25:0] _GEN_311 = 2'h1 == indexWire ? tagWire : tagReg_1_0; // @[src/main/scala/ifu/Icache.scala 155:{58,58} 30:42]
  wire [25:0] _GEN_315 = 2'h2 == indexWire ? tagWire : tagReg_2_0; // @[src/main/scala/ifu/Icache.scala 155:{58,58} 30:42]
  wire [25:0] _GEN_319 = 2'h3 == indexWire ? tagWire : tagReg_3_0; // @[src/main/scala/ifu/Icache.scala 155:{58,58} 30:42]
  wire [2:0] _arlenReg_T_2 = isSdram ? _findEndWire_T_4 : 3'h0; // @[src/main/scala/ifu/Icache.scala 161:47]
  wire  _T_16 = io_icache2Mem_arvalid & io_icache2Mem_arready; // @[src/main/scala/ifu/Icache.scala 164:53]
  wire  _GEN_371 = _findEndWire_T & busrtCnt < _GEN_455 | arvalidReg; // @[src/main/scala/ifu/Icache.scala 166:122 167:44 87:42]
  wire  _GEN_373 = _T_16 ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/Icache.scala 171:78 172:44 87:42]
  wire  _GEN_380 = breadyReg ? ~io_icache2Mem_bvalid : breadyReg; // @[src/main/scala/ifu/Icache.scala 180:27 182:37 85:42]
  wire  _GEN_381 = ~breadyReg ? io_icache2Mem_bvalid : _GEN_380; // @[src/main/scala/ifu/Icache.scala 180:27 181:37]
  reg [31:0] accessTimeCounter; // @[src/main/scala/ifu/Icache.scala 192:50]
  reg [31:0] missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 193:50]
  reg  hitReg; // @[src/main/scala/ifu/Icache.scala 196:66]
  wire [31:0] _missPenaltyCounter_T_1 = missPenaltyCounter + 32'h1; // @[src/main/scala/ifu/Icache.scala 206:80]
  wire [31:0] _missPenaltyCounter_T_2 = findEndWire ? 32'h0 : _missPenaltyCounter_T_1; // @[src/main/scala/ifu/Icache.scala 206:42]
  reg  oValidReg; // @[src/main/scala/ifu/Icache.scala 223:34]
  reg [31:0] rdataReg; // @[src/main/scala/ifu/Icache.scala 224:36]
  wire  _GEN_387 = _state_T_11 ? findEndWire : oValidReg; // @[src/main/scala/ifu/Icache.scala 225:23 223:34 236:35]
  wire [31:0] _GEN_392 = _GEN_457 & 2'h1 == offsetWire ? cache_0_0_1 : cache_0_0_0; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_393 = _GEN_457 & 2'h2 == offsetWire ? cache_0_0_2 : _GEN_392; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_394 = _GEN_457 & 2'h3 == offsetWire ? cache_0_0_3 : _GEN_393; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_407 = _GEN_465 & 2'h0 == offsetWire ? cache_1_0_0 : _GEN_394; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_408 = _GEN_465 & 2'h1 == offsetWire ? cache_1_0_1 : _GEN_407; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_409 = _GEN_465 & 2'h2 == offsetWire ? cache_1_0_2 : _GEN_408; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_410 = _GEN_465 & 2'h3 == offsetWire ? cache_1_0_3 : _GEN_409; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_423 = _GEN_473 & 2'h0 == offsetWire ? cache_2_0_0 : _GEN_410; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_424 = _GEN_473 & 2'h1 == offsetWire ? cache_2_0_1 : _GEN_423; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_425 = _GEN_473 & 2'h2 == offsetWire ? cache_2_0_2 : _GEN_424; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_426 = _GEN_473 & 2'h3 == offsetWire ? cache_2_0_3 : _GEN_425; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_439 = _GEN_481 & 2'h0 == offsetWire ? cache_3_0_0 : _GEN_426; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_440 = _GEN_481 & 2'h1 == offsetWire ? cache_3_0_1 : _GEN_439; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_441 = _GEN_481 & 2'h2 == offsetWire ? cache_3_0_2 : _GEN_440; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  wire [31:0] _GEN_442 = _GEN_481 & 2'h3 == offsetWire ? cache_3_0_3 : _GEN_441; // @[src/main/scala/ifu/Icache.scala 241:{22,22}]
  AXIAccessFault axiAccessFault ( // @[src/main/scala/ifu/Icache.scala 185:44]
    .valid(axiAccessFault_valid),
    .ready(axiAccessFault_ready),
    .resp(axiAccessFault_resp)
  );
  PerformanceCounter ATC ( // @[src/main/scala/ifu/Icache.scala 214:57]
    .valid(ATC_valid),
    .counterType(ATC_counterType),
    .data(ATC_data)
  );
  PerformanceCounter MPC ( // @[src/main/scala/ifu/Icache.scala 218:57]
    .valid(MPC_valid),
    .counterType(MPC_counterType),
    .data(MPC_data)
  );
  assign io_inst = state != 5'h2 & findEndWire & offsetWire == 2'h3 ? rdataReg : _GEN_442; // @[src/main/scala/ifu/Icache.scala 241:22]
  assign io_oEnable = oValidReg; // @[src/main/scala/ifu/Icache.scala 240:16]
  assign io_icache2Mem_bready = breadyReg; // @[src/main/scala/ifu/Icache.scala 111:33]
  assign io_icache2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/Icache.scala 117:33]
  assign io_icache2Mem_araddr = isSdram ? _io_icache2Mem_araddr_T_1 : _io_icache2Mem_araddr_T_6; // @[src/main/scala/ifu/Icache.scala 118:39]
  assign io_icache2Mem_arlen = arlenReg; // @[src/main/scala/ifu/Icache.scala 120:33]
  assign io_icache2Mem_rready = rreadyReg; // @[src/main/scala/ifu/Icache.scala 124:33]
  assign axiAccessFault_valid = io_icache2Mem_bvalid; // @[src/main/scala/ifu/Icache.scala 187:41]
  assign axiAccessFault_ready = breadyReg; // @[src/main/scala/ifu/Icache.scala 186:41]
  assign axiAccessFault_resp = io_icache2Mem_bresp; // @[src/main/scala/ifu/Icache.scala 188:41]
  assign ATC_valid = hitVec_0 & state == 5'h2; // @[src/main/scala/ifu/Icache.scala 215:52]
  assign ATC_counterType = 32'h9; // @[src/main/scala/ifu/Icache.scala 216:41]
  assign ATC_data = accessTimeCounter; // @[src/main/scala/ifu/Icache.scala 217:41]
  assign MPC_valid = ~hitReg & findEndWire; // @[src/main/scala/ifu/Icache.scala 219:52]
  assign MPC_counterType = 32'ha; // @[src/main/scala/ifu/Icache.scala 220:41]
  assign MPC_data = missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 221:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 140:29]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 143:49]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      if (2'h0 == indexWire) begin // @[src/main/scala/ifu/Icache.scala 148:81]
        cacheValidReg_0_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/Icache.scala 148:81]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      cacheValidReg_0_0 <= _GEN_211;
    end else begin
      cacheValidReg_0_0 <= _GEN_243;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 140:29]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 143:49]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      if (2'h1 == indexWire) begin // @[src/main/scala/ifu/Icache.scala 148:81]
        cacheValidReg_1_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/Icache.scala 148:81]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      cacheValidReg_1_0 <= _GEN_215;
    end else begin
      cacheValidReg_1_0 <= _GEN_247;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 140:29]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 143:49]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      if (2'h2 == indexWire) begin // @[src/main/scala/ifu/Icache.scala 148:81]
        cacheValidReg_2_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/Icache.scala 148:81]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      cacheValidReg_2_0 <= _GEN_219;
    end else begin
      cacheValidReg_2_0 <= _GEN_251;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 29:42]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 29:42]
    end else if (io_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 140:29]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 143:49]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      if (2'h3 == indexWire) begin // @[src/main/scala/ifu/Icache.scala 148:81]
        cacheValidReg_3_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/Icache.scala 148:81]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 147:31]
      cacheValidReg_3_0 <= _GEN_223;
    end else begin
      cacheValidReg_3_0 <= _GEN_255;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:42]
      tagReg_0_0 <= 26'h0; // @[src/main/scala/ifu/Icache.scala 30:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_0_0 <= _GEN_307;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_0_0 <= _GEN_307;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:42]
      tagReg_1_0 <= 26'h0; // @[src/main/scala/ifu/Icache.scala 30:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_1_0 <= _GEN_311;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_1_0 <= _GEN_311;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:42]
      tagReg_2_0 <= 26'h0; // @[src/main/scala/ifu/Icache.scala 30:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_2_0 <= _GEN_315;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_2_0 <= _GEN_315;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 30:42]
      tagReg_3_0 <= 26'h0; // @[src/main/scala/ifu/Icache.scala 30:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_3_0 <= _GEN_319;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 154:23]
      tagReg_3_0 <= _GEN_319;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_0_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h0 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_0_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_0_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h0 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_0_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_0_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h0 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_0_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_0_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h0 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_0_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_1_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h1 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_1_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_1_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h1 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_1_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_1_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h1 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_1_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_1_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h1 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_1_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_2_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h2 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_2_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_2_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h2 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_2_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_2_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h2 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_2_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_2_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h2 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_2_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_3_0_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h3 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_3_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_3_0_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h3 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_3_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_3_0_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h3 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_3_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 31:50]
      cache_3_0_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 31:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (2'h3 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 133:62]
        cache_3_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 133:62]
      end
    end
    if (io_enable) begin // @[src/main/scala/ifu/Icache.scala 33:36]
      addrReg <= io_addr; // @[src/main/scala/ifu/Icache.scala 33:36]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 56:30]
      state <= 5'h1; // @[src/main/scala/ifu/Icache.scala 56:30]
    end else begin
      state <= {{1'd0}, _state_T_12}; // @[src/main/scala/ifu/Icache.scala 65:11]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 58:42]
      busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 58:42]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 132:59]
      if (_findEndWire_T_5) begin // @[src/main/scala/ifu/Icache.scala 134:61]
        busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 135:34]
      end else begin
        busrtCnt <= _busrtCnt_T_1; // @[src/main/scala/ifu/Icache.scala 137:34]
      end
    end
    breadyReg <= reset | _GEN_381; // @[src/main/scala/ifu/Icache.scala 85:{42,42}]
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 87:42]
      arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 87:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 158:19]
      arvalidReg <= ~hitVec_0; // @[src/main/scala/ifu/Icache.scala 160:41]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 158:19]
      if (io_icache2Mem_arvalid & io_icache2Mem_arready) begin // @[src/main/scala/ifu/Icache.scala 164:78]
        arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 165:44]
      end else begin
        arvalidReg <= _GEN_371;
      end
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 158:19]
      arvalidReg <= _GEN_373;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 89:42]
      arlenReg <= 8'h0; // @[src/main/scala/ifu/Icache.scala 89:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 158:19]
      arlenReg <= {{5'd0}, _arlenReg_T_2}; // @[src/main/scala/ifu/Icache.scala 161:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 93:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 93:42]
    end else if (~rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 176:23]
      rreadyReg <= io_icache2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 177:29]
    end else if (rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 176:23]
      rreadyReg <= ~(io_icache2Mem_rvalid & io_icache2Mem_rlast); // @[src/main/scala/ifu/Icache.scala 178:29]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 192:50]
      accessTimeCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 192:50]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 198:31]
      accessTimeCounter <= 32'h2; // @[src/main/scala/ifu/Icache.scala 201:51]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 193:50]
      missPenaltyCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 193:50]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 204:31]
      missPenaltyCounter <= _missPenaltyCounter_T_2; // @[src/main/scala/ifu/Icache.scala 206:36]
    end else if (_state_T_11) begin // @[src/main/scala/ifu/Icache.scala 204:31]
      missPenaltyCounter <= _missPenaltyCounter_T_2; // @[src/main/scala/ifu/Icache.scala 209:52]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 196:66]
      hitReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 196:66]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 198:31]
      hitReg <= hitVec_0; // @[src/main/scala/ifu/Icache.scala 200:40]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 223:34]
      oValidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 223:34]
    end else if (_state_T_5) begin // @[src/main/scala/ifu/Icache.scala 225:23]
      oValidReg <= oValidReg & ~io_enable; // @[src/main/scala/ifu/Icache.scala 227:41]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/Icache.scala 225:23]
      oValidReg <= hitVec_0; // @[src/main/scala/ifu/Icache.scala 230:35]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/Icache.scala 225:23]
      oValidReg <= findEndWire; // @[src/main/scala/ifu/Icache.scala 233:35]
    end else begin
      oValidReg <= _GEN_387;
    end
    if (findEndWire) begin // @[src/main/scala/ifu/Icache.scala 224:36]
      rdataReg <= io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 224:36]
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
  cacheValidReg_1_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cacheValidReg_2_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cacheValidReg_3_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  tagReg_0_0 = _RAND_4[25:0];
  _RAND_5 = {1{`RANDOM}};
  tagReg_1_0 = _RAND_5[25:0];
  _RAND_6 = {1{`RANDOM}};
  tagReg_2_0 = _RAND_6[25:0];
  _RAND_7 = {1{`RANDOM}};
  tagReg_3_0 = _RAND_7[25:0];
  _RAND_8 = {1{`RANDOM}};
  cache_0_0_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  cache_0_0_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  cache_0_0_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  cache_0_0_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  cache_1_0_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  cache_1_0_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  cache_1_0_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  cache_1_0_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  cache_2_0_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  cache_2_0_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  cache_2_0_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  cache_2_0_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  cache_3_0_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  cache_3_0_1 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  cache_3_0_2 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  cache_3_0_3 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  addrReg = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  state = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  busrtCnt = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  breadyReg = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  arvalidReg = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  arlenReg = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  rreadyReg = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  accessTimeCounter = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  missPenaltyCounter = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  hitReg = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  oValidReg = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  rdataReg = _RAND_35[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
