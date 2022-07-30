module Timer (clk, en, reset, tenth_sec, sec);
	
	input logic clk, reset, en; // clock, reset and enable signals
	
	output logic [3:0] tenth_sec; // current 1/10s count, 0-10 => 4-bit
	output logic [5:0] sec; // current second count, 0-59 => 6-bit
	
	// count increments every 1/10 s, or 10 Hz
	// clock source is 50 MHz, count needs to count 50M/10 = 5,000,000 times before it is reset to 0
	// bits needed for count = log2(5,000,000) = 23 (bits)
	logic [22:0] count; 
	
	always_ff @(posedge clk) begin
		if (reset) begin
			count <= 0;
			tenth_sec <= 0;
			sec <= 0;
		end
		
		// only count when enabled
		else if (en) begin
			count <= count + 23'd1;
			
			if (count == 23'd5_000_000) begin
				count <= 0;
				// if reach 9/10 s, next increment will reset to 0
				if (tenth_sec == 4'd9) begin
					tenth_sec <= 0;
					// if current sec is 59s next second increment will reset to 0
					if (sec == 59) sec <= 0;
					else sec <= sec + 6'd1;
				end
				else tenth_sec = tenth_sec + 4'd1;
			end
		
		end
	end

endmodule 