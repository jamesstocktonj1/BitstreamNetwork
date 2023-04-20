


module network_control #(INPUT_SIZE=2, OUTPUT_SIZE=1)(input logic [7:0] control_in,
                       input logic clk, n_rst,
                       output logic [7:0] control_out,
                       input int data_in [0:INPUT_SIZE-1],
                       output int data_out [0:OUTPUT_SIZE-1]);

parameter BITSTREAM_LENGTH = 256;

// define state machine states
typedef enum logic [3:0] {IDLE, COMPUTE, INTEGRATE} network_state;
network_state state, next_state = IDLE;


// define control input signals
logic start_compute, ctrl_rst;
assign start_compute = control_in[0];
assign ctrl_rst = control_in[0];


// define control output signals
logic finish_compute;
assign control_out[0] = finish_compute;
assign control_out[7:4] = state;


// local state variables
logic compute_value, n_netrst;
int bitstream_place;
assign n_netrst = n_rst;
// assign n_netrst = (~ctrl_rst) && n_rst;



// network instance
network net(
    .clk(clk),
    .n_rst(n_netrst),
    .compute(compute_value),
    .network_input(data_in),
    .network_output(data_out)
);


// bitstream place incrementer
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        bitstream_place <= 0;
    else if(compute_value)
        bitstream_place <= bitstream_place + 1;
    else
        bitstream_place <= 0;
end


// state machine controller
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        state <= IDLE;
    else
        state <= next_state;
end


// state machine
always_comb begin
    //control_out = 8'b0;
    compute_value = 1'b0;

    finish_compute = 1'b0;

    next_state = state;

    case(state)
        IDLE: begin
            if(start_compute) begin
                compute_value = 1'b1;
                next_state = COMPUTE;
            end
            else
                next_state = IDLE;
        end

        COMPUTE: begin
            if(bitstream_place < (BITSTREAM_LENGTH-1)) begin
                compute_value = 1'b1;
                next_state = COMPUTE;
            end
            else begin
                compute_value = 1'b0;
                next_state = INTEGRATE;
            end
        end

        INTEGRATE: begin
            finish_compute = 1'b1;
            if(~start_compute)
                next_state = IDLE;
            else
                next_state = INTEGRATE;
        end
    endcase
end


endmodule