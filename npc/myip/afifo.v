`timescale 1ns/1ns

/***************************************RAM*****************************************/
module dual_port_RAM #(parameter DEPTH = 16,
                       parameter WIDTH = 8)(
     input wclk
    ,input wenc
    ,input [$clog2(DEPTH)-1:0] waddr  //深度对2取对数，得到地址的位宽。
    ,input [WIDTH-1:0] wdata          //数据写入
    ,input rclk
    ,input renc
    ,input [$clog2(DEPTH)-1:0] raddr  //深度对2取对数，得到地址的位宽。
    ,output reg [WIDTH-1:0] rdata         //数据输出
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

/***************************************cnt_bin***************************************/
module cnt_bin #(parameter W=5)
    (input clk,
     input rst_n,
     input en,
     output reg [5-1:0] count
    );
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            count <= 0;
        else if(en)
            count <= count + 1;
        else
            count <= count;
    end
endmodule

/***************************************AFIFO*****************************************/
module asyn_fifo#(
    parameter    WIDTH = 8,
    parameter     DEPTH = 16
)(
    input                     wclk    , 
    input                     rclk    ,   
    input                     wrstn    ,
    input                    rrstn    ,
    input                     winc    ,
    input                      rinc    ,
    input         [WIDTH-1:0]    wdata    ,

    output wire                wfull    ,
    output wire                rempty    ,
    output wire [WIDTH-1:0]    rdata
);
    parameter ADDR_WIDTH = $clog2(DEPTH);
    
    
    wire [ADDR_WIDTH-1:0] wr_bin, rd_bin; //二进制写/读指针
    wire wover_flag,rover_flag; //额外位区分空、满
    
    //写指针计数器，二进制
    cnt_bin #(.W(ADDR_WIDTH+1))
    push_count(
     .clk(wclk),
     .rst_n(wrstn),
     .en(winc & (~wfull)),
     .count({wover_flag,wr_bin})
    );
    
     //读指针计数器，二进制
    cnt_bin #(.W(ADDR_WIDTH+1))
    pop_count(
     .clk(rclk),
     .rst_n(rrstn),
     .en(rinc & (~rempty)),
     .count({rover_flag,rd_bin})
    );
    
    //将二进制转换成格雷码, 产生格雷码写/读指针（跨时钟传输指针，不要用二进制指针，容易产生亚稳态）
    wire [ADDR_WIDTH:0] wr_grey, rd_grey;
    reg [ADDR_WIDTH:0] wptr,rptr;
    assign wr_grey = ({wover_flag,wr_bin}>>1) ^ ({wover_flag,wr_bin});
    assign rd_grey = ({rover_flag,rd_bin}>>1) ^ ({rover_flag,rd_bin});
    
    always @(posedge wclk or negedge wrstn)begin //wr_grey是组合逻辑，要先在本时钟域内(wclk)作同步;不要直接把wr_grey敲两级DFF同步到rclk，否则可能会传输毛刺
        if(~wrstn)
            wptr <= 0;
        else
            wptr <= wr_grey;
    end
    always @(posedge rclk or negedge rrstn)begin //同/wr_grey
        if(~rrstn)
            rptr <= 0;
        else
            rptr <= rd_grey;
    end
    
    //将读指针同步到写时钟域
    reg [ADDR_WIDTH:0] rd_grey_sync1,rd_grey_sync2;
    always @(posedge wclk or negedge wrstn)begin
        if(~wrstn) begin
            rd_grey_sync1 <= 0;
            rd_grey_sync2 <= 0;
        end
        else begin
             rd_grey_sync1 <= rptr;
             rd_grey_sync2 <= rd_grey_sync1;
        end
    end
    
    //写满判断（格雷码指针比较方法）
    wire   wr_grey_2nd_msb,rd_grey_2nd_msb;
    assign wr_grey_2nd_msb = wptr[$clog2(DEPTH)] ^ wptr[$clog2(DEPTH)-1];
    assign rd_grey_2nd_msb = rd_grey_sync2[$clog2(DEPTH)] ^ rd_grey_sync2[$clog2(DEPTH)-1];
    
    //always @(posedge wclk or negedge wrstn)begin:fifo_full_gen
    assign wfull = (wptr[$clog2(DEPTH)] != rd_grey_sync2[$clog2(DEPTH)]) &&
                   (wr_grey_2nd_msb == rd_grey_2nd_msb) &&
                   (wptr[$clog2(DEPTH)-2:0] == rd_grey_sync2[$clog2(DEPTH)-2:0]);
    
    
    //将写指针同步到读时钟域
    reg [ADDR_WIDTH:0] wr_grey_sync1,wr_grey_sync2;
    always @(posedge rclk or negedge rrstn)begin
        if(~rrstn)begin
            wr_grey_sync1 <= 0;
            wr_grey_sync2 <= 0;
        end
        else begin
            wr_grey_sync1 <= wptr;
            wr_grey_sync2 <= wr_grey_sync1;
        end
    end
    
    //读空判断
    assign rempty = (rptr == wr_grey_sync2);
    
    
    //例化RAM
    dual_port_RAM #(.DEPTH(16),.WIDTH(8))
    u_ram
    (
    .wclk(wclk),
    .wenc(winc && (~wfull)),
    .waddr(wr_bin),  //深度对2取对数，得到地址的位宽。
    .wdata(wdata),   //数据写入
    .rclk(rclk),
    .renc(rinc && (~rempty)),
    .raddr(rd_bin),  //深度对2取对数，得到地址的位宽。
    .rdata(rdata)    //数据输出
    );
endmodule
