`timescale 1ns / 1ps

module display_7seg(
    input refresh_fq,
    input reset,
    input[3:0] BCD0,
    input[3:0] BCD1,
    input[3:0] BCD2,
    input[3:0] BCD3,
    output reg[7:0] AN, // 7:4 will be set as 1 (off) -- if we dont set them, they'll be 0 (on) and most likely bleed
    output reg[7:0] SEG
    );
    
    reg[3:0] curr_BCD;
    reg[1:0] state;
    
    always @(posedge refresh_fq) begin
        if (reset) begin
            state = 0;
            AN[7:0] = 8'b11111111;
        end else begin    
            AN[7:4] = 4'b1111;
            
            // refreshing through the segments (if we dont, we cant display different digits)
            case (state)
            // TODO: implement corresponding BCD for each AN
//                2'b00: { curr_BCD, AN[3:0] } = {  };
//                2'b01: { curr_BCD, AN[3:0] } = {  };
//                2'b10: { curr_BCD, AN[3:0] } = {  };
//                2'b11: { curr_BCD, AN[3:0] } = {  };
            endcase
                
            case (curr_BCD)

                default : SEG[6:0] = 7'b1111111; // off
            endcase 
            
            // TODO: implement . between AN[2] and AN[1]
                
            state = state + 1;
        end
    end
endmodule