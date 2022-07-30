module Stopwatch (clk, rstn, st_n, lap_rstn, HEX);
	
	input logic clk, rstn, st_n, lap_rstn;
	output logic [7:0] HEX [0:7];
	
	logic [5:0] sec, lap_sec;
	logic [3:0] tenth_sec, lap_tenth_sec;
	logic [3:0] ones, lap_ones;
	logic [2:0] tens, lap_tens;
	logic timer_rst, timer_en, lap_en;
	
	Controller Stopwatch_Controller (.clk(clk),
												.rstn(rstn),
												.timer_rst(timer_rst),
												.timer_en(timer_en),
												.st_n(st_n),
												.lap_rstn(lap_rstn),
												.lap_en(lap_en)
												);
	
	Timer Stopwatch_Timer (.clk(clk), 
								  .en(timer_en), 
								  .reset(timer_rst), 
								  .tenth_sec(tenth_sec), 
								  .sec(sec)
								  );											
	
	Lap_Register Lap_Reg (.clk(clk), 
								 .rstn(rstn), 
								 .en(lap_en), 
								 .tenth_sec_in(tenth_sec), 
								 .sec_in(sec), 
								 .tenth_sec_out(lap_tenth_sec), 
								 .sec_out(lap_sec)
								 );
	
	Sec_Decoder Current_Sec_Decoder (.sec_in(sec),
												.tens(tens),
												.ones(ones)
												);
	
	Sec_Decoder Lap_Sec_Decoder (.sec_in(lap_sec),
										  .tens(lap_tens),
										  .ones(lap_ones)
										  );
	
	Sev_Seg_Display Sec_Display (.tens_sec(tens),
										  .ones_sec(ones),
										  .tenth_sec(tenth_sec),
										  .HEX(HEX[0:3])
										  );
	
	Sev_Seg_Display Lap_Display (.tens_sec(lap_tens),
										  .ones_sec(lap_ones),
										  .tenth_sec(lap_tenth_sec),
										  .HEX(HEX[4:7])
										  );
	
endmodule 