module AXILiteClint(
  input         clock,
  input         reset,
  input  [31:0] io_axiLiteMaster_arAddr, // @[src/main/scala/device/Device.scala 361:20]
  input         io_axiLiteMaster_arValid, // @[src/main/scala/device/Device.scala 361:20]
  output        io_axiLiteMaster_arReady, // @[src/main/scala/device/Device.scala 361:20]
  output [31:0] io_axiLiteMaster_rData, // @[src/main/scala/device/Device.scala 361:20]
  output        io_axiLiteMaster_rValid, // @[src/main/scala/device/Device.scala 361:20]
  input         io_axiLiteMaster_rReady, // @[src/main/scala/device/Device.scala 361:20]
  input         io_axiLiteMaster_awValid, // @[src/main/scala/device/Device.scala 361:20]
  output        io_axiLiteMaster_awReady, // @[src/main/scala/device/Device.scala 361:20]
  input         io_axiLiteMaster_wValid, // @[src/main/scala/device/Device.scala 361:20]
  output        io_axiLiteMaster_wReady, // @[src/main/scala/device/Device.scala 361:20]
  output        io_axiLiteMaster_bValid, // @[src/main/scala/device/Device.scala 361:20]
  input         io_axiLiteMaster_bReady // @[src/main/scala/device/Device.scala 361:20]
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
  reg [63:0] mtimeReg; // @[src/main/scala/device/Device.scala 365:31]
  wire [63:0] _mtimeReg_T_1 = mtimeReg + 64'h1; // @[src/main/scala/device/Device.scala 367:38]
  wire  aresetnWire = 1'h1 - reset; // @[src/main/scala/device/Device.scala 370:36]
  reg  arReadyReg; // @[src/main/scala/device/Device.scala 383:38]
  reg [31:0] rDataReg; // @[src/main/scala/device/Device.scala 387:38]
  reg  rValidReg; // @[src/main/scala/device/Device.scala 391:38]
  reg  awReadyReg; // @[src/main/scala/device/Device.scala 397:38]
  reg  wReadyReg; // @[src/main/scala/device/Device.scala 403:38]
  reg  bValidReg; // @[src/main/scala/device/Device.scala 408:38]
  reg  awEnReg; // @[src/main/scala/device/Device.scala 412:38]
  reg [31:0] arAddrReg; // @[src/main/scala/device/Device.scala 414:38]
  wire  _T_3 = ~aresetnWire; // @[src/main/scala/device/Device.scala 418:10]
  wire  _T_7 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg; // @[src/main/scala/device/Device.scala 421:58]
  wire  _GEN_2 = io_axiLiteMaster_wValid & wReadyReg | awEnReg; // @[src/main/scala/device/Device.scala 424:42 426:21 412:38]
  wire  _GEN_4 = io_axiLiteMaster_awValid & io_axiLiteMaster_wValid & ~awReadyReg & awEnReg ? 1'h0 : _GEN_2; // @[src/main/scala/device/Device.scala 421:70 423:21]
  wire  _GEN_5 = ~aresetnWire | _T_7; // @[src/main/scala/device/Device.scala 418:31 419:21]
  wire  _GEN_6 = ~aresetnWire | _GEN_4; // @[src/main/scala/device/Device.scala 418:31 420:21]
  wire  _T_20 = ~wReadyReg & io_axiLiteMaster_wValid & io_axiLiteMaster_awValid & awEnReg; // @[src/main/scala/device/Device.scala 438:57]
  wire  _GEN_11 = bValidReg & io_axiLiteMaster_bReady ? 1'h0 : bValidReg; // @[src/main/scala/device/Device.scala 448:42 449:21 408:38]
  wire  _GEN_12 = io_axiLiteMaster_awValid & awReadyReg & io_axiLiteMaster_wValid & wReadyReg & ~bValidReg | _GEN_11; // @[src/main/scala/device/Device.scala 446:85 447:21]
  wire  _T_32 = io_axiLiteMaster_arValid & ~arReadyReg; // @[src/main/scala/device/Device.scala 455:29]
  wire  _GEN_16 = _T_3 | _T_32; // @[src/main/scala/device/Device.scala 452:31 453:21]
  wire  _T_37 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg; // @[src/main/scala/device/Device.scala 465:43]
  wire  _GEN_18 = io_axiLiteMaster_rReady ? 1'h0 : rValidReg; // @[src/main/scala/device/Device.scala 468:29 469:21 391:38]
  wire  _GEN_19 = io_axiLiteMaster_arValid & arReadyReg & ~rValidReg | _GEN_18; // @[src/main/scala/device/Device.scala 465:58 466:21]
  wire [31:0] _GEN_23 = arAddrReg == 32'h2000004 ? mtimeReg[63:32] : 32'h0; // @[src/main/scala/device/Device.scala 477:71 478:33 480:33]
  assign io_axiLiteMaster_arReady = arReadyReg; // @[src/main/scala/device/Device.scala 384:29]
  assign io_axiLiteMaster_rData = rDataReg; // @[src/main/scala/device/Device.scala 388:29]
  assign io_axiLiteMaster_rValid = rValidReg; // @[src/main/scala/device/Device.scala 392:29]
  assign io_axiLiteMaster_awReady = awReadyReg; // @[src/main/scala/device/Device.scala 398:29]
  assign io_axiLiteMaster_wReady = wReadyReg; // @[src/main/scala/device/Device.scala 404:29]
  assign io_axiLiteMaster_bValid = bValidReg; // @[src/main/scala/device/Device.scala 409:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/device/Device.scala 365:31]
      mtimeReg <= 64'h0; // @[src/main/scala/device/Device.scala 365:31]
    end else if (clock) begin // @[src/main/scala/device/Device.scala 366:33]
      mtimeReg <= _mtimeReg_T_1; // @[src/main/scala/device/Device.scala 367:26]
    end
    arReadyReg <= reset | _GEN_16; // @[src/main/scala/device/Device.scala 383:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 387:38]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 387:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 471:31]
      rDataReg <= 32'h0; // @[src/main/scala/device/Device.scala 472:21]
    end else if (_T_37) begin // @[src/main/scala/device/Device.scala 474:58]
      if (arAddrReg == 32'h2000000) begin // @[src/main/scala/device/Device.scala 475:58]
        rDataReg <= mtimeReg[31:0]; // @[src/main/scala/device/Device.scala 476:33]
      end else begin
        rDataReg <= _GEN_23;
      end
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 391:38]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 391:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 462:31]
      rValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 463:21]
    end else begin
      rValidReg <= _GEN_19;
    end
    awReadyReg <= reset | _GEN_5; // @[src/main/scala/device/Device.scala 397:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 403:38]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 403:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 436:31]
      wReadyReg <= 1'h0; // @[src/main/scala/device/Device.scala 437:21]
    end else begin
      wReadyReg <= _T_20;
    end
    if (reset) begin // @[src/main/scala/device/Device.scala 408:38]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 408:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 444:31]
      bValidReg <= 1'h0; // @[src/main/scala/device/Device.scala 445:21]
    end else begin
      bValidReg <= _GEN_12;
    end
    awEnReg <= reset | _GEN_6; // @[src/main/scala/device/Device.scala 412:{38,38}]
    if (reset) begin // @[src/main/scala/device/Device.scala 414:38]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 414:38]
    end else if (_T_3) begin // @[src/main/scala/device/Device.scala 452:31]
      arAddrReg <= 32'h0; // @[src/main/scala/device/Device.scala 454:21]
    end else if (io_axiLiteMaster_arValid & ~arReadyReg) begin // @[src/main/scala/device/Device.scala 455:45]
      arAddrReg <= io_axiLiteMaster_arAddr; // @[src/main/scala/device/Device.scala 457:21]
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
