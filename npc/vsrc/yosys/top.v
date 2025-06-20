module top(
  input         clock,
  input         reset,
  input         io_interrupt, // @[src/main/scala/Main.scala 23:20]
  input         io_master_awready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_awvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_awaddr, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_awid, // @[src/main/scala/Main.scala 23:20]
  output [7:0]  io_master_awlen, // @[src/main/scala/Main.scala 23:20]
  output [2:0]  io_master_awsize, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_master_awburst, // @[src/main/scala/Main.scala 23:20]
  input         io_master_wready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_wvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_wdata, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_wstrb, // @[src/main/scala/Main.scala 23:20]
  output        io_master_wlast, // @[src/main/scala/Main.scala 23:20]
  output        io_master_bready, // @[src/main/scala/Main.scala 23:20]
  input         io_master_bvalid, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_master_bresp, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_master_bid, // @[src/main/scala/Main.scala 23:20]
  input         io_master_arready, // @[src/main/scala/Main.scala 23:20]
  output        io_master_arvalid, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_master_araddr, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_master_arid, // @[src/main/scala/Main.scala 23:20]
  output [7:0]  io_master_arlen, // @[src/main/scala/Main.scala 23:20]
  output [2:0]  io_master_arsize, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_master_arburst, // @[src/main/scala/Main.scala 23:20]
  output        io_master_rready, // @[src/main/scala/Main.scala 23:20]
  input         io_master_rvalid, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_master_rresp, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_master_rdata, // @[src/main/scala/Main.scala 23:20]
  input         io_master_rlast, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_master_rid, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_awready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_awvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_awaddr, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_awid, // @[src/main/scala/Main.scala 23:20]
  input  [7:0]  io_slave_awlen, // @[src/main/scala/Main.scala 23:20]
  input  [2:0]  io_slave_awsize, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_slave_awburst, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_wready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_wvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_wdata, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_wstrb, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_wlast, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_bready, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_bvalid, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_slave_bresp, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_slave_bid, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_arready, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_arvalid, // @[src/main/scala/Main.scala 23:20]
  input  [31:0] io_slave_araddr, // @[src/main/scala/Main.scala 23:20]
  input  [3:0]  io_slave_arid, // @[src/main/scala/Main.scala 23:20]
  input  [7:0]  io_slave_arlen, // @[src/main/scala/Main.scala 23:20]
  input  [2:0]  io_slave_arsize, // @[src/main/scala/Main.scala 23:20]
  input  [1:0]  io_slave_arburst, // @[src/main/scala/Main.scala 23:20]
  input         io_slave_rready, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_rvalid, // @[src/main/scala/Main.scala 23:20]
  output [1:0]  io_slave_rresp, // @[src/main/scala/Main.scala 23:20]
  output [31:0] io_slave_rdata, // @[src/main/scala/Main.scala 23:20]
  output        io_slave_rlast, // @[src/main/scala/Main.scala 23:20]
  output [3:0]  io_slave_rid // @[src/main/scala/Main.scala 23:20]
);
  wire  pc_clock; // @[src/main/scala/Main.scala 28:49]
  wire  pc_reset; // @[src/main/scala/Main.scala 28:49]
  wire  pc_io_wbu2PC_ready; // @[src/main/scala/Main.scala 28:49]
  wire  pc_io_wbu2PC_valid; // @[src/main/scala/Main.scala 28:49]
  wire [31:0] pc_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 28:49]
  wire [31:0] pc_io_pc; // @[src/main/scala/Main.scala 28:49]
  wire  ifu_clock; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_reset; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_pc; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_inst_valid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_bvalid; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_arready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 29:49]
  wire  ifu_io_ifu2Mem_rvalid; // @[src/main/scala/Main.scala 29:49]
  wire [31:0] ifu_io_ifu2Mem_rdata; // @[src/main/scala/Main.scala 29:49]
  wire  riscv32BaseReg_clock; // @[src/main/scala/Main.scala 30:41]
  wire  riscv32BaseReg_reset; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 30:41]
  wire [3:0] riscv32BaseReg_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 30:41]
  wire [31:0] riscv32BaseReg_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 30:41]
  wire  riscv32BaseReg_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 30:41]
  wire  csrReg_clock; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_reset; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_exu2CSR_mret; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 31:49]
  wire [11:0] csrReg_io_exu2CSR_csr; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 31:49]
  wire [31:0] csrReg_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 31:49]
  wire [11:0] csrReg_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 31:49]
  wire  csrReg_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 31:49]
  wire  idu_clock; // @[src/main/scala/Main.scala 32:49]
  wire  idu_reset; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_inst_ready; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_inst_valid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_inst_bits_inst; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_inst_bits_pc; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 32:49]
  wire [2:0] idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 32:49]
  wire [4:0] idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 32:49]
  wire  idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 32:49]
  wire [1:0] idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 32:49]
  wire [31:0] idu_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 32:49]
  wire [3:0] idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 32:49]
  wire  exu_clock; // @[src/main/scala/Main.scala 33:49]
  wire  exu_reset; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 33:49]
  wire [2:0] exu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 33:49]
  wire [4:0] exu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 33:49]
  wire [2:0] exu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 33:49]
  wire [1:0] exu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 33:49]
  wire [3:0] exu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 33:49]
  wire [31:0] exu_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 33:49]
  wire  exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 33:49]
  wire [11:0] exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 33:49]
  wire  wbu_clock; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_reset; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 34:49]
  wire [1:0] wbu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 34:49]
  wire [11:0] wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_awready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_awvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_awaddr; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_wbu2Mem_awsize; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_wdata; // @[src/main/scala/Main.scala 34:49]
  wire [3:0] wbu_io_wbu2Mem_wstrb; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_wlast; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_bready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_bvalid; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_arready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_arvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_araddr; // @[src/main/scala/Main.scala 34:49]
  wire [2:0] wbu_io_wbu2Mem_arsize; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_rready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2Mem_rvalid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2Mem_rdata; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2PC_ready; // @[src/main/scala/Main.scala 34:49]
  wire  wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 34:49]
  wire [31:0] wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 34:49]
  wire  xbarAXI_clock; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_reset; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_araddr; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_awvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_awaddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_awsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_wdata; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] xbarAXI_io_axiSlaveWBU_wstrb; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_wlast; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_araddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiSlaveWBU_arsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_awready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 35:49]
  wire [3:0] xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_bvalid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_arready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 35:49]
  wire [2:0] xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiMasterDevice_rvalid; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiMasterDevice_rdata; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_arReady; // @[src/main/scala/Main.scala 35:49]
  wire [31:0] xbarAXI_io_axiLiteClint_rData; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_rValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_awReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_wReady; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_bValid; // @[src/main/scala/Main.scala 35:49]
  wire  xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 35:49]
  wire  axiLiteClint_clock; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_reset; // @[src/main/scala/Main.scala 66:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_arAddr; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_arValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 66:34]
  wire [31:0] axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_rReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_awValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_wValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 66:34]
  wire  axiLiteClint_io_axiLiteMaster_bReady; // @[src/main/scala/Main.scala 66:34]
  PC pc ( // @[src/main/scala/Main.scala 28:49]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_wbu2PC_ready(pc_io_wbu2PC_ready),
    .io_wbu2PC_valid(pc_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(pc_io_wbu2PC_bits_nextPC),
    .io_pc(pc_io_pc)
  );
  IFU ifu ( // @[src/main/scala/Main.scala 29:49]
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
    .io_ifu2Mem_rready(ifu_io_ifu2Mem_rready),
    .io_ifu2Mem_rvalid(ifu_io_ifu2Mem_rvalid),
    .io_ifu2Mem_rdata(ifu_io_ifu2Mem_rdata)
  );
  Riscv32BaseReg riscv32BaseReg ( // @[src/main/scala/Main.scala 30:41]
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
  CSRReg csrReg ( // @[src/main/scala/Main.scala 31:49]
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
  IDU idu ( // @[src/main/scala/Main.scala 32:49]
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
  EXU exu ( // @[src/main/scala/Main.scala 33:49]
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
    .io_exu2WBU_ready(exu_io_exu2WBU_ready),
    .io_exu2WBU_valid(exu_io_exu2WBU_valid),
    .io_exu2WBU_bits_pc(exu_io_exu2WBU_bits_pc),
    .io_exu2WBU_bits_memData(exu_io_exu2WBU_bits_memData),
    .io_exu2WBU_bits_aluData(exu_io_exu2WBU_bits_aluData),
    .io_exu2WBU_bits_csrWData(exu_io_exu2WBU_bits_csrWData),
    .io_exu2WBU_bits_csrData(exu_io_exu2WBU_bits_csrData),
    .io_exu2WBU_bits_immData(exu_io_exu2WBU_bits_immData),
    .io_exu2WBU_bits_rs1Data(exu_io_exu2WBU_bits_rs1Data),
    .io_exu2WBU_bits_inst(exu_io_exu2WBU_bits_inst),
    .io_exu2WBU_bits_regWR(exu_io_exu2WBU_bits_regWR),
    .io_exu2WBU_bits_memWR(exu_io_exu2WBU_bits_memWR),
    .io_exu2WBU_bits_memValid(exu_io_exu2WBU_bits_memValid),
    .io_exu2WBU_bits_memOP(exu_io_exu2WBU_bits_memOP),
    .io_exu2WBU_bits_toReg(exu_io_exu2WBU_bits_toReg),
    .io_exu2WBU_bits_branchCtr(exu_io_exu2WBU_bits_branchCtr),
    .io_exu2WBU_bits_less(exu_io_exu2WBU_bits_less),
    .io_exu2WBU_bits_zero(exu_io_exu2WBU_bits_zero),
    .io_exu2WBU_bits_ecall(exu_io_exu2WBU_bits_ecall),
    .io_exu2WBU_bits_csrEn(exu_io_exu2WBU_bits_csrEn),
    .io_exu2WBU_bits_csrWr(exu_io_exu2WBU_bits_csrWr),
    .io_exu2CSR_csrData(exu_io_exu2CSR_csrData),
    .io_exu2CSR_mret(exu_io_exu2CSR_mret),
    .io_exu2CSR_ecall(exu_io_exu2CSR_ecall),
    .io_exu2CSR_csr(exu_io_exu2CSR_csr)
  );
  WBU wbu ( // @[src/main/scala/Main.scala 34:49]
    .clock(wbu_clock),
    .reset(wbu_reset),
    .io_exu2WBU_ready(wbu_io_exu2WBU_ready),
    .io_exu2WBU_valid(wbu_io_exu2WBU_valid),
    .io_exu2WBU_bits_pc(wbu_io_exu2WBU_bits_pc),
    .io_exu2WBU_bits_memData(wbu_io_exu2WBU_bits_memData),
    .io_exu2WBU_bits_aluData(wbu_io_exu2WBU_bits_aluData),
    .io_exu2WBU_bits_csrWData(wbu_io_exu2WBU_bits_csrWData),
    .io_exu2WBU_bits_csrData(wbu_io_exu2WBU_bits_csrData),
    .io_exu2WBU_bits_immData(wbu_io_exu2WBU_bits_immData),
    .io_exu2WBU_bits_rs1Data(wbu_io_exu2WBU_bits_rs1Data),
    .io_exu2WBU_bits_inst(wbu_io_exu2WBU_bits_inst),
    .io_exu2WBU_bits_regWR(wbu_io_exu2WBU_bits_regWR),
    .io_exu2WBU_bits_memWR(wbu_io_exu2WBU_bits_memWR),
    .io_exu2WBU_bits_memValid(wbu_io_exu2WBU_bits_memValid),
    .io_exu2WBU_bits_memOP(wbu_io_exu2WBU_bits_memOP),
    .io_exu2WBU_bits_toReg(wbu_io_exu2WBU_bits_toReg),
    .io_exu2WBU_bits_branchCtr(wbu_io_exu2WBU_bits_branchCtr),
    .io_exu2WBU_bits_less(wbu_io_exu2WBU_bits_less),
    .io_exu2WBU_bits_zero(wbu_io_exu2WBU_bits_zero),
    .io_exu2WBU_bits_ecall(wbu_io_exu2WBU_bits_ecall),
    .io_exu2WBU_bits_csrEn(wbu_io_exu2WBU_bits_csrEn),
    .io_exu2WBU_bits_csrWr(wbu_io_exu2WBU_bits_csrWr),
    .io_wbu2CSR_pc(wbu_io_wbu2CSR_pc),
    .io_wbu2CSR_csrWData(wbu_io_wbu2CSR_csrWData),
    .io_wbu2CSR_csr(wbu_io_wbu2CSR_csr),
    .io_wbu2CSR_ecall(wbu_io_wbu2CSR_ecall),
    .io_wbu2CSR_csrEn(wbu_io_wbu2CSR_csrEn),
    .io_wbu2CSR_csrWr(wbu_io_wbu2CSR_csrWr),
    .io_wbu2BaseReg_rdIndex(wbu_io_wbu2BaseReg_rdIndex),
    .io_wbu2BaseReg_data(wbu_io_wbu2BaseReg_data),
    .io_wbu2BaseReg_regWR(wbu_io_wbu2BaseReg_regWR),
    .io_wbu2Mem_awready(wbu_io_wbu2Mem_awready),
    .io_wbu2Mem_awvalid(wbu_io_wbu2Mem_awvalid),
    .io_wbu2Mem_awaddr(wbu_io_wbu2Mem_awaddr),
    .io_wbu2Mem_awsize(wbu_io_wbu2Mem_awsize),
    .io_wbu2Mem_wready(wbu_io_wbu2Mem_wready),
    .io_wbu2Mem_wvalid(wbu_io_wbu2Mem_wvalid),
    .io_wbu2Mem_wdata(wbu_io_wbu2Mem_wdata),
    .io_wbu2Mem_wstrb(wbu_io_wbu2Mem_wstrb),
    .io_wbu2Mem_wlast(wbu_io_wbu2Mem_wlast),
    .io_wbu2Mem_bready(wbu_io_wbu2Mem_bready),
    .io_wbu2Mem_bvalid(wbu_io_wbu2Mem_bvalid),
    .io_wbu2Mem_arready(wbu_io_wbu2Mem_arready),
    .io_wbu2Mem_arvalid(wbu_io_wbu2Mem_arvalid),
    .io_wbu2Mem_araddr(wbu_io_wbu2Mem_araddr),
    .io_wbu2Mem_arsize(wbu_io_wbu2Mem_arsize),
    .io_wbu2Mem_rready(wbu_io_wbu2Mem_rready),
    .io_wbu2Mem_rvalid(wbu_io_wbu2Mem_rvalid),
    .io_wbu2Mem_rdata(wbu_io_wbu2Mem_rdata),
    .io_wbu2PC_ready(wbu_io_wbu2PC_ready),
    .io_wbu2PC_valid(wbu_io_wbu2PC_valid),
    .io_wbu2PC_bits_nextPC(wbu_io_wbu2PC_bits_nextPC)
  );
  XbarAXI xbarAXI ( // @[src/main/scala/Main.scala 35:49]
    .clock(xbarAXI_clock),
    .reset(xbarAXI_reset),
    .io_axiSlaveIFU_bready(xbarAXI_io_axiSlaveIFU_bready),
    .io_axiSlaveIFU_bvalid(xbarAXI_io_axiSlaveIFU_bvalid),
    .io_axiSlaveIFU_arready(xbarAXI_io_axiSlaveIFU_arready),
    .io_axiSlaveIFU_arvalid(xbarAXI_io_axiSlaveIFU_arvalid),
    .io_axiSlaveIFU_araddr(xbarAXI_io_axiSlaveIFU_araddr),
    .io_axiSlaveIFU_rready(xbarAXI_io_axiSlaveIFU_rready),
    .io_axiSlaveIFU_rvalid(xbarAXI_io_axiSlaveIFU_rvalid),
    .io_axiSlaveIFU_rdata(xbarAXI_io_axiSlaveIFU_rdata),
    .io_axiSlaveWBU_awready(xbarAXI_io_axiSlaveWBU_awready),
    .io_axiSlaveWBU_awvalid(xbarAXI_io_axiSlaveWBU_awvalid),
    .io_axiSlaveWBU_awaddr(xbarAXI_io_axiSlaveWBU_awaddr),
    .io_axiSlaveWBU_awsize(xbarAXI_io_axiSlaveWBU_awsize),
    .io_axiSlaveWBU_wready(xbarAXI_io_axiSlaveWBU_wready),
    .io_axiSlaveWBU_wvalid(xbarAXI_io_axiSlaveWBU_wvalid),
    .io_axiSlaveWBU_wdata(xbarAXI_io_axiSlaveWBU_wdata),
    .io_axiSlaveWBU_wstrb(xbarAXI_io_axiSlaveWBU_wstrb),
    .io_axiSlaveWBU_wlast(xbarAXI_io_axiSlaveWBU_wlast),
    .io_axiSlaveWBU_bready(xbarAXI_io_axiSlaveWBU_bready),
    .io_axiSlaveWBU_bvalid(xbarAXI_io_axiSlaveWBU_bvalid),
    .io_axiSlaveWBU_arready(xbarAXI_io_axiSlaveWBU_arready),
    .io_axiSlaveWBU_arvalid(xbarAXI_io_axiSlaveWBU_arvalid),
    .io_axiSlaveWBU_araddr(xbarAXI_io_axiSlaveWBU_araddr),
    .io_axiSlaveWBU_arsize(xbarAXI_io_axiSlaveWBU_arsize),
    .io_axiSlaveWBU_rready(xbarAXI_io_axiSlaveWBU_rready),
    .io_axiSlaveWBU_rvalid(xbarAXI_io_axiSlaveWBU_rvalid),
    .io_axiSlaveWBU_rdata(xbarAXI_io_axiSlaveWBU_rdata),
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
    .io_axiMasterDevice_arsize(xbarAXI_io_axiMasterDevice_arsize),
    .io_axiMasterDevice_rready(xbarAXI_io_axiMasterDevice_rready),
    .io_axiMasterDevice_rvalid(xbarAXI_io_axiMasterDevice_rvalid),
    .io_axiMasterDevice_rdata(xbarAXI_io_axiMasterDevice_rdata),
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
  AXILiteClint axiLiteClint ( // @[src/main/scala/Main.scala 66:34]
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
  assign io_master_awvalid = xbarAXI_io_axiMasterDevice_awvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awaddr = xbarAXI_io_axiMasterDevice_awaddr; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awid = 4'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awlen = 8'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awsize = xbarAXI_io_axiMasterDevice_awsize; // @[src/main/scala/Main.scala 63:41]
  assign io_master_awburst = 2'h1; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wvalid = xbarAXI_io_axiMasterDevice_wvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wdata = xbarAXI_io_axiMasterDevice_wdata; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wstrb = xbarAXI_io_axiMasterDevice_wstrb; // @[src/main/scala/Main.scala 63:41]
  assign io_master_wlast = xbarAXI_io_axiMasterDevice_wlast; // @[src/main/scala/Main.scala 63:41]
  assign io_master_bready = xbarAXI_io_axiMasterDevice_bready; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arvalid = xbarAXI_io_axiMasterDevice_arvalid; // @[src/main/scala/Main.scala 63:41]
  assign io_master_araddr = xbarAXI_io_axiMasterDevice_araddr; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arid = 4'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arlen = 8'h0; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arsize = xbarAXI_io_axiMasterDevice_arsize; // @[src/main/scala/Main.scala 63:41]
  assign io_master_arburst = 2'h1; // @[src/main/scala/Main.scala 63:41]
  assign io_master_rready = xbarAXI_io_axiMasterDevice_rready; // @[src/main/scala/Main.scala 63:41]
  assign io_slave_awready = 1'h0; // @[src/main/scala/basemode/Interface.scala 193:21]
  assign io_slave_wready = 1'h0; // @[src/main/scala/basemode/Interface.scala 195:20]
  assign io_slave_bvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 197:20]
  assign io_slave_bresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 198:19]
  assign io_slave_bid = 4'h0; // @[src/main/scala/basemode/Interface.scala 199:17]
  assign io_slave_arready = 1'h0; // @[src/main/scala/basemode/Interface.scala 201:21]
  assign io_slave_rvalid = 1'h0; // @[src/main/scala/basemode/Interface.scala 203:20]
  assign io_slave_rresp = 2'h0; // @[src/main/scala/basemode/Interface.scala 204:19]
  assign io_slave_rdata = 32'h0; // @[src/main/scala/basemode/Interface.scala 205:19]
  assign io_slave_rlast = 1'h0; // @[src/main/scala/basemode/Interface.scala 206:19]
  assign io_slave_rid = 4'h0; // @[src/main/scala/basemode/Interface.scala 207:17]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_wbu2PC_valid = wbu_io_wbu2PC_valid; // @[src/main/scala/Main.scala 38:25]
  assign pc_io_wbu2PC_bits_nextPC = wbu_io_wbu2PC_bits_nextPC; // @[src/main/scala/Main.scala 38:25]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_pc = pc_io_pc; // @[src/main/scala/Main.scala 43:33]
  assign ifu_io_ifu2Mem_bvalid = xbarAXI_io_axiSlaveIFU_bvalid; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_arready = xbarAXI_io_axiSlaveIFU_arready; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_rvalid = xbarAXI_io_axiSlaveIFU_rvalid; // @[src/main/scala/Main.scala 46:24]
  assign ifu_io_ifu2Mem_rdata = xbarAXI_io_axiSlaveIFU_rdata; // @[src/main/scala/Main.scala 46:24]
  assign riscv32BaseReg_clock = clock;
  assign riscv32BaseReg_reset = reset;
  assign riscv32BaseReg_io_idu2BaseReg_rs1Index = idu_io_idu2BaseReg_rs1Index; // @[src/main/scala/Main.scala 50:33]
  assign riscv32BaseReg_io_idu2BaseReg_rs2Index = idu_io_idu2BaseReg_rs2Index; // @[src/main/scala/Main.scala 50:33]
  assign riscv32BaseReg_io_wbu2BaseReg_rdIndex = wbu_io_wbu2BaseReg_rdIndex; // @[src/main/scala/Main.scala 58:41]
  assign riscv32BaseReg_io_wbu2BaseReg_data = wbu_io_wbu2BaseReg_data; // @[src/main/scala/Main.scala 58:41]
  assign riscv32BaseReg_io_wbu2BaseReg_regWR = wbu_io_wbu2BaseReg_regWR; // @[src/main/scala/Main.scala 58:41]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_exu2CSR_mret = exu_io_exu2CSR_mret; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_exu2CSR_ecall = exu_io_exu2CSR_ecall; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_exu2CSR_csr = exu_io_exu2CSR_csr; // @[src/main/scala/Main.scala 54:25]
  assign csrReg_io_wbu2CSR_pc = wbu_io_wbu2CSR_pc; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrWData = wbu_io_wbu2CSR_csrWData; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csr = wbu_io_wbu2CSR_csr; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_ecall = wbu_io_wbu2CSR_ecall; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrEn = wbu_io_wbu2CSR_csrEn; // @[src/main/scala/Main.scala 57:41]
  assign csrReg_io_wbu2CSR_csrWr = wbu_io_wbu2CSR_csrWr; // @[src/main/scala/Main.scala 57:41]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_inst_valid = ifu_io_inst_valid; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_inst_bits_inst = ifu_io_inst_bits_inst; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_inst_bits_pc = ifu_io_inst_bits_pc; // @[src/main/scala/Main.scala 45:41]
  assign idu_io_idu2EXU_ready = exu_io_idu2EXU_ready; // @[src/main/scala/Main.scala 49:33]
  assign idu_io_idu2BaseReg_rs1Data = riscv32BaseReg_io_idu2BaseReg_rs1Data; // @[src/main/scala/Main.scala 50:33]
  assign idu_io_idu2BaseReg_rs2Data = riscv32BaseReg_io_idu2BaseReg_rs2Data; // @[src/main/scala/Main.scala 50:33]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_idu2EXU_valid = idu_io_idu2EXU_valid; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_pc = idu_io_idu2EXU_bits_pc; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs1Data = idu_io_idu2EXU_bits_rs1Data; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs2Data = idu_io_idu2EXU_bits_rs2Data; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_imm = idu_io_idu2EXU_bits_imm; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_inst = idu_io_idu2EXU_bits_inst; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_regWR = idu_io_idu2EXU_bits_regWR; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_srcAALU = idu_io_idu2EXU_bits_srcAALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_srcBALU = idu_io_idu2EXU_bits_srcBALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_ctrALU = idu_io_idu2EXU_bits_ctrALU; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_branch = idu_io_idu2EXU_bits_branch; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_toReg = idu_io_idu2EXU_bits_toReg; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memWR = idu_io_idu2EXU_bits_memWR; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memValid = idu_io_idu2EXU_bits_memValid; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_memOP = idu_io_idu2EXU_bits_memOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_rs1Index = idu_io_idu2EXU_bits_rs1Index; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_ecall = idu_io_idu2EXU_bits_ecall; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_mret = idu_io_idu2EXU_bits_mret; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrEn = idu_io_idu2EXU_bits_csrEn; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrWr = idu_io_idu2EXU_bits_csrWr; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrOP = idu_io_idu2EXU_bits_csrOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_idu2EXU_bits_csrALUOP = idu_io_idu2EXU_bits_csrALUOP; // @[src/main/scala/Main.scala 49:33]
  assign exu_io_exu2WBU_ready = wbu_io_exu2WBU_ready; // @[src/main/scala/Main.scala 53:25]
  assign exu_io_exu2CSR_csrData = csrReg_io_exu2CSR_csrData; // @[src/main/scala/Main.scala 54:25]
  assign wbu_clock = clock;
  assign wbu_reset = reset;
  assign wbu_io_exu2WBU_valid = exu_io_exu2WBU_valid; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_pc = exu_io_exu2WBU_bits_pc; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memData = exu_io_exu2WBU_bits_memData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_aluData = exu_io_exu2WBU_bits_aluData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrWData = exu_io_exu2WBU_bits_csrWData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrData = exu_io_exu2WBU_bits_csrData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_immData = exu_io_exu2WBU_bits_immData; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_rs1Data = exu_io_exu2WBU_bits_rs1Data; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_inst = exu_io_exu2WBU_bits_inst; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_regWR = exu_io_exu2WBU_bits_regWR; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memWR = exu_io_exu2WBU_bits_memWR; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memValid = exu_io_exu2WBU_bits_memValid; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_memOP = exu_io_exu2WBU_bits_memOP; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_toReg = exu_io_exu2WBU_bits_toReg; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_branchCtr = exu_io_exu2WBU_bits_branchCtr; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_less = exu_io_exu2WBU_bits_less; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_zero = exu_io_exu2WBU_bits_zero; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_ecall = exu_io_exu2WBU_bits_ecall; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrEn = exu_io_exu2WBU_bits_csrEn; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_exu2WBU_bits_csrWr = exu_io_exu2WBU_bits_csrWr; // @[src/main/scala/Main.scala 53:25]
  assign wbu_io_wbu2Mem_awready = xbarAXI_io_axiSlaveWBU_awready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_wready = xbarAXI_io_axiSlaveWBU_wready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_bvalid = xbarAXI_io_axiSlaveWBU_bvalid; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_arready = xbarAXI_io_axiSlaveWBU_arready; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_rvalid = xbarAXI_io_axiSlaveWBU_rvalid; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2Mem_rdata = xbarAXI_io_axiSlaveWBU_rdata; // @[src/main/scala/Main.scala 59:41]
  assign wbu_io_wbu2PC_ready = pc_io_wbu2PC_ready; // @[src/main/scala/Main.scala 38:25]
  assign xbarAXI_clock = clock;
  assign xbarAXI_reset = reset;
  assign xbarAXI_io_axiSlaveIFU_bready = ifu_io_ifu2Mem_bready; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_arvalid = ifu_io_ifu2Mem_arvalid; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_araddr = ifu_io_ifu2Mem_araddr; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveIFU_rready = ifu_io_ifu2Mem_rready; // @[src/main/scala/Main.scala 46:24]
  assign xbarAXI_io_axiSlaveWBU_awvalid = wbu_io_wbu2Mem_awvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_awaddr = wbu_io_wbu2Mem_awaddr; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_awsize = wbu_io_wbu2Mem_awsize; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wvalid = wbu_io_wbu2Mem_wvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wdata = wbu_io_wbu2Mem_wdata; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wstrb = wbu_io_wbu2Mem_wstrb; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_wlast = wbu_io_wbu2Mem_wlast; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_bready = wbu_io_wbu2Mem_bready; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_arvalid = wbu_io_wbu2Mem_arvalid; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_araddr = wbu_io_wbu2Mem_araddr; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_arsize = wbu_io_wbu2Mem_arsize; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiSlaveWBU_rready = wbu_io_wbu2Mem_rready; // @[src/main/scala/Main.scala 59:41]
  assign xbarAXI_io_axiMasterDevice_awready = io_master_awready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_wready = io_master_wready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_bvalid = io_master_bvalid; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_arready = io_master_arready; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_rvalid = io_master_rvalid; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiMasterDevice_rdata = io_master_rdata; // @[src/main/scala/Main.scala 63:41]
  assign xbarAXI_io_axiLiteClint_arReady = axiLiteClint_io_axiLiteMaster_arReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_rData = axiLiteClint_io_axiLiteMaster_rData; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_rValid = axiLiteClint_io_axiLiteMaster_rValid; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_awReady = axiLiteClint_io_axiLiteMaster_awReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_wReady = axiLiteClint_io_axiLiteMaster_wReady; // @[src/main/scala/Main.scala 67:41]
  assign xbarAXI_io_axiLiteClint_bValid = axiLiteClint_io_axiLiteMaster_bValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_clock = clock;
  assign axiLiteClint_reset = reset;
  assign axiLiteClint_io_axiLiteMaster_arAddr = xbarAXI_io_axiLiteClint_arAddr; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_arValid = xbarAXI_io_axiLiteClint_arValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_rReady = xbarAXI_io_axiLiteClint_rReady; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_awValid = xbarAXI_io_axiLiteClint_awValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_wValid = xbarAXI_io_axiLiteClint_wValid; // @[src/main/scala/Main.scala 67:41]
  assign axiLiteClint_io_axiLiteMaster_bReady = xbarAXI_io_axiLiteClint_bReady; // @[src/main/scala/Main.scala 67:41]
endmodule
