module ALU_STA (
    input             clock,
    input             reset,
    input      [3:0]  io_aluCtr,
    input      [31:0] io_srcAData,
    input      [31:0] io_srcBData,
    output reg        io_less,
    output reg        io_zero,
    output reg [31:0] io_aluOut
);

    reg [3:0]  aluCtr;
    reg [31:0] srcAData, srcBData;

    wire less, zero;
    wire [31:0] aluOut;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            aluCtr    <= 4'd0;
            srcAData  <= 32'd0;
            srcBData  <= 32'd0;
        end else begin
            aluCtr    <= io_aluCtr;
            srcAData  <= io_srcAData;
            srcBData  <= io_srcBData;
        end
    end

    ALU alu0 (
        .io_aluCtr(aluCtr),
        .io_srcAData(srcAData),
        .io_srcBData(srcBData),
        .io_less(less),
        .io_zero(zero),
        .io_aluOut(aluOut)
    );

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            io_less    <= 1'b0;
            io_zero    <= 1'b0;
            io_aluOut  <= 32'd0;
        end else begin
            io_less    <= less;
            io_zero    <= zero;
            io_aluOut  <= aluOut;
        end
    end

endmodule
