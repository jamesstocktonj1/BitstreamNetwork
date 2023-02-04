


module exp(output logic y,
           input logic clk, n_rst, x, a2, a3, a4, a5);


reg [4:0] buffer_x;
reg [4:0] buffer_z;

assign y = buffer_z[4];

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        buffer_x <= 5'b0;
    else
        buffer_x <= {x, buffer_x[4:1]};
end

always_comb
    buffer_z = ~({1'b1, a2, a3, a4, a5} & {buffer_z[3:0], 1'b1} & buffer_x);

endmodule