module IDEXreg ( pcOut, reg1Out, reg2Out, offsetOut, rtOut, rdOut, RegDestOut, ALUOpOut, ALUSrcOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut, pc, reg1, reg2, offset, rt, rd, RegDest, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock);

output reg [31:0] pcOut, reg1Out, reg2Out, offsetOut;
output reg [4:0] rtOut, rdOut;
output reg [0:1] ALUOpOut;
output reg RegDestOut, ALUSrcOut, BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut; 

input [31:0] pc, reg1, reg2, offset;
input [4:0] rt, rd;
input [0:1] ALUOp;
input RegDest, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock; 
always@(posedge clock)
begin
pcOut=pc;
reg1Out=reg1;
reg2Out=reg2;
offsetOut=offset;
rtOut=rt;
rdOut=rd;
ALUOpOut=ALUOp;
RegDestOut=RegDest;
ALUSrcOut=ALUSrc;
BranchOut=Branch;
MemReadOut=MemRead;
MemWriteOut=MemWrite;
RegWriteOut=RegWrite;
MemtoRegOut=MemtoReg;
end
endmodule
