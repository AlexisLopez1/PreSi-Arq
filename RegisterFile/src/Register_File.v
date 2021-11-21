module Register_File
#(
	parameter N = 32
)(
	input 		clk,
	input 		reset,
	input 		Reg_Write_i,
	input 		Read_Register_i,
	input  [4:0] Write_Register_i,
	input  [4:0] Read_Register_1_i,
	input  [4:0] Read_Register_2_i,
	input  [N:0] Write_Date_i,
	
	output [N:0] Read_Date_1_o,
	output [N:0] Read_Date_2_o
);

endmodule
