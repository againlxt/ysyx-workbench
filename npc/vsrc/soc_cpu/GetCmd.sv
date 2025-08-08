module GetCmd(
  input [31:0] cmd
);
import "DPI-C" function void sim_exit();
always @(cmd) begin
    if(cmd==32'h00100073)   sim_exit();
end
export "DPI-C" function getCommond;
function bit [31:0] getCommond;
	return cmd;
endfunction
endmodule
	