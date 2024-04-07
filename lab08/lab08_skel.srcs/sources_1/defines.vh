//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Organization and Architecture
//  
// Module Name:  		defines
// Project Name:		Laborator 8
// Target Devices: 		Digilent Artix 7
//////////////////////////////////////////////////////////////////////////////////

// DO NOT CHANGE THIS FILE

/* 7-SEGMENT DEFINES */
`define DIGIT_0					4'b0111
`define DIGIT_1					4'b1011
`define DIGIT_2					4'b1101
`define DIGIT_3					4'b1110
`define P_CHAR					4'd11
`define A_CHAR					4'd12
`define S_CHAR					4'd5
`define DASH  					10
`define POINT_OFF				1
`define POINT_ERROR				1'b1
`define DIGIT_OFF				15
`define DIGIT_ERROR				4'b1111
`define DIGIT_DEFAULT			4'b1111
`define DIGIT_DEFAULT_VALUE		4'd0
`define SEGMENT_ERROR			7'b1111111
`define SEGMENT_DEFAULT			7'b1111111

/* ORDINATOR DEFINES */
`define MESSAGE_DEFAULT			10'b1000000000
`define MESSAGE_ERROR			10'b1000000000
`define STATE_ERROR				0
`define	PRESS_MESSAGE			10'b0100000000
`define PROGRESS_NONE			8'b11000000
`define PROGRESS_ONE_OPERAND	8'b11110000
`define PROGRESS_BOTH_OPERANDS	8'b11111100
`define PROGRESS_RESULT			8'b11111111
