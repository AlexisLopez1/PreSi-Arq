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

task print_result(
    reg         Reg_Write,
    reg  [4:0]  Write_Register, Read_Register_1, Read_Register_2,
    reg  [31:0] Write_Data,
    wire [31:0] Read_Data_1, Read_Data_2
);
    $display($time,"  Write_data = %d,  Write_Register = %d,  Reg_Write = %d,  
    Read_Register_1 = %d, Read_Data_1 = %d,  Read_Register_2 = %d, Read_Data_2 = %d",
    Write_Data, Write_Register, Reg_Write, Read_Register_1, Read_Data_1, Read_Register_2, Read_Data_2);
endtask

initial begin
	#0  Reg_Write_tb = 0;
	#10  Reg_Write_tb = 1;
    #75  Reg_Write_tb = 0;
end

initial begin
    #0 Write_Data_tb = 3;
    #0 Write_Register_tb = 1;
    #0 Read_Register_1_tb = 1;
    #0 Read_Register_2_tb = 1;
    #4 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

initial begin
    #20 Write_Data_tb = 8;
    #20 Write_Register_tb = 7;
    #20 Read_Register_1_tb = 7;
    #20 Read_Register_2_tb = 7;
    #24 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

initial begin
    #40 Write_Data_tb = 45;
    #40 Write_Register_tb = 17;
    #40 Read_Register_1_tb = 17;
    #40 Read_Register_2_tb = 17;
    #44 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

initial begin
    #60 Write_Data_tb = 62;
    #60 Write_Register_tb = 25;
    #60 Read_Register_1_tb = 25;
    #60 Read_Register_2_tb = 25;
    #64 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

initial begin
    #80 Write_Data_tb = 89;
    #80 Write_Register_tb = 30;
    #80 Read_Register_1_tb = 30;
    #80 Read_Register_2_tb = 30;
    #84 print_result(Reg_Write_tb, Write_Register_tb, Read_Register_1_tb, Read_Register_2_tb, Write_Data_tb, Read_Data_1_tb, Read_Data_2_tb);
end

endmodule