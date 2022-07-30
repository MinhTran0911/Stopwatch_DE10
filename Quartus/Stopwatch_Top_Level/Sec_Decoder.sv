module Sec_Decoder (sec_in, tens, ones);
	
	input logic [5:0] sec_in;
	output logic [2:0] tens;
	output logic [3:0] ones;
	
	assign tens = sec_in / 4'd10;
	assign ones = sec_in % 4'd10;
	
endmodule 