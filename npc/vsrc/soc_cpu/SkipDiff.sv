module SkipDiff(
	input en
);

import "DPI-C" function void difftest_skip_ref();
always@(en) begin
	if(en) difftest_skip_ref();
end

endmodule
	