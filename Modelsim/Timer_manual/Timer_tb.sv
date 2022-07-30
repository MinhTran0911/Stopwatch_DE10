`timescale 1ns/1ps

module Timer_tb ();
	
	parameter CLK_HALF_PERIOD = 10;
	
	logic in_clk, in_reset, in_en;
	logic [5:0] out_sec;
	logic [3:0] out_tenth_sec;
	
	Timer DUT ( .clk(in_clk),
				.reset(in_reset),
				.en(in_en),
				.sec(out_sec),
				.tenth_sec(out_tenth_sec)
				);
				
	initial begin
		in_clk = 0;
		forever #CLK_HALF_PERIOD in_clk = ~in_clk;
	end
	
	// Test Reset
	initial begin
		in_reset = 0;
		#5 in_reset = 1;
		#20 in_reset = 0;
	end
	
	initial begin
		in_en = 0;
		#35 in_en = 1;
		#(33'd6_200_000_000*CLK_HALF_PERIOD) in_en = 0;
		#(200_000_000*CLK_HALF_PERIOD) in_en = 1;
		#(1_000_000_000*CLK_HALF_PERIOD) in_en = 0;
	end
	
endmodule 