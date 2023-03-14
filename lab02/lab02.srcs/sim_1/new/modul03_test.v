`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: SOC Team @ UPB
//
// Design Name: NOT Gate
// Module Name: modul03_test
// Project Name: Laborator 2
// Target Devices: XC7A100T-1CSG324C
// Tool Versions: 2017.4
// Description: ex0 / lab02
//
// Dependencies:
//
// Revision:
// Revision 2023.03.10 - File Created
//////////////////////////////////////////////////////////////////////////////////

module modul03_test;
    // Inputs
    reg in;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    modul03 uut (
        .out(out),
        .in(in)
    );

    initial begin
        // Initialize Inputs
        in = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here
        in = 1;
    end
endmodule
