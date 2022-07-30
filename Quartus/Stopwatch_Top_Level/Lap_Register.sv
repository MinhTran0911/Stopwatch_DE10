module Lap_Register (clk, rstn, en, tenth_sec_in, sec_in, tenth_sec_out, sec_out);
	
	input logic clk, rstn, en;
	input logic [3:0] tenth_sec_in;
	input logic [5:0] sec_in;
	
	output logic [3:0] tenth_sec_out;
	output logic [5:0] sec_out;
	
	always_ff @(posedge clk) begin
		if (!rstn) begin
			tenth_sec_out <= 0;
			sec_out <= 0;
		end 
		
		// If enabled, register current sec and 1/10 sec into lap register
		else if (en) begin
			tenth_sec_out <= tenth_sec_in;
			sec_out <= sec_in;
		end 
		
	end
	
endmodule 