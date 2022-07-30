onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Stopwatch_tb/in_clk
add wave -noupdate /Stopwatch_tb/in_rstn
add wave -noupdate /Stopwatch_tb/in_st_n
add wave -noupdate /Stopwatch_tb/in_lap_rstn
add wave -noupdate -radix unsigned /Stopwatch_tb/out_tens
add wave -noupdate -radix unsigned /Stopwatch_tb/out_ones
add wave -noupdate -radix unsigned /Stopwatch_tb/out_tenth_sec
add wave -noupdate -radix unsigned /Stopwatch_tb/out_lap_tens
add wave -noupdate -radix unsigned /Stopwatch_tb/out_lap_ones
add wave -noupdate -radix unsigned /Stopwatch_tb/out_lap_tenth_sec
add wave -noupdate {/Stopwatch_tb/out_HEX[7]}
add wave -noupdate {/Stopwatch_tb/out_HEX[6]}
add wave -noupdate {/Stopwatch_tb/out_HEX[5]}
add wave -noupdate {/Stopwatch_tb/out_HEX[4]}
add wave -noupdate {/Stopwatch_tb/out_HEX[3]}
add wave -noupdate {/Stopwatch_tb/out_HEX[2]}
add wave -noupdate {/Stopwatch_tb/out_HEX[1]}
add wave -noupdate {/Stopwatch_tb/out_HEX[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55938106625 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 509
configure wave -valuecolwidth 138
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {55938106625 ps} {2825324791042 ps}
