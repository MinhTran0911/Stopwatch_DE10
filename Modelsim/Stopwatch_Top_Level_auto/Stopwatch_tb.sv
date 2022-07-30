`timescale 1ns/1ps

module Stopwatch_tb ();
	
	// Define half period of clock
	parameter CLK_HALF_PERIOD = 10;
	parameter TENTH_SEC = 100_000_000;
	
	logic in_clk, in_rstn, in_st_n, in_lap_rstn;
	logic [7:0] out_HEX [0:7];
	logic [3:0] out_tenth_sec, out_lap_tenth_sec;
	logic [3:0] out_ones, out_lap_ones;
	logic [2:0] out_tens, out_lap_tens;
	
	logic st_n_data [0:39];
	logic lap_rstn_data [0:39];
	logic [7:0] expected_HEX0 [0:39];
	logic [7:0] expected_HEX1 [0:39];
	logic [7:0] expected_HEX2 [0:39];
	logic [7:0] expected_HEX3 [0:39];
	logic [7:0] expected_HEX4 [0:39];
	logic [7:0] expected_HEX5 [0:39];
	logic [7:0] expected_HEX6 [0:39];
	logic [7:0] expected_HEX7 [0:39];
	logic [3:0] expected_tenth_sec[0:39];
	logic [3:0] expected_lap_tenth_sec[0:39];
	logic [3:0] expected_ones[0:39];
	logic [3:0] expected_lap_ones[0:39];
	logic [2:0] expected_tens[0:39];
	logic [2:0] expected_lap_tens[0:39];

	// This var to count for error
	int error_count;

	// Module instantiation
	// Replace module_name, a, b, c... with corresponding names
	Stopwatch DUT (	.clk(in_clk), 
					.rstn(in_rstn), 
					.st_n(in_st_n), 
					.lap_rstn(in_lap_rstn), 
					.HEX(out_HEX),
					.tens(out_tens),
					.ones(out_ones),
					.tenth_sec(out_tenth_sec),
					.lap_tens(out_lap_tens),
					.lap_ones(out_lap_ones),
					.lap_tenth_sec(out_lap_tenth_sec)
					);

	// Generate Clock signal
	initial begin
		in_clk = 1'b0;
		forever #(CLK_HALF_PERIOD) in_clk = ~in_clk;
	end

	// Test Reset
	initial begin
		in_rstn = 1'b1;
		#(TENTH_SEC/2) in_rstn = 1'b0;
		#TENTH_SEC in_rstn = 1'b1;
	end

	// Generate input stimulus
	initial begin
		error_count = 0;
		$readmemb("in_st_n.txt", st_n_data);
		$readmemb("in_lap_rstn.txt", lap_rstn_data);
		$readmemb("out_HEX0.txt", expected_HEX0);
		$readmemb("out_HEX1.txt", expected_HEX1);
		$readmemb("out_HEX2.txt", expected_HEX2);
		$readmemb("out_HEX3.txt", expected_HEX3);
		$readmemb("out_HEX4.txt", expected_HEX4);
		$readmemb("out_HEX5.txt", expected_HEX5);
		$readmemb("out_HEX6.txt", expected_HEX6);
		$readmemb("out_HEX7.txt", expected_HEX7);
		$readmemb("out_tens.txt", expected_tens);
		$readmemb("out_ones.txt", expected_ones);
		$readmemb("out_tenth_sec.txt", expected_tenth_sec);
		$readmemb("out_lap_tens.txt", expected_lap_tens);
		$readmemb("out_lap_ones.txt", expected_lap_ones);
		$readmemb("out_lap_tenth_sec.txt", expected_lap_tenth_sec);
		#(2*TENTH_SEC);
		
		for (int i = 0; i < 39; i++) begin
			in_st_n = st_n_data[i];
			in_lap_rstn = lap_rstn_data[i];
			#TENTH_SEC;
			
			if (out_tens !== expected_tens[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'tens' = %0d and Expected Output 'tens' = %0d", out_tens, expected_tens[i]);
			end
			
			if (out_ones !== expected_ones[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'ones' = %0d and Expected Output 'ones' = %0d", out_ones, expected_ones[i]);
			end
			
			if (out_tenth_sec !== expected_tenth_sec[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'tenth_sec' = %0d and Expected Output 'tenth_sec' = %0d", out_tenth_sec, expected_tenth_sec[i]);
			end
			
			if (out_lap_tens !== expected_lap_tens[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'lap_tens' = %0d and Expected Output 'lap_tens' = %0d", out_lap_tens, expected_lap_tens[i]);
			end
			
			if (out_lap_ones !== expected_lap_ones[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'lap_ones' = %0d and Expected Output 'lap_ones' = %0d", out_lap_ones, expected_lap_ones[i]);
			end
			
			if (out_lap_tenth_sec !== expected_lap_tenth_sec[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'lap_tenth_sec' = %0d and Expected Output 'lap_tenth_sec' = %0d", out_lap_tenth_sec, expected_lap_tenth_sec[i]);
			end
			
			if (out_HEX[0] !== expected_HEX0[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX0' = %8b and Expected Output 'HEX0' = %8b", out_HEX[0], expected_HEX0[i]);
			end
			
			if (out_HEX[1] !== expected_HEX1[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX1' = %8b and Expected Output 'HEX1' = %8b", out_HEX[1], expected_HEX1[i]);
			end
			
			if (out_HEX[2] !== expected_HEX2[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX2' = %8b and Expected Output 'HEX2' = %8b", out_HEX[2], expected_HEX2[i]);
			end
			
			if (out_HEX[3] !== expected_HEX3[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX3' = %8b and Expected Output 'HEX3' = %8b", out_HEX[3], expected_HEX3[i]);
			end
			
			if (out_HEX[4] !== expected_HEX4[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX4' = %8b and Expected Output 'HEX4' = %8b", out_HEX[4], expected_HEX4[i]);
			end
			
			if (out_HEX[5] !== expected_HEX5[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX5' = %8b and Expected Output 'HEX5' = %8b", out_HEX[5], expected_HEX5[i]);
			end
			
			if (out_HEX[6] !== expected_HEX6[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX6' = %8b and Expected Output 'HEX6' = %8b", out_HEX[6], expected_HEX6[i]);
			end
			
			if (out_HEX[7] !== expected_HEX7[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Error: ");
				$display("Output 'HEX7' = %8b and Expected Output 'HEX7' = %8b", out_HEX[7], expected_HEX7[i]);
			end 
		end
	end
	
	// Always put this block at the end, replace n with the total simulation time
	initial begin
		$display("At %0g ns << Starting the Simulation >>", $time);
		#(TENTH_SEC*41);
		$display("At %0g ns", $time);
		$display("<< Simulation finishes with %0d output mismatch(es) >>", error_count);
		$finish;
		$stop;
	end
endmodule