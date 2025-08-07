module AXIAccessFault(
   input valid,
   input ready,
	input [1:0] resp
);
import "DPI-C" function void axi_access_fault(input byte resp);
always@(*) begin 
   if(resp != 0 || resp != 1 && (valid && ready)) axi_access_fault({6'd0, resp});
end

endmodule
	