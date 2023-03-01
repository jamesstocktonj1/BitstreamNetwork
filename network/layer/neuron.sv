


module neuron #(INPUT_SIZE = 2, SEED = 0)
            (output logic neuron_output,
             input logic [INPUT_SIZE-1:0] neuron_input,
             input int weight_values [INPUT_SIZE-1:0],
             input logic clk, n_rst);

logic [INPUT_SIZE-1:0] neuron_weights;
logic [INPUT_SIZE-1:0] neuron_mult;
logic neuron_sum;
logic neuron_active;


sigmoid activation_function(
    .clk(clk),
    .n_rst(n_rst),
    .x(neuron_sum),
    .y(neuron_active)
);

generate
    genvar i;
    for(i=0; i<INPUT_SIZE; i++)
        generator #(.SEED(SEED + i)) weight_gen(
            .clk(clk),
            .n_rst(n_rst),
            .x(weight_values[i]),
            .y(neuron_weights[i])
        );
endgenerate


always_ff @(posedge clk)
    neuron_output <= neuron_active;

always_comb begin
    neuron_mult = neuron_weights && neuron_input;

    neuron_sum = 1'b0;
    for(int j=0; j<INPUT_SIZE; j++)
        neuron_sum |= neuron_mult[j];
end

endmodule