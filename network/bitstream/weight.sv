


module weight #(WEIGHT_LEN = 16, OFFSET = 0)(output logic y,
              input logic [WEIGHT_LEN-1:0] weight_value,
              input logic clk, n_rst);


int i = OFFSET;

assign y = weight_value[i];

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        i <= OFFSET;
    else
        i <= (i + 1) % WEIGHT_LEN;
end

endmodule