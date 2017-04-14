module Control (RegDest, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, OpCode);
output reg RegDest;
output reg Branch;
output reg MemRead;
output reg MemtoReg;
output reg MemWrite;
output reg ALUSrc;
output reg RegWrite;
output [1:0] ALUOp;
input [5:0] OpCode;

always @(OpCode)
begin
case(OpCode)
6'b000000 : begin RegDest= 1; Branch=0; MemRead=0; MemtoReg=0; MemWrite=0; ALUSrc=0; RegWrite=1; end; //R-Type Instructions
6'b001000 : begin RegDest<= 0; Branch<=0; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp<={1,0}; end; //ADDI
6'b100011 : begin RegDest<= 0; Branch<=0; MemRead<=1; MemtoReg<=1; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp<={0,0}; end; //LW
6'b101011 : begin RegDest<= 0; Branch<=0; MemRead<=0; MemtoReg<=1; MemWrite<=1; ALUSrc<=1; RegWrite<=0; ALUOp<={0,0}; end; //SW
6'b001100 : begin RegDest<= 0; Branch<=0; MemRead<=0; MemtoReg<=1; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp<={1,0}; end; //ANDI
6'b001101 : begin RegDest<= 0; Branch<=0; MemRead<=0; MemtoReg<=1; MemWrite<=0; ALUSrc<=1; RegWrite<=1; ALUOp<={1,0}; end; //ORI
6'b000100 : begin RegDest<= 0; Branch<=1; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=0; RegWrite<=0; ALUOp<={0,1}; end; //BEQ
6'b000101 : begin RegDest<= 0; Branch<=1; MemRead<=0; MemtoReg<=0; MemWrite<=0; ALUSrc<=0; RegWrite<=0; ALUOp<={1,1}; end; //BNE
end case
end
endmodule
