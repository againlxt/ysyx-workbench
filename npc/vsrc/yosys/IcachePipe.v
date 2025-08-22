module IcachePipe(
  input         clock,
  input         reset,
  output        io_ifu2ICache_ready, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_ifu2ICache_valid, // @[src/main/scala/ifu/Icache.scala 247:16]
  input  [31:0] io_ifu2ICache_bits_pc, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_icache2IFU_ready, // @[src/main/scala/ifu/Icache.scala 247:16]
  output        io_icache2IFU_valid, // @[src/main/scala/ifu/Icache.scala 247:16]
  output [31:0] io_icache2IFU_bits_pc, // @[src/main/scala/ifu/Icache.scala 247:16]
  output [31:0] io_icache2IFU_bits_inst, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_icache2Mem_arready, // @[src/main/scala/ifu/Icache.scala 247:16]
  output        io_icache2Mem_arvalid, // @[src/main/scala/ifu/Icache.scala 247:16]
  output [31:0] io_icache2Mem_araddr, // @[src/main/scala/ifu/Icache.scala 247:16]
  output [7:0]  io_icache2Mem_arlen, // @[src/main/scala/ifu/Icache.scala 247:16]
  output        io_icache2Mem_rready, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_icache2Mem_rvalid, // @[src/main/scala/ifu/Icache.scala 247:16]
  input  [31:0] io_icache2Mem_rdata, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_icache2Mem_rlast, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_wbu2Icache, // @[src/main/scala/ifu/Icache.scala 247:16]
  input         io_flush // @[src/main/scala/ifu/Icache.scala 247:16]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cacheMem_0_0 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_0_cacheLineVec_0_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_0_cacheLineVec_0_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_0_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_0_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_0_MPORT_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_0_MPORT_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_0_MPORT_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_0_0_cacheLineVec_0_en_pipe_0;
  reg  cacheMem_0_0_cacheLineVec_0_addr_pipe_0;
  reg [31:0] cacheMem_0_1 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_1_cacheLineVec_0_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_1_cacheLineVec_0_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_1_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_1_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_1_MPORT_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_1_MPORT_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_1_MPORT_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_0_1_cacheLineVec_0_en_pipe_0;
  reg  cacheMem_0_1_cacheLineVec_0_addr_pipe_0;
  reg [31:0] cacheMem_0_2 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_2_cacheLineVec_0_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_2_cacheLineVec_0_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_2_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_2_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_2_MPORT_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_2_MPORT_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_2_MPORT_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_0_2_cacheLineVec_0_en_pipe_0;
  reg  cacheMem_0_2_cacheLineVec_0_addr_pipe_0;
  reg [31:0] cacheMem_0_3 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_3_cacheLineVec_0_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_3_cacheLineVec_0_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_3_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_0_3_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_3_MPORT_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_3_MPORT_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_0_3_MPORT_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_0_3_cacheLineVec_0_en_pipe_0;
  reg  cacheMem_0_3_cacheLineVec_0_addr_pipe_0;
  reg [31:0] cacheMem_1_0 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_0_cacheLineVec_1_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_0_cacheLineVec_1_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_0_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_0_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_0_MPORT_2_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_0_MPORT_2_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_0_MPORT_2_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_1_0_cacheLineVec_1_en_pipe_0;
  reg  cacheMem_1_0_cacheLineVec_1_addr_pipe_0;
  reg [31:0] cacheMem_1_1 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_1_cacheLineVec_1_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_1_cacheLineVec_1_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_1_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_1_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_1_MPORT_2_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_1_MPORT_2_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_1_MPORT_2_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_1_1_cacheLineVec_1_en_pipe_0;
  reg  cacheMem_1_1_cacheLineVec_1_addr_pipe_0;
  reg [31:0] cacheMem_1_2 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_2_cacheLineVec_1_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_2_cacheLineVec_1_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_2_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_2_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_2_MPORT_2_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_2_MPORT_2_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_2_MPORT_2_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_1_2_cacheLineVec_1_en_pipe_0;
  reg  cacheMem_1_2_cacheLineVec_1_addr_pipe_0;
  reg [31:0] cacheMem_1_3 [0:1]; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_3_cacheLineVec_1_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_3_cacheLineVec_1_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_3_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire [31:0] cacheMem_1_3_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_3_MPORT_2_addr; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_3_MPORT_2_mask; // @[src/main/scala/ifu/Icache.scala 261:52]
  wire  cacheMem_1_3_MPORT_2_en; // @[src/main/scala/ifu/Icache.scala 261:52]
  reg  cacheMem_1_3_cacheLineVec_1_en_pipe_0;
  reg  cacheMem_1_3_cacheLineVec_1_addr_pipe_0;
  reg [26:0] tagMem_0 [0:1]; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire  tagMem_0_tagVec_0_en; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire  tagMem_0_tagVec_0_addr; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire [26:0] tagMem_0_tagVec_0_data; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire [26:0] tagMem_0_MPORT_1_data; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire  tagMem_0_MPORT_1_addr; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire  tagMem_0_MPORT_1_mask; // @[src/main/scala/ifu/Icache.scala 262:60]
  wire  tagMem_0_MPORT_1_en; // @[src/main/scala/ifu/Icache.scala 262:60]
  reg  tagMem_0_tagVec_0_en_pipe_0;
  reg  tagMem_0_tagVec_0_addr_pipe_0;
  wire  fetchReq_clock; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_reset; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_io_fetchReqIO_ifu2FetchReq_ready; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_io_fetchReqIO_ifu2FetchReq_valid; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire [31:0] fetchReq_io_fetchReqIO_ifu2FetchReq_bits_pc; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire [31:0] fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  fetchReq_io_fetchReqIO_flush; // @[src/main/scala/ifu/Icache.scala 263:33]
  wire  checkUnit_clock; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_reset; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_fetchReq2CheckUnit_valid; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2PreDecoder_valid; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_pc; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Mem_arready; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Mem_arvalid; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Mem_araddr; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [7:0] checkUnit_io_checkUnitIO_checkUnit2Mem_arlen; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Mem_rready; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Mem_rlast; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [26:0] checkUnit_io_checkUnitIO_checkUnit2Sram_tagVec_0; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_0; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_1; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_2; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [31:0] checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_3; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire [26:0] checkUnit_io_checkUnitIO_checkUnit2Sram_tagBuf; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_checkUnit2Sram_wen; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_wbu2Icache; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  checkUnit_io_checkUnitIO_flush; // @[src/main/scala/ifu/Icache.scala 264:33]
  wire  preDecoder_clock; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_reset; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_io_preDecoderIO_checkUnit2PreDecoder_valid; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire [31:0] preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_pc; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire [31:0] preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_io_preDecoderIO_preDecoder2IFU_ready; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_io_preDecoderIO_preDecoder2IFU_valid; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire [31:0] preDecoder_io_preDecoderIO_preDecoder2IFU_bits_pc; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire [31:0] preDecoder_io_preDecoderIO_preDecoder2IFU_bits_inst; // @[src/main/scala/ifu/Icache.scala 265:33]
  wire  preDecoder_io_preDecoderIO_flush; // @[src/main/scala/ifu/Icache.scala 265:33]
  reg [31:0] checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits_r; // @[src/main/scala/ifu/Icache.scala 257:45]
  reg [31:0] preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_pc; // @[src/main/scala/ifu/Icache.scala 257:45]
  reg [31:0] preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_inst; // @[src/main/scala/ifu/Icache.scala 257:45]
  FetchReq fetchReq ( // @[src/main/scala/ifu/Icache.scala 263:33]
    .clock(fetchReq_clock),
    .reset(fetchReq_reset),
    .io_fetchReqIO_ifu2FetchReq_ready(fetchReq_io_fetchReqIO_ifu2FetchReq_ready),
    .io_fetchReqIO_ifu2FetchReq_valid(fetchReq_io_fetchReqIO_ifu2FetchReq_valid),
    .io_fetchReqIO_ifu2FetchReq_bits_pc(fetchReq_io_fetchReqIO_ifu2FetchReq_bits_pc),
    .io_fetchReqIO_fetchReq2CheckUnit_ready(fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready),
    .io_fetchReqIO_fetchReq2CheckUnit_valid(fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid),
    .io_fetchReqIO_fetchReq2CheckUnit_bits(fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits),
    .io_fetchReqIO_flush(fetchReq_io_fetchReqIO_flush)
  );
  CheckUnit checkUnit ( // @[src/main/scala/ifu/Icache.scala 264:33]
    .clock(checkUnit_clock),
    .reset(checkUnit_reset),
    .io_checkUnitIO_fetchReq2CheckUnit_ready(checkUnit_io_checkUnitIO_fetchReq2CheckUnit_ready),
    .io_checkUnitIO_fetchReq2CheckUnit_valid(checkUnit_io_checkUnitIO_fetchReq2CheckUnit_valid),
    .io_checkUnitIO_fetchReq2CheckUnit_bits(checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits),
    .io_checkUnitIO_checkUnit2PreDecoder_ready(checkUnit_io_checkUnitIO_checkUnit2PreDecoder_ready),
    .io_checkUnitIO_checkUnit2PreDecoder_valid(checkUnit_io_checkUnitIO_checkUnit2PreDecoder_valid),
    .io_checkUnitIO_checkUnit2PreDecoder_bits_pc(checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_pc),
    .io_checkUnitIO_checkUnit2PreDecoder_bits_inst(checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_inst),
    .io_checkUnitIO_checkUnit2Mem_arready(checkUnit_io_checkUnitIO_checkUnit2Mem_arready),
    .io_checkUnitIO_checkUnit2Mem_arvalid(checkUnit_io_checkUnitIO_checkUnit2Mem_arvalid),
    .io_checkUnitIO_checkUnit2Mem_araddr(checkUnit_io_checkUnitIO_checkUnit2Mem_araddr),
    .io_checkUnitIO_checkUnit2Mem_arlen(checkUnit_io_checkUnitIO_checkUnit2Mem_arlen),
    .io_checkUnitIO_checkUnit2Mem_rready(checkUnit_io_checkUnitIO_checkUnit2Mem_rready),
    .io_checkUnitIO_checkUnit2Mem_rvalid(checkUnit_io_checkUnitIO_checkUnit2Mem_rvalid),
    .io_checkUnitIO_checkUnit2Mem_rdata(checkUnit_io_checkUnitIO_checkUnit2Mem_rdata),
    .io_checkUnitIO_checkUnit2Mem_rlast(checkUnit_io_checkUnitIO_checkUnit2Mem_rlast),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2),
    .io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3),
    .io_checkUnitIO_checkUnit2Sram_tagVec_0(checkUnit_io_checkUnitIO_checkUnit2Sram_tagVec_0),
    .io_checkUnitIO_checkUnit2Sram_cacheBuf_0(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_0),
    .io_checkUnitIO_checkUnit2Sram_cacheBuf_1(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_1),
    .io_checkUnitIO_checkUnit2Sram_cacheBuf_2(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_2),
    .io_checkUnitIO_checkUnit2Sram_cacheBuf_3(checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_3),
    .io_checkUnitIO_checkUnit2Sram_tagBuf(checkUnit_io_checkUnitIO_checkUnit2Sram_tagBuf),
    .io_checkUnitIO_checkUnit2Sram_replaceIndex(checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex),
    .io_checkUnitIO_checkUnit2Sram_wen(checkUnit_io_checkUnitIO_checkUnit2Sram_wen),
    .io_checkUnitIO_wbu2Icache(checkUnit_io_checkUnitIO_wbu2Icache),
    .io_checkUnitIO_flush(checkUnit_io_checkUnitIO_flush)
  );
  PreDecoder preDecoder ( // @[src/main/scala/ifu/Icache.scala 265:33]
    .clock(preDecoder_clock),
    .reset(preDecoder_reset),
    .io_preDecoderIO_checkUnit2PreDecoder_ready(preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready),
    .io_preDecoderIO_checkUnit2PreDecoder_valid(preDecoder_io_preDecoderIO_checkUnit2PreDecoder_valid),
    .io_preDecoderIO_checkUnit2PreDecoder_bits_pc(preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_pc),
    .io_preDecoderIO_checkUnit2PreDecoder_bits_inst(preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_inst),
    .io_preDecoderIO_preDecoder2IFU_ready(preDecoder_io_preDecoderIO_preDecoder2IFU_ready),
    .io_preDecoderIO_preDecoder2IFU_valid(preDecoder_io_preDecoderIO_preDecoder2IFU_valid),
    .io_preDecoderIO_preDecoder2IFU_bits_pc(preDecoder_io_preDecoderIO_preDecoder2IFU_bits_pc),
    .io_preDecoderIO_preDecoder2IFU_bits_inst(preDecoder_io_preDecoderIO_preDecoder2IFU_bits_inst),
    .io_preDecoderIO_flush(preDecoder_io_preDecoderIO_flush)
  );
  assign cacheMem_0_0_cacheLineVec_0_en = cacheMem_0_0_cacheLineVec_0_en_pipe_0;
  assign cacheMem_0_0_cacheLineVec_0_addr = cacheMem_0_0_cacheLineVec_0_addr_pipe_0;
  assign cacheMem_0_0_cacheLineVec_0_data = cacheMem_0_0[cacheMem_0_0_cacheLineVec_0_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_0_0_MPORT_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_0;
  assign cacheMem_0_0_MPORT_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_0_0_MPORT_mask = 1'h1;
  assign cacheMem_0_0_MPORT_en = checkUnit_io_checkUnitIO_checkUnit2Sram_wen;
  assign cacheMem_0_1_cacheLineVec_0_en = cacheMem_0_1_cacheLineVec_0_en_pipe_0;
  assign cacheMem_0_1_cacheLineVec_0_addr = cacheMem_0_1_cacheLineVec_0_addr_pipe_0;
  assign cacheMem_0_1_cacheLineVec_0_data = cacheMem_0_1[cacheMem_0_1_cacheLineVec_0_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_0_1_MPORT_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_1;
  assign cacheMem_0_1_MPORT_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_0_1_MPORT_mask = 1'h1;
  assign cacheMem_0_1_MPORT_en = checkUnit_io_checkUnitIO_checkUnit2Sram_wen;
  assign cacheMem_0_2_cacheLineVec_0_en = cacheMem_0_2_cacheLineVec_0_en_pipe_0;
  assign cacheMem_0_2_cacheLineVec_0_addr = cacheMem_0_2_cacheLineVec_0_addr_pipe_0;
  assign cacheMem_0_2_cacheLineVec_0_data = cacheMem_0_2[cacheMem_0_2_cacheLineVec_0_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_0_2_MPORT_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_2;
  assign cacheMem_0_2_MPORT_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_0_2_MPORT_mask = 1'h1;
  assign cacheMem_0_2_MPORT_en = checkUnit_io_checkUnitIO_checkUnit2Sram_wen;
  assign cacheMem_0_3_cacheLineVec_0_en = cacheMem_0_3_cacheLineVec_0_en_pipe_0;
  assign cacheMem_0_3_cacheLineVec_0_addr = cacheMem_0_3_cacheLineVec_0_addr_pipe_0;
  assign cacheMem_0_3_cacheLineVec_0_data = cacheMem_0_3[cacheMem_0_3_cacheLineVec_0_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_0_3_MPORT_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_3;
  assign cacheMem_0_3_MPORT_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_0_3_MPORT_mask = 1'h1;
  assign cacheMem_0_3_MPORT_en = checkUnit_io_checkUnitIO_checkUnit2Sram_wen;
  assign cacheMem_1_0_cacheLineVec_1_en = cacheMem_1_0_cacheLineVec_1_en_pipe_0;
  assign cacheMem_1_0_cacheLineVec_1_addr = cacheMem_1_0_cacheLineVec_1_addr_pipe_0;
  assign cacheMem_1_0_cacheLineVec_1_data = cacheMem_1_0[cacheMem_1_0_cacheLineVec_1_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_1_0_MPORT_2_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_0;
  assign cacheMem_1_0_MPORT_2_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_1_0_MPORT_2_mask = 1'h1;
  assign cacheMem_1_0_MPORT_2_en = 1'h0;
  assign cacheMem_1_1_cacheLineVec_1_en = cacheMem_1_1_cacheLineVec_1_en_pipe_0;
  assign cacheMem_1_1_cacheLineVec_1_addr = cacheMem_1_1_cacheLineVec_1_addr_pipe_0;
  assign cacheMem_1_1_cacheLineVec_1_data = cacheMem_1_1[cacheMem_1_1_cacheLineVec_1_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_1_1_MPORT_2_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_1;
  assign cacheMem_1_1_MPORT_2_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_1_1_MPORT_2_mask = 1'h1;
  assign cacheMem_1_1_MPORT_2_en = 1'h0;
  assign cacheMem_1_2_cacheLineVec_1_en = cacheMem_1_2_cacheLineVec_1_en_pipe_0;
  assign cacheMem_1_2_cacheLineVec_1_addr = cacheMem_1_2_cacheLineVec_1_addr_pipe_0;
  assign cacheMem_1_2_cacheLineVec_1_data = cacheMem_1_2[cacheMem_1_2_cacheLineVec_1_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_1_2_MPORT_2_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_2;
  assign cacheMem_1_2_MPORT_2_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_1_2_MPORT_2_mask = 1'h1;
  assign cacheMem_1_2_MPORT_2_en = 1'h0;
  assign cacheMem_1_3_cacheLineVec_1_en = cacheMem_1_3_cacheLineVec_1_en_pipe_0;
  assign cacheMem_1_3_cacheLineVec_1_addr = cacheMem_1_3_cacheLineVec_1_addr_pipe_0;
  assign cacheMem_1_3_cacheLineVec_1_data = cacheMem_1_3[cacheMem_1_3_cacheLineVec_1_addr]; // @[src/main/scala/ifu/Icache.scala 261:52]
  assign cacheMem_1_3_MPORT_2_data = checkUnit_io_checkUnitIO_checkUnit2Sram_cacheBuf_3;
  assign cacheMem_1_3_MPORT_2_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign cacheMem_1_3_MPORT_2_mask = 1'h1;
  assign cacheMem_1_3_MPORT_2_en = 1'h0;
  assign tagMem_0_tagVec_0_en = tagMem_0_tagVec_0_en_pipe_0;
  assign tagMem_0_tagVec_0_addr = tagMem_0_tagVec_0_addr_pipe_0;
  assign tagMem_0_tagVec_0_data = tagMem_0[tagMem_0_tagVec_0_addr]; // @[src/main/scala/ifu/Icache.scala 262:60]
  assign tagMem_0_MPORT_1_data = checkUnit_io_checkUnitIO_checkUnit2Sram_tagBuf;
  assign tagMem_0_MPORT_1_addr = checkUnit_io_checkUnitIO_checkUnit2Sram_replaceIndex;
  assign tagMem_0_MPORT_1_mask = 1'h1;
  assign tagMem_0_MPORT_1_en = checkUnit_io_checkUnitIO_checkUnit2Sram_wen;
  assign io_ifu2ICache_ready = fetchReq_io_fetchReqIO_ifu2FetchReq_ready; // @[src/main/scala/ifu/Icache.scala 284:45]
  assign io_icache2IFU_valid = preDecoder_io_preDecoderIO_preDecoder2IFU_valid; // @[src/main/scala/ifu/Icache.scala 291:51]
  assign io_icache2IFU_bits_pc = preDecoder_io_preDecoderIO_preDecoder2IFU_bits_pc; // @[src/main/scala/ifu/Icache.scala 291:51]
  assign io_icache2IFU_bits_inst = preDecoder_io_preDecoderIO_preDecoder2IFU_bits_inst; // @[src/main/scala/ifu/Icache.scala 291:51]
  assign io_icache2Mem_arvalid = checkUnit_io_checkUnitIO_checkUnit2Mem_arvalid; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign io_icache2Mem_araddr = checkUnit_io_checkUnitIO_checkUnit2Mem_araddr; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign io_icache2Mem_arlen = checkUnit_io_checkUnitIO_checkUnit2Mem_arlen; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign io_icache2Mem_rready = checkUnit_io_checkUnitIO_checkUnit2Mem_rready; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign fetchReq_clock = clock;
  assign fetchReq_reset = reset;
  assign fetchReq_io_fetchReqIO_ifu2FetchReq_valid = io_ifu2ICache_valid; // @[src/main/scala/ifu/Icache.scala 284:45]
  assign fetchReq_io_fetchReqIO_ifu2FetchReq_bits_pc = io_ifu2ICache_bits_pc; // @[src/main/scala/ifu/Icache.scala 284:45]
  assign fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready = checkUnit_io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 256:33]
  assign fetchReq_io_fetchReqIO_flush = io_flush; // @[src/main/scala/ifu/Icache.scala 285:49]
  assign checkUnit_clock = clock;
  assign checkUnit_reset = reset;
  assign checkUnit_io_checkUnitIO_fetchReq2CheckUnit_valid = fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
    checkUnit_io_checkUnitIO_fetchReq2CheckUnit_ready; // @[src/main/scala/ifu/Icache.scala 258:50]
  assign checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits = checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits_r; // @[src/main/scala/ifu/Icache.scala 257:33]
  assign checkUnit_io_checkUnitIO_checkUnit2PreDecoder_ready = preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 256:33]
  assign checkUnit_io_checkUnitIO_checkUnit2Mem_arready = io_icache2Mem_arready; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign checkUnit_io_checkUnitIO_checkUnit2Mem_rvalid = io_icache2Mem_rvalid; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign checkUnit_io_checkUnitIO_checkUnit2Mem_rdata = io_icache2Mem_rdata; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign checkUnit_io_checkUnitIO_checkUnit2Mem_rlast = io_icache2Mem_rlast; // @[src/main/scala/ifu/Icache.scala 273:48]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_0 = cacheMem_0_0_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_1 = cacheMem_0_1_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_2 = cacheMem_0_2_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_0_3 = cacheMem_0_3_cacheLineVec_0_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_0 = cacheMem_1_0_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_1 = cacheMem_1_1_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_2 = cacheMem_1_2_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_cacheLineVec_1_3 = cacheMem_1_3_cacheLineVec_1_data; // @[src/main/scala/ifu/Icache.scala 274:65]
  assign checkUnit_io_checkUnitIO_checkUnit2Sram_tagVec_0 = tagMem_0_tagVec_0_data; // @[src/main/scala/ifu/Icache.scala 275:73]
  assign checkUnit_io_checkUnitIO_wbu2Icache = io_wbu2Icache; // @[src/main/scala/ifu/Icache.scala 287:49]
  assign checkUnit_io_checkUnitIO_flush = io_flush; // @[src/main/scala/ifu/Icache.scala 286:49]
  assign preDecoder_clock = clock;
  assign preDecoder_reset = reset;
  assign preDecoder_io_preDecoderIO_checkUnit2PreDecoder_valid = checkUnit_io_checkUnitIO_checkUnit2PreDecoder_valid &
    preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready; // @[src/main/scala/ifu/Icache.scala 258:50]
  assign preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_pc =
    preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_pc; // @[src/main/scala/ifu/Icache.scala 257:33]
  assign preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_inst =
    preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_inst; // @[src/main/scala/ifu/Icache.scala 257:33]
  assign preDecoder_io_preDecoderIO_preDecoder2IFU_ready = io_icache2IFU_ready; // @[src/main/scala/ifu/Icache.scala 291:51]
  assign preDecoder_io_preDecoderIO_flush = io_flush; // @[src/main/scala/ifu/Icache.scala 288:49]
  always @(posedge clock) begin
    if (cacheMem_0_0_MPORT_en & cacheMem_0_0_MPORT_mask) begin
      cacheMem_0_0[cacheMem_0_0_MPORT_addr] <= cacheMem_0_0_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_0_0_cacheLineVec_0_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_0_0_cacheLineVec_0_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_0_1_MPORT_en & cacheMem_0_1_MPORT_mask) begin
      cacheMem_0_1[cacheMem_0_1_MPORT_addr] <= cacheMem_0_1_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_0_1_cacheLineVec_0_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_0_1_cacheLineVec_0_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_0_2_MPORT_en & cacheMem_0_2_MPORT_mask) begin
      cacheMem_0_2[cacheMem_0_2_MPORT_addr] <= cacheMem_0_2_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_0_2_cacheLineVec_0_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_0_2_cacheLineVec_0_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_0_3_MPORT_en & cacheMem_0_3_MPORT_mask) begin
      cacheMem_0_3[cacheMem_0_3_MPORT_addr] <= cacheMem_0_3_MPORT_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_0_3_cacheLineVec_0_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_0_3_cacheLineVec_0_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_1_0_MPORT_2_en & cacheMem_1_0_MPORT_2_mask) begin
      cacheMem_1_0[cacheMem_1_0_MPORT_2_addr] <= cacheMem_1_0_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_1_0_cacheLineVec_1_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_1_0_cacheLineVec_1_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_1_1_MPORT_2_en & cacheMem_1_1_MPORT_2_mask) begin
      cacheMem_1_1[cacheMem_1_1_MPORT_2_addr] <= cacheMem_1_1_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_1_1_cacheLineVec_1_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_1_1_cacheLineVec_1_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_1_2_MPORT_2_en & cacheMem_1_2_MPORT_2_mask) begin
      cacheMem_1_2[cacheMem_1_2_MPORT_2_addr] <= cacheMem_1_2_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_1_2_cacheLineVec_1_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_1_2_cacheLineVec_1_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (cacheMem_1_3_MPORT_2_en & cacheMem_1_3_MPORT_2_mask) begin
      cacheMem_1_3[cacheMem_1_3_MPORT_2_addr] <= cacheMem_1_3_MPORT_2_data; // @[src/main/scala/ifu/Icache.scala 261:52]
    end
    cacheMem_1_3_cacheLineVec_1_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      cacheMem_1_3_cacheLineVec_1_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (tagMem_0_MPORT_1_en & tagMem_0_MPORT_1_mask) begin
      tagMem_0[tagMem_0_MPORT_1_addr] <= tagMem_0_MPORT_1_data; // @[src/main/scala/ifu/Icache.scala 262:60]
    end
    tagMem_0_tagVec_0_en_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid &
      fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready;
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & fetchReq_io_fetchReqIO_fetchReq2CheckUnit_ready) begin
      tagMem_0_tagVec_0_addr_pipe_0 <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits[4];
    end
    if (fetchReq_io_fetchReqIO_fetchReq2CheckUnit_valid & checkUnit_io_checkUnitIO_fetchReq2CheckUnit_ready) begin // @[src/main/scala/ifu/Icache.scala 257:45]
      checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits_r <= fetchReq_io_fetchReqIO_fetchReq2CheckUnit_bits; // @[src/main/scala/ifu/Icache.scala 257:45]
    end
    if (checkUnit_io_checkUnitIO_checkUnit2PreDecoder_valid & preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready
      ) begin // @[src/main/scala/ifu/Icache.scala 257:45]
      preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_pc <= checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_pc
        ; // @[src/main/scala/ifu/Icache.scala 257:45]
    end
    if (checkUnit_io_checkUnitIO_checkUnit2PreDecoder_valid & preDecoder_io_preDecoderIO_checkUnit2PreDecoder_ready
      ) begin // @[src/main/scala/ifu/Icache.scala 257:45]
      preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_inst <=
        checkUnit_io_checkUnitIO_checkUnit2PreDecoder_bits_inst; // @[src/main/scala/ifu/Icache.scala 257:45]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_0_0[initvar] = _RAND_0[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_0_1[initvar] = _RAND_3[31:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_0_2[initvar] = _RAND_6[31:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_0_3[initvar] = _RAND_9[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_1_0[initvar] = _RAND_12[31:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_1_1[initvar] = _RAND_15[31:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_1_2[initvar] = _RAND_18[31:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    cacheMem_1_3[initvar] = _RAND_21[31:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    tagMem_0[initvar] = _RAND_24[26:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cacheMem_0_0_cacheLineVec_0_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cacheMem_0_0_cacheLineVec_0_addr_pipe_0 = _RAND_2[0:0];
  _RAND_4 = {1{`RANDOM}};
  cacheMem_0_1_cacheLineVec_0_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cacheMem_0_1_cacheLineVec_0_addr_pipe_0 = _RAND_5[0:0];
  _RAND_7 = {1{`RANDOM}};
  cacheMem_0_2_cacheLineVec_0_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cacheMem_0_2_cacheLineVec_0_addr_pipe_0 = _RAND_8[0:0];
  _RAND_10 = {1{`RANDOM}};
  cacheMem_0_3_cacheLineVec_0_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cacheMem_0_3_cacheLineVec_0_addr_pipe_0 = _RAND_11[0:0];
  _RAND_13 = {1{`RANDOM}};
  cacheMem_1_0_cacheLineVec_1_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  cacheMem_1_0_cacheLineVec_1_addr_pipe_0 = _RAND_14[0:0];
  _RAND_16 = {1{`RANDOM}};
  cacheMem_1_1_cacheLineVec_1_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  cacheMem_1_1_cacheLineVec_1_addr_pipe_0 = _RAND_17[0:0];
  _RAND_19 = {1{`RANDOM}};
  cacheMem_1_2_cacheLineVec_1_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  cacheMem_1_2_cacheLineVec_1_addr_pipe_0 = _RAND_20[0:0];
  _RAND_22 = {1{`RANDOM}};
  cacheMem_1_3_cacheLineVec_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  cacheMem_1_3_cacheLineVec_1_addr_pipe_0 = _RAND_23[0:0];
  _RAND_25 = {1{`RANDOM}};
  tagMem_0_tagVec_0_en_pipe_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  tagMem_0_tagVec_0_addr_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  checkUnit_io_checkUnitIO_fetchReq2CheckUnit_bits_r = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_pc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  preDecoder_io_preDecoderIO_checkUnit2PreDecoder_bits_r_inst = _RAND_29[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
