module top(
  input         clock,
  input         reset,
  input         io_interrupt, // @[src/main/scala/Main.scala 27:20]
  input         io_master_awready, // @[src/main/scala/Main.scala 27:20]
  output        io_master_awvalid, // @[src/main/scala/Main.scala 27:20]
  output [31:0] io_master_awaddr, // @[src/main/scala/Main.scala 27:20]
  output [3:0]  io_master_awid, // @[src/main/scala/Main.scala 27:20]
  output [7:0]  io_master_awlen, // @[src/main/scala/Main.scala 27:20]
  output [2:0]  io_master_awsize, // @[src/main/scala/Main.scala 27:20]
  output [1:0]  io_master_awburst, // @[src/main/scala/Main.scala 27:20]
  input         io_master_wready, // @[src/main/scala/Main.scala 27:20]
  output        io_master_wvalid, // @[src/main/scala/Main.scala 27:20]
  output [31:0] io_master_wdata, // @[src/main/scala/Main.scala 27:20]
  output [3:0]  io_master_wstrb, // @[src/main/scala/Main.scala 27:20]
  output        io_master_wlast, // @[src/main/scala/Main.scala 27:20]
  output        io_master_bready, // @[src/main/scala/Main.scala 27:20]
  input         io_master_bvalid, // @[src/main/scala/Main.scala 27:20]
  input  [1:0]  io_master_bresp, // @[src/main/scala/Main.scala 27:20]
  input  [3:0]  io_master_bid, // @[src/main/scala/Main.scala 27:20]
  input         io_master_arready, // @[src/main/scala/Main.scala 27:20]
  output        io_master_arvalid, // @[src/main/scala/Main.scala 27:20]
  output [31:0] io_master_araddr, // @[src/main/scala/Main.scala 27:20]
  output [3:0]  io_master_arid, // @[src/main/scala/Main.scala 27:20]
  output [7:0]  io_master_arlen, // @[src/main/scala/Main.scala 27:20]
  output [2:0]  io_master_arsize, // @[src/main/scala/Main.scala 27:20]
  output [1:0]  io_master_arburst, // @[src/main/scala/Main.scala 27:20]
  output        io_master_rready, // @[src/main/scala/Main.scala 27:20]
  input         io_master_rvalid, // @[src/main/scala/Main.scala 27:20]
  input  [1:0]  io_master_rresp, // @[src/main/scala/Main.scala 27:20]
  input  [31:0] io_master_rdata, // @[src/main/scala/Main.scala 27:20]
  input         io_master_rlast, // @[src/main/scala/Main.scala 27:20]
  input  [3:0]  io_master_rid, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_awready, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_awvalid, // @[src/main/scala/Main.scala 27:20]
  input  [31:0] io_slave_awaddr, // @[src/main/scala/Main.scala 27:20]
  input  [3:0]  io_slave_awid, // @[src/main/scala/Main.scala 27:20]
  input  [7:0]  io_slave_awlen, // @[src/main/scala/Main.scala 27:20]
  input  [2:0]  io_slave_awsize, // @[src/main/scala/Main.scala 27:20]
  input  [1:0]  io_slave_awburst, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_wready, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_wvalid, // @[src/main/scala/Main.scala 27:20]
  input  [31:0] io_slave_wdata, // @[src/main/scala/Main.scala 27:20]
  input  [3:0]  io_slave_wstrb, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_wlast, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_bready, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_bvalid, // @[src/main/scala/Main.scala 27:20]
  output [1:0]  io_slave_bresp, // @[src/main/scala/Main.scala 27:20]
  output [3:0]  io_slave_bid, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_arready, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_arvalid, // @[src/main/scala/Main.scala 27:20]
  input  [31:0] io_slave_araddr, // @[src/main/scala/Main.scala 27:20]
  input  [3:0]  io_slave_arid, // @[src/main/scala/Main.scala 27:20]
  input  [7:0]  io_slave_arlen, // @[src/main/scala/Main.scala 27:20]
  input  [2:0]  io_slave_arsize, // @[src/main/scala/Main.scala 27:20]
  input  [1:0]  io_slave_arburst, // @[src/main/scala/Main.scala 27:20]
  input         io_slave_rready, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_rvalid, // @[src/main/scala/Main.scala 27:20]
  output [1:0]  io_slave_rresp, // @[src/main/scala/Main.scala 27:20]
  output [31:0] io_slave_rdata, // @[src/main/scala/Main.scala 27:20]
  output        io_slave_rlast, // @[src/main/scala/Main.scala 27:20]
  output [3:0]  io_slave_rid // @[src/main/scala/Main.scala 27:20]
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
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
`endif // RANDOMIZE_REG_INIT
  wire  ifu_clock; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_reset; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_inst_ready; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_inst_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_ifu2ICache_ready; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_ifu2ICache_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_ifu2ICache_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_icache2IFU_ready; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_icache2IFU_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_icache2IFU_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_icache2IFU_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire  ifu_io_flush; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_correctPC; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] ifu_io_fromPC; // @[src/main/scala/Main.scala 33:49]
  wire  riscv32BaseReg_clock; // @[src/main/scala/Main.scala 34:41]
  wire  riscv32BaseReg_reset; // @[src/main/scala/Main.scala 34:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 34:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 34:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 34:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 34:41]
  wire [3:0] riscv32BaseReg_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 34:41]
  wire [31:0] riscv32BaseReg_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 34:41]
  wire  riscv32BaseReg_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 34:41]
  wire  csrReg_clock; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_reset; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_io_exu2CSR_mret; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 35:49]
  wire [11:0] csrReg_io_exu2CSR_csr; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] csrReg_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] csrReg_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] csrReg_io_wbu2CSR_mtvec; // @[src/main/scala/Main.scala 35:49]
  wire [11:0] csrReg_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 35:49]
  wire  csrReg_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 35:49]
  wire  idu_clock; // @[src/main/scala/Main.scala 36:49]
  wire  idu_reset; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_inst_ready; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_inst_valid; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_inst_bits_inst; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_inst_bits_pc; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 36:49]
  wire [2:0] idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 36:49]
  wire [4:0] idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_iduBypass_rd_0; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_iduBypass_rd_1; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] idu_io_iduBypass_rd_2; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_iduBypass_data_0; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_iduBypass_data_1; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] idu_io_iduBypass_data_2; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_iduBypass_regWR_0; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_iduBypass_regWR_1; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_iduBypass_regWR_2; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_iduBypass_Valid_0; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_iduBypass_Valid_1; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_isRAW; // @[src/main/scala/Main.scala 36:49]
  wire  idu_io_flush; // @[src/main/scala/Main.scala 36:49]
  wire  exu_clock; // @[src/main/scala/Main.scala 37:49]
  wire  exu_reset; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] exu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] exu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] exu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] exu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] exu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 37:49]
  wire [2:0] exu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 37:49]
  wire [4:0] exu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] exu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_immData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_rs1Data; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 37:49]
  wire [2:0] exu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] exu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] exu_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 37:49]
  wire [11:0] exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] exu_io_exu2Branch_branchCtr; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2Branch_less; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_exu2Branch_zero; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] exu_io_rd; // @[src/main/scala/Main.scala 37:49]
  wire  exu_io_flush; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_clock; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_reset; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 38:49]
  wire [2:0] lsu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] lsu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_awready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_awvalid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2Mem_awaddr; // @[src/main/scala/Main.scala 38:49]
  wire [2:0] lsu_io_lsu2Mem_awsize; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_wready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_wvalid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2Mem_wdata; // @[src/main/scala/Main.scala 38:49]
  wire [3:0] lsu_io_lsu2Mem_wstrb; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_wlast; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_bready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_bvalid; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] lsu_io_lsu2Mem_bresp; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_arready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_arvalid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2Mem_araddr; // @[src/main/scala/Main.scala 38:49]
  wire [2:0] lsu_io_lsu2Mem_arsize; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_rready; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_rvalid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2Mem_rdata; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2Mem_rlast; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] lsu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] lsu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_lsu2WBU_bits_skip; // @[src/main/scala/Main.scala 38:49]
  wire [3:0] lsu_io_rd; // @[src/main/scala/Main.scala 38:49]
  wire  lsu_io_bypassValid; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_clock; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_reset; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_ready; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 39:49]
  wire [1:0] wbu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_lsu2WBU_bits_skip; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_wbu2CSR_mtvec; // @[src/main/scala/Main.scala 39:49]
  wire [11:0] wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_wbu2Icache; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] wbu_io_rd; // @[src/main/scala/Main.scala 39:49]
  wire  wbu_io_flush; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] wbu_io_correctPC; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_clock; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_reset; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_bready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 40:49]
  wire [1:0] xbarAXI_io_axiSlaveIFU_bresp; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_arvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_araddr; // @[src/main/scala/Main.scala 40:49]
  wire [7:0] xbarAXI_io_axiSlaveIFU_arlen; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_rready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveIFU_rlast; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_awready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_awvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveLSU_awaddr; // @[src/main/scala/Main.scala 40:49]
  wire [2:0] xbarAXI_io_axiSlaveLSU_awsize; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_wready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_wvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveLSU_wdata; // @[src/main/scala/Main.scala 40:49]
  wire [3:0] xbarAXI_io_axiSlaveLSU_wstrb; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_wlast; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_bvalid; // @[src/main/scala/Main.scala 40:49]
  wire [1:0] xbarAXI_io_axiSlaveLSU_bresp; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_arready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_arvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveLSU_araddr; // @[src/main/scala/Main.scala 40:49]
  wire [2:0] xbarAXI_io_axiSlaveLSU_arsize; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_rready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_rvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiSlaveLSU_rdata; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiSlaveLSU_rlast; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_awready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 40:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_wready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 40:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_bvalid; // @[src/main/scala/Main.scala 40:49]
  wire [1:0] xbarAXI_io_axiMasterDevice_bresp; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_arready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 40:49]
  wire [7:0] xbarAXI_io_axiMasterDevice_arlen; // @[src/main/scala/Main.scala 40:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_rvalid; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_rdata; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiMasterDevice_rlast; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_arReady; // @[src/main/scala/Main.scala 40:49]
  wire [31:0] xbarAXI_io_axiLiteClint_rData; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_rValid; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_awReady; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_wReady; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_bValid; // @[src/main/scala/Main.scala 40:49]
  wire  xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 40:49]
  wire  icacheSkidBuffer_io_axiMaster_bready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_bvalid; // @[src/main/scala/Main.scala 41:37]
  wire [1:0] icacheSkidBuffer_io_axiMaster_bresp; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_arready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_arvalid; // @[src/main/scala/Main.scala 41:37]
  wire [31:0] icacheSkidBuffer_io_axiMaster_araddr; // @[src/main/scala/Main.scala 41:37]
  wire [7:0] icacheSkidBuffer_io_axiMaster_arlen; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_rready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_rvalid; // @[src/main/scala/Main.scala 41:37]
  wire [31:0] icacheSkidBuffer_io_axiMaster_rdata; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiMaster_rlast; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_bready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_bvalid; // @[src/main/scala/Main.scala 41:37]
  wire [1:0] icacheSkidBuffer_io_axiSlave_bresp; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_arready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_arvalid; // @[src/main/scala/Main.scala 41:37]
  wire [31:0] icacheSkidBuffer_io_axiSlave_araddr; // @[src/main/scala/Main.scala 41:37]
  wire [7:0] icacheSkidBuffer_io_axiSlave_arlen; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_rready; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_rvalid; // @[src/main/scala/Main.scala 41:37]
  wire [31:0] icacheSkidBuffer_io_axiSlave_rdata; // @[src/main/scala/Main.scala 41:37]
  wire  icacheSkidBuffer_io_axiSlave_rlast; // @[src/main/scala/Main.scala 41:37]
  wire  icache_clock; // @[src/main/scala/Main.scala 49:28]
  wire  icache_reset; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_ifu2ICache_ready; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_ifu2ICache_valid; // @[src/main/scala/Main.scala 49:28]
  wire [31:0] icache_io_ifu2ICache_bits_pc; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2IFU_ready; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2IFU_valid; // @[src/main/scala/Main.scala 49:28]
  wire [31:0] icache_io_icache2IFU_bits_pc; // @[src/main/scala/Main.scala 49:28]
  wire [31:0] icache_io_icache2IFU_bits_inst; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_bready; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_bvalid; // @[src/main/scala/Main.scala 49:28]
  wire [1:0] icache_io_icache2Mem_bresp; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_arready; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_arvalid; // @[src/main/scala/Main.scala 49:28]
  wire [31:0] icache_io_icache2Mem_araddr; // @[src/main/scala/Main.scala 49:28]
  wire [7:0] icache_io_icache2Mem_arlen; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_rready; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_rvalid; // @[src/main/scala/Main.scala 49:28]
  wire [31:0] icache_io_icache2Mem_rdata; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_icache2Mem_rlast; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_wbu2Icache; // @[src/main/scala/Main.scala 49:28]
  wire  icache_io_flush; // @[src/main/scala/Main.scala 49:28]
  wire [3:0] branchCond_io_branch; // @[src/main/scala/Main.scala 87:41]
  wire  branchCond_io_less; // @[src/main/scala/Main.scala 87:41]
  wire  branchCond_io_zero; // @[src/main/scala/Main.scala 87:41]
  wire [1:0] branchCond_io_pcASrc; // @[src/main/scala/Main.scala 87:41]
  wire [1:0] branchCond_io_pcBSrc; // @[src/main/scala/Main.scala 87:41]
  wire [31:0] branchCheck_io_predictPC; // @[src/main/scala/Main.scala 107:41]
  wire [31:0] branchCheck_io_correctPC; // @[src/main/scala/Main.scala 107:41]
  wire  branchCheck_io_correct; // @[src/main/scala/Main.scala 107:41]
  wire  RAWC_valid; // @[src/main/scala/Main.scala 159:57]
  wire [31:0] RAWC_counterType; // @[src/main/scala/Main.scala 159:57]
  wire [31:0] RAWC_data; // @[src/main/scala/Main.scala 159:57]
  wire  EFC_valid; // @[src/main/scala/Main.scala 165:33]
  wire [31:0] EFC_counterType; // @[src/main/scala/Main.scala 165:33]
  wire [31:0] EFC_data; // @[src/main/scala/Main.scala 165:33]
  wire  axiAccessFault_valid; // @[src/main/scala/Main.scala 186:44]
  wire  axiAccessFault_ready; // @[src/main/scala/Main.scala 186:44]
  wire [1:0] axiAccessFault_resp; // @[src/main/scala/Main.scala 186:44]
  wire  axiLiteClint_clock; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_reset; // @[src/main/scala/Main.scala 208:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_arAddr; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_arValid; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 208:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_rReady; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_awValid; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_wValid; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 208:34]
  wire  axiLiteClint_io_axiLiteMaster_bReady; // @[src/main/scala/Main.scala 208:34]
  reg [1:0] state; // @[src/main/scala/Main.scala 54:28]
  reg [31:0] correctPCReg; // @[src/main/scala/Main.scala 104:44]
  wire  _branchFlush_T_2 = correctPCReg[31:24] != 8'h0; // @[src/main/scala/Main.scala 111:31]
  wire  _branchFlush_T_3 = ~branchCheck_io_correct & _branchFlush_T_2; // @[src/main/scala/Main.scala 110:71]
  wire  _branchFlush_T_4 = state != 2'h3; // @[src/main/scala/Main.scala 111:49]
  reg  idu2EXUHandReg; // @[src/main/scala/Main.scala 102:42]
  wire  branchFlush = _branchFlush_T_3 & state != 2'h3 & idu2EXUHandReg; // @[src/main/scala/Main.scala 111:62]
  wire  flushWire = branchFlush | wbu_io_flush; // @[src/main/scala/Main.scala 56:47]
  wire  flushEndWire = exu_io_exu2LSU_ready & exu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 57:56]
  wire  _bypassData_0_T = exu_io_exu2LSU_bits_toReg == 2'h0; // @[src/main/scala/Main.scala 67:36]
  wire  _bypassData_0_T_1 = exu_io_exu2LSU_bits_toReg == 2'h2; // @[src/main/scala/Main.scala 68:44]
  wire [31:0] _bypassData_0_T_2 = _bypassData_0_T_1 ? exu_io_exu2LSU_bits_csrData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _bypassData_1_T = lsu_io_lsu2WBU_bits_toReg == 2'h0; // @[src/main/scala/Main.scala 71:36]
  wire  _bypassData_1_T_1 = lsu_io_lsu2WBU_bits_toReg == 2'h1; // @[src/main/scala/Main.scala 72:44]
  wire  _bypassData_1_T_2 = lsu_io_lsu2WBU_bits_toReg == 2'h2; // @[src/main/scala/Main.scala 73:44]
  wire [31:0] _bypassData_1_T_3 = _bypassData_1_T_2 ? {{30'd0}, lsu_io_lsu2WBU_bits_toReg} : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _bypassData_1_T_4 = _bypassData_1_T_1 ? lsu_io_lsu2WBU_bits_memData : _bypassData_1_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [3:0] bypassRd_0 = exu_io_exu2LSU_bits_inst[10:7]; // @[src/main/scala/Main.scala 59:39 63:33]
  wire  bypassRegWR_0 = exu_io_exu2LSU_bits_regWR & bypassRd_0 != 4'h0; // @[src/main/scala/Main.scala 76:54]
  wire [3:0] bypassRd_1 = lsu_io_lsu2WBU_bits_inst[10:7]; // @[src/main/scala/Main.scala 59:39 64:33]
  wire  bypassRegWR_1 = lsu_io_lsu2WBU_bits_regWR & bypassRd_1 != 4'h0; // @[src/main/scala/Main.scala 77:54]
  wire [3:0] bypassRd_2 = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 59:39 65:33]
  wire  bypassRegWR_2 = wbu_io_wbu2BaseReg_regWR & bypassRd_2 != 4'h0; // @[src/main/scala/Main.scala 78:53]
  wire  bypassValid_0 = exu_io_exu2LSU_bits_toReg != 2'h1 & _branchFlush_T_4; // @[src/main/scala/Main.scala 79:64]
  wire  _branchCtrReg_T = exu_io_exu2LSU_valid & exu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 84:95]
  reg [3:0] branchCtrReg; // @[src/main/scala/Main.scala 84:44]
  reg  zeroReg; // @[src/main/scala/Main.scala 85:44]
  reg  lessReg; // @[src/main/scala/Main.scala 86:44]
  wire  _nextPC_T = branchCond_io_pcASrc == 2'h0; // @[src/main/scala/Main.scala 94:21]
  wire  _nextPC_T_1 = branchCond_io_pcASrc == 2'h1; // @[src/main/scala/Main.scala 95:29]
  wire [31:0] _nextPC_T_4 = _nextPC_T_1 ? exu_io_exu2LSU_bits_immData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_5 = _nextPC_T ? 32'h4 : _nextPC_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _nextPC_T_6 = branchCond_io_pcBSrc == 2'h0; // @[src/main/scala/Main.scala 98:21]
  wire  _nextPC_T_7 = branchCond_io_pcBSrc == 2'h1; // @[src/main/scala/Main.scala 99:29]
  wire  _nextPC_T_8 = branchCond_io_pcBSrc == 2'h2; // @[src/main/scala/Main.scala 100:29]
  wire [31:0] _nextPC_T_9 = _nextPC_T_8 ? exu_io_exu2LSU_bits_csrWData : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_10 = _nextPC_T_7 ? exu_io_exu2LSU_bits_rs1Data : _nextPC_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _nextPC_T_11 = _nextPC_T_6 ? exu_io_exu2LSU_bits_pc : _nextPC_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] nextPC = _nextPC_T_5 + _nextPC_T_11; // @[src/main/scala/Main.scala 97:8]
  reg  exu2LSUHandReg; // @[src/main/scala/Main.scala 103:42]
  reg [31:0] fromPCReg; // @[src/main/scala/Main.scala 105:44]
  wire  _predictPCReg_T = idu_io_idu2EXU_valid & idu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 106:90]
  reg [31:0] predictPCReg; // @[src/main/scala/Main.scala 106:44]
  reg  IFU2IDUHandReg; // @[src/main/scala/Main.scala 113:37]
  wire  _isRAW_T_4 = idu_io_idu2BaseReg_rs1Index == exu_io_rd & exu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs1Index != 4'h0; // @[src/main/scala/Main.scala 114:85]
  wire  _isRAW_T_9 = _isRAW_T_4 & ~(idu_io_idu2BaseReg_rs1Index == bypassRd_0 & (bypassRegWR_0 & bypassValid_0)); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_14 = idu_io_idu2BaseReg_rs2Index == exu_io_rd & exu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs2Index != 4'h0
    ; // @[src/main/scala/Main.scala 114:85]
  wire  _isRAW_T_19 = _isRAW_T_14 & ~(idu_io_idu2BaseReg_rs2Index == bypassRd_0 & (bypassRegWR_0 & bypassValid_0)); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_20 = _isRAW_T_9 | _isRAW_T_19; // @[src/main/scala/Main.scala 117:42]
  wire  _isRAW_T_25 = idu_io_idu2BaseReg_rs1Index == lsu_io_rd & lsu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs1Index != 4'h0
    ; // @[src/main/scala/Main.scala 114:85]
  wire  bypassValid_1 = lsu_io_bypassValid; // @[src/main/scala/Main.scala 62:39 80:25]
  wire  _isRAW_T_30 = _isRAW_T_25 & ~(idu_io_idu2BaseReg_rs1Index == bypassRd_1 & (bypassRegWR_1 & bypassValid_1)); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_35 = idu_io_idu2BaseReg_rs2Index == lsu_io_rd & lsu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs2Index != 4'h0
    ; // @[src/main/scala/Main.scala 114:85]
  wire  _isRAW_T_40 = _isRAW_T_35 & ~(idu_io_idu2BaseReg_rs2Index == bypassRd_1 & (bypassRegWR_1 & bypassValid_1)); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_41 = _isRAW_T_30 | _isRAW_T_40; // @[src/main/scala/Main.scala 117:42]
  wire  _isRAW_T_42 = _isRAW_T_20 | _isRAW_T_41; // @[src/main/scala/Main.scala 121:103]
  wire  _isRAW_T_47 = idu_io_idu2BaseReg_rs1Index == wbu_io_rd & wbu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs1Index != 4'h0
    ; // @[src/main/scala/Main.scala 114:85]
  wire  _isRAW_T_52 = _isRAW_T_47 & ~(idu_io_idu2BaseReg_rs1Index == bypassRd_2 & bypassRegWR_2); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_57 = idu_io_idu2BaseReg_rs2Index == wbu_io_rd & wbu_io_rd != 4'h0 & idu_io_idu2BaseReg_rs2Index != 4'h0
    ; // @[src/main/scala/Main.scala 114:85]
  wire  _isRAW_T_62 = _isRAW_T_57 & ~(idu_io_idu2BaseReg_rs2Index == bypassRd_2 & bypassRegWR_2); // @[src/main/scala/Main.scala 115:9]
  wire  _isRAW_T_63 = _isRAW_T_52 | _isRAW_T_62; // @[src/main/scala/Main.scala 117:42]
  wire  isRAW = _isRAW_T_42 | _isRAW_T_63; // @[src/main/scala/Main.scala 122:103]
  wire [1:0] _nextState_T_1 = isRAW & IFU2IDUHandReg ? 2'h1 : 2'h0; // @[src/main/scala/Main.scala 131:55]
  wire [1:0] _nextState_T_2 = flushWire ? 2'h3 : _nextState_T_1; // @[src/main/scala/Main.scala 131:31]
  wire [1:0] _nextState_T_4 = _predictPCReg_T ? 2'h2 : 2'h1; // @[src/main/scala/Main.scala 132:55]
  wire [1:0] _nextState_T_5 = flushWire ? 2'h3 : _nextState_T_4; // @[src/main/scala/Main.scala 132:31]
  wire [1:0] _nextState_T_7 = idu_io_inst_valid & idu_io_inst_ready ? 2'h0 : 2'h2; // @[src/main/scala/Main.scala 133:57]
  wire [1:0] _nextState_T_8 = flushWire ? 2'h3 : _nextState_T_7; // @[src/main/scala/Main.scala 133:33]
  wire [1:0] _nextState_T_9 = flushEndWire ? 2'h0 : 2'h3; // @[src/main/scala/Main.scala 134:31]
  wire [1:0] _nextState_T_11 = 2'h0 == state ? _nextState_T_2 : 2'h0; // @[src/main/scala/Main.scala 130:46]
  wire [1:0] _nextState_T_13 = 2'h1 == state ? _nextState_T_5 : _nextState_T_11; // @[src/main/scala/Main.scala 130:46]
  wire [1:0] _nextState_T_15 = 2'h2 == state ? _nextState_T_8 : _nextState_T_13; // @[src/main/scala/Main.scala 130:46]
  wire [1:0] nextState = 2'h3 == state ? _nextState_T_9 : _nextState_T_15; // @[src/main/scala/Main.scala 130:46]
  reg [31:0] idu_io_inst_bits_r_inst; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] idu_io_inst_bits_r_pc; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] exu_io_idu2EXU_bits_r_pc; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] exu_io_idu2EXU_bits_r_rs1Data; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] exu_io_idu2EXU_bits_r_rs2Data; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] exu_io_idu2EXU_bits_r_imm; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] exu_io_idu2EXU_bits_r_inst; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_regWR; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] exu_io_idu2EXU_bits_r_srcAALU; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] exu_io_idu2EXU_bits_r_srcBALU; // @[src/main/scala/Main.scala 127:45]
  reg [3:0] exu_io_idu2EXU_bits_r_ctrALU; // @[src/main/scala/Main.scala 127:45]
  reg [3:0] exu_io_idu2EXU_bits_r_branch; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] exu_io_idu2EXU_bits_r_toReg; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_memWR; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_memValid; // @[src/main/scala/Main.scala 127:45]
  reg [2:0] exu_io_idu2EXU_bits_r_memOP; // @[src/main/scala/Main.scala 127:45]
  reg [4:0] exu_io_idu2EXU_bits_r_rs1Index; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_ecall; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_mret; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:45]
  reg  exu_io_idu2EXU_bits_r_csrOP; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] exu_io_idu2EXU_bits_r_csrALUOP; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_pc; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_memData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_aluData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_csrWData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_csrData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] lsu_io_exu2LSU_bits_r_inst; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_regWR; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_memWR; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_memValid; // @[src/main/scala/Main.scala 127:45]
  reg [2:0] lsu_io_exu2LSU_bits_r_memOP; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] lsu_io_exu2LSU_bits_r_toReg; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_ecall; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:45]
  reg  lsu_io_exu2LSU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_pc; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_memData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_aluData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_csrWData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_csrData; // @[src/main/scala/Main.scala 127:45]
  reg [31:0] wbu_io_lsu2WBU_bits_r_inst; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_regWR; // @[src/main/scala/Main.scala 127:45]
  reg [1:0] wbu_io_lsu2WBU_bits_r_toReg; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_ecall; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_fencei; // @[src/main/scala/Main.scala 127:45]
  reg  wbu_io_lsu2WBU_bits_r_skip; // @[src/main/scala/Main.scala 127:45]
  wire [31:0] _ifu_io_correctPC_T = exu_io_flush ? correctPCReg : 32'h0; // @[src/main/scala/Main.scala 142:83]
  wire  _idu_io_isRAW_T_1 = state == 2'h1; // @[src/main/scala/Main.scala 144:82]
  reg [31:0] rawCnt; // @[src/main/scala/Main.scala 153:37]
  wire [31:0] _rawCnt_T_1 = rawCnt + 32'h1; // @[src/main/scala/Main.scala 155:42]
  reg [31:0] flushCnt; // @[src/main/scala/Main.scala 164:39]
  wire [31:0] _flushCnt_T_1 = flushCnt + 32'h1; // @[src/main/scala/Main.scala 167:46]
  IFU ifu ( // @[src/main/scala/Main.scala 33:49]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_inst_ready(ifu_io_inst_ready),
    .io_inst_valid(ifu_io_inst_valid),
    .io_inst_bits_inst(ifu_io_inst_bits_inst),
    .io_inst_bits_pc(ifu_io_inst_bits_pc),
    .io_ifu2ICache_ready(ifu_io_ifu2ICache_ready),
    .io_ifu2ICache_valid(ifu_io_ifu2ICache_valid),
    .io_ifu2ICache_bits_pc(ifu_io_ifu2ICache_bits_pc),
    .io_icache2IFU_ready(ifu_io_icache2IFU_ready),
    .io_icache2IFU_valid(ifu_io_icache2IFU_valid),
    .io_icache2IFU_bits_pc(ifu_io_icache2IFU_bits_pc),
    .io_icache2IFU_bits_inst(ifu_io_icache2IFU_bits_inst),
    .io_flush(ifu_io_flush),
    .io_correctPC(ifu_io_correctPC),
    .io_fromPC(ifu_io_fromPC)
  );
  Riscv32BaseReg riscv32BaseReg ( // @[src/main/scala/Main.scala 34:41]
    .clock(riscv32BaseReg_clock),
    .reset(riscv32BaseReg_reset),
    .io_idu2BaseReg_rs1Data(riscv32BaseReg_io_idu2BaseReg_rs1Data),
    .io_idu2BaseReg_rs2Data(riscv32BaseReg_io_idu2BaseReg_rs2Data),
    .io_idu2BaseReg_rs1Index(riscv32BaseReg_io_idu2BaseReg_rs1Index),
    .io_idu2BaseReg_rs2Index(riscv32BaseReg_io_idu2BaseReg_rs2Index),
    .io_wbu2BaseReg_rdIndex(riscv32BaseReg_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(riscv32BaseReg_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(riscv32BaseReg_io_wbu2BaseReg_regWR)
  );
  CSRReg csrReg ( // @[src/main/scala/Main.scala 35:49]
    .clock(csrReg_clock),
    .reset(csrReg_reset),
    .io_exu2CSR_csrData(csrReg_io_exu2CSR_csrData),
    .io_exu2CSR_mret(csrReg_io_exu2CSR_mret),
    .io_exu2CSR_ecall(csrReg_io_exu2CSR_ecall),
    .io_exu2CSR_csr(csrReg_io_exu2CSR_csr),
    .io_wbu2CSR_pc(csrReg_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(csrReg_io_wbu2CSR_csrWData),
    .io_wbu2CSR_mtvec(csrReg_io_wbu2CSR_mtvec),
    .io_wbu2CSR_csr(csrReg_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(csrReg_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(csrReg_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(csrReg_io_wbu2CSR_csrWr)
  );
  IDU idu ( // @[src/main/scala/Main.scala 36:49]
    .clock(idu_clock),
    .reset(idu_reset),
    .io_inst_ready(idu_io_inst_ready),
    .io_inst_valid(idu_io_inst_valid),
    .io_inst_bits_inst(idu_io_inst_bits_inst),
    .io_inst_bits_pc(idu_io_inst_bits_pc),
    .io_idu2EXU_ready(idu_io_idu2EXU_ready),
    .io_idu2EXU_valid(idu_io_idu2EXU_valid),
    .io_idu2EXU_bits_pc(idu_io_idu2EXU_bits_pc),
    .io_idu2EXU_bits_rs1Data(idu_io_idu2EXU_bits_rs1Data),
    .io_idu2EXU_bits_rs2Data(idu_io_idu2EXU_bits_rs2Data),
    .io_idu2EXU_bits_imm(idu_io_idu2EXU_bits_imm),
    .io_idu2EXU_bits_inst(idu_io_idu2EXU_bits_inst),
    .io_idu2EXU_bits_regWR(idu_io_idu2EXU_bits_regWR),
    .io_idu2EXU_bits_srcAALU(idu_io_idu2EXU_bits_srcAALU),
    .io_idu2EXU_bits_srcBALU(idu_io_idu2EXU_bits_srcBALU),
    .io_idu2EXU_bits_ctrALU(idu_io_idu2EXU_bits_ctrALU),
    .io_idu2EXU_bits_branch(idu_io_idu2EXU_bits_branch),
    .io_idu2EXU_bits_toReg(idu_io_idu2EXU_bits_toReg),
    .io_idu2EXU_bits_memWR(idu_io_idu2EXU_bits_memWR),
    .io_idu2EXU_bits_memValid(idu_io_idu2EXU_bits_memValid),
    .io_idu2EXU_bits_memOP(idu_io_idu2EXU_bits_memOP),
    .io_idu2EXU_bits_rs1Index(idu_io_idu2EXU_bits_rs1Index),
    .io_idu2EXU_bits_ecall(idu_io_idu2EXU_bits_ecall),
    .io_idu2EXU_bits_mret(idu_io_idu2EXU_bits_mret),
    .io_idu2EXU_bits_csrEn(idu_io_idu2EXU_bits_csrEn),
    .io_idu2EXU_bits_csrWr(idu_io_idu2EXU_bits_csrWr),
    .io_idu2EXU_bits_csrOP(idu_io_idu2EXU_bits_csrOP),
    .io_idu2EXU_bits_csrALUOP(idu_io_idu2EXU_bits_csrALUOP),
    .io_idu2BaseReg_rs1Data(idu_io_idu2BaseReg_rs1Data),
    .io_idu2BaseReg_rs2Data(idu_io_idu2BaseReg_rs2Data),
    .io_idu2BaseReg_rs1Index(idu_io_idu2BaseReg_rs1Index),
    .io_idu2BaseReg_rs2Index(idu_io_idu2BaseReg_rs2Index),
    .io_iduBypass_rd_0(idu_io_iduBypass_rd_0),
    .io_iduBypass_rd_1(idu_io_iduBypass_rd_1),
    .io_iduBypass_rd_2(idu_io_iduBypass_rd_2),
    .io_iduBypass_data_0(idu_io_iduBypass_data_0),
    .io_iduBypass_data_1(idu_io_iduBypass_data_1),
    .io_iduBypass_data_2(idu_io_iduBypass_data_2),
    .io_iduBypass_regWR_0(idu_io_iduBypass_regWR_0),
    .io_iduBypass_regWR_1(idu_io_iduBypass_regWR_1),
    .io_iduBypass_regWR_2(idu_io_iduBypass_regWR_2),
    .io_iduBypass_Valid_0(idu_io_iduBypass_Valid_0),
    .io_iduBypass_Valid_1(idu_io_iduBypass_Valid_1),
    .io_isRAW(idu_io_isRAW),
    .io_flush(idu_io_flush)
  );
  EXU exu ( // @[src/main/scala/Main.scala 37:49]
    .clock(exu_clock),
    .reset(exu_reset),
    .io_idu2EXU_ready(exu_io_idu2EXU_ready),
    .io_idu2EXU_valid(exu_io_idu2EXU_valid),
    .io_idu2EXU_bits_pc(exu_io_idu2EXU_bits_pc),
    .io_idu2EXU_bits_rs1Data(exu_io_idu2EXU_bits_rs1Data),
    .io_idu2EXU_bits_rs2Data(exu_io_idu2EXU_bits_rs2Data),
    .io_idu2EXU_bits_imm(exu_io_idu2EXU_bits_imm),
    .io_idu2EXU_bits_inst(exu_io_idu2EXU_bits_inst),
    .io_idu2EXU_bits_regWR(exu_io_idu2EXU_bits_regWR),
    .io_idu2EXU_bits_srcAALU(exu_io_idu2EXU_bits_srcAALU),
    .io_idu2EXU_bits_srcBALU(exu_io_idu2EXU_bits_srcBALU),
    .io_idu2EXU_bits_ctrALU(exu_io_idu2EXU_bits_ctrALU),
    .io_idu2EXU_bits_branch(exu_io_idu2EXU_bits_branch),
    .io_idu2EXU_bits_toReg(exu_io_idu2EXU_bits_toReg),
    .io_idu2EXU_bits_memWR(exu_io_idu2EXU_bits_memWR),
    .io_idu2EXU_bits_memValid(exu_io_idu2EXU_bits_memValid),
    .io_idu2EXU_bits_memOP(exu_io_idu2EXU_bits_memOP),
    .io_idu2EXU_bits_rs1Index(exu_io_idu2EXU_bits_rs1Index),
    .io_idu2EXU_bits_ecall(exu_io_idu2EXU_bits_ecall),
    .io_idu2EXU_bits_mret(exu_io_idu2EXU_bits_mret),
    .io_idu2EXU_bits_csrEn(exu_io_idu2EXU_bits_csrEn),
    .io_idu2EXU_bits_csrWr(exu_io_idu2EXU_bits_csrWr),
    .io_idu2EXU_bits_csrOP(exu_io_idu2EXU_bits_csrOP),
    .io_idu2EXU_bits_csrALUOP(exu_io_idu2EXU_bits_csrALUOP),
    .io_exu2LSU_ready(exu_io_exu2LSU_ready),
    .io_exu2LSU_valid(exu_io_exu2LSU_valid),
    .io_exu2LSU_bits_pc(exu_io_exu2LSU_bits_pc),
    .io_exu2LSU_bits_memData(exu_io_exu2LSU_bits_memData),
    .io_exu2LSU_bits_aluData(exu_io_exu2LSU_bits_aluData),
    .io_exu2LSU_bits_csrWData(exu_io_exu2LSU_bits_csrWData),
    .io_exu2LSU_bits_csrData(exu_io_exu2LSU_bits_csrData),
    .io_exu2LSU_bits_immData(exu_io_exu2LSU_bits_immData),
    .io_exu2LSU_bits_rs1Data(exu_io_exu2LSU_bits_rs1Data),
    .io_exu2LSU_bits_inst(exu_io_exu2LSU_bits_inst),
    .io_exu2LSU_bits_regWR(exu_io_exu2LSU_bits_regWR),
    .io_exu2LSU_bits_memWR(exu_io_exu2LSU_bits_memWR),
    .io_exu2LSU_bits_memValid(exu_io_exu2LSU_bits_memValid),
    .io_exu2LSU_bits_memOP(exu_io_exu2LSU_bits_memOP),
    .io_exu2LSU_bits_toReg(exu_io_exu2LSU_bits_toReg),
    .io_exu2LSU_bits_ecall(exu_io_exu2LSU_bits_ecall),
    .io_exu2LSU_bits_csrEn(exu_io_exu2LSU_bits_csrEn),
    .io_exu2LSU_bits_csrWr(exu_io_exu2LSU_bits_csrWr),
    .io_exu2CSR_csrData(exu_io_exu2CSR_csrData),
    .io_exu2CSR_mret(exu_io_exu2CSR_mret),
    .io_exu2CSR_ecall(exu_io_exu2CSR_ecall),
    .io_exu2CSR_csr(exu_io_exu2CSR_csr),
    .io_exu2Branch_branchCtr(exu_io_exu2Branch_branchCtr),
    .io_exu2Branch_less(exu_io_exu2Branch_less),
    .io_exu2Branch_zero(exu_io_exu2Branch_zero),
    .io_rd(exu_io_rd),
    .io_flush(exu_io_flush)
  );
  LSU lsu ( // @[src/main/scala/Main.scala 38:49]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_exu2LSU_ready(lsu_io_exu2LSU_ready),
    .io_exu2LSU_valid(lsu_io_exu2LSU_valid),
    .io_exu2LSU_bits_pc(lsu_io_exu2LSU_bits_pc),
    .io_exu2LSU_bits_memData(lsu_io_exu2LSU_bits_memData),
    .io_exu2LSU_bits_aluData(lsu_io_exu2LSU_bits_aluData),
    .io_exu2LSU_bits_csrWData(lsu_io_exu2LSU_bits_csrWData),
    .io_exu2LSU_bits_csrData(lsu_io_exu2LSU_bits_csrData),
    .io_exu2LSU_bits_inst(lsu_io_exu2LSU_bits_inst),
    .io_exu2LSU_bits_regWR(lsu_io_exu2LSU_bits_regWR),
    .io_exu2LSU_bits_memWR(lsu_io_exu2LSU_bits_memWR),
    .io_exu2LSU_bits_memValid(lsu_io_exu2LSU_bits_memValid),
    .io_exu2LSU_bits_memOP(lsu_io_exu2LSU_bits_memOP),
    .io_exu2LSU_bits_toReg(lsu_io_exu2LSU_bits_toReg),
    .io_exu2LSU_bits_ecall(lsu_io_exu2LSU_bits_ecall),
    .io_exu2LSU_bits_csrEn(lsu_io_exu2LSU_bits_csrEn),
    .io_exu2LSU_bits_csrWr(lsu_io_exu2LSU_bits_csrWr),
    .io_lsu2Mem_awready(lsu_io_lsu2Mem_awready),
    .io_lsu2Mem_awvalid(lsu_io_lsu2Mem_awvalid),
    .io_lsu2Mem_awaddr(lsu_io_lsu2Mem_awaddr),
    .io_lsu2Mem_awsize(lsu_io_lsu2Mem_awsize),
    .io_lsu2Mem_wready(lsu_io_lsu2Mem_wready),
    .io_lsu2Mem_wvalid(lsu_io_lsu2Mem_wvalid),
    .io_lsu2Mem_wdata(lsu_io_lsu2Mem_wdata),
    .io_lsu2Mem_wstrb(lsu_io_lsu2Mem_wstrb),
    .io_lsu2Mem_wlast(lsu_io_lsu2Mem_wlast),
    .io_lsu2Mem_bready(lsu_io_lsu2Mem_bready),
    .io_lsu2Mem_bvalid(lsu_io_lsu2Mem_bvalid),
    .io_lsu2Mem_bresp(lsu_io_lsu2Mem_bresp),
    .io_lsu2Mem_arready(lsu_io_lsu2Mem_arready),
    .io_lsu2Mem_arvalid(lsu_io_lsu2Mem_arvalid),
    .io_lsu2Mem_araddr(lsu_io_lsu2Mem_araddr),
    .io_lsu2Mem_arsize(lsu_io_lsu2Mem_arsize),
    .io_lsu2Mem_rready(lsu_io_lsu2Mem_rready),
    .io_lsu2Mem_rvalid(lsu_io_lsu2Mem_rvalid),
    .io_lsu2Mem_rdata(lsu_io_lsu2Mem_rdata),
    .io_lsu2Mem_rlast(lsu_io_lsu2Mem_rlast),
    .io_lsu2WBU_valid(lsu_io_lsu2WBU_valid),
    .io_lsu2WBU_bits_pc(lsu_io_lsu2WBU_bits_pc),
    .io_lsu2WBU_bits_memData(lsu_io_lsu2WBU_bits_memData),
    .io_lsu2WBU_bits_aluData(lsu_io_lsu2WBU_bits_aluData),
    .io_lsu2WBU_bits_csrWData(lsu_io_lsu2WBU_bits_csrWData),
    .io_lsu2WBU_bits_csrData(lsu_io_lsu2WBU_bits_csrData),
    .io_lsu2WBU_bits_inst(lsu_io_lsu2WBU_bits_inst),
    .io_lsu2WBU_bits_regWR(lsu_io_lsu2WBU_bits_regWR),
    .io_lsu2WBU_bits_toReg(lsu_io_lsu2WBU_bits_toReg),
    .io_lsu2WBU_bits_ecall(lsu_io_lsu2WBU_bits_ecall),
    .io_lsu2WBU_bits_csrEn(lsu_io_lsu2WBU_bits_csrEn),
    .io_lsu2WBU_bits_csrWr(lsu_io_lsu2WBU_bits_csrWr),
    .io_lsu2WBU_bits_fencei(lsu_io_lsu2WBU_bits_fencei),
    .io_lsu2WBU_bits_skip(lsu_io_lsu2WBU_bits_skip),
    .io_rd(lsu_io_rd),
    .io_bypassValid(lsu_io_bypassValid)
  );
  WBU wbu ( // @[src/main/scala/Main.scala 39:49]
    .clock(wbu_clock),
    .reset(wbu_reset),
    .io_lsu2WBU_ready(wbu_io_lsu2WBU_ready),
    .io_lsu2WBU_valid(wbu_io_lsu2WBU_valid),
    .io_lsu2WBU_bits_pc(wbu_io_lsu2WBU_bits_pc),
    .io_lsu2WBU_bits_memData(wbu_io_lsu2WBU_bits_memData),
    .io_lsu2WBU_bits_aluData(wbu_io_lsu2WBU_bits_aluData),
    .io_lsu2WBU_bits_csrWData(wbu_io_lsu2WBU_bits_csrWData),
    .io_lsu2WBU_bits_csrData(wbu_io_lsu2WBU_bits_csrData),
    .io_lsu2WBU_bits_inst(wbu_io_lsu2WBU_bits_inst),
    .io_lsu2WBU_bits_regWR(wbu_io_lsu2WBU_bits_regWR),
    .io_lsu2WBU_bits_toReg(wbu_io_lsu2WBU_bits_toReg),
    .io_lsu2WBU_bits_ecall(wbu_io_lsu2WBU_bits_ecall),
    .io_lsu2WBU_bits_csrEn(wbu_io_lsu2WBU_bits_csrEn),
    .io_lsu2WBU_bits_csrWr(wbu_io_lsu2WBU_bits_csrWr),
    .io_lsu2WBU_bits_fencei(wbu_io_lsu2WBU_bits_fencei),
    .io_lsu2WBU_bits_skip(wbu_io_lsu2WBU_bits_skip),
    .io_wbu2CSR_pc(wbu_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(wbu_io_wbu2CSR_csrWData),
    .io_wbu2CSR_mtvec(wbu_io_wbu2CSR_mtvec),
    .io_wbu2CSR_csr(wbu_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(wbu_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(wbu_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(wbu_io_wbu2CSR_csrWr),
    .io_wbu2BaseReg_rdIndex(wbu_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(wbu_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(wbu_io_wbu2BaseReg_regWR),
    .io_wbu2Icache(wbu_io_wbu2Icache),
    .io_rd(wbu_io_rd),
    .io_flush(wbu_io_flush),
    .io_correctPC(wbu_io_correctPC)
  );
  XbarAXI xbarAXI ( // @[src/main/scala/Main.scala 40:49]
    .clock(xbarAXI_clock),
    .reset(xbarAXI_reset),
    .io_axiSlaveIFU_bready(xbarAXI_io_axiSlaveIFU_bready),
    .io_axiSlaveIFU_bvalid(xbarAXI_io_axiSlaveIFU_bvalid),
    .io_axiSlaveIFU_bresp(xbarAXI_io_axiSlaveIFU_bresp),
    .io_axiSlaveIFU_arready(xbarAXI_io_axiSlaveIFU_arready),
    .io_axiSlaveIFU_arvalid(xbarAXI_io_axiSlaveIFU_arvalid),
    .io_axiSlaveIFU_araddr(xbarAXI_io_axiSlaveIFU_araddr),
    .io_axiSlaveIFU_arlen(xbarAXI_io_axiSlaveIFU_arlen),
    .io_axiSlaveIFU_rready(xbarAXI_io_axiSlaveIFU_rready),
    .io_axiSlaveIFU_rvalid(xbarAXI_io_axiSlaveIFU_rvalid),
    .io_axiSlaveIFU_rdata(xbarAXI_io_axiSlaveIFU_rdata),
    .io_axiSlaveIFU_rlast(xbarAXI_io_axiSlaveIFU_rlast),
    .io_axiSlaveLSU_awready(xbarAXI_io_axiSlaveLSU_awready),
    .io_axiSlaveLSU_awvalid(xbarAXI_io_axiSlaveLSU_awvalid),
    .io_axiSlaveLSU_awaddr(xbarAXI_io_axiSlaveLSU_awaddr),
    .io_axiSlaveLSU_awsize(xbarAXI_io_axiSlaveLSU_awsize),
    .io_axiSlaveLSU_wready(xbarAXI_io_axiSlaveLSU_wready),
    .io_axiSlaveLSU_wvalid(xbarAXI_io_axiSlaveLSU_wvalid),
    .io_axiSlaveLSU_wdata(xbarAXI_io_axiSlaveLSU_wdata),
    .io_axiSlaveLSU_wstrb(xbarAXI_io_axiSlaveLSU_wstrb),
    .io_axiSlaveLSU_wlast(xbarAXI_io_axiSlaveLSU_wlast),
    .io_axiSlaveLSU_bvalid(xbarAXI_io_axiSlaveLSU_bvalid),
    .io_axiSlaveLSU_bresp(xbarAXI_io_axiSlaveLSU_bresp),
    .io_axiSlaveLSU_arready(xbarAXI_io_axiSlaveLSU_arready),
    .io_axiSlaveLSU_arvalid(xbarAXI_io_axiSlaveLSU_arvalid),
    .io_axiSlaveLSU_araddr(xbarAXI_io_axiSlaveLSU_araddr),
    .io_axiSlaveLSU_arsize(xbarAXI_io_axiSlaveLSU_arsize),
    .io_axiSlaveLSU_rready(xbarAXI_io_axiSlaveLSU_rready),
    .io_axiSlaveLSU_rvalid(xbarAXI_io_axiSlaveLSU_rvalid),
    .io_axiSlaveLSU_rdata(xbarAXI_io_axiSlaveLSU_rdata),
    .io_axiSlaveLSU_rlast(xbarAXI_io_axiSlaveLSU_rlast),
    .io_axiMasterDevice_awready(xbarAXI_io_axiMasterDevice_awready),
    .io_axiMasterDevice_awvalid(xbarAXI_io_axiMasterDevice_awvalid),
    .io_axiMasterDevice_awaddr(xbarAXI_io_axiMasterDevice_awaddr),
    .io_axiMasterDevice_awsize(xbarAXI_io_axiMasterDevice_awsize),
    .io_axiMasterDevice_wready(xbarAXI_io_axiMasterDevice_wready),
    .io_axiMasterDevice_wvalid(xbarAXI_io_axiMasterDevice_wvalid),
    .io_axiMasterDevice_wdata(xbarAXI_io_axiMasterDevice_wdata),
    .io_axiMasterDevice_wstrb(xbarAXI_io_axiMasterDevice_wstrb),
    .io_axiMasterDevice_wlast(xbarAXI_io_axiMasterDevice_wlast),
    .io_axiMasterDevice_bready(xbarAXI_io_axiMasterDevice_bready),
    .io_axiMasterDevice_bvalid(xbarAXI_io_axiMasterDevice_bvalid),
    .io_axiMasterDevice_bresp(xbarAXI_io_axiMasterDevice_bresp),
    .io_axiMasterDevice_arready(xbarAXI_io_axiMasterDevice_arready),
    .io_axiMasterDevice_arvalid(xbarAXI_io_axiMasterDevice_arvalid),
    .io_axiMasterDevice_araddr(xbarAXI_io_axiMasterDevice_araddr),
    .io_axiMasterDevice_arlen(xbarAXI_io_axiMasterDevice_arlen),
    .io_axiMasterDevice_arsize(xbarAXI_io_axiMasterDevice_arsize),
    .io_axiMasterDevice_rready(xbarAXI_io_axiMasterDevice_rready),
    .io_axiMasterDevice_rvalid(xbarAXI_io_axiMasterDevice_rvalid),
    .io_axiMasterDevice_rdata(xbarAXI_io_axiMasterDevice_rdata),
    .io_axiMasterDevice_rlast(xbarAXI_io_axiMasterDevice_rlast),
    .io_axiLiteClint_arAddr(xbarAXI_io_axiLiteClint_arAddr),
    .io_axiLiteClint_arValid(xbarAXI_io_axiLiteClint_arValid),
    .io_axiLiteClint_arReady(xbarAXI_io_axiLiteClint_arReady),
    .io_axiLiteClint_rData(xbarAXI_io_axiLiteClint_rData),
    .io_axiLiteClint_rValid(xbarAXI_io_axiLiteClint_rValid),
    .io_axiLiteClint_rReady(xbarAXI_io_axiLiteClint_rReady),
    .io_axiLiteClint_awValid(xbarAXI_io_axiLiteClint_awValid),
    .io_axiLiteClint_awReady(xbarAXI_io_axiLiteClint_awReady),
    .io_axiLiteClint_wValid(xbarAXI_io_axiLiteClint_wValid),
    .io_axiLiteClint_wReady(xbarAXI_io_axiLiteClint_wReady),
    .io_axiLiteClint_bValid(xbarAXI_io_axiLiteClint_bValid),
    .io_axiLiteClint_bReady(xbarAXI_io_axiLiteClint_bReady)
  );
  AXISkidBuffer icacheSkidBuffer ( // @[src/main/scala/Main.scala 41:37]
    .io_axiMaster_bready(icacheSkidBuffer_io_axiMaster_bready),
    .io_axiMaster_bvalid(icacheSkidBuffer_io_axiMaster_bvalid),
    .io_axiMaster_bresp(icacheSkidBuffer_io_axiMaster_bresp),
    .io_axiMaster_arready(icacheSkidBuffer_io_axiMaster_arready),
    .io_axiMaster_arvalid(icacheSkidBuffer_io_axiMaster_arvalid),
    .io_axiMaster_araddr(icacheSkidBuffer_io_axiMaster_araddr),
    .io_axiMaster_arlen(icacheSkidBuffer_io_axiMaster_arlen),
    .io_axiMaster_rready(icacheSkidBuffer_io_axiMaster_rready),
    .io_axiMaster_rvalid(icacheSkidBuffer_io_axiMaster_rvalid),
    .io_axiMaster_rdata(icacheSkidBuffer_io_axiMaster_rdata),
    .io_axiMaster_rlast(icacheSkidBuffer_io_axiMaster_rlast),
    .io_axiSlave_bready(icacheSkidBuffer_io_axiSlave_bready),
    .io_axiSlave_bvalid(icacheSkidBuffer_io_axiSlave_bvalid),
    .io_axiSlave_bresp(icacheSkidBuffer_io_axiSlave_bresp),
    .io_axiSlave_arready(icacheSkidBuffer_io_axiSlave_arready),
    .io_axiSlave_arvalid(icacheSkidBuffer_io_axiSlave_arvalid),
    .io_axiSlave_araddr(icacheSkidBuffer_io_axiSlave_araddr),
    .io_axiSlave_arlen(icacheSkidBuffer_io_axiSlave_arlen),
    .io_axiSlave_rready(icacheSkidBuffer_io_axiSlave_rready),
    .io_axiSlave_rvalid(icacheSkidBuffer_io_axiSlave_rvalid),
    .io_axiSlave_rdata(icacheSkidBuffer_io_axiSlave_rdata),
    .io_axiSlave_rlast(icacheSkidBuffer_io_axiSlave_rlast)
  );
  Icache icache ( // @[src/main/scala/Main.scala 49:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_ifu2ICache_ready(icache_io_ifu2ICache_ready),
    .io_ifu2ICache_valid(icache_io_ifu2ICache_valid),
    .io_ifu2ICache_bits_pc(icache_io_ifu2ICache_bits_pc),
    .io_icache2IFU_ready(icache_io_icache2IFU_ready),
    .io_icache2IFU_valid(icache_io_icache2IFU_valid),
    .io_icache2IFU_bits_pc(icache_io_icache2IFU_bits_pc),
    .io_icache2IFU_bits_inst(icache_io_icache2IFU_bits_inst),
    .io_icache2Mem_bready(icache_io_icache2Mem_bready),
    .io_icache2Mem_bvalid(icache_io_icache2Mem_bvalid),
    .io_icache2Mem_bresp(icache_io_icache2Mem_bresp),
    .io_icache2Mem_arready(icache_io_icache2Mem_arready),
    .io_icache2Mem_arvalid(icache_io_icache2Mem_arvalid),
    .io_icache2Mem_araddr(icache_io_icache2Mem_araddr),
    .io_icache2Mem_arlen(icache_io_icache2Mem_arlen),
    .io_icache2Mem_rready(icache_io_icache2Mem_rready),
    .io_icache2Mem_rvalid(icache_io_icache2Mem_rvalid),
    .io_icache2Mem_rdata(icache_io_icache2Mem_rdata),
    .io_icache2Mem_rlast(icache_io_icache2Mem_rlast),
    .io_wbu2Icache(icache_io_wbu2Icache),
    .io_flush(icache_io_flush)
  );
  BranchCond branchCond ( // @[src/main/scala/Main.scala 87:41]
    .io_branch(branchCond_io_branch),
    .io_less(branchCond_io_less),
    .io_zero(branchCond_io_zero),
    .io_pcASrc(branchCond_io_pcASrc),
    .io_pcBSrc(branchCond_io_pcBSrc)
  );
  BranchCheck branchCheck ( // @[src/main/scala/Main.scala 107:41]
    .io_predictPC(branchCheck_io_predictPC),
    .io_correctPC(branchCheck_io_correctPC),
    .io_correct(branchCheck_io_correct)
  );
  PerformanceCounter RAWC ( // @[src/main/scala/Main.scala 159:57]
    .valid(RAWC_valid),
    .counterType(RAWC_counterType),
    .data(RAWC_data)
  );
  PerformanceCounter EFC ( // @[src/main/scala/Main.scala 165:33]
    .valid(EFC_valid),
    .counterType(EFC_counterType),
    .data(EFC_data)
  );
  AXIAccessFault axiAccessFault ( // @[src/main/scala/Main.scala 186:44]
    .valid(axiAccessFault_valid),
    .ready(axiAccessFault_ready),
    .resp(axiAccessFault_resp)
  );
  AXILiteClint axiLiteClint ( // @[src/main/scala/Main.scala 208:34]
    .clock(axiLiteClint_clock),
    .reset(axiLiteClint_reset),
    .io_axiLiteMaster_arAddr(axiLiteClint_io_axiLiteMaster_arAddr),
    .io_axiLiteMaster_arValid(axiLiteClint_io_axiLiteMaster_arValid),
    .io_axiLiteMaster_arReady(axiLiteClint_io_axiLiteMaster_arReady),
    .io_axiLiteMaster_rData(axiLiteClint_io_axiLiteMaster_rData),
    .io_axiLiteMaster_rValid(axiLiteClint_io_axiLiteMaster_rValid),
    .io_axiLiteMaster_rReady(axiLiteClint_io_axiLiteMaster_rReady),
    .io_axiLiteMaster_awValid(axiLiteClint_io_axiLiteMaster_awValid),
    .io_axiLiteMaster_awReady(axiLiteClint_io_axiLiteMaster_awReady),
    .io_axiLiteMaster_wValid(axiLiteClint_io_axiLiteMaster_wValid),
    .io_axiLiteMaster_wReady(axiLiteClint_io_axiLiteMaster_wReady),
    .io_axiLiteMaster_bValid(axiLiteClint_io_axiLiteMaster_bValid),
    .io_axiLiteMaster_bReady(axiLiteClint_io_axiLiteMaster_bReady)
  );
  assign io_master_awvalid = xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 205:36]
  assign io_master_awaddr = xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 205:36]
  assign io_master_awid = 4'h0; // @[src/main/scala/Main.scala 205:36]
  assign io_master_awlen = 8'h0; // @[src/main/scala/Main.scala 205:36]
  assign io_master_awsize = xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 205:36]
  assign io_master_awburst = 2'h1; // @[src/main/scala/Main.scala 205:36]
  assign io_master_wvalid = xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 205:36]
  assign io_master_wdata = xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 205:36]
  assign io_master_wstrb = xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 205:36]
  assign io_master_wlast = xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 205:36]
  assign io_master_bready = xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 205:36]
  assign io_master_arvalid = xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 205:36]
  assign io_master_araddr = xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 205:36]
  assign io_master_arid = 4'h0; // @[src/main/scala/Main.scala 205:36]
  assign io_master_arlen = xbarAXI_io_axiMasterDevice_arlen; // @[src/main/scala/Main.scala 205:36]
  assign io_master_arsize = xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 205:36]
  assign io_master_arburst = 2'h1; // @[src/main/scala/Main.scala 205:36]
  assign io_master_rready = xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 205:36]
  assign io_slave_awready = 1'h0; // @[src/main/scala/basemode/Interface.scala 233:21]
  assign io_slave_wready = 1'h0; // @[src/main/scala/basemode/Interface.scala 235:20]
  assign io_slave_bvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 237:20]
  assign io_slave_bresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 238:19]
  assign io_slave_bid = 4'h0; // @[src/main/scala/basemode/Interface.scala 239:17]
  assign io_slave_arready = 1'h0; // @[src/main/scala/basemode/Interface.scala 241:21]
  assign io_slave_rvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 243:20]
  assign io_slave_rresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 244:19]
  assign io_slave_rdata = 32'h0; // @[src/main/scala/basemode/Interface.scala 245:19]
  assign io_slave_rlast = 1'h0; // @[src/main/scala/basemode/Interface.scala 246:19]
  assign io_slave_rid = 4'h0; // @[src/main/scala/basemode/Interface.scala 247:17]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_inst_ready = idu_io_inst_ready; // @[src/main/scala/Main.scala 126:33]
  assign ifu_io_ifu2ICache_ready = icache_io_ifu2ICache_ready; // @[src/main/scala/Main.scala 181:41]
  assign ifu_io_icache2IFU_valid = icache_io_icache2IFU_valid; // @[src/main/scala/Main.scala 182:33]
  assign ifu_io_icache2IFU_bits_pc = icache_io_icache2IFU_bits_pc; // @[src/main/scala/Main.scala 182:33]
  assign ifu_io_icache2IFU_bits_inst = icache_io_icache2IFU_bits_inst; // @[src/main/scala/Main.scala 182:33]
  assign ifu_io_flush = branchFlush | wbu_io_flush; // @[src/main/scala/Main.scala 56:47]
  assign ifu_io_correctPC = wbu_io_flush ? wbu_io_correctPC : _ifu_io_correctPC_T; // @[src/main/scala/Main.scala 142:47]
  assign ifu_io_fromPC = fromPCReg; // @[src/main/scala/Main.scala 143:41]
  assign riscv32BaseReg_clock = clock;
  assign riscv32BaseReg_reset = reset;
  assign riscv32BaseReg_io_idu2BaseReg_rs1Index = idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 192:33]
  assign riscv32BaseReg_io_idu2BaseReg_rs2Index = idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 192:33]
  assign riscv32BaseReg_io_wbu2BaseReg_rdIndex = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 199:41]
  assign riscv32BaseReg_io_wbu2BaseReg_data = wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 199:41]
  assign riscv32BaseReg_io_wbu2BaseReg_regWR = wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 199:41]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_exu2CSR_mret = exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 194:25]
  assign csrReg_io_exu2CSR_ecall = exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 194:25]
  assign csrReg_io_exu2CSR_csr = exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 194:25]
  assign csrReg_io_wbu2CSR_pc = wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 198:41]
  assign csrReg_io_wbu2CSR_csrWData = wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 198:41]
  assign csrReg_io_wbu2CSR_csr = wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 198:41]
  assign csrReg_io_wbu2CSR_ecall = wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 198:41]
  assign csrReg_io_wbu2CSR_csrEn = wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 198:41]
  assign csrReg_io_wbu2CSR_csrWr = wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 198:41]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_inst_valid = ifu_io_inst_valid & idu_io_inst_ready; // @[src/main/scala/Main.scala 128:50]
  assign idu_io_inst_bits_inst = idu_io_inst_bits_r_inst; // @[src/main/scala/Main.scala 127:33]
  assign idu_io_inst_bits_pc = idu_io_inst_bits_r_pc; // @[src/main/scala/Main.scala 127:33]
  assign idu_io_idu2EXU_ready = exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 126:33]
  assign idu_io_idu2BaseReg_rs1Data = riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 192:33]
  assign idu_io_idu2BaseReg_rs2Data = riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 192:33]
  assign idu_io_iduBypass_rd_0 = exu_io_exu2LSU_bits_inst[10:7]; // @[src/main/scala/Main.scala 59:39 63:33]
  assign idu_io_iduBypass_rd_1 = lsu_io_lsu2WBU_bits_inst[10:7]; // @[src/main/scala/Main.scala 59:39 64:33]
  assign idu_io_iduBypass_rd_2 = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 59:39 65:33]
  assign idu_io_iduBypass_data_0 = _bypassData_0_T ? exu_io_exu2LSU_bits_aluData : _bypassData_0_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign idu_io_iduBypass_data_1 = _bypassData_1_T ? lsu_io_lsu2WBU_bits_aluData : _bypassData_1_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign idu_io_iduBypass_data_2 = wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 60:39 75:25]
  assign idu_io_iduBypass_regWR_0 = exu_io_exu2LSU_bits_regWR & bypassRd_0 != 4'h0; // @[src/main/scala/Main.scala 76:54]
  assign idu_io_iduBypass_regWR_1 = lsu_io_lsu2WBU_bits_regWR & bypassRd_1 != 4'h0; // @[src/main/scala/Main.scala 77:54]
  assign idu_io_iduBypass_regWR_2 = wbu_io_wbu2BaseReg_regWR & bypassRd_2 != 4'h0; // @[src/main/scala/Main.scala 78:53]
  assign idu_io_iduBypass_Valid_0 = exu_io_exu2LSU_bits_toReg != 2'h1 & _branchFlush_T_4; // @[src/main/scala/Main.scala 79:64]
  assign idu_io_iduBypass_Valid_1 = lsu_io_bypassValid; // @[src/main/scala/Main.scala 62:39 80:25]
  assign idu_io_isRAW = isRAW & (state == 2'h0 | state == 2'h1); // @[src/main/scala/Main.scala 144:51]
  assign idu_io_flush = branchFlush | wbu_io_flush; // @[src/main/scala/Main.scala 56:47]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_idu2EXU_valid = idu_io_idu2EXU_valid & exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 128:50]
  assign exu_io_idu2EXU_bits_pc = exu_io_idu2EXU_bits_r_pc; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_rs1Data = exu_io_idu2EXU_bits_r_rs1Data; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_rs2Data = exu_io_idu2EXU_bits_r_rs2Data; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_imm = exu_io_idu2EXU_bits_r_imm; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_inst = exu_io_idu2EXU_bits_r_inst; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_regWR = exu_io_idu2EXU_bits_r_regWR; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_srcAALU = exu_io_idu2EXU_bits_r_srcAALU; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_srcBALU = exu_io_idu2EXU_bits_r_srcBALU; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_ctrALU = exu_io_idu2EXU_bits_r_ctrALU; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_branch = exu_io_idu2EXU_bits_r_branch; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_toReg = exu_io_idu2EXU_bits_r_toReg; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_memWR = exu_io_idu2EXU_bits_r_memWR; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_memValid = exu_io_idu2EXU_bits_r_memValid; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_memOP = exu_io_idu2EXU_bits_r_memOP; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_rs1Index = exu_io_idu2EXU_bits_r_rs1Index; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_ecall = exu_io_idu2EXU_bits_r_ecall; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_mret = exu_io_idu2EXU_bits_r_mret; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_csrEn = exu_io_idu2EXU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_csrWr = exu_io_idu2EXU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_csrOP = exu_io_idu2EXU_bits_r_csrOP; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_idu2EXU_bits_csrALUOP = exu_io_idu2EXU_bits_r_csrALUOP; // @[src/main/scala/Main.scala 127:33]
  assign exu_io_exu2LSU_ready = lsu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 126:33]
  assign exu_io_exu2CSR_csrData = csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 194:25]
  assign exu_io_flush = branchFlush | wbu_io_flush; // @[src/main/scala/Main.scala 56:47]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_exu2LSU_valid = exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 128:50]
  assign lsu_io_exu2LSU_bits_pc = lsu_io_exu2LSU_bits_r_pc; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_memData = lsu_io_exu2LSU_bits_r_memData; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_aluData = lsu_io_exu2LSU_bits_r_aluData; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_csrWData = lsu_io_exu2LSU_bits_r_csrWData; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_csrData = lsu_io_exu2LSU_bits_r_csrData; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_inst = lsu_io_exu2LSU_bits_r_inst; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_regWR = lsu_io_exu2LSU_bits_r_regWR; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_memWR = lsu_io_exu2LSU_bits_r_memWR; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_memValid = lsu_io_exu2LSU_bits_r_memValid; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_memOP = lsu_io_exu2LSU_bits_r_memOP; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_toReg = lsu_io_exu2LSU_bits_r_toReg; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_ecall = lsu_io_exu2LSU_bits_r_ecall; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_csrEn = lsu_io_exu2LSU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_exu2LSU_bits_csrWr = lsu_io_exu2LSU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:33]
  assign lsu_io_lsu2Mem_awready = xbarAXI_io_axiSlaveLSU_awready; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_wready = xbarAXI_io_axiSlaveLSU_wready; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_bvalid = xbarAXI_io_axiSlaveLSU_bvalid; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_bresp = xbarAXI_io_axiSlaveLSU_bresp; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_arready = xbarAXI_io_axiSlaveLSU_arready; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_rvalid = xbarAXI_io_axiSlaveLSU_rvalid; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_rdata = xbarAXI_io_axiSlaveLSU_rdata; // @[src/main/scala/Main.scala 196:25]
  assign lsu_io_lsu2Mem_rlast = xbarAXI_io_axiSlaveLSU_rlast; // @[src/main/scala/Main.scala 196:25]
  assign wbu_clock = clock;
  assign wbu_reset = reset;
  assign wbu_io_lsu2WBU_valid = lsu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 128:50]
  assign wbu_io_lsu2WBU_bits_pc = wbu_io_lsu2WBU_bits_r_pc; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_memData = wbu_io_lsu2WBU_bits_r_memData; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_aluData = wbu_io_lsu2WBU_bits_r_aluData; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_csrWData = wbu_io_lsu2WBU_bits_r_csrWData; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_csrData = wbu_io_lsu2WBU_bits_r_csrData; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_inst = wbu_io_lsu2WBU_bits_r_inst; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_regWR = wbu_io_lsu2WBU_bits_r_regWR; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_toReg = wbu_io_lsu2WBU_bits_r_toReg; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_ecall = wbu_io_lsu2WBU_bits_r_ecall; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_csrEn = wbu_io_lsu2WBU_bits_r_csrEn; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_csrWr = wbu_io_lsu2WBU_bits_r_csrWr; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_fencei = wbu_io_lsu2WBU_bits_r_fencei; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_lsu2WBU_bits_skip = wbu_io_lsu2WBU_bits_r_skip; // @[src/main/scala/Main.scala 127:33]
  assign wbu_io_wbu2CSR_mtvec = csrReg_io_wbu2CSR_mtvec; // @[src/main/scala/Main.scala 198:41]
  assign xbarAXI_clock = clock;
  assign xbarAXI_reset = reset;
  assign xbarAXI_io_axiSlaveIFU_bready = icacheSkidBuffer_io_axiMaster_bready; // @[src/main/scala/Main.scala 184:41]
  assign xbarAXI_io_axiSlaveIFU_arvalid = icacheSkidBuffer_io_axiMaster_arvalid; // @[src/main/scala/Main.scala 184:41]
  assign xbarAXI_io_axiSlaveIFU_araddr = icacheSkidBuffer_io_axiMaster_araddr; // @[src/main/scala/Main.scala 184:41]
  assign xbarAXI_io_axiSlaveIFU_arlen = icacheSkidBuffer_io_axiMaster_arlen; // @[src/main/scala/Main.scala 184:41]
  assign xbarAXI_io_axiSlaveIFU_rready = icacheSkidBuffer_io_axiMaster_rready; // @[src/main/scala/Main.scala 184:41]
  assign xbarAXI_io_axiSlaveLSU_awvalid = lsu_io_lsu2Mem_awvalid; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_awaddr = lsu_io_lsu2Mem_awaddr; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_awsize = lsu_io_lsu2Mem_awsize; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_wvalid = lsu_io_lsu2Mem_wvalid; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_wdata = lsu_io_lsu2Mem_wdata; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_wstrb = lsu_io_lsu2Mem_wstrb; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_wlast = lsu_io_lsu2Mem_wlast; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_arvalid = lsu_io_lsu2Mem_arvalid; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_araddr = lsu_io_lsu2Mem_araddr; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_arsize = lsu_io_lsu2Mem_arsize; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiSlaveLSU_rready = lsu_io_lsu2Mem_rready; // @[src/main/scala/Main.scala 196:25]
  assign xbarAXI_io_axiMasterDevice_awready = io_master_awready; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_wready = io_master_wready; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_bvalid = io_master_bvalid; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_bresp = io_master_bresp; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_arready = io_master_arready; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_rvalid = io_master_rvalid; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_rdata = io_master_rdata; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiMasterDevice_rlast = io_master_rlast; // @[src/main/scala/Main.scala 205:36]
  assign xbarAXI_io_axiLiteClint_arReady = axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 209:41]
  assign xbarAXI_io_axiLiteClint_rData = axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 209:41]
  assign xbarAXI_io_axiLiteClint_rValid = axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 209:41]
  assign xbarAXI_io_axiLiteClint_awReady = axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 209:41]
  assign xbarAXI_io_axiLiteClint_wReady = axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 209:41]
  assign xbarAXI_io_axiLiteClint_bValid = axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 209:41]
  assign icacheSkidBuffer_io_axiMaster_bvalid = xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiMaster_bresp = xbarAXI_io_axiSlaveIFU_bresp; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiMaster_arready = xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiMaster_rvalid = xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiMaster_rdata = xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiMaster_rlast = xbarAXI_io_axiSlaveIFU_rlast; // @[src/main/scala/Main.scala 184:41]
  assign icacheSkidBuffer_io_axiSlave_bready = icache_io_icache2Mem_bready; // @[src/main/scala/Main.scala 183:41]
  assign icacheSkidBuffer_io_axiSlave_arvalid = icache_io_icache2Mem_arvalid; // @[src/main/scala/Main.scala 183:41]
  assign icacheSkidBuffer_io_axiSlave_araddr = icache_io_icache2Mem_araddr; // @[src/main/scala/Main.scala 183:41]
  assign icacheSkidBuffer_io_axiSlave_arlen = icache_io_icache2Mem_arlen; // @[src/main/scala/Main.scala 183:41]
  assign icacheSkidBuffer_io_axiSlave_rready = icache_io_icache2Mem_rready; // @[src/main/scala/Main.scala 183:41]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_ifu2ICache_valid = ifu_io_ifu2ICache_valid; // @[src/main/scala/Main.scala 181:41]
  assign icache_io_ifu2ICache_bits_pc = ifu_io_ifu2ICache_bits_pc; // @[src/main/scala/Main.scala 181:41]
  assign icache_io_icache2IFU_ready = ifu_io_icache2IFU_ready; // @[src/main/scala/Main.scala 182:33]
  assign icache_io_icache2Mem_bvalid = icacheSkidBuffer_io_axiSlave_bvalid; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_icache2Mem_bresp = icacheSkidBuffer_io_axiSlave_bresp; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_icache2Mem_arready = icacheSkidBuffer_io_axiSlave_arready; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_icache2Mem_rvalid = icacheSkidBuffer_io_axiSlave_rvalid; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_icache2Mem_rdata = icacheSkidBuffer_io_axiSlave_rdata; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_icache2Mem_rlast = icacheSkidBuffer_io_axiSlave_rlast; // @[src/main/scala/Main.scala 183:41]
  assign icache_io_wbu2Icache = wbu_io_wbu2Icache; // @[src/main/scala/Main.scala 201:33]
  assign icache_io_flush = branchFlush | wbu_io_flush; // @[src/main/scala/Main.scala 56:47]
  assign branchCond_io_branch = branchCtrReg; // @[src/main/scala/Main.scala 88:33]
  assign branchCond_io_less = lessReg; // @[src/main/scala/Main.scala 89:41]
  assign branchCond_io_zero = zeroReg; // @[src/main/scala/Main.scala 90:41]
  assign branchCheck_io_predictPC = predictPCReg; // @[src/main/scala/Main.scala 108:34]
  assign branchCheck_io_correctPC = correctPCReg; // @[src/main/scala/Main.scala 109:34]
  assign RAWC_valid = _idu_io_isRAW_T_1 & nextState == 2'h2; // @[src/main/scala/Main.scala 160:62]
  assign RAWC_counterType = 32'hc; // @[src/main/scala/Main.scala 161:41]
  assign RAWC_data = rawCnt; // @[src/main/scala/Main.scala 162:41]
  assign EFC_valid = state == 2'h3 & nextState == 2'h0; // @[src/main/scala/Main.scala 171:64]
  assign EFC_counterType = 32'hb; // @[src/main/scala/Main.scala 172:41]
  assign EFC_data = flushCnt; // @[src/main/scala/Main.scala 173:41]
  assign axiAccessFault_valid = icache_io_icache2Mem_bvalid; // @[src/main/scala/Main.scala 188:41]
  assign axiAccessFault_ready = icache_io_icache2Mem_bready; // @[src/main/scala/Main.scala 187:41]
  assign axiAccessFault_resp = icache_io_icache2Mem_bresp; // @[src/main/scala/Main.scala 189:41]
  assign axiLiteClint_clock = clock;
  assign axiLiteClint_reset = reset;
  assign axiLiteClint_io_axiLiteMaster_arAddr = xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 209:41]
  assign axiLiteClint_io_axiLiteMaster_arValid = xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 209:41]
  assign axiLiteClint_io_axiLiteMaster_rReady = xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 209:41]
  assign axiLiteClint_io_axiLiteMaster_awValid = xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 209:41]
  assign axiLiteClint_io_axiLiteMaster_wValid = xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 209:41]
  assign axiLiteClint_io_axiLiteMaster_bReady = xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 209:41]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Main.scala 54:28]
      state <= 2'h0; // @[src/main/scala/Main.scala 54:28]
    end else if (2'h3 == state) begin // @[src/main/scala/Main.scala 130:46]
      if (flushEndWire) begin // @[src/main/scala/Main.scala 134:31]
        state <= 2'h0;
      end else begin
        state <= 2'h3;
      end
    end else if (2'h2 == state) begin // @[src/main/scala/Main.scala 130:46]
      if (flushWire) begin // @[src/main/scala/Main.scala 133:33]
        state <= 2'h3;
      end else begin
        state <= _nextState_T_7;
      end
    end else if (2'h1 == state) begin // @[src/main/scala/Main.scala 130:46]
      state <= _nextState_T_5;
    end else begin
      state <= _nextState_T_11;
    end
    if (exu2LSUHandReg) begin // @[src/main/scala/Main.scala 104:44]
      correctPCReg <= nextPC; // @[src/main/scala/Main.scala 104:44]
    end
    idu2EXUHandReg <= exu_io_idu2EXU_valid & exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 102:64]
    if (exu_io_exu2LSU_valid & exu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 84:44]
      branchCtrReg <= exu_io_exu2Branch_branchCtr; // @[src/main/scala/Main.scala 84:44]
    end
    if (_branchCtrReg_T) begin // @[src/main/scala/Main.scala 85:44]
      zeroReg <= exu_io_exu2Branch_zero; // @[src/main/scala/Main.scala 85:44]
    end
    if (_branchCtrReg_T) begin // @[src/main/scala/Main.scala 86:44]
      lessReg <= exu_io_exu2Branch_less; // @[src/main/scala/Main.scala 86:44]
    end
    exu2LSUHandReg <= exu_io_exu2LSU_valid & exu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 103:64]
    if (exu2LSUHandReg) begin // @[src/main/scala/Main.scala 105:44]
      fromPCReg <= lsu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 105:44]
    end
    if (idu_io_idu2EXU_valid & idu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 106:44]
      predictPCReg <= idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 106:44]
    end
    IFU2IDUHandReg <= ifu_io_inst_valid & ifu_io_inst_ready; // @[src/main/scala/Main.scala 113:56]
    if (ifu_io_inst_valid & idu_io_inst_ready) begin // @[src/main/scala/Main.scala 127:45]
      idu_io_inst_bits_r_inst <= ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 127:45]
    end
    if (ifu_io_inst_valid & idu_io_inst_ready) begin // @[src/main/scala/Main.scala 127:45]
      idu_io_inst_bits_r_pc <= ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_pc <= idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_rs1Data <= idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_rs2Data <= idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_imm <= idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_inst <= idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_regWR <= idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_srcAALU <= idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_srcBALU <= idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_ctrALU <= idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_branch <= idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_toReg <= idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_memWR <= idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_memValid <= idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_memOP <= idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_rs1Index <= idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_ecall <= idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_mret <= idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_csrEn <= idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_csrWr <= idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_csrOP <= idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 127:45]
    end
    if (idu_io_idu2EXU_valid & exu_io_idu2EXU_ready) begin // @[src/main/scala/Main.scala 127:45]
      exu_io_idu2EXU_bits_r_csrALUOP <= idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_pc <= exu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_memData <= exu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_aluData <= exu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_csrWData <= exu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_csrData <= exu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_inst <= exu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_regWR <= exu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_memWR <= exu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_memValid <= exu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_memOP <= exu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_toReg <= exu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_ecall <= exu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_csrEn <= exu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 127:45]
    end
    if (exu_io_exu2LSU_valid & lsu_io_exu2LSU_ready) begin // @[src/main/scala/Main.scala 127:45]
      lsu_io_exu2LSU_bits_r_csrWr <= exu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_pc <= lsu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_memData <= lsu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_aluData <= lsu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_csrWData <= lsu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_csrData <= lsu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_inst <= lsu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_regWR <= lsu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_toReg <= lsu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_ecall <= lsu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_csrEn <= lsu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_csrWr <= lsu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_fencei <= lsu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 127:45]
    end
    if (lsu_io_lsu2WBU_valid) begin // @[src/main/scala/Main.scala 127:45]
      wbu_io_lsu2WBU_bits_r_skip <= lsu_io_lsu2WBU_bits_skip; // @[src/main/scala/Main.scala 127:45]
    end
    if (reset) begin // @[src/main/scala/Main.scala 153:37]
      rawCnt <= 32'h0; // @[src/main/scala/Main.scala 153:37]
    end else if (nextState == 2'h1) begin // @[src/main/scala/Main.scala 154:43]
      rawCnt <= _rawCnt_T_1; // @[src/main/scala/Main.scala 155:32]
    end else begin
      rawCnt <= 32'h0; // @[src/main/scala/Main.scala 157:32]
    end
    if (reset) begin // @[src/main/scala/Main.scala 164:39]
      flushCnt <= 32'h0; // @[src/main/scala/Main.scala 164:39]
    end else if (nextState == 2'h3) begin // @[src/main/scala/Main.scala 166:45]
      flushCnt <= _flushCnt_T_1; // @[src/main/scala/Main.scala 167:34]
    end else begin
      flushCnt <= 32'h0; // @[src/main/scala/Main.scala 169:34]
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
  _RAND_1 = {1{`RANDOM}};
  correctPCReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  idu2EXUHandReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  branchCtrReg = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  zeroReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  lessReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exu2LSUHandReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  fromPCReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  predictPCReg = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  IFU2IDUHandReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  idu_io_inst_bits_r_inst = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  idu_io_inst_bits_r_pc = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_pc = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_rs1Data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_rs2Data = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_imm = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_inst = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_regWR = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_srcAALU = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_srcBALU = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_ctrALU = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_branch = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_toReg = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_memWR = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_memValid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_memOP = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_rs1Index = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_ecall = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_mret = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_csrEn = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_csrWr = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_csrOP = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  exu_io_idu2EXU_bits_r_csrALUOP = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_pc = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_memData = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_aluData = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_csrWData = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_csrData = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_inst = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_regWR = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_memWR = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_memValid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_memOP = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_toReg = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_ecall = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_csrEn = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  lsu_io_exu2LSU_bits_r_csrWr = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_pc = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_memData = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_aluData = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_csrWData = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_csrData = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_inst = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_regWR = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_toReg = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_ecall = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_csrEn = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_csrWr = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_fencei = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  wbu_io_lsu2WBU_bits_r_skip = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  rawCnt = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  flushCnt = _RAND_61[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
