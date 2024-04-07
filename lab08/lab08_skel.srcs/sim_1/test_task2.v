`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		test_task2
// Project Name:		Laborator 8
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module test_task2;
    // Inputs
    reg[3:0] l_r_a;
    reg[3:0] l_r_b;
    reg[2:0] l_r_sel;

    // Outputs
    wire[7:0] l_w_result;

    // Local variables for loop
    integer i,j,k;

    // UUT initialization
    task2 l_m_task2(
        .o_w_result(l_w_result),
        .i_w_a(l_r_a),
        .i_w_b(l_r_b),
        .i_w_op_sel(l_r_sel)
        );
    
    //Simulation tests
    initial begin
        // wave files
        // $dumpfile("test.vcd");
        // dumpp all variables
        // $dumpvars;
        // Monitor varibles changes in values
        $monitor(
            "Time = %0t, ", $time,
            "l_w_result=%0d, ", l_w_result,
            "l_r_a=%0d, ", l_r_a,
            "l_r_b=%0d, ", l_r_b,
            "l_r_sel=%0d, ", l_r_sel
        );

        #10;
        for(i = 0; i < 16; i = i + 1)
        begin
            l_r_a = i;
            for(j = 0; j < 16; j = j + 1)
            begin
                l_r_b = j;
                for(k = 0; k < 8; k = k + 1)
                begin
                    l_r_sel = k;
                    #10;
                end
            end
        end

        // Finish the simulation
        $finish;
    end
endmodule