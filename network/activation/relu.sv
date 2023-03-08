


module relu(input logic x, clk, n_rst,
            output logic y);

parameter SEED = 4'b0010;

logic b, c, z;
logic [3:0] lfsr;


locallfsr half_gen(
    .clk(clk),
    .n_rst(n_rst),
    .y(b)
);
defparam half_gen.SEED = SEED;

localpower pow(
    .clk(clk),
    .n_rst(n_rst),
    .x(z),
    .y(y)
);

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        z <= 1'b0;
        c <= 1'b0;
    end
    else begin
        z <= ~(x ^ (b | c));
        c <= x & (b | c);
    end
end

endmodule



module locallfsr(input logic clk, n_rst,
                 output logic y);

parameter SEED = 4'b0010;

logic [3:0] lfsr;

// set to 9 for ReLU, set to 10 for Leaky ReLU
assign y = (lfsr < 9);

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        lfsr <= SEED;
    else
        lfsr <= {lfsr[0] ^ lfsr[3], lfsr[3:1]};
end

endmodule


module localpower(input logic clk, n_rst, x,
                  output logic y);

logic [4:0] buffer;

assign y = buffer[0] & buffer[1] & buffer[2] & buffer[3] & buffer[4];

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        buffer <= 5'b00000;
    else
        buffer <= {x, buffer[4:1]};
end

endmodule