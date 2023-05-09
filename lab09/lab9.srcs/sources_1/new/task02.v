`timescale 1ns / 1ps

//Instruction memory
module task02(
    output	wire	[15:0]	o_w_data,   //here goes the instruction 
	input	wire	[7:0]	i_w_address,//here comes the program counter
	input	wire	i_w_clk
);
    localparam NONE_OPERATION  = 5'd0;
    localparam AND_OPERATION   = 5'd1;
    localparam XOR_OPERATION   = 5'd2;
    localparam OR_OPERATION    = 5'd3;
    localparam NEG_OPERATION   = 5'd4;
    localparam ADD_OPERATION   = 5'd5;
    localparam SUB_OPERATION   = 5'd6;
    localparam MUL_OPERATION   = 5'd7;
    localparam DIV_OPERATION   = 5'd8;
    localparam MOD_OPERATION   = 5'd9;

    // 16-bit instruction
    reg [15:0] l_r_data;
 
    // First bit marks if it's a ALU operation (1 if TRUE)
    // Next 5-bits represent the operation
    // Next 5-bits represent the register of the first operand
    // Last 5-bits represent the register of the second operand

    // We will take in consideration only ALU operations
    // The operation's result is stored in the first operand register
    // e.g. 16'b1_00001_00000_00010 -> ADD R[0] R[2] ---> R[0] <- R[0] + R[1]
	always @(negedge i_w_clk) begin
		case (i_w_address)
            //XOR R[0] R[1]      R[0] <- 0x0001 
			8'd0:	l_r_data = {1'b1, XOR_OPERATION,	5'd0, 5'd1};
            //AND R[2] R[3]      R[2] <- 0x0002
			8'd1:	l_r_data = {1'b1, AND_OPERATION,	5'd2, 5'd3};
            //OR R[4] R[5]       R[4] <- 0x0005
			8'd2:	l_r_data = {1'b1, OR_OPERATION,     5'd4, 5'd5};
            //NEG R[6]           R[6] <- 0xFFFA
			8'd3:	l_r_data = {1'b1, NEG_OPERATION,	5'd6, 5'd1};
            //ADD R[7] R[8]      R[7] <- 0x000F
			8'd4:	l_r_data = {1'b1, ADD_OPERATION,	5'd7, 5'd8};
            //SUB R[7] R[2]      R[7] <- 0x000D
			8'd5:	l_r_data = {1'b1, SUB_OPERATION,	5'd7, 5'd2};
            //MOD R[7] R[2]      R[7] <- 0x0001
			8'd6:	l_r_data = {1'b1, MOD_OPERATION,	5'd7, 5'd2};
            //DIV R[20] R[2]     R[20] <- 0x000A
			8'd7:	l_r_data = {1'b1, DIV_OPERATION,	5'd20, 5'd2};
            //MUL R[4] R[2]      R[4] <- 0x000A
			8'd8:	l_r_data = {1'b1, MUL_OPERATION,	5'd4, 5'd2};
            //DIV R[6] R[4]      R[6] <- 0x1999
			8'd9:	l_r_data = {1'b1, DIV_OPERATION,	5'd6, 5'd4};
            //ADD R[0] R[7]      R[0] <- 0x0002
			8'd10:	l_r_data = {1'b1, ADD_OPERATION,	5'd0, 5'd7};
            //ADD R[4] R[6]      R[4] <- 0x19A3
			8'd11:	l_r_data = {1'b1, ADD_OPERATION,	5'd4, 5'd6};
            //ADD R[2] R[20]     R[2] <- 0x000C
			8'd12:	l_r_data = {1'b1, ADD_OPERATION,	5'd2, 5'd20};
            //ADD R[0] R[4]      R[0] <- 0x19A5
			8'd13:	l_r_data = {1'b1, ADD_OPERATION,	5'd0, 5'd4};
            //ADD R[0] R[2]      R[0] <- 0x19B1
			8'd14:	l_r_data = {1'b1, ADD_OPERATION,	5'd0, 5'd2};

			default:	l_r_data =  {1'b0, NONE_OPERATION,	5'd0, 5'd0};
		endcase
	end

    assign o_w_data = l_r_data;
endmodule
