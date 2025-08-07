module AXILiteClint(
  input         clock,
  input         reset,
  input  [31:0] io_axiLiteMaster_arAddr, // @[src/main/scala/device/Device.scala 362:20]
  input         io_axiLiteMaster_arValid, // @[src/main/scala/device/Device.scala 362:20]
  output        io_axiLiteMaster_arReady, // @[src/main/scala/device/Device.scala 362:20]
  output [31:0] io_axiLiteMaster_rData, // @[src/main/scala/device/Device.scala 362:20]
  output        io_axiLiteMaster_rValid, // @[src/main/scala/device/Device.scala 362:20]
  input         io_axiLiteMaster_rReady, // @[src/main/scala/device/Device.scala 362:20]
  input         io_axiLiteMaster_awValid, // @[src/main/scala/device/Device.scala 362:20]
  output        io_axiLiteMaster_awReady, // @[src/main/scala/device/Device.scala 362:20]
  input         io_axiLiteMaster_wValid, // @[src/main/scala/device/Device.scala 362:20]
  output        io_axiLiteMaster_wReady, // @[src/main/scala/device/Device.scala 362:20]
  output        io_axiLiteMaster_bValid, // @[src/main/scala/device/Device.scala 362:20]
  input         io_axiLiteMaster_bReady // @[src/main/scala/device/Device.scala 362:20]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtimeReg; // @[src/main/scala/device/Device.scala 366:31]
  wire [63:0] _mtimeReg_T_1 = mtimeReg + 64'h1; // @[src/main/scala/device/Device.scala 368:38]
  wire  aresetnWire = 1'h1 - reset; // @[src/main/scala/device/Device.scala 371:36]
  reg  arReadyReg; // @[src/main/scala/device/Device.scala 384:38]
  reg [31:0] rDataReg; // @[src/main/scala/device/Device.scala 388:38]
  reg  rValidReg; // @[src/main/scala/device/Device.scala 392:38]
  reg  awReadyReg; // @[src/main/scala/device/Device.scala 398:38]
  reg  wReadyReg; // @[src/main/scala/device/Device.scala 404:38]
  reg  bValidReg; // @[src/main/scala/device/Device.scala 409:38]
  reg  awEnReg; // @[src/main/scala/device/Device.scala 413:38]
  reg [31:0] arAddrReg; // @[src/main/scala/device/Device.scala 415:38]
  wire  _T_3 = ~aresetnWire; // @[src/main/scala/device/Device.scala 419:10]
  wire  _T_7 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg; // @[src/main/scala/device/Device.scala 422:58]
  wire  _GEN_2 = io_axiLiteMaster_wValid & wReadyReg | awEnReg; // @[src/main/scala/device/Device.scala 425:42 427:21 413:38]
  wire  _GEN_4 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg ? 1'h0 : _GEN_2; // @[src/main/scala/device/Device.scala 422:70 424:21]
  wire  _GEN_5 = ~aresetnWire | _T_7; // @[src/main/scala/device/Device.scala 419:31 420:21]
  wire  _GEN_6 = ~aresetnWire | _GEN_4; // @[src/main/scala/device/Device.scala 419:31 421:21]
  wire  _T_20 = ~wReadyReg & io_axiLiteMaster_wValid & io_axiLiteMaster_awValid & awEnReg; // @[src/main/scala/device/Device.scala 439:57]
  wire  _GEN_11 = bValidReg & io_axiLiteMaster_bReady ? 1'h0 : bValidReg; // @[src/main/scala/device/Device.scala 449:42 450:21 409:38]
  wire  _GEN_12 = io_axiLiteMaster_awValid & awReadyReg & io_axiLiteMaster_wValid & wReadyReg & ~bValidReg | _GEN_11; // @[src/main/scala/device/Device.scala 447:85 448:21]
  wire  _T_32 = io_axiLiteMaster_arValid & ~arReadyReg; // @[src/main/scala/device/Device.scala 456:29]
  wire  _GEN_16 = _T_3 | _T_32; // @[src/main/scala/device/Device.scala 453:31 454:21]
  wire  _T_37 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg; // @[src/main/scala/device/Device.scala 466:43]
  wire  _GEN_18 = io_axiLiteMaster_rReady ? 1'h0 : rValidReg; // @[src/main/scala/device/Device.scala 469:29 470:21 392:38]
  wire  _GEN_19 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg | _GEN_18; // @[src/main/scala/device/Device.scala 466:58 467:21]
  wire [31:0] _GEN_23 = arAddrReg == 32'h2000004 ? mtimeReg[63:32] : 32'h0; // @[src/main/scala/device/Device.scala 478:71 479:33 481:33]
  assign io_axiLiteMaster_arReady = arReadyReg; // @[src/main/scala/device/Device.scala 385:29]
  assign io_axiLiteMaster_rData = rDataReg; // @[src/main/scala/device/Device.scala 389:29]
  assign io_axiLiteMaster_rValid = rValidReg; // @[src/main/scala/device/Device.scala 393:29]
  assign io_axiLiteMaster_awReady = awReadyReg; // @[src/main/scala/device/Device.scala 399:29]
  assign io_axiLiteMaster_wReady = wReadyReg; // @[src/main/scala/device/Device.scala 405:29]
  assign io_axiLiteMaster_bValid = bValidReg; // @[src/main/scala/device/Device.scala 410:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/device/Device.scala 366:31]
      mtimeReg <= 64'h0; // @[src/main/scala/device/Device.scala 366:31]
    end else if (clock) begin // @[src/main/scala/device/Device.scala 367:33]
      mtimeReg <= _mtimeReg_T_1; // @[src/main/scala/device/Device.scala 368:26]
    end
    arReadyReg <= reset | _GEN_16; // @[src/main/scala/device/Device.scala 384:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 388:38]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 388:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 472:31]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 473:21]
    end else if (_T_37) begin // @[src/main/scala/device/Device.scala 475:58]
      if (arAddrReg == 32'h2000000) begin // @[src/main/scala/device/Device.scala 476:58]
        rDataReg <= mtimeReg[31:0]; // @[src/main/scala/device/Device.scala 477:33]
      end else begin
        rDataReg <= _GEN_23;
      end
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 392:38]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 392:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 463:31]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 464:21]
    end else begin
      rValidReg <= _GEN_19;
    end
    awReadyReg <= reset | _GEN_5; // @[src/main/scala/device/Device.scala 398:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 404:38]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 404:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 437:31]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 438:21]
    end else begin
      wReadyReg <= _T_20;
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 409:38]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 409:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 445:31]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 446:21]
    end else begin
      bValidReg <= _GEN_12;
    end
    awEnReg <= reset | _GEN_6; // @[src/main/scala/device/Device.scala 413:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 415:38]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 415:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 453:31]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 455:21]
    end else if (io_axiLiteMaster_arValid & ~arReadyReg) begin // @[src/main/scala/device/Device.scala 456:45]
      arAddrReg <= io_axiLiteMaster_arAddr; // @[src/main/scala/device/Device.scala 458:21]
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
  _RAND_0 = {2{`RANDOM}};
  mtimeReg = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  arReadyReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rDataReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rValidReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  awReadyReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wReadyReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  bValidReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  awEnReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  arAddrReg = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
