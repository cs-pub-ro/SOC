`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//
// Design Name:   		subtractor_8bit
// Module Name:  		task3_tb.v
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task3_tb;

	// Inputs
	reg [7:0] l_r_A;
	reg [7:0] l_r_B;
	reg l_r_borrow_in;

	// Outputs
	wire l_w_borrow_out;
	wire [7:0] l_w_result;

	// Instantiate the Unit Under Test (UUT)
	task3 l_m_task3 (
		.o_w_borrow(l_w_borrow_out), 
		.o_w_diff(l_w_result), 
		.i_w_A(l_r_A), 
		.i_w_B(l_r_B), 
		.i_w_borrow(l_r_borrow_in)
	);

	initial begin
		$monitor(
		"Time = %0t, ", $time,
		"A=%0d, ", l_r_A,
		"B=%0d, ", l_r_B,
		"diff=%0d, ", l_w_result,
		"carry_out=%0d, ", l_w_borrow_out,
		"carry_in=%0d, ", l_r_borrow_in);
	
		// Initialize Inputs
		l_r_A = 30;
		l_r_B = 5;
		l_r_borrow_in = 0;

		#100;       

		l_r_A = 5;
		l_r_B = 30;

		#100;
		  
		l_r_A = 100;
		l_r_B = 37;
		
		#100;
		
		l_r_A = 93;
		l_r_B = 28;
		
		#100;
		
		l_r_A = 56;
		l_r_B = 23;
		
		#100;
		
		l_r_borrow_in = 1;
		l_r_A = 127;
		l_r_B = 14;
		
		#100;
		$finish;
		
	end
      
endmodule
