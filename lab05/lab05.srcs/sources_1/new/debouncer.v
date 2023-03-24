module debouncer(
    output reg o_r_button_out,
    input      i_w_clk,
    input      i_w_reset,
    input      i_w_button_in
    );

    reg [15:0] l_r_count;
    reg        l_r_button_tmp;

    always @(posedge i_w_clk) begin
        if (i_w_reset == 1) begin
            l_r_count <= 0;
            l_r_button_tmp <= 0;
            o_r_button_out <= 0;
        end else begin
            l_r_count <= l_r_count + 1;
            l_r_button_tmp <= i_w_button_in;

            if (l_r_count == 0) begin
                o_r_button_out <= l_r_button_tmp;
            end
        end
    end
endmodule