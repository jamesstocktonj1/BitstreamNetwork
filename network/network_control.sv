


module network_control(input [7:0] control_in,
                       input logic clk, n_rst,
                       output [7:0] control_out);

parameter BITSTREAM_LENGTH = 256;

// define state machine states
typedef enum logic [1:0] {IDLE, COMPUTE, INTEGRATE} network_state;
network_state state, next_state = IDLE;


// define control input signals
logic start_compute, ctrl_rst;
assign start_compute = control_in[0];
assign ctrl_rst = control_in[0];


// define control output signals
logic finish_compute;
assign control_out[0] = finish_compute;
assign control_out[7:6] = state;


// local state variables
logic compute_value, n_netrst;
int bitstream_place;
assign n_netrst = (~ctrl_rst) && n_rst;


// bitstream place incrementer
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        bitstream_place <= 0;
    else if(compute_value)
        bitstream_place <= bitstream_place + 1;
    else
        bitstream_place <= bitstream_place;
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
            compute_value = 1'b1;
            if(bitstream_place < (BITSTREAM_LENGTH-1))
                next_state = COMPUTE;
            else
                next_state = INTEGRATE;
        end

        INTEGRATE: begin
            compute_value = 1'b0;
            finish_compute = 1'b1;
            next_state = IDLE;
        end
    endcase
end


endmodule