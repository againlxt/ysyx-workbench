module CheckUnit(
  input         clock,
  input         reset,
  output        io_checkUnitIO_fetchReq2CheckUnit_ready, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_fetchReq2CheckUnit_valid, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_fetchReq2CheckUnit_bits, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_checkUnit2PreDecoder_ready, // @[src/main/scala/ifu/Icache.scala 315:20]
  output        io_checkUnitIO_checkUnit2PreDecoder_valid, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2PreDecoder_bits_pc, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2PreDecoder_bits_inst, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_checkUnit2Mem_arready, // @[src/main/scala/ifu/Icache.scala 315:20]
  output        io_checkUnitIO_checkUnit2Mem_arvalid, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2Mem_araddr, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [7:0]  io_checkUnitIO_checkUnit2Mem_arlen, // @[src/main/scala/ifu/Icache.scala 315:20]
  output        io_checkUnitIO_checkUnit2Mem_rready, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_checkUnit2Mem_rvalid, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_checkUnit2Mem_rdata, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_checkUnit2Mem_rlast, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3, // @[src/main/scala/ifu/Icache.scala 315:20]
  input  [25:0] io_checkUnitIO_checkUnit2Sram_tagVec_0, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_0, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_1, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_2, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_3, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [25:0] io_checkUnitIO_checkUnit2Sram_tagBuf, // @[src/main/scala/ifu/Icache.scala 315:20]
  output [1:0]  io_checkUnitIO_checkUnit2Sram_replaceIndex, // @[src/main/scala/ifu/Icache.scala 315:20]
  output        io_checkUnitIO_checkUnit2Sram_wen, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_wbu2Icache, // @[src/main/scala/ifu/Icache.scala 315:20]
  input         io_checkUnitIO_flush // @[src/main/scala/ifu/Icache.scala 315:20]
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
`endif // RANDOMIZE_REG_INIT
  wire  ATC_valid; // @[src/main/scala/ifu/Icache.scala 494:57]
  wire [31:0] ATC_counterType; // @[src/main/scala/ifu/Icache.scala 494:57]
  wire [31:0] ATC_data; // @[src/main/scala/ifu/Icache.scala 494:57]
  wire  MPC_valid; // @[src/main/scala/ifu/Icache.scala 498:57]
  wire [31:0] MPC_counterType; // @[src/main/scala/ifu/Icache.scala 498:57]
  wire [31:0] MPC_data; // @[src/main/scala/ifu/Icache.scala 498:57]
  wire  feq2CheckHandWire = io_checkUnitIO_fetchReq2CheckUnit_valid & io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 318:75]
  reg  feq2CheckHandReg; // @[src/main/scala/ifu/Icache.scala 319:42]
  wire [1:0] memIndexWire = io_checkUnitIO_fetchReq2CheckUnit_bits[5:4]; // @[src/main/scala/ifu/Icache.scala 321:81]
  wire [25:0] tagWire = io_checkUnitIO_fetchReq2CheckUnit_bits[31:6]; // @[src/main/scala/ifu/Icache.scala 322:49]
  wire [1:0] offsetWire = io_checkUnitIO_fetchReq2CheckUnit_bits[3:2]; // @[src/main/scala/ifu/Icache.scala 324:57]
  reg  cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 326:42]
  reg  cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 326:42]
  reg  cacheValidReg_2_0; // @[src/main/scala/ifu/Icache.scala 326:42]
  reg  cacheValidReg_3_0; // @[src/main/scala/ifu/Icache.scala 326:42]
  wire  _GEN_1 = 2'h1 == memIndexWire ? cacheValidReg_1_0 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 330:{96,96}]
  wire  _GEN_2 = 2'h2 == memIndexWire ? cacheValidReg_2_0 : _GEN_1; // @[src/main/scala/ifu/Icache.scala 330:{96,96}]
  wire  _GEN_3 = 2'h3 == memIndexWire ? cacheValidReg_3_0 : _GEN_2; // @[src/main/scala/ifu/Icache.scala 330:{96,96}]
  wire  hitVec_0 = _GEN_3 & io_checkUnitIO_checkUnit2Sram_tagVec_0 == tagWire; // @[src/main/scala/ifu/Icache.scala 330:96]
  reg  axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 334:42]
  reg  axiHitVecReg_1; // @[src/main/scala/ifu/Icache.scala 334:42]
  reg  axiHitVecReg_2; // @[src/main/scala/ifu/Icache.scala 334:42]
  reg  axiHitVecReg_3; // @[src/main/scala/ifu/Icache.scala 334:42]
  reg [31:0] axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 335:42]
  reg [31:0] axiDataVecReg_1; // @[src/main/scala/ifu/Icache.scala 335:42]
  reg [31:0] axiDataVecReg_2; // @[src/main/scala/ifu/Icache.scala 335:42]
  reg [31:0] axiDataVecReg_3; // @[src/main/scala/ifu/Icache.scala 335:42]
  reg [7:0] busrtCnt; // @[src/main/scala/ifu/Icache.scala 336:42]
  wire  _findEndWire_T = io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rready; // @[src/main/scala/ifu/Icache.scala 337:71]
  wire  _findEndWire_T_1 = io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rready &
    io_checkUnitIO_checkUnit2Mem_rlast; // @[src/main/scala/ifu/Icache.scala 337:109]
  wire [2:0] _findEndWire_T_4 = 3'h4 - 3'h1; // @[src/main/scala/ifu/Icache.scala 338:79]
  wire [7:0] _GEN_77 = {{5'd0}, _findEndWire_T_4}; // @[src/main/scala/ifu/Icache.scala 338:56]
  wire  _findEndWire_T_5 = busrtCnt == _GEN_77; // @[src/main/scala/ifu/Icache.scala 338:56]
  wire  findEndWire = _findEndWire_T_1 & busrtCnt == _GEN_77; // @[src/main/scala/ifu/Icache.scala 338:44]
  reg [2:0] state; // @[src/main/scala/ifu/Icache.scala 344:34]
  wire  _nextState_T_1 = ~hitVec_0 & feq2CheckHandReg; // @[src/main/scala/ifu/Icache.scala 346:43]
  wire [1:0] _nextState_T_2 = ~hitVec_0 & feq2CheckHandReg ? 2'h2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 346:31]
  wire [2:0] _nextState_T_3 = findEndWire ? 3'h4 : 3'h2; // @[src/main/scala/ifu/Icache.scala 347:31]
  wire  _nextState_T_4 = 3'h1 == state; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire [1:0] _nextState_T_5 = 3'h1 == state ? _nextState_T_2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire  _nextState_T_6 = 3'h2 == state; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire [2:0] _nextState_T_7 = 3'h2 == state ? _nextState_T_3 : {{1'd0}, _nextState_T_5}; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire  _nextState_T_8 = 3'h4 == state; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire [2:0] nextState = 3'h4 == state ? 3'h1 : _nextState_T_7; // @[src/main/scala/ifu/Icache.scala 345:52]
  wire  isSdram = io_checkUnitIO_fetchReq2CheckUnit_bits[31:28] >= 4'ha; // @[src/main/scala/ifu/Icache.scala 356:50]
  reg  arvalidReg; // @[src/main/scala/ifu/Icache.scala 372:42]
  reg [7:0] arlenReg; // @[src/main/scala/ifu/Icache.scala 374:42]
  reg  rreadyReg; // @[src/main/scala/ifu/Icache.scala 378:42]
  wire [31:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_1 = {io_checkUnitIO_fetchReq2CheckUnit_bits[31:4],4'h0}; // @[src/main/scala/ifu/Icache.scala 404:25]
  wire [9:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_4 = {busrtCnt, 2'h0}; // @[src/main/scala/ifu/Icache.scala 404:91]
  wire [31:0] _GEN_78 = {{22'd0}, _io_checkUnitIO_checkUnit2Mem_araddr_T_4}; // @[src/main/scala/ifu/Icache.scala 404:79]
  wire [31:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_6 = _io_checkUnitIO_checkUnit2Mem_araddr_T_1 + _GEN_78; // @[src/main/scala/ifu/Icache.scala 404:79]
  wire  _GEN_8 = 2'h0 == busrtCnt[1:0] | axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 334:42 422:{57,57}]
  wire  _GEN_9 = 2'h1 == busrtCnt[1:0] | axiHitVecReg_1; // @[src/main/scala/ifu/Icache.scala 334:42 422:{57,57}]
  wire  _GEN_10 = 2'h2 == busrtCnt[1:0] | axiHitVecReg_2; // @[src/main/scala/ifu/Icache.scala 334:42 422:{57,57}]
  wire  _GEN_11 = 2'h3 == busrtCnt[1:0] | axiHitVecReg_3; // @[src/main/scala/ifu/Icache.scala 334:42 422:{57,57}]
  wire [7:0] _busrtCnt_T_1 = busrtCnt + 8'h1; // @[src/main/scala/ifu/Icache.scala 426:62]
  wire [2:0] _arlenReg_T_4 = isSdram ? _findEndWire_T_4 : 3'h0; // @[src/main/scala/ifu/Icache.scala 447:82]
  wire  _T_12 = io_checkUnitIO_checkUnit2Mem_arvalid & io_checkUnitIO_checkUnit2Mem_arready; // @[src/main/scala/ifu/Icache.scala 451:76]
  wire  _GEN_51 = io_checkUnitIO_checkUnit2Mem_arvalid & io_checkUnitIO_checkUnit2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/Icache.scala 451:116 372:42 452:52]
  wire  _GEN_52 = _findEndWire_T & busrtCnt < _GEN_77 | arvalidReg; // @[src/main/scala/ifu/Icache.scala 457:160 372:42 458:52]
  wire  _GEN_53 = _T_12 ? 1'h0 : _GEN_52; // @[src/main/scala/ifu/Icache.scala 455:116 456:52]
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 469:31]
  wire  _T_22 = ~validReg; // @[src/main/scala/ifu/Icache.scala 473:34]
  wire  _validReg_T_4 = io_checkUnitIO_checkUnit2PreDecoder_valid & io_checkUnitIO_checkUnit2PreDecoder_ready ?
    feq2CheckHandWire : 1'h1; // @[src/main/scala/ifu/Icache.scala 476:48]
  reg [31:0] missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 484:50]
  wire [31:0] _missPenaltyCounter_T_1 = missPenaltyCounter + 32'h1; // @[src/main/scala/ifu/Icache.scala 490:58]
  wire  _ATC_io_valid_T = state == 3'h1; // @[src/main/scala/ifu/Icache.scala 495:51]
  wire  _GEN_66 = 2'h1 == offsetWire ? axiHitVecReg_1 : axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _GEN_67 = 2'h2 == offsetWire ? axiHitVecReg_2 : _GEN_66; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _GEN_68 = 2'h3 == offsetWire ? axiHitVecReg_3 : _GEN_67; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_4 = hitVec_0 & _ATC_io_valid_T | state != 3'h1 & _GEN_68; // @[src/main/scala/ifu/Icache.scala 505:41]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_5 = validReg & _io_checkUnitIO_checkUnit2PreDecoder_valid_T_4; // @[src/main/scala/ifu/Icache.scala 504:77]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_6 = ~io_checkUnitIO_flush; // @[src/main/scala/ifu/Icache.scala 506:10]
  wire [31:0] _GEN_70 = 2'h1 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1 :
    io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_71 = 2'h2 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2 : _GEN_70; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_72 = 2'h3 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3 : _GEN_71; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_74 = 2'h1 == offsetWire ? axiDataVecReg_1 : axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_75 = 2'h2 == offsetWire ? axiDataVecReg_2 : _GEN_74; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_76 = 2'h3 == offsetWire ? axiDataVecReg_3 : _GEN_75; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  PerformanceCounter ATC ( // @[src/main/scala/ifu/Icache.scala 494:57]
    .valid(ATC_valid),
    .counterType(ATC_counterType),
    .data(ATC_data)
  );
  PerformanceCounter MPC ( // @[src/main/scala/ifu/Icache.scala 498:57]
    .valid(MPC_valid),
    .counterType(MPC_counterType),
    .data(MPC_data)
  );
  assign io_checkUnitIO_fetchReq2CheckUnit_ready = (io_checkUnitIO_checkUnit2PreDecoder_ready | _T_22) & (nextState == 3'h1
     & _ATC_io_valid_T); // @[src/main/scala/ifu/Icache.scala 511:66]
  assign io_checkUnitIO_checkUnit2PreDecoder_valid = _io_checkUnitIO_checkUnit2PreDecoder_valid_T_5 &
    _io_checkUnitIO_checkUnit2PreDecoder_valid_T_6; // @[src/main/scala/ifu/Icache.scala 505:92]
  assign io_checkUnitIO_checkUnit2PreDecoder_bits_pc = io_checkUnitIO_fetchReq2CheckUnit_bits; // @[src/main/scala/ifu/Icache.scala 509:65]
  assign io_checkUnitIO_checkUnit2PreDecoder_bits_inst = _ATC_io_valid_T ? _GEN_72 : _GEN_76; // @[src/main/scala/ifu/Icache.scala 508:12]
  assign io_checkUnitIO_checkUnit2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/Icache.scala 402:49]
  assign io_checkUnitIO_checkUnit2Mem_araddr = isSdram ? _io_checkUnitIO_checkUnit2Mem_araddr_T_1 :
    _io_checkUnitIO_checkUnit2Mem_araddr_T_6; // @[src/main/scala/ifu/Icache.scala 404:12]
  assign io_checkUnitIO_checkUnit2Mem_arlen = arlenReg; // @[src/main/scala/ifu/Icache.scala 406:57]
  assign io_checkUnitIO_checkUnit2Mem_rready = rreadyReg; // @[src/main/scala/ifu/Icache.scala 410:49]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_0 = axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_1 = axiDataVecReg_1; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_2 = axiDataVecReg_2; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_3 = axiDataVecReg_3; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_tagBuf = io_checkUnitIO_fetchReq2CheckUnit_bits[31:6]; // @[src/main/scala/ifu/Icache.scala 322:49]
  assign io_checkUnitIO_checkUnit2Sram_replaceIndex = io_checkUnitIO_fetchReq2CheckUnit_bits[5:4]; // @[src/main/scala/ifu/Icache.scala 323:49]
  assign io_checkUnitIO_checkUnit2Sram_wen = state == 3'h4; // @[src/main/scala/ifu/Icache.scala 516:83]
  assign ATC_valid = state == 3'h1 & hitVec_0 & feq2CheckHandReg; // @[src/main/scala/ifu/Icache.scala 495:75]
  assign ATC_counterType = 32'h9; // @[src/main/scala/ifu/Icache.scala 496:41]
  assign ATC_data = 32'h1; // @[src/main/scala/ifu/Icache.scala 497:41]
  assign MPC_valid = state == 3'h2 & findEndWire; // @[src/main/scala/ifu/Icache.scala 499:63]
  assign MPC_counterType = 32'ha; // @[src/main/scala/ifu/Icache.scala 500:41]
  assign MPC_data = missPenaltyCounter; // @[src/main/scala/ifu/Icache.scala 501:41]
  always @(posedge clock) begin
    feq2CheckHandReg <= io_checkUnitIO_fetchReq2CheckUnit_valid & io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 318:75]
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 326:42]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 326:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 435:41]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 438:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 442:40]
      cacheValidReg_0_0 <= 2'h0 == memIndexWire | cacheValidReg_0_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 326:42]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 326:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 435:41]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 438:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 442:40]
      cacheValidReg_1_0 <= 2'h1 == memIndexWire | cacheValidReg_1_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 326:42]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 326:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 435:41]
      cacheValidReg_2_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 438:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 442:40]
      cacheValidReg_2_0 <= 2'h2 == memIndexWire | cacheValidReg_2_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 326:42]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 326:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 435:41]
      cacheValidReg_3_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 438:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 442:40]
      cacheValidReg_3_0 <= 2'h3 == memIndexWire | cacheValidReg_3_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 334:42]
      axiHitVecReg_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 334:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        axiHitVecReg_0 <= _GEN_8;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiHitVecReg_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 432:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 334:42]
      axiHitVecReg_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 334:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        axiHitVecReg_1 <= _GEN_9;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiHitVecReg_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 432:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 334:42]
      axiHitVecReg_2 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 334:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        axiHitVecReg_2 <= _GEN_10;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiHitVecReg_2 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 432:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 334:42]
      axiHitVecReg_3 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 334:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        axiHitVecReg_3 <= _GEN_11;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiHitVecReg_3 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 432:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 335:42]
      axiDataVecReg_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 335:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        if (2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 421:57]
          axiDataVecReg_0 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 421:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiDataVecReg_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 431:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 335:42]
      axiDataVecReg_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 335:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        if (2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 421:57]
          axiDataVecReg_1 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 421:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiDataVecReg_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 431:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 335:42]
      axiDataVecReg_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 335:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        if (2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 421:57]
          axiDataVecReg_2 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 421:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiDataVecReg_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 431:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 335:42]
      axiDataVecReg_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 335:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        if (2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 421:57]
          axiDataVecReg_3 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 421:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      axiDataVecReg_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 431:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 336:42]
      busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 336:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 418:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 420:105]
        if (_findEndWire_T_5) begin // @[src/main/scala/ifu/Icache.scala 423:77]
          busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 424:50]
        end else begin
          busrtCnt <= _busrtCnt_T_1; // @[src/main/scala/ifu/Icache.scala 426:50]
        end
      end
    end
    if (3'h4 == state) begin // @[src/main/scala/ifu/Icache.scala 345:52]
      state <= 3'h1;
    end else if (3'h2 == state) begin // @[src/main/scala/ifu/Icache.scala 345:52]
      if (findEndWire) begin // @[src/main/scala/ifu/Icache.scala 347:31]
        state <= 3'h4;
      end else begin
        state <= 3'h2;
      end
    end else begin
      state <= {{1'd0}, _nextState_T_5};
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 372:42]
      arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 372:42]
    end else if (_nextState_T_4) begin // @[src/main/scala/ifu/Icache.scala 444:23]
      arvalidReg <= _nextState_T_1; // @[src/main/scala/ifu/Icache.scala 446:41]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 444:23]
      if (isSdram) begin // @[src/main/scala/ifu/Icache.scala 450:39]
        arvalidReg <= _GEN_51;
      end else begin
        arvalidReg <= _GEN_53;
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 374:42]
      arlenReg <= 8'h0; // @[src/main/scala/ifu/Icache.scala 374:42]
    end else if (_nextState_T_4) begin // @[src/main/scala/ifu/Icache.scala 444:23]
      if (_nextState_T_1) begin // @[src/main/scala/ifu/Icache.scala 447:47]
        arlenReg <= {{5'd0}, _arlenReg_T_4};
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 378:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 378:42]
    end else if (~rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 463:27]
      rreadyReg <= io_checkUnitIO_checkUnit2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 464:29]
    end else if (rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 463:27]
      rreadyReg <= ~(io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rlast); // @[src/main/scala/ifu/Icache.scala 465:29]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 469:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 469:31]
    end else if (io_checkUnitIO_flush) begin // @[src/main/scala/ifu/Icache.scala 470:37]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 471:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 473:34]
      validReg <= feq2CheckHandWire; // @[src/main/scala/ifu/Icache.scala 474:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 473:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 476:42]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 484:50]
      missPenaltyCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 484:50]
    end else if (3'h1 == nextState) begin // @[src/main/scala/ifu/Icache.scala 485:35]
      missPenaltyCounter <= 32'h0; // @[src/main/scala/ifu/Icache.scala 487:52]
    end else if (3'h2 == nextState) begin // @[src/main/scala/ifu/Icache.scala 485:35]
      missPenaltyCounter <= _missPenaltyCounter_T_1; // @[src/main/scala/ifu/Icache.scala 490:36]
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
  feq2CheckHandReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cacheValidReg_0_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cacheValidReg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cacheValidReg_2_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cacheValidReg_3_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  axiHitVecReg_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  axiHitVecReg_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  axiHitVecReg_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  axiHitVecReg_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  axiDataVecReg_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  axiDataVecReg_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  axiDataVecReg_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  axiDataVecReg_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  busrtCnt = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  state = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  arvalidReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  arlenReg = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  rreadyReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  validReg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  missPenaltyCounter = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
