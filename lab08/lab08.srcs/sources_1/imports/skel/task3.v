`timescale 1ns / 1ps
module task3
#(
    parameter BOUNCE = 5'd6, // FPGA
    parameter DELAY_BIT = 5'd6 //FPGA
)
(
    output wire o_w_AN0,
    output wire o_w_AN1,
    output wire o_w_AN2,
    output wire o_w_AN3,
    output wire o_w_CA,
    output wire o_w_CB,
    output wire o_w_CC,
    output wire o_w_CD,
    output wire o_w_CE,
    output wire o_w_CF,
    output wire o_w_CG,
    output wire o_w_DP,
    output wire [7:0] o_w_out,
    input wire [3:0] i_w_a,
    input wire [3:0] i_w_b,
    input wire [2:0] i_w_op_sel,
    input wire i_w_clk,
    input wire i_w_reset
);
    //TODO1: debounce the buttons on  i_w_op_sel
    wire[2:0] l_w_button_debounced;
    genvar i;
    generate for(i = 0; i < 3; i = i + 1)
        begin: loop_debouncer
            debouncer (
                .o_w_out(l_w_button_debounced[i]),
                .i_w_in(i_w_op_sel[i]),
                .i_w_clk(i_w_clk),
                .i_w_reset(i_w_reset),
                .i_w_sel(BOUNCE)
                );
        end
    endgenerate

    //TODO2: define the ual
    task2 l_m_task2(
        .o_w_result(o_w_out),
        .i_w_a(l_r_a),
        .i_w_b(l_r_b),
        .i_w_op_sel(l_w_button_debounced)
        );

    //7LED display for showing the output in decimal
    display7LED #(.DELAY_BIT(DELAY_BIT)) l_m_display7LED(
        .o_w_AN0(o_w_AN0),
        .o_w_AN1(o_w_AN1),
        .o_w_AN2(o_w_AN2),
        .o_w_AN3(o_w_AN3),
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
        .i_w_value({8'b0000_0000, o_w_out})
    );
endmodule