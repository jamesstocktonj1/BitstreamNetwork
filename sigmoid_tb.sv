`timescale 1ns / 1ps


module sigmoid_tb;


const int bitstream_length = 65536;


logic clk;
logic n_rst;

int x = 0;
logic z;
logic y;
logic w;

real value = 0;

int dataFile;


generator16 x_gen(
    .clk(clk),
    .n_rst(n_rst),
    .x(x),
    .y(z)
);
defparam x_gen.SEED = 8'b11001100;

// sigmoid sig(
//     .clk(clk),
//     .n_rst(n_rst),
//     .x(z),
//     .y(y)
// );
relu rel(
    .clk(clk),
    .n_rst(n_rst),
    .x(z),
    .y(y)
);


initial begin
    dataFile = $fopen("data/sigmoid.txt", "w");

    clk = 1'b0;
    n_rst = 1'b1;

    #20ps n_rst = 1'b0;
    #20ps n_rst = 1'b1;

    for(x=0; x<256; x++) begin
        value = 0;
        for(int i=0; i<bitstream_length; i++) begin
            #10ps clk = ~clk;
            #10ps clk = ~clk;

            if(y)
                value++;
        end

        // #20ps n_rst = 1'b0;
        // #20ps n_rst = 1'b1;

        $fwrite(dataFile, "%f\n", value/bitstream_length);
    end

    $fclose(dataFile);
    $stop();
end

endmodule