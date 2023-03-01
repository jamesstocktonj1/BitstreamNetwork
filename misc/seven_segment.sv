module seven_segment(output logic [6:0] hex, input logic [3:0] value);

always_comb
  unique casez (value)
    6'b000000 : hex = 7'b1000000;
    6'b000001 : hex = 7'b1111001;
    6'b000010 : hex = 7'b0100100;
    6'b000011 : hex = 7'b0110000;
    6'b000100 : hex = 7'b0011001;
    6'b000101 : hex = 7'b0010010;
    6'b000110 : hex = 7'b0000010;
    6'b000111 : hex = 7'b1111000;
    6'b001000 : hex = 7'b0000000;
    6'b001001 : hex = 7'b0010000;
    6'b001010 : hex = 7'b0001000;
    6'b001011 : hex = 7'b0000011;
    6'b001100 : hex = 7'b1000110;
    6'b001101 : hex = 7'b0100001;
    6'b001110 : hex = 7'b0000110;
    6'b001111 : hex = 7'b0001110;
    6'b01???? : hex = 7'b1000001; //U for undefined = contention
    6'b1????? : hex = 7'b0001001; //H for high impedance
    default : hex = 7'b1111111; 
  endcase

endmodule