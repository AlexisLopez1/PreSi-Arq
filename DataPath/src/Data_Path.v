module Data_Path(
    // Inputs
    input clk,
    input reset,
    //Output
    output [7:0] GPIO_o,

    /********* Señales de Control *********/
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
    wire [31:0] PC_i_w, PC_o_w;
    wire [31:0] Adr_w;
    wire [31:0] SrcA_w, SrcB_w;
    wire [31:0] ALUResult_w, ALUOut_w;

    //PC
    Reg_Simple PROGRAM_COUNTER(.clk(clk), .data_i(PC_i_w), .data_o(PC_o_w));
    //Adr
    Mux_2x1 Adr(.in_0(PC_o_w), .in_1(ALUOut_w), .data_out(Adr_w));
    //Mem_out RD

    Mux_2x1 SrcA(.in_0(PC_o_w), .in_1(/**/), .data_out(SrcA_w));
    ALU ALUIF(.selector(ALUControl), .a(SrcA_w), .b(SrcB_w), .data_out(ALUResult_w));





endmodule 