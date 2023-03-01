`timescale 1ns / 1ps


module network_control_tb;


logic clk, n_rst;

logic [7:0] control_in;
logic [7:0] control_out;


network_control my_network(
    .clk(clk),
    .n_rst(n_rst), 
    .control_in(control_in),
    .control_out(control_out)
);


initial begin
    clk = 1'b0;
    n_rst = 1'b1;

    #20ps n_rst = 1'b0;
    #20ps n_rst = 1'b1;

    forever #5ps clk = ~clk;
end

initial begin

    control_in = 8'b0;

    #50ps control_in = 8'b00000001;
    #50ps control_in = 8'b00000000;
end

endmodule