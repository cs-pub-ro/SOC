`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		task2
// Project Name:		Laborator 8
// Target Devices: 		Digilent Artix 7
//////////////////////////////////////////////////////////////////////////////////

module task2(
    output wire [7:0] o_w_result,
    input  wire [3:0] i_w_a,
    input  wire [3:0] i_w_b,
    input  wire [2:0] i_w_op_sel
);
    // TODO 1: Define local wire and use task0 and task1 for MUL, DIV and MOD
    wire[7:0] l_w_mul;
    wire[3:0] l_w_div;
    wire[3:0] l_w_mod;

    // TODO 2: Define a result reg and implement the logic to run the operation from op_sel on a and b
    reg[7:0] l_r_result;

    always @(*) begin
        case(i_w_op_sel)
            // AND
            3'd0: l_r_result = 0;
            // XOR
            3'd1: l_r_result = 0;
            // OR
            3'd2: l_r_result = 0;
            // ADD: use opeartor +
            3'd3: l_r_result = 0;
            // SUB: use operator -
            3'd4: l_r_result = 0;
            // MUL: use result from task0
            3'd5: l_r_result = 0;
            // DIV: use result from task1
            3'd6: l_r_result = 0;
            // MOD: use result from task1
            3'd7: l_r_result = 0;
            default: l_r_result = 8'd0;
        endcase
    end

    // TODO 3: Assign o_w_result to result
    assign o_w_result = 0;
endmodule