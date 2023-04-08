`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//
// Design Name:   		task0
// Module Name:  		task0_test.v
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task0_test;

	// Inputs
	reg l_r_bit_A;
	reg l_r_bit_B;

	// Outputs
	wire l_w_sum;
	wire l_w_carry;

	integer i, j;

	// Instantiate the Unit Under Test (UUT)
	task0 l_m_task0 (
		.o_w_sum(l_w_sum), 
		.o_w_carry(l_w_carry), 
		.i_w_bit_A(l_r_bit_A), 
		.i_w_bit_B(l_r_bit_B)
	);

	initial begin
	  $monitor(
		"Time = %0t, ", $time,
		"l_r_bit_A=%0d, ", l_r_bit_A,
		"l_r_bit_B=%0d, ", l_r_bit_B,
		"l_w_sum=%0d, ", l_w_sum,
		"l_w_carry=%0d, ", l_w_carry);
	
		for (i = 0; i < 2; i = i + 1)
		begin
			l_r_bit_A = i;
			// possible values for l_r_bit_B
			for (j = 0; j < 2; j = j + 1)
			begin
				l_r_bit_B = j;
				#10;
			end
		end
		$finish;
	end
      
endmodule

