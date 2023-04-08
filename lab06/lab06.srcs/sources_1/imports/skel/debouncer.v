`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		debouncer
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module debouncer(
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
            l_r_counter <= 0;
            l_r_button <= 0;
        end else begin
            if(i_w_in == l_r_button) begin
                l_r_counter <= 0;
            end else begin
                if(l_r_counter[i_w_sel] == 1'b1) begin
                    l_r_button <= ~l_r_button;
                    l_r_counter <= 0;
                end else begin
                    l_r_counter <= l_r_counter + 1;
                end
            end
        end
    end
    assign o_w_out = l_r_button;
endmodule
