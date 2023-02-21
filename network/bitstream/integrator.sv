


module integrator(output int y,
                  input logic x, capture, clk, n_rst);

int count = 0;

always_ff @(posedge clk, negedge n_rst, negedge capture) begin
    if(~n_rst) begin
        y <= 0;
        count <= 0;
    end
    else if(~capture) begin
        y <= count;
        count <= 0;
    end
    else
        if(x)
            count <= count + 1;
end

endmodule