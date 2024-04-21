`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		task3
// Project Name:		Laborator 8
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module task3
#(
    parameter BOUNCE    = 5'd6, // FPGA
    parameter DELAY_BIT = 5'd6  // FPGA
)
(
    output wire [7:0] o_w_AN,
    output wire       o_w_CA,
    output wire       o_w_CB,
    output wire       o_w_CC,
    output wire       o_w_CD,
    output wire       o_w_CE,
    output wire       o_w_CF,
    output wire       o_w_CG,
    output wire       o_w_DP,
    output wire [3:0] o_w_a,
    output wire [3:0] o_w_b,
    output wire [2:0] o_w_op_sel,
    input  wire [3:0] i_w_a,
    input  wire [3:0] i_w_b,
    input  wire [2:0] i_w_op_sel,
    input  wire       i_w_clk,
    input  wire       i_w_reset
);
    wire [7:0] l_w_out;
    assign o_w_a = i_w_a;
    assign o_w_b = i_w_b;
    assign o_w_op_sel = i_w_op_sel;
    assign o_w_AN[7:4] = 4'b1111;

    // UAL module instance
    task2 l_m_task2(
        .o_w_result(l_w_out),
        .i_w_a(i_w_a),
        .i_w_b(i_w_b),
        .i_w_op_sel(i_w_op_sel)
    );

    // 7LED display for showing the output in decimal
    display_7_segment_driver
        l_m_display7LED(
            .o_r_digit_point(o_w_DP),
            .o_r_segment({o_w_CA, o_w_CB, o_w_CC, o_w_CD, o_w_CE, o_w_CF, o_w_CG}),
            .o_r_digit(o_w_AN[3:0]),
            .i_w_message({2'b00, l_w_out}),
            .i_w_clk(i_w_clk),
            .i_w_reset(i_w_reset)
        );
endmodule