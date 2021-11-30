/******************************************************************
* Description
*	This is the verification environment for testing a data memory.
* Version:
*	1.0
* Author:
*	Ing. Francisco Alexis Lopez Avila
* email:
*	francisco.lopez@iteso.mx
* Date:
*	28/09/2021
******************************************************************/

module Data_Memory_TB;

parameter MEMORY_DEPTH 	= 64;
parameter DATA_WIDTH 	= 32;
parameter INSTRUCTION_RANGE = 32'h10010000;

reg clk_tb = 0;
reg Write_Enable_i_tb;
reg [(DATA_WIDTH-1):0] 	Write_Data_i_tb;
reg [(DATA_WIDTH-1):0] 	Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
Memory_System
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH),
	.INSTRUCTION_RANGE(INSTRUCTION_RANGE)
)
DUV
(
	.clk(clk_tb),
	.Write_Enable_i(Write_Enable_i_tb),
	.Write_Data_i(Write_Data_i_tb),
	.Address_i(Address_i_tb),
	.Instruction_o(Instruction_o_tb) 
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin
	#0 Write_Enable_i_tb = 1'b1;
end

initial begin
	#0  Address_i_tb = 32'h10010000;
	#50 Address_i_tb = 32'h10010008;
	#50 Address_i_tb = 32'h1001000c;
	#50 Address_i_tb = 32'h10010010;
	#50 Address_i_tb = 32'h10010014;
end

initial begin
	#0  Write_Data_i_tb = 32'h2008ffff;
	#50 Write_Data_i_tb = 32'h20090010;
	#50 Write_Data_i_tb = 32'h200a000a;
	#50 Write_Data_i_tb = 32'h200b0019;
	#50 Write_Data_i_tb = 32'h012a8020;
end 

/*********************************************************/

endmodule
