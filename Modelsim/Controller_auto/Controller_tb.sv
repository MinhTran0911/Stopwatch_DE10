`timescale 1ns/1ps

module Controller_tb ();
	
	parameter CLK_HALF_PERIOD = 10;
	
	logic in_clk, in_rstn, in_st_n, in_lap_rstn;
	
	logic out_timer_rst, out_timer_en, out_lap_en;
	logic [1:0] state;
	
	logic st_n_data [0:15];
	logic lap_rstn_data [0:15];
	logic expected_timer_rst [0:15];
	logic expected_timer_en [0:15];
	logic expected_lap_en [0:15];
	logic [1:0] expected_state [0:15];
	
	int error_count;
	
	Controller DUT (.clk(in_clk),
					.rstn(in_rstn),
					.st_n(in_st_n),
					.lap_rstn(in_lap_rstn),
					.timer_en(out_timer_en),
					.timer_rst(out_timer_rst),
					.lap_en(out_lap_en),
					.state(state)
					);
	
	initial begin
		in_clk = 0;
		forever #CLK_HALF_PERIOD in_clk = ~in_clk;
	end
	
	initial begin
		in_rstn = 1;
		#5 in_rstn = 0;
		#20 in_rstn = 1;
	end
	
	initial begin
		error_count = 0;
		$readmemb("in_st_n.txt", st_n_data);
		$readmemb("in_lap_rstn.txt", lap_rstn_data);
		$readmemb("out_timer_en.txt", expected_timer_en);
		$readmemb("out_timer_rst.txt", expected_timer_rst);
		$readmemb("out_lap_en.txt", expected_lap_en);
		$readmemb("out_state.txt", expected_state);
		#45;
		
		for (int i = 0; i < 16; i++) begin
			in_st_n = st_n_data[i];
			in_lap_rstn = lap_rstn_data[i];
			#(CLK_HALF_PERIOD);
			
			if (out_timer_en !== expected_timer_en[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Input 'st_n' = %0b and Input 'lap_rstn' = %0b", in_st_n, in_lap_rstn);
				$display("Output 'timer_en' = %0b and Expected Output 'timer_en' = %0b", out_timer_en, expected_timer_en[i]);
			end
			
			if (out_timer_rst !== expected_timer_rst[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Input 'st_n' = %0b and Input 'lap_rstn' = %0b", in_st_n, in_lap_rstn);
				$display("Output 'timer_rst= %0b and Expected Output 'timer_rst' = %0b", out_timer_rst, expected_timer_rst[i]);
			end
			
			if (out_lap_en !== expected_lap_en[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Input 'st_n' = %0b and Input 'lap_rstn' = %0b", in_st_n, in_lap_rstn);
				$display("Output 'lap_en' = %0b and Expected Output 'lap_en' = %0b", out_lap_en, expected_lap_en[i]);
			end
			
			if (state !== expected_state[i]) begin
				error_count += 1;
				$display("At %0g ns", $time);
				$display("Input 'st_n' = %0b and Input 'lap_rstn' = %0b", in_st_n, in_lap_rstn);
				$display("Output 'state' = %2b and Expected Output 'state' = %2b", state, expected_state[i]);
			end
			#(CLK_HALF_PERIOD);
		end
	end
	
	initial begin
		$display("At %0g ns << Simulation Started >>", $time);
		#350;
		$display("At %0g ns << Simulation Finished >>", $time);
		$display("With %0d Output Mismatch(es)", error_count);
		$stop;
		$finish;
	end
	
endmodule
	
	