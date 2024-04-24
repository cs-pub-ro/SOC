`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		test_task1
// Project Name:		Laborator 8
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module test_task1;
    // Inputs
    reg[3:0] l_r_dividend;
    reg[3:0] l_r_divisor;

    // Outputs
    wire[3:0] l_w_quotient;
    wire[3:0] l_w_remainder;
    
    // Local variables for loop
    integer i,j;

    // UUT initialization
    task1 l_m_task1(
        .o_w_quotient(l_w_quotient),
        .o_w_remainder(l_w_remainder),
        .i_w_Q(l_r_dividend),
        .i_w_M(l_r_divisor)
    );
    
    // Simulation tests
    initial begin
        // wave files
        // $dumpfile("test.vcd");
        // dumpp all variables
        // $dumpvars;
        // Monitor varibles changes in values
        $monitor(
            "Time = %0t, ", $time,
            "l_w_quotient=%0d, ", l_w_quotient,
            "l_w_remainder=%0d, ", l_w_remainder,
            "l_r_dividend=%0d, ", l_r_dividend,
            "l_r_divisor=%0d, ", l_r_divisor
        );

        #10;
        for(i = 0; i < 16; i = i + 1)
        begin
            l_r_dividend = i;
            for(j = 0; j < 16; j = j + 1)
            begin
                l_r_divisor = j;
                #10;
            end
        end

        // Finish the simulation
        $finish;
    end
endmodule