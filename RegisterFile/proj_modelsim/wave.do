onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Register_File_TB/clk_tb
add wave -noupdate -color Yellow /Register_File_TB/Write_Data_tb
add wave -noupdate -color Coral /Register_File_TB/Write_Register_tb
add wave -noupdate -color {Spring Green} /Register_File_TB/Reg_Write_tb
add wave -noupdate -color Magenta /Register_File_TB/Read_Register_1_tb
add wave -noupdate -color Aquamarine /Register_File_TB/Read_Data_1_tb
add wave -noupdate -color Magenta /Register_File_TB/Read_Register_2_tb
add wave -noupdate -color Aquamarine /Register_File_TB/Read_Data_2_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {42 ps}
