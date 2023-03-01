


module sigmoid(output logic y,
               input logic x, clk, n_rst);

parameter OFFSET = 0;


logic const_exp;
logic x_exp;
logic x_exp_n;

logic a2;
logic a3;
logic a4;
logic a5;

// generates constants for exponential
constant constants_generator(
    .clk(clk),
    .n_rst(n_rst),
    .a2(a2),
    .a3(a3),
    .a4(a4),
    .a5(a5)
);
defparam constants_generator.OFFSET = OFFSET;

// generates e^-4
// exp_const const_exponential(
//     .clk(clk),
//     .n_rst(n_rst),
//     .y(const_exp)
// );
// defparam const_exponential.OFFSET = OFFSET;

// generates e^-4
generator const_exponential(
    .clk(clk),
    .n_rst(n_rst),
    .x(5),
    .y(const_exp)
);

// generates e^-4
// generator_exp const_exponential(
//     .clk(clk),
//     .n_rst(n_rst),
//     .y(const_exp)
// );
defparam const_exponential.SEED = 8'b1010100;

// generates e^-x
exp x_exponential(
    .clk(clk),
    .n_rst(n_rst),
    .a2(a2),
    .a3(a3),
    .a4(a4),
    .a5(a5),
    .x(x),
    .y(x_exp)
);

// converts e^-x => e^-8x
power exp_power(
    .clk(clk),
    .n_rst(n_rst),
    .x(x_exp),
    .y(x_exp_n)
);

// converts y = e^-4 / (e^-4 + e^-8x)
fraction flip_flop(
    .clk(clk),
    .n_rst(n_rst),
    .j(const_exp),
    .k(x_exp_n),
    .y(y)
);

endmodule