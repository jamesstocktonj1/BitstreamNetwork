


module power(output logic y,
                     input logic x, clk, n_rst);


logic z1;
logic z2;
logic z3;
logic z4;
logic z5;
logic z6;
logic z7;

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        y <= 1'b0;
        z1 <= 1'b0;
        z2 <= 1'b0;
        z3 <= 1'b0;
    end
    else begin
        y <= x & z1 & z2 & z3 & z4 & z5;
        z7 <= z6;
        z6 <= z5;
        z5 <= z4;
        z4 <= z3;
        z3 <= z2;
        z2 <= z1;
        z1 <= x;
    end
end

endmodule