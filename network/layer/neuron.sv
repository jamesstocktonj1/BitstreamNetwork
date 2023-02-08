


module neuron #(INPUT_SIZE = 2, OFFSET = 0, WEIGHT_LEN = 16)
            (output logic neuron_output,
             input logic [INPUT_SIZE-1:0] neuron_input,
             input logic [WEIGHT_LEN-1:0] weight_values [INPUT_SIZE-1:0],
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

// generate
//     genvar i;
//     for(i=0; i<INPUT_SIZE; i++) begin
//         weight #(.OFFSET(OFFSET), .WEIGHT_LEN(WEIGHT_LEN), .WEIGHT_VAL(WEIGHT_VALS[i])) weight_gen(
//             .clk(clk),
//             .n_rst(n_rst),
//             .y(neuron_weights[i])
//         );
//         // defparam weight_gen.OFFSET = OFFSET;
//         // defparam weight_gen.WEIGHT_LEN = WEIGHT_LEN;
//         // defparam weight_gen.WEIGHT_VAL = WEIGHT_VALS[i];
//     end
// endgenerate

weight #(.OFFSET(OFFSET), .WEIGHT_LEN(WEIGHT_LEN)) weight_gen1(
    .clk(clk),
    .n_rst(n_rst),
    .weight_value(weight_values[0]),
    .y(neuron_weights[0])
);

weight #(.OFFSET(OFFSET), .WEIGHT_LEN(WEIGHT_LEN)) weight_gen2(
    .clk(clk),
    .n_rst(n_rst),
    .weight_value(weight_values[1]),
    .y(neuron_weights[1])
);


always_ff @(posedge clk)
    neuron_output <= neuron_active;

always_comb begin
    neuron_mult = neuron_weights && neuron_input;

    // for(int j=0; j<INPUT_SIZE; j++)
    //     neuron_mult[j] = neuron_weights[j] && neuron_output[j];

    neuron_sum = 1'b0;
    for(int j=0; j<INPUT_SIZE; j++)
        neuron_sum |= neuron_mult[j];
end

endmodule