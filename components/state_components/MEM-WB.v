module MEMWBreg(ALUresOut, memoryWordOut, writeRegOut, RegWriteOut,MemtoRegOut, ALUres, memoryWord, writeReg, RegWrite,MemtoReg, clock);
output  reg[31:0] ALUresOut, memoryWordOut;
output  reg[4:0] writeRegOut;
output  reg RegWriteOut,MemtoRegOut;

input [31:0] ALUres, memoryWord;
input [4:0] writeReg;
input RegWrite,MemtoReg, clock;

always@(posedge clock)
begin
ALUresOut=ALUres;
memoryWordOut=memoryWord;
writeRegOut=writeReg;
RegWriteOut=RegWrite;
MemtoRegOut=MemtoReg;
end

endmodule