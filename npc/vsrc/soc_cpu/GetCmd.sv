module GetCmd(
  input [31:0] cmd
);

export "DPI-C" function getCommond;
function bit [31:0] getCommond;
	return cmd;
endfunction
endmodule
	