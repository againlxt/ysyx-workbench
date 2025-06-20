module Riscv32BaseReg_STA (
    input clock,
    input reset,
    input [3:0] io_idu2BaseReg_rs1Index,
    input [3:0] io_idu2BaseReg_rs2Index,
    input [3:0] io_wbu2BaseReg_rdIndex,
    input [31:0] io_wbu2BaseReg_data,
    input        io_wbu2BaseReg_regWR,
    output [31:0] io_idu2BaseReg_rs1Data,
    output [31:0] io_idu2BaseReg_rs2Data
);

    reg [3:0] rs1Index, rs2Index, rdIndex;
    reg [31:0] wbuData;
    reg wbuRegWR;
    wire [31:0] rs1Data, rs2Data;

    always @(posedge clock or posedge reset) begin
        rs1Index <= reset ? 4'd0 : io_idu2BaseReg_rs1Index;
        rs2Index <= reset ? 4'd0 : io_idu2BaseReg_rs2Index;
        rdIndex  <= reset ? 4'd0 : io_wbu2BaseReg_rdIndex;
        wbuData  <= reset ? 32'd0 : io_wbu2BaseReg_data;
        wbuRegWR <= reset ? 1'b0  : io_wbu2BaseReg_regWR;
    end

    Riscv32BaseReg base_reg (
        .clock(clock),
        .reset(reset),
        .io_idu2BaseReg_rs1Data(rs1Data),
        .io_idu2BaseReg_rs2Data(rs2Data),
        .io_idu2BaseReg_rs1Index(rs1Index),
        .io_idu2BaseReg_rs2Index(rs2Index),
        .io_wbu2BaseReg_rdIndex(rdIndex),
        .io_wbu2BaseReg_data(wbuData),
        .io_wbu2BaseReg_regWR(wbuRegWR)
    );

    assign io_idu2BaseReg_rs1Data = rs1Data;
    assign io_idu2BaseReg_rs2Data = rs2Data;

endmodule
