module riscv32_base_reg #(
    BITS_WIDTH = 32
) (
    input   clk,
    input   rst,

    input [BITS_WIDTH-1:0]  wen       ,
    input [BITS_WIDTH-1:0]  i_reg_data,

    output[BITS_WIDTH-1:0]  o_reg_data  [BITS_WIDTH-1:0]
);

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : base_reg_array
        Reg #(BITS_WIDTH, 32'd0) base_reg (
            .clk    (clk),
            .rst    (rst),
            .wen    (wen[i]),
            .din    (i_reg_data),
            .dout   (o_reg_data[i])
        );
    end
endgenerate

endmodule
