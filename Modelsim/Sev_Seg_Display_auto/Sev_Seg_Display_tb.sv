`timescale 1ns/1ps

module Sev_Seg_Display_tb ();

	logic [2:0] in_tens_sec;
	logic [3:0] in_ones_sec, in_tenth_sec;
	logic [7:0] out_HEX [0:3];
	
	logic [2:0] tens_sec_data [0:600];
	logic [3:0] ones_sec_data[0:600];
	logic [3:0] tenth_sec_data [0:600];
	logic [7:0] expected_HEX0 [0:600];
	logic [7:0] expected_HEX1 [0:600];
	logic [7:0] expected_HEX2 [0:600];
	logic [7:0] expected_HEX3 [0:600];
	
	int error_count;

	// Module instantiation
	Sev_Seg_Display DUT (.tens_sec(in_tens_sec), 
						 .ones_sec(in_ones_sec), 
						 .tenth_sec(in_tenth_sec), 
						 .HEX(out_HEX)
						);


	// Generate input stimulus
	initial begin
		error_count = 0;
		$readmemb("in_tens_sec.txt", tens_sec_data);
		$readmemb("in_ones_sec.txt", ones_sec_data);
		$readmemb("in_tenth_sec.txt", tenth_sec_data);
		$readmemb("out_HEX0.txt", expected_HEX0);
		$readmemb("out_HEX1.txt", expected_HEX1);
		$readmemb("out_HEX2.txt", expected_HEX2);
		$readmemb("out_HEX3.txt", expected_HEX3);
		#10;
		
		for (int i = 0; i < 600; i++) begin
			in_tens_sec = tens_sec_data[i];
			in_ones_sec = ones_sec_data[i];
			in_tenth_sec = tenth_sec_data[i];
			#10;
			
			if (out_HEX[0] !== expected_HEX0[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'tens_sec' = %0b, input 'ones_sec' = %0b, and input 'tenth_sec' = %0b", in_tens_sec, in_ones_sec, in_tenth_sec);
				$display("Output 'HEX0' = %0b and Expected Output 'HEX0' = %0b", out_HEX[0], expected_HEX0[i]);
			end
			
			if (out_HEX[1] !== expected_HEX1[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'tens_sec' = %0b, input 'ones_sec' = %0b, and input 'tenth_sec' = %0b", in_tens_sec, in_ones_sec, in_tenth_sec);
				$display("Output 'HEX1' = %0b and Expected Output 'HEX1' = %0b", out_HEX[1], expected_HEX1[i]);
			end
			
			if (out_HEX[2] !== expected_HEX2[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'tens_sec' = %0b, input 'ones_sec' = %0b, and input 'tenth_sec' = %0b", in_tens_sec, in_ones_sec, in_tenth_sec);
				$display("Output 'HEX2' = %0b and Expected Output 'HEX2' = %0b", out_HEX[2], expected_HEX2[i]);
			end
			
			if (out_HEX[3] !== expected_HEX3[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: input 'tens_sec' = %0b, input 'ones_sec' = %0b, and input 'tenth_sec' = %0b", in_tens_sec, in_ones_sec, in_tenth_sec);
				$display("Output 'HEX3' = %0b and Expected Output 'HEX3' = %0b", out_HEX[3], expected_HEX3[i]);
			end
			#10;
		end
	end
	
	initial begin
		$display("At %0g ns << Simulation Started >>", $time);
		#120_000;
		$display("At %0g ns << Simulation Finished >>", $time);
		$display("With %0d output mismatch(es)", error_count);
		$finish;
		$stop;
	end
endmodule