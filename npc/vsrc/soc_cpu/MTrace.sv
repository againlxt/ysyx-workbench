module MTrace(
	input [31:0] data,
	input [31:0] addr,
	input [1:0] memop,
	input wOrR,
	input enable
);
wire [7:0] memop_w, wOrR_w;
assign memop_w = {6'd0, memop};
assign wOrR_w 	= {7'd0, wOrR};
import "DPI-C" function void MTrace(input int data, input int addr, input byte memop, input byte wOrR);
always @(posedge enable)   MTrace(data, addr, memop_w, wOrR_w);
endmodule
	