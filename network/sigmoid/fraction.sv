


module fraction(output logic y,
                   input logic j, k, clk, n_rst);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) 
        y <= 1'b0;
    else
        case ({j, k})
            2'b00: y <= y;
            2'b01: y <= 1'b0;
            2'b10: y <= 1'b1;
            2'b11: y <= ~y;
        endcase
end

endmodule