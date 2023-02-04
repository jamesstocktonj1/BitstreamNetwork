


module integrator(output integer y,
                  input logic x, clk, n_rst);


always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        y <= 0;
    else begin
        if(x)
            y <= y + 1;
    end
end

endmodule