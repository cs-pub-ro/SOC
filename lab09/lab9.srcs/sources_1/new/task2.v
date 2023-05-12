`timescale 1ns / 1ps

module task2
(
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
endmodule
