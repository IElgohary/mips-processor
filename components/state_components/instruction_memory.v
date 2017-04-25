module instruction_memory(clk, readAddress, instruction);
input clk;
input [9:0] readAddress;

output reg [31:0] instruction;

reg [31:0]memory [1023:0] ;

initial begin
	memory[10] = 'h014B4820; //add t1 t2 t3
	memory[105] = 'h2149FFFF; // addi t1 t2 0xffff
end

always @(posedge clk)
begin
	instruction <= memory[readAddress];
end

endmodule