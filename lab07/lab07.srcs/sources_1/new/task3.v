`timescale 1ns / 1ps
`include "defines.vh"

module task3(
		output wire o_w_digit_point,
		output wire [0:6] o_w_segment,
		output wire [3:0] o_w_digit,
		output reg [7:0] o_r_leds,
		input wire [3:0] i_w_operand1,
		input wire [3:0] i_w_operand2,
		input wire i_w_add_button,
		input wire i_w_sub_button,
		input wire i_w_op_ready_button,
		input wire i_w_reset,
		input wire i_w_clk
    );
	
	// TODO 4.1: declarati stariile FSM
	
	// TODO 4.2: folositi debouncere pentru butoane
	
	// TODO 4.3: folositi modulul de 7 segment display
	
	// TODO 4.4: declarati alte variabile utile
	
	// TODO 4.5: implementati tranzitiile intre stari
	always @(posedge i_w_clk) begin
			
	end
		
	// TODO 4.6: implementati logica de functionare
	always @(*) begin
		
	end

endmodule
