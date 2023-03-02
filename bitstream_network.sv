


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

logic [3:0] value0, value1, value2, value3, value4, value5 = 4'b0000;


// assign logic signals
// assign clk = KEY[0];
assign n_rst = KEY[1];

assign control_in = SW[7:0];
assign LEDR[7:0] = control_out;

assign LEDR[8] = ~(data_out[0] == 0);
assign LEDR[9] = clk;

assign value3 = (data_out[0] / 100) % 10;
assign value4 = (data_out[0] / 10) % 10;
assign value5 = data_out[0] % 10;


// define hex displays
seven_segment hex0 (.hex(HEX0), .value(value0));
seven_segment hex1 (.hex(HEX1), .value(value1));
seven_segment hex2 (.hex(HEX2), .value(value2));
seven_segment hex3 (.hex(HEX3), .value(value3));
seven_segment hex4 (.hex(HEX4), .value(value4));
seven_segment hex5 (.hex(HEX5), .value(value5));


clock_divide clk50_div (
    .clk(CLOCK_50),
    .n_rst(n_rst),
    .y(clk)
);

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