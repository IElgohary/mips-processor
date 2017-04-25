module writeback(writeData, rd_out, regWrite, ALUres, readData, rd, WB);

input [1:0] WB;
input [31:0] readData, ALUres;
input [4:0] rd;

output wire [4:0] rd_out;
output wire regWrite;
output wire [31:0] writeData;

mux m (writeData, readData , ALUres, WB[0]);

assign rd_out = rd;
assign regWrite = WB[1];

endmodule