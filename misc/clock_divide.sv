


module clock_divide(
    input logic clk, n_rst,
    output logic y
);

parameter DIVIDE = 25000000;


int count = 0;

always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        count <= 0;
    else if(count > DIVIDE) begin
        y <= ~y;
        count <= 0;
    else 
        count <= count + 1;
end

endmodule