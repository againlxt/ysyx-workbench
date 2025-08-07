module GetCurPC(
  input [31:0] pc 
);

export "DPI-C" function get_cur_pc;
function bit [31:0] get_cur_pc;
	return pc;
endfunction
endmodule
	