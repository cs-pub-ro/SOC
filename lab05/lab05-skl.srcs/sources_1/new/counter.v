`timescale 1ns / 1ps

module counter(
    input carry_in,        // output from lower counter
    input reset,
    output reg[5:0] value, // effective value (from 0 -> 59)
    output reg carry_out   // this is the input clock for the upper counter
    );
    
    initial value = 0;
    initial carry_out = 0;
    
    always @(posedge carry_in or posedge reset) begin
        // TODO: counter
    end
endmodule
