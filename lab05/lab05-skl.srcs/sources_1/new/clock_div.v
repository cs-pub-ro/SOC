`timescale 1ns / 1ps

//`define CLK_DIV

module clock_div(
    input clk,          // 10 ns clock
    output clk_1s,      // clk with 1s posedge
    output refresh_fq   // clk to refresh 7 seg
    );
    
    reg[31:0] counter = 0;
    reg clk_reg = 0;
    
    always @(posedge clk) begin
            // define a CLK_DIV and increment counter
            // HINT: 1s / 10ns, but we have to consider that 1s is posedge -> posedge
            // not posedge -> negedge
    end
    
    assign clk_1s = clk_reg;
    assign refresh_fq = counter[17]; // good enough refresh fq to not get bleeding
endmodule
