`timescale 1ns / 1ps

module display7LED#(
    parameter DELAY_BIT = 5'd6 //FPGA
)(
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
    input wire i_w_reset,
    input wire[15:0] i_w_value
);
    localparam STATE_0 = 0;
    localparam STATE_1 = 1;
    localparam STATE_2 = 2;
    localparam STATE_3 = 3;

    reg [1:0]   l_r_currentState;
    reg [1:0]   l_r_nextState;

    reg [31:0]  l_r_delay;

    reg l_r_AN0;
    reg l_r_AN1;
    reg l_r_AN2;
    reg l_r_AN3;
    reg l_r_AN4;
    reg l_r_AN5;
    reg l_r_AN6;
    reg l_r_AN7;
    reg l_r_CA;
    reg l_r_CB;
    reg l_r_CC;
    reg l_r_CD;
    reg l_r_CE;
    reg l_r_CF;
    reg l_r_CG;
    reg l_r_DP;


    always @(posedge i_w_clk) begin
        if (i_w_reset) begin
            l_r_currentState <= STATE_0;
            l_r_delay <= 0;
        end else begin
            // Prevent bleeding effect.
            if (l_r_delay[DELAY_BIT]) begin
                l_r_currentState <= l_r_nextState;
                l_r_delay <= 0;
            end else begin
                l_r_delay <= l_r_delay + 1;
            end
        end
    end

    always @(*) begin
        case (l_r_currentState)
            STATE_0: begin
                l_r_AN0 = 1;
                l_r_AN1 = 1;
                l_r_AN2 = 1;
                l_r_AN3 = 0;
                l_r_AN4 = 1;
                l_r_AN5 = 1;
                l_r_AN6 = 1;
                l_r_AN7 = 1;
                t_display(i_w_value / 1000);
                l_r_nextState = STATE_1;
            end

            STATE_1: begin
                l_r_AN0 = 1;
                l_r_AN1 = 1;
                l_r_AN2 = 0;
                l_r_AN3 = 1;
                l_r_AN4 = 1;
                l_r_AN5 = 1;
                l_r_AN6 = 1;
                l_r_AN7 = 1;
                t_display((i_w_value / 100) % 10);
                l_r_nextState = STATE_2;
            end

            STATE_2: begin
                l_r_AN0 = 1;
                l_r_AN1 = 0;
                l_r_AN2 = 1;
                l_r_AN3 = 1;
                l_r_AN4 = 1;
                l_r_AN5 = 1;
                l_r_AN6 = 1;
                l_r_AN7 = 1;
                t_display((i_w_value / 10) % 10);
                l_r_nextState = STATE_3;
            end

            STATE_3: begin
                l_r_AN0 = 0;
                l_r_AN1 = 1;
                l_r_AN2 = 1;
                l_r_AN3 = 1;
                l_r_AN4 = 1;
                l_r_AN5 = 1;
                l_r_AN6 = 1;
                l_r_AN7 = 1;
                t_display(i_w_value % 10);
                l_r_nextState = STATE_0;
            end
        endcase
    end

    assign o_w_AN0 = l_r_AN0;
    assign o_w_AN1 = l_r_AN1;
    assign o_w_AN2 = l_r_AN2;
    assign o_w_AN3 = l_r_AN3;
    assign o_w_AN4 = l_r_AN4;
    assign o_w_AN5 = l_r_AN5;
    assign o_w_AN6 = l_r_AN6;
    assign o_w_AN7 = l_r_AN7;
    assign o_w_CA = l_r_CA;
    assign o_w_CB = l_r_CB;
    assign o_w_CC = l_r_CC;
    assign o_w_CD = l_r_CD;
    assign o_w_CE = l_r_CE;
    assign o_w_CF = l_r_CF;
    assign o_w_CG = l_r_CG;
    assign o_w_DP = l_r_DP;


    task t_display;
        input   [15:0]  i_w_digit;
        begin
            case (i_w_digit)
                0: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 0;
                    l_r_CF = 0;
                    l_r_CG = 1;
                    l_r_DP = 1;
                end

                1: begin
                    l_r_CA = 1;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 1;
                    l_r_CE = 1;
                    l_r_CF = 1;
                    l_r_CG = 1;
                    l_r_DP = 1;
                end

                2: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 1;
                    l_r_CD = 0;
                    l_r_CE = 0;
                    l_r_CF = 1;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                3: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 1;
                    l_r_CF = 1;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                4: begin
                    l_r_CA = 1;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 1;
                    l_r_CE = 1;
                    l_r_CF = 0;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                5: begin
                    l_r_CA = 0;
                    l_r_CB = 1;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 1;
                    l_r_CF = 0;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                6: begin
                    l_r_CA = 0;
                    l_r_CB = 1;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 0;
                    l_r_CF = 0;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                7: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 1;
                    l_r_CE = 1;
                    l_r_CF = 1;
                    l_r_CG = 1;
                    l_r_DP = 1;
                end

                8: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 0;
                    l_r_CF = 0;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                9: begin
                    l_r_CA = 0;
                    l_r_CB = 0;
                    l_r_CC = 0;
                    l_r_CD = 0;
                    l_r_CE = 1;
                    l_r_CF = 0;
                    l_r_CG = 0;
                    l_r_DP = 1;
                end

                default: begin
                    l_r_CA = 1;
                    l_r_CB = 1;
                    l_r_CC = 1;
                    l_r_CD = 1;
                    l_r_CE = 1;
                    l_r_CF = 1;
                    l_r_CG = 1;
                    l_r_DP = 1;
                end
            endcase
        end
    endtask
endmodule
