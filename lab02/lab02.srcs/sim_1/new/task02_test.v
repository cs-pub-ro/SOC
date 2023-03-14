`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: SOC Team @ UPB
//
// Design Name: Demultiplexer 1:4
// Module Name: task02_test
// Project Name: Laborator 2
// Target Devices: XC7A100T-1CSG324C
// Tool Versions: 2017.4
// Description: ex2 / lab02
//
// Dependencies:
//
// Revision:
// Revision 2023.03.10 - File Created
//////////////////////////////////////////////////////////////////////////////////

module task02_test;
    // Inputs
    reg [1:0] sel;
    reg in;
    
    // Outputs
    wire [3:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    task02 uut (
        // TODO: legati intrarile si iesirile la porturile corespunzatoare
        );
    
    initial begin
        // Initialize Inputs
        sel = 0;
        in = 0;
        
        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        in = 1;
        
        #100 sel = 1;
        #100 sel = 2;
        #100 sel = 3;
    end
endmodule
