`timescale 1ns / 1ps

module test_task2;

	// Inputs
	reg [15:0] l_r_a;
	reg [15:0] l_r_b;
	reg l_r_c_in;

	// Outputs
	wire [15:0] l_w_sum;
	wire l_w_c_out;

	// Instantiate the Unit Under Test (UUT)
	task2 uut (
		.o_w_sum(l_w_sum), 
		.o_w_c_out(l_w_c_out), 
		.i_w_a(l_r_a), 
		.i_w_b(l_r_b), 
		.i_w_c_in(l_r_c_in)
	);

	initial begin
		// Initialize Inputs
		l_r_a = 0;
		l_r_b = 0;
		l_r_c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		l_r_a = 30000;
		l_r_b = 30000;
		l_r_c_in = 1;        
		 
		#100;
		l_r_a = 60000;
		l_r_b = 4192;
		l_r_c_in = 1;

		#100;
		$stop;
	end
      
endmodule

