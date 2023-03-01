


module network #(INPUT_SIZE = 2, OUTPUT_SIZE = 1, SEED = 0'b1101010)
            (output int network_output [0:OUTPUT_SIZE-1],
             input int network_input [0:INPUT_SIZE-1],
             input logic clk, n_rst, compute);

parameter layer12_size = 2;

// const int layer12_size = 2;
logic [INPUT_SIZE-1:0] network_bitstream_input;
logic [OUTPUT_SIZE-1:0] network_bitstream_output;
logic [layer12_size-1:0] layer12_connect;


// layer 1 neuron 1
int w11 [0:INPUT_SIZE-1] = {
    172,
    130
};

// layer 1 neuron 2
int w12 [0:INPUT_SIZE-1] = {
    118,
    100
};

// layer 2 neuron
int w2 [0:layer12_size-1] = {
    144,
    111
};

generate
    genvar i;
    for(i=0; i<INPUT_SIZE; i++)
        generator #(.SEED(0'b0101001010 + i)) bitstream_gen(
            .clk(clk),
            .n_rst(n_rst),
            .x(network_input[i]),
            .y(network_bitstream_input[i])
        );
endgenerate


layer #(.INPUT_SIZE(INPUT_SIZE), .NEURON_COUNT(layer12_size), .SEED(SEED)) layer1 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights({w11, w12}),
    .layer_input(network_bitstream_input),
    .layer_output(layer12_connect)
);

layer #(.INPUT_SIZE(layer12_size), .NEURON_COUNT(OUTPUT_SIZE), .SEED(SEED + (layer12_size * OUTPUT_SIZE))) layer2 (
    .clk(clk),
    .n_rst(n_rst),
    .layer_weights({w2}),
    .layer_input(layer12_connect),
    .layer_output(network_bitstream_output)
);


generate
    genvar j;
    for(j=0; j<OUTPUT_SIZE; j++)
        integrator bitstream_int(
            .clk(clk),
            .n_rst(n_rst),
            .capture(compute),
            .x(network_bitstream_output[j]),
            .y(network_output[j])
        );
endgenerate

endmodule