


module layer #(INPUT_SIZE = 2, OFFSET = 0, WEIGHT_LEN = 16, NEURON_COUNT = 2)
            (output logic [NEURON_COUNT-1:0] layer_output,
             input logic [INPUT_SIZE-1:0] layer_input,
             input logic [WEIGHT_LEN-1:0] layer_weights [NEURON_COUNT-1:0][INPUT_SIZE-1:0],
             input logic clk, n_rst);


generate
    genvar i;
    for(i=0; i<NEURON_COUNT; i++)
        neuron #(.OFFSET(OFFSET), .INPUT_SIZE(INPUT_SIZE), .WEIGHT_LEN(WEIGHT_LEN)) neuron_gen(
            .clk(clk),
            .n_rst(n_rst),
            .weight_values(layer_weights[i]),
            .neuron_input(layer_input),
            .neuron_output(layer_output[i])
        );
endgenerate

endmodule