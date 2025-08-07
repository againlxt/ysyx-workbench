module GetNextPC(
  input	[31:0] nextPC
);

export "DPI-C" function get_next_pc;
function bit [31:0] get_next_pc;
	return nextPC;
endfunction
endmodule
	