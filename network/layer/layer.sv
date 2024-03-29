


module layer #(INPUT_SIZE = 2, SEED = 0, NEURON_COUNT = 2)
            (output logic [NEURON_COUNT-1:0] layer_output,
             input logic [INPUT_SIZE-1:0] layer_input,
             input int layer_weights [NEURON_COUNT-1:0][INPUT_SIZE-1:0],
             input int layer_bias [NEURON_COUNT-1:0],
             input logic clk, n_rst);


generate
    genvar i;
    for(i=0; i<NEURON_COUNT; i++) begin : neuron_block
        neuron #(.INPUT_SIZE(INPUT_SIZE), .SEED(SEED + (i * NEURON_COUNT * 3))) neuron_gen(
            .clk(clk),
            .n_rst(n_rst),
            .weight_values(layer_weights[i]),
            .bias_value(layer_bias[i]),
            .neuron_input(layer_input),
            .neuron_output(layer_output[i])
        );
    end
endgenerate

endmodule