module register_file(clk, rs, rt, rd, regWrite, writeData, readData1, readData2);
input regWrite, clk;
input [4:0] rs, rt, rd;
input [31:0] writeData;

output reg [31:0] readData1, readData2;

reg [31:0] registers [31:0];

always @(rs or rt)
begin
     readData1 <= (rs==0)? 32'b0:registers[rs];
     readData2 <= (rt==0)? 32'b0:registers[rt];   
end

always @(posedge clk)
begin
    if(regWrite)
        registers[rd] <= writeData;
end

endmodule