`timescale 1ns/1ps

module Sec_Decoder_tb ();
	
	logic [5:0] in_sec_in;
	logic [2:0] out_tens;
	logic [3:0] out_ones;
	
	logic [5:0] sec_in_data [0:5];
	logic [2:0] expected_tens [0:5];
	logic [3:0] expected_ones [0:5];
	
	int error_count;
	
	Sec_Decoder DUT (	.sec_in(in_sec_in),
						.tens(out_tens),
						.ones(out_ones)
					);
					
	initial begin
		error_count = 0;
		$readmemb("in_sec_in.txt", sec_in_data);
		$readmemb("out_tens.txt", expected_tens);
		$readmemb("out_ones.txt", expected_ones);
		#10
		
		for (int i = 0; i < 6; i++) begin
			in_sec_in = sec_in_data[i];
			#5;
			if (out_tens !== expected_tens[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'sec_in' = %0d", in_sec_in);
				$display("Output 'tens' = %0d and Expected Output 'tens' = %0d", out_tens, expected_tens[i]);
			end
			
			if (out_ones !== expected_ones[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'sec_in' = %0d", in_sec_in);
				$display("Output 'ones' = %0d and Expected Output 'ones' = %0d", out_ones, expected_ones[i]);
			end
			#5;
		end
	end
	
	initial begin
		$display("At %0g ns << Starting the Simulation >>", $time);
		#80;
		$display("At %0g ns", $time);
		$display("<< Simulation finishes with %0d output mismatch(es) >>", error_count);
		$finish;
		$stop;
	end
	
endmodule 