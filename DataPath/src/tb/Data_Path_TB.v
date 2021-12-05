module Data_Path_TB();
	parameter MEMORY_DEPTH 	= 64;
	parameter DATA_WIDTH 	= 32;
	localparam Instruction_Range_i = 32'h400000;

    // Inputs
    reg clk;
    reg reset;
    //Output
    reg [7:0] GPIO_o;

    /********* Control Signals *********/
    reg PCWrite;
          IorD;
          MemWrite;
          IRWrite;
          RegDst;
          MemtoReg;
          RegWrite;
          ALUSrcA;
    reg [1:0] ALUSrcB;
    reg [3:0] ALUControl;
    reg PCSrc;
    wire [5:0] OP;
    wire [5:0] Funct;
    wire [31:0] Result_tb;
    /************************************/

//======================= DataPath Instance======================
    Data_Path #(
        MEMORY_DEPTH(MEMORY_DEPTH),
        DATA_WIDTH(DATA_WIDTH),
        Instruction_Range_i(Instruction_Range_i)
    )
    DP(
        .clk(clk),
        .reset(reset),
        .GPIO_o(GPIO_o),
        .PCWrite(PCWrite),
        .IorD(IorD),
        .MemWrite(MemWrite),
        .IRWrite(IRWrite),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),
        .OP(OP),
        .Funct(Funct),
        .Result_o(Result_tb)
    );

    //============ Test cases ==========================

    initial begin
        #0  FetchCycle Inst_1(4'b0100, 2'b10, 0);
        #10 FetchCycle Inst_2(4'b0100, 2'b10, 0);
        #10 FetchCycle Inst_3(4'b0100, 2'b10, 0);
        #10 FetchCycle Inst_3(4'b0100, 2'b00, 1);
        #10 FetchCycle Inst_3(4'b0100, 2'b00, 1);
        #10 FetchCycle Inst_3(4'b0100, 2'b00, 1);
    end

 
    //=== Tasks for fetch cycle of  each isntruction ===
    task FetchCycle(input [3:0] operation, input [1:0] operator, input intruction_type);
    //****** Fetch ************
        PCWrite = 1;
        IorD = 0;
        MemWrite = 0;
        IRWrite = 1;
        RegWrite = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b01;
        ALUControl = 4'b0100; //{OP, Funct};
        PCSrc = 0;
    //****** Decode ************
        PCWrite = 0;
        IRWrite = 0;
    //****** Execution *********
        ALUSrcA = 1;
        ALUSrcB = operator;
        ALUControl = operation; // SUM
    //*** Write Background ****
        RegDst = intruction_type;
        MemtoReg = 0;
        RegWrite = 1;
    //****** LOAD *************
        IorD = 1;
        MemtoReg = 1;

        Result();

    endtask

//============ Task to show result =================
    task Result();
        $display ($time, "ALU_Result: %h", Result_tb);
    endtask;

endmodule;