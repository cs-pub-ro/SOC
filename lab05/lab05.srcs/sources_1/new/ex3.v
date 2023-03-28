module ex3(
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
    input      i_w_button,
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

    reg [15:0] l_r_value;
    
    reg        l_r_button_pressed;
    wire        l_w_button_debounced;
    
    // TODO: Instantiate switch debouncer

    always @(posedge i_w_clk) begin
        if (i_w_reset) begin
            l_r_currentState <= STATE_0;
            l_r_delay <= 0;
            l_r_value <= 0;
        end else begin
            // TODO: Increment counter
            // TODO: Delay digits change to prevent bleeding
        end
    end

    always @(*) begin
        case (l_r_currentState)
            // TODO: Display digits
        endcase
    end
    
    // A task that you can use to display any digit
    task t_display;
        input   [15:0]  i_w_digit;
        begin
            case (i_w_digit)
                // TODO: Add outputs for digits 0-3
                0: begin
                end

                1: begin
                end

                2: begin
                end

                3: begin
                end

                4: begin
                    o_r_CA = 1;
                    o_r_CB = 0;
                    o_r_CC = 0;
                    o_r_CD = 1;
                    o_r_CE = 1;
                    o_r_CF = 0;
                    o_r_CG = 0;
                    o_r_DP = 1;
                end

                5: begin
                    o_r_CA = 0;
                    o_r_CB = 1;
                    o_r_CC = 0;
                    o_r_CD = 0;
                    o_r_CE = 1;
                    o_r_CF = 0;
                    o_r_CG = 0;
                    o_r_DP = 1;
                end

                6: begin
                    o_r_CA = 0;
                    o_r_CB = 1;
                    o_r_CC = 0;
                    o_r_CD = 0;
                    o_r_CE = 0;
                    o_r_CF = 0;
                    o_r_CG = 0;
                    o_r_DP = 1;
                end

                7: begin
                    o_r_CA = 0;
                    o_r_CB = 0;
                    o_r_CC = 0;
                    o_r_CD = 1;
                    o_r_CE = 1;
                    o_r_CF = 1;
                    o_r_CG = 1;
                    o_r_DP = 1;
                end

                8: begin
                    o_r_CA = 0;
                    o_r_CB = 0;
                    o_r_CC = 0;
                    o_r_CD = 0;
                    o_r_CE = 0;
                    o_r_CF = 0;
                    o_r_CG = 0;
                    o_r_DP = 1;
                end

                9: begin
                    o_r_CA = 0;
                    o_r_CB = 0;
                    o_r_CC = 0;
                    o_r_CD = 0;
                    o_r_CE = 1;
                    o_r_CF = 0;
                    o_r_CG = 0;
                    o_r_DP = 1;
                end

                default: begin
                    o_r_CA = 1;
                    o_r_CB = 1;
                    o_r_CC = 1;
                    o_r_CD = 1;
                    o_r_CE = 1;
                    o_r_CF = 1;
                    o_r_CG = 1;
                    o_r_DP = 1;
                end
            endcase
        end
    endtask

    
endmodule