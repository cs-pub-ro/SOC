`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		test_task0
// Project Name:		Laborator 8
// Target Devices: 		Digilent Artix 7
//////////////////////////////////////////////////////////////////////////////////

module test_task0;
    // Inputs
    reg[3:0] l_r_a;
    reg[3:0] l_r_b;

    // Outputs
    wire[7:0] l_w_out;
    
    // Local variables for loop
    integer i,j;

    // UUT initialization
    task0 l_m_task0(
        .o_w_out(l_w_out),
        .i_w_M(l_r_a),
        .i_w_R(l_r_b)
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
            "l_w_out=%0d, ", l_w_out,
            "l_r_a=%0d, ", l_r_a,
            "l_r_b=%0d, ", l_r_b
        );

        #10;
        for(i = 0; i < 16; i = i + 1)
        begin
            l_r_a = i;
            for(j = 0; j < 16; j = j + 1)
            begin
                l_r_b = j;
                #10;
            end
        end

        // Finish the simulation
        $finish;
    end
endmodule