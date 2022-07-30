onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Lap_Register_tb/in_clk
add wave -noupdate /Lap_Register_tb/in_rstn
add wave -noupdate /Lap_Register_tb/in_en
add wave -noupdate -radix unsigned -radixshowbase 1 /Lap_Register_tb/in_sec_in
add wave -noupdate -radix unsigned -radixshowbase 1 /Lap_Register_tb/in_tenth_sec_in
add wave -noupdate -radix unsigned -radixshowbase 1 /Lap_Register_tb/out_sec_out
add wave -noupdate -radix unsigned -radixshowbase 1 /Lap_Register_tb/out_tenth_sec_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {149797 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 355
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {157500 ps}
