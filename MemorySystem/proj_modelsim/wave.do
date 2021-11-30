onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Memory_System_TB/clk_tb
add wave -noupdate /Memory_System_TB/Write_Enable_i_tb
add wave -noupdate -color Orange -radix hexadecimal /Memory_System_TB/Instruction_Range_i_tb
add wave -noupdate -color Cyan -radix hexadecimal /Memory_System_TB/Address_i_tb
add wave -noupdate -color Magenta -radix hexadecimal /Memory_System_TB/Write_Data_i_tb
add wave -noupdate -color Yellow -radix hexadecimal /Memory_System_TB/Instruction_o_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250 ps} 0}
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
WaveRestoreZoom {0 ps} {552 ps}
