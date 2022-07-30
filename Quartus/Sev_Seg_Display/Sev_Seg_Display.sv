module Sev_Seg_Display (tens_sec, ones_sec, tenth_sec, HEX);
	
	input logic [2:0] tens_sec;
	input logic [3:0] ones_sec, tenth_sec;
	
	output logic [7:0] HEX [0:3];
	
	// Common Anode 7-seg LEDs patterns
	localparam ZERO = 8'b1100_0000;
	localparam ONE = 8'b1111_1001;
	localparam TWO = 8'b1010_0100;
	localparam THREE = 8'b1011_0000;
	localparam FOUR = 8'b1001_1001;
	localparam FIVE = 8'b1001_0010;
	localparam SIX = 8'b1000_0010;
	localparam SEVEN = 8'b1111_1000;
	localparam EIGHT = 8'b1000_0000;
	localparam NINE = 8'b1001_0000;
	localparam DOT = 8'b0111_1111;
	localparam DASH = 8'b1011_1111;
	
	// Third digit is a DP to separate whole sec and decimal
	assign HEX[1] = DOT;
	
	// First digit is the tens digit of current second
	always_comb begin
		case (tens_sec)
			3'd0: HEX[3] = ZERO;
			3'd1: HEX[3] = ONE;
			3'd2: HEX[3] = TWO;
			3'd3: HEX[3] = THREE;
			3'd4: HEX[3] = FOUR;
			3'd5: HEX[3] = FIVE;
			default: HEX[3] = DASH;
		endcase
	end 
	
	// Second digit is the ones digit of current second
	always_comb begin
		case (ones_sec)
			4'd0: HEX[2] = ZERO;
			4'd1: HEX[2] = ONE;
			4'd2: HEX[2] = TWO;
			4'd3: HEX[2] = THREE;
			4'd4: HEX[2] = FOUR;
			4'd5: HEX[2] = FIVE;
			4'd6: HEX[2] = SIX;
			4'd7: HEX[2] = SEVEN;
			4'd8: HEX[2] = EIGHT;
			4'd9: HEX[2] = NINE;
			default: HEX[2] = DASH;
		endcase
	end 
	
	// Fourth digit is the tenth digit of current second
	always_comb begin
		case (tenth_sec)
			4'd0: HEX[0] = ZERO;
			4'd1: HEX[0] = ONE;
			4'd2: HEX[0] = TWO;
			4'd3: HEX[0] = THREE;
			4'd4: HEX[0] = FOUR;
			4'd5: HEX[0] = FIVE;
			4'd6: HEX[0] = SIX;
			4'd7: HEX[0] = SEVEN;
			4'd8: HEX[0] = EIGHT;
			4'd9: HEX[0] = NINE;
			default: HEX[0] = DASH;
		endcase
	end 
	
endmodule 