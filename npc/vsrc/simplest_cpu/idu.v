// The command types are arranged in order: R, I, S, B, U, J
`define ysyx_23060306_cmd_type_width 3
`define ysyx_23060306_opcode_length 7
`define ysyx_23060306_func7_length 7
`define ysyx_23060306_func3_length 3
`define ysyx_23060306_reg_length 5
module idu #(
    BIT_WIDTH = 32
) (
    input                   clk,
    input                  rst_n,


    // port for ifu
    input [BIT_WIDTH-1:0]   i_axi_data_cmd,
    input                   i_axi_valid_ifu,
    output                  o_axi_ready_ifu,


    // port for exu
    // control signal
    output[`ysyx_23060306_cmd_type_width-1:0]   o_axi_data_cmdtype,
    output[`ysyx_23060306_opcode_length-1:0]    o_axi_data_opcode,
    output[`ysyx_23060306_func7_length-1:0]     o_axi_data_fun7,
    output[`ysyx_23060306_func3_length-1:0]     o_axi_data_fun3,
    output[`ysyx_23060306_reg_length-1:0]       o_axi_data_src0index,
    output[`ysyx_23060306_reg_length-1:0]       o_axi_data_src1index,
    output[`ysyx_23060306_reg_length-1:0]       o_axi_data_destindex,
    output                                      o_axi_valid_type,
    // data signal
    output[BIT_WIDTH-1:0]   o_axi_data_src0,
    output[BIT_WIDTH-1:0]   o_axi_data_src1,
    output[BIT_WIDTH-1:0]   o_axi_data_dest,
    output[BIT_WIDTH-1:0]   o_axi_data_imm,
    output                  o_axi_valid_data,
    input                   i_axi_ready_exu,


    // IDU to riscv32_base_reg port, arranged in order: src, dest, imm
    input [BIT_WIDTH-1:0]   i_reg_data      [2:0],
    output[`ysyx_23060306_reg_length-1:0]             o_reg_index     [2:0]
);

wire[BIT_WIDTH-1:0] axi_data_cmd;
Reg #(BIT_WIDTH, 32'd0) s_ifu2idu_data(
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_cmd),
    .dout(axi_data_cmd),
    .wen(i_axi_valid_ifu & o_axi_ready_ifu)
);
reg axi_ready_ifu_reg;
assign o_axi_ready_ifu = axi_ready_ifu_reg;
Reg #(1, 1'b1) s_ifu2idu_ready(
    .clk(clk),
    .rst(!rst_n),
    .din(1'd1),
    .dout(axi_ready_ifu_reg),
    .wen(o_axi_ready_ifu & (!i_axi_valid_ifu) | (!o_axi_ready_ifu)) // TODO
);


// exu port

// control signal
reg o_axi_valid_type_reg;
reg [`ysyx_23060306_cmd_type_width-1:0] cmd_type_reg;
assign o_axi_valid_type      = o_axi_valid_type_reg;
assign o_axi_data_cmdtype    = cmd_type_reg;
assign o_axi_data_opcode     = axi_data_cmd[6:0];
assign o_axi_data_destindex  = axi_data_cmd[11:7];
assign o_axi_data_src0index  = axi_data_cmd[19:15];
assign o_axi_data_src1index  = axi_data_cmd[24:20];
assign o_axi_data_fun7       = axi_data_cmd[31:25];
assign o_axi_data_fun3       = axi_data_cmd[14:12];
// Identify instruction type
always @(axi_data_cmd) begin
    casez (axi_data_cmd)
        32'b???????_?????_?????_???_?????_00101_11: begin cmd_type_reg = 3'b100; end  // auipc
        32'b???????_?????_?????_100_?????_00000_11: begin cmd_type_reg = 3'b001; end  // lbu
        32'b???????_?????_?????_000_?????_01000_11: begin cmd_type_reg = 3'b010; end  // sb

        /* Integer Register-Register Operations */
        32'b???????_?????_?????_???_?????_00101_11: begin cmd_type_reg = 3'b100; end   //auipc  , U, R(rd) = s->pc + imm);
        32'b???????_?????_?????_100_?????_00000_11: begin cmd_type_reg = 3'b001; end  //lbu    , I, R(rd) = Mr(src1 + imm, 1));
        32'b???????_?????_?????_000_?????_01000_11: begin cmd_type_reg = 3'b010; end  //sb     , S, Mw(src1 + imm, 1, src2));   // store byte
  
        /* Integer Register-Register Operations */
        32'b0000000_?????_?????_000_?????_01100_11: begin cmd_type_reg = 3'b000; end  //add    , R, R(rd) = src1 + src2);
        32'b0100000_?????_?????_000_?????_01100_11: begin cmd_type_reg = 3'b000; end  //sub    , R, R(rd) = src1 - src2);
        32'b0000000_?????_?????_100_?????_01100_11: begin cmd_type_reg = 3'b000; end  //xor    , R, R(rd) = src1 ^ src2);
        32'b0000000_?????_?????_110_?????_01100_11: begin cmd_type_reg = 3'b000; end  //or     , R, R(rd) = src1 | src2);
        32'b0000000_?????_?????_111_?????_01100_11: begin cmd_type_reg = 3'b000; end  //and    , R, R(rd) = src1 & src2);
        32'b0000000_?????_?????_001_?????_01100_11: begin cmd_type_reg = 3'b000; end  //sll    , R, R(rd) = src1 << src2);
        32'b0000000_?????_?????_101_?????_01100_11: begin cmd_type_reg = 3'b000; end  //srl    , R, R(rd) = src1 >> src2);
        32'b0100000_?????_?????_101_?????_01100_11: begin cmd_type_reg = 3'b000; end  //sra    , R, int32_t t = src1; R(rd) = t >> src2);
        32'b0000000_?????_?????_010_?????_01100_11: begin cmd_type_reg = 3'b000; end  //slt    , R, R(rd) = ((int32_t)src1 < (int32_t)src2) ? 1 : 0);
        32'b0000000_?????_?????_011_?????_01100_11: begin cmd_type_reg = 3'b000; end  //sltu   , R, R(rd) = (src1 < src2) ? 1 : 0);

        /* Integer Register-Immediate Instructions */
        32'b???????_?????_?????_000_?????_00100_11: begin cmd_type_reg = 3'b110; end  //addi   , I, R(rd) = src1 + imm);
        32'b???????_?????_?????_011_?????_00100_11: begin cmd_type_reg = 3'b001; end  //slti   , I, R(rd) = ((int32_t)src1 < (int32_t)imm) ? 1 : 0);
        32'b0000000_?????_?????_011_?????_00100_11: begin cmd_type_reg = 3'b001; end  //sltiu  , I, R(rd) = (src1 < imm) ? 1 : 0);
        32'b???????_?????_?????_111_?????_00100_11: begin cmd_type_reg = 3'b001; end  //andi   , I, R(rd) = src1 & imm);
        32'b???????_?????_?????_100_?????_00100_11: begin cmd_type_reg = 3'b001; end  //xori   , I, R(rd) = src1 ^ imm);
        32'b0000000_?????_?????_001_?????_00100_11: begin cmd_type_reg = 3'b001; end  //slli   , I, R(rd) = src1 << imm);
        32'b0000000_?????_?????_101_?????_00100_11: begin cmd_type_reg = 3'b001; end  //srli   , I, R(rd) = src1 >> imm);
        32'b0100000_?????_?????_101_?????_00100_11: begin cmd_type_reg = 3'b001; end  //srai   , I, int32_t t = src1; R(rd) = t >> BITS(imm, 4, 0));

        /* Load and Store Instructions */
        32'b???????_?????_?????_010_?????_01000_11: begin cmd_type_reg = 3'b010; end  //sw     , S, Mw(src1 + imm, 4, src2));   // store word
        32'b???????_?????_?????_010_?????_00000_11: begin cmd_type_reg = 3'b001; end  //lw     , I, R(rd) = SEXT(Mr(src1 + imm, 4), 32));
        32'b???????_?????_?????_110_?????_00000_11: begin cmd_type_reg = 3'b001; end  //lwu    , I, R(rd) = Mr(src1 + imm, 4));
        32'b???????_?????_?????_001_?????_00000_11: begin cmd_type_reg = 3'b001; end  //lh     , I, int16_t t = Mr(src1 + imm, 2); R(rd) = SEXT(t, 32));
        32'b???????_?????_?????_101_?????_00000_11: begin cmd_type_reg = 3'b001; end  //lhu    , I, R(rd) = Mr(src1 + imm, 2));
        32'b???????_?????_?????_001_?????_01000_11: begin cmd_type_reg = 3'b010; end  //sh     , S, Mw(src1 + imm, 2, src2));
        32'b???????_?????_?????_???_?????_01101_11: begin cmd_type_reg = 3'b100; end  //lui    , U, R(rd) = imm);

        /* Unconditional Jumps */
        32'b???????_?????_?????_???_?????_11011_11: begin cmd_type_reg = 3'b101; end  //jal    , J, Jal());
        32'b???????_?????_?????_000_?????_11001_11: begin cmd_type_reg = 3'b001; end  //jalr   , I, Jalr());

        /* Conditional Branches */
        32'b???????_?????_?????_001_?????_11000_11: begin cmd_type_reg = 3'b011; end  //bne    , B, Bne());
        32'b???????_?????_?????_000_?????_11000_11: begin cmd_type_reg = 3'b011; end  //beq    , B, Beq());
        32'b???????_?????_?????_101_?????_11000_11: begin cmd_type_reg = 3'b011; end  //bge    , B, Bge());
        32'b???????_?????_?????_111_?????_11000_11: begin cmd_type_reg = 3'b011; end  //bgeu   , B, Bgeu());
        32'b???????_?????_?????_100_?????_11000_11: begin cmd_type_reg = 3'b011; end  //blt    , B, Blt());
        32'b???????_?????_?????_110_?????_11000_11: begin cmd_type_reg = 3'b011; end  //bltu   , B, Bltu());

        /* RV32M */
        32'b0000001_?????_?????_000_?????_01100_11: begin cmd_type_reg = 3'b000; end  //mul    , R, Mul());
        32'b0000001_?????_?????_001_?????_01100_11: begin cmd_type_reg = 3'b000; end  //mulh   , R, Mulh());
        32'b0000001_?????_?????_100_?????_01100_11: begin cmd_type_reg = 3'b000; end  //div    , R, Div());
        32'b0000001_?????_?????_101_?????_01100_11: begin cmd_type_reg = 3'b000; end  //divu   , R, R(rd) = src1 / src2);
        32'b0000001_?????_?????_110_?????_01100_11: begin cmd_type_reg = 3'b000; end  //rem    , R, Rem());
        32'b0000001_?????_?????_111_?????_01100_11: begin cmd_type_reg = 3'b000; end  //remu   , R, R(rd) = src1 % src2);

        32'b0000000_00001_00000_000_00000_11100_11: begin cmd_type_reg = 3'b111; end  //ebreak , N, NEMUTRAP(s->pc, R(10))); // R(10) is $a0
        32'b???????_?????_?????_???_?????_?????_??: begin cmd_type_reg = 3'b000; end  //inv    , N, INV(s->pc));
        default: o_axi_valid_type_reg = 0;
    endcase
end
always @(posedge clk) begin
    if(!rst_n)  o_axi_valid_type_reg <= 1'b0;
    else        o_axi_valid_type_reg <= o_axi_valid_type & (o_axi_valid_data & !i_axi_ready_exu) 
    | (!o_axi_valid_type) & (i_axi_valid_ifu & o_axi_ready_ifu);
end

// data signal
assign o_axi_data_src0  = i_reg_data[0];
assign o_axi_data_src1  = i_reg_data[1];
assign o_axi_data_dest  = i_reg_data[2];
wire[BIT_WIDTH-1:0] imm_data_R;
wire[BIT_WIDTH-1:0] imm_data_I;
wire[BIT_WIDTH-1:0] imm_data_S;
wire[BIT_WIDTH-1:0] imm_data_B;
wire[BIT_WIDTH-1:0] imm_data_U;
wire[BIT_WIDTH-1:0] imm_data_J;
assign imm_data_R   = 32'd0;
assign imm_data_I   = {20'd0, axi_data_cmd[31:20]};
assign imm_data_S   = {20'd0, axi_data_cmd[31:25], axi_data_cmd[11:7]};
assign imm_data_B   = {19'd0, axi_data_cmd[31], axi_data_cmd[7], axi_data_cmd[30:25], axi_data_cmd[11:8], 1'b0};
assign imm_data_U   = {12'd0, axi_data_cmd[31:12]};
assign imm_data_J   = {11'd0, axi_data_cmd[31], axi_data_cmd[19:12], axi_data_cmd[20], axi_data_cmd[30:21], 1'b0};
// Imm data mux
mux #(8, 3, 32, 1) imm_data_mux6to1(
    .out(o_axi_data_imm),
    .key(cmd_type_reg),
    .default_out(32'd0),
    .lut({ 3'b111, 32'd0, 3'b110, imm_data_I, 3'b101, imm_data_J, 3'b100, imm_data_U, 
    3'b011, imm_data_B, 3'b010, imm_data_S, 
    3'b001, imm_data_I, 3'b000, imm_data_R})
);
assign o_axi_valid_data = o_axi_valid_type_reg;


// IDU to riscv32_base_reg port
assign o_reg_index = {o_axi_data_src1index, o_axi_data_src0index, o_axi_data_destindex};
endmodule
