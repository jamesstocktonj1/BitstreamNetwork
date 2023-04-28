


module neuron_nac #(INPUT_SIZE = 2, SEED = 0)
            (output logic neuron_output,
             input logic [INPUT_SIZE-1:0] neuron_input,
             input int weight_values [INPUT_SIZE-1:0],
             input int bias_value,
             input logic clk, n_rst);

logic [INPUT_SIZE-1:0] neuron_weights;
logic [INPUT_SIZE-1:0] neuron_mult;
logic neuron_bias;
logic neuron_sum;
logic neuron_active;


assign neuron_active = neuron_sum;

generator16 #(.SEED(SEED+1)) bias_gen(
    .clk(clk),
    .n_rst(n_rst),
    .x(bias_value),
    .y(neuron_bias)
);

generate
    genvar i;
    for(i=0; i<INPUT_SIZE; i++) begin : weight_block
        generator16 #(.SEED(SEED + i + 2)) weight_gen(
            .clk(clk),
            .n_rst(n_rst),
            .x(weight_values[i]),
            .y(neuron_weights[i])
        );
    end
endgenerate


always_ff @(posedge clk)
    neuron_output <= neuron_active;

always_comb begin
    neuron_mult = neuron_weights && neuron_input;

    neuron_sum = neuron_bias;
    for(int j=0; j<INPUT_SIZE; j++)
        neuron_sum |= neuron_mult[j];
end

endmodule