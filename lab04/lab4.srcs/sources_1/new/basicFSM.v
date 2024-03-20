`timescale 1ns / 1ps

module basicFSM (
	output wire Output,
	input wire Reset,
	input wire Clock,
	input wire Input
);

	localparam STATE_Initial = 3'd0,
               STATE_1 = 3'd1 ,
               STATE_2 = 3'd2 ,
               STATE_3 = 3'd3 ,
               STATE_4 = 3'd4 ,
               STATE_5_PlaceHolder = 3'd5 ,
               STATE_6_PlaceHolder = 3'd6 ,
               STATE_7_PlaceHolder = 3'd7;

    reg [2:0] CurrentState ;
    reg [2:0] NextState ;
    
    assign Output = ( CurrentState == STATE_4 );
    
    always@ ( posedge Clock ) begin
      if ( Reset ) 
        CurrentState <= STATE_Initial ;
      else 
        CurrentState <= NextState ;
    end

    // --------------------------------------------------------------------
    // Tranzi?ie condi?ionat?: bloc always@ ( * ) 
    // --------------------------------------------------------------------
    always@ ( * ) begin
        NextState = CurrentState ;
 
        case ( CurrentState )
            STATE_Initial : begin
                NextState = STATE_1 ;
            end
            STATE_1 : begin
                if (!Input)
                    NextState = STATE_2 ;
            end
            STATE_2 : begin
                if (Input)
                    NextState = STATE_3 ;
            end
            STATE_3 : begin
                if (Input)
                    NextState = STATE_4 ;
                else
                    NextState = STATE_2 ;
            end
            STATE_4 : begin
                if (Input)
                    NextState = STATE_1 ;
                else
                    NextState = STATE_2 ;
            end
            //Stari pentru tratarea erorilor
            //Daca automatul ajunge  n aceste stari se va reseta.
            STATE_5_PlaceHolder : begin
                NextState = STATE_Initial ;
            end
            STATE_6_PlaceHolder : begin
                NextState = STATE_Initial ;
            end
            STATE_7_PlaceHolder : begin
                NextState = STATE_Initial ;
            end
        endcase
    end
endmodule
