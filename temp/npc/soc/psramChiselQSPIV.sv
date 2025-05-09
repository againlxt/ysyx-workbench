module psramChiselQSPIV (
	input 			sck, 
	input 			reset,
	input [3:0] 	din,
	output [3:0] 	dout,
	output 			out_en
);

parameter S_IDLE = 6'b000001, S_CMD = 6'b000010, S_QCMD = 6'b000100,
 S_ADDR = 6'b001000, S_WRITE = 6'b010000, S_READ = 6'b100000;

reg [5:0] 	stateReg;
reg [5:0]	prestateReg;
reg [4:0] 	countReg;
reg [7:0]	cmdReg;
reg [23:0]	addrReg;
reg [31:0] 	wdataReg;
reg [31:0] 	rdataReg;
reg [3:0] 	odataReg;
reg  		qpiFlagReg;

always @(posedge sck) begin
	prestateReg <= stateReg;
end

always @(posedge sck or posedge reset) begin
	if (reset) begin
		stateReg 	<= S_IDLE;
		qpiFlagReg 	<= qpiFlagReg;
	end 
	else begin
		case (stateReg)
			S_IDLE:
				if (!reset & (qpiFlagReg == 1'b1)) begin
					stateReg 	<= S_QCMD;
					qpiFlagReg 	<= qpiFlagReg;
				end else if (!reset) begin
					stateReg 	<= S_CMD;
					qpiFlagReg 	<= qpiFlagReg;
				end else begin
					stateReg 	<= stateReg;
					qpiFlagReg 	<= qpiFlagReg;
				end
			S_CMD:
				if (countReg == 5'd7) begin
					stateReg 	<= S_ADDR;
					qpiFlagReg 	<= qpiFlagReg;
				end else begin
					stateReg 	<= stateReg;
					qpiFlagReg 	<= qpiFlagReg;
				end
			S_QCMD: begin
				stateReg 	<= S_ADDR;
				qpiFlagReg 	<= qpiFlagReg;
			end
			S_ADDR:
				if (cmdReg == 8'h35) begin
					qpiFlagReg 	<= 1'd1;
					qpiFlagReg 	<= qpiFlagReg;
				end else if ((countReg == 5'd13) & (cmdReg == 8'h38)) begin
					stateReg 	<= S_WRITE;
					qpiFlagReg 	<= qpiFlagReg;
				end else if (countReg == 5'd13) begin
					stateReg 	<= S_READ;
					qpiFlagReg 	<= qpiFlagReg;
				end else begin
					stateReg 	<= stateReg;
					qpiFlagReg 	<= qpiFlagReg;
				end
			S_WRITE:
				if (reset) begin
					stateReg 	<= S_IDLE;
					qpiFlagReg 	<= qpiFlagReg;
				end else begin
					stateReg 	<= stateReg;
					qpiFlagReg 	<= qpiFlagReg;
				end
			S_READ:
				if (reset) begin
					stateReg 	<= S_IDLE;
					qpiFlagReg 	<= qpiFlagReg;
				end else begin
					stateReg 	<= stateReg;
					qpiFlagReg 	<= qpiFlagReg;
				end
			default: begin
				stateReg 	<= stateReg;
				qpiFlagReg 	<= qpiFlagReg;
			end
		endcase
	end
end

import "DPI-C" function void psram_read(input int addr, output int data);
import "DPI-C" function void psram_write(input int addr, input byte len, input int data);
always @(posedge sck or posedge reset) begin
	if (reset & (prestateReg == S_WRITE)) begin
		psram_write({8'd0, addrReg}, {3'd0, ((countReg - 5'd13) >> 1)}, wdataReg);
		countReg 	<= 5'd0;
		cmdReg 		<= 8'd0;
		addrReg 	<= 24'd0;
		wdataReg	<= 32'd0;
		rdataReg 	= 32'd0;
	end else if(reset) begin
		countReg 	<= 5'd0;
		cmdReg 		<= 8'd0;
		addrReg 	<= 24'd0;
		wdataReg	<= 32'd0;
		rdataReg 	= 32'd0;
	end else begin
		case (stateReg)
			S_IDLE: begin
				countReg 	<= countReg + 1'b1;
				if (!reset & (qpiFlagReg == 1'b1)) begin
					cmdReg 		<= {din, 4'd0};
					addrReg 	<= 24'd0;
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;
				end else if (!reset) begin
					cmdReg 		<= {7'd0, din[0]};
					addrReg 	<= 24'd0;
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;
				end else begin
					cmdReg 		<= 8'd0;
					addrReg 	<= 24'd0;
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;
				end
			end
			S_CMD: begin
				countReg 	<= countReg + 1'b1;
				cmdReg 		<= {cmdReg[6:0], din[0]};
				addrReg 	<= 24'd0;
				wdataReg	<= 32'd0;
				rdataReg 	= 32'd0;
			end
			S_QCMD: begin
				countReg 	<= 5'd8;
				cmdReg 		<= {cmdReg[7:4], din};
				addrReg 	<= 24'd0;
				wdataReg	<= 32'd0;
				rdataReg 	= 32'd0;	
			end
			S_ADDR: begin
				countReg 	<= countReg + 1'b1;
				if ((countReg == 5'd13) & (cmdReg == 8'h38)) begin
					cmdReg 		<= cmdReg;
					addrReg 	<= {addrReg[19:0], din};
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;
				end else if ((countReg == 5'd13) & (cmdReg == 8'hEB)) begin
					cmdReg 		<= cmdReg;
					addrReg 	<= {addrReg[19:0], din};
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;	
				end else if (countReg == 5'd13) begin
					$fwrite(32'h80000002, "Assertion failed: Unsupport command `%xh`, only support `EBh` read command and `38h` write command\n", cmdReg);
					$fatal;
				end
				else begin
					cmdReg 		<= cmdReg;
					addrReg 	<= {addrReg[19:0], din};
					wdataReg	<= 32'd0;
					rdataReg 	= 32'd0;
				end
			end
			S_WRITE: begin
				countReg 	<= countReg + 1'b1;
				cmdReg 		<= cmdReg;
				addrReg 	<= addrReg;
				rdataReg 	= 32'd0;
				case (countReg)
					5'd14: wdataReg <= {24'd0, din, 4'd0};
					5'd15: wdataReg <= {24'd0, wdataReg[7:4], din};
					5'd16: wdataReg <= {16'd0, din, 4'd0, wdataReg[7:0]};
					5'd17: wdataReg <= {16'd0, wdataReg[15:12], din, wdataReg[7:0]};
					5'd18: wdataReg <= {8'd0, din, 4'd0, wdataReg[15:0]};
					5'd19: wdataReg <= {8'd0, wdataReg[23:20], din, wdataReg[15:0]};
					5'd20: wdataReg <= {din, 4'd0, wdataReg[23:0]};
					5'd21: wdataReg <= {wdataReg[31:28], din, wdataReg[23:0]};
					default: wdataReg <= wdataReg;
				endcase	
			end
			S_READ: begin
				countReg 	<= countReg + 1'b1;
				if (countReg == 5'd14) begin
					psram_read({8'd0, addrReg}, rdataReg);
				end else begin
					rdataReg 	= rdataReg;	
				end
				cmdReg 		<= cmdReg;
				addrReg 	<= addrReg;
				wdataReg	<= 32'd0;
			end
			default: begin
				countReg 	<= countReg + 1'b1;
				cmdReg 		<= cmdReg;
				addrReg 	<= addrReg;
				wdataReg	<= wdataReg;
				rdataReg 	= rdataReg;
			end
		endcase
	end
end

always @(negedge sck or posedge reset) begin
	if (reset) begin
		odataReg <= 4'd0;
	end 
	else begin
		case (stateReg)
			S_READ: begin
				case (countReg)
					5'd20: 		odataReg <= rdataReg[7:4];
					5'd21: 		odataReg <= rdataReg[3:0];
					5'd22: 		odataReg <= rdataReg[15:12];
					5'd23: 		odataReg <= rdataReg[11:8];
					5'd24: 		odataReg <= rdataReg[23:20];
					5'd25: 		odataReg <= rdataReg[19:16];
					5'd26: 		odataReg <= rdataReg[31:28];
					5'd27: 		odataReg <= rdataReg[27:24];
					default: 	odataReg <= 4'd0;
				endcase
			end
			default:
				odataReg <= odataReg;
		endcase
	end
end

assign dout 	= odataReg;
assign out_en	= (countReg > 5'd20) & (countReg <= 5'd28);	
endmodule
