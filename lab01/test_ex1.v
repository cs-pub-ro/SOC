`timescale 1ns / 1ps

module test_ex1;

    // Intrari.
    reg in;

    // Iesiri.
    wire out;

    // Instantiem Unit Under Test (UUT).
    ex1 uut (
        .out(out), 
        .in(in)
    );

    initial begin
        // Initializam intrarile.
        in = 0;

        // Asteptam 100 ns pentru a termina resetul global.
        #100;
        
        // Adaugam stimuli aici.
        #100 in = 1;
        #100 in = 0;
	end
      
endmodule
