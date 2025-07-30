module top(
  input         clock,
  input         reset,
  input         io_interrupt, // @[src/main/scala/Main.scala 25:20]
  input         io_master_awready, // @[src/main/scala/Main.scala 25:20]
  output        io_master_awvalid, // @[src/main/scala/Main.scala 25:20]
  output [31:0] io_master_awaddr, // @[src/main/scala/Main.scala 25:20]
  output [3:0]  io_master_awid, // @[src/main/scala/Main.scala 25:20]
  output [7:0]  io_master_awlen, // @[src/main/scala/Main.scala 25:20]
  output [2:0]  io_master_awsize, // @[src/main/scala/Main.scala 25:20]
  output [1:0]  io_master_awburst, // @[src/main/scala/Main.scala 25:20]
  input         io_master_wready, // @[src/main/scala/Main.scala 25:20]
  output        io_master_wvalid, // @[src/main/scala/Main.scala 25:20]
  output [31:0] io_master_wdata, // @[src/main/scala/Main.scala 25:20]
  output [3:0]  io_master_wstrb, // @[src/main/scala/Main.scala 25:20]
  output        io_master_wlast, // @[src/main/scala/Main.scala 25:20]
  output        io_master_bready, // @[src/main/scala/Main.scala 25:20]
  input         io_master_bvalid, // @[src/main/scala/Main.scala 25:20]
  input  [1:0]  io_master_bresp, // @[src/main/scala/Main.scala 25:20]
  input  [3:0]  io_master_bid, // @[src/main/scala/Main.scala 25:20]
  input         io_master_arready, // @[src/main/scala/Main.scala 25:20]
  output        io_master_arvalid, // @[src/main/scala/Main.scala 25:20]
  output [31:0] io_master_araddr, // @[src/main/scala/Main.scala 25:20]
  output [3:0]  io_master_arid, // @[src/main/scala/Main.scala 25:20]
  output [7:0]  io_master_arlen, // @[src/main/scala/Main.scala 25:20]
  output [2:0]  io_master_arsize, // @[src/main/scala/Main.scala 25:20]
  output [1:0]  io_master_arburst, // @[src/main/scala/Main.scala 25:20]
  output        io_master_rready, // @[src/main/scala/Main.scala 25:20]
  input         io_master_rvalid, // @[src/main/scala/Main.scala 25:20]
  input  [1:0]  io_master_rresp, // @[src/main/scala/Main.scala 25:20]
  input  [31:0] io_master_rdata, // @[src/main/scala/Main.scala 25:20]
  input         io_master_rlast, // @[src/main/scala/Main.scala 25:20]
  input  [3:0]  io_master_rid, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_awready, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_awvalid, // @[src/main/scala/Main.scala 25:20]
  input  [31:0] io_slave_awaddr, // @[src/main/scala/Main.scala 25:20]
  input  [3:0]  io_slave_awid, // @[src/main/scala/Main.scala 25:20]
  input  [7:0]  io_slave_awlen, // @[src/main/scala/Main.scala 25:20]
  input  [2:0]  io_slave_awsize, // @[src/main/scala/Main.scala 25:20]
  input  [1:0]  io_slave_awburst, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_wready, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_wvalid, // @[src/main/scala/Main.scala 25:20]
  input  [31:0] io_slave_wdata, // @[src/main/scala/Main.scala 25:20]
  input  [3:0]  io_slave_wstrb, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_wlast, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_bready, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_bvalid, // @[src/main/scala/Main.scala 25:20]
  output [1:0]  io_slave_bresp, // @[src/main/scala/Main.scala 25:20]
  output [3:0]  io_slave_bid, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_arready, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_arvalid, // @[src/main/scala/Main.scala 25:20]
  input  [31:0] io_slave_araddr, // @[src/main/scala/Main.scala 25:20]
  input  [3:0]  io_slave_arid, // @[src/main/scala/Main.scala 25:20]
  input  [7:0]  io_slave_arlen, // @[src/main/scala/Main.scala 25:20]
  input  [2:0]  io_slave_arsize, // @[src/main/scala/Main.scala 25:20]
  input  [1:0]  io_slave_arburst, // @[src/main/scala/Main.scala 25:20]
  input         io_slave_rready, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_rvalid, // @[src/main/scala/Main.scala 25:20]
  output [1:0]  io_slave_rresp, // @[src/main/scala/Main.scala 25:20]
  output [31:0] io_slave_rdata, // @[src/main/scala/Main.scala 25:20]
  output        io_slave_rlast, // @[src/main/scala/Main.scala 25:20]
  output [3:0]  io_slave_rid // @[src/main/scala/Main.scala 25:20]
);
  wire  pc_clock; // @[src/main/scala/Main.scala 31:49]
  wire  pc_reset; // @[src/main/scala/Main.scala 31:49]
  wire  pc_io_wbu2PC_ready; // @[src/main/scala/Main.scala 31:49]
  wire  pc_io_wbu2PC_valid; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] pc_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] pc_io_pc; // @[src/main/scala/Main.scala 31:49]
  wire  ifu_clock; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_reset; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] ifu_io_pc; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_inst_valid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_bvalid; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_arready; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 32:49]
  wire [7:0] ifu_io_ifu2Mem_arlen; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_rvalid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] ifu_io_ifu2Mem_rdata; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_ifu2Mem_rlast; // @[src/main/scala/Main.scala 32:49]
  wire  ifu_io_wbu2Icache; // @[src/main/scala/Main.scala 32:49]
  wire  riscv32BaseReg_clock; // @[src/main/scala/Main.scala 33:41]
  wire  riscv32BaseReg_reset; // @[src/main/scala/Main.scala 33:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 33:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 33:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 33:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 33:41]
  wire [3:0] riscv32BaseReg_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 33:41]
  wire [31:0] riscv32BaseReg_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 33:41]
  wire  riscv32BaseReg_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 33:41]
  wire  csrReg_clock; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_reset; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_io_exu2CSR_mret; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 34:49]
  wire [11:0] csrReg_io_exu2CSR_csr; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] csrReg_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] csrReg_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 34:49]
  wire [11:0] csrReg_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 34:49]
  wire  csrReg_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 34:49]
  wire  idu_clock; // @[src/main/scala/Main.scala 35:49]
  wire  idu_reset; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_inst_ready; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_inst_valid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_inst_bits_inst; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_inst_bits_pc; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 35:49]
  wire [1:0] idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 35:49]
  wire [1:0] idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 35:49]
  wire [1:0] idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 35:49]
  wire [4:0] idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 35:49]
  wire  idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 35:49]
  wire [1:0] idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] idu_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 35:49]
  wire  exu_clock; // @[src/main/scala/Main.scala 36:49]
  wire  exu_reset; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] exu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] exu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] exu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] exu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] exu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 36:49]
  wire [2:0] exu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 36:49]
  wire [4:0] exu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] exu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_immData; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_rs1Data; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 36:49]
  wire [2:0] exu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 36:49]
  wire [1:0] exu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 36:49]
  wire [3:0] exu_io_exu2LSU_bits_branchCtr; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_less; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_zero; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 36:49]
  wire [31:0] exu_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 36:49]
  wire  exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 36:49]
  wire [11:0] exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 36:49]
  wire  lsu_clock; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_reset; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_immData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_rs1Data; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 37:49]
  wire [2:0] lsu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] lsu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] lsu_io_exu2LSU_bits_branchCtr; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_less; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_zero; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_awready; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_awvalid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2Mem_awaddr; // @[src/main/scala/Main.scala 37:49]
  wire [2:0] lsu_io_lsu2Mem_awsize; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_wready; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_wvalid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2Mem_wdata; // @[src/main/scala/Main.scala 37:49]
  wire [3:0] lsu_io_lsu2Mem_wstrb; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_wlast; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_arready; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_arvalid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2Mem_araddr; // @[src/main/scala/Main.scala 37:49]
  wire [2:0] lsu_io_lsu2Mem_arsize; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_rready; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_rvalid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2Mem_rdata; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2Mem_rlast; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_immData; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 37:49]
  wire [31:0] lsu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] lsu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] lsu_io_lsu2WBU_bits_pcASrc; // @[src/main/scala/Main.scala 37:49]
  wire [1:0] lsu_io_lsu2WBU_bits_pcBSrc; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 37:49]
  wire  lsu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 37:49]
  wire  wbu_clock; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_ready; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_immData; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] wbu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] wbu_io_lsu2WBU_bits_pcASrc; // @[src/main/scala/Main.scala 38:49]
  wire [1:0] wbu_io_lsu2WBU_bits_pcBSrc; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 38:49]
  wire [11:0] wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 38:49]
  wire [3:0] wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 38:49]
  wire [31:0] wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 38:49]
  wire  wbu_io_wbu2Icache; // @[src/main/scala/Main.scala 38:49]
  wire  xbarAXI_clock; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_reset; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_bready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_arvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_araddr; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiSlaveIFU_arid; // @[src/main/scala/Main.scala 39:49]
  wire [7:0] xbarAXI_io_axiSlaveIFU_arlen; // @[src/main/scala/Main.scala 39:49]
  wire [2:0] xbarAXI_io_axiSlaveIFU_arsize; // @[src/main/scala/Main.scala 39:49]
  wire [1:0] xbarAXI_io_axiSlaveIFU_arburst; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_rready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 39:49]
  wire [1:0] xbarAXI_io_axiSlaveIFU_rresp; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveIFU_rlast; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiSlaveIFU_rid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_awvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_awaddr; // @[src/main/scala/Main.scala 39:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_awsize; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_wvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_wdata; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiSlaveWBU_wstrb; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_wlast; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_arvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_araddr; // @[src/main/scala/Main.scala 39:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_arsize; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_rready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiSlaveWBU_rlast; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_awready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 39:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_wready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_bvalid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_arready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_arid; // @[src/main/scala/Main.scala 39:49]
  wire [7:0] xbarAXI_io_axiMasterDevice_arlen; // @[src/main/scala/Main.scala 39:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 39:49]
  wire [1:0] xbarAXI_io_axiMasterDevice_arburst; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_rvalid; // @[src/main/scala/Main.scala 39:49]
  wire [1:0] xbarAXI_io_axiMasterDevice_rresp; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_rdata; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiMasterDevice_rlast; // @[src/main/scala/Main.scala 39:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_rid; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_arReady; // @[src/main/scala/Main.scala 39:49]
  wire [31:0] xbarAXI_io_axiLiteClint_rData; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_rValid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_awReady; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_wReady; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_bValid; // @[src/main/scala/Main.scala 39:49]
  wire  xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 39:49]
  wire  ifuSkidBuffer_clock; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_reset; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_bready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_bvalid; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_arready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_arvalid; // @[src/main/scala/Main.scala 40:41]
  wire [31:0] ifuSkidBuffer_io_axiMaster_araddr; // @[src/main/scala/Main.scala 40:41]
  wire [3:0] ifuSkidBuffer_io_axiMaster_arid; // @[src/main/scala/Main.scala 40:41]
  wire [7:0] ifuSkidBuffer_io_axiMaster_arlen; // @[src/main/scala/Main.scala 40:41]
  wire [2:0] ifuSkidBuffer_io_axiMaster_arsize; // @[src/main/scala/Main.scala 40:41]
  wire [1:0] ifuSkidBuffer_io_axiMaster_arburst; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_rready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_rvalid; // @[src/main/scala/Main.scala 40:41]
  wire [1:0] ifuSkidBuffer_io_axiMaster_rresp; // @[src/main/scala/Main.scala 40:41]
  wire [31:0] ifuSkidBuffer_io_axiMaster_rdata; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiMaster_rlast; // @[src/main/scala/Main.scala 40:41]
  wire [3:0] ifuSkidBuffer_io_axiMaster_rid; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_bready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_bvalid; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_arready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_arvalid; // @[src/main/scala/Main.scala 40:41]
  wire [31:0] ifuSkidBuffer_io_axiSlave_araddr; // @[src/main/scala/Main.scala 40:41]
  wire [7:0] ifuSkidBuffer_io_axiSlave_arlen; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_rready; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_rvalid; // @[src/main/scala/Main.scala 40:41]
  wire [31:0] ifuSkidBuffer_io_axiSlave_rdata; // @[src/main/scala/Main.scala 40:41]
  wire  ifuSkidBuffer_io_axiSlave_rlast; // @[src/main/scala/Main.scala 40:41]
  wire  axiLiteClint_clock; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_reset; // @[src/main/scala/Main.scala 77:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_arAddr; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_arValid; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 77:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_rReady; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_awValid; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_wValid; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 77:34]
  wire  axiLiteClint_io_axiLiteMaster_bReady; // @[src/main/scala/Main.scala 77:34]
  PC pc ( // @[src/main/scala/Main.scala 31:49]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_wbu2PC_ready(pc_io_wbu2PC_ready),
    .io_wbu2PC_valid(pc_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(pc_io_wbu2PC_bits_nextPC),
    .io_pc(pc_io_pc)
  );
  IFU ifu ( // @[src/main/scala/Main.scala 32:49]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_pc(ifu_io_pc),
    .io_inst_valid(ifu_io_inst_valid),
    .io_inst_bits_inst(ifu_io_inst_bits_inst),
    .io_inst_bits_pc(ifu_io_inst_bits_pc),
    .io_ifu2Mem_bready(ifu_io_ifu2Mem_bready),
    .io_ifu2Mem_bvalid(ifu_io_ifu2Mem_bvalid),
    .io_ifu2Mem_arready(ifu_io_ifu2Mem_arready),
    .io_ifu2Mem_arvalid(ifu_io_ifu2Mem_arvalid),
    .io_ifu2Mem_araddr(ifu_io_ifu2Mem_araddr),
    .io_ifu2Mem_arlen(ifu_io_ifu2Mem_arlen),
    .io_ifu2Mem_rready(ifu_io_ifu2Mem_rready),
    .io_ifu2Mem_rvalid(ifu_io_ifu2Mem_rvalid),
    .io_ifu2Mem_rdata(ifu_io_ifu2Mem_rdata),
    .io_ifu2Mem_rlast(ifu_io_ifu2Mem_rlast),
    .io_wbu2Icache(ifu_io_wbu2Icache)
  );
  Riscv32BaseReg riscv32BaseReg ( // @[src/main/scala/Main.scala 33:41]
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
  CSRReg csrReg ( // @[src/main/scala/Main.scala 34:49]
    .clock(csrReg_clock),
    .reset(csrReg_reset),
    .io_exu2CSR_csrData(csrReg_io_exu2CSR_csrData),
    .io_exu2CSR_mret(csrReg_io_exu2CSR_mret),
    .io_exu2CSR_ecall(csrReg_io_exu2CSR_ecall),
    .io_exu2CSR_csr(csrReg_io_exu2CSR_csr),
    .io_wbu2CSR_pc(csrReg_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(csrReg_io_wbu2CSR_csrWData),
    .io_wbu2CSR_csr(csrReg_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(csrReg_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(csrReg_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(csrReg_io_wbu2CSR_csrWr)
  );
  IDU idu ( // @[src/main/scala/Main.scala 35:49]
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
    .io_idu2BaseReg_rs2Index(idu_io_idu2BaseReg_rs2Index)
  );
  EXU exu ( // @[src/main/scala/Main.scala 36:49]
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
    .io_exu2LSU_bits_branchCtr(exu_io_exu2LSU_bits_branchCtr),
    .io_exu2LSU_bits_less(exu_io_exu2LSU_bits_less),
    .io_exu2LSU_bits_zero(exu_io_exu2LSU_bits_zero),
    .io_exu2LSU_bits_ecall(exu_io_exu2LSU_bits_ecall),
    .io_exu2LSU_bits_csrEn(exu_io_exu2LSU_bits_csrEn),
    .io_exu2LSU_bits_csrWr(exu_io_exu2LSU_bits_csrWr),
    .io_exu2CSR_csrData(exu_io_exu2CSR_csrData),
    .io_exu2CSR_mret(exu_io_exu2CSR_mret),
    .io_exu2CSR_ecall(exu_io_exu2CSR_ecall),
    .io_exu2CSR_csr(exu_io_exu2CSR_csr)
  );
  LSU lsu ( // @[src/main/scala/Main.scala 37:49]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_exu2LSU_ready(lsu_io_exu2LSU_ready),
    .io_exu2LSU_valid(lsu_io_exu2LSU_valid),
    .io_exu2LSU_bits_pc(lsu_io_exu2LSU_bits_pc),
    .io_exu2LSU_bits_memData(lsu_io_exu2LSU_bits_memData),
    .io_exu2LSU_bits_aluData(lsu_io_exu2LSU_bits_aluData),
    .io_exu2LSU_bits_csrWData(lsu_io_exu2LSU_bits_csrWData),
    .io_exu2LSU_bits_csrData(lsu_io_exu2LSU_bits_csrData),
    .io_exu2LSU_bits_immData(lsu_io_exu2LSU_bits_immData),
    .io_exu2LSU_bits_rs1Data(lsu_io_exu2LSU_bits_rs1Data),
    .io_exu2LSU_bits_inst(lsu_io_exu2LSU_bits_inst),
    .io_exu2LSU_bits_regWR(lsu_io_exu2LSU_bits_regWR),
    .io_exu2LSU_bits_memWR(lsu_io_exu2LSU_bits_memWR),
    .io_exu2LSU_bits_memValid(lsu_io_exu2LSU_bits_memValid),
    .io_exu2LSU_bits_memOP(lsu_io_exu2LSU_bits_memOP),
    .io_exu2LSU_bits_toReg(lsu_io_exu2LSU_bits_toReg),
    .io_exu2LSU_bits_branchCtr(lsu_io_exu2LSU_bits_branchCtr),
    .io_exu2LSU_bits_less(lsu_io_exu2LSU_bits_less),
    .io_exu2LSU_bits_zero(lsu_io_exu2LSU_bits_zero),
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
    .io_lsu2WBU_bits_immData(lsu_io_lsu2WBU_bits_immData),
    .io_lsu2WBU_bits_rs1Data(lsu_io_lsu2WBU_bits_rs1Data),
    .io_lsu2WBU_bits_inst(lsu_io_lsu2WBU_bits_inst),
    .io_lsu2WBU_bits_regWR(lsu_io_lsu2WBU_bits_regWR),
    .io_lsu2WBU_bits_toReg(lsu_io_lsu2WBU_bits_toReg),
    .io_lsu2WBU_bits_pcASrc(lsu_io_lsu2WBU_bits_pcASrc),
    .io_lsu2WBU_bits_pcBSrc(lsu_io_lsu2WBU_bits_pcBSrc),
    .io_lsu2WBU_bits_ecall(lsu_io_lsu2WBU_bits_ecall),
    .io_lsu2WBU_bits_csrEn(lsu_io_lsu2WBU_bits_csrEn),
    .io_lsu2WBU_bits_csrWr(lsu_io_lsu2WBU_bits_csrWr),
    .io_lsu2WBU_bits_fencei(lsu_io_lsu2WBU_bits_fencei)
  );
  WBU wbu ( // @[src/main/scala/Main.scala 38:49]
    .clock(wbu_clock),
    .io_lsu2WBU_ready(wbu_io_lsu2WBU_ready),
    .io_lsu2WBU_valid(wbu_io_lsu2WBU_valid),
    .io_lsu2WBU_bits_pc(wbu_io_lsu2WBU_bits_pc),
    .io_lsu2WBU_bits_memData(wbu_io_lsu2WBU_bits_memData),
    .io_lsu2WBU_bits_aluData(wbu_io_lsu2WBU_bits_aluData),
    .io_lsu2WBU_bits_csrWData(wbu_io_lsu2WBU_bits_csrWData),
    .io_lsu2WBU_bits_csrData(wbu_io_lsu2WBU_bits_csrData),
    .io_lsu2WBU_bits_immData(wbu_io_lsu2WBU_bits_immData),
    .io_lsu2WBU_bits_rs1Data(wbu_io_lsu2WBU_bits_rs1Data),
    .io_lsu2WBU_bits_inst(wbu_io_lsu2WBU_bits_inst),
    .io_lsu2WBU_bits_regWR(wbu_io_lsu2WBU_bits_regWR),
    .io_lsu2WBU_bits_toReg(wbu_io_lsu2WBU_bits_toReg),
    .io_lsu2WBU_bits_pcASrc(wbu_io_lsu2WBU_bits_pcASrc),
    .io_lsu2WBU_bits_pcBSrc(wbu_io_lsu2WBU_bits_pcBSrc),
    .io_lsu2WBU_bits_ecall(wbu_io_lsu2WBU_bits_ecall),
    .io_lsu2WBU_bits_csrEn(wbu_io_lsu2WBU_bits_csrEn),
    .io_lsu2WBU_bits_csrWr(wbu_io_lsu2WBU_bits_csrWr),
    .io_lsu2WBU_bits_fencei(wbu_io_lsu2WBU_bits_fencei),
    .io_wbu2CSR_pc(wbu_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(wbu_io_wbu2CSR_csrWData),
    .io_wbu2CSR_csr(wbu_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(wbu_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(wbu_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(wbu_io_wbu2CSR_csrWr),
    .io_wbu2BaseReg_rdIndex(wbu_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(wbu_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(wbu_io_wbu2BaseReg_regWR),
    .io_wbu2PC_valid(wbu_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(wbu_io_wbu2PC_bits_nextPC),
    .io_wbu2Icache(wbu_io_wbu2Icache)
  );
  XbarAXI xbarAXI ( // @[src/main/scala/Main.scala 39:49]
    .clock(xbarAXI_clock),
    .reset(xbarAXI_reset),
    .io_axiSlaveIFU_bready(xbarAXI_io_axiSlaveIFU_bready),
    .io_axiSlaveIFU_bvalid(xbarAXI_io_axiSlaveIFU_bvalid),
    .io_axiSlaveIFU_arready(xbarAXI_io_axiSlaveIFU_arready),
    .io_axiSlaveIFU_arvalid(xbarAXI_io_axiSlaveIFU_arvalid),
    .io_axiSlaveIFU_araddr(xbarAXI_io_axiSlaveIFU_araddr),
    .io_axiSlaveIFU_arid(xbarAXI_io_axiSlaveIFU_arid),
    .io_axiSlaveIFU_arlen(xbarAXI_io_axiSlaveIFU_arlen),
    .io_axiSlaveIFU_arsize(xbarAXI_io_axiSlaveIFU_arsize),
    .io_axiSlaveIFU_arburst(xbarAXI_io_axiSlaveIFU_arburst),
    .io_axiSlaveIFU_rready(xbarAXI_io_axiSlaveIFU_rready),
    .io_axiSlaveIFU_rvalid(xbarAXI_io_axiSlaveIFU_rvalid),
    .io_axiSlaveIFU_rresp(xbarAXI_io_axiSlaveIFU_rresp),
    .io_axiSlaveIFU_rdata(xbarAXI_io_axiSlaveIFU_rdata),
    .io_axiSlaveIFU_rlast(xbarAXI_io_axiSlaveIFU_rlast),
    .io_axiSlaveIFU_rid(xbarAXI_io_axiSlaveIFU_rid),
    .io_axiSlaveWBU_awready(xbarAXI_io_axiSlaveWBU_awready),
    .io_axiSlaveWBU_awvalid(xbarAXI_io_axiSlaveWBU_awvalid),
    .io_axiSlaveWBU_awaddr(xbarAXI_io_axiSlaveWBU_awaddr),
    .io_axiSlaveWBU_awsize(xbarAXI_io_axiSlaveWBU_awsize),
    .io_axiSlaveWBU_wready(xbarAXI_io_axiSlaveWBU_wready),
    .io_axiSlaveWBU_wvalid(xbarAXI_io_axiSlaveWBU_wvalid),
    .io_axiSlaveWBU_wdata(xbarAXI_io_axiSlaveWBU_wdata),
    .io_axiSlaveWBU_wstrb(xbarAXI_io_axiSlaveWBU_wstrb),
    .io_axiSlaveWBU_wlast(xbarAXI_io_axiSlaveWBU_wlast),
    .io_axiSlaveWBU_arready(xbarAXI_io_axiSlaveWBU_arready),
    .io_axiSlaveWBU_arvalid(xbarAXI_io_axiSlaveWBU_arvalid),
    .io_axiSlaveWBU_araddr(xbarAXI_io_axiSlaveWBU_araddr),
    .io_axiSlaveWBU_arsize(xbarAXI_io_axiSlaveWBU_arsize),
    .io_axiSlaveWBU_rready(xbarAXI_io_axiSlaveWBU_rready),
    .io_axiSlaveWBU_rvalid(xbarAXI_io_axiSlaveWBU_rvalid),
    .io_axiSlaveWBU_rdata(xbarAXI_io_axiSlaveWBU_rdata),
    .io_axiSlaveWBU_rlast(xbarAXI_io_axiSlaveWBU_rlast),
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
    .io_axiMasterDevice_arready(xbarAXI_io_axiMasterDevice_arready),
    .io_axiMasterDevice_arvalid(xbarAXI_io_axiMasterDevice_arvalid),
    .io_axiMasterDevice_araddr(xbarAXI_io_axiMasterDevice_araddr),
    .io_axiMasterDevice_arid(xbarAXI_io_axiMasterDevice_arid),
    .io_axiMasterDevice_arlen(xbarAXI_io_axiMasterDevice_arlen),
    .io_axiMasterDevice_arsize(xbarAXI_io_axiMasterDevice_arsize),
    .io_axiMasterDevice_arburst(xbarAXI_io_axiMasterDevice_arburst),
    .io_axiMasterDevice_rready(xbarAXI_io_axiMasterDevice_rready),
    .io_axiMasterDevice_rvalid(xbarAXI_io_axiMasterDevice_rvalid),
    .io_axiMasterDevice_rresp(xbarAXI_io_axiMasterDevice_rresp),
    .io_axiMasterDevice_rdata(xbarAXI_io_axiMasterDevice_rdata),
    .io_axiMasterDevice_rlast(xbarAXI_io_axiMasterDevice_rlast),
    .io_axiMasterDevice_rid(xbarAXI_io_axiMasterDevice_rid),
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
  AXISkidBuffer ifuSkidBuffer ( // @[src/main/scala/Main.scala 40:41]
    .clock(ifuSkidBuffer_clock),
    .reset(ifuSkidBuffer_reset),
    .io_axiMaster_bready(ifuSkidBuffer_io_axiMaster_bready),
    .io_axiMaster_bvalid(ifuSkidBuffer_io_axiMaster_bvalid),
    .io_axiMaster_arready(ifuSkidBuffer_io_axiMaster_arready),
    .io_axiMaster_arvalid(ifuSkidBuffer_io_axiMaster_arvalid),
    .io_axiMaster_araddr(ifuSkidBuffer_io_axiMaster_araddr),
    .io_axiMaster_arid(ifuSkidBuffer_io_axiMaster_arid),
    .io_axiMaster_arlen(ifuSkidBuffer_io_axiMaster_arlen),
    .io_axiMaster_arsize(ifuSkidBuffer_io_axiMaster_arsize),
    .io_axiMaster_arburst(ifuSkidBuffer_io_axiMaster_arburst),
    .io_axiMaster_rready(ifuSkidBuffer_io_axiMaster_rready),
    .io_axiMaster_rvalid(ifuSkidBuffer_io_axiMaster_rvalid),
    .io_axiMaster_rresp(ifuSkidBuffer_io_axiMaster_rresp),
    .io_axiMaster_rdata(ifuSkidBuffer_io_axiMaster_rdata),
    .io_axiMaster_rlast(ifuSkidBuffer_io_axiMaster_rlast),
    .io_axiMaster_rid(ifuSkidBuffer_io_axiMaster_rid),
    .io_axiSlave_bready(ifuSkidBuffer_io_axiSlave_bready),
    .io_axiSlave_bvalid(ifuSkidBuffer_io_axiSlave_bvalid),
    .io_axiSlave_arready(ifuSkidBuffer_io_axiSlave_arready),
    .io_axiSlave_arvalid(ifuSkidBuffer_io_axiSlave_arvalid),
    .io_axiSlave_araddr(ifuSkidBuffer_io_axiSlave_araddr),
    .io_axiSlave_arlen(ifuSkidBuffer_io_axiSlave_arlen),
    .io_axiSlave_rready(ifuSkidBuffer_io_axiSlave_rready),
    .io_axiSlave_rvalid(ifuSkidBuffer_io_axiSlave_rvalid),
    .io_axiSlave_rdata(ifuSkidBuffer_io_axiSlave_rdata),
    .io_axiSlave_rlast(ifuSkidBuffer_io_axiSlave_rlast)
  );
  AXILiteClint axiLiteClint ( // @[src/main/scala/Main.scala 77:34]
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
  assign io_master_awvalid = xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 74:36]
  assign io_master_awaddr = xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 74:36]
  assign io_master_awid = 4'h0; // @[src/main/scala/Main.scala 74:36]
  assign io_master_awlen = 8'h0; // @[src/main/scala/Main.scala 74:36]
  assign io_master_awsize = xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 74:36]
  assign io_master_awburst = 2'h1; // @[src/main/scala/Main.scala 74:36]
  assign io_master_wvalid = xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 74:36]
  assign io_master_wdata = xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 74:36]
  assign io_master_wstrb = xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 74:36]
  assign io_master_wlast = xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 74:36]
  assign io_master_bready = xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 74:36]
  assign io_master_arvalid = xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 74:36]
  assign io_master_araddr = xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 74:36]
  assign io_master_arid = xbarAXI_io_axiMasterDevice_arid; // @[src/main/scala/Main.scala 74:36]
  assign io_master_arlen = xbarAXI_io_axiMasterDevice_arlen; // @[src/main/scala/Main.scala 74:36]
  assign io_master_arsize = xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 74:36]
  assign io_master_arburst = xbarAXI_io_axiMasterDevice_arburst; // @[src/main/scala/Main.scala 74:36]
  assign io_master_rready = xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 74:36]
  assign io_slave_awready = 1'h0; // @[src/main/scala/basemode/Interface.scala 215:21]
  assign io_slave_wready = 1'h0; // @[src/main/scala/basemode/Interface.scala 217:20]
  assign io_slave_bvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 219:20]
  assign io_slave_bresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 220:19]
  assign io_slave_bid = 4'h0; // @[src/main/scala/basemode/Interface.scala 221:17]
  assign io_slave_arready = 1'h0; // @[src/main/scala/basemode/Interface.scala 223:21]
  assign io_slave_rvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 225:20]
  assign io_slave_rresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 226:19]
  assign io_slave_rdata = 32'h0; // @[src/main/scala/basemode/Interface.scala 227:19]
  assign io_slave_rlast = 1'h0; // @[src/main/scala/basemode/Interface.scala 228:19]
  assign io_slave_rid = 4'h0; // @[src/main/scala/basemode/Interface.scala 229:17]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_wbu2PC_valid = wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 43:25]
  assign pc_io_wbu2PC_bits_nextPC = wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 43:25]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_pc = pc_io_pc; // @[src/main/scala/Main.scala 48:33]
  assign ifu_io_ifu2Mem_bvalid = ifuSkidBuffer_io_axiSlave_bvalid; // @[src/main/scala/Main.scala 51:25]
  assign ifu_io_ifu2Mem_arready = ifuSkidBuffer_io_axiSlave_arready; // @[src/main/scala/Main.scala 51:25]
  assign ifu_io_ifu2Mem_rvalid = ifuSkidBuffer_io_axiSlave_rvalid; // @[src/main/scala/Main.scala 51:25]
  assign ifu_io_ifu2Mem_rdata = ifuSkidBuffer_io_axiSlave_rdata; // @[src/main/scala/Main.scala 51:25]
  assign ifu_io_ifu2Mem_rlast = ifuSkidBuffer_io_axiSlave_rlast; // @[src/main/scala/Main.scala 51:25]
  assign ifu_io_wbu2Icache = wbu_io_wbu2Icache; // @[src/main/scala/Main.scala 70:41]
  assign riscv32BaseReg_clock = clock;
  assign riscv32BaseReg_reset = reset;
  assign riscv32BaseReg_io_idu2BaseReg_rs1Index = idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 56:33]
  assign riscv32BaseReg_io_idu2BaseReg_rs2Index = idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 56:33]
  assign riscv32BaseReg_io_wbu2BaseReg_rdIndex = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 68:41]
  assign riscv32BaseReg_io_wbu2BaseReg_data = wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 68:41]
  assign riscv32BaseReg_io_wbu2BaseReg_regWR = wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 68:41]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_exu2CSR_mret = exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 60:25]
  assign csrReg_io_exu2CSR_ecall = exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 60:25]
  assign csrReg_io_exu2CSR_csr = exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 60:25]
  assign csrReg_io_wbu2CSR_pc = wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 67:41]
  assign csrReg_io_wbu2CSR_csrWData = wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 67:41]
  assign csrReg_io_wbu2CSR_csr = wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 67:41]
  assign csrReg_io_wbu2CSR_ecall = wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 67:41]
  assign csrReg_io_wbu2CSR_csrEn = wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 67:41]
  assign csrReg_io_wbu2CSR_csrWr = wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 67:41]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_inst_valid = ifu_io_inst_valid; // @[src/main/scala/Main.scala 50:25]
  assign idu_io_inst_bits_inst = ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 50:25]
  assign idu_io_inst_bits_pc = ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 50:25]
  assign idu_io_idu2EXU_ready = exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 55:33]
  assign idu_io_idu2BaseReg_rs1Data = riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 56:33]
  assign idu_io_idu2BaseReg_rs2Data = riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 56:33]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_idu2EXU_valid = idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_pc = idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_rs1Data = idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_rs2Data = idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_imm = idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_inst = idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_regWR = idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_srcAALU = idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_srcBALU = idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_ctrALU = idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_branch = idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_toReg = idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_memWR = idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_memValid = idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_memOP = idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_rs1Index = idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_ecall = idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_mret = idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_csrEn = idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_csrWr = idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_csrOP = idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_idu2EXU_bits_csrALUOP = idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 55:33]
  assign exu_io_exu2LSU_ready = lsu_io_exu2LSU_ready; // @[src/main/scala/Main.scala 59:25]
  assign exu_io_exu2CSR_csrData = csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 60:25]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_exu2LSU_valid = exu_io_exu2LSU_valid; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_pc = exu_io_exu2LSU_bits_pc; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_memData = exu_io_exu2LSU_bits_memData; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_aluData = exu_io_exu2LSU_bits_aluData; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_csrWData = exu_io_exu2LSU_bits_csrWData; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_csrData = exu_io_exu2LSU_bits_csrData; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_immData = exu_io_exu2LSU_bits_immData; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_rs1Data = exu_io_exu2LSU_bits_rs1Data; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_inst = exu_io_exu2LSU_bits_inst; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_regWR = exu_io_exu2LSU_bits_regWR; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_memWR = exu_io_exu2LSU_bits_memWR; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_memValid = exu_io_exu2LSU_bits_memValid; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_memOP = exu_io_exu2LSU_bits_memOP; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_toReg = exu_io_exu2LSU_bits_toReg; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_branchCtr = exu_io_exu2LSU_bits_branchCtr; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_less = exu_io_exu2LSU_bits_less; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_zero = exu_io_exu2LSU_bits_zero; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_ecall = exu_io_exu2LSU_bits_ecall; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_csrEn = exu_io_exu2LSU_bits_csrEn; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_exu2LSU_bits_csrWr = exu_io_exu2LSU_bits_csrWr; // @[src/main/scala/Main.scala 59:25]
  assign lsu_io_lsu2Mem_awready = xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 63:25]
  assign lsu_io_lsu2Mem_wready = xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 63:25]
  assign lsu_io_lsu2Mem_arready = xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 63:25]
  assign lsu_io_lsu2Mem_rvalid = xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 63:25]
  assign lsu_io_lsu2Mem_rdata = xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 63:25]
  assign lsu_io_lsu2Mem_rlast = xbarAXI_io_axiSlaveWBU_rlast; // @[src/main/scala/Main.scala 63:25]
  assign wbu_clock = clock;
  assign wbu_io_lsu2WBU_valid = lsu_io_lsu2WBU_valid; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_pc = lsu_io_lsu2WBU_bits_pc; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_memData = lsu_io_lsu2WBU_bits_memData; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_aluData = lsu_io_lsu2WBU_bits_aluData; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_csrWData = lsu_io_lsu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_csrData = lsu_io_lsu2WBU_bits_csrData; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_immData = lsu_io_lsu2WBU_bits_immData; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_rs1Data = lsu_io_lsu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_inst = lsu_io_lsu2WBU_bits_inst; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_regWR = lsu_io_lsu2WBU_bits_regWR; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_toReg = lsu_io_lsu2WBU_bits_toReg; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_pcASrc = lsu_io_lsu2WBU_bits_pcASrc; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_pcBSrc = lsu_io_lsu2WBU_bits_pcBSrc; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_ecall = lsu_io_lsu2WBU_bits_ecall; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_csrEn = lsu_io_lsu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_csrWr = lsu_io_lsu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 64:25]
  assign wbu_io_lsu2WBU_bits_fencei = lsu_io_lsu2WBU_bits_fencei; // @[src/main/scala/Main.scala 64:25]
  assign xbarAXI_clock = clock;
  assign xbarAXI_reset = reset;
  assign xbarAXI_io_axiSlaveIFU_bready = ifuSkidBuffer_io_axiMaster_bready; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_arvalid = ifuSkidBuffer_io_axiMaster_arvalid; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_araddr = ifuSkidBuffer_io_axiMaster_araddr; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_arid = ifuSkidBuffer_io_axiMaster_arid; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_arlen = ifuSkidBuffer_io_axiMaster_arlen; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_arsize = ifuSkidBuffer_io_axiMaster_arsize; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_arburst = ifuSkidBuffer_io_axiMaster_arburst; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveIFU_rready = ifuSkidBuffer_io_axiMaster_rready; // @[src/main/scala/Main.scala 52:41]
  assign xbarAXI_io_axiSlaveWBU_awvalid = lsu_io_lsu2Mem_awvalid; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_awaddr = lsu_io_lsu2Mem_awaddr; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_awsize = lsu_io_lsu2Mem_awsize; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_wvalid = lsu_io_lsu2Mem_wvalid; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_wdata = lsu_io_lsu2Mem_wdata; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_wstrb = lsu_io_lsu2Mem_wstrb; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_wlast = lsu_io_lsu2Mem_wlast; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_arvalid = lsu_io_lsu2Mem_arvalid; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_araddr = lsu_io_lsu2Mem_araddr; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_arsize = lsu_io_lsu2Mem_arsize; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiSlaveWBU_rready = lsu_io_lsu2Mem_rready; // @[src/main/scala/Main.scala 63:25]
  assign xbarAXI_io_axiMasterDevice_awready = io_master_awready; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_wready = io_master_wready; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_bvalid = io_master_bvalid; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_arready = io_master_arready; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_rvalid = io_master_rvalid; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_rresp = io_master_rresp; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_rdata = io_master_rdata; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_rlast = io_master_rlast; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiMasterDevice_rid = io_master_rid; // @[src/main/scala/Main.scala 74:36]
  assign xbarAXI_io_axiLiteClint_arReady = axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 78:41]
  assign xbarAXI_io_axiLiteClint_rData = axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 78:41]
  assign xbarAXI_io_axiLiteClint_rValid = axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 78:41]
  assign xbarAXI_io_axiLiteClint_awReady = axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 78:41]
  assign xbarAXI_io_axiLiteClint_wReady = axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 78:41]
  assign xbarAXI_io_axiLiteClint_bValid = axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 78:41]
  assign ifuSkidBuffer_clock = clock;
  assign ifuSkidBuffer_reset = reset;
  assign ifuSkidBuffer_io_axiMaster_bvalid = xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_arready = xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_rvalid = xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_rresp = xbarAXI_io_axiSlaveIFU_rresp; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_rdata = xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_rlast = xbarAXI_io_axiSlaveIFU_rlast; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiMaster_rid = xbarAXI_io_axiSlaveIFU_rid; // @[src/main/scala/Main.scala 52:41]
  assign ifuSkidBuffer_io_axiSlave_bready = ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 51:25]
  assign ifuSkidBuffer_io_axiSlave_arvalid = ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 51:25]
  assign ifuSkidBuffer_io_axiSlave_araddr = ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 51:25]
  assign ifuSkidBuffer_io_axiSlave_arlen = ifu_io_ifu2Mem_arlen; // @[src/main/scala/Main.scala 51:25]
  assign ifuSkidBuffer_io_axiSlave_rready = ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 51:25]
  assign axiLiteClint_clock = clock;
  assign axiLiteClint_reset = reset;
  assign axiLiteClint_io_axiLiteMaster_arAddr = xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 78:41]
  assign axiLiteClint_io_axiLiteMaster_arValid = xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 78:41]
  assign axiLiteClint_io_axiLiteMaster_rReady = xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 78:41]
  assign axiLiteClint_io_axiLiteMaster_awValid = xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 78:41]
  assign axiLiteClint_io_axiLiteMaster_wValid = xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 78:41]
  assign axiLiteClint_io_axiLiteMaster_bReady = xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 78:41]
endmodule
