`timescale 1ns / 1ps

module task2#(
    parameter DELAY_BIT = 5'd6 //FPGA
)
(
    output wire o_w_AN0,
    output wire o_w_AN1,
    output wire o_w_AN2,
    output wire o_w_AN3,
    output wire o_w_AN4,
    output wire o_w_AN5,
    output wire o_w_AN6,
    output wire o_w_AN7,
    output wire o_w_CA,
    output wire o_w_CB,
    output wire o_w_CC,
    output wire o_w_CD,
    output wire o_w_CE,
    output wire o_w_CF,
    output wire o_w_CG,
    output wire o_w_DP,
    input wire i_w_clk,
    input wire i_w_reset
);
   //current instruction
    wire[15:0] l_w_instruction;
    
    wire[15:0] o_w_register_0;
    wire[7:0] o_w_program_counter;

    //CPU CPI=5
    task01 l_m_task01(
        .o_w_register_0(o_w_register_0),
        .o_w_program_counter(o_w_program_counter),
        .i_w_instruction(l_w_instruction),
        .i_w_clk(i_w_clk),
        .i_w_reset(i_w_reset)
    );

    //Instruction memory
    task21 l_m_task21(
        .o_w_data(l_w_instruction),
        .i_w_address(o_w_program_counter),
        .i_w_clk(i_w_clk)
    );

    display7LED #(.DELAY_BIT(DELAY_BIT)) l_m_display7LED(
        .o_w_AN0(o_w_AN0),
        .o_w_AN1(o_w_AN1),
        .o_w_AN2(o_w_AN2),
        .o_w_AN3(o_w_AN3),
        .o_w_AN4(o_w_AN4),
        .o_w_AN5(o_w_AN5),
        .o_w_AN6(o_w_AN6),
        .o_w_AN7(o_w_AN7),
        .o_w_CA(o_w_CA),
        .o_w_CB(o_w_CB),
        .o_w_CC(o_w_CC),
        .o_w_CD(o_w_CD),
        .o_w_CE(o_w_CE),
        .o_w_CF(o_w_CF),
        .o_w_CG(o_w_CG),
        .o_w_DP(o_w_DP),
        .i_w_clk(i_w_clk),
        .i_w_reset(i_w_reset),
        .i_w_value(o_w_register_0[15:0])
    );

endmodule
