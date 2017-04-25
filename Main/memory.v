module memory(ALUres_out, readData, rd_out, WB_out, branch, branchAddr_out, MEM, WB, branchAddr, zero, ALUres, writeData, rd, clk);

input [2:0] MEM;
input [1:0] WB;
input [31:0] branchAddr, ALUres, writeData;
input zero, clk;
input [4:0] rd;

output wire [31:0] ALUres_out, readData, branchAddr_out;
output wire [4:0] rd_out;
output wire [1:0] WB_out;
output wire branch;

data_memory dm(readData, ALUres, writeData, MEM[1], MEM[0], clk);

assign branch = zero & MEM[2];
assign ALUres_out = ALUres;
assign rd_out = rd;
assign WB_out = WB;
assign branchAddr_out = branchAddr;

endmodule