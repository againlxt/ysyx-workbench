module pc_reg #(BIT_WIDTH = 32) (
    input clk,
    input rst_n,

    // port for EXU
    input [BIT_WIDTH-1:0]   i_axi_data_dnpc,
    input                   i_axi_valid,
    output                  o_axi_ready,

    // port for IFU
    output[BIT_WIDTH-1:0]   o_axi_data_pc,
    output                  o_axi_valid,
    input                   i_axi_ready
);

reg [BIT_WIDTH-1:0] pc;
// reg [BIT_WIDTH-1:0] pre_pc;
reg                 o_axi_valid_reg;
assign o_axi_valid = o_axi_valid_reg;

/*
always @(posedge clk) begin
    if(!rst_n)  pre_pc <= 32'h8000_0000;
    else        pre_pc <= pc;
end
*/

assign o_axi_ready = !o_axi_valid;

assign o_axi_data_pc = pc;

always @(posedge clk) begin
    if(!rst_n)  pc <= 32'h8000_0000;
    else begin
        pc <= (i_axi_valid & o_axi_ready) ? i_axi_data_dnpc : pc;
    end
end

always @(posedge clk) begin
    if(!rst_n)  o_axi_valid_reg <= 1'b1;
    else        o_axi_valid_reg <= o_axi_valid&(!i_axi_ready) | (!o_axi_valid)&(i_axi_valid & o_axi_ready);
end
endmodule
