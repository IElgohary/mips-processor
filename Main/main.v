module main;

reg clk;

initial begin
    clk= 0;
    forever begin
        #5 clk = ~clk;
    end
end

wire[31:0] instruction, inst_out,pc_out_fetch, pc_out_IDIF,pc_branched,writeData,pc_out_to_ex,readData1, readData2,signExtendOut,branchAddr,
    ALUres, writeData_to_mem, ALUres_out_toWB,readData_toWB ;
wire[4:0] WriteReg,instruction2016, instruction1511,rd_out_toWB, writeReg_to_mem, rt,rd;
wire [1:0] ALUOp, WB_out;

fetch fet(instruction, pc_out_fetch, pcSrc, clk, pc_branched);
IDIFreg IDIFReg(inst_out,pc_out_IDIF,instruction,pc_out_fetch,clk);

decode dec(clk, pc_out_IDIF, inst_out, WriteReg, writeData, regWrite_wb_to_decode, RegDest, Branch, MemRead, MemtoReg, ALUOp, 
	MemWrite,ALUSrc,RegWriteOut_toEx, pc_out_to_ex, readData1, readData2, signExtendOut, instruction2016, instruction1511);

ex ex(branchAddr,zero, ALUres, writeData_to_mem, writeReg_to_mem,branch_out_to_mem, memRead_to_mem, memWrite_to_mem, 
RegWriteOut_toMem,memToReg,pc_out_to_ex, readData1, readData2, signExtendOut, rt, rd, RegDest, ALUOp, ALUSrc, Branch, 
MemRead, MemWrite, RegWriteOut_toEx,MemtoReg, clk);

memory mem(ALUres_out_toWB, readData_toWB, rd_out_toWB, WB_out, pcSrc, pc_branched, branch_out_to_mem, memWrite_to_mem, 
memRead_to_mem, RegWriteOut_toWB,RegWriteOut_toMem, branchAddr, zero, ALUres, writeData_to_mem, writeReg_to_mem, clk);

writeback wb(writeData, WriteReg, RegWriteOut_toWB, ALUres_out_toWB, readData_toWB, rd_out_toWB, regWrite_wb_to_decode, memToReg, clk);

endmodule