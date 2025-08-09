module AXIBusArbiter(
  input         clock,
  input         reset,
  input         io_axiSlave0_bready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave0_bvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave0_arready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave0_arvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [31:0] io_axiSlave0_araddr, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [7:0]  io_axiSlave0_arlen, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave0_rready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave0_rvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [31:0] io_axiSlave0_rdata, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave0_rlast, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_awready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_awvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [31:0] io_axiSlave1_awaddr, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [2:0]  io_axiSlave1_awsize, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_wready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_wvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [31:0] io_axiSlave1_wdata, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [3:0]  io_axiSlave1_wstrb, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_wlast, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_bready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_bvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_arready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_arvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [31:0] io_axiSlave1_araddr, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [2:0]  io_axiSlave1_arsize, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiSlave1_rready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_rvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [31:0] io_axiSlave1_rdata, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiSlave1_rlast, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_awready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_awvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [31:0] io_axiMaster_awaddr, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [2:0]  io_axiMaster_awsize, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_wready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_wvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [31:0] io_axiMaster_wdata, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [3:0]  io_axiMaster_wstrb, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_wlast, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_bready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_bvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_arready, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_arvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [31:0] io_axiMaster_araddr, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [7:0]  io_axiMaster_arlen, // @[src/main/scala/basemode/Memory.scala 144:14]
  output [2:0]  io_axiMaster_arsize, // @[src/main/scala/basemode/Memory.scala 144:14]
  output        io_axiMaster_rready, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_rvalid, // @[src/main/scala/basemode/Memory.scala 144:14]
  input  [31:0] io_axiMaster_rdata, // @[src/main/scala/basemode/Memory.scala 144:14]
  input         io_axiMaster_rlast // @[src/main/scala/basemode/Memory.scala 144:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[src/main/scala/basemode/Memory.scala 178:22]
  wire  wait2LSUWire = io_axiSlave1_arvalid | io_axiSlave1_awvalid | io_axiSlave1_wvalid; // @[src/main/scala/basemode/Memory.scala 179:66]
  wire  ifu2WaitWire = io_axiSlave0_rvalid & io_axiSlave0_rready & io_axiSlave0_rlast; // @[src/main/scala/basemode/Memory.scala 181:65]
  wire  lsu2WaitWire = io_axiSlave1_rvalid & io_axiSlave1_rready & io_axiSlave1_rlast | io_axiSlave1_bvalid &
    io_axiSlave1_bready; // @[src/main/scala/basemode/Memory.scala 182:81]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[src/main/scala/basemode/Memory.scala 185:19]
  wire [1:0] _state_T_3 = io_axiSlave0_arvalid ? 2'h2 : 2'h1; // @[src/main/scala/basemode/Memory.scala 186:75]
  wire [1:0] _state_T_4 = wait2LSUWire ? 2'h3 : _state_T_3; // @[src/main/scala/basemode/Memory.scala 186:50]
  wire [1:0] _state_T_5 = reset ? 2'h0 : _state_T_4; // @[src/main/scala/basemode/Memory.scala 186:19]
  wire [1:0] _state_T_7 = ifu2WaitWire ? 2'h1 : 2'h2; // @[src/main/scala/basemode/Memory.scala 187:50]
  wire  _GEN_0 = state == 2'h3 & io_axiMaster_awready; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 231:21]
  wire  _GEN_1 = state == 2'h3 & io_axiSlave1_awvalid; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 250:21]
  wire [31:0] _GEN_2 = state == 2'h3 ? io_axiSlave1_awaddr : 32'h0; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 251:20]
  wire [2:0] _GEN_5 = state == 2'h3 ? io_axiSlave1_awsize : 3'h2; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 254:20]
  wire  _GEN_7 = state == 2'h3 & io_axiMaster_wready; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 233:20]
  wire  _GEN_8 = state == 2'h3 & io_axiSlave1_wvalid; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 257:20]
  wire [31:0] _GEN_9 = state == 2'h3 ? io_axiSlave1_wdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 258:19]
  wire [3:0] _GEN_10 = state == 2'h3 ? io_axiSlave1_wstrb : 4'h0; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 259:19]
  wire  _GEN_11 = state == 2'h3 & io_axiSlave1_wlast; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 260:19]
  wire  _GEN_12 = state == 2'h3 & io_axiSlave1_bready; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 262:20]
  wire  _GEN_13 = state == 2'h3 & io_axiMaster_bvalid; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 235:20]
  wire  _GEN_16 = state == 2'h3 & io_axiMaster_arready; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 239:21]
  wire  _GEN_17 = state == 2'h3 & io_axiSlave1_arvalid; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 264:21]
  wire [31:0] _GEN_18 = state == 2'h3 ? io_axiSlave1_araddr : 32'h0; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 265:20]
  wire [2:0] _GEN_21 = state == 2'h3 ? io_axiSlave1_arsize : 3'h2; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 268:20]
  wire  _GEN_23 = state == 2'h3 & io_axiSlave1_rready; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 271:20]
  wire  _GEN_24 = state == 2'h3 & io_axiMaster_rvalid; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 241:20]
  wire [31:0] _GEN_26 = state == 2'h3 ? io_axiMaster_rdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 243:19]
  wire  _GEN_27 = state == 2'h3 & io_axiMaster_rlast; // @[src/main/scala/basemode/Memory.scala 195:32 196:18 src/main/scala/basemode/Interface.scala 244:19]
  wire  _GEN_30 = state == 2'h2 ? 1'h0 : _GEN_1; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [31:0] _GEN_31 = state == 2'h2 ? 32'h0 : _GEN_2; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [2:0] _GEN_34 = state == 2'h2 ? 3'h2 : _GEN_5; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_37 = state == 2'h2 ? 1'h0 : _GEN_8; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [31:0] _GEN_38 = state == 2'h2 ? 32'h0 : _GEN_9; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [3:0] _GEN_39 = state == 2'h2 ? 4'hf : _GEN_10; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_40 = state == 2'h2 ? 1'h0 : _GEN_11; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_41 = state == 2'h2 ? io_axiSlave0_bready : _GEN_12; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_42 = state == 2'h2 & io_axiMaster_bvalid; // @[src/main/scala/basemode/Memory.scala 193:32 194:18 src/main/scala/basemode/Interface.scala 235:20]
  wire  _GEN_45 = state == 2'h2 & io_axiMaster_arready; // @[src/main/scala/basemode/Memory.scala 193:32 194:18 src/main/scala/basemode/Interface.scala 239:21]
  wire  _GEN_46 = state == 2'h2 ? io_axiSlave0_arvalid : _GEN_17; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [31:0] _GEN_47 = state == 2'h2 ? io_axiSlave0_araddr : _GEN_18; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [7:0] _GEN_49 = state == 2'h2 ? io_axiSlave0_arlen : 8'h0; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire [2:0] _GEN_50 = state == 2'h2 ? 3'h2 : _GEN_21; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_52 = state == 2'h2 ? io_axiSlave0_rready : _GEN_23; // @[src/main/scala/basemode/Memory.scala 193:32 194:18]
  wire  _GEN_53 = state == 2'h2 & io_axiMaster_rvalid; // @[src/main/scala/basemode/Memory.scala 193:32 194:18 src/main/scala/basemode/Interface.scala 241:20]
  wire [31:0] _GEN_55 = state == 2'h2 ? io_axiMaster_rdata : 32'h0; // @[src/main/scala/basemode/Memory.scala 193:32 194:18 src/main/scala/basemode/Interface.scala 243:19]
  wire  _GEN_56 = state == 2'h2 & io_axiMaster_rlast; // @[src/main/scala/basemode/Memory.scala 193:32 194:18 src/main/scala/basemode/Interface.scala 244:19]
  wire  _GEN_58 = state == 2'h2 ? 1'h0 : _GEN_0; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 231:21]
  wire  _GEN_59 = state == 2'h2 ? 1'h0 : _GEN_7; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 233:20]
  wire  _GEN_60 = state == 2'h2 ? 1'h0 : _GEN_13; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 235:20]
  wire  _GEN_63 = state == 2'h2 ? 1'h0 : _GEN_16; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 239:21]
  wire  _GEN_64 = state == 2'h2 ? 1'h0 : _GEN_24; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 241:20]
  wire [31:0] _GEN_66 = state == 2'h2 ? 32'h0 : _GEN_26; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 243:19]
  wire  _GEN_67 = state == 2'h2 ? 1'h0 : _GEN_27; // @[src/main/scala/basemode/Memory.scala 193:32 src/main/scala/basemode/Interface.scala 244:19]
  assign io_axiSlave0_bvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_42; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 235:20]
  assign io_axiSlave0_arready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_45; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 239:21]
  assign io_axiSlave0_rvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_53; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 241:20]
  assign io_axiSlave0_rdata = state == 2'h0 | state == 2'h1 ? 32'h0 : _GEN_55; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 243:19]
  assign io_axiSlave0_rlast = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_56; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 244:19]
  assign io_axiSlave1_awready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_58; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 231:21]
  assign io_axiSlave1_wready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_59; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 233:20]
  assign io_axiSlave1_bvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_60; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 235:20]
  assign io_axiSlave1_arready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_63; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 239:21]
  assign io_axiSlave1_rvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_64; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 241:20]
  assign io_axiSlave1_rdata = state == 2'h0 | state == 2'h1 ? 32'h0 : _GEN_66; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 243:19]
  assign io_axiSlave1_rlast = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_67; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 244:19]
  assign io_axiMaster_awvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_30; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 250:21]
  assign io_axiMaster_awaddr = state == 2'h0 | state == 2'h1 ? 32'h0 : _GEN_31; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 251:20]
  assign io_axiMaster_awsize = state == 2'h0 | state == 2'h1 ? 3'h2 : _GEN_34; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 254:20]
  assign io_axiMaster_wvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_37; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 257:20]
  assign io_axiMaster_wdata = state == 2'h0 | state == 2'h1 ? 32'h0 : _GEN_38; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 258:19]
  assign io_axiMaster_wstrb = state == 2'h0 | state == 2'h1 ? 4'h0 : _GEN_39; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 259:19]
  assign io_axiMaster_wlast = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_40; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 260:19]
  assign io_axiMaster_bready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_41; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 262:20]
  assign io_axiMaster_arvalid = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_46; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 264:21]
  assign io_axiMaster_araddr = state == 2'h0 | state == 2'h1 ? 32'h0 : _GEN_47; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 265:20]
  assign io_axiMaster_arlen = state == 2'h0 | state == 2'h1 ? 8'h0 : _GEN_49; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 267:19]
  assign io_axiMaster_arsize = state == 2'h0 | state == 2'h1 ? 3'h2 : _GEN_50; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 268:20]
  assign io_axiMaster_rready = state == 2'h0 | state == 2'h1 ? 1'h0 : _GEN_52; // @[src/main/scala/basemode/Memory.scala 191:46 src/main/scala/basemode/Interface.scala 271:20]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/basemode/Memory.scala 178:22]
      state <= 2'h0; // @[src/main/scala/basemode/Memory.scala 178:22]
    end else if (2'h3 == state) begin // @[src/main/scala/basemode/Memory.scala 184:36]
      if (reset) begin // @[src/main/scala/basemode/Memory.scala 188:19]
        state <= 2'h0;
      end else if (lsu2WaitWire) begin // @[src/main/scala/basemode/Memory.scala 188:50]
        state <= 2'h1;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/basemode/Memory.scala 184:36]
      if (reset) begin // @[src/main/scala/basemode/Memory.scala 187:19]
        state <= 2'h0;
      end else begin
        state <= _state_T_7;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/basemode/Memory.scala 184:36]
      state <= _state_T_5;
    end else begin
      state <= _state_T_1;
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
