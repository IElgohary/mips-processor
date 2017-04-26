module main ( )



wire instruction
fetch(instruction, pc_out_Fetch, pcSrc, clk, pc_branched );

decode (clk, pc_out_Fetch, instruction, WriteReg, WriteData, RegWriteIn, RegDest, Branch, MemRead, MemtoReg, ALUOp, 
	MemWrite,ALUSrc,RegWriteOut, pcOut_decode, readData1, readData2, signExtendOut, instruction2016, instruction1511);

 ex (brachAdr,zero, ALUres, reg21, writeReg,BranchOut, MemReadOut, MemWriteOut, RegWriteOut,MemtoRegOut,pcOut_decode,
 reg1, reg2, signExtendOut, readData2, readData1, RegDest, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite,MemtoReg, clk);

memory(ALUres_out, readData, rd_out, WB_out, branch, branchAddr_out, branch_in, memWrite, memRead, regWrite,
memToReg, branchAddr, zero, ALUres, writeData, rd, clk);
