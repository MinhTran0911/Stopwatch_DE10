`timescale 1ns/1ps

module Lap_Register_tb();

	parameter CLK_HALF_PERIOD = 10;
	
	logic in_clk, in_rstn, in_en;
	logic [3:0] in_tenth_sec_in;
	logic [5:0] in_sec_in;
	
	logic [3:0] out_tenth_sec_out;
	logic [5:0] out_sec_out;
	
	
	Lap_Register DUT (	.clk(in_clk),
						.rstn(in_rstn),
						.en(in_en),
						.sec_in(in_sec_in),
						.tenth_sec_in(in_tenth_sec_in),
						.tenth_sec_out(out_tenth_sec_out),
						.sec_out(out_sec_out)
					);
	
	initial begin
		in_clk = 1'b0;
		forever #(CLK_HALF_PERIOD) in_clk = ~in_clk;
	end


	initial begin
		in_rstn = 1'b1;
		#10 in_rstn = 1'b0;
		#10 in_rstn = 1'b1;
		#75 in_rstn = 1'b0;
	end
	
	initial begin
		in_en = 1'b0;
		#10;
		in_en = 1'b1;
		#75 in_en = 1'b0;
	end

	initial begin
		in_tenth_sec_in = 4'd8;
		in_sec_in = 6'd15;
		#15;
		in_tenth_sec_in = 4'd2;
		in_sec_in = 6'd35;
		#20;
		in_tenth_sec_in = 4'd8;
		in_sec_in = 6'd59;
	end
	
	initial begin
		$display("At %0g ns << Starting the Simulation >>", $time);
		 #150;
		 $display("At %0g ns", $time);
		 $finish;
		 $stop;
	end
endmodule
				
	