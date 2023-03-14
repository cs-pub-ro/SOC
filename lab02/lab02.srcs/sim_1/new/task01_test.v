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
    // Inputs
    reg in1, in2;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    task01 uut (
        // TODO: legati intrarile si iesirile la porturile corespunzatoare
    );

    initial begin
        // Initialize Inputs
        in1 = 0;
        in2 = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here
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
