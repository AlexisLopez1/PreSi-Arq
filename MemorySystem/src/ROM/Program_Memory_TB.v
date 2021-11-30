/******************************************************************
* Description
*	This is the verification environment for testing a program memory.
* Version:
*	1.1
* Author:				  Updated by:
*	Dr. José Luis Pizano Escalante | Ing. Francisco Alexis Lopez Avila
* email:
*	luispizano@iteso.mx             | francisco.lopez@iteso.mx
* Date:
*	12/06/2015			| 28/09/2021
******************************************************************/

module Program_Memory_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
parameter INSTRUCTION_RANGE = 32'h10010000;

reg clk_tb = 0;
reg [(MEMORY_DEPTH-1):0] Address_i_tb;
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
	#0 Address_i_tb = 32'h400000;
	#50 Address_i_tb = 32'h400004;
	#50 Address_i_tb = 32'h400008;
	#50 Address_i_tb = 32'h40000c;
	#50 Address_i_tb = 32'h400010;
	#50 Address_i_tb = 32'h400014;
	#50 Address_i_tb = 32'h400018;
	#50 Address_i_tb = 32'h40001c;
end


/*********************************************************/

endmodule
