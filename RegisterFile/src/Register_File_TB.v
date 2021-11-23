module Register_File_TB;

reg         clk_tb = 0;
reg         reset_tb;
reg         Reg_Write_tb;
reg  [4:0]  Write_Register_tb;
reg  [4:0]  Read_Register_1_tb;
reg  [4:0]  Read_Register_2_tb;
reg  [31:0] Write_Data_tb;
wire [31:0] Read_Data_1_tb;
wire [31:0] Read_Data_2_tb;
  
Register_File
#(
	.N(32)
)
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),
	.Reg_Write_i(Reg_Write_tb),
	.Write_Register_i(Write_Register_tb),
	.Read_Register_1_i(Read_Register_1_tb),
	.Read_Register_2_i(Read_Register_2_tb),
	.Write_Data_i(Write_Data_tb),
	.Read_Data_1_o(Read_Data_1_tb),
	.Read_Data_2_o(Read_Data_2_tb)

);

//Task to show result in command line
task print_result(
input       Reg_Write,
     [4:0]  Write_Register, Read_Register_1, Read_Register_2,
     [31:0] Write_Data,
     [31:0] Read_Data_1, Read_Data_2
);
    $display("Write_data=%d, Write_Register=%d, Reg_Write=%d \nRead_Register_1=%d, Read_Data_1=%d \nRead_Register_2=%d, Read_Data_2=%d \n\n",
    Write_Data, Write_Register, Reg_Write, Read_Register_1, Read_Data_1, Read_Register_2, Read_Data_2);
endtask

// Clock generator
initial begin 
    forever #2 clk_tb = !clk_tb;
  end

//Reg Write change
initial begin
	#0  Reg_Write_tb = 0;
	#4  Reg_Write_tb = 1;
	#40 Reg_Write_tb = 0;
end

//Test Cases
initial begin
	#0 Read_Register_1_tb = 0;
	#4 Read_Register_1_tb = 0;
	#10 Read_Register_1_tb = 2;
	#10 Read_Register_1_tb = 4;
	#10 Read_Register_1_tb = 25;
	#10 Read_Register_1_tb = 31;

end


initial begin
	#0 Read_Register_2_tb = 0;
	#4 Read_Register_2_tb = 0;
	#10 Read_Register_2_tb = 2;
	#10 Read_Register_2_tb = 4;
	#10 Read_Register_2_tb = 25;
	#10 Read_Register_2_tb = 31;

end

initial begin
	#0 Write_Register_tb = 0;
	#4 Write_Register_tb = 0;
	#10 Write_Register_tb = 2;
	#10 Write_Register_tb = 4;
	#10 Write_Register_tb = 25;
	#10 Write_Register_tb = 31;

end

initial begin 
	#0 Write_Data_tb = 3;
	#4 Write_Data_tb = 3;
	#10 Write_Data_tb = 7;
	#10 Write_Data_tb = 20;
	#10 Write_Data_tb = 6;
	#10 Write_Data_tb = 78;
end

//Display result
initial begin
#0 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
#5 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
#10 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
#10 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
#10 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
#10 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

endmodule
