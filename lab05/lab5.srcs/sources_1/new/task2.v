`timescale 1ns / 1ps

module task2(
    input clk,
    input reset,
    output clk_1s_out,
    output[7:0] AN,
    output[7:0] SEG
    );
    
    wire refresh_fq;
    wire clk_1s;
    wire clk_1min;
    wire clk_1h;
    wire[5:0] value_seconds;
    wire[5:0] value_minutes;
    wire[3:0] BCD0;
    wire[3:0] BCD1;
    wire[3:0] BCD2;
    wire[3:0] BCD3;
    
    
    // TODO: wire modules to get the full_counter
    clock_div clock_div(
    );
    
    counter seconds_counter(
    );
    
    counter minutes_counter(
    );
    
    bin2bcd seconds(
    );
    
    bin2bcd minutes(
    );
    
    display_7seg display(
    );
    
endmodule