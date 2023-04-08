`timescale 1ns / 1ps
`include "defines.vh"

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ordinator_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task4(
		output wire o_w_digit_point,
		output reg [7:0] o_r_progress,
		output wire [0:6] o_w_segment,
		output wire [3:0] o_w_digit,
		input wire [7:0] i_w_operand,
		input wire i_w_add_button,
		input wire i_w_sub_button,
		input wire i_w_op_button,
		input wire i_w_reset,
		input wire i_w_clk
    );

	localparam STATE_INITIAL = 0;
	localparam STATE_OP1_READ = 1;
	localparam STATE_OP2_READ = 2;
	localparam STATE_RESULT_SELECT = 3;
	
	wire l_w_add_btn_debounced, l_w_sub_btn_debounced, l_w_op_btn_debounced;
	
	reg [9:0] l_r_message;
	// TODO 4.1: Declare parameters here
	
	// TODO 4.2: Instantiate adder, subtractor and other useful modules 
	
	
	display_7_segment_driver l_m_display(
		.o_r_segment(o_w_segment),
		.o_r_digit_point(o_w_digit_point),
		.o_r_digit(o_w_digit),
		.i_w_message(l_r_message),
		.i_w_reset(i_w_reset),
		.i_w_clk(i_w_clk)
	);
	
	always @(posedge i_w_clk) begin
		// TODO 4.3: Implement state change based on clock
	end
	
	always @(*) begin
		// TODO 4.4: Implement state change logic
	end
	

endmodule
