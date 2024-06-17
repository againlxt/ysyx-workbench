module ifu #(BIT_WIDTH = 32) (
    input                       clk,
    input                       rst_n,

    // port for ROM
    input                       i_ren,
    output      [BIT_WIDTH-1:0] o_pc,
    input       [BIT_WIDTH-1:0] i_cmd,

    // port for pc_reg
    input [BIT_WIDTH-1:0]       i_axi_data_pc,
    input                       i_axi_valid,
    output                      o_axi_ready,

    // port for IDU
    output[BIT_WIDTH-1:0]       o_axi_data_cmd,
    output                      o_axi_valid,
    input                       i_axi_ready
);

Reg #(32, 32'h8000_0000) pc_reg (
    .clk(clk),
    .rst(!rst_n),
    .din(i_axi_data_pc),
    .dout(o_pc),
    .wen(i_axi_valid & o_axi_ready)
);

Reg #(1, 1'b1) pc_reg_ready (
    .clk(clk),
    .rst(!rst_n),
    .din(o_axi_ready & !(i_axi_valid & i_ren) | (!o_axi_ready)&(o_axi_valid&i_axi_ready)),
    .dout(o_axi_ready),
    .wen(1'b1)
);

assign o_axi_data_cmd = (i_ren) ? i_cmd : 32'd0;

reg [BIT_WIDTH-1:0] cmd_delay0;
Reg #(32, 32'd0) cmd_delay_reg0 (
    .clk(clk),
    .rst(!rst_n),
    .din(i_cmd),
    .dout(cmd_delay0),
    .wen(1'b1)
); 

Reg #(1, 1'b0) cmd_reg_valid (
    .clk(clk),
    .rst(!rst_n),
    .din((o_axi_valid & (!i_axi_ready)) | ((!o_axi_valid) & (cmd_delay0 != i_cmd))),
    .dout(o_axi_valid),
    .wen(1'b1)
);

endmodule
