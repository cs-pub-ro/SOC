`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//
// Design Name:   		ripple_carry_8bit
// Module Name:  		task2_test.v
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task2_test;

	// Inputs
	reg [7:0] l_r_A;
	reg [7:0] l_r_B;
	reg l_r_carry_in;

	// Outputs
	wire l_w_carry_out;
	wire [7:0] l_w_sum;

	// Instantiate the Unit Under Test (UUT)
	task2 l_m_task2(
		.o_w_carry_out(l_w_carry_out), 
		.o_w_sum(l_w_sum), 
		.i_w_A(l_r_A), 
		.i_w_B(l_r_B), 
		.i_w_carry_in(l_r_carry_in)
	);

	initial begin
		// Initialize Inputs
		$monitor(
		"Time = %0t, ", $time,
		"l_r_A=%0d, ", l_r_A,
		"l_r_B=%0d, ", l_r_B,
		"l_w_sum=%0d, ", l_w_sum,
		"l_w_carry_out=%0d, ", l_w_carry_out,
		"l_r_carry_in=%0d, ", l_r_carry_in);
		l_r_A = 0;
		l_r_B = 0;
		l_r_carry_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		l_r_A = 40;
		l_r_B = 53;
		l_r_carry_in = 1;
		
		#100;
		
		l_r_A = 17;
		l_r_B = 80;
		l_r_carry_in = 0;
		
		#100;
		
		l_r_A = 3;
		l_r_B = 50;
		l_r_carry_in = 1;
		
		#100;
		$finish;
	end
      
endmodule

