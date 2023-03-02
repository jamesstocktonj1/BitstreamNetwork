


module integrator(output int y,
                  input logic x, capture, clk, n_rst);

int count = 0;

logic increment, show, clear;

typedef enum logic [1:0] {IDLE, READING, OUTPUT} int_state;
int_state state, next_state = IDLE;


// output block
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        y <= 0;
    else if(show)
        y <= count;
end

// incrementing block
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst || clear)
        count <= 0;
    else if(increment && x) begin
        count <= count + 1;
    end
end

// state machine control
always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
        state <= IDLE;
    else
        state <= next_state;
end

// state machine
always_comb begin
    increment = 1'b0;
    show = 1'b0;
    clear = 1'b0;

    next_state = state;

    case(state)
        IDLE: begin
            clear = 1'b1;
            if(capture)
                next_state = READING;
            else
                next_state = IDLE;
        end

        READING: begin
            if(capture) begin
                increment = 1'b1;
                next_state = READING;
            end
            else begin
                show = 1'b1;
                next_state = OUTPUT;
            end
        end

        OUTPUT: begin
            next_state = IDLE;
        end
    endcase
end

endmodule