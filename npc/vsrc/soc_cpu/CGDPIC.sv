module CGDPIC(
	input [31:0] instructionFormat,
	input [31:0] instructionFormatJAL,
	input [31:0] instructionFormatJALR,
	input [31:0] instructionFormatRET
);

import "DPI-C" function void set_ftrace_function_call_flag();
always @(instructionFormat) begin
	if((instructionFormat==instructionFormatJAL || instructionFormat==instructionFormatJALR)) 
		set_ftrace_function_call_flag();
end

import "DPI-C" function void set_ftrace_ret_flag();
always @(instructionFormat) begin
	if(instructionFormat==instructionFormatRET) set_ftrace_ret_flag();
end
endmodule
	