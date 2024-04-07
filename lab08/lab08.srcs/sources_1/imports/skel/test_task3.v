`timescale 1ns / 1ps
module test_task3;
    //Inputs
    reg[3:0] l_r_a;
    reg[3:0] l_r_b;
    reg[2:0] l_r_sel;
    reg l_r_clk;
    reg l_r_reset;

    //Outputs
    wire [7:0] l_w_out;

    //local variables for loop
    integer i,j,k;

    //UUT initialization
    task3 #(.BOUNCE(5'd2)) l_m_task3(
        .o_w_out(l_w_out),
        .i_w_a(l_r_a),
        .i_w_b(l_r_b),
        .i_w_op_sel(l_r_sel),
        .i_w_clk(l_r_clk),
        .i_w_reset(l_r_reset)
        );


    //CLK simulation
    always #5 l_r_clk = ~l_r_clk;
    //Simulation tests
    initial begin
        //wave files
        //$dumpfile("test.vcd");
        // dumpp all variables
        //$dumpvars;
        // monitor varibles changes in values
        $monitor(
            "Time = %0t, ", $time,
            "l_w_out=%0d, ", l_w_out,
            "l_r_a=%0d, ", l_r_a,
            "l_r_b=%0d, ", l_r_b,
            "l_r_sel=%0d, ", l_r_sel,
            "l_r_reset=%0d, ", l_r_reset
            );

        l_r_clk = 0;
        l_r_reset = 1;
        l_r_in = 0;
        #10;
        l_r_reset = 0;

        #10;
        for(i=0;i<16;i=i+1)
        begin
            l_r_a = i;
            for(j=0;j<16;j=j+1)
            begin
                l_r_b = j;
                for(k=0;k<8;k=k+1)
                begin
                    l_r_sel = k;
                    #10;
                end
            end
        end
        //finish the simulation
        $finish;
    end
endmodule