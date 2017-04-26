module ex (brachAdr,zero, ALUres, reg21, writeReg,BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut,pc, reg1, reg2, offset, rt, rs, RegDest, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock);

output [31:0] brachAdr,ALUres,reg21;
output [4:0] writeReg;
output zero,BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut;

input [31:0] pc, reg1, reg2, offset;
input [4:0] rt, rs;
input [0:1] ALUOp;
input RegDest, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock;
wire [4:0] rt1, rs1;
wire [5:0] func;
wire [1:0] ALUOp1;
wire [3:0] aluControl;
wire [31:0] mulof,aluin,pc1, reg11, reg21, offset1;
wire RegDest1, ALUSrc1;
IDEXreg regesters(pc1, reg11, reg21, offset1, rt1, rs1, RegDest1, ALUOp1, ALUSrc1, BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut,pc, reg1, reg2, offset, rt, rs, RegDest, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clock);

assign mulof=offset1*4;
adder addBrachAdress(brachAdr,pc1,mulof);
mux m1(aluin,offset1,reg21,ALUSrc1);
assign func=offset1[5:0];
alu_control c1(func, ALUOp1, aluControl);
alu alu1(ALUres, zero, reg11, aluin, aluControl);

miniMux m2(writeReg,rt1,rs1,RegDest1);

endmodule
