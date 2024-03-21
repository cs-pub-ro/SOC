`timescale 1ns / 1ps

module basicFSM (
	output wire o_w_out,
	input wire i_w_reset,
	input wire i_w_clock,
	input wire i_w_in
);

	localparam STATE_Initial = 3'd0,
               STATE_1 = 3'd1 ,
               STATE_2 = 3'd2 ,
               STATE_3 = 3'd3 ,
               STATE_4 = 3'd4 ,
               STATE_5_PlaceHolder = 3'd5 ,
               STATE_6_PlaceHolder = 3'd6 ,
               STATE_7_PlaceHolder = 3'd7;

    reg [2:0] l_r_currentState ;
    reg [2:0] l_r_nextState ;
    
    assign o_w_out = ( l_r_currentState == STATE_4 );
    
    always@ ( posedge i_w_clock ) begin
      if ( i_w_reset ) 
        l_r_currentState <= STATE_Initial ;
      else 
        l_r_currentState <= l_r_nextState ;
    end

    // --------------------------------------------------------------------
    // Tranziție condiționată: bloc always@ ( * ) 
    // --------------------------------------------------------------------
    always@ ( * ) begin
        l_r_nextState = l_r_currentState ;
 
        case ( l_r_currentState )
            STATE_Initial : begin
                l_r_nextState = STATE_1 ;
            end
            STATE_1 : begin
                if (!i_w_in)
                    l_r_nextState = STATE_2 ;
            end
            STATE_2 : begin
                if (i_w_in)
                    l_r_nextState = STATE_3 ;
            end
            STATE_3 : begin
                if (i_w_in)
                    l_r_nextState = STATE_4 ;
                else
                    l_r_nextState = STATE_2 ;
            end
            STATE_4 : begin
                if (i_w_in)
                    l_r_nextState = STATE_1 ;
                else
                    l_r_nextState = STATE_2 ;
            end

            // Stări pentru tratarea erorilor
            // Dacă automatul ajunge în aceste stări se va reseta.
            STATE_5_PlaceHolder : begin
                l_r_nextState = STATE_Initial ;
            end
            STATE_6_PlaceHolder : begin
                l_r_nextState = STATE_Initial ;
            end
            STATE_7_PlaceHolder : begin
                l_r_nextState = STATE_Initial ;
            end
        endcase
    end
endmodule
