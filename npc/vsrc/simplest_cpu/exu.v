// The command types are arranged in order: R, I, S, B, U, J
`define ysyx_23060306_cmd_type_width 3
`define ysyx_23060306_cmd_type_length 6
`define ysyx_23060306_opcode_length 7
`define ysyx_23060306_func7_length 7
`define ysyx_23060306_func3_length 3
`define ysyx_23060306_reg_length 5
module exu #(
    BIT_WIDTH = 32
) (
    input       clk,
    input       rst_n,

    input [BIT_WIDTH-1:0]   pc,

    // port for idu
    input [`ysyx_23060306_cmd_type_width-1:0]    i_axi_data_cmdtype,
    input [`ysyx_23060306_opcode_length-1:0]     i_axi_data_opcode,
    input [`ysyx_23060306_func7_length-1:0]      i_axi_data_fun7,
    input [`ysyx_23060306_func3_length-1:0]      i_axi_data_fun3,
    input [`ysyx_23060306_reg_length-1:0]        i_axi_data_src0index,
    input [`ysyx_23060306_reg_length-1:0]        i_axi_data_src1index,
    input [`ysyx_23060306_reg_length-1:0]        i_axi_data_destindex,
    input                                        i_axi_valid_type,

    input [BIT_WIDTH-1:0]       i_axi_data_src0,
    input [BIT_WIDTH-1:0]       i_axi_data_src1,
    input [BIT_WIDTH-1:0]       i_axi_data_dest,
    input [BIT_WIDTH-1:0]       i_axi_data_imm,
    input                       i_axi_valid_data,
    output                      o_axi_ready_exu,

    // port for base reg
    output[`ysyx_23060306_reg_length-1:0]   o_src0reg_index,
    output[`ysyx_23060306_reg_length-1:0]   o_src1reg_index,
    input [BIT_WIDTH-1:0]                   i_data_src0,
    input [BIT_WIDTH-1:0]                   i_data_src1,
    output reg                              o_wen,
    output[`ysyx_23060306_reg_length-1:0]   o_destreg_index,
    output[BIT_WIDTH-1:0]                   o_wbase_reg_data,

    // port for pc_reg
    output[BIT_WIDTH-1:0]                   o_axi_data_dnpc,
    output                                  o_axi_valid_dnpc,
    input                                   i_axi_ready_dnpc,

    // 无意义
    output[BIT_WIDTH-1:0]                   o_wuyiyi
);


// idu port
reg [`ysyx_23060306_cmd_type_width-1:0] cmdtype;
/*
reg [`ysyx_23060306_opcode_length-1:0]  opcode;
reg [`ysyx_23060306_func7_length-1:0]   fun7;
reg [`ysyx_23060306_func3_length-1:0]   fun3;
reg [`ysyx_23060306_reg_length-1:0]     src0index;
reg [`ysyx_23060306_reg_length-1:0]     src1index;
reg [`ysyx_23060306_reg_length-1:0]     destindex;
reg [BIT_WIDTH-1:0]                     src0;
reg [BIT_WIDTH-1:0]                     src1;
reg [BIT_WIDTH-1:0]                     dest;
reg [BIT_WIDTH-1:0]                     imm;
*/
reg                                     axi_reg_exu_reg;
assign o_axi_ready_exu = axi_reg_exu_reg;
Reg #(`ysyx_23060306_cmd_type_width, 3'd0) cmdtype_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_cmdtype),
    .dout(cmdtype),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
/*
Reg #(`ysyx_23060306_opcode_length, 7'd0) opcode_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_opcode),
    .dout(opcode),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(`ysyx_23060306_func7_length, 7'd0) fun7_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_fun7),
    .dout(fun7),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(`ysyx_23060306_func3_length, 3'd0) fun3_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_fun3),
    .dout(fun3),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(`ysyx_23060306_reg_length, 5'd0) src0index_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_src0index),
    .dout(src0index),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(`ysyx_23060306_reg_length, 5'd0) src1index_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_src1index),
    .dout(src1index),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(`ysyx_23060306_reg_length, 5'd0) destindex_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_destindex),
    .dout(destindex),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(BIT_WIDTH, 32'd0) src0_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_src0),
    .dout(src0),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(BIT_WIDTH, 32'd0) src1_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_src1),
    .dout(src1),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(BIT_WIDTH, 32'd0) dest_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_dest),
    .dout(dest),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
Reg #(BIT_WIDTH, 32'd0) imm_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_imm),
    .dout(imm),
    .wen(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu)
);
*/
always @(posedge clk) begin
    if(!rst_n)                          axi_reg_exu_reg <= 1'b1;
    else if(axi_reg_exu_reg == 1'b1)    axi_reg_exu_reg <= !(i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu);
    else                                axi_reg_exu_reg <= o_axi_valid_dnpc & i_axi_ready_dnpc;
end


// ex
// cmdtype decoder
wire [`ysyx_23060306_cmd_type_length-1:0] cmdtype_en;
reg [BIT_WIDTH-1:0] wuyiyi;
assign o_wuyiyi = wuyiyi;
always @(i_axi_data_opcode or i_axi_data_fun3 or i_axi_data_fun7 or i_axi_data_src1
        or i_axi_data_dest or i_data_src0 or i_data_src1) begin
    if(cmdtype_en == 6'd1)
    begin
        if(i_axi_data_opcode==0 && i_axi_data_fun3==0 && i_axi_data_fun7==0)
            wuyiyi <= i_axi_data_src1 + i_axi_data_dest + i_data_src0 + i_data_src1;
    end
    else
    begin
        wuyiyi = wuyiyi;
    end
end
// test_wire
wire addi_en;
wire ebreak_en;
decoder #(`ysyx_23060306_cmd_type_width, 8) cmdtype_decoder (
    .addr_in(cmdtype),
    .out({ebreak_en, addi_en, cmdtype_en})
);

// base reg write
assign o_src0reg_index = i_axi_data_src0index;
assign o_src1reg_index = i_axi_data_src1index;
assign o_destreg_index = i_axi_data_destindex;
reg [1:0] count;
always @(posedge clk) begin
    if (!rst_n) count <= 2'd0;
    else if (count == 2'd0) count[0] <= i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu;
    else if (count == 2'd1) count <= count + 1;
    else count <= 2'd0;
end
assign o_wbase_reg_data = (addi_en) ? i_axi_data_src0 + i_axi_data_imm : 32'd0;
always @(posedge clk) begin
    if (!rst_n)             o_wen <= 1'b0;
    else if(o_wen == 1'd0)  o_wen <= (i_axi_valid_type & i_axi_valid_data & o_axi_ready_exu) ? 1 : 0;
    else                    o_wen <= 1'b0;
end

// pc_reg port
assign o_axi_data_dnpc = (ebreak_en) ? 32'd0 : pc + 4;
reg axi_valid_dnpc;
assign o_axi_valid_dnpc = axi_valid_dnpc;
always @(posedge clk) begin
    if(!rst_n)      axi_valid_dnpc <= 1'b0;
    else            axi_valid_dnpc <= o_axi_valid_dnpc & (!i_axi_ready_dnpc) |
                    (!o_axi_valid_dnpc) & (count == 2'd1);
end
endmodule
