`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: SOC Team @ UPB
//
// Design Name: NOT Gate
// Module Name: modul03
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

module modul03(
    output reg out,
    input in
    );

    always @(*) begin
        out = ~in;
    end

endmodule
