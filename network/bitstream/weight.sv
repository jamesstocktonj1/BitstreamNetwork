


module weight(output logic y,
              input logic clk, n_rst);

parameter OFFSET = 0;
parameter WEIGHT_LEN = 16;
parameter [WEIGHT_LEN-1:0] WEIGHT_VAL = 16'b0000000000000000;


int i = OFFSET;

assign y = WEIGHT_VAL[i];

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        i <= OFFSET;
    else
        i <= (i + 1) % WEIGHT_LEN;
end

endmodule