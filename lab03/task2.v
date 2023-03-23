`timescale 1ns / 1ps
module task2(
    output wire o_w_out,
    input wire i_w_in,
    input wire i_w_clk,
    input wire i_w_reset,
    input wire[4:0] i_w_sel
);
    reg[31:0] l_r_counter;
    reg l_r_button;
    always @(posedge i_w_clk) begin
        if(i_w_reset) begin
        	// TODO implement reset logic
        end else begin
        	// TODO implement debouncing logic
        end
    end
    assign o_w_out = l_r_button;
endmodule
