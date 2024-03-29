`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SOC Team @ UPB
//
// Design Name: Clock Divider
// Module Name: task03_test
// Project Name: Laborator 2
// Target Devices: XC7A100T-1CSG324C
// Tool Versions: 2017.4
// Description: ex3 / lab02
// 
// Dependencies:
//
// Revision:
// Revision 2023.03.10 - File Created
//////////////////////////////////////////////////////////////////////////////////

module task03_test;
    // Input
    reg clk_in;
    
    // Output
    wire clk_out;
    
    // Instantiere Unit Under Test (UUT)
    task03 uut (
        // TODO: legati intrarile si iesirile la porturile corespunzatoare
        );
    
    always begin
        #50 clk_in = ~clk_in;
    end
    
    initial begin
        // Initializare Input
        clk_in = 0;
        
        // Asteapta 100ns
        #100;
        
        clk_in = 1;
    end
endmodule

