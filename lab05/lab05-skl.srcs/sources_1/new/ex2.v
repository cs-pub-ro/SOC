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

    // Display your date and month of birth (e.g. 24.06)
    always @(*) begin
        case (l_r_currentState)
            STATE_0: begin
                // TODO: FIRST digit (e.g. "2" -> 24.06)
            end

            STATE_1: begin
                // TODO: SECOND digit (e.g. "4")
                // Don't forget to separate the day and month!
            end

            STATE_2: begin
                // TODO: THIRD digit (e.g. "0")
            end

            STATE_3: begin
                // TODO: FOURTH digit (e.g. "6")
            end
        endcase
    end    
endmodule
