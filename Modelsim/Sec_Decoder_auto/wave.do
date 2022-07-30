onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -radixshowbase 1 /Sec_Decoder_tb/in_sec_in
add wave -noupdate -radix unsigned -radixshowbase 1 /Sec_Decoder_tb/out_tens
add wave -noupdate -radix unsigned -radixshowbase 1 /Sec_Decoder_tb/out_ones
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59966 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 401
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
WaveRestoreZoom {0 ps} {71911 ps}
