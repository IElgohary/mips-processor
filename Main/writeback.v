module writeback(writeData, rd_out, regWrite, ALUres, readData, rd, regWrite_out, memToReg, clk);

input clk, regWrite, memToReg;
input [31:0] readData, ALUres;
input [4:0] rd;

wire [31:0] readData_out, ALUres_out;
wire memToReg_out;

output wire [4:0] rd_out;
output wire regWrite_out;
output wire [31:0] writeData;

MEM-WB wb(ALUres_out, readData_out, rd_out, regWrite_out, memToReg_out, ALUres, readData, rd, regWrite, memToReg, clk);

mux m (writeData, readData_out , ALUres_out, memToReg_out);

endmodule