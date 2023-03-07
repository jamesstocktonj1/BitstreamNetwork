


module relu(input logic x, clk, n_rst,
            output logic y);

parameter SEED = 4'b0010;

logic b, c;
logic [3:0] lfsr;


locallfsr half_gen(
    .clk(clk),
    .n_rst(n_rst),
    .y(b)
);

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        y <= 1'b0;
        c <= 1'b0;
    end
    else begin
        y <= ~(x ^ (b | c));
        c <= x & (b | c);
    end
end

endmodule



module locallfsr(input logic clk, n_rst,
                 output logic y);

parameter SEED = 4'b0010;

logic [3:0] lfsr;

assign y = (lfsr < 9);

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= SEED;
    else
        lfsr <= {lfsr[1] ^ lfsr[2], lfsr[3:1]};
end

endmodule