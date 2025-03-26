`timescale 1ns / 1ps

// HINT: Folositi urmatoarele constante pentru
//       a atribui culoarea LED-ului
`define COLOR_NONE 3'b000
`define COLOR_RED 3'b100
`define COLOR_YELLOW 3'b110
`define COLOR_GREEN 3'b010

module ex3(
    output [2:0] o_r_rgb_cars,  // Semnal cu PWM aplicat
    input i_w_button,
    input i_w_reset,
    input i_w_clk
);

    // TODO: Definiti starile automatului
    // localparam STATE_*** = 0; ...
    
    // Modul de debounce pentru butonul de pietoni
    reg l_r_button_pressed;
    wire l_w_button_debounced;
    debouncer l_m_db(l_w_button_debounced, i_w_clk, i_w_reset, i_w_button);
    
    reg [31:0]  l_r_count;
    reg [1:0]   l_r_currentState;
    reg [1:0]   l_r_nextState;
    
    // INFO: Blocul always va gestiona atat logica iesirilor si a tranzitiilor,
    //       cat si efectuarea tranzitiilor cu delay-urile aferente.
    //       Asadar, va trebui sa setati atat valoarea iesirii, cat si
    //       valoarea starii urmatoare l_r_nextState la momentul potrivit.
    
    // Registrul pe care il veti folosi pentru culorile semaforului
    reg [2:0]   l_r_cars;
    
    always @(posedge i_w_clk) begin
        if (i_w_reset == 1) begin
            // TODO: Setati starea si culoarea initiala
            // l_r_button_pressed <= ...
            // l_r_count <= ...
        end else begin
            // HINT: Nu uitati de incrementarea contorului
            
            if (l_w_button_debounced == 1) begin
                // TODO: Daca este apasat butonul, marcati acest lucru folosind
                //       flag-ul l_r_button_pressed si initializati timer-ul.
            end
            
            case(l_r_currentState)
                // TODO: Implementati tranzitiile intre stari
                // STATE_***: begin
                // ...                    
                // end
                
                // HINT: Nu uitati sa atribuiti starea urmatoare si
                //       sa resetati counter-ul/flag-ul butonului
                //       la momentul potrivit
            endcase
        end
    end
    
    // Diminuam intensitatea LED-ului
    rgb_pwm l_m_cars (
        .o_r_out(o_r_rgb_cars),
        .i_w_in(l_r_cars),
        .i_w_clk(i_w_clk)
    );
endmodule