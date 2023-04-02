`timescale 1ns / 1ps
module ex2(
	output reg [7:0] o_r_out,
	input wire       i_w_reset,
	input wire       i_w_clk
);

	localparam STATE_INITIAL = 0;
	localparam STATE_T00 = 1;
	localparam STATE_T01 = 2;
	localparam STATE_T02 = 3;
	localparam STATE_T03 = 4;
	localparam STATE_T04 = 5;
	localparam STATE_T05 = 6;
	localparam STATE_T06 = 7;
	localparam STATE_T07 = 8;
	localparam STATE_T08 = 9;
	localparam STATE_T09 = 10;
	localparam STATE_T10 = 11;
	localparam STATE_T11 = 12;
	localparam STATE_T12 = 13;
	localparam STATE_T13 = 14;
	localparam STATE_T14 = 15;

	// INFO: Folositi l_r_counter pentru a intarzia tranzitiile intre stari
	//       cu o secunda.
	reg [31:0] l_r_counter;
	reg [3:0]  l_r_currentState;
	reg [3:0]  l_r_nextState;

	always @(posedge i_w_clk) begin
		if (i_w_reset) begin
			l_r_counter <= 0;
			l_r_currentState <= STATE_INITIAL;
		end else begin
			// TODO: Efectuati tranzitia in starea urmatoare dupa o secunda.
			
		end
	end

	always @(*) begin
		case (l_r_currentState)
			//TODO: stabiliti output-ul pentru fiecare stare
			//si legati starile intre ele prin tranzitii
			STATE_INITIAL: begin
				// o_r_out <= TODO;
				// l_r_nextState <= TODO;
			end
			STATE_T00: begin
			
			end
			STATE_T01: begin
			
			end
			STATE_T02: begin
			
			end
			STATE_T03: begin
			
			end
			STATE_T04: begin
			
			end
			STATE_T05: begin
			
			end
			STATE_T06: begin
			
			end
			STATE_T07: begin
			
			end
			STATE_T08: begin
			
			end
			STATE_T09: begin
			
			end
			STATE_T10: begin
			
			end
			STATE_T11: begin
			
			end
			STATE_T12: begin
			
			end
			STATE_T13: begin
			
			end
			STATE_T14: begin
			
			end
		endcase
	end
endmodule
