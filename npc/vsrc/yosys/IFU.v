module IFU(
  input         clock,
  input         reset,
  input  [31:0] io_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_inst_valid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_inst, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_inst_bits_pc, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_bready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_bvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_arready, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_arvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [31:0] io_ifu2Mem_araddr, // @[src/main/scala/ifu/IFU.scala 15:16]
  output [7:0]  io_ifu2Mem_arlen, // @[src/main/scala/ifu/IFU.scala 15:16]
  output        io_ifu2Mem_rready, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_rvalid, // @[src/main/scala/ifu/IFU.scala 15:16]
  input  [31:0] io_ifu2Mem_rdata, // @[src/main/scala/ifu/IFU.scala 15:16]
  input         io_ifu2Mem_rlast // @[src/main/scala/ifu/IFU.scala 15:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_reset; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire [31:0] icache_io_addr; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_enable; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire [31:0] icache_io_inst; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_oEnable; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_bready; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_bvalid; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_arready; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_arvalid; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire [31:0] icache_io_icache2Mem_araddr; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire [7:0] icache_io_icache2Mem_arlen; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_rready; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_rvalid; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire [31:0] icache_io_icache2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 24:28]
  wire  icache_io_icache2Mem_rlast; // @[src/main/scala/ifu/IFU.scala 24:28]
  reg [31:0] pcReg; // @[src/main/scala/ifu/IFU.scala 21:28]
  Icache icache ( // @[src/main/scala/ifu/IFU.scala 24:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_addr(icache_io_addr),
    .io_enable(icache_io_enable),
    .io_inst(icache_io_inst),
    .io_oEnable(icache_io_oEnable),
    .io_icache2Mem_bready(icache_io_icache2Mem_bready),
    .io_icache2Mem_bvalid(icache_io_icache2Mem_bvalid),
    .io_icache2Mem_arready(icache_io_icache2Mem_arready),
    .io_icache2Mem_arvalid(icache_io_icache2Mem_arvalid),
    .io_icache2Mem_araddr(icache_io_icache2Mem_araddr),
    .io_icache2Mem_arlen(icache_io_icache2Mem_arlen),
    .io_icache2Mem_rready(icache_io_icache2Mem_rready),
    .io_icache2Mem_rvalid(icache_io_icache2Mem_rvalid),
    .io_icache2Mem_rdata(icache_io_icache2Mem_rdata),
    .io_icache2Mem_rlast(icache_io_icache2Mem_rlast)
  );
  assign io_inst_valid = icache_io_oEnable; // @[src/main/scala/ifu/IFU.scala 50:33]
  assign io_inst_bits_inst = icache_io_inst; // @[src/main/scala/ifu/IFU.scala 51:33]
  assign io_inst_bits_pc = pcReg; // @[src/main/scala/ifu/IFU.scala 52:33]
  assign io_ifu2Mem_bready = icache_io_icache2Mem_bready; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign io_ifu2Mem_arvalid = icache_io_icache2Mem_arvalid; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign io_ifu2Mem_araddr = icache_io_icache2Mem_araddr; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign io_ifu2Mem_arlen = icache_io_icache2Mem_arlen; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign io_ifu2Mem_rready = icache_io_icache2Mem_rready; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_addr = io_pc; // @[src/main/scala/ifu/IFU.scala 25:33]
  assign icache_io_enable = pcReg != io_pc; // @[src/main/scala/ifu/IFU.scala 26:43]
  assign icache_io_icache2Mem_bvalid = io_ifu2Mem_bvalid; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign icache_io_icache2Mem_arready = io_ifu2Mem_arready; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign icache_io_icache2Mem_rvalid = io_ifu2Mem_rvalid; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign icache_io_icache2Mem_rdata = io_ifu2Mem_rdata; // @[src/main/scala/ifu/IFU.scala 27:30]
  assign icache_io_icache2Mem_rlast = io_ifu2Mem_rlast; // @[src/main/scala/ifu/IFU.scala 27:30]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/ifu/IFU.scala 21:28]
      pcReg <= 32'h0; // @[src/main/scala/ifu/IFU.scala 21:28]
    end else begin
      pcReg <= io_pc; // @[src/main/scala/ifu/IFU.scala 22:15]
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
  pcReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
