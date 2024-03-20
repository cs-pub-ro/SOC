`timescale 1ns / 1ps

module basicFSM_tb;
    reg [0 : 15] sequence = 16'b1001100101100110;
    reg l_r_reset;
    reg l_r_clk;
    reg l_r_in = 0;

    //Outputs
    wire l_w_out;

    //Module initialization
    basicFSM fsm(
        l_w_out,
        l_r_reset,
        l_r_clk,
        l_r_in
        );
    
    always #5 l_r_clk = ~l_r_clk;
    
    initial begin
        l_r_clk = 0;
        l_r_reset = 1;
        #10
        l_r_reset = 0;
        
        for (integer i = 0; i < 16; i = i + 1) begin
            @(posedge l_r_clk) l_r_in = sequence[i];
        end
        #10
        $finish;
    end

endmodule
