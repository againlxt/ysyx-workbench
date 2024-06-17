module decoder #( 
    parameter INPUT_WIDTH = 2,
    parameter NUM_OUTPUTS = 4
) (
    input wire [INPUT_WIDTH-1:0] addr_in,
    output [NUM_OUTPUTS-1:0] out
);

    generate
        genvar n;
        for (n = 0; n < NUM_OUTPUTS; n = n + 1) begin
            assign out[n] = (n == addr_in) ? 1'b1 : 1'b0;
        end
    endgenerate

endmodule
