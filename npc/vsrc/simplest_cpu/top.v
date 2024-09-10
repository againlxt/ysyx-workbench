`define ysyx_23060306_cmd_type_width 3
`define ysyx_23060306_cmd_type_length 6
`define ysyx_23060306_opcode_length 7
`define ysyx_23060306_func7_length 7
`define ysyx_23060306_func3_length 3
`define ysyx_23060306_reg_length 5
`define ysyx_23060306_base_reg_numbers 32
`define ysyx_23060306_ebreak_type_number 7
module top #(BIT_WIDTH = 32) (
    input                   sys_clk,
    input                   reset,

    input [BIT_WIDTH-1:0]   i_command,
    input                   i_ren,
    output[BIT_WIDTH-1:0]   o_pc,
    output[BIT_WIDTH-1:0]   o_wuyiyi
);

wire        clk;
wire        rst;
wire        rst_n;

// pc_reg module's wire and reg
wire [BIT_WIDTH-1:0]  pc;

// ifu module's wire and reg
wire [BIT_WIDTH-1:0]  cmd;

assign  clk         = sys_clk;
assign  rst         = reset;
assign  rst_n       = ~reset;
assign  cmd         = i_command;
assign  rom_ren     = i_ren;
assign  o_pc        = pc;

wire [BIT_WIDTH-1:0]    axi_data_exu2pcreg;
wire                    axi_valid_exu2pcreg;
wire                    axi_ready_exu2pcreg;
wire [BIT_WIDTH-1:0]    axi_data_pcreg2ifu;
wire                    axi_valid_pcreg2ifu;
wire                    axi_ready_pcreg2ifu;
pc_reg #(BIT_WIDTH) pc_reg0  (
    .clk                (clk),
    .rst_n              (rst_n),

    .i_axi_data_dnpc    (axi_data_exu2pcreg),
    .i_axi_valid        (axi_valid_exu2pcreg),
    .o_axi_ready        (axi_ready_exu2pcreg),

    .o_axi_data_pc      (axi_data_pcreg2ifu),
    .o_axi_valid        (axi_valid_pcreg2ifu),
    .i_axi_ready        (axi_ready_pcreg2ifu)
);


wire                    rom_ren;
assign  rom_ren = i_ren;
wire [BIT_WIDTH-1:0]    axi_data_ifu2idu;
wire                    axi_valid_ifu2idu;
wire                    axi_ready_ifu2idu;
ifu #(BIT_WIDTH) ifu0  (
    .clk        (clk),
    .rst_n      (rst_n),

    // port for ROM
    .i_ren      (rom_ren),
    .o_pc       (pc),
    .i_cmd      (cmd),

    // port for pc_reg
    .i_axi_data_pc  (axi_data_pcreg2ifu),
    .i_axi_valid    (axi_valid_pcreg2ifu),
    .o_axi_ready    (axi_ready_pcreg2ifu),

    // port for IDU
    .o_axi_data_cmd (axi_data_ifu2idu),
    .o_axi_valid    (axi_valid_ifu2idu),
    .i_axi_ready    (axi_ready_ifu2idu)
);


wire[`ysyx_23060306_cmd_type_width-1:0]    axi_data_cmdtype;
wire[`ysyx_23060306_opcode_length-1:0]     axi_data_opcode;
wire[`ysyx_23060306_func7_length-1:0]      axi_data_fun7;
wire[`ysyx_23060306_func3_length-1:0]      axi_data_fun3;
wire[`ysyx_23060306_reg_length-1:0]        axi_data_src0index;
wire[`ysyx_23060306_reg_length-1:0]        axi_data_src1index;
wire[`ysyx_23060306_reg_length-1:0]        axi_data_destindex;
wire                                       axi_valid_type;
    
wire[BIT_WIDTH-1:0]       axi_data_src0;
wire[BIT_WIDTH-1:0]       axi_data_src1;
wire[BIT_WIDTH-1:0]       axi_data_dest;
wire[BIT_WIDTH-1:0]       axi_data_imm;
wire                      axi_valid_data;
wire                      axi_ready_exu;

idu #(BIT_WIDTH) idu0 (
    .clk(clk),
    .rst_n(rst_n),

    // port for ifu
    .i_axi_data_cmd(axi_data_ifu2idu),
    .i_axi_valid_ifu(axi_valid_ifu2idu),
    .o_axi_ready_ifu(axi_ready_ifu2idu),


    // port for exu
    // control signal
    .o_axi_data_cmdtype(axi_data_cmdtype),
    .o_axi_data_opcode(axi_data_opcode),
    .o_axi_data_fun7(axi_data_fun7),
    .o_axi_data_fun3(axi_data_fun3),
    .o_axi_data_src0index(axi_data_src0index),
    .o_axi_data_src1index(axi_data_src1index),
    .o_axi_data_destindex(axi_data_destindex),
    .o_axi_valid_type(axi_valid_type),
    // data signal
    .o_axi_data_src0(axi_data_src0),
    .o_axi_data_src1(axi_data_src1),
    .o_axi_data_dest(axi_data_dest),
    .o_axi_data_imm(axi_data_imm),
    .o_axi_valid_data(axi_valid_data),
    .i_axi_ready_exu(axi_ready_exu),


    // IDU to riscv32_base_reg port, arranged in order: src, dest, imm
    .i_reg_data(data_idu_readbasereg),
    .o_reg_index(index_idu_readbasereg)
);
wire [BIT_WIDTH-1:0]                    data_idu_readbasereg    [2:0];
wire [`ysyx_23060306_reg_length-1:0]    index_idu_readbasereg   [2:0];
wire [32*(5+BIT_WIDTH)-1:0] read_basereg_lut;
generate
    genvar i;
    wire[`ysyx_23060306_reg_length-1:0] index;
    for (i = 0; i < 32; i = i + 1) begin
        assign index = i;
        assign read_basereg_lut[(i+1)*37-1:i*37] = 
        {index, read_basereg[i][BIT_WIDTH-1:0]};
    end
endgenerate
mux #(32, 5, 32, 1) idu_readbasereg [2:0](
    .out(data_idu_readbasereg),
    .key(index_idu_readbasereg),
    .default_out(32'd0),
    .lut({3{read_basereg_lut}})
);

wire [BIT_WIDTH-1:0]    read_basereg [`ysyx_23060306_base_reg_numbers-1:0];
riscv32_base_reg #(32) base_reg(
    .clk(clk),
    .rst(!rst_n),

    .wen(wen_basereg),
    .i_reg_data(wbase_reg_data),
    .o_reg_data(read_basereg)
);


wire[`ysyx_23060306_reg_length-1:0]   src0reg_index;
wire[`ysyx_23060306_reg_length-1:0]   src1reg_index;
wire [BIT_WIDTH-1:0]                  data_src0;
wire [BIT_WIDTH-1:0]                  data_src1;
wire                                  exu_wen;
wire[`ysyx_23060306_reg_length-1:0]   destreg_index;
wire[BIT_WIDTH-1:0]                   wbase_reg_data;
exu #(BIT_WIDTH) exu0 (
    .clk(clk),
    .rst_n(rst_n),

    .pc(pc),

    // port for idu
    .i_axi_data_cmdtype(axi_data_cmdtype),
    .i_axi_data_opcode(axi_data_opcode),
    .i_axi_data_fun7(axi_data_fun7),
    .i_axi_data_fun3(axi_data_fun3),
    .i_axi_data_src0index(axi_data_src0index),
    .i_axi_data_src1index(axi_data_src1index),
    .i_axi_data_destindex(axi_data_destindex),
    .i_axi_valid_type(axi_valid_type),
    
    .i_axi_data_src0(axi_data_src0),
    .i_axi_data_src1(axi_data_src1),
    .i_axi_data_dest(axi_data_dest),
    .i_axi_data_imm(axi_data_imm),
    .i_axi_valid_data(axi_valid_data),
    .o_axi_ready_exu(axi_ready_exu),

    // port for base reg
    .o_src0reg_index(src0reg_index),
    .o_src1reg_index(src1reg_index),
    .i_data_src0(data_src0),
    .i_data_src1(data_src1),
    .o_wen(exu_wen),
    .o_destreg_index(destreg_index),
    .o_wbase_reg_data(wbase_reg_data),

    // port for pc_reg
    .o_axi_data_dnpc(axi_data_exu2pcreg),
    .o_axi_valid_dnpc(axi_valid_exu2pcreg),
    .i_axi_ready_dnpc(axi_ready_exu2pcreg),
    .o_wuyiyi(o_wuyiyi)
);
wire[BIT_WIDTH-1:0]  wen_basereg;
decoder #(5, BIT_WIDTH) wen_basereg_decoder(
    .addr_in(destreg_index & {5{exu_wen}}),
    .out(wen_basereg)
);
mux #(32,5,32,1) exu_readbasereg [1:0] (
    .out({data_src1, data_src0}),
    .key({src1reg_index, src0reg_index}),
    .default_out(32'd0),
    .lut({2{read_basereg_lut}})
);

// end_simulation

wire[2:0]   cmd_type_current;
import "DPI-C" function void sim_exit();
assign cmd_type_current = axi_data_cmdtype;
always @(cmd_type_current) begin
    if(cmd_type_current == `ysyx_23060306_ebreak_type_number)   sim_exit();
end

endmodule
