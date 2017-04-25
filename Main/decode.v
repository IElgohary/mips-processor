module decode (clk, pc, instruction, WriteReg, WriteData, RegWriteIn, RegDest, Branch, MemRead, MemtoReg, ALUOp, 
	MemWrite,ALUSrc,RegWriteOut, pcOut, readData1, readData2, signExtendOut, instruction2016, instruction1511);

input clk, RegWriteIn;
input [31:0] pc, instruction, WriteData;
input [4:0] WriteReg;
output [3:0] controlOut; 
output RegDest, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWriteOut;
output [1:0] ALUOp;
output [31:0] pcOut, readData1, readData2, signExtendOut;
output [4:0] instruction2016, instruction1511;

assign pcOut = pc;
Control ctrl(RegDest, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWriteOut, instruction[31:26]);
register_file rf(clk, instruction[25:16], instruction[20:16], WriteReg, RegWriteIn, WriteData, readData1, readData2);
sign_extend se(signExtendOut, instruction[15:0]);
assign instruction2016= instruction[20:16];
assign instruction1511= instruction[15:11];

endmodule