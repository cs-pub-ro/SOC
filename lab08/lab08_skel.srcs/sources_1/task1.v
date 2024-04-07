`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		task1
// Project Name:		Laborator 8
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module task1(
    output wire [3:0] o_w_quotient,  // Divisor / Devidend
    output wire [3:0] o_w_remainder, // Divisor % Devidend
    input  wire [3:0] i_w_M,         // Divisor  M
    input  wire [3:0] i_w_Q          // Devidend Q
);
    // TODO: Implement division algorithm Booth non-restoring https://www.youtube.com/watch?v=KfBVg8WYOuQ

    reg [7:0] l_r_R;
    reg [7:0] l_r_M_plus;
    reg [7:0] l_r_M_minus;

    // TODO: calculate -1 * Divisor 
    wire [3:0] l_w_neg_M;
    assign l_w_neg_M = ~i_w_M + 1;

    always @(*) begin
        // TODO 1: 
        // Q = Devidend; M = Divisor
        // Calculate R = {n{1'b0}, Q}, M+, M- 
        l_r_R = 0;
        l_r_M_plus = 0;
        l_r_M_minus = 0;

        // TODO 2: Repeat the algorithm N times
        repeat(4) begin
            // TODO 3: If R < 0 then R <- R << 1, R <- R + M+ else R <- R << 1, R <- R + M-

            // TODO 4: If R < 0 then R[0] <- 0 else R[0] <- 1

        end

        // TODO 5: If R < 0 then R <- R + M+

    end

    // TODO 6: Quotient and remainder
    assign o_w_quotient = 0;
    assign o_w_remainder = 0;
endmodule
