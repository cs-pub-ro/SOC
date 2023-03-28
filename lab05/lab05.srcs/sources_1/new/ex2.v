module ex2(
    output reg o_r_AN0,
    output reg o_r_AN1,
    output reg o_r_AN2,
    output reg o_r_AN3,
    output reg o_r_CA,
    output reg o_r_CB,
    output reg o_r_CC,
    output reg o_r_CD,
    output reg o_r_CE,
    output reg o_r_CF,
    output reg o_r_CG,
    output reg o_r_DP,
    input      i_w_reset,
    input      i_w_clk
    );

    localparam STATE_0 = 0;
    localparam STATE_1 = 1;
    localparam STATE_2 = 2;
    localparam STATE_3 = 3;

    reg [1:0]  l_r_currentState;
    reg [1:0]  l_r_nextState;

    reg [31:0] l_r_delay;

    always @(posedge i_w_clk) begin
        if (i_w_reset) begin
            l_r_currentState <= STATE_0;
            l_r_delay <= 0;
        end else begin
            // TODO: Delay digits change to prevent bleeding
        end
    end

    always @(*) begin
        case (l_r_currentState)
            // TODO: Display digits 0123
        endcase
    end    
endmodule