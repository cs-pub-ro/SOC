`timescale 1ns / 1ps

module bin2bcd(
    input[5:0] value, // value coming from counter
    output[3:0] BCD0, // lower digit
    output[3:0] BCD1  // upper digit
    );
    
    reg[7:0] BCD = 0;
    integer i;
    
    // Double Dabble algorithm
    
    assign BCD0 = BCD[3:0];
    assign BCD1 = BCD[7:4];
endmodule