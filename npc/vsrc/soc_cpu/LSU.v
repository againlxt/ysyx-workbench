module LSU(
  input         clock,
  input         reset,
  output        io_exu2LSU_ready, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_valid, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_pc, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_memData, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_aluData, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_csrWData, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_csrData, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_exu2LSU_bits_inst, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_regWR, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_memWR, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_memValid, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [2:0]  io_exu2LSU_bits_memOP, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [1:0]  io_exu2LSU_bits_toReg, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_ecall, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_csrEn, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_exu2LSU_bits_csrWr, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_awready, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_awvalid, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2Mem_awaddr, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [2:0]  io_lsu2Mem_awsize, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_wready, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_wvalid, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2Mem_wdata, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [3:0]  io_lsu2Mem_wstrb, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_wlast, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_bready, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_bvalid, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [1:0]  io_lsu2Mem_bresp, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_arready, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_arvalid, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2Mem_araddr, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [2:0]  io_lsu2Mem_arsize, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2Mem_rready, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_rvalid, // @[src/main/scala/lsu/LSU.scala 11:16]
  input  [31:0] io_lsu2Mem_rdata, // @[src/main/scala/lsu/LSU.scala 11:16]
  input         io_lsu2Mem_rlast, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_valid, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_pc, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_memData, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_aluData, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_csrWData, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_csrData, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [31:0] io_lsu2WBU_bits_inst, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_regWR, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [1:0]  io_lsu2WBU_bits_toReg, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_ecall, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_csrEn, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_csrWr, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_fencei, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_lsu2WBU_bits_skip, // @[src/main/scala/lsu/LSU.scala 11:16]
  output [3:0]  io_rd, // @[src/main/scala/lsu/LSU.scala 11:16]
  output        io_bypassValid // @[src/main/scala/lsu/LSU.scala 11:16]
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
`endif // RANDOMIZE_REG_INIT
  wire  axiAccessFault_valid; // @[src/main/scala/lsu/LSU.scala 91:44]
  wire  axiAccessFault_ready; // @[src/main/scala/lsu/LSU.scala 91:44]
  wire [1:0] axiAccessFault_resp; // @[src/main/scala/lsu/LSU.scala 91:44]
  wire  LGDC_valid; // @[src/main/scala/lsu/LSU.scala 226:57]
  wire [31:0] LGDC_counterType; // @[src/main/scala/lsu/LSU.scala 226:57]
  wire [31:0] LGDC_data; // @[src/main/scala/lsu/LSU.scala 226:57]
  wire [31:0] mTrace_data; // @[src/main/scala/lsu/LSU.scala 233:57]
  wire [31:0] mTrace_addr; // @[src/main/scala/lsu/LSU.scala 233:57]
  wire [1:0] mTrace_memop; // @[src/main/scala/lsu/LSU.scala 233:57]
  wire  mTrace_wOrR; // @[src/main/scala/lsu/LSU.scala 233:57]
  wire  mTrace_enable; // @[src/main/scala/lsu/LSU.scala 233:57]
  wire  _wMaskWire_T_1 = io_exu2LSU_bits_memOP[1:0] == 2'h0; // @[src/main/scala/lsu/LSU.scala 36:33]
  wire  _wMaskWire_T_3 = io_exu2LSU_bits_memOP[1:0] == 2'h1; // @[src/main/scala/lsu/LSU.scala 37:33]
  wire  _wMaskWire_T_5 = io_exu2LSU_bits_memOP[1:0] == 2'h2; // @[src/main/scala/lsu/LSU.scala 38:33]
  wire [3:0] _wMaskWire_T_6 = _wMaskWire_T_5 ? 4'hf : 4'h1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _wMaskWire_T_7 = _wMaskWire_T_3 ? 4'h3 : _wMaskWire_T_6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] wMaskWire = _wMaskWire_T_1 ? 4'h1 : _wMaskWire_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  sOrUWire = ~io_exu2LSU_bits_memOP[2]; // @[src/main/scala/lsu/LSU.scala 41:31]
  reg  awvalidReg; // @[src/main/scala/lsu/LSU.scala 48:42]
  reg  wvalidReg; // @[src/main/scala/lsu/LSU.scala 60:42]
  wire  _io_lsu2Mem_wdata_T_1 = io_exu2LSU_bits_aluData[1:0] == 2'h0; // @[src/main/scala/lsu/LSU.scala 64:43]
  wire  _io_lsu2Mem_wdata_T_4 = io_exu2LSU_bits_aluData[1:0] == 2'h0 & _wMaskWire_T_5; // @[src/main/scala/lsu/LSU.scala 64:51]
  wire  _io_lsu2Mem_wdata_T_9 = _io_lsu2Mem_wdata_T_1 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 65:51]
  wire [31:0] _io_lsu2Mem_wdata_T_11 = {16'h0,io_exu2LSU_bits_memData[15:0]}; // @[src/main/scala/lsu/LSU.scala 65:95]
  wire  _io_lsu2Mem_wdata_T_16 = _io_lsu2Mem_wdata_T_1 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 66:51]
  wire [31:0] _io_lsu2Mem_wdata_T_18 = {24'h0,io_exu2LSU_bits_memData[7:0]}; // @[src/main/scala/lsu/LSU.scala 66:95]
  wire  _io_lsu2Mem_wdata_T_20 = io_exu2LSU_bits_aluData[1:0] == 2'h1; // @[src/main/scala/lsu/LSU.scala 67:43]
  wire [31:0] _io_lsu2Mem_wdata_T_23 = {16'h0,io_exu2LSU_bits_memData[7:0],8'h0}; // @[src/main/scala/lsu/LSU.scala 67:71]
  wire  _io_lsu2Mem_wdata_T_25 = io_exu2LSU_bits_aluData[1:0] == 2'h2; // @[src/main/scala/lsu/LSU.scala 68:43]
  wire  _io_lsu2Mem_wdata_T_28 = io_exu2LSU_bits_aluData[1:0] == 2'h2 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 68:51]
  wire [31:0] _io_lsu2Mem_wdata_T_31 = {8'h0,io_exu2LSU_bits_memData[7:0],16'h0}; // @[src/main/scala/lsu/LSU.scala 68:95]
  wire  _io_lsu2Mem_wdata_T_36 = _io_lsu2Mem_wdata_T_25 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 69:51]
  wire [31:0] _io_lsu2Mem_wdata_T_38 = {io_exu2LSU_bits_memData[15:0],16'h0}; // @[src/main/scala/lsu/LSU.scala 69:95]
  wire  _io_lsu2Mem_wdata_T_40 = io_exu2LSU_bits_aluData[1:0] == 2'h3; // @[src/main/scala/lsu/LSU.scala 70:43]
  wire [31:0] _io_lsu2Mem_wdata_T_42 = {io_exu2LSU_bits_memData[7:0],24'h0}; // @[src/main/scala/lsu/LSU.scala 70:71]
  wire [31:0] _io_lsu2Mem_wdata_T_43 = _io_lsu2Mem_wdata_T_40 ? _io_lsu2Mem_wdata_T_42 : io_exu2LSU_bits_memData; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_lsu2Mem_wdata_T_44 = _io_lsu2Mem_wdata_T_36 ? _io_lsu2Mem_wdata_T_38 : _io_lsu2Mem_wdata_T_43; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_lsu2Mem_wdata_T_45 = _io_lsu2Mem_wdata_T_28 ? _io_lsu2Mem_wdata_T_31 : _io_lsu2Mem_wdata_T_44; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_lsu2Mem_wdata_T_46 = _io_lsu2Mem_wdata_T_20 ? _io_lsu2Mem_wdata_T_23 : _io_lsu2Mem_wdata_T_45; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_lsu2Mem_wdata_T_47 = _io_lsu2Mem_wdata_T_16 ? _io_lsu2Mem_wdata_T_18 : _io_lsu2Mem_wdata_T_46; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_lsu2Mem_wdata_T_48 = _io_lsu2Mem_wdata_T_9 ? _io_lsu2Mem_wdata_T_11 : _io_lsu2Mem_wdata_T_47; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_lsu2Mem_wstrb_T_3 = _io_lsu2Mem_wdata_T_1 & io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 73:51]
  wire  _io_lsu2Mem_wstrb_T_7 = _io_lsu2Mem_wdata_T_20 & io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 74:51]
  wire [3:0] _io_lsu2Mem_wstrb_T_9 = {wMaskWire[2:0],1'h0}; // @[src/main/scala/lsu/LSU.scala 74:87]
  wire  _io_lsu2Mem_wstrb_T_13 = _io_lsu2Mem_wdata_T_25 & io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 75:51]
  wire [3:0] _io_lsu2Mem_wstrb_T_15 = {wMaskWire[1:0],2'h0}; // @[src/main/scala/lsu/LSU.scala 75:87]
  wire  _io_lsu2Mem_wstrb_T_19 = _io_lsu2Mem_wdata_T_40 & io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 76:51]
  wire [3:0] _io_lsu2Mem_wstrb_T_21 = {wMaskWire[0],3'h0}; // @[src/main/scala/lsu/LSU.scala 76:87]
  wire [3:0] _io_lsu2Mem_wstrb_T_22 = _io_lsu2Mem_wstrb_T_19 ? _io_lsu2Mem_wstrb_T_21 : wMaskWire; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_lsu2Mem_wstrb_T_23 = _io_lsu2Mem_wstrb_T_13 ? _io_lsu2Mem_wstrb_T_15 : _io_lsu2Mem_wstrb_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_lsu2Mem_wstrb_T_24 = _io_lsu2Mem_wstrb_T_7 ? _io_lsu2Mem_wstrb_T_9 : _io_lsu2Mem_wstrb_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  wlastReg; // @[src/main/scala/lsu/LSU.scala 82:42]
  reg  arvalidReg; // @[src/main/scala/lsu/LSU.scala 98:42]
  reg  rreadyReg; // @[src/main/scala/lsu/LSU.scala 109:42]
  reg [31:0] rdataReg; // @[src/main/scala/lsu/LSU.scala 114:42]
  wire  _rdataShiftWire_T_2 = io_exu2LSU_bits_aluData <= 32'h20000fff & io_exu2LSU_bits_aluData >= 32'h20000000; // @[src/main/scala/lsu/LSU.scala 120:57]
  wire  _rdataShiftWire_T_5 = io_exu2LSU_bits_aluData <= 32'h20000fff & io_exu2LSU_bits_aluData >= 32'h20000000 &
    _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 120:91]
  wire [31:0] _rdataShiftWire_T_7 = {24'h0,rdataReg[7:0]}; // @[src/main/scala/lsu/LSU.scala 120:135]
  wire  _rdataShiftWire_T_13 = _rdataShiftWire_T_2 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 121:91]
  wire [31:0] _rdataShiftWire_T_15 = {16'h0,rdataReg[15:0]}; // @[src/main/scala/lsu/LSU.scala 121:135]
  wire  _rdataShiftWire_T_21 = _rdataShiftWire_T_2 & _wMaskWire_T_5; // @[src/main/scala/lsu/LSU.scala 122:91]
  wire  _rdataShiftWire_T_24 = io_exu2LSU_bits_aluData <= 32'h3fffffff & io_exu2LSU_bits_aluData >= 32'h30000000; // @[src/main/scala/lsu/LSU.scala 125:57]
  wire  _rdataShiftWire_T_27 = io_exu2LSU_bits_aluData <= 32'h3fffffff & io_exu2LSU_bits_aluData >= 32'h30000000 &
    _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 125:91]
  wire  _rdataShiftWire_T_35 = _rdataShiftWire_T_24 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 126:91]
  wire  _rdataShiftWire_T_43 = _rdataShiftWire_T_24 & _wMaskWire_T_5; // @[src/main/scala/lsu/LSU.scala 127:91]
  wire  _rdataShiftWire_T_44 = io_exu2LSU_bits_aluData >= 32'h80000000; // @[src/main/scala/lsu/LSU.scala 130:39]
  wire  _rdataShiftWire_T_47 = io_exu2LSU_bits_aluData >= 32'h80000000 & _io_lsu2Mem_wdata_T_1; // @[src/main/scala/lsu/LSU.scala 130:57]
  wire  _rdataShiftWire_T_50 = io_exu2LSU_bits_aluData >= 32'h80000000 & _io_lsu2Mem_wdata_T_1 & _wMaskWire_T_5; // @[src/main/scala/lsu/LSU.scala 130:85]
  wire  _rdataShiftWire_T_57 = _rdataShiftWire_T_47 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 131:85]
  wire  _rdataShiftWire_T_66 = _rdataShiftWire_T_47 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 132:85]
  wire  _rdataShiftWire_T_72 = _rdataShiftWire_T_44 & _io_lsu2Mem_wdata_T_20; // @[src/main/scala/lsu/LSU.scala 133:57]
  wire [31:0] _rdataShiftWire_T_74 = {24'h0,rdataReg[15:8]}; // @[src/main/scala/lsu/LSU.scala 133:103]
  wire  _rdataShiftWire_T_78 = _rdataShiftWire_T_44 & _io_lsu2Mem_wdata_T_25; // @[src/main/scala/lsu/LSU.scala 134:57]
  wire  _rdataShiftWire_T_81 = _rdataShiftWire_T_44 & _io_lsu2Mem_wdata_T_25 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 134:85]
  wire [31:0] _rdataShiftWire_T_83 = {24'h0,rdataReg[23:16]}; // @[src/main/scala/lsu/LSU.scala 134:127]
  wire  _rdataShiftWire_T_90 = _rdataShiftWire_T_78 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 135:85]
  wire [31:0] _rdataShiftWire_T_92 = {16'h0,rdataReg[31:16]}; // @[src/main/scala/lsu/LSU.scala 135:127]
  wire  _rdataShiftWire_T_96 = _rdataShiftWire_T_44 & _io_lsu2Mem_wdata_T_40; // @[src/main/scala/lsu/LSU.scala 136:57]
  wire [31:0] _rdataShiftWire_T_98 = {24'h0,rdataReg[31:24]}; // @[src/main/scala/lsu/LSU.scala 136:103]
  wire  _rdataShiftWire_T_99 = io_exu2LSU_bits_aluData <= 32'h1fffffff; // @[src/main/scala/lsu/LSU.scala 139:39]
  wire  _rdataShiftWire_T_102 = io_exu2LSU_bits_aluData <= 32'h1fffffff & _io_lsu2Mem_wdata_T_1; // @[src/main/scala/lsu/LSU.scala 139:57]
  wire  _rdataShiftWire_T_105 = io_exu2LSU_bits_aluData <= 32'h1fffffff & _io_lsu2Mem_wdata_T_1 & _wMaskWire_T_5; // @[src/main/scala/lsu/LSU.scala 139:85]
  wire  _rdataShiftWire_T_112 = _rdataShiftWire_T_102 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 140:85]
  wire  _rdataShiftWire_T_121 = _rdataShiftWire_T_102 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 141:85]
  wire  _rdataShiftWire_T_127 = _rdataShiftWire_T_99 & _io_lsu2Mem_wdata_T_20; // @[src/main/scala/lsu/LSU.scala 142:57]
  wire  _rdataShiftWire_T_133 = _rdataShiftWire_T_99 & _io_lsu2Mem_wdata_T_25; // @[src/main/scala/lsu/LSU.scala 143:57]
  wire  _rdataShiftWire_T_136 = _rdataShiftWire_T_99 & _io_lsu2Mem_wdata_T_25 & _wMaskWire_T_1; // @[src/main/scala/lsu/LSU.scala 143:85]
  wire  _rdataShiftWire_T_145 = _rdataShiftWire_T_133 & _wMaskWire_T_3; // @[src/main/scala/lsu/LSU.scala 144:85]
  wire  _rdataShiftWire_T_151 = _rdataShiftWire_T_99 & _io_lsu2Mem_wdata_T_40; // @[src/main/scala/lsu/LSU.scala 145:57]
  wire [31:0] _rdataShiftWire_T_154 = _rdataShiftWire_T_151 ? _rdataShiftWire_T_98 : rdataReg; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_155 = _rdataShiftWire_T_145 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_154; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_156 = _rdataShiftWire_T_136 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_155; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_157 = _rdataShiftWire_T_127 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_156; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_158 = _rdataShiftWire_T_121 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_157; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_159 = _rdataShiftWire_T_112 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_158; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_160 = _rdataShiftWire_T_105 ? rdataReg : _rdataShiftWire_T_159; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_161 = _rdataShiftWire_T_96 ? _rdataShiftWire_T_98 : _rdataShiftWire_T_160; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_162 = _rdataShiftWire_T_90 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_161; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_163 = _rdataShiftWire_T_81 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_162; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_164 = _rdataShiftWire_T_72 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_163; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_165 = _rdataShiftWire_T_66 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_164; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_166 = _rdataShiftWire_T_57 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_165; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_167 = _rdataShiftWire_T_50 ? rdataReg : _rdataShiftWire_T_166; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_168 = _rdataShiftWire_T_43 ? rdataReg : _rdataShiftWire_T_167; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_169 = _rdataShiftWire_T_35 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_168; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_170 = _rdataShiftWire_T_27 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_169; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_171 = _rdataShiftWire_T_21 ? rdataReg : _rdataShiftWire_T_170; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_172 = _rdataShiftWire_T_13 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_171; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] rdataShiftWire = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_172; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_172; // @[src/main/scala/lsu/LSU.scala 147:91]
  wire  _signDataWire_T_1 = wMaskWire == 4'h1; // @[src/main/scala/lsu/LSU.scala 148:36]
  wire [23:0] _signDataWire_T_3 = rdataShiftWire[7] ? 24'hffffff : 24'h0; // @[src/main/scala/lsu/LSU.scala 148:76]
  wire [31:0] _signDataWire_T_6 = {_signDataWire_T_3,rdataShiftWire[7:0]}; // @[src/main/scala/lsu/LSU.scala 148:123]
  wire  _signDataWire_T_7 = wMaskWire == 4'h3; // @[src/main/scala/lsu/LSU.scala 149:36]
  wire [15:0] _signDataWire_T_9 = rdataShiftWire[15] ? 16'hffff : 16'h0; // @[src/main/scala/lsu/LSU.scala 149:76]
  wire [31:0] _signDataWire_T_12 = {_signDataWire_T_9,rdataShiftWire[15:0]}; // @[src/main/scala/lsu/LSU.scala 149:125]
  wire  _signDataWire_T_13 = wMaskWire == 4'hf; // @[src/main/scala/lsu/LSU.scala 150:36]
  wire [31:0] _signDataWire_T_15 = _signDataWire_T_13 ? $signed(_signDataWire_T) : $signed(_signDataWire_T); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T_16 = _signDataWire_T_7 ? $signed(_signDataWire_T_12) : $signed(_signDataWire_T_15); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _memRdDataWire_T_1 = _signDataWire_T_1 ? $signed(_signDataWire_T_6) : $signed(_signDataWire_T_16); // @[src/main/scala/lsu/LSU.scala 164:69]
  wire [31:0] memRdDataWire = sOrUWire ? _memRdDataWire_T_1 : rdataShiftWire; // @[src/main/scala/lsu/LSU.scala 164:38]
  reg [1:0] state; // @[src/main/scala/lsu/LSU.scala 168:26]
  wire  _memEnd_T_2 = io_lsu2Mem_rvalid & io_lsu2Mem_rready & io_lsu2Mem_rlast; // @[src/main/scala/lsu/LSU.scala 170:44]
  wire  memEnd = io_lsu2Mem_bvalid & io_lsu2Mem_bready | _memEnd_T_2; // @[src/main/scala/lsu/LSU.scala 169:59]
  reg  handReg; // @[src/main/scala/lsu/LSU.scala 171:30]
  wire [1:0] _nextState_T_2 = io_exu2LSU_bits_memWR ? 2'h1 : 2'h2; // @[src/main/scala/lsu/LSU.scala 174:12]
  wire [1:0] _nextState_T_3 = io_exu2LSU_bits_memValid ? _nextState_T_2 : 2'h0; // @[src/main/scala/lsu/LSU.scala 173:44]
  wire [1:0] _nextState_T_4 = handReg ? _nextState_T_3 : 2'h0; // @[src/main/scala/lsu/LSU.scala 173:31]
  wire [1:0] _nextState_T_5 = memEnd ? 2'h3 : 2'h1; // @[src/main/scala/lsu/LSU.scala 175:39]
  wire [1:0] _nextState_T_6 = memEnd ? 2'h3 : 2'h2; // @[src/main/scala/lsu/LSU.scala 176:39]
  wire [1:0] _nextState_T_8 = io_lsu2WBU_valid ? 2'h0 : 2'h3; // @[src/main/scala/lsu/LSU.scala 177:39]
  wire  _nextState_T_9 = 2'h0 == state; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire [1:0] _nextState_T_10 = 2'h0 == state ? _nextState_T_4 : 2'h0; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire  _nextState_T_11 = 2'h1 == state; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire [1:0] _nextState_T_12 = 2'h1 == state ? _nextState_T_5 : _nextState_T_10; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire  _nextState_T_13 = 2'h2 == state; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire [1:0] _nextState_T_14 = 2'h2 == state ? _nextState_T_6 : _nextState_T_12; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire [1:0] nextState = 2'h3 == state ? _nextState_T_8 : _nextState_T_14; // @[src/main/scala/lsu/LSU.scala 172:51]
  wire  _wOpWire_T_1 = handReg & io_exu2LSU_bits_memValid; // @[src/main/scala/lsu/LSU.scala 179:32]
  wire  wOpWire = _wOpWire_T_1 & io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 180:37]
  wire  rOpWire = _wOpWire_T_1 & ~io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 182:37]
  wire  _GEN_0 = ~awvalidReg ? 1'h0 : awvalidReg; // @[src/main/scala/lsu/LSU.scala 192:44 194:53 48:42]
  wire  _wvalidReg_T_2 = ~(io_lsu2Mem_wvalid & io_lsu2Mem_wready & io_lsu2Mem_wlast); // @[src/main/scala/lsu/LSU.scala 197:55]
  wire  _GEN_2 = ~wvalidReg ? 1'h0 : wvalidReg; // @[src/main/scala/lsu/LSU.scala 196:43 198:52 60:42]
  wire  _GEN_4 = ~wlastReg ? 1'h0 : wlastReg; // @[src/main/scala/lsu/LSU.scala 200:42 202:51 82:42]
  wire  _GEN_6 = ~arvalidReg ? 1'h0 : arvalidReg; // @[src/main/scala/lsu/LSU.scala 206:44 208:53 98:42]
  wire  _GEN_7 = arvalidReg ? ~(io_lsu2Mem_arvalid & io_lsu2Mem_arready) : _GEN_6; // @[src/main/scala/lsu/LSU.scala 206:44 207:53]
  wire  _GEN_8 = ~rreadyReg ? 1'h0 : rreadyReg; // @[src/main/scala/lsu/LSU.scala 109:42 210:43 212:52]
  wire  _GEN_9 = rreadyReg ? ~_memEnd_T_2 : _GEN_8; // @[src/main/scala/lsu/LSU.scala 210:43 211:52]
  wire [31:0] _rdataReg_T = memEnd ? io_lsu2Mem_rdata : rdataReg; // @[src/main/scala/lsu/LSU.scala 214:31]
  wire  _GEN_11 = _nextState_T_13 ? _GEN_9 : rreadyReg; // @[src/main/scala/lsu/LSU.scala 183:19 109:42]
  wire  _GEN_17 = _nextState_T_11 ? rreadyReg : _GEN_11; // @[src/main/scala/lsu/LSU.scala 183:19 109:42]
  wire  _GEN_23 = _nextState_T_9 ? rOpWire : _GEN_17; // @[src/main/scala/lsu/LSU.scala 183:19 189:25]
  reg [31:0] lsuGetDataCnt; // @[src/main/scala/lsu/LSU.scala 220:44]
  wire  _T_13 = state == 2'h2; // @[src/main/scala/lsu/LSU.scala 221:29]
  wire [31:0] _lsuGetDataCnt_T_1 = lsuGetDataCnt + 32'h1; // @[src/main/scala/lsu/LSU.scala 222:56]
  reg  readyReg; // @[src/main/scala/lsu/LSU.scala 242:31]
  wire  _readyReg_T_4 = io_exu2LSU_valid & io_exu2LSU_ready ? io_lsu2WBU_valid : 1'h1; // @[src/main/scala/lsu/LSU.scala 247:40]
  wire  _GEN_26 = readyReg ? _readyReg_T_4 : readyReg; // @[src/main/scala/lsu/LSU.scala 244:26 242:31 247:34]
  wire  _GEN_27 = ~readyReg ? io_lsu2WBU_valid : _GEN_26; // @[src/main/scala/lsu/LSU.scala 244:26 245:36]
  wire  _io_lsu2WBU_valid_T_3 = handReg & ~io_exu2LSU_bits_memValid; // @[src/main/scala/lsu/LSU.scala 254:18]
  wire [4:0] _io_rd_T_4 = io_exu2LSU_ready & ~io_lsu2WBU_valid ? 5'h0 : io_exu2LSU_bits_inst[11:7]; // @[src/main/scala/lsu/LSU.scala 269:45]
  wire [4:0] _io_rd_T_5 = io_exu2LSU_bits_regWR ? _io_rd_T_4 : 5'h0; // @[src/main/scala/lsu/LSU.scala 269:23]
  wire  _skip_T_6 = io_exu2LSU_bits_aluData >= 32'h10000000 & io_exu2LSU_bits_aluData <= 32'h10002fff; // @[src/main/scala/lsu/LSU.scala 274:55]
  wire  _skip_T_7 = io_exu2LSU_bits_aluData >= 32'h2000000 & io_exu2LSU_bits_aluData <= 32'h200ffff | _skip_T_6; // @[src/main/scala/lsu/LSU.scala 273:87]
  wire  _skip_T_10 = io_exu2LSU_bits_aluData >= 32'h10001000 & io_exu2LSU_bits_aluData <= 32'h10000007; // @[src/main/scala/lsu/LSU.scala 275:55]
  wire  _skip_T_11 = _skip_T_7 | _skip_T_10; // @[src/main/scala/lsu/LSU.scala 274:87]
  wire  _skip_T_14 = io_exu2LSU_bits_aluData >= 32'h21000000 & io_exu2LSU_bits_aluData <= 32'h211fffff; // @[src/main/scala/lsu/LSU.scala 276:55]
  wire  _skip_T_15 = _skip_T_11 | _skip_T_14; // @[src/main/scala/lsu/LSU.scala 275:87]
  AXIAccessFault axiAccessFault ( // @[src/main/scala/lsu/LSU.scala 91:44]
    .valid(axiAccessFault_valid),
    .ready(axiAccessFault_ready),
    .resp(axiAccessFault_resp)
  );
  PerformanceCounter LGDC ( // @[src/main/scala/lsu/LSU.scala 226:57]
    .valid(LGDC_valid),
    .counterType(LGDC_counterType),
    .data(LGDC_data)
  );
  MTrace mTrace ( // @[src/main/scala/lsu/LSU.scala 233:57]
    .data(mTrace_data),
    .addr(mTrace_addr),
    .memop(mTrace_memop),
    .wOrR(mTrace_wOrR),
    .enable(mTrace_enable)
  );
  assign io_exu2LSU_ready = readyReg; // @[src/main/scala/lsu/LSU.scala 252:33]
  assign io_lsu2Mem_awvalid = awvalidReg; // @[src/main/scala/lsu/LSU.scala 49:33]
  assign io_lsu2Mem_awaddr = io_exu2LSU_bits_aluData; // @[src/main/scala/lsu/LSU.scala 50:33]
  assign io_lsu2Mem_awsize = {{1'd0}, io_exu2LSU_bits_memOP[1:0]}; // @[src/main/scala/lsu/LSU.scala 55:33]
  assign io_lsu2Mem_wvalid = wvalidReg; // @[src/main/scala/lsu/LSU.scala 61:33]
  assign io_lsu2Mem_wdata = _io_lsu2Mem_wdata_T_4 ? io_exu2LSU_bits_memData : _io_lsu2Mem_wdata_T_48; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_lsu2Mem_wstrb = _io_lsu2Mem_wstrb_T_3 ? wMaskWire : _io_lsu2Mem_wstrb_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_lsu2Mem_wlast = wlastReg; // @[src/main/scala/lsu/LSU.scala 83:33]
  assign io_lsu2Mem_bready = 1'h1; // @[src/main/scala/lsu/LSU.scala 86:33]
  assign io_lsu2Mem_arvalid = arvalidReg; // @[src/main/scala/lsu/LSU.scala 99:33]
  assign io_lsu2Mem_araddr = io_exu2LSU_bits_aluData; // @[src/main/scala/lsu/LSU.scala 100:33]
  assign io_lsu2Mem_arsize = {{1'd0}, io_exu2LSU_bits_memOP[1:0]}; // @[src/main/scala/lsu/LSU.scala 105:33]
  assign io_lsu2Mem_rready = rreadyReg; // @[src/main/scala/lsu/LSU.scala 110:33]
  assign io_lsu2WBU_valid = state == 2'h3 | _io_lsu2WBU_valid_T_3; // @[src/main/scala/lsu/LSU.scala 253:61]
  assign io_lsu2WBU_bits_pc = io_exu2LSU_bits_pc; // @[src/main/scala/lsu/LSU.scala 256:33]
  assign io_lsu2WBU_bits_memData = sOrUWire ? _memRdDataWire_T_1 : rdataShiftWire; // @[src/main/scala/lsu/LSU.scala 164:38]
  assign io_lsu2WBU_bits_aluData = io_exu2LSU_bits_aluData; // @[src/main/scala/lsu/LSU.scala 258:33]
  assign io_lsu2WBU_bits_csrWData = io_exu2LSU_bits_csrWData; // @[src/main/scala/lsu/LSU.scala 259:33]
  assign io_lsu2WBU_bits_csrData = io_exu2LSU_bits_csrData; // @[src/main/scala/lsu/LSU.scala 260:33]
  assign io_lsu2WBU_bits_inst = io_exu2LSU_bits_inst; // @[src/main/scala/lsu/LSU.scala 262:33]
  assign io_lsu2WBU_bits_regWR = io_exu2LSU_bits_regWR; // @[src/main/scala/lsu/LSU.scala 263:33]
  assign io_lsu2WBU_bits_toReg = io_exu2LSU_bits_toReg; // @[src/main/scala/lsu/LSU.scala 264:33]
  assign io_lsu2WBU_bits_ecall = io_exu2LSU_bits_ecall; // @[src/main/scala/lsu/LSU.scala 265:33]
  assign io_lsu2WBU_bits_csrEn = io_exu2LSU_bits_csrEn; // @[src/main/scala/lsu/LSU.scala 266:33]
  assign io_lsu2WBU_bits_csrWr = io_exu2LSU_bits_csrWr; // @[src/main/scala/lsu/LSU.scala 267:33]
  assign io_lsu2WBU_bits_fencei = io_exu2LSU_bits_memOP == 3'h7; // @[src/main/scala/lsu/LSU.scala 268:47]
  assign io_lsu2WBU_bits_skip = io_exu2LSU_bits_memValid & _skip_T_15; // @[src/main/scala/lsu/LSU.scala 272:52]
  assign io_rd = _io_rd_T_5[3:0]; // @[src/main/scala/lsu/LSU.scala 269:17]
  assign io_bypassValid = ~(io_exu2LSU_bits_toReg == 2'h1 & (_T_13 | nextState == 2'h2)); // @[src/main/scala/lsu/LSU.scala 270:52]
  assign axiAccessFault_valid = io_lsu2Mem_bvalid; // @[src/main/scala/lsu/LSU.scala 93:41]
  assign axiAccessFault_ready = 1'h1; // @[src/main/scala/lsu/LSU.scala 92:41]
  assign axiAccessFault_resp = io_lsu2Mem_bresp; // @[src/main/scala/lsu/LSU.scala 94:41]
  assign LGDC_valid = io_lsu2Mem_bvalid & io_lsu2Mem_bready | _memEnd_T_2; // @[src/main/scala/lsu/LSU.scala 169:59]
  assign LGDC_counterType = 32'h7; // @[src/main/scala/lsu/LSU.scala 228:41]
  assign LGDC_data = lsuGetDataCnt + 32'h1; // @[src/main/scala/lsu/LSU.scala 229:57]
  assign mTrace_data = io_exu2LSU_bits_memWR ? io_lsu2Mem_wdata : memRdDataWire; // @[src/main/scala/lsu/LSU.scala 234:47]
  assign mTrace_addr = io_exu2LSU_bits_aluData; // @[src/main/scala/lsu/LSU.scala 235:41]
  assign mTrace_memop = io_exu2LSU_bits_memOP[1:0]; // @[src/main/scala/lsu/LSU.scala 236:53]
  assign mTrace_wOrR = io_exu2LSU_bits_memWR; // @[src/main/scala/lsu/LSU.scala 237:54]
  assign mTrace_enable = io_lsu2Mem_bvalid & io_lsu2Mem_bready | _memEnd_T_2; // @[src/main/scala/lsu/LSU.scala 169:59]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 48:42]
      awvalidReg <= 1'h0; // @[src/main/scala/lsu/LSU.scala 48:42]
    end else if (_nextState_T_9) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      awvalidReg <= wOpWire; // @[src/main/scala/lsu/LSU.scala 185:25]
    end else if (_nextState_T_11) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      if (awvalidReg) begin // @[src/main/scala/lsu/LSU.scala 192:44]
        awvalidReg <= ~(io_lsu2Mem_awvalid & io_lsu2Mem_awready); // @[src/main/scala/lsu/LSU.scala 193:53]
      end else begin
        awvalidReg <= _GEN_0;
      end
    end
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 60:42]
      wvalidReg <= 1'h0; // @[src/main/scala/lsu/LSU.scala 60:42]
    end else if (_nextState_T_9) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      wvalidReg <= wOpWire; // @[src/main/scala/lsu/LSU.scala 186:25]
    end else if (_nextState_T_11) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      if (wvalidReg) begin // @[src/main/scala/lsu/LSU.scala 196:43]
        wvalidReg <= ~(io_lsu2Mem_wvalid & io_lsu2Mem_wready & io_lsu2Mem_wlast); // @[src/main/scala/lsu/LSU.scala 197:52]
      end else begin
        wvalidReg <= _GEN_2;
      end
    end
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 82:42]
      wlastReg <= 1'h0; // @[src/main/scala/lsu/LSU.scala 82:42]
    end else if (_nextState_T_9) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      wlastReg <= wOpWire; // @[src/main/scala/lsu/LSU.scala 187:25]
    end else if (_nextState_T_11) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      if (wlastReg) begin // @[src/main/scala/lsu/LSU.scala 200:42]
        wlastReg <= _wvalidReg_T_2; // @[src/main/scala/lsu/LSU.scala 201:51]
      end else begin
        wlastReg <= _GEN_4;
      end
    end
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 98:42]
      arvalidReg <= 1'h0; // @[src/main/scala/lsu/LSU.scala 98:42]
    end else if (_nextState_T_9) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      arvalidReg <= rOpWire; // @[src/main/scala/lsu/LSU.scala 188:25]
    end else if (!(_nextState_T_11)) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      if (_nextState_T_13) begin // @[src/main/scala/lsu/LSU.scala 183:19]
        arvalidReg <= _GEN_7;
      end
    end
    rreadyReg <= reset | _GEN_23; // @[src/main/scala/lsu/LSU.scala 109:{42,42}]
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 114:42]
      rdataReg <= 32'h0; // @[src/main/scala/lsu/LSU.scala 114:42]
    end else if (!(_nextState_T_9)) begin // @[src/main/scala/lsu/LSU.scala 183:19]
      if (!(_nextState_T_11)) begin // @[src/main/scala/lsu/LSU.scala 183:19]
        if (_nextState_T_13) begin // @[src/main/scala/lsu/LSU.scala 183:19]
          rdataReg <= _rdataReg_T; // @[src/main/scala/lsu/LSU.scala 214:25]
        end
      end
    end
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 168:26]
      state <= 2'h0; // @[src/main/scala/lsu/LSU.scala 168:26]
    end else if (2'h3 == state) begin // @[src/main/scala/lsu/LSU.scala 172:51]
      if (io_lsu2WBU_valid) begin // @[src/main/scala/lsu/LSU.scala 177:39]
        state <= 2'h0;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/lsu/LSU.scala 172:51]
      if (memEnd) begin // @[src/main/scala/lsu/LSU.scala 176:39]
        state <= 2'h3;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/lsu/LSU.scala 172:51]
      state <= _nextState_T_5;
    end else begin
      state <= _nextState_T_10;
    end
    handReg <= io_exu2LSU_ready & io_exu2LSU_valid; // @[src/main/scala/lsu/LSU.scala 171:48]
    if (reset) begin // @[src/main/scala/lsu/LSU.scala 220:44]
      lsuGetDataCnt <= 32'h0; // @[src/main/scala/lsu/LSU.scala 220:44]
    end else if (state == 2'h2) begin // @[src/main/scala/lsu/LSU.scala 221:41]
      lsuGetDataCnt <= _lsuGetDataCnt_T_1; // @[src/main/scala/lsu/LSU.scala 222:39]
    end else begin
      lsuGetDataCnt <= 32'h0; // @[src/main/scala/lsu/LSU.scala 224:39]
    end
    readyReg <= reset | _GEN_27; // @[src/main/scala/lsu/LSU.scala 242:{31,31}]
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
  awvalidReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  wvalidReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wlastReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  arvalidReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  rreadyReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rdataReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  state = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  handReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  lsuGetDataCnt = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  readyReg = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
