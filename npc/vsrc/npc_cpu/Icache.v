module Icache(
  input         clock,
  input         reset,
  input  [31:0] io_addr, // @[src/main/scala/ifu/IFU.scala 74:16]
  input         io_enable, // @[src/main/scala/ifu/IFU.scala 74:16]
  output [31:0] io_inst, // @[src/main/scala/ifu/IFU.scala 74:16]
  output        io_oEnable, // @[src/main/scala/ifu/IFU.scala 74:16]
  output        io_icache2Mem_bready, // @[src/main/scala/ifu/IFU.scala 74:16]
  input         io_icache2Mem_bvalid, // @[src/main/scala/ifu/IFU.scala 74:16]
  input         io_icache2Mem_arready, // @[src/main/scala/ifu/IFU.scala 74:16]
  output        io_icache2Mem_arvalid, // @[src/main/scala/ifu/IFU.scala 74:16]
  output [31:0] io_icache2Mem_araddr, // @[src/main/scala/ifu/IFU.scala 74:16]
  output [7:0]  io_icache2Mem_arlen, // @[src/main/scala/ifu/IFU.scala 74:16]
  output        io_icache2Mem_rready, // @[src/main/scala/ifu/IFU.scala 74:16]
  input         io_icache2Mem_rvalid, // @[src/main/scala/ifu/IFU.scala 74:16]
  input  [31:0] io_icache2Mem_rdata, // @[src/main/scala/ifu/IFU.scala 74:16]
  input         io_icache2Mem_rlast // @[src/main/scala/ifu/IFU.scala 74:16]
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
`endif // RANDOMIZE_REG_INIT
  reg  cacheValidReg_0_0; // @[src/main/scala/ifu/IFU.scala 81:42]
  reg  cacheValidReg_1_0; // @[src/main/scala/ifu/IFU.scala 81:42]
  reg  cacheValidReg_2_0; // @[src/main/scala/ifu/IFU.scala 81:42]
  reg  cacheValidReg_3_0; // @[src/main/scala/ifu/IFU.scala 81:42]
  reg [25:0] tagReg_0_0; // @[src/main/scala/ifu/IFU.scala 82:42]
  reg [25:0] tagReg_1_0; // @[src/main/scala/ifu/IFU.scala 82:42]
  reg [25:0] tagReg_2_0; // @[src/main/scala/ifu/IFU.scala 82:42]
  reg [25:0] tagReg_3_0; // @[src/main/scala/ifu/IFU.scala 82:42]
  reg [31:0] cache_0_0_0; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_0_0_1; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_0_0_2; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_0_0_3; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_1_0_0; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_1_0_1; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_1_0_2; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_1_0_3; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_2_0_0; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_2_0_1; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_2_0_2; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_2_0_3; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_3_0_0; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_3_0_1; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_3_0_2; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] cache_3_0_3; // @[src/main/scala/ifu/IFU.scala 83:50]
  reg [31:0] addrReg; // @[src/main/scala/ifu/IFU.scala 85:34]
  wire [25:0] tagWire = addrReg[31:6]; // @[src/main/scala/ifu/IFU.scala 86:50]
  wire [1:0] indexWire = addrReg[5:4]; // @[src/main/scala/ifu/IFU.scala 87:42]
  wire [1:0] offsetWire = addrReg[3:2]; // @[src/main/scala/ifu/IFU.scala 88:50]
  wire [25:0] _GEN_1 = 2'h1 == indexWire ? tagReg_1_0 : tagReg_0_0; // @[src/main/scala/ifu/IFU.scala 91:{99,99}]
  wire [25:0] _GEN_2 = 2'h2 == indexWire ? tagReg_2_0 : _GEN_1; // @[src/main/scala/ifu/IFU.scala 91:{99,99}]
  wire [25:0] _GEN_3 = 2'h3 == indexWire ? tagReg_3_0 : _GEN_2; // @[src/main/scala/ifu/IFU.scala 91:{99,99}]
  wire  _GEN_5 = 2'h1 == indexWire ? cacheValidReg_1_0 : cacheValidReg_0_0; // @[src/main/scala/ifu/IFU.scala 91:{93,93}]
  wire  _GEN_6 = 2'h2 == indexWire ? cacheValidReg_2_0 : _GEN_5; // @[src/main/scala/ifu/IFU.scala 91:{93,93}]
  wire  _GEN_7 = 2'h3 == indexWire ? cacheValidReg_3_0 : _GEN_6; // @[src/main/scala/ifu/IFU.scala 91:{93,93}]
  wire  hitVec_0 = _GEN_7 & _GEN_3 == tagWire; // @[src/main/scala/ifu/IFU.scala 91:93]
  reg [4:0] state; // @[src/main/scala/ifu/IFU.scala 109:30]
  reg [7:0] busrtCnt; // @[src/main/scala/ifu/IFU.scala 111:42]
  wire  _findEndWire_T = io_icache2Mem_rvalid & io_icache2Mem_rready; // @[src/main/scala/ifu/IFU.scala 113:53]
  wire [2:0] _findEndWire_T_4 = 3'h4 - 3'h1; // @[src/main/scala/ifu/IFU.scala 113:133]
  wire [7:0] _GEN_430 = {{5'd0}, _findEndWire_T_4}; // @[src/main/scala/ifu/IFU.scala 113:110]
  wire  _findEndWire_T_5 = busrtCnt == _GEN_430; // @[src/main/scala/ifu/IFU.scala 113:110]
  wire  findEndWire = io_icache2Mem_rvalid & io_icache2Mem_rready & io_icache2Mem_rlast & busrtCnt == _GEN_430; // @[src/main/scala/ifu/IFU.scala 113:98]
  wire  isSdram = addrReg[31:28] >= 4'ha; // @[src/main/scala/ifu/IFU.scala 117:43]
  wire [1:0] _state_T = io_enable ? 2'h2 : 2'h1; // @[src/main/scala/ifu/IFU.scala 119:27]
  wire [3:0] _state_T_1 = isSdram ? 4'h8 : 4'h4; // @[src/main/scala/ifu/IFU.scala 120:50]
  wire [4:0] _state_T_2 = hitVec_0 ? 5'h10 : {{1'd0}, _state_T_1}; // @[src/main/scala/ifu/IFU.scala 120:27]
  wire [4:0] _state_T_3 = findEndWire ? 5'h10 : 5'h4; // @[src/main/scala/ifu/IFU.scala 121:27]
  wire [1:0] _state_T_6 = 5'h1 == state ? _state_T : 2'h1; // @[src/main/scala/ifu/IFU.scala 118:38]
  wire  _state_T_7 = 5'h2 == state; // @[src/main/scala/ifu/IFU.scala 118:38]
  wire [4:0] _state_T_8 = 5'h2 == state ? _state_T_2 : {{3'd0}, _state_T_6}; // @[src/main/scala/ifu/IFU.scala 118:38]
  wire  _state_T_9 = 5'h4 == state; // @[src/main/scala/ifu/IFU.scala 118:38]
  wire  _state_T_11 = 5'h8 == state; // @[src/main/scala/ifu/IFU.scala 118:38]
  reg  breadyReg; // @[src/main/scala/ifu/IFU.scala 139:42]
  reg  arvalidReg; // @[src/main/scala/ifu/IFU.scala 141:42]
  reg [7:0] arlenReg; // @[src/main/scala/ifu/IFU.scala 143:42]
  reg  rreadyReg; // @[src/main/scala/ifu/IFU.scala 147:42]
  wire [31:0] _io_icache2Mem_araddr_T_1 = {addrReg[31:4],4'h0}; // @[src/main/scala/ifu/IFU.scala 172:52]
  wire [9:0] _io_icache2Mem_araddr_T_4 = {busrtCnt, 2'h0}; // @[src/main/scala/ifu/IFU.scala 172:120]
  wire [31:0] _GEN_431 = {{22'd0}, _io_icache2Mem_araddr_T_4}; // @[src/main/scala/ifu/IFU.scala 172:108]
  wire [31:0] _io_icache2Mem_araddr_T_6 = _io_icache2Mem_araddr_T_1 + _GEN_431; // @[src/main/scala/ifu/IFU.scala 172:108]
  wire  _GEN_432 = 2'h0 == indexWire; // @[src/main/scala/ifu/IFU.scala 190:{62,62} 83:50]
  wire  _GEN_440 = 2'h1 == indexWire; // @[src/main/scala/ifu/IFU.scala 190:{62,62} 83:50]
  wire  _GEN_448 = 2'h2 == indexWire; // @[src/main/scala/ifu/IFU.scala 190:{62,62} 83:50]
  wire  _GEN_456 = 2'h3 == indexWire; // @[src/main/scala/ifu/IFU.scala 190:{62,62} 83:50]
  wire [7:0] _busrtCnt_T_1 = busrtCnt + 8'h1; // @[src/main/scala/ifu/IFU.scala 194:46]
  wire  _cacheValidReg_T_2 = tagWire == _GEN_3 & _GEN_7; // @[src/main/scala/ifu/IFU.scala 199:12]
  wire  _GEN_211 = 2'h0 == indexWire ? findEndWire : cacheValidReg_0_0; // @[src/main/scala/ifu/IFU.scala 200:{73,73} 81:42]
  wire  _GEN_215 = 2'h1 == indexWire ? findEndWire : cacheValidReg_1_0; // @[src/main/scala/ifu/IFU.scala 200:{73,73} 81:42]
  wire  _GEN_219 = 2'h2 == indexWire ? findEndWire : cacheValidReg_2_0; // @[src/main/scala/ifu/IFU.scala 200:{73,73} 81:42]
  wire  _GEN_223 = 2'h3 == indexWire ? findEndWire : cacheValidReg_3_0; // @[src/main/scala/ifu/IFU.scala 200:{73,73} 81:42]
  wire [25:0] _GEN_291 = 2'h0 == indexWire ? tagWire : tagReg_0_0; // @[src/main/scala/ifu/IFU.scala 204:{58,58} 82:42]
  wire [25:0] _GEN_295 = 2'h1 == indexWire ? tagWire : tagReg_1_0; // @[src/main/scala/ifu/IFU.scala 204:{58,58} 82:42]
  wire [25:0] _GEN_299 = 2'h2 == indexWire ? tagWire : tagReg_2_0; // @[src/main/scala/ifu/IFU.scala 204:{58,58} 82:42]
  wire [25:0] _GEN_303 = 2'h3 == indexWire ? tagWire : tagReg_3_0; // @[src/main/scala/ifu/IFU.scala 204:{58,58} 82:42]
  wire [2:0] _arlenReg_T_2 = isSdram ? _findEndWire_T_4 : 3'h0; // @[src/main/scala/ifu/IFU.scala 210:47]
  wire  _T_16 = io_icache2Mem_arvalid & io_icache2Mem_arready; // @[src/main/scala/ifu/IFU.scala 213:53]
  wire  _GEN_355 = _findEndWire_T & busrtCnt < _GEN_430 | arvalidReg; // @[src/main/scala/ifu/IFU.scala 215:122 141:42 216:44]
  wire  _GEN_357 = _T_16 ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/IFU.scala 141:42 220:78 221:44]
  wire  _GEN_364 = breadyReg ? ~io_icache2Mem_bvalid : breadyReg; // @[src/main/scala/ifu/IFU.scala 229:27 231:37 139:42]
  wire  _GEN_365 = ~breadyReg ? io_icache2Mem_bvalid : _GEN_364; // @[src/main/scala/ifu/IFU.scala 229:27 230:37]
  wire [31:0] _GEN_367 = _GEN_432 & 2'h1 == offsetWire ? cache_0_0_1 : cache_0_0_0; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_368 = _GEN_432 & 2'h2 == offsetWire ? cache_0_0_2 : _GEN_367; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_369 = _GEN_432 & 2'h3 == offsetWire ? cache_0_0_3 : _GEN_368; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_382 = _GEN_440 & 2'h0 == offsetWire ? cache_1_0_0 : _GEN_369; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_383 = _GEN_440 & 2'h1 == offsetWire ? cache_1_0_1 : _GEN_382; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_384 = _GEN_440 & 2'h2 == offsetWire ? cache_1_0_2 : _GEN_383; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_385 = _GEN_440 & 2'h3 == offsetWire ? cache_1_0_3 : _GEN_384; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_398 = _GEN_448 & 2'h0 == offsetWire ? cache_2_0_0 : _GEN_385; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_399 = _GEN_448 & 2'h1 == offsetWire ? cache_2_0_1 : _GEN_398; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_400 = _GEN_448 & 2'h2 == offsetWire ? cache_2_0_2 : _GEN_399; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_401 = _GEN_448 & 2'h3 == offsetWire ? cache_2_0_3 : _GEN_400; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_414 = _GEN_456 & 2'h0 == offsetWire ? cache_3_0_0 : _GEN_401; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_415 = _GEN_456 & 2'h1 == offsetWire ? cache_3_0_1 : _GEN_414; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  wire [31:0] _GEN_416 = _GEN_456 & 2'h2 == offsetWire ? cache_3_0_2 : _GEN_415; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  assign io_inst = _GEN_456 & 2'h3 == offsetWire ? cache_3_0_3 : _GEN_416; // @[src/main/scala/ifu/IFU.scala 275:{16,16}]
  assign io_oEnable = state == 5'h10; // @[src/main/scala/ifu/IFU.scala 274:26]
  assign io_icache2Mem_bready = breadyReg; // @[src/main/scala/ifu/IFU.scala 165:33]
  assign io_icache2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/IFU.scala 171:33]
  assign io_icache2Mem_araddr = isSdram ? _io_icache2Mem_araddr_T_1 : _io_icache2Mem_araddr_T_6; // @[src/main/scala/ifu/IFU.scala 172:39]
  assign io_icache2Mem_arlen = arlenReg; // @[src/main/scala/ifu/IFU.scala 174:33]
  assign io_icache2Mem_rready = rreadyReg; // @[src/main/scala/ifu/IFU.scala 178:33]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 81:42]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 81:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      if (2'h0 == indexWire) begin // @[src/main/scala/ifu/IFU.scala 198:65]
        cacheValidReg_0_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/IFU.scala 198:65]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_0_0 <= _GEN_211;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_0_0 <= _GEN_211;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 81:42]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 81:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      if (2'h1 == indexWire) begin // @[src/main/scala/ifu/IFU.scala 198:65]
        cacheValidReg_1_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/IFU.scala 198:65]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_1_0 <= _GEN_215;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_1_0 <= _GEN_215;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 81:42]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 81:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      if (2'h2 == indexWire) begin // @[src/main/scala/ifu/IFU.scala 198:65]
        cacheValidReg_2_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/IFU.scala 198:65]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_2_0 <= _GEN_219;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_2_0 <= _GEN_219;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 81:42]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/IFU.scala 81:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      if (2'h3 == indexWire) begin // @[src/main/scala/ifu/IFU.scala 198:65]
        cacheValidReg_3_0 <= _cacheValidReg_T_2; // @[src/main/scala/ifu/IFU.scala 198:65]
      end
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_3_0 <= _GEN_223;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 197:19]
      cacheValidReg_3_0 <= _GEN_223;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 82:42]
      tagReg_0_0 <= 26'h0; // @[src/main/scala/ifu/IFU.scala 82:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_0_0 <= _GEN_291;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_0_0 <= _GEN_291;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 82:42]
      tagReg_1_0 <= 26'h0; // @[src/main/scala/ifu/IFU.scala 82:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_1_0 <= _GEN_295;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_1_0 <= _GEN_295;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 82:42]
      tagReg_2_0 <= 26'h0; // @[src/main/scala/ifu/IFU.scala 82:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_2_0 <= _GEN_299;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_2_0 <= _GEN_299;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 82:42]
      tagReg_3_0 <= 26'h0; // @[src/main/scala/ifu/IFU.scala 82:42]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_3_0 <= _GEN_303;
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 203:23]
      tagReg_3_0 <= _GEN_303;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_0_0_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h0 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_0_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_0_0_1 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h0 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_0_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_0_0_2 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h0 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_0_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_0_0_3 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h0 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_0_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_1_0_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h1 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_1_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_1_0_1 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h1 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_1_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_1_0_2 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h1 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_1_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_1_0_3 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h1 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_1_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_2_0_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h2 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_2_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_2_0_1 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h2 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_2_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_2_0_2 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h2 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_2_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_2_0_3 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h2 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_2_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_3_0_0 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h3 == indexWire & 2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_3_0_0 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_3_0_1 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h3 == indexWire & 2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_3_0_1 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_3_0_2 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h3 == indexWire & 2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_3_0_2 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 83:50]
      cache_3_0_3 <= 32'h0; // @[src/main/scala/ifu/IFU.scala 83:50]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (2'h3 == indexWire & 2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/IFU.scala 190:62]
        cache_3_0_3 <= io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 190:62]
      end
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 85:34]
      addrReg <= 32'h0; // @[src/main/scala/ifu/IFU.scala 85:34]
    end else if (io_enable) begin // @[src/main/scala/ifu/IFU.scala 186:21]
      addrReg <= io_addr; // @[src/main/scala/ifu/IFU.scala 187:25]
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 109:30]
      state <= 5'h1; // @[src/main/scala/ifu/IFU.scala 109:30]
    end else if (5'h10 == state) begin // @[src/main/scala/ifu/IFU.scala 118:38]
      state <= 5'h1;
    end else if (5'h8 == state) begin // @[src/main/scala/ifu/IFU.scala 118:38]
      if (findEndWire) begin // @[src/main/scala/ifu/IFU.scala 122:35]
        state <= 5'h10;
      end else begin
        state <= 5'h8;
      end
    end else if (5'h4 == state) begin // @[src/main/scala/ifu/IFU.scala 118:38]
      state <= _state_T_3;
    end else begin
      state <= _state_T_8;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 111:42]
      busrtCnt <= 8'h0; // @[src/main/scala/ifu/IFU.scala 111:42]
    end else if (_findEndWire_T) begin // @[src/main/scala/ifu/IFU.scala 189:59]
      if (_findEndWire_T_5) begin // @[src/main/scala/ifu/IFU.scala 191:61]
        busrtCnt <= 8'h0; // @[src/main/scala/ifu/IFU.scala 192:34]
      end else begin
        busrtCnt <= _busrtCnt_T_1; // @[src/main/scala/ifu/IFU.scala 194:34]
      end
    end
    breadyReg <= reset | _GEN_365; // @[src/main/scala/ifu/IFU.scala 139:{42,42}]
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 141:42]
      arvalidReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 141:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 207:19]
      arvalidReg <= ~hitVec_0; // @[src/main/scala/ifu/IFU.scala 209:41]
    end else if (_state_T_9) begin // @[src/main/scala/ifu/IFU.scala 207:19]
      if (io_icache2Mem_arvalid & io_icache2Mem_arready) begin // @[src/main/scala/ifu/IFU.scala 213:78]
        arvalidReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 214:44]
      end else begin
        arvalidReg <= _GEN_355;
      end
    end else if (_state_T_11) begin // @[src/main/scala/ifu/IFU.scala 207:19]
      arvalidReg <= _GEN_357;
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 143:42]
      arlenReg <= 8'h0; // @[src/main/scala/ifu/IFU.scala 143:42]
    end else if (_state_T_7) begin // @[src/main/scala/ifu/IFU.scala 207:19]
      arlenReg <= {{5'd0}, _arlenReg_T_2}; // @[src/main/scala/ifu/IFU.scala 210:41]
    end
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 147:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/IFU.scala 147:42]
    end else if (~rreadyReg) begin // @[src/main/scala/ifu/IFU.scala 225:23]
      rreadyReg <= io_icache2Mem_rvalid; // @[src/main/scala/ifu/IFU.scala 226:29]
    end else if (rreadyReg) begin // @[src/main/scala/ifu/IFU.scala 225:23]
      rreadyReg <= ~(io_icache2Mem_rvalid & io_icache2Mem_rlast); // @[src/main/scala/ifu/IFU.scala 227:29]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
