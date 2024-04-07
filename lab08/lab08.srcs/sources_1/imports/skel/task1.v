`timescale 1ns / 1ps
module task1(
    output wire [3:0] o_w_quotient, //Divisor/Devidend
    output wire [3:0] o_w_remainder, //Divisor%Devidend
    input wire [3:0] i_w_divisor, //Divisor  M
    input wire [3:0] i_w_devidend //Devidend Q
);

    //TODO:  Implement division algorithm Booth non-restoring https://www.youtube.com/watch?v=KfBVg8WYOuQ

    reg [7:0] l_r_AQ;
    reg [7:0] l_r_plus_M;
    reg [7:0] l_r_minus_M;

    //TODO calculate -1 * Divisor 
    wire [3:0] l_w_neg_M;
    assign l_w_neg_M = ~i_w_divisor + 1;

    always @(*) begin
        // TODO1: 
        // A = 0; Q = Devidend; M = Divisor
        // calculate R=AQ (concat), plus M, minus M 
        l_r_AQ = ;
        l_r_plus_M = ;
        l_r_minus_M = ;
        // TODO2: repeat the algorithm N times
        repeat(4) begin
            //TODO3: if A < 0 then AQ<-AQ<<1, A<-A+M else AQ<-AQ<<1, A<-A-M
            
            
            //TODO4: if A < 0 then Q[0]<-0 else Q[0]<-1
            
            
        end
        
        //TODO5: if A < 0 -> A <- A + M
        
        
    end

    // TODO6: quotient and remainder
    assign o_w_quotient = ;
    assign o_w_remainder = ;
endmodule
