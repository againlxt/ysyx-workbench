module Riscv32BaseReg(
  input         clock,
  input         reset,
  output [31:0] io_idu2BaseReg_rs1Data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  output [31:0] io_idu2BaseReg_rs2Data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_idu2BaseReg_rs1Index, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_idu2BaseReg_rs2Index, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input  [31:0] io_wbu2BaseReg_data, // @[src/main/scala/Riscv32BaseReg.scala 10:20]
  input         io_wbu2BaseReg_regWR // @[src/main/scala/Riscv32BaseReg.scala 10:20]
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_1; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_2; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_3; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_4; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_5; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_6; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_7; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_8; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_9; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_10; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_11; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_12; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_13; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_14; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  reg [31:0] riscv32BaseReg_15; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
  wire [31:0] _GEN_1 = 4'h1 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_2 = 4'h2 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_2 : _GEN_1; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_3 = 4'h3 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_3 : _GEN_2; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_4 = 4'h4 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_4 : _GEN_3; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_5 = 4'h5 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_5 : _GEN_4; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_6 = 4'h6 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_6 : _GEN_5; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_7 = 4'h7 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_7 : _GEN_6; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_8 = 4'h8 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_8 : _GEN_7; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_9 = 4'h9 == io_idu2BaseReg_rs1Index ? riscv32BaseReg_9 : _GEN_8; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_10 = 4'ha == io_idu2BaseReg_rs1Index ? riscv32BaseReg_10 : _GEN_9; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_11 = 4'hb == io_idu2BaseReg_rs1Index ? riscv32BaseReg_11 : _GEN_10; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_12 = 4'hc == io_idu2BaseReg_rs1Index ? riscv32BaseReg_12 : _GEN_11; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_13 = 4'hd == io_idu2BaseReg_rs1Index ? riscv32BaseReg_13 : _GEN_12; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_14 = 4'he == io_idu2BaseReg_rs1Index ? riscv32BaseReg_14 : _GEN_13; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  wire [31:0] _GEN_17 = 4'h1 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_1 : riscv32BaseReg_0; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_18 = 4'h2 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_2 : _GEN_17; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_19 = 4'h3 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_3 : _GEN_18; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_20 = 4'h4 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_4 : _GEN_19; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_21 = 4'h5 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_5 : _GEN_20; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_22 = 4'h6 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_6 : _GEN_21; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_23 = 4'h7 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_7 : _GEN_22; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_24 = 4'h8 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_8 : _GEN_23; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_25 = 4'h9 == io_idu2BaseReg_rs2Index ? riscv32BaseReg_9 : _GEN_24; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_26 = 4'ha == io_idu2BaseReg_rs2Index ? riscv32BaseReg_10 : _GEN_25; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_27 = 4'hb == io_idu2BaseReg_rs2Index ? riscv32BaseReg_11 : _GEN_26; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_28 = 4'hc == io_idu2BaseReg_rs2Index ? riscv32BaseReg_12 : _GEN_27; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_29 = 4'hd == io_idu2BaseReg_rs2Index ? riscv32BaseReg_13 : _GEN_28; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  wire [31:0] _GEN_30 = 4'he == io_idu2BaseReg_rs2Index ? riscv32BaseReg_14 : _GEN_29; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  assign io_idu2BaseReg_rs1Data = 4'hf == io_idu2BaseReg_rs1Index ? riscv32BaseReg_15 : _GEN_14; // @[src/main/scala/Riscv32BaseReg.scala 16:{42,42}]
  assign io_idu2BaseReg_rs2Data = 4'hf == io_idu2BaseReg_rs2Index ? riscv32BaseReg_15 : _GEN_30; // @[src/main/scala/Riscv32BaseReg.scala 17:{42,42}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_0 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h0 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_0 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end else begin
        riscv32BaseReg_0 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 23:45]
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_1 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h1 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_1 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_2 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h2 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_2 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_3 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h3 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_3 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_4 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h4 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_4 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_5 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h5 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_5 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_6 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h6 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_6 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_7 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h7 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_7 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_8 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h8 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_8 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_9 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'h9 == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_9 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_10 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'ha == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_10 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_11 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'hb == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_11 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_12 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'hc == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_12 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_13 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'hd == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_13 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_14 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'he == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_14 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
    end
    if (reset) begin // @[src/main/scala/Riscv32BaseReg.scala 15:42]
      riscv32BaseReg_15 <= 32'h0; // @[src/main/scala/Riscv32BaseReg.scala 15:42]
    end else if (io_wbu2BaseReg_regWR) begin // @[src/main/scala/Riscv32BaseReg.scala 19:44]
      if (io_wbu2BaseReg_rdIndex != 4'h0) begin // @[src/main/scala/Riscv32BaseReg.scala 20:54]
        if (4'hf == io_wbu2BaseReg_rdIndex) begin // @[src/main/scala/Riscv32BaseReg.scala 21:65]
          riscv32BaseReg_15 <= io_wbu2BaseReg_data; // @[src/main/scala/Riscv32BaseReg.scala 21:65]
        end
      end
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
  riscv32BaseReg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  riscv32BaseReg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  riscv32BaseReg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  riscv32BaseReg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  riscv32BaseReg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  riscv32BaseReg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  riscv32BaseReg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  riscv32BaseReg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  riscv32BaseReg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  riscv32BaseReg_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  riscv32BaseReg_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  riscv32BaseReg_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  riscv32BaseReg_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  riscv32BaseReg_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  riscv32BaseReg_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  riscv32BaseReg_15 = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
