


module network #(parameter INPUT_SIZE = 4, OUTPUT_SIZE = 3, SEED = 25)
            (output int network_output [0:OUTPUT_SIZE-1],
             input int network_input [0:INPUT_SIZE-1],
             input logic clk, n_rst, compute);

parameter layer12_size = 5;
parameter layer23_size = 5;

logic [INPUT_SIZE-1:0] network_bitstream_input;
logic [OUTPUT_SIZE-1:0] network_bitstream_output;
logic [layer12_size-1:0] layer12_connect;
logic [layer23_size-1:0] layer23_connect;


// Weights 1
int w1 [0:layer12_size-1][0:INPUT_SIZE-1] = '{
    '{  0,  99, 250, 250},
    '{235,   0, 250,  83},
    '{230, 128, 249, 140},
    '{ 28,  85, 113,  87},
    '{ 44,  72, 205, 121}
};
// Bias 1
int b1 [0:layer12_size-1] = '{
    60,
    36,
    103,
    238,
    238
};

// Weights 2
int w2 [0:layer23_size-1][0:layer12_size-1] = '{
    '{252,  93, 227,  55, 155},
    '{ 45,  10,  29,  63,   0},
    '{110,   0, 222, 256, 256},
    '{ 54, 169, 238, 150, 119},
    '{247, 136,  60,  13,   1}
};
// Bias 2
int b2 [0:layer23_size-1] = '{
    0,
    22,
    68,
    52,
    0
};

// Weights 3
int w3 [0:OUTPUT_SIZE-1][0:layer23_size-1] = '{
    '{  1,   0,  19,   1,   0},
    '{ 53,  68,   3,   4, 113},
    '{  1,  46,   1,   1, 164}
};
// Bias 3
int b3 [0:OUTPUT_SIZE-1] = '{
    35,
    3,
    1
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


layer #(.INPUT_SIZE(INPUT_SIZE), .NEURON_COUNT(layer12_size), .SEED(SEED+420)) layer1 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights(w1),
    .layer_bias(b1),
    .layer_input(network_bitstream_input),
    .layer_output(layer12_connect)
);

layer #(.INPUT_SIZE(layer12_size), .NEURON_COUNT(layer23_size), .SEED(SEED + (layer12_size * OUTPUT_SIZE * 120))) layer2 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights(w2),
    .layer_bias(b2),
    .layer_input(layer12_connect),
    .layer_output(layer23_connect)
);

layer_nac #(.INPUT_SIZE(layer23_size), .NEURON_COUNT(OUTPUT_SIZE), .SEED(SEED + (layer12_size * OUTPUT_SIZE * 32) + (layer23_size * OUTPUT_SIZE * 82))) layer3 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights(w3),
    .layer_bias(b3),
    .layer_input(layer23_connect),
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