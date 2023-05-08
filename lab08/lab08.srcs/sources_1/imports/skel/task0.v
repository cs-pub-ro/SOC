`timescale 1ns / 1ps
module task0(
    output wire [7:0] o_w_out,
    input wire [3:0] i_w_M,
    input wire [3:0] i_w_R
);

    //TODO:  Implement Booth's algorithm
    wire [3:0] l_w_neg_M;
    assign l_w_neg_M = ~i_w_M + 1;

    reg [8:0] l_r_P;
    reg [8:0] l_r_A;
    reg [8:0] l_r_S;

    always @(*) begin
        // TODO1: calculate P,A and S
        l_r_P = ;
        l_r_A = ;
        l_r_S = ;
        // TODO2: repeat the algorithm N times
        repeat(4) begin
            case (l_r_P[1:0])
                2'b00 : l_r_P = ;
                2'b01 : l_r_P = ;
                2'b10 : l_r_P = ;
                2'b11 : l_r_P = ;
                default : l_r_P = l_r_P;
            endcase
            //TODO3: right arithmetic shift
            l_r_P =;
        end
    end

    // TODO4: assign in o_w_out the product of M and R
    assign o_w_out = ;
endmodule