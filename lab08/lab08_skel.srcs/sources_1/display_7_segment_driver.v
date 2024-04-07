`timescale 1ns / 1ps
`include "defines.vh"

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		display_7_segment_driver
// Project Name:		Laborator 8
// Target Devices: 		Digilent Nexys 7
//////////////////////////////////////////////////////////////////////////////////

module display_7_segment_driver(
		output reg o_r_digit_point,
		output reg [0:6] o_r_segment,
		output reg [3:0] o_r_digit,
		input wire [9:0] i_w_message,
		input wire i_w_reset,
		input wire i_w_clk
    );
	
	localparam DIGIT_0 		= 0;
    localparam DIGIT_1 		= 1;
    localparam DIGIT_2 		= 2;
    localparam DIGIT_3 		= 3;
	localparam DIGIT_0_OFF 	= 4;
	localparam DIGIT_0_ON 	= 5;
	localparam DIGIT_0_WAIT = 6;
	localparam DIGIT_1_OFF	= 7;
	localparam DIGIT_1_ON 	= 8;
	localparam DIGIT_1_WAIT = 9;
	localparam DIGIT_2_OFF 	= 10;
	localparam DIGIT_2_ON 	= 11;
	localparam DIGIT_2_WAIT = 12;
	localparam DIGIT_3_OFF 	= 13;
	localparam DIGIT_3_ON 	= 14;
	localparam DIGIT_3_WAIT = 15;

	reg [9:0] l_r_state_timer;
	reg [7:0] l_r_message_buffer;
	reg [3:0] l_r_digit_buffer;
	
	reg [3:0] l_r_current_state;
	reg [3:0] l_r_next_state;
	
	always @(posedge i_w_clk) begin
		if (i_w_reset) begin
			l_r_current_state <= DIGIT_0;
			l_r_state_timer <= 0;
		end else begin
			if (l_r_state_timer == 1000) begin
				l_r_state_timer <= 0;
				l_r_current_state <= l_r_next_state;
			end else
				l_r_state_timer <= l_r_state_timer + 10'd1;
		end
	end
	
	always @(*) begin
		o_r_digit_point = `POINT_OFF;
		l_r_digit_buffer = `DIGIT_DEFAULT_VALUE;
		o_r_digit = `DIGIT_DEFAULT;
		o_r_segment = `SEGMENT_DEFAULT;
		if (i_w_message[8])
			l_r_message_buffer = 8'd255 - i_w_message[7:0] + 8'd1;
		else
			l_r_message_buffer = i_w_message[7:0];
		
		case (l_r_current_state)
			DIGIT_0: begin
				l_r_next_state = DIGIT_0_ON;
				
				if (!i_w_message[8] || i_w_message[9])
					l_r_next_state = DIGIT_0_OFF;
				else if (i_w_message[8] && l_r_message_buffer[7:0] == 0)
					l_r_next_state = DIGIT_0_WAIT;
			end
			
			DIGIT_0_ON: begin
				o_r_digit = `DIGIT_0;
				display(`DASH);
				l_r_next_state = DIGIT_1;
			end
			
			DIGIT_0_OFF: begin
				o_r_digit = `DIGIT_0;
				display(`DIGIT_OFF);
				l_r_next_state = DIGIT_1;
			end
			
			DIGIT_0_WAIT: begin
				o_r_digit = `DIGIT_0;
				display(`A_CHAR);
				l_r_next_state = DIGIT_1_WAIT;
			end
			
			DIGIT_1: begin
				l_r_next_state = DIGIT_1_ON;
				
				l_r_digit_buffer = (l_r_message_buffer[7:0] / 100) % 10;
				if (l_r_digit_buffer == 0 || i_w_message[9])
					l_r_next_state = DIGIT_1_OFF;
			end
			
			DIGIT_1_ON: begin
				o_r_digit = `DIGIT_1;
				l_r_digit_buffer = (l_r_message_buffer[7:0] / 100) % 10;
				display(l_r_digit_buffer);
				l_r_next_state = DIGIT_2;
			end
			
			DIGIT_1_OFF: begin
				o_r_digit = `DIGIT_1;
				display(`DIGIT_OFF);
				l_r_next_state = DIGIT_2;
			end
			
			DIGIT_1_WAIT: begin
				o_r_digit = `DIGIT_1;
				display(`P_CHAR);
				l_r_next_state = DIGIT_2_WAIT;
			end
			
			DIGIT_2: begin
				l_r_next_state = DIGIT_2_ON;
				
				l_r_digit_buffer = (l_r_message_buffer[7:0] / 100) % 10;
				if (l_r_digit_buffer == 0) begin
					l_r_digit_buffer = (l_r_message_buffer[7:0] / 10) % 10;
					if (l_r_digit_buffer == 0 || i_w_message[9])
					l_r_next_state = DIGIT_2_OFF;
				end
			end
			
			DIGIT_2_ON: begin
				o_r_digit = `DIGIT_2;
				l_r_digit_buffer = (l_r_message_buffer[7:0] / 10) % 10;
				display(l_r_digit_buffer);
				l_r_next_state = DIGIT_3;
			end
			
			DIGIT_2_OFF: begin
				o_r_digit = `DIGIT_2;
				display(`DIGIT_OFF);
				l_r_next_state = DIGIT_3;
			end
						
			DIGIT_2_WAIT: begin
				o_r_digit = `DIGIT_2;
				display(`A_CHAR);
				l_r_next_state = DIGIT_3_WAIT;
			end
			
			DIGIT_3: begin			
				l_r_next_state = DIGIT_3_ON;
				
				if (i_w_message[9])
					l_r_next_state = DIGIT_3_OFF;
			end
			
			DIGIT_3_ON: begin
				o_r_digit = `DIGIT_3;
				l_r_digit_buffer = l_r_message_buffer[7:0] % 10;
				display(l_r_digit_buffer);
				l_r_next_state = DIGIT_0;
			end
			
			DIGIT_3_OFF: begin
				o_r_digit = `DIGIT_3;
				display(`DIGIT_OFF);
				l_r_next_state = DIGIT_0;
			end
							
			DIGIT_3_WAIT: begin
				o_r_digit = `DIGIT_3;
				display(`S_CHAR);
				l_r_next_state = DIGIT_0;
			end
			
			default: begin
				o_r_segment = `SEGMENT_ERROR;
				o_r_digit = `DIGIT_ERROR;
				l_r_next_state = DIGIT_0;
			end
		endcase
	end
	
	task display;
        input [3:0] number;
		
        begin
            case (number)
                0: o_r_segment = 7'b0000001;
                1: o_r_segment = 7'b1001111;
                2: o_r_segment = 7'b0010010;
                3: o_r_segment = 7'b0000110;
                4: o_r_segment = 7'b1001100;
                5: o_r_segment = 7'b0100100;
                6: o_r_segment = 7'b0100000;
                7: o_r_segment = 7'b0001111;
                8: o_r_segment = 7'b0000000;
                9: o_r_segment = 7'b0000100;
			   10: o_r_segment = 7'b1111110; // -
			   11: o_r_segment = 7'b0011000; // P
			   12: o_r_segment = 7'b0001000; // R
          default: o_r_segment = 7'b1111111;
            endcase
        end
    endtask
endmodule
