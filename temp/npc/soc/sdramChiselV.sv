module sdramChiselV (
	input 			clk,
	input 			cke,
	input 			cs,
	input  			ras,
	input 			cas,
	input 			we,
	input [12:0]	a,
	input [2:0] 	ba,
	input [1:0]		dqm,
	input [15:0] 	din,
	input [7:0]		index,
	output 			outen,
	output[15:0] 	out
);

parameter [3:0] LOAD_MODE=4'b0000, REFREASH=4'b0001, PRECHARGE=4'b0010, TERMINATE=4'b0110,
WRITE=4'b0100, READ=4'b0101, ACTIVE=4'b0011, NOP=4'b0111, INIT=4'b1000;

parameter [3:0] S_IDLE=4'b0001, S_WRITE=4'b0010,
				S_READ0=4'b0100, S_READ1=4'b1000;
reg [3:0] state_r;
reg [3:0] nextstate_r;

wire[3:0] cmd_w;
wire clk_w;
assign cmd_w = {cs, ras, cas, we};
assign clk_w = clk & cke;

reg [7:0] 	counter_r;
reg [2:0]	cas_counter_r;	
reg [12:0] 	mode_r;
reg [12:0]  row_addr_r[0:7];
reg [12:0] 	col_addr_r;
reg [2:0]	bank_addr_r;
reg [15:0]  din_r;
reg [15:0]  dout_r;
reg [1:0]  	dqm_r;
reg outen_r;
wire [7:0] 	burstlength_w;
wire [12:0] row_addr_w;
assign burstlength_w = 8'd1 << mode_r[3:0];

wire [15:0] din_w, ra_w, ca_w;
wire [7:0] 	dqm_w, ba_w;
wire [2:0]  bank_addr_w;
assign bank_addr_w = bank_addr_r;
assign din_w = din_r;
assign ra_w = {3'd0, row_addr_r[bank_addr_w]};
assign ca_w = {7'd0, col_addr_r[8:0]} + {8'd0, counter_r};
assign dqm_w = {6'd0, dqm_r};
assign ba_w = {5'd0, bank_addr_r};

import "DPI-C" function void sdram_read(output shortint dout, input byte dqm, input shortint ra, input shortint ca, input byte ba, input byte index);
import "DPI-C" function void sdram_write(input shortint din, input byte dqm, input shortint ra, input shortint ca, input byte ba, input byte index);
always @(posedge clk) begin
	if (!cke) state_r <= S_IDLE;
	else 	  state_r <= nextstate_r;
end

always @(posedge clk) begin
	if ((state_r == S_WRITE) | (state_r == S_READ1) | (nextstate_r == S_READ1))
		counter_r <= counter_r + 1'd1;
	else
		counter_r <= 8'd0;
end

always @(posedge clk) begin
	if ((state_r == S_READ0) | (nextstate_r == S_READ0))
		cas_counter_r <= cas_counter_r + 1;
	else
		cas_counter_r <= 0;
end

always @(*) begin
 nextstate_r = S_IDLE;
	case (state_r)
		S_IDLE: begin
			case (cmd_w)
				WRITE: 		nextstate_r = S_WRITE;
				READ: 		nextstate_r = S_READ0;
				default:	nextstate_r = S_IDLE;
			endcase
		end
		S_WRITE: begin
			if (counter_r == (burstlength_w-1))
				nextstate_r = S_IDLE;
			else if (cmd_w == WRITE)
				nextstate_r = S_WRITE;
			else if (cmd_w == TERMINATE)
				nextstate_r = S_IDLE;
			else
				nextstate_r = S_WRITE;
		end
		S_READ0: begin
			if (cas_counter_r == (mode_r[6:4]-1))
				nextstate_r = S_READ1;
			else
				nextstate_r = S_READ0;
		end
		S_READ1: begin
			if ((counter_r == burstlength_w-1) | (cmd_w == TERMINATE) | (burstlength_w == 1))
				nextstate_r = S_IDLE;
			else if (cmd_w == READ)
				nextstate_r = S_READ0;
			else
				nextstate_r = S_READ1; 
		end
		default: nextstate_r = S_IDLE;
	endcase
end

always @(posedge clk) begin
	if (cmd_w == LOAD_MODE) mode_r <= a;
	else mode_r <= mode_r;
end

always @(posedge clk) begin
	if (cmd_w == ACTIVE) begin
		row_addr_r[ba]	<= a;
		bank_addr_r <= ba;
	end else if (cmd_w == WRITE) begin
		col_addr_r	<= a;
		bank_addr_r	<= ba;
		din_r 		<= din;
		dqm_r		<= dqm;
	end else if (cmd_w == READ) begin
		col_addr_r	<= a;
		bank_addr_r	<= ba;
	end else if (state_r == S_WRITE) begin
		din_r		<= din;
		dqm_r 		<= dqm;
	end else if (state_r == S_READ1) begin
		
	end else begin
		row_addr_r	<= row_addr_r;
		col_addr_r 	<= col_addr_r;
		bank_addr_r <= bank_addr_r;
		din_r 		<= din_r;
		dqm_r		<= dqm_r;
	end
end

wire [7:0] index_w;
assign index_w = index;
always @(posedge clk) begin
	case (state_r)
		S_WRITE: sdram_write(din_w, dqm_w, ra_w, ca_w, ba_w, index_w);
		S_READ0: sdram_read(dout_r, dqm_w, ra_w, ca_w, ba_w, index_w);
		S_READ1: sdram_read(dout_r, dqm_w, ra_w, ca_w, ba_w, index_w);
		default: dout_r = 16'd0;
	endcase
end

always @(posedge clk) begin
	outen_r <= (state_r == S_READ1) | (nextstate_r == S_READ1);
end

assign outen 	= outen_r;
assign out		= dout_r;

endmodule
