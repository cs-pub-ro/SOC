module ex4(
	output reg o_r_mutant,
	input wire i_w_A,
	input wire i_w_G,
	input wire i_w_C,
	input wire i_w_T,
	input wire i_w_reset,
	input wire i_w_clk
);

	// INFO: Spre deosebire de celelalte FSM-uri din laborator,
	//       acesta are scopul de a identifica un pattern.
	//
	//       Asadar ne dorim sa inregistram progresul pe care
	//       il realizam cu fiecare intrare care contribuie la 
	//       o secventa completa. (ex. "GGTC")

	// INFO: FSM-ul trebuie sa fie mereu pregatit sa
	//       primeasca valori pe intrari, fie ele corecte sau gresite.
	//       Asadar va trebui sa gestionati corectitudinea
	//       secventei primite prin tranzitii in starile potrivite.
	//       (trebuie sa intrerupeti sau sa continuati secventa primita)

	// TODO: Definiti cate un parametru pentru fiecare
	//       stare necesara.
	localparam STATE_0 = 0;
	

	reg [2:0] l_r_currentState;

	// TODO: Pregatiti semnalul primit de la butoane.
	
	

	always @(posedge i_w_clk) begin
		if (i_w_reset) begin
			l_r_currentState <= STATE_0;
			o_r_mutant <= 0;
		end else begin
			case (l_r_currentState)
				STATE_0: begin
					// TODO: Tratati fiecare intrare posibila si
               //       analizati in ce stare trebuie sa tranzitionati
					//       in functie de ce nucleotida a fost introdusa.
					//
					// HINT: Verificati l_r_*button*_debounced
					
					// if (l_r_*button*_debounced) begin
					//	  l_r_currentState <= TODO;
					// end
					
				end

				default: begin
					o_r_mutant <= 1'bx;
					l_r_currentState <= STATE_0;
				end
			endcase
		end
	end
endmodule
