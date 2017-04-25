module EXMEMreg (brachAdrOut, zeroOut, ALUresOut, RegValueOut, writeRegOut,BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut,brachAdr, zero, ALUres, RegValue, writeReg,Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock);
output reg[31:0] brachAdrOut, ALUresOut, RegValueOut; 
output reg[4:0] writeRegOut; 
output reg zeroOut,BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut;

input [31:0] brachAdr, ALUres, RegValue; 
input [4:0] writeReg; 
input zero,Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock;

always@(posedge clock)
begin
brachAdrOut=brachAdr;
ALUresOut=ALUres;
RegValueOut=RegValue;
writeRegOut=writeReg;
zeroOut=zero;
BranchOut=Branch;
MemReadOut=MemRead;
MemWriteOut=MemWrite;
RegWriteOut=RegWrite;
MemtoRegOut=MemtoReg;
end
endmodule