`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: SOC Team @ UPB
//
// Design Name: XOR Gate
// Module Name: task01_test
// Project Name: Laborator 2
// Target Devices: XC7A100T-1CSG324C
// Tool Versions: 2017.4
// Description: ex1 / lab02
//
// Dependencies:
//
// Revision:
// Revision 2023.03.10 - File Created
//////////////////////////////////////////////////////////////////////////////////

module task01_test;
    // Input
    reg in1, in2;

    // Output
    wire out;

    // Initializare Unit Under Test (UUT)
    task01 uut (
        // TODO: legati intrarile si iesirile la porturile corespunzatoare
    );

    initial begin
        // Initializare Input
        in1 = 0;
        in2 = 0;

        // Asteapta 100ns
        #100;

        in1 = 0;
        in2 = 1;
        
        #100;
        
        in1 = 1;
        in2 = 0;
        
        #100;
        
        in1 = 1;
        in2 = 1;
    end
endmodule
