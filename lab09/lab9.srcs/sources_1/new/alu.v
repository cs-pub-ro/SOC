`timescale 1ns / 1ps

module alu(
    output wire[15:0] o_w_result,
    input wire[15:0] i_w_a,     // first operand
    input wire[15:0] i_w_b,     // second operand 
    input wire[3:0] i_w_op_sel  // operation (opcode)
);
    //result reg
    reg[15:0] l_r_result;
    
    //  perform operation specified by opcode on a and b
    always @(*) begin
        case(i_w_op_sel)
            //NONE
            4'd0: l_r_result = 32'dZ;
            //AND
            4'd1: l_r_result = i_w_a & i_w_b;
            //XOR
            4'd2: l_r_result = i_w_a ^ i_w_b;
            //OR
            4'd3: l_r_result = i_w_a | i_w_b;
            //NEG
            4'd4: l_r_result = ~i_w_a + 32'd1;
            //ADD
            4'd5: l_r_result = i_w_a + i_w_b;
            //SUB
            4'd6: l_r_result = i_w_a - i_w_b;
            //MUL
            4'd7: l_r_result = i_w_a * i_w_b;
            //DIV
            4'd8: l_r_result = i_w_a / i_w_b;
            //MOD
            4'd9: l_r_result = i_w_a % i_w_b;
            default: l_r_result = 32'd0;
        endcase
    end
    
     //assign operation result
    assign o_w_result = l_r_result;
endmodule
