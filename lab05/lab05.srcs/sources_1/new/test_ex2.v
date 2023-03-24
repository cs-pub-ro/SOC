`timescale 1ns / 1ps

module test_ex2;

    // Inputs
    reg l_r_reset;
    reg l_r_clk;

    // Outputs
    wire l_w_AN0;
    wire l_w_AN1;
    wire l_w_AN2;
    wire l_w_AN3;
    wire l_w_CA;
    wire l_w_CB;
    wire l_w_CC;
    wire l_w_CD;
    wire l_w_CE;
    wire l_w_CF;
    wire l_w_CG;
    wire l_w_DP;

    // Instantiate the Unit Under Test (UUT)
    ex2 uut (
        .o_r_AN0(l_w_AN0),
        .o_r_AN1(l_w_AN1),
        .o_r_AN2(l_w_AN2),
        .o_r_AN3(l_w_AN3),
        .o_r_CA(l_w_CA),
        .o_r_CB(l_w_CB),
        .o_r_CC(l_w_CC),
        .o_r_CD(l_w_CD),
        .o_r_CE(l_w_CE),
        .o_r_CF(l_w_CF),
        .o_r_CG(l_w_CG),
        .o_r_DP(l_w_DP),
        .i_w_reset(l_r_reset),
        .i_w_clk(l_r_clk)
    );

    always begin
        #1 l_r_clk = ~l_r_clk;
    end

    initial begin
        // Initialize Inputs
        l_r_reset = 1;
        l_r_clk = 0;

        // Wait 100 ns for global l_r_reset to finish
        #100;

        // Add stimulus here
        l_r_reset = 0;
    end
endmodule
