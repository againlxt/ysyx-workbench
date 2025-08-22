module CheckUnit(
  input         clock,
  input         reset,
  output        io_checkUnitIO_fetchReq2CheckUnit_ready, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_fetchReq2CheckUnit_valid, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_fetchReq2CheckUnit_bits, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_checkUnit2PreDecoder_ready, // @[src/main/scala/ifu/Icache.scala 328:20]
  output        io_checkUnitIO_checkUnit2PreDecoder_valid, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2PreDecoder_bits_pc, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2PreDecoder_bits_inst, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_checkUnit2Mem_arready, // @[src/main/scala/ifu/Icache.scala 328:20]
  output        io_checkUnitIO_checkUnit2Mem_arvalid, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2Mem_araddr, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [7:0]  io_checkUnitIO_checkUnit2Mem_arlen, // @[src/main/scala/ifu/Icache.scala 328:20]
  output        io_checkUnitIO_checkUnit2Mem_rready, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_checkUnit2Mem_rvalid, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Mem_rdata, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_checkUnit2Mem_rlast, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [31:0] io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3, // @[src/main/scala/ifu/Icache.scala 328:20]
  input  [26:0] io_checkUnitIO_checkUnit2Sram_tagVec_0, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_0, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_1, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_2, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [31:0] io_checkUnitIO_checkUnit2Sram_cacheBuf_3, // @[src/main/scala/ifu/Icache.scala 328:20]
  output [26:0] io_checkUnitIO_checkUnit2Sram_tagBuf, // @[src/main/scala/ifu/Icache.scala 328:20]
  output        io_checkUnitIO_checkUnit2Sram_replaceIndex, // @[src/main/scala/ifu/Icache.scala 328:20]
  output        io_checkUnitIO_checkUnit2Sram_wen, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_wbu2Icache, // @[src/main/scala/ifu/Icache.scala 328:20]
  input         io_checkUnitIO_flush // @[src/main/scala/ifu/Icache.scala 328:20]
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
`endif // RANDOMIZE_REG_INIT
  wire  feq2CheckHandWire = io_checkUnitIO_fetchReq2CheckUnit_valid & io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 331:75]
  reg  feq2CheckHandReg; // @[src/main/scala/ifu/Icache.scala 332:42]
  wire  memIndexWire = io_checkUnitIO_fetchReq2CheckUnit_bits[4]; // @[src/main/scala/ifu/Icache.scala 334:81]
  wire [26:0] tagWire = io_checkUnitIO_fetchReq2CheckUnit_bits[31:5]; // @[src/main/scala/ifu/Icache.scala 335:49]
  wire [1:0] offsetWire = io_checkUnitIO_fetchReq2CheckUnit_bits[3:2]; // @[src/main/scala/ifu/Icache.scala 337:57]
  reg  cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 339:42]
  reg  cacheValidReg_1_0; // @[src/main/scala/ifu/Icache.scala 339:42]
  wire  _GEN_1 = memIndexWire ? cacheValidReg_1_0 : cacheValidReg_0_0; // @[src/main/scala/ifu/Icache.scala 343:{96,96}]
  wire  hitVec_0 = _GEN_1 & io_checkUnitIO_checkUnit2Sram_tagVec_0 == tagWire; // @[src/main/scala/ifu/Icache.scala 343:96]
  wire  hitWay = hitVec_0 ? 1'h0 : 1'h1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  reg  axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 347:42]
  reg  axiHitVecReg_1; // @[src/main/scala/ifu/Icache.scala 347:42]
  reg  axiHitVecReg_2; // @[src/main/scala/ifu/Icache.scala 347:42]
  reg  axiHitVecReg_3; // @[src/main/scala/ifu/Icache.scala 347:42]
  reg [31:0] axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 348:42]
  reg [31:0] axiDataVecReg_1; // @[src/main/scala/ifu/Icache.scala 348:42]
  reg [31:0] axiDataVecReg_2; // @[src/main/scala/ifu/Icache.scala 348:42]
  reg [31:0] axiDataVecReg_3; // @[src/main/scala/ifu/Icache.scala 348:42]
  reg [7:0] busrtCnt; // @[src/main/scala/ifu/Icache.scala 349:42]
  wire  _findEndWire_T = io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rready; // @[src/main/scala/ifu/Icache.scala 350:71]
  wire  _findEndWire_T_1 = io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rready &
    io_checkUnitIO_checkUnit2Mem_rlast; // @[src/main/scala/ifu/Icache.scala 350:109]
  wire [2:0] _findEndWire_T_4 = 3'h4 - 3'h1; // @[src/main/scala/ifu/Icache.scala 351:79]
  wire [7:0] _GEN_82 = {{5'd0}, _findEndWire_T_4}; // @[src/main/scala/ifu/Icache.scala 351:56]
  wire  _findEndWire_T_5 = busrtCnt == _GEN_82; // @[src/main/scala/ifu/Icache.scala 351:56]
  wire  findEndWire = _findEndWire_T_1 & busrtCnt == _GEN_82; // @[src/main/scala/ifu/Icache.scala 351:44]
  reg [2:0] state; // @[src/main/scala/ifu/Icache.scala 357:34]
  wire  _nextState_T_1 = ~hitVec_0 & feq2CheckHandReg; // @[src/main/scala/ifu/Icache.scala 359:43]
  wire [1:0] _nextState_T_2 = ~hitVec_0 & feq2CheckHandReg ? 2'h2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 359:31]
  wire [2:0] _nextState_T_3 = findEndWire ? 3'h4 : 3'h2; // @[src/main/scala/ifu/Icache.scala 360:31]
  wire  _nextState_T_4 = 3'h1 == state; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire [1:0] _nextState_T_5 = 3'h1 == state ? _nextState_T_2 : 2'h1; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire  _nextState_T_6 = 3'h2 == state; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire [2:0] _nextState_T_7 = 3'h2 == state ? _nextState_T_3 : {{1'd0}, _nextState_T_5}; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire  _nextState_T_8 = 3'h4 == state; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire [2:0] nextState = 3'h4 == state ? 3'h1 : _nextState_T_7; // @[src/main/scala/ifu/Icache.scala 358:52]
  wire  isSdram = io_checkUnitIO_fetchReq2CheckUnit_bits[31:28] >= 4'ha; // @[src/main/scala/ifu/Icache.scala 369:50]
  reg  arvalidReg; // @[src/main/scala/ifu/Icache.scala 385:42]
  reg [7:0] arlenReg; // @[src/main/scala/ifu/Icache.scala 387:42]
  reg  rreadyReg; // @[src/main/scala/ifu/Icache.scala 391:42]
  wire [31:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_1 = {io_checkUnitIO_fetchReq2CheckUnit_bits[31:4],4'h0}; // @[src/main/scala/ifu/Icache.scala 417:25]
  wire [9:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_4 = {busrtCnt, 2'h0}; // @[src/main/scala/ifu/Icache.scala 417:91]
  wire [31:0] _GEN_83 = {{22'd0}, _io_checkUnitIO_checkUnit2Mem_araddr_T_4}; // @[src/main/scala/ifu/Icache.scala 417:79]
  wire [31:0] _io_checkUnitIO_checkUnit2Mem_araddr_T_6 = _io_checkUnitIO_checkUnit2Mem_araddr_T_1 + _GEN_83; // @[src/main/scala/ifu/Icache.scala 417:79]
  wire  _GEN_8 = 2'h0 == busrtCnt[1:0] | axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 347:42 435:{57,57}]
  wire  _GEN_9 = 2'h1 == busrtCnt[1:0] | axiHitVecReg_1; // @[src/main/scala/ifu/Icache.scala 347:42 435:{57,57}]
  wire  _GEN_10 = 2'h2 == busrtCnt[1:0] | axiHitVecReg_2; // @[src/main/scala/ifu/Icache.scala 347:42 435:{57,57}]
  wire  _GEN_11 = 2'h3 == busrtCnt[1:0] | axiHitVecReg_3; // @[src/main/scala/ifu/Icache.scala 347:42 435:{57,57}]
  wire [7:0] _busrtCnt_T_1 = busrtCnt + 8'h1; // @[src/main/scala/ifu/Icache.scala 439:62]
  wire [2:0] _arlenReg_T_4 = isSdram ? _findEndWire_T_4 : 3'h0; // @[src/main/scala/ifu/Icache.scala 460:82]
  wire  _T_14 = io_checkUnitIO_checkUnit2Mem_arvalid & io_checkUnitIO_checkUnit2Mem_arready; // @[src/main/scala/ifu/Icache.scala 464:76]
  wire  _GEN_51 = io_checkUnitIO_checkUnit2Mem_arvalid & io_checkUnitIO_checkUnit2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/ifu/Icache.scala 464:116 385:42 465:52]
  wire  _GEN_52 = _findEndWire_T & busrtCnt < _GEN_82 | arvalidReg; // @[src/main/scala/ifu/Icache.scala 470:160 385:42 471:52]
  wire  _GEN_53 = _T_14 ? 1'h0 : _GEN_52; // @[src/main/scala/ifu/Icache.scala 468:116 469:52]
  reg  validReg; // @[src/main/scala/ifu/Icache.scala 482:31]
  reg  readyReg; // @[src/main/scala/ifu/Icache.scala 483:31]
  wire  _validReg_T_1 = io_checkUnitIO_checkUnit2PreDecoder_valid & io_checkUnitIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 491:91]
  wire  _validReg_T_4 = io_checkUnitIO_checkUnit2PreDecoder_valid & io_checkUnitIO_checkUnit2PreDecoder_ready ?
    feq2CheckHandWire : 1'h1; // @[src/main/scala/ifu/Icache.scala 491:48]
  wire  _readyReg_T_4 = feq2CheckHandWire ? _validReg_T_1 : 1'h1; // @[src/main/scala/ifu/Icache.scala 498:48]
  wire  _GEN_62 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/ifu/Icache.scala 483:31 495:34 498:42]
  wire  _GEN_63 = ~readyReg ? _validReg_T_1 : _GEN_62; // @[src/main/scala/ifu/Icache.scala 495:34 496:44]
  wire  _GEN_65 = io_checkUnitIO_flush | _GEN_63; // @[src/main/scala/ifu/Icache.scala 484:37 486:26]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T = state == 3'h1; // @[src/main/scala/ifu/Icache.scala 505:28]
  wire  _GEN_67 = 2'h1 == offsetWire ? axiHitVecReg_1 : axiHitVecReg_0; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _GEN_68 = 2'h2 == offsetWire ? axiHitVecReg_2 : _GEN_67; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _GEN_69 = 2'h3 == offsetWire ? axiHitVecReg_3 : _GEN_68; // @[src/main/scala/ifu/Icache.scala 505:{63,63}]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_4 = hitVec_0 & state == 3'h1 | state != 3'h1 & _GEN_69; // @[src/main/scala/ifu/Icache.scala 505:41]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_5 = validReg & _io_checkUnitIO_checkUnit2PreDecoder_valid_T_4; // @[src/main/scala/ifu/Icache.scala 504:77]
  wire  _io_checkUnitIO_checkUnit2PreDecoder_valid_T_6 = ~io_checkUnitIO_flush; // @[src/main/scala/ifu/Icache.scala 506:10]
  wire [31:0] _GEN_71 = ~hitWay & 2'h1 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1 :
    io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_72 = ~hitWay & 2'h2 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2 : _GEN_71; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_73 = ~hitWay & 2'h3 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3 : _GEN_72; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_74 = hitWay & 2'h0 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0 : _GEN_73; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_75 = hitWay & 2'h1 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1 : _GEN_74; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_76 = hitWay & 2'h2 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2 : _GEN_75; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_77 = hitWay & 2'h3 == offsetWire ? io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3 : _GEN_76; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_79 = 2'h1 == offsetWire ? axiDataVecReg_1 : axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_80 = 2'h2 == offsetWire ? axiDataVecReg_2 : _GEN_79; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  wire [31:0] _GEN_81 = 2'h3 == offsetWire ? axiDataVecReg_3 : _GEN_80; // @[src/main/scala/ifu/Icache.scala 508:{12,12}]
  assign io_checkUnitIO_fetchReq2CheckUnit_ready = readyReg & (nextState == 3'h1 &
    _io_checkUnitIO_checkUnit2PreDecoder_valid_T); // @[src/main/scala/ifu/Icache.scala 511:18]
  assign io_checkUnitIO_checkUnit2PreDecoder_valid = _io_checkUnitIO_checkUnit2PreDecoder_valid_T_5 &
    _io_checkUnitIO_checkUnit2PreDecoder_valid_T_6; // @[src/main/scala/ifu/Icache.scala 505:92]
  assign io_checkUnitIO_checkUnit2PreDecoder_bits_pc = io_checkUnitIO_fetchReq2CheckUnit_bits; // @[src/main/scala/ifu/Icache.scala 509:65]
  assign io_checkUnitIO_checkUnit2PreDecoder_bits_inst = _io_checkUnitIO_checkUnit2PreDecoder_valid_T ? _GEN_77 :
    _GEN_81; // @[src/main/scala/ifu/Icache.scala 508:12]
  assign io_checkUnitIO_checkUnit2Mem_arvalid = arvalidReg; // @[src/main/scala/ifu/Icache.scala 415:49]
  assign io_checkUnitIO_checkUnit2Mem_araddr = isSdram ? _io_checkUnitIO_checkUnit2Mem_araddr_T_1 :
    _io_checkUnitIO_checkUnit2Mem_araddr_T_6; // @[src/main/scala/ifu/Icache.scala 417:12]
  assign io_checkUnitIO_checkUnit2Mem_arlen = arlenReg; // @[src/main/scala/ifu/Icache.scala 419:57]
  assign io_checkUnitIO_checkUnit2Mem_rready = rreadyReg; // @[src/main/scala/ifu/Icache.scala 423:49]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_0 = axiDataVecReg_0; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_1 = axiDataVecReg_1; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_2 = axiDataVecReg_2; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_cacheBuf_3 = axiDataVecReg_3; // @[src/main/scala/ifu/Icache.scala 512:65]
  assign io_checkUnitIO_checkUnit2Sram_tagBuf = io_checkUnitIO_fetchReq2CheckUnit_bits[31:5]; // @[src/main/scala/ifu/Icache.scala 335:49]
  assign io_checkUnitIO_checkUnit2Sram_replaceIndex = io_checkUnitIO_fetchReq2CheckUnit_bits[4]; // @[src/main/scala/ifu/Icache.scala 336:49]
  assign io_checkUnitIO_checkUnit2Sram_wen = state == 3'h4; // @[src/main/scala/ifu/Icache.scala 516:83]
  always @(posedge clock) begin
    feq2CheckHandReg <= io_checkUnitIO_fetchReq2CheckUnit_valid & io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 331:75]
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 339:42]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 339:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 448:41]
      cacheValidReg_0_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 451:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 455:40]
      cacheValidReg_0_0 <= ~memIndexWire | cacheValidReg_0_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 339:42]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 339:42]
    end else if (io_checkUnitIO_wbu2Icache) begin // @[src/main/scala/ifu/Icache.scala 448:41]
      cacheValidReg_1_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 451:49]
    end else if (state == 3'h4) begin // @[src/main/scala/ifu/Icache.scala 455:40]
      cacheValidReg_1_0 <= memIndexWire | cacheValidReg_1_0;
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 347:42]
      axiHitVecReg_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 347:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        axiHitVecReg_0 <= _GEN_8;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiHitVecReg_0 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 445:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 347:42]
      axiHitVecReg_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 347:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        axiHitVecReg_1 <= _GEN_9;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiHitVecReg_1 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 445:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 347:42]
      axiHitVecReg_2 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 347:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        axiHitVecReg_2 <= _GEN_10;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiHitVecReg_2 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 445:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 347:42]
      axiHitVecReg_3 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 347:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        axiHitVecReg_3 <= _GEN_11;
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiHitVecReg_3 <= 1'h0; // @[src/main/scala/ifu/Icache.scala 445:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 348:42]
      axiDataVecReg_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 348:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        if (2'h0 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 434:57]
          axiDataVecReg_0 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 434:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiDataVecReg_0 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 444:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 348:42]
      axiDataVecReg_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 348:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        if (2'h1 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 434:57]
          axiDataVecReg_1 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 434:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiDataVecReg_1 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 444:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 348:42]
      axiDataVecReg_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 348:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        if (2'h2 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 434:57]
          axiDataVecReg_2 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 434:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiDataVecReg_2 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 444:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 348:42]
      axiDataVecReg_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 348:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        if (2'h3 == busrtCnt[1:0]) begin // @[src/main/scala/ifu/Icache.scala 434:57]
          axiDataVecReg_3 <= io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 434:57]
        end
      end
    end else if (_nextState_T_8) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      axiDataVecReg_3 <= 32'h0; // @[src/main/scala/ifu/Icache.scala 444:41]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 349:42]
      busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 349:42]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 431:23]
      if (_findEndWire_T) begin // @[src/main/scala/ifu/Icache.scala 433:105]
        if (_findEndWire_T_5) begin // @[src/main/scala/ifu/Icache.scala 436:77]
          busrtCnt <= 8'h0; // @[src/main/scala/ifu/Icache.scala 437:50]
        end else begin
          busrtCnt <= _busrtCnt_T_1; // @[src/main/scala/ifu/Icache.scala 439:50]
        end
      end
    end
    if (3'h4 == state) begin // @[src/main/scala/ifu/Icache.scala 358:52]
      state <= 3'h1;
    end else if (3'h2 == state) begin // @[src/main/scala/ifu/Icache.scala 358:52]
      if (findEndWire) begin // @[src/main/scala/ifu/Icache.scala 360:31]
        state <= 3'h4;
      end else begin
        state <= 3'h2;
      end
    end else begin
      state <= {{1'd0}, _nextState_T_5};
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 385:42]
      arvalidReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 385:42]
    end else if (_nextState_T_4) begin // @[src/main/scala/ifu/Icache.scala 457:23]
      arvalidReg <= _nextState_T_1; // @[src/main/scala/ifu/Icache.scala 459:41]
    end else if (_nextState_T_6) begin // @[src/main/scala/ifu/Icache.scala 457:23]
      if (isSdram) begin // @[src/main/scala/ifu/Icache.scala 463:39]
        arvalidReg <= _GEN_51;
      end else begin
        arvalidReg <= _GEN_53;
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 387:42]
      arlenReg <= 8'h0; // @[src/main/scala/ifu/Icache.scala 387:42]
    end else if (_nextState_T_4) begin // @[src/main/scala/ifu/Icache.scala 457:23]
      if (_nextState_T_1) begin // @[src/main/scala/ifu/Icache.scala 460:47]
        arlenReg <= {{5'd0}, _arlenReg_T_4};
      end
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 391:42]
      rreadyReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 391:42]
    end else if (~rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 476:27]
      rreadyReg <= io_checkUnitIO_checkUnit2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 477:29]
    end else if (rreadyReg) begin // @[src/main/scala/ifu/Icache.scala 476:27]
      rreadyReg <= ~(io_checkUnitIO_checkUnit2Mem_rvalid & io_checkUnitIO_checkUnit2Mem_rlast); // @[src/main/scala/ifu/Icache.scala 478:29]
    end
    if (reset) begin // @[src/main/scala/ifu/Icache.scala 482:31]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 482:31]
    end else if (io_checkUnitIO_flush) begin // @[src/main/scala/ifu/Icache.scala 484:37]
      validReg <= 1'h0; // @[src/main/scala/ifu/Icache.scala 485:26]
    end else if (~validReg) begin // @[src/main/scala/ifu/Icache.scala 488:34]
      validReg <= feq2CheckHandWire; // @[src/main/scala/ifu/Icache.scala 489:44]
    end else if (validReg) begin // @[src/main/scala/ifu/Icache.scala 488:34]
      validReg <= _validReg_T_4; // @[src/main/scala/ifu/Icache.scala 491:42]
    end
    readyReg <= reset | _GEN_65; // @[src/main/scala/ifu/Icache.scala 483:{31,31}]
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
  axiHitVecReg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  axiHitVecReg_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  axiHitVecReg_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  axiHitVecReg_3 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  axiDataVecReg_0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  axiDataVecReg_1 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  axiDataVecReg_2 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  axiDataVecReg_3 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  busrtCnt = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  state = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  arvalidReg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  arlenReg = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  rreadyReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  validReg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  readyReg = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
