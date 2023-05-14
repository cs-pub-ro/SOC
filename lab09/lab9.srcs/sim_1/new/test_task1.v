`timescale 1ns / 1ps

module test_task1;
    //Inputs
    reg l_r_clk;
    reg l_r_reset;

    //Outputs
    wire[15:0] l_w_register_0;
    wire[7:0] l_w_program_counter;

    //Module initialization
    task1 l_m_task1(
        .o_w_register_0(l_w_register_0),
        .o_w_program_counter(l_w_program_counter),
        .i_w_clk(l_r_clk),
        .i_w_reset(l_r_reset)
    );
    
    always #5 l_r_clk = ~l_r_clk;
    //Simulation tests
    initial begin
        //wave files
        $dumpfile("test.vcd");
        // dump all variables
        $dumpvars;
        // monitor variables changes in values
        $monitor(
            "Time = %0t, ", $time,
            "l_w_register_0=%0d, ", l_w_register_0,
            "l_r_reset=%0d, ", l_r_reset
        );

        l_r_clk = 0;
        l_r_reset = 1;
        #10;
        l_r_reset = 0;
        wait(l_w_program_counter == 8'd42);
        //finish the simulation
        $finish;
    end
endmodule
