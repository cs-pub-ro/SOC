`timescale 1ns / 1ps

module task11(
    output wire [15:0] o_w_register_0,
    output wire [7:0] o_w_program_counter,
    input wire [15:0] i_w_instruction,
    input wire i_w_clk,
    input wire i_w_reset
    );
    
    //No more separate CPU STATES 
    //We have to transfer data from a stage to another stage
    
    // IF -> ID: instruction
    reg[15:0] l_r_instruction_ID;
   
    // ID -> EX: alu_a, alu_b, alu_opsel, wb_adress(for WB)
    reg[31:0] l_r_alu_a_EX;
    reg[31:0] l_r_alu_b_EX;
    reg[4:0] l_r_alu_op_sel_EX;
    reg[4:0] l_r_wb_adress_EX;
 
    // EX -> MEM: alu_result, wb_adress, alu_opsel
    reg[31:0] l_r_alu_result_MEM;
    reg[4:0] l_r_wb_adress_MEM;
    reg[4:0] l_r_alu_op_sel_MEM;

    // MEM -> WB: alu_result, wb_adress, alu_opsel
    reg[31:0] l_r_alu_result_WB;
    reg[4:0] l_r_wb_adress_WB;
    reg[4:0] l_r_alu_op_sel_WB;

    //TODO: every cycle update the registers' values mentioned above
    always @(posedge i_w_clk or posedge i_w_reset) begin
		if (i_w_reset) begin

		end else begin
		    // Each stage receives data from the previous one
            // IF -> ID
            
            // ID -> EX
            
            // EX -> MEM
            
            // MEM -> WB
            
		end
	end

    // REGISTER FILE -- general registers
	reg	[15:0]	  	l_r_registers[31:0];

    // R[0] used for debugging 
    // DEBUG: add o_w_register_0 to the Wave Window 
    assign o_w_register_0 = l_r_registers[0];

    // **IF state** START
    // PROGRAM COUNTER register
    reg [7:0] r_l_program_counter;
    // Send the current program counter to instruction memory to get current instruction
    assign o_w_program_counter = r_l_program_counter;

    // DEBUG: registers for every stage
    reg [7:0] r_l_program_counter_IF;
    reg [7:0] r_l_program_counter_ID;
    reg [7:0] r_l_program_counter_EX;
    reg [7:0] r_l_program_counter_MEM;
    reg [7:0] r_l_program_counter_WB;

    // TODO: compute next program counter every cycle
    always @(posedge i_w_clk or posedge i_w_reset) begin
		if (i_w_reset) begin
			r_l_program_counter <= 0;
            r_l_program_counter_IF <= 0;
            r_l_program_counter_ID <= 0;
            r_l_program_counter_EX <= 0;
            r_l_program_counter_MEM <= 0;
            r_l_program_counter_WB <= 0;
		end else begin
            //TODO: update r_l_program_counter

            // DEBUG every instruction goes to next stage
            r_l_program_counter_IF <= r_l_program_counter + 1; 
            r_l_program_counter_ID <= r_l_program_counter_IF;
            r_l_program_counter_EX <= r_l_program_counter_ID;
            r_l_program_counter_MEM <= r_l_program_counter_EX;
            r_l_program_counter_WB <= r_l_program_counter_MEM;
		end
	end
    // **IF state** END

    // **ID state** START
    // wires used to decode operands' adresses and operation
    wire[4:0] l_w_op1;
    wire[4:0] l_w_op2;
    wire[4:0] l_w_op_sel;

    //TODO: use decoder module to find operands' adresses and opsel
    

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

	integer		i;

    // TODO: if the current instruction is a valid alu operation
    // write the result of alu in the first operand register
    always @(posedge i_w_clk or posedge i_w_reset) begin
		if (i_w_reset) begin
		    //  initialize registers
            for (i = 0; i < 32; i = i + 1) begin
                l_r_registers[i] <= i;
            end
		end else begin
            // TODO
		end
	end
    // **WB state** END
endmodule
