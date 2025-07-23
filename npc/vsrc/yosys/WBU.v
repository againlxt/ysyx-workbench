module WBU(
  input         clock,
  input         reset,
  output        io_exu2WBU_ready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_valid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_pc, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_memData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_aluData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_csrWData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_csrData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_immData, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_rs1Data, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_exu2WBU_bits_inst, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_regWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_memWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_memValid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [2:0]  io_exu2WBU_bits_memOP, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [1:0]  io_exu2WBU_bits_toReg, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [3:0]  io_exu2WBU_bits_branchCtr, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_less, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_zero, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_ecall, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_csrEn, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_exu2WBU_bits_csrWr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2CSR_pc, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2CSR_csrWData, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [11:0] io_wbu2CSR_csr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_ecall, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_csrEn, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2CSR_csrWr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [3:0]  io_wbu2BaseReg_rdIndex, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2BaseReg_data, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2BaseReg_regWR, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_awready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_awvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_awaddr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [2:0]  io_wbu2Mem_awsize, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_wready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_wvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_wdata, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [3:0]  io_wbu2Mem_wstrb, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_wlast, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_bready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_bvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_arready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_arvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2Mem_araddr, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [2:0]  io_wbu2Mem_arsize, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2Mem_rready, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_rvalid, // @[src/main/scala/wbu/WBU.scala 18:20]
  input  [31:0] io_wbu2Mem_rdata, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2Mem_rlast, // @[src/main/scala/wbu/WBU.scala 18:20]
  input         io_wbu2PC_ready, // @[src/main/scala/wbu/WBU.scala 18:20]
  output        io_wbu2PC_valid, // @[src/main/scala/wbu/WBU.scala 18:20]
  output [31:0] io_wbu2PC_bits_nextPC // @[src/main/scala/wbu/WBU.scala 18:20]
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] branchCond_io_branch; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  branchCond_io_less; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  branchCond_io_zero; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire [1:0] branchCond_io_pcASrc; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire [1:0] branchCond_io_pcBSrc; // @[src/main/scala/wbu/WBU.scala 112:41]
  wire  resetnWire = ~reset; // @[src/main/scala/wbu/WBU.scala 26:35]
  reg [31:0] pcReg; // @[src/main/scala/wbu/WBU.scala 28:42]
  reg [31:0] memDataReg; // @[src/main/scala/wbu/WBU.scala 29:42]
  reg [31:0] aluDataReg; // @[src/main/scala/wbu/WBU.scala 30:42]
  reg [31:0] csrWDataReg; // @[src/main/scala/wbu/WBU.scala 31:42]
  reg [31:0] csrDataReg; // @[src/main/scala/wbu/WBU.scala 32:42]
  reg [31:0] immDataReg; // @[src/main/scala/wbu/WBU.scala 33:38]
  reg [31:0] rs1DataReg; // @[src/main/scala/wbu/WBU.scala 34:38]
  reg [31:0] instReg; // @[src/main/scala/wbu/WBU.scala 35:42]
  reg  regWRReg; // @[src/main/scala/wbu/WBU.scala 37:34]
  reg  memWRReg; // @[src/main/scala/wbu/WBU.scala 38:42]
  reg [2:0] memOPReg; // @[src/main/scala/wbu/WBU.scala 40:42]
  reg [1:0] toRegReg; // @[src/main/scala/wbu/WBU.scala 41:42]
  reg [3:0] branchCtrReg; // @[src/main/scala/wbu/WBU.scala 42:42]
  reg  lessReg; // @[src/main/scala/wbu/WBU.scala 43:42]
  reg  zeroReg; // @[src/main/scala/wbu/WBU.scala 44:42]
  reg  ecallReg; // @[src/main/scala/wbu/WBU.scala 45:42]
  reg  csrEnReg; // @[src/main/scala/wbu/WBU.scala 46:42]
  reg  csrWrReg; // @[src/main/scala/wbu/WBU.scala 47:42]
  reg  ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 69:30]
  reg  validPC2Reg; // @[src/main/scala/wbu/WBU.scala 71:34]
  wire  _T = io_exu2WBU_ready & io_exu2WBU_valid; // @[src/main/scala/wbu/WBU.scala 75:31]
  wire  _wMaskWire_T = memOPReg == 3'h0; // @[src/main/scala/wbu/WBU.scala 97:28]
  wire  _wMaskWire_T_1 = memOPReg == 3'h1; // @[src/main/scala/wbu/WBU.scala 98:28]
  wire  _wMaskWire_T_2 = memOPReg == 3'h2; // @[src/main/scala/wbu/WBU.scala 99:28]
  wire  _wMaskWire_T_3 = memOPReg == 3'h5; // @[src/main/scala/wbu/WBU.scala 100:28]
  wire [3:0] _wMaskWire_T_6 = _wMaskWire_T_3 ? 4'h3 : 4'h1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _wMaskWire_T_7 = _wMaskWire_T_2 ? 4'hf : _wMaskWire_T_6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _wMaskWire_T_8 = _wMaskWire_T_1 ? 4'h3 : _wMaskWire_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] wMaskWire = _wMaskWire_T ? 4'h1 : _wMaskWire_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  sOrUWire = _wMaskWire_T | (_wMaskWire_T_1 | _wMaskWire_T_2); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  awvalidReg; // @[src/main/scala/wbu/WBU.scala 124:42]
  reg  wvalidReg; // @[src/main/scala/wbu/WBU.scala 136:42]
  wire  _io_wbu2Mem_wdata_T_1 = aluDataReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 140:43]
  wire  _io_wbu2Mem_wdata_T_3 = memOPReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 140:69]
  wire  _io_wbu2Mem_wdata_T_4 = aluDataReg[1:0] == 2'h0 & memOPReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 140:51]
  wire  _io_wbu2Mem_wdata_T_8 = memOPReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 141:69]
  wire  _io_wbu2Mem_wdata_T_9 = _io_wbu2Mem_wdata_T_1 & memOPReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 141:51]
  wire [31:0] _io_wbu2Mem_wdata_T_11 = {16'h0,memDataReg[15:0]}; // @[src/main/scala/wbu/WBU.scala 141:95]
  wire  _io_wbu2Mem_wdata_T_15 = memOPReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 142:69]
  wire  _io_wbu2Mem_wdata_T_16 = _io_wbu2Mem_wdata_T_1 & memOPReg[1:0] == 2'h0; // @[src/main/scala/wbu/WBU.scala 142:51]
  wire [31:0] _io_wbu2Mem_wdata_T_18 = {24'h0,memDataReg[7:0]}; // @[src/main/scala/wbu/WBU.scala 142:95]
  wire  _io_wbu2Mem_wdata_T_20 = aluDataReg[1:0] == 2'h1; // @[src/main/scala/wbu/WBU.scala 143:43]
  wire [31:0] _io_wbu2Mem_wdata_T_23 = {16'h0,memDataReg[7:0],8'h0}; // @[src/main/scala/wbu/WBU.scala 143:71]
  wire  _io_wbu2Mem_wdata_T_25 = aluDataReg[1:0] == 2'h2; // @[src/main/scala/wbu/WBU.scala 144:43]
  wire  _io_wbu2Mem_wdata_T_28 = aluDataReg[1:0] == 2'h2 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 144:51]
  wire [31:0] _io_wbu2Mem_wdata_T_31 = {8'h0,memDataReg[7:0],16'h0}; // @[src/main/scala/wbu/WBU.scala 144:95]
  wire  _io_wbu2Mem_wdata_T_36 = _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 145:51]
  wire [31:0] _io_wbu2Mem_wdata_T_38 = {memDataReg[15:0],16'h0}; // @[src/main/scala/wbu/WBU.scala 145:95]
  wire  _io_wbu2Mem_wdata_T_40 = aluDataReg[1:0] == 2'h3; // @[src/main/scala/wbu/WBU.scala 146:43]
  wire [31:0] _io_wbu2Mem_wdata_T_42 = {memDataReg[7:0],24'h0}; // @[src/main/scala/wbu/WBU.scala 146:71]
  wire [31:0] _io_wbu2Mem_wdata_T_43 = _io_wbu2Mem_wdata_T_40 ? _io_wbu2Mem_wdata_T_42 : memDataReg; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_44 = _io_wbu2Mem_wdata_T_36 ? _io_wbu2Mem_wdata_T_38 : _io_wbu2Mem_wdata_T_43; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_45 = _io_wbu2Mem_wdata_T_28 ? _io_wbu2Mem_wdata_T_31 : _io_wbu2Mem_wdata_T_44; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_46 = _io_wbu2Mem_wdata_T_20 ? _io_wbu2Mem_wdata_T_23 : _io_wbu2Mem_wdata_T_45; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_47 = _io_wbu2Mem_wdata_T_16 ? _io_wbu2Mem_wdata_T_18 : _io_wbu2Mem_wdata_T_46; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2Mem_wdata_T_48 = _io_wbu2Mem_wdata_T_9 ? _io_wbu2Mem_wdata_T_11 : _io_wbu2Mem_wdata_T_47; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2Mem_wstrb_T_3 = _io_wbu2Mem_wdata_T_1 & memWRReg; // @[src/main/scala/wbu/WBU.scala 149:51]
  wire  _io_wbu2Mem_wstrb_T_7 = _io_wbu2Mem_wdata_T_20 & memWRReg; // @[src/main/scala/wbu/WBU.scala 150:51]
  wire [3:0] _io_wbu2Mem_wstrb_T_9 = {wMaskWire[2:0],1'h0}; // @[src/main/scala/wbu/WBU.scala 150:87]
  wire  _io_wbu2Mem_wstrb_T_13 = _io_wbu2Mem_wdata_T_25 & memWRReg; // @[src/main/scala/wbu/WBU.scala 151:51]
  wire [3:0] _io_wbu2Mem_wstrb_T_15 = {wMaskWire[1:0],2'h0}; // @[src/main/scala/wbu/WBU.scala 151:87]
  wire  _io_wbu2Mem_wstrb_T_19 = _io_wbu2Mem_wdata_T_40 & memWRReg; // @[src/main/scala/wbu/WBU.scala 152:51]
  wire [3:0] _io_wbu2Mem_wstrb_T_21 = {wMaskWire[0],3'h0}; // @[src/main/scala/wbu/WBU.scala 152:87]
  wire [3:0] _io_wbu2Mem_wstrb_T_22 = _io_wbu2Mem_wstrb_T_19 ? _io_wbu2Mem_wstrb_T_21 : wMaskWire; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_wbu2Mem_wstrb_T_23 = _io_wbu2Mem_wstrb_T_13 ? _io_wbu2Mem_wstrb_T_15 : _io_wbu2Mem_wstrb_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] _io_wbu2Mem_wstrb_T_24 = _io_wbu2Mem_wstrb_T_7 ? _io_wbu2Mem_wstrb_T_9 : _io_wbu2Mem_wstrb_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg  wlastReg; // @[src/main/scala/wbu/WBU.scala 158:42]
  reg  breadyReg; // @[src/main/scala/wbu/WBU.scala 161:42]
  reg  arvalidReg; // @[src/main/scala/wbu/WBU.scala 168:42]
  reg  rreadyReg; // @[src/main/scala/wbu/WBU.scala 179:42]
  wire  _rdataShiftWire_T_2 = aluDataReg <= 32'h20000fff & aluDataReg >= 32'h20000000; // @[src/main/scala/wbu/WBU.scala 189:57]
  wire  _rdataShiftWire_T_5 = aluDataReg <= 32'h20000fff & aluDataReg >= 32'h20000000 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 189:91]
  wire [31:0] _rdataShiftWire_T_7 = {24'h0,io_wbu2Mem_rdata[7:0]}; // @[src/main/scala/wbu/WBU.scala 189:135]
  wire  _rdataShiftWire_T_13 = _rdataShiftWire_T_2 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 190:91]
  wire [31:0] _rdataShiftWire_T_15 = {16'h0,io_wbu2Mem_rdata[15:0]}; // @[src/main/scala/wbu/WBU.scala 190:135]
  wire  _rdataShiftWire_T_21 = _rdataShiftWire_T_2 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 191:91]
  wire  _rdataShiftWire_T_24 = aluDataReg <= 32'h3fffffff & aluDataReg >= 32'h30000000; // @[src/main/scala/wbu/WBU.scala 194:57]
  wire  _rdataShiftWire_T_27 = aluDataReg <= 32'h3fffffff & aluDataReg >= 32'h30000000 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 194:91]
  wire  _rdataShiftWire_T_35 = _rdataShiftWire_T_24 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 195:91]
  wire  _rdataShiftWire_T_43 = _rdataShiftWire_T_24 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 196:91]
  wire  _rdataShiftWire_T_44 = aluDataReg >= 32'h80000000; // @[src/main/scala/wbu/WBU.scala 199:39]
  wire  _rdataShiftWire_T_47 = aluDataReg >= 32'h80000000 & _io_wbu2Mem_wdata_T_1; // @[src/main/scala/wbu/WBU.scala 199:57]
  wire  _rdataShiftWire_T_50 = aluDataReg >= 32'h80000000 & _io_wbu2Mem_wdata_T_1 & _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 199:85]
  wire  _rdataShiftWire_T_57 = _rdataShiftWire_T_47 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 200:85]
  wire  _rdataShiftWire_T_66 = _rdataShiftWire_T_47 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 201:85]
  wire  _rdataShiftWire_T_72 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_20; // @[src/main/scala/wbu/WBU.scala 202:57]
  wire [31:0] _rdataShiftWire_T_74 = {24'h0,io_wbu2Mem_rdata[15:8]}; // @[src/main/scala/wbu/WBU.scala 202:103]
  wire  _rdataShiftWire_T_78 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_25; // @[src/main/scala/wbu/WBU.scala 203:57]
  wire  _rdataShiftWire_T_81 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 203:85]
  wire [31:0] _rdataShiftWire_T_83 = {24'h0,io_wbu2Mem_rdata[23:16]}; // @[src/main/scala/wbu/WBU.scala 203:127]
  wire  _rdataShiftWire_T_90 = _rdataShiftWire_T_78 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 204:85]
  wire [31:0] _rdataShiftWire_T_92 = {16'h0,io_wbu2Mem_rdata[31:16]}; // @[src/main/scala/wbu/WBU.scala 204:127]
  wire  _rdataShiftWire_T_96 = _rdataShiftWire_T_44 & _io_wbu2Mem_wdata_T_40; // @[src/main/scala/wbu/WBU.scala 205:57]
  wire [31:0] _rdataShiftWire_T_98 = {24'h0,io_wbu2Mem_rdata[31:24]}; // @[src/main/scala/wbu/WBU.scala 205:103]
  wire  _rdataShiftWire_T_101 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000; // @[src/main/scala/wbu/WBU.scala 208:57]
  wire  _rdataShiftWire_T_104 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000 & _io_wbu2Mem_wdata_T_1; // @[src/main/scala/wbu/WBU.scala 208:90]
  wire  _rdataShiftWire_T_107 = aluDataReg <= 32'hf001fff & aluDataReg >= 32'hf00000 & _io_wbu2Mem_wdata_T_1 &
    _io_wbu2Mem_wdata_T_3; // @[src/main/scala/wbu/WBU.scala 208:118]
  wire  _rdataShiftWire_T_116 = _rdataShiftWire_T_104 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 209:118]
  wire  _rdataShiftWire_T_127 = _rdataShiftWire_T_104 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 210:118]
  wire  _rdataShiftWire_T_135 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_20; // @[src/main/scala/wbu/WBU.scala 211:90]
  wire  _rdataShiftWire_T_143 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_25; // @[src/main/scala/wbu/WBU.scala 212:90]
  wire  _rdataShiftWire_T_146 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_25 & _io_wbu2Mem_wdata_T_15; // @[src/main/scala/wbu/WBU.scala 212:118]
  wire  _rdataShiftWire_T_157 = _rdataShiftWire_T_143 & _io_wbu2Mem_wdata_T_8; // @[src/main/scala/wbu/WBU.scala 213:118]
  wire  _rdataShiftWire_T_165 = _rdataShiftWire_T_101 & _io_wbu2Mem_wdata_T_40; // @[src/main/scala/wbu/WBU.scala 214:90]
  wire [31:0] _rdataShiftWire_T_168 = _rdataShiftWire_T_165 ? _rdataShiftWire_T_98 : io_wbu2Mem_rdata; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_169 = _rdataShiftWire_T_157 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_168; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_170 = _rdataShiftWire_T_146 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_169; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_171 = _rdataShiftWire_T_135 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_170; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_172 = _rdataShiftWire_T_127 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_171; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_173 = _rdataShiftWire_T_116 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_172; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_174 = _rdataShiftWire_T_107 ? io_wbu2Mem_rdata : _rdataShiftWire_T_173; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_175 = _rdataShiftWire_T_96 ? _rdataShiftWire_T_98 : _rdataShiftWire_T_174; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_176 = _rdataShiftWire_T_90 ? _rdataShiftWire_T_92 : _rdataShiftWire_T_175; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_177 = _rdataShiftWire_T_81 ? _rdataShiftWire_T_83 : _rdataShiftWire_T_176; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_178 = _rdataShiftWire_T_72 ? _rdataShiftWire_T_74 : _rdataShiftWire_T_177; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_179 = _rdataShiftWire_T_66 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_178; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_180 = _rdataShiftWire_T_57 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_179; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_181 = _rdataShiftWire_T_50 ? io_wbu2Mem_rdata : _rdataShiftWire_T_180; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_182 = _rdataShiftWire_T_43 ? io_wbu2Mem_rdata : _rdataShiftWire_T_181; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_183 = _rdataShiftWire_T_35 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_182; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_184 = _rdataShiftWire_T_27 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_183; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_185 = _rdataShiftWire_T_21 ? io_wbu2Mem_rdata : _rdataShiftWire_T_184; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _rdataShiftWire_T_186 = _rdataShiftWire_T_13 ? _rdataShiftWire_T_15 : _rdataShiftWire_T_185; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] rdataShiftWire = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_186; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T = _rdataShiftWire_T_5 ? _rdataShiftWire_T_7 : _rdataShiftWire_T_186; // @[src/main/scala/wbu/WBU.scala 216:91]
  wire  _signDataWire_T_1 = wMaskWire == 4'h1; // @[src/main/scala/wbu/WBU.scala 217:36]
  wire [23:0] _signDataWire_T_3 = rdataShiftWire[7] ? 24'hffffff : 24'h0; // @[src/main/scala/wbu/WBU.scala 217:76]
  wire [31:0] _signDataWire_T_6 = {_signDataWire_T_3,rdataShiftWire[7:0]}; // @[src/main/scala/wbu/WBU.scala 217:123]
  wire  _signDataWire_T_7 = wMaskWire == 4'h3; // @[src/main/scala/wbu/WBU.scala 218:36]
  wire [15:0] _signDataWire_T_9 = rdataShiftWire[15] ? 16'hffff : 16'h0; // @[src/main/scala/wbu/WBU.scala 218:76]
  wire [31:0] _signDataWire_T_12 = {_signDataWire_T_9,rdataShiftWire[15:0]}; // @[src/main/scala/wbu/WBU.scala 218:125]
  wire  _signDataWire_T_13 = wMaskWire == 4'hf; // @[src/main/scala/wbu/WBU.scala 219:36]
  wire [31:0] _signDataWire_T_15 = _signDataWire_T_13 ? $signed(_signDataWire_T) : $signed(_signDataWire_T); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _signDataWire_T_16 = _signDataWire_T_7 ? $signed(_signDataWire_T_12) : $signed(_signDataWire_T_15); // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  reg [31:0] memRdDataReg; // @[src/main/scala/wbu/WBU.scala 233:42]
  wire [31:0] _memRdDataWire_T_1 = _signDataWire_T_1 ? $signed(_signDataWire_T_6) : $signed(_signDataWire_T_16); // @[src/main/scala/wbu/WBU.scala 234:69]
  wire  _T_1 = ~resetnWire; // @[src/main/scala/wbu/WBU.scala 237:14]
  wire  _T_2 = io_wbu2Mem_rvalid & io_wbu2Mem_rready; // @[src/main/scala/wbu/WBU.scala 239:32]
  wire  _T_18 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR; // @[src/main/scala/wbu/WBU.scala 247:93]
  wire  _GEN_21 = io_wbu2Mem_awready & io_wbu2Mem_awvalid ? 1'h0 : awvalidReg; // @[src/main/scala/wbu/WBU.scala 249:56 250:33 124:42]
  wire  _GEN_22 = _T & io_exu2WBU_bits_memValid & io_exu2WBU_bits_memWR | _GEN_21; // @[src/main/scala/wbu/WBU.scala 247:126 248:33]
  wire  _GEN_24 = io_wbu2Mem_wready & io_wbu2Mem_wvalid & io_wbu2Mem_wlast ? 1'h0 : wvalidReg; // @[src/main/scala/wbu/WBU.scala 259:73 260:33 136:42]
  wire  _GEN_25 = io_wbu2Mem_wready & io_wbu2Mem_wvalid & io_wbu2Mem_wlast ? 1'h0 : wlastReg; // @[src/main/scala/wbu/WBU.scala 259:73 261:33 158:42]
  wire  _GEN_26 = _T_18 | _GEN_24; // @[src/main/scala/wbu/WBU.scala 256:126 257:33]
  wire  _GEN_27 = _T_18 | _GEN_25; // @[src/main/scala/wbu/WBU.scala 256:126 258:33]
  wire  _GEN_30 = io_wbu2Mem_bvalid | breadyReg; // @[src/main/scala/wbu/WBU.scala 274:33 275:33 161:42]
  wire  _GEN_31 = io_wbu2Mem_bvalid & io_wbu2Mem_bready ? 1'h0 : _GEN_30; // @[src/main/scala/wbu/WBU.scala 272:54 273:33]
  wire  _GEN_32 = _T_1 | _GEN_31; // @[src/main/scala/wbu/WBU.scala 270:34 271:33]
  wire  _GEN_33 = io_wbu2Mem_arvalid & io_wbu2Mem_arready ? 1'h0 : arvalidReg; // @[src/main/scala/wbu/WBU.scala 282:63 283:33 168:42]
  wire  _GEN_34 = _T & (io_exu2WBU_bits_memValid & ~io_exu2WBU_bits_memWR) | _GEN_33; // @[src/main/scala/wbu/WBU.scala 280:131 281:33]
  wire  _GEN_36 = io_wbu2Mem_rvalid | rreadyReg; // @[src/main/scala/wbu/WBU.scala 290:33 291:33 179:42]
  wire  _GEN_37 = _T_2 & io_wbu2Mem_rlast & io_exu2WBU_bits_memValid ? 1'h0 : _GEN_36; // @[src/main/scala/wbu/WBU.scala 288:109 289:33]
  wire  _GEN_38 = _T_1 | _GEN_37; // @[src/main/scala/wbu/WBU.scala 286:34 287:33]
  reg [1:0] state; // @[src/main/scala/wbu/WBU.scala 296:28]
  wire  memEnd = io_wbu2Mem_wready & wvalidReg | rreadyReg & io_wbu2Mem_rvalid; // @[src/main/scala/wbu/WBU.scala 297:48]
  wire [1:0] _state_T_1 = reset ? 2'h0 : 2'h1; // @[src/main/scala/wbu/WBU.scala 299:55]
  wire [1:0] _state_T_4 = io_exu2WBU_bits_memValid ? 2'h2 : 2'h3; // @[src/main/scala/wbu/WBU.scala 300:95]
  wire [1:0] _state_T_5 = io_exu2WBU_valid ? _state_T_4 : 2'h1; // @[src/main/scala/wbu/WBU.scala 300:73]
  wire [1:0] _state_T_6 = reset ? 2'h0 : _state_T_5; // @[src/main/scala/wbu/WBU.scala 300:47]
  wire [1:0] _state_T_8 = memEnd ? 2'h3 : 2'h2; // @[src/main/scala/wbu/WBU.scala 301:81]
  wire  _GEN_39 = state == 2'h3 ? 1'h0 : ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 314:51 315:33 69:30]
  wire  _GEN_40 = state == 2'h3 | validPC2Reg; // @[src/main/scala/wbu/WBU.scala 314:51 316:33 71:34]
  wire  _GEN_41 = state == 2'h2 ? 1'h0 : _GEN_39; // @[src/main/scala/wbu/WBU.scala 311:42 312:33]
  wire  _GEN_43 = state == 2'h1 | _GEN_41; // @[src/main/scala/wbu/WBU.scala 308:49 309:33]
  wire  _GEN_45 = state == 2'h0 | _GEN_43; // @[src/main/scala/wbu/WBU.scala 305:32 306:33]
  wire  _io_wbu2BaseReg_data_T = toRegReg == 2'h0; // @[src/main/scala/wbu/WBU.scala 356:20]
  wire  _io_wbu2BaseReg_data_T_1 = toRegReg == 2'h1; // @[src/main/scala/wbu/WBU.scala 357:28]
  wire  _io_wbu2BaseReg_data_T_2 = toRegReg == 2'h2; // @[src/main/scala/wbu/WBU.scala 358:28]
  wire [31:0] _io_wbu2BaseReg_data_T_3 = _io_wbu2BaseReg_data_T_2 ? csrDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2BaseReg_data_T_4 = _io_wbu2BaseReg_data_T_1 ? memRdDataReg : _io_wbu2BaseReg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T = branchCond_io_pcASrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 364:21]
  wire  _io_wbu2PC_bits_nextPC_T_1 = branchCond_io_pcASrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 365:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_4 = _io_wbu2PC_bits_nextPC_T_1 ? immDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_5 = _io_wbu2PC_bits_nextPC_T ? 32'h4 : _io_wbu2PC_bits_nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_wbu2PC_bits_nextPC_T_6 = branchCond_io_pcBSrc == 2'h0; // @[src/main/scala/wbu/WBU.scala 368:21]
  wire  _io_wbu2PC_bits_nextPC_T_7 = branchCond_io_pcBSrc == 2'h1; // @[src/main/scala/wbu/WBU.scala 369:29]
  wire  _io_wbu2PC_bits_nextPC_T_8 = branchCond_io_pcBSrc == 2'h2; // @[src/main/scala/wbu/WBU.scala 370:29]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_9 = _io_wbu2PC_bits_nextPC_T_8 ? csrWDataReg : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_10 = _io_wbu2PC_bits_nextPC_T_7 ? rs1DataReg : _io_wbu2PC_bits_nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_wbu2PC_bits_nextPC_T_11 = _io_wbu2PC_bits_nextPC_T_6 ? pcReg : _io_wbu2PC_bits_nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  BranchCond branchCond ( // @[src/main/scala/wbu/WBU.scala 112:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  assign io_exu2WBU_ready = ready2EXUReg; // @[src/main/scala/wbu/WBU.scala 70:40]
  assign io_wbu2CSR_pc = pcReg; // @[src/main/scala/wbu/WBU.scala 348:25]
  assign io_wbu2CSR_csrWData = csrWDataReg; // @[src/main/scala/wbu/WBU.scala 349:25]
  assign io_wbu2CSR_csr = instReg[31:20]; // @[src/main/scala/wbu/WBU.scala 350:36]
  assign io_wbu2CSR_ecall = ecallReg; // @[src/main/scala/wbu/WBU.scala 351:25]
  assign io_wbu2CSR_csrEn = csrEnReg; // @[src/main/scala/wbu/WBU.scala 352:25]
  assign io_wbu2CSR_csrWr = csrWrReg; // @[src/main/scala/wbu/WBU.scala 353:25]
  assign io_wbu2BaseReg_rdIndex = instReg[10:7]; // @[src/main/scala/wbu/WBU.scala 360:29]
  assign io_wbu2BaseReg_data = _io_wbu2BaseReg_data_T ? aluDataReg : _io_wbu2BaseReg_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2BaseReg_regWR = regWRReg; // @[src/main/scala/wbu/WBU.scala 361:29]
  assign io_wbu2Mem_awvalid = awvalidReg; // @[src/main/scala/wbu/WBU.scala 125:33]
  assign io_wbu2Mem_awaddr = aluDataReg; // @[src/main/scala/wbu/WBU.scala 126:33]
  assign io_wbu2Mem_awsize = {{1'd0}, memOPReg[1:0]}; // @[src/main/scala/wbu/WBU.scala 131:33]
  assign io_wbu2Mem_wvalid = wvalidReg; // @[src/main/scala/wbu/WBU.scala 137:33]
  assign io_wbu2Mem_wdata = _io_wbu2Mem_wdata_T_4 ? memDataReg : _io_wbu2Mem_wdata_T_48; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2Mem_wstrb = _io_wbu2Mem_wstrb_T_3 ? wMaskWire : _io_wbu2Mem_wstrb_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_wbu2Mem_wlast = wlastReg; // @[src/main/scala/wbu/WBU.scala 159:33]
  assign io_wbu2Mem_bready = breadyReg; // @[src/main/scala/wbu/WBU.scala 162:33]
  assign io_wbu2Mem_arvalid = arvalidReg; // @[src/main/scala/wbu/WBU.scala 169:33]
  assign io_wbu2Mem_araddr = aluDataReg; // @[src/main/scala/wbu/WBU.scala 170:33]
  assign io_wbu2Mem_arsize = {{1'd0}, memOPReg[1:0]}; // @[src/main/scala/wbu/WBU.scala 175:33]
  assign io_wbu2Mem_rready = rreadyReg; // @[src/main/scala/wbu/WBU.scala 180:33]
  assign io_wbu2PC_valid = validPC2Reg; // @[src/main/scala/wbu/WBU.scala 72:43]
  assign io_wbu2PC_bits_nextPC = _io_wbu2PC_bits_nextPC_T_5 + _io_wbu2PC_bits_nextPC_T_11; // @[src/main/scala/wbu/WBU.scala 367:8]
  assign branchCond_io_branch = branchCtrReg; // @[src/main/scala/wbu/WBU.scala 114:29]
  assign branchCond_io_less = lessReg; // @[src/main/scala/wbu/WBU.scala 115:33]
  assign branchCond_io_zero = zeroReg; // @[src/main/scala/wbu/WBU.scala 116:33]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 28:42]
      pcReg <= 32'h30000000; // @[src/main/scala/wbu/WBU.scala 28:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      pcReg <= io_exu2WBU_bits_pc; // @[src/main/scala/wbu/WBU.scala 76:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 29:42]
      memDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 29:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memDataReg <= io_exu2WBU_bits_memData; // @[src/main/scala/wbu/WBU.scala 77:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 30:42]
      aluDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 30:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      aluDataReg <= io_exu2WBU_bits_aluData; // @[src/main/scala/wbu/WBU.scala 78:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 31:42]
      csrWDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 31:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrWDataReg <= io_exu2WBU_bits_csrWData; // @[src/main/scala/wbu/WBU.scala 79:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 32:42]
      csrDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 32:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrDataReg <= io_exu2WBU_bits_csrData; // @[src/main/scala/wbu/WBU.scala 80:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 33:38]
      immDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 33:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      immDataReg <= io_exu2WBU_bits_immData; // @[src/main/scala/wbu/WBU.scala 81:29]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 34:38]
      rs1DataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 34:38]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      rs1DataReg <= io_exu2WBU_bits_rs1Data; // @[src/main/scala/wbu/WBU.scala 82:29]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 35:42]
      instReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 35:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      instReg <= io_exu2WBU_bits_inst; // @[src/main/scala/wbu/WBU.scala 83:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 37:34]
      regWRReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 37:34]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      regWRReg <= io_exu2WBU_bits_regWR; // @[src/main/scala/wbu/WBU.scala 84:25]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 38:42]
      memWRReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 38:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memWRReg <= io_exu2WBU_bits_memWR; // @[src/main/scala/wbu/WBU.scala 85:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 40:42]
      memOPReg <= 3'h0; // @[src/main/scala/wbu/WBU.scala 40:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      memOPReg <= io_exu2WBU_bits_memOP; // @[src/main/scala/wbu/WBU.scala 87:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 41:42]
      toRegReg <= 2'h0; // @[src/main/scala/wbu/WBU.scala 41:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      toRegReg <= io_exu2WBU_bits_toReg; // @[src/main/scala/wbu/WBU.scala 88:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 42:42]
      branchCtrReg <= 4'h0; // @[src/main/scala/wbu/WBU.scala 42:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      branchCtrReg <= io_exu2WBU_bits_branchCtr; // @[src/main/scala/wbu/WBU.scala 89:25]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 43:42]
      lessReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 43:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      lessReg <= io_exu2WBU_bits_less; // @[src/main/scala/wbu/WBU.scala 90:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 44:42]
      zeroReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 44:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      zeroReg <= io_exu2WBU_bits_zero; // @[src/main/scala/wbu/WBU.scala 91:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 45:42]
      ecallReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 45:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      ecallReg <= io_exu2WBU_bits_ecall; // @[src/main/scala/wbu/WBU.scala 92:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 46:42]
      csrEnReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 46:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrEnReg <= io_exu2WBU_bits_csrEn; // @[src/main/scala/wbu/WBU.scala 93:33]
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 47:42]
      csrWrReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 47:42]
    end else if (io_exu2WBU_ready & io_exu2WBU_valid) begin // @[src/main/scala/wbu/WBU.scala 75:52]
      csrWrReg <= io_exu2WBU_bits_csrWr; // @[src/main/scala/wbu/WBU.scala 94:33]
    end
    ready2EXUReg <= reset | _GEN_45; // @[src/main/scala/wbu/WBU.scala 69:{30,30}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 71:34]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 71:34]
    end else if (state == 2'h0) begin // @[src/main/scala/wbu/WBU.scala 305:32]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 307:33]
    end else if (state == 2'h1) begin // @[src/main/scala/wbu/WBU.scala 308:49]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 310:33]
    end else if (state == 2'h2) begin // @[src/main/scala/wbu/WBU.scala 311:42]
      validPC2Reg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 313:33]
    end else begin
      validPC2Reg <= _GEN_40;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 124:42]
      awvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 124:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 245:34]
      awvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 246:33]
    end else begin
      awvalidReg <= _GEN_22;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 136:42]
      wvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 136:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 253:34]
      wvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 254:33]
    end else begin
      wvalidReg <= _GEN_26;
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 158:42]
      wlastReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 158:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 253:34]
      wlastReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 255:33]
    end else begin
      wlastReg <= _GEN_27;
    end
    breadyReg <= reset | _GEN_32; // @[src/main/scala/wbu/WBU.scala 161:{42,42}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 168:42]
      arvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 168:42]
    end else if (_T_1) begin // @[src/main/scala/wbu/WBU.scala 278:34]
      arvalidReg <= 1'h0; // @[src/main/scala/wbu/WBU.scala 279:33]
    end else begin
      arvalidReg <= _GEN_34;
    end
    rreadyReg <= reset | _GEN_38; // @[src/main/scala/wbu/WBU.scala 179:{42,42}]
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 233:42]
      memRdDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 233:42]
    end else if (~resetnWire) begin // @[src/main/scala/wbu/WBU.scala 237:34]
      memRdDataReg <= 32'h0; // @[src/main/scala/wbu/WBU.scala 238:33]
    end else if (io_wbu2Mem_rvalid & io_wbu2Mem_rready) begin // @[src/main/scala/wbu/WBU.scala 239:54]
      if (sOrUWire) begin // @[src/main/scala/wbu/WBU.scala 234:38]
        memRdDataReg <= _memRdDataWire_T_1;
      end else begin
        memRdDataReg <= rdataShiftWire;
      end
    end
    if (reset) begin // @[src/main/scala/wbu/WBU.scala 296:28]
      state <= 2'h0; // @[src/main/scala/wbu/WBU.scala 296:28]
    end else if (2'h3 == state) begin // @[src/main/scala/wbu/WBU.scala 298:42]
      if (reset) begin // @[src/main/scala/wbu/WBU.scala 302:47]
        state <= 2'h0;
      end else if (io_wbu2PC_ready) begin // @[src/main/scala/wbu/WBU.scala 302:73]
        state <= 2'h0;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/wbu/WBU.scala 298:42]
      if (reset) begin // @[src/main/scala/wbu/WBU.scala 301:55]
        state <= 2'h0;
      end else begin
        state <= _state_T_8;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/wbu/WBU.scala 298:42]
      state <= _state_T_6;
    end else begin
      state <= _state_T_1;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (resetnWire & ~(~(io_wbu2Mem_awvalid & io_wbu2Mem_awaddr <= 32'hf000000) | ~(io_wbu2Mem_arvalid &
          io_wbu2Mem_araddr <= 32'hf000000))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at WBU.scala:243 assert(!(io.wbu2Mem.awvalid & (io.wbu2Mem.awaddr <= 0x0F000000.U)) | !(io.wbu2Mem.arvalid & (io.wbu2Mem.araddr <= 0x0F000000.U)));\n"
            ); // @[src/main/scala/wbu/WBU.scala 243:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (resetnWire & ~(~(io_wbu2Mem_awvalid & io_wbu2Mem_awaddr <= 32'hf000000) | ~(io_wbu2Mem_arvalid &
          io_wbu2Mem_araddr <= 32'hf000000))) begin
          $fatal; // @[src/main/scala/wbu/WBU.scala 243:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  _RAND_1 = {1{`RANDOM}};
  memDataReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  aluDataReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  csrWDataReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  csrDataReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  immDataReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  rs1DataReg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  instReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regWRReg = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  memWRReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memOPReg = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  toRegReg = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  branchCtrReg = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  lessReg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  zeroReg = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  ecallReg = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  csrEnReg = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  csrWrReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ready2EXUReg = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  validPC2Reg = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  awvalidReg = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  wvalidReg = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  wlastReg = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  breadyReg = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  arvalidReg = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  rreadyReg = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  memRdDataReg = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  state = _RAND_27[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
