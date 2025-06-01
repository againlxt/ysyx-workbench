`timescale 1ns/1ns
/**********************************RAM************************************/
module dual_port_RAM #(parameter DEPTH = 16,
                       parameter WIDTH = 8)(
     input wclk
    ,input wenc
    ,input [$clog2(DEPTH)-1:0] waddr  //深度对2取对数，得到地址的位宽。
    ,input [WIDTH-1:0] wdata        //数据写入
    ,input rclk
    ,input renc
    ,input [$clog2(DEPTH)-1:0] raddr  //深度对2取对数，得到地址的位宽。
    ,output reg [WIDTH-1:0] rdata       //数据输出
);
 
reg [WIDTH-1:0] RAM_MEM [0:DEPTH-1];
 
always @(posedge wclk) begin
    if(wenc)
        RAM_MEM[waddr] <= wdata;
end
 
always @(posedge rclk) begin
    if(renc)
        rdata <= RAM_MEM[raddr];
end
 
endmodule 
 
/**********************************SFIFO************************************/
module sfifo#(
    parameter   WIDTH = 8,
    parameter   DEPTH = 16
)(
    input                   clk     ,
    input                   rst_n   ,
    input                   winc    ,
    input                   rinc    ,
    input       [WIDTH-1:0] wdata   ,
 
    output reg              wfull   ,
    output reg              rempty  ,
    output wire [WIDTH-1:0] rdata
);
 
localparam COUNTER_WIDTH = (DEPTH == 0) ? 1 : $clog2(DEPTH + 1);
reg [COUNTER_WIDTH-1 : 0] waddr_r;
reg [COUNTER_WIDTH-1 : 0] raddr_r;
reg [COUNTER_WIDTH-1 : 0] counter_r;
wire ren;
wire wen;
assign ren = rinc & (!rempty);
assign wen = winc & (!wfull);
 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) waddr_r <= 0;
    else begin
        if (wen) begin
            waddr_r <= waddr_r + 1;
        end else begin
            waddr_r <= waddr_r;
        end
    end
end
 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) raddr_r <= 0;
    else begin
        if (ren) begin
            raddr_r <= raddr_r + 1;
        end else begin
            raddr_r <= raddr_r;
        end
    end
end
 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) counter_r <= 0;
    else begin
        if (wen & (!ren)) begin
            counter_r <= counter_r + 1;
        end else if (ren & (!wen)) begin
            counter_r <= counter_r - 1;
        end else begin
            counter_r <= counter_r;
        end
    end
end
 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rempty  <= 1'b0;
    end else begin
        if (counter_r == 0)
            rempty <= 1'b1;
        else                                                       
            rempty <= 1'b0;
    end
end
 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        wfull   <= 1'b0;
    end else begin
        if (counter_r == DEPTH)
            wfull <= 1'b1;
        else
            wfull <= 1'b0;
    end
end
 
dual_port_RAM #(DEPTH, WIDTH) ram (
    .wclk(clk),
    .wenc(wen),
    .waddr(waddr_r),
    .wdata(wdata),
    .rclk(clk),
    .renc(ren),
    .raddr(raddr_r),
    .rdata(rdata)
);
 
endmodule