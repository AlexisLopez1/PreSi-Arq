module Data_Path(
    input PCWrite,
          IorD,
          MemWrite,
          IRWrite,
          RegDst,
          MemtoReg,
          RegWrie,
          ALUSrcA,
    input [1:0] ALUSrcB,
    input [3:0] ALUControl,
    input PCSrc,
          PCWrite
);
    wire PC_i, PC_o;

    Reg_Simple PROGRAM_COUNTER(.clk(clk), .data_i(PC_i), .data_o(PC_o));




endmodule 