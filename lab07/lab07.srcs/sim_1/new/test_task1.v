`timescale 1ns / 1ps

module test_task1;

	// Inputs
	reg [3:0] l_r_a;
	reg [3:0] l_r_b;

	// Outputs
	wire [3:0] l_w_diff;
	wire l_w_c_out;

	// Instantiate the Unit Under Test (UUT)
	task1 uut (
		.o_w_diff(l_w_diff), 
		.o_w_c_out(l_w_c_out), 
		.i_w_a(l_r_a), 
		.i_w_b(l_r_b)
	);

	initial begin
		// Initialize Inputs
		l_r_a = 0;
		l_r_b = 0;

		#100;
   
		l_r_a = 10;
		l_r_b = 3;
	
		#100;
   
		l_r_a = 15;
		l_r_b = 1;
		
		#100;
		l_r_a = 5;
		l_r_b = 8;
	
		#100;
		$stop;
	end
      
endmodule
