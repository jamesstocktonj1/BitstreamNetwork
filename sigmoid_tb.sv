`timescale 1ns / 1ps


module sigmoid_tb;


logic clk;
logic n_rst;

int x = 0;
logic z;
logic y;

real value = 0;

int dataFile;


generator x_gen(
    .clk(clk),
    .n_rst(n_rst),
    .x(x),
    .y(z)
);

sigmoid sig(
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
        for(int i=0; i<256; i++) begin
            #10ps clk = ~clk;
            #10ps clk = ~clk;

            if(y)
                value++;
        end

        $fwrite(dataFile, "%f\n", value/256);
    end

    $fclose();
    $stop();
end

endmodule