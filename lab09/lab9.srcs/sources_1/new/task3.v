`timescale 1ns / 1ps

module task3
(
    input wire i_w_clk,
    input wire i_w_reset
);
   //current instruction
    wire[15:0] l_w_instruction;
    
    wire[15:0] o_w_register_0;
    wire[7:0] o_w_program_counter;

    //CPU CPI=1
    task11 l_m_task11(
        .o_w_register_0(o_w_register_0),
        .o_w_program_counter(o_w_program_counter),
        .i_w_instruction(l_w_instruction),
        .i_w_clk(i_w_clk),
        .i_w_reset(i_w_reset)
    );

    //Instruction memory
    task31 l_m_task31(
        .o_w_data(l_w_instruction),
        .i_w_address(o_w_program_counter),
        .i_w_clk(i_w_clk)
    );
endmodule
