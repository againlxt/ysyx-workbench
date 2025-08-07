module WBUEnd(
  input handshake
);

export "DPI-C" function wbuEnd;
function bit wbuEnd;
	return handshake;
endfunction
endmodule
	