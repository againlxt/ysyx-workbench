module CSRReg(
  input         clock,
  input         reset,
  output [31:0] io_exu2CSR_csrData, // @[src/main/scala/CSR.scala 10:16]
  input         io_exu2CSR_mret, // @[src/main/scala/CSR.scala 10:16]
  input         io_exu2CSR_ecall, // @[src/main/scala/CSR.scala 10:16]
  input  [11:0] io_exu2CSR_csr, // @[src/main/scala/CSR.scala 10:16]
  input  [31:0] io_wbu2CSR_pc, // @[src/main/scala/CSR.scala 10:16]
  input  [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/CSR.scala 10:16]
  input  [11:0] io_wbu2CSR_csr, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_ecall, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_csrEn, // @[src/main/scala/CSR.scala 10:16]
  input         io_wbu2CSR_csrWr // @[src/main/scala/CSR.scala 10:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mepcReg; // @[src/main/scala/CSR.scala 16:34]
  reg [31:0] mstatusReg; // @[src/main/scala/CSR.scala 17:34]
  reg [31:0] mcauseReg; // @[src/main/scala/CSR.scala 18:34]
  reg [31:0] mtvecReg; // @[src/main/scala/CSR.scala 19:34]
  reg [31:0] mvendoridReg; // @[src/main/scala/CSR.scala 20:42]
  reg [31:0] marchidReg; // @[src/main/scala/CSR.scala 21:42]
  wire [31:0] _GEN_0 = io_wbu2CSR_csr == 12'hf12 ? io_wbu2CSR_csrWData : marchidReg; // @[src/main/scala/CSR.scala 21:42 34:65 35:57]
  wire [31:0] _GEN_1 = io_wbu2CSR_csr == 12'hf11 ? io_wbu2CSR_csrWData : mvendoridReg; // @[src/main/scala/CSR.scala 20:42 32:53 33:49]
  wire [31:0] _GEN_2 = io_wbu2CSR_csr == 12'hf11 ? marchidReg : _GEN_0; // @[src/main/scala/CSR.scala 21:42 32:53]
  wire [31:0] _GEN_3 = io_wbu2CSR_csr == 12'h305 ? io_wbu2CSR_csrWData : mtvecReg; // @[src/main/scala/CSR.scala 30:53 31:33 19:34]
  wire [31:0] _GEN_4 = io_wbu2CSR_csr == 12'h305 ? mvendoridReg : _GEN_1; // @[src/main/scala/CSR.scala 20:42 30:53]
  wire [31:0] _GEN_5 = io_wbu2CSR_csr == 12'h305 ? marchidReg : _GEN_2; // @[src/main/scala/CSR.scala 21:42 30:53]
  wire [31:0] _GEN_6 = io_wbu2CSR_csr == 12'h341 ? io_wbu2CSR_csrWData : mepcReg; // @[src/main/scala/CSR.scala 28:53 29:33 16:34]
  wire [31:0] _GEN_7 = io_wbu2CSR_csr == 12'h341 ? mtvecReg : _GEN_3; // @[src/main/scala/CSR.scala 19:34 28:53]
  wire [31:0] _GEN_8 = io_wbu2CSR_csr == 12'h341 ? mvendoridReg : _GEN_4; // @[src/main/scala/CSR.scala 20:42 28:53]
  wire [31:0] _GEN_9 = io_wbu2CSR_csr == 12'h341 ? marchidReg : _GEN_5; // @[src/main/scala/CSR.scala 21:42 28:53]
  wire [31:0] _GEN_10 = io_wbu2CSR_csr == 12'h342 ? io_wbu2CSR_csrWData : mcauseReg; // @[src/main/scala/CSR.scala 26:53 27:33 18:34]
  wire [31:0] _GEN_11 = io_wbu2CSR_csr == 12'h342 ? mepcReg : _GEN_6; // @[src/main/scala/CSR.scala 16:34 26:53]
  wire [31:0] _GEN_12 = io_wbu2CSR_csr == 12'h342 ? mtvecReg : _GEN_7; // @[src/main/scala/CSR.scala 19:34 26:53]
  wire [31:0] _GEN_13 = io_wbu2CSR_csr == 12'h342 ? mvendoridReg : _GEN_8; // @[src/main/scala/CSR.scala 20:42 26:53]
  wire [31:0] _GEN_14 = io_wbu2CSR_csr == 12'h342 ? marchidReg : _GEN_9; // @[src/main/scala/CSR.scala 21:42 26:53]
  wire  _io_exu2CSR_csrData_T = io_exu2CSR_csr == 12'h300; // @[src/main/scala/CSR.scala 44:25]
  wire  _io_exu2CSR_csrData_T_1 = io_exu2CSR_csr == 12'h342; // @[src/main/scala/CSR.scala 45:33]
  wire  _io_exu2CSR_csrData_T_2 = io_exu2CSR_csr == 12'h341; // @[src/main/scala/CSR.scala 46:33]
  wire  _io_exu2CSR_csrData_T_3 = io_exu2CSR_csr == 12'h305; // @[src/main/scala/CSR.scala 47:33]
  wire  _io_exu2CSR_csrData_T_4 = io_exu2CSR_csr == 12'hf11; // @[src/main/scala/CSR.scala 48:33]
  wire  _io_exu2CSR_csrData_T_5 = io_exu2CSR_csr == 12'hf12; // @[src/main/scala/CSR.scala 49:33]
  wire [31:0] _io_exu2CSR_csrData_T_8 = io_exu2CSR_mret ? mepcReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_9 = io_exu2CSR_ecall ? mtvecReg : _io_exu2CSR_csrData_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_10 = _io_exu2CSR_csrData_T_5 ? marchidReg : _io_exu2CSR_csrData_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_11 = _io_exu2CSR_csrData_T_4 ? mvendoridReg : _io_exu2CSR_csrData_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_12 = _io_exu2CSR_csrData_T_3 ? mtvecReg : _io_exu2CSR_csrData_T_11; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_13 = _io_exu2CSR_csrData_T_2 ? mepcReg : _io_exu2CSR_csrData_T_12; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_exu2CSR_csrData_T_14 = _io_exu2CSR_csrData_T_1 ? mcauseReg : _io_exu2CSR_csrData_T_13; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_exu2CSR_csrData = _io_exu2CSR_csrData_T ? mstatusReg : _io_exu2CSR_csrData_T_14; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/CSR.scala 16:34]
      mepcReg <= 32'h0; // @[src/main/scala/CSR.scala 16:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mepcReg <= _GEN_11;
        end
      end else if (io_wbu2CSR_ecall) begin // @[src/main/scala/CSR.scala 37:46]
        mepcReg <= io_wbu2CSR_pc; // @[src/main/scala/CSR.scala 38:25]
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 17:34]
      mstatusReg <= 32'h1800; // @[src/main/scala/CSR.scala 17:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (io_wbu2CSR_csr == 12'h300) begin // @[src/main/scala/CSR.scala 24:47]
          mstatusReg <= io_wbu2CSR_csrWData; // @[src/main/scala/CSR.scala 25:33]
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 18:34]
      mcauseReg <= 32'h0; // @[src/main/scala/CSR.scala 18:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mcauseReg <= _GEN_10;
        end
      end else if (io_wbu2CSR_ecall) begin // @[src/main/scala/CSR.scala 37:46]
        mcauseReg <= 32'hb; // @[src/main/scala/CSR.scala 39:25]
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 19:34]
      mtvecReg <= 32'h0; // @[src/main/scala/CSR.scala 19:34]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mtvecReg <= _GEN_12;
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 20:42]
      mvendoridReg <= 32'h79737978; // @[src/main/scala/CSR.scala 20:42]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          mvendoridReg <= _GEN_13;
        end
      end
    end
    if (reset) begin // @[src/main/scala/CSR.scala 21:42]
      marchidReg <= 32'h78957352; // @[src/main/scala/CSR.scala 21:42]
    end else if (io_wbu2CSR_csrEn) begin // @[src/main/scala/CSR.scala 22:35]
      if (io_wbu2CSR_csrWr) begin // @[src/main/scala/CSR.scala 23:40]
        if (!(io_wbu2CSR_csr == 12'h300)) begin // @[src/main/scala/CSR.scala 24:47]
          marchidReg <= _GEN_14;
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
  mepcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mstatusReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mcauseReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mtvecReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mvendoridReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  marchidReg = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
