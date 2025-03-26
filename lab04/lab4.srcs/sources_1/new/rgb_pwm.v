`timescale 1ns / 1ps
`define COLOR_NONE 3'b000

// RGB LED module with PWM brightness control
module rgb_pwm(
    output reg [2:0] o_r_out,
    input [2:0] i_w_in,
    input i_w_clk
);

    // PWM configs
    reg [7:0] l_r_pwm_counter;
    parameter PWM_MAX = 255;    // Set PWM period (255 cycles)
    parameter PWM_DUTY = 8;     // 3.14% duty cycle

    // PWM Counter Logic
    always @(posedge i_w_clk) begin
        if (l_r_pwm_counter >= PWM_MAX) begin
            l_r_pwm_counter <= 0;
        end else begin
            l_r_pwm_counter <= l_r_pwm_counter + 1;
        end
    end

    // PWM Output Control Logic
    always @(posedge i_w_clk) begin
        if (l_r_pwm_counter < PWM_DUTY) begin
            o_r_out <= i_w_in;
        end else begin
            o_r_out <= `COLOR_NONE;
        end
    end

endmodule