


module generator(output logic y,
                 input int x,
                 input logic clk, n_rst);

parameter SEED = 8'b11010;
parameter LENGTH = 8;


logic [LENGTH-1:0] lfsr;

assign y = (lfsr < x);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= (SEED % 256);
    else
        lfsr <= {lfsr[0] ^ lfsr[2] ^ lfsr[5] ^ lfsr[6], lfsr[LENGTH-1:1]};
end

endmodule


module generator16(output logic y,
                 input int x,
                 input logic clk, n_rst);

parameter SEED = 16'b11010;
parameter LENGTH = 16;


logic [LENGTH-1:0] lfsr;

assign y = (lfsr[15:8] < x);
// assign y = (lfsr[7:0] < x);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= (SEED % 65536);
    else
        lfsr <= {lfsr[0] ^ lfsr[3] ^ lfsr[12] ^ lfsr[14] ^ lfsr[15], lfsr[LENGTH-1:1]};
end

endmodule


module generator_exp(output logic y,
                 input logic clk, n_rst);

parameter SEED = 16'b11010;
parameter LENGTH = 16;
parameter VALUE = 1200;


logic [LENGTH-1:0] lfsr;

assign y = (lfsr < VALUE);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= SEED;
    else
        lfsr <= {lfsr[0] ^ lfsr[3] ^ lfsr[12] ^ lfsr[14] ^ lfsr[15], lfsr[LENGTH-1:1]};
end

endmodule