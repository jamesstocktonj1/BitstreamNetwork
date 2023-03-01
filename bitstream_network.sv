


module bitstream_network(
        ///////// CLOCK /////////
        input              CLOCK_50,


        ///////// GPIO /////////
        inout     [35:0]         GPIO_0,
        inout     [35:0]         GPIO_1,


        ///////// HEX0 /////////
        output      [6:0]  HEX0,

        ///////// HEX1 /////////
        output      [6:0]  HEX1,

        ///////// HEX2 /////////
        output      [6:0]  HEX2,

        ///////// HEX3 /////////
        output      [6:0]  HEX3,

        ///////// HEX4 /////////
        output      [6:0]  HEX4,

        ///////// HEX5 /////////
        output      [6:0]  HEX5,


        ///////// KEY /////////
        input       [3:0]  KEY,

        ///////// LEDR /////////
        output      [9:0]  LEDR,

        ///////// SW /////////
        input       [9:0]  SW
);

// define logic signals
logic clk, n_rst;
logic [7:0] control_in;
logic [7:0] control_out;

int data_in [0:1] = '{124, 82};
int data_out [0:0];


// assign logic signals
assign clk = KEY[0];
assign n_rst = KEY[1];

assign control_in = SW[7:0];
assign LEDR[7:0] = control_out;

assign LEDR[8] = ~(data_out[0] == 0);


// bitstream neural network
network_control my_network(
    .clk(clk),
    .n_rst(n_rst),
    .control_in(control_in),
    .control_out(control_out),
    .data_in(data_in),
    .data_out(data_out)
);

endmodule