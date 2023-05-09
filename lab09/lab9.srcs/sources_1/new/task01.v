`timescale 1ns / 1ps

module task01(
    output wire [15:0] o_w_register_0,
    output wire [7:0] o_w_program_counter,
    input wire [15:0] i_w_instruction,
    input wire i_w_clk,
    input wire i_w_reset
);
    //CPU STATES
    localparam STATE_RESET  = 3'd0;
    localparam STATE_IF     = 3'd1;
    localparam STATE_ID     = 3'd2;
    localparam STATE_EX     = 3'd3;
    localparam STATE_MEM    = 3'd4;
    localparam STATE_WB     = 3'd5;

    //register for current state and next state
    reg[2:0] l_r_currentState;
    reg[2:0] l_r_nextState;

    // TODO: implement state transition logic
    always @(posedge i_w_clk or posedge i_w_reset) begin
		if (i_w_reset) begin
            
		end else begin
            
		end
	end

    // TODO: next state computation 
    always @(*) begin
		case (l_r_currentState)
//		    STATE_RESET: l_r_nextState = ;
//		    STATE_IF: l_r_nextState = ;
//		     ...
            default : l_r_nextState = STATE_RESET;
		endcase
	end

    // REGISTER FILE -- general registers
	reg	[15:0]	  	l_r_registers[31:0];
	integer		i;
    
    //  initialize registers
	always @(posedge i_w_reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			l_r_registers[i] <= i;
		end
	end

    // R[0] used for debugging 
    // DEBUG: add o_w_register_0 to the Wave Window 
    assign o_w_register_0 = l_r_registers[0];

    // **IF state** START
    // PROGRAM COUNTER register
    reg [7:0] r_l_program_counter;

    // Send the current program counter to instruction memory to get current instruction
    assign o_w_program_counter = r_l_program_counter;

    // TODO: compute next program counter on WB State (you need it before IF)
    always @(posedge i_w_clk or posedge i_w_reset) begin
		if (i_w_reset) begin
            
		end else begin
            
		end
	end
    // **IF state** END

    // **ID state** START
    // wires to decode operands' adresses and operation
    wire[4:0] l_w_op1;
    wire[4:0] l_w_op2;
    wire[4:0] l_w_op_sel;

    //TODO: use decoder module to find the operands' adresses and opsel
    

    //ALU input values
    wire[15:0] l_w_alu_a;
    wire[15:0] l_w_alu_b;
    wire[4:0] l_w_alu_op_sel;

    //TODO: get a, b, op_sel
    // a <- register[op1]
    // b <- register[op2]

    //WB adress
    wire[4:0] l_w_wb_adress;

    //TODO: WB adress is the first operand adress
    
    // **ID state** END

    
    // **EX state** START
    //define alu_result
    wire[15:0] l_w_alu_result;

    //TODO: use alu module to get the result of the operation
    
    // **EX state** END

    
    // **MEM state** START

    // curently no instruction uses memory
    
    // **MEM state** END

    
    // **WB state** START

    // TODO: if the current state is WB and we have a valid alu operation
    // write the result of alu in the first operand register
    always @(l_r_currentState) begin
		 if(l_r_currentState == STATE_WB) begin
             
		 end
	end
    // **WB state** END
endmodule
