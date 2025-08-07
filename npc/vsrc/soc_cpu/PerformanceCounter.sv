module PerformanceCounter(
	input valid,
	input [31:0] counterType,
	input [31:0] data
);

import "DPI-C" function void performence_cnt_record(input int cnttype, input int data);
always @(posedge valid) begin
	performence_cnt_record(counterType, data);
end
endmodule
    