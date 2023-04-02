`timescale 1ns / 1ps
module ex1(
	output reg o_r_out,
	input wire i_w_reset,
	input wire i_w_clk
);

	localparam STATE_INITIAL = 0;
	localparam STATE_T00 = 1;

	reg [31:0]  l_r_count;
	reg         l_r_currentState;
	reg         l_r_nextState;

	always @(posedge i_w_clk) begin
		if (i_w_reset == 1) begin
			// TODO: Ce se intampla daca este apasat butonul de resetare
			//       in timpul functionarii automatului?
		
		end else begin
			// TODO: Tranzitia de la l_r_currentState la l_r_nextState
		    //       dupa 1 secunda.
		   
		end
	end

	always @(*) begin
		case (l_r_currentState)
			// TODO: Pentru fiecare stare stabiliti valoare iesirii (pe model Moore)
			//       si tranzitiile in stari ulterioare.
			
		endcase
	end
endmodule
