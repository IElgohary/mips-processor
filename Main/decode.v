module decode (clk, pc, instructionIn, WriteReg, WriteData, RegWriteIn, RegDest, Branch, MemRead, MemtoReg, ALUOp, 
	MemWrite,ALUSrc,RegWriteOut, pcOut, readData1, readData2, signExtendOut, instruction2016, instruction1511);

input clk, RegWriteIn;
input [31:0] pc, instructionIn, WriteData;
input [4:0] WriteReg;
 
output RegDest, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWriteOut;
output [1:0] ALUOp;
output [31:0] pcOut, readData1, readData2, signExtendOut;
output [4:0] instruction2016, instruction1511;
wire [31:0] instruction;

IDIFreg if_id(instruction, pcOut, instructionIn, pc, clk);

Control ctrl(RegDest, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWriteOut, instruction[31:26]);
register_file rf(clk, instruction[25:21], instruction[20:16], WriteReg, RegWriteIn, WriteData, readData1, readData2);
sign_extend se(signExtendOut, instruction[15:0]);
assign instruction2016= instruction[20:16];
assign instruction1511= instruction[15:11];

endmodule
