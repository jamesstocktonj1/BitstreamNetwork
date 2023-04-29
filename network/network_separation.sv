


module network #(parameter INPUT_SIZE = 2, OUTPUT_SIZE = 1, SEED = 25)
            (output int network_output [0:OUTPUT_SIZE-1],
             input int network_input [0:INPUT_SIZE-1],
             input logic clk, n_rst, compute);

parameter layer12_size = 4;

logic [INPUT_SIZE-1:0] network_bitstream_input;
logic [OUTPUT_SIZE-1:0] network_bitstream_output;
logic [layer12_size-1:0] layer12_connect;


// Weights 1
int w1 [0:layer12_size-1][0:INPUT_SIZE-1] = '{
    '{  0, 170},
    '{145,  85},
    '{ 43, 255},
    '{ 65, 236}
};
// Bias 1
int b1 [0:layer12_size-1] = '{
    157,
    105,
    44,
    0
};

// Weights 2
int w2 [0:OUTPUT_SIZE-1][0:layer12_size-1] = '{
    '{  0, 208,  54, 153}
};
// Bias 2
int b2 [0:OUTPUT_SIZE-1] = '{
    140
};

generate
    genvar i;
    for(i=0; i<INPUT_SIZE; i++) begin : generator_block
        generator16 #(.SEED(SEED + (i * 235))) bitstream_gen (
            .clk(clk),
            .n_rst(n_rst),
            .x(network_input[i]),
            .y(network_bitstream_input[i])
        );
    end
endgenerate


layer #(.INPUT_SIZE(INPUT_SIZE), .NEURON_COUNT(layer12_size), .SEED(SEED)) layer1 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights(w1),
    .layer_bias(b1),
    .layer_input(network_bitstream_input),
    .layer_output(layer12_connect)
);

layer #(.INPUT_SIZE(layer12_size), .NEURON_COUNT(OUTPUT_SIZE), .SEED(SEED + (layer12_size * OUTPUT_SIZE * 2))) layer2 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights(w2),
    .layer_bias(b2),
    .layer_input(layer12_connect),
    .layer_output(network_bitstream_output)
);


generate
    genvar j;
    for(j=0; j<OUTPUT_SIZE; j++) begin : integrator_block
        integrator bitstream_int(
            .clk(clk),
            .n_rst(n_rst),
            .capture(compute),
            .x(network_bitstream_output[j]),
            .y(network_output[j])
        );
    end
endgenerate

endmodule