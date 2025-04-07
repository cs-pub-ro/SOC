`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		task4_test
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module test_task3;
    // Inputs
    reg[7:0] l_r_a;
    reg[7:0] l_r_b;
    reg[2:0] l_r_sel;
    reg[7:0] i;
    reg l_r_clk;
    reg l_r_reset;

    // Outputs
    wire [7:0] l_w_out;

    // Local variables for loop
    integer i,j,k;

    // UUT initialization
    task4 #(.BOUNCE(5'd2)) l_m_task4(
        .o_w_out(l_w_out),
        .i_w_a(l_r_a),
        .i_w_b(l_r_b),
        .i_w_op_sel(l_r_sel),
        .i_w_clk(l_r_clk),
        .i_w_reset(l_r_reset)
    );

    // CLK simulation
    always #5 l_r_clk = ~l_r_clk;

    //Simulation tests
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
            "l_r_b=%0d, ", l_r_b,
            "l_r_sel=%0d, ", l_r_sel,
            "l_r_reset=%0d, ", l_r_reset
            );

        l_r_clk = 0;
        l_r_reset = 1;
        #10;
        l_r_reset = 0;

        // Initialize Inputs
		l_r_a = 30;
		l_r_b = 5;
        
        for (i = 0; i < 5; i = i + 1) begin
            l_r_sel = i;
            #100;
        end
		  
		  
		l_r_a = 100;
		l_r_b = 37;
		for (i = 0; i < 5; i = i + 1) begin
            l_r_sel = i;
            #100;
        end
		
		#100;
		
		l_r_a = 93;
		l_r_b = 28;
		for (i = 0; i < 5; i = i + 1) begin
            l_r_sel = i;
            #100;
        end
		
		#100;
		
		l_r_a = 56;
		l_r_b = 23;
		
		for (i = 0; i < 5; i = i + 1) begin
            l_r_sel = i;
            #100;
        end
		
		#100;
		
		l_r_a = 127;
		l_r_b = 14;
		
		for (i = 0; i < 5; i = i + 1) begin
            l_r_sel = i;
            #100;
        end
		
		#100;

        // Finish the simulation
        $finish;
    end
endmodule