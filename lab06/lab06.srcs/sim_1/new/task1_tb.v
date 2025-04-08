`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//
// Design Name:   		task1
// Module Name:  		task1_tb.v
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module task1_tb;

	// Inputs
	reg l_r_bit_A;
	reg l_r_bit_B;
	reg l_r_carry_in;

	// Outputs
	wire l_w_sum;
	wire l_w_carry_out;

	integer i, j, k;

	// Instantiate the Unit Under Test (UUT)
	task1 l_m_task1 (
		.o_w_sum(l_w_sum), 
		.o_w_carry_out(l_w_carry_out), 
		.i_w_bit_A(l_r_bit_A), 
		.i_w_bit_B(l_r_bit_B), 
		.i_w_carry_in(l_r_carry_in)
	);

	initial begin
		 $monitor(
		"Time = %0t, ", $time,
		"l_r_bit_A=%0d, ", l_r_bit_A,
		"l_r_bit_B=%0d, ", l_r_bit_B,
		"l_w_sum=%0d, ", l_w_sum,
		"l_w_carry_out=%0d, ", l_w_carry_out,
		"l_r_carry_in=%0d, ", l_r_carry_in);
		// possible values for l_r_bit_A
		for (i = 0; i < 2; i = i + 1)
		begin
			l_r_bit_A = i;
			// possible values for l_r_bit_B
			for (j = 0; j < 2; j = j + 1)
			begin
				l_r_bit_B = j;
				// possible values for l_r_carry_in
				for (k = 0; k < 2; k = k + 1)
				begin
					l_r_carry_in = k;
					#10;
				end
			end
		end
        
		$finish;

	end
      
endmodule
