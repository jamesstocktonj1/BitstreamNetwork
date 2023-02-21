


module generator(output logic y,
                 input int x,
                 input logic clk, n_rst);

parameter SEED = 0'b11010;
parameter LENGTH = 8;


logic [LENGTH-1:0] lfsr;

assign y = (lfsr < x);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= SEED;
    else
        lfsr <= {lfsr[0] ^ lfsr[2] ^ lfsr[5] ^ lfsr[6], lfsr[LENGTH-1:1]};
end

endmodule