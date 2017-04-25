module memory(ALUres_out, readData, rd_out, WB_out, branch, branchAddr_out, branch_in, memWrite, memRead, regWrite, memToReg, branchAddr, zero, ALUres, writeData, rd, clk);

input branch_in, memWrite, memRead, regWrite, memToReg, zero, clk;
input [31:0] branchAddr, ALUres, writeData;
input [4:0] rd;

output wire [31:0] ALUres_out, readData, branchAddr_out;
output wire [4:0] rd_out;
output wire [1:0] WB_out;
output wire branch;

wire branch_out, memWrite_out, memRead_out, PCSrc_out, memToReg_out, zero_out, regWrite_out;
wire [31:0] writeData_out;

EXMEMreg mem(branchAddr_out, zero_out, ALUres_out, writeData_out, rd_out, branch_out, memRead_out, memWrite_out, regWrite_out,memToReg_out,
                branchAddr, zero, ALUres, writeData, rd, branch_in, memRead, memWrite, regWrite, memToReg, clk);

data_memory dm(readData, ALUres_out, writeData_out, memRead_out, memWrite_out, clk);

assign branch = zero & branch_out;

endmodule