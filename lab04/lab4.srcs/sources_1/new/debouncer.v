module debouncer(
	output reg o_r_button,
	input wire i_w_clk,
	input wire i_w_reset,
	input wire i_w_button
);

	reg [15:0] l_r_counter;
	reg l_r_button;

	always @(posedge i_w_clk) begin
		if (i_w_reset == 1) begin
			l_r_counter <= 0;
			l_r_button <= 0;
			o_r_button <= 0;
		end else begin
			l_r_counter <= l_r_counter + 1;
			l_r_button <= i_w_button;

			if (l_r_counter == 0) begin
				o_r_button <= l_r_button;
			end
		end
	end
endmodule
