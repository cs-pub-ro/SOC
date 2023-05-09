`timescale 1ns / 1ps

module decoder(
    output wire[4:0] o_w_op1,        // first operand
    output wire[4:0] o_w_op2,        // second operand
    output wire[4:0] o_w_op_sel,     // opcode
    input wire[15:0] i_w_instruction // instruction 
);

    //local registers
    reg[4:0] l_r_op1;
    reg[4:0] l_r_op2;
    reg[4:0] l_r_op_sel;

    //  decode 16-bits instruction
    always @(*) begin
        // is an ALU operation (MSB is 1)
        if(i_w_instruction[15]) begin
            l_r_op_sel = i_w_instruction[14:10];// get operation(opcode)
            l_r_op1 = i_w_instruction[9:5];     // get first operand
            l_r_op2 = i_w_instruction[4:0];     // get second operand
        end else begin
            l_r_op_sel = 5'b00000;
            l_r_op1 = 5'bzzzzz;
            l_r_op2 = 5'bzzzzz;
        end
    end

    //assign output wires
    assign o_w_op_sel = l_r_op_sel;
    assign o_w_op1 = l_r_op1;
    assign o_w_op2 = l_r_op2;
endmodule
