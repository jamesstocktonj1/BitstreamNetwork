


module sigmoid(output logic y,
               input logic x, clk, n_rst);

parameter SEED = 0'b11010101;


logic const_exp;
logic const_exp_n;
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
// defparam constants_generator.OFFSET = OFFSET;

// generates constants for exponential
// generator a2_gen(.clk(clk), .n_rst(n_rst), .x(128), .y(a2));
// generator a3_gen(.clk(clk), .n_rst(n_rst), .x(85), .y(a3));
// generator a4_gen(.clk(clk), .n_rst(n_rst), .x(64), .y(a4));
// generator a5_gen(.clk(clk), .n_rst(n_rst), .x(51), .y(a5));

// defparam a2_gen.SEED = (8'b10001101 + SEED) % 0'b11111111;
// defparam a3_gen.SEED = (8'b10001111 + SEED) % 0'b11111111;
// defparam a4_gen.SEED = (8'b10010001 + SEED) % 0'b11111111;
// defparam a5_gen.SEED = (8'b10010010 + SEED) % 0'b11111111;

// generates e^-4
// exp_const const_exponential(
//     .clk(clk),
//     .n_rst(n_rst),
//     .y(const_exp)
// );
// defparam const_exponential.OFFSET = OFFSET;

// generates e^-4
// generator const_exponential(
//     .clk(clk),
//     .n_rst(n_rst),
//     .x(94),
//     .y(const_exp)
// );

// generates e^-4
generator_exp const_exponential(
    .clk(clk),
    .n_rst(n_rst),
    .y(const_exp)
);
// defparam const_exponential.SEED = (8'b10001100 + SEED) % 0'b11111111;

// generates e^-x
exponential x_exponential(
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

// converts e^-1 => e^-4
power4 const_power(
    .clk(clk),
    .n_rst(n_rst),
    .x(const_exp),
    .y(const_exp_n)
);

// converts y = e^-4 / (e^-4 + e^-8x)
fraction flip_flop(
    .clk(clk),
    .n_rst(n_rst),
    .j(const_exp_n),
    .k(x_exp_n),
    .y(y)
);

endmodule