module cpu_single_cycle #(BIT_WIDTH = 32) (
    input sys_clk,
    input reset,

    input[BIT_WIDTH-1:0] i_command,

    output[BIT_WIDTH-1:0] o_pc
);

wire        clk;
wire        rst;
wire        rst_n;

// pc_reg module's wire and reg
wire [BIT_WIDTH-1 : 0]  pc;
wire [BIT_WIDTH-1 : 0]  dnpc;

assign  clk = sys_clk;
assign  rst = reset;
assign  rst_n = ~reset;

pc_reg pc_reg0 #(BIT_WIDTH = BIT_WIDTH) (
    .clk(clk),
    .rst(rst),

    .i_dnpc(dnpc),

    .o_pc(pc)
);

ifu ifu0 #(BIT_WIDTH = BIT_WIDTH) (
    .clk(),
    .reset(),

    .i_cmd(),

    .o_cmd(),
);

idu idu0 #(BIT_WIDTH = BIT_WIDTH) (
    .clk(),
    .rst(),

    .i_cmd(),

    // control signal
    .o_cmd_type(),
    .o_opcode(),
    .o_func7(),
    .o_func3(),

    // data signal
    .o_src_data(),
    .o_dest_data(),
    .o_imm_data()
);

exu exu0 #(BIT_WIDTH = BIT_WIDTH) (
    .clk(),
    .rst(),

    // control signal
    .i_cmd_type(),
    .i_opcode(),
    .i_func7(),
    .i_func3(),

    // data signal
    .i_src_data(),
    .i_dest_data(),
    .i_imm_data()

    .o_dnpc()
);

endmodule