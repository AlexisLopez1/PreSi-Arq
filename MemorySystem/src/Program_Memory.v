module Program_Memory
#
(	parameter MEMORY_DEPTH 	= 6,
	parameter DATA_WIDTH 	= 32
)(
	input 	  [MEMORY_DEPTH-1:0]	Address_i,
	output reg [DATA_WIDTH-1:0]	Instruction_o
)
	//ROM declaration
	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];
	
	initial begin
		$readmemh("./text.dat", rom);
	end
	
	always @ (Address_i) begin
		Instruction_o = rom[Address_i];
	end
endmodule 