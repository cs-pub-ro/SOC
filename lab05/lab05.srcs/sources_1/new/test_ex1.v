`timescale 1ns / 1ps

module test_ex1;
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
    ex1 uut (
        .o_w_AN0(l_w_AN0),
        .o_w_AN1(l_w_AN1),
        .o_w_AN2(l_w_AN2),
        .o_w_AN3(l_w_AN3),
        .o_w_CA(l_w_CA),
        .o_w_CB(l_w_CB),
        .o_w_CC(l_w_CC),
        .o_w_CD(l_w_CD),
        .o_w_CE(l_w_CE),
        .o_w_CF(l_w_CF),
        .o_w_CG(l_w_CG),
        .o_w_DP(l_w_DP)
    );

    initial begin
        // Wait 100 ns
        #100;

    end
endmodule
