`timescale 1ns / 1ps

module test_task2;
    //Inputs
    reg l_r_clk;
    reg l_r_reset;

    //Module initialization
    task2 l_m_task2(
        .i_w_clk(l_r_clk),
        .i_w_reset(l_r_reset)
    );
    
    always #5 l_r_clk = ~l_r_clk;

    initial begin
        l_r_clk = 0;
        l_r_reset = 1;
        #100;
        l_r_reset = 0;
    end
endmodule
